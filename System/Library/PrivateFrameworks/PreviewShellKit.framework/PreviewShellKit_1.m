void *sub_24478ED28()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __int128 v27[2];

  v1 = v0;
  v2 = sub_244793B28();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573817C8);
  v6 = *v0;
  v7 = sub_244795568();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v26 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v21);
    ++v12;
    if (!v22)
    {
      v12 = v21 + 1;
      if (v21 + 1 >= v16)
        goto LABEL_26;
      v22 = *(_QWORD *)(v26 + 8 * v12);
      if (!v22)
        break;
    }
LABEL_25:
    v15 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 40 * v18;
    sub_244705F80(*(_QWORD *)(v6 + 56) + v20, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    result = (void *)sub_244707B68(v27, *(_QWORD *)(v8 + 56) + v20);
  }
  v23 = v21 + 2;
  if (v23 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v26 + 8 * v23);
  if (v22)
  {
    v12 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24478EF68(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

double sub_24478EFB0@<D0>(uint64_t a1@<X8>)
{
  return static PreviewShellPlugin.previewShellSceneBinder.getter(a1);
}

double static PreviewShellPlugin.previewShellSceneBinder.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t dispatch thunk of static PreviewShellPlugin.registerProviders(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static PreviewShellPlugin.registerLaunchers(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static PreviewShellPlugin.previewShellSceneConfigurator.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static PreviewShellPlugin.previewShellSceneBinder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t PreviewAgentConnector.nonUIAgentProxy.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = v1;
  return swift_task_switch();
}

uint64_t sub_24478F014()
{
  uint64_t v0;
  _DWORD *v1;
  _QWORD *v2;

  v1 = *(_DWORD **)(v0 + 40);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)((char *)v1 + *(int *)(type metadata accessor for PreviewAgentConnector() + 24) + 48);
  LODWORD(v1) = *v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = sub_24478F08C;
  return SharedAgentServer<>.requestPreviewNonUIAgent(for:)(*(_QWORD *)(v0 + 32), (int)v1);
}

uint64_t sub_24478F08C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24478F0F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for PreviewAgentConnector()
{
  uint64_t result;

  result = qword_2573818B0;
  if (!qword_2573818B0)
    return swift_getSingletonMetadata();
  return result;
}

id static AgentSceneConfiguration.previewSceneConfiguration(in:specification:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t ObjectType;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;

  v20 = a3;
  v7 = sub_2447943D4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = 0;
  v22 = 0xE000000000000000;
  swift_unknownObjectRetain();
  sub_2447954CC();
  ObjectType = swift_getObjectType();
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(ObjectType, a2);
  v14 = v13;
  swift_bridgeObjectRelease();
  v21 = v12;
  v22 = v14;
  sub_2447950E8();
  sub_2447943C8();
  sub_2447886FC();
  sub_2447955B0();
  sub_2447950E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v15 = v21;
  v16 = v22;
  *a4 = a1;
  a4[1] = a2;
  a4[2] = v15;
  a4[3] = v16;
  v17 = v20;
  a4[4] = v20;
  return v17;
}

uint64_t PreviewAgentConnector.injectScene(configuration:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;
  __int128 v7;

  v3 = *((_QWORD *)a1 + 2);
  *(_QWORD *)(v1 + 64) = sub_244795208();
  v6 = *a1;
  v7 = *(__int128 *)((char *)a1 + 24);
  *(_QWORD *)(v1 + 72) = sub_2447951FC();
  *(_OWORD *)(v1 + 16) = v6;
  *(_QWORD *)(v1 + 32) = v3;
  *(_OWORD *)(v1 + 40) = v7;
  *(_QWORD *)(v1 + 56) = 0;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 80) = v4;
  *v4 = v1;
  v4[1] = sub_24478F338;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v1 + 16, (_QWORD *)(v1 + 56));
}

uint64_t sub_24478F338(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  sub_2447951D8();
  return swift_task_switch();
}

uint64_t sub_24478F3DC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

uint64_t sub_24478F414()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SceneInjector.init(injectScene:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t PreviewAgentConnector.pid.getter()
{
  unsigned int *v0;

  return *v0;
}

__n128 PreviewAgentConnector.init(pid:agentBundle:serverFarm:sceneInjector:)@<Q0>(int a1@<W0>, uint64_t a2@<X1>, __int128 *a3@<X2>, __n128 *a4@<X3>, _DWORD *a5@<X8>)
{
  int *v8;
  char *v9;
  uint64_t v10;
  _OWORD *v11;
  __n128 result;
  __n128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v18 = a3[4];
  v19 = a3[5];
  v20 = a3[6];
  v21 = a3[7];
  v14 = *a3;
  v15 = a3[1];
  v16 = a3[2];
  v17 = a3[3];
  *a5 = a1;
  v8 = (int *)type metadata accessor for PreviewAgentConnector();
  v9 = (char *)a5 + v8[5];
  v10 = sub_244793E64();
  v13 = *a4;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a2, v10);
  v11 = (_OWORD *)((char *)a5 + v8[6]);
  v11[4] = v18;
  v11[5] = v19;
  v11[6] = v20;
  v11[7] = v21;
  *v11 = v14;
  v11[1] = v15;
  v11[2] = v16;
  v11[3] = v17;
  result = v13;
  *(__n128 *)((char *)a5 + v8[7]) = v13;
  return result;
}

uint64_t PreviewAgentConnector.connectNonUIAgent()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = type metadata accessor for PreviewAgentConnector();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257381810);
  v7 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_244739E30(v0, (uint64_t)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v9 = swift_allocObject();
  sub_2447299F8((uint64_t)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (uint64_t (*)(_QWORD))type metadata accessor for PreviewAgentConnector);
  return sub_2447949BC();
}

uint64_t sub_24478F69C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[4] = a1;
  v2[5] = a2;
  type metadata accessor for PreviewNonUIAgentProxy();
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24478F6F4()
{
  uint64_t v0;
  _DWORD *v1;
  _QWORD *v2;

  v1 = *(_DWORD **)(v0 + 40);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)((char *)v1 + *(int *)(type metadata accessor for PreviewAgentConnector() + 24) + 48);
  LODWORD(v1) = *v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_24478F76C;
  return SharedAgentServer<>.requestPreviewNonUIAgent(for:)(*(_QWORD *)(v0 + 48), (int)v1);
}

uint64_t sub_24478F76C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24478F7D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(uint64_t **)(v0 + 32);
  sub_244794710();
  swift_allocObject();
  *v2 = sub_244794704();
  v3 = type metadata accessor for PreviewNonUIAgent();
  sub_2447299F8(v1, (uint64_t)v2 + *(int *)(v3 + 20), (uint64_t (*)(_QWORD))type metadata accessor for PreviewNonUIAgentProxy);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24478F88C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _s15PreviewShellKit0A14AgentConnectorV11agentBundle19PreviewsMessagingOS0D10DescriptorV0G0Vvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PreviewAgentConnector() + 20);
  v4 = sub_244793E64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 24) = v2;
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a1;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(v3 + 72) = *a2;
  *(_QWORD *)(v3 + 80) = sub_244795208();
  *(_QWORD *)(v3 + 88) = sub_2447951FC();
  *(_QWORD *)(v3 + 96) = sub_2447951D8();
  *(_QWORD *)(v3 + 104) = v4;
  return swift_task_switch();
}

uint64_t sub_24478F99C()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;

  v1 = *(_DWORD **)(v0 + 24);
  sub_2447951FC();
  sub_2447951E4();
  swift_release();
  v2 = type metadata accessor for PreviewAgentConnector();
  v3 = *(uint64_t (**)(void))((char *)v1 + *(int *)(v2 + 28));
  *(_DWORD *)(v0 + 176) = *v1;
  *(_QWORD *)(v0 + 112) = v3();
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(int *)(v2 + 24);
  *(_DWORD *)(v0 + 180) = v5;
  *(_QWORD *)(v0 + 120) = *(_QWORD *)(v4 + v5 + 64);
  return swift_task_switch();
}

uint64_t sub_24478FACC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(int, uint64_t, uint64_t);

  v3 = (uint64_t (*)(int, uint64_t, uint64_t))((char *)&dword_25737F488 + dword_25737F488);
  swift_bridgeObjectRetain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_24478FB40;
  return v3(*(_DWORD *)(v0 + 176), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_24478FB40(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 136) = a1;
  *(_QWORD *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_24478FBB8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;

  v1 = *(void **)(v0 + 112);
  v2 = *(void **)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 24) + *(int *)(v0 + 180);
  sub_2447938F4();
  v5 = *(_QWORD *)(v3 + 112);
  v4 = *(_QWORD *)(v3 + 120);
  *(_QWORD *)(v0 + 16) = v2;
  type metadata accessor for PreviewSceneAgentProxy(0);
  swift_allocObject();
  swift_retain();
  v6 = v1;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  v7 = v2;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v8;
  *v8 = v0;
  v8[1] = sub_24478FCAC;
  return sub_244701604(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v5, v4, (uint64_t *)(v0 + 16));
}

uint64_t sub_24478FCAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 160) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 168) = a1;
  return swift_task_switch();
}

uint64_t sub_24478FD20()
{
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_24478FD58()
{
  uint64_t v0;
  void *v1;

  swift_release();
  v1 = *(void **)(v0 + 112);
  sub_244722474(v1);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24478FDAC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 112);
  swift_release();

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 168));
}

uint64_t sub_24478FDF8()
{
  uint64_t v0;
  void *v1;

  swift_release();
  swift_release();
  v1 = *(void **)(v0 + 112);
  sub_244722474(v1);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PreviewAgentConnector.connectSceneAgent(configuration:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v2 = v1;
  v4 = type metadata accessor for PreviewAgentConnector();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[1];
  v17 = *a1;
  v18 = v10;
  v19 = *((_QWORD *)a1 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257381828);
  v11 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  sub_244739E30(v2, (uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  sub_2447299F8((uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, (uint64_t (*)(_QWORD))type metadata accessor for PreviewAgentConnector);
  v14 = v13 + ((v6 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  v15 = v18;
  *(_OWORD *)v14 = v17;
  *(_OWORD *)(v14 + 16) = v15;
  *(_QWORD *)(v14 + 32) = v19;
  sub_244790DC4((uint64_t)&v17);
  return sub_2447949BC();
}

uint64_t sub_244790008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return swift_task_switch();
}

uint64_t sub_244790024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 88) = sub_244795208();
  *(_QWORD *)(v0 + 96) = sub_2447951FC();
  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 32) = v3;
  *(_QWORD *)(v0 + 48) = v2;
  *(_QWORD *)(v0 + 56) = 0;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v4;
  *v4 = v0;
  v4[1] = sub_2447900B4;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v0 + 16, (_QWORD *)(v0 + 56));
}

uint64_t sub_2447900B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 112) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 120) = a1;
  sub_2447951D8();
  return swift_task_switch();
}

uint64_t sub_244790158()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_244790194()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(uint64_t **)(v0 + 64);
  sub_244794710();
  swift_allocObject();
  *v2 = sub_244794704();
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244790228()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PreviewAgentConnector.connectSceneAgent(configuration:settingsPolicy:)(__int128 *a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  id v21;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v3 = v2;
  v6 = type metadata accessor for PreviewAgentConnector();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[1];
  v23 = *a1;
  v24 = v13;
  v25 = *((_QWORD *)a1 + 4);
  v14 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257381828);
  v15 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  sub_244739E30(v3, (uint64_t)v9);
  v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  sub_2447299F8((uint64_t)v9, v18 + v16, (uint64_t (*)(_QWORD))type metadata accessor for PreviewAgentConnector);
  v19 = v18 + v17;
  v20 = v24;
  *(_OWORD *)v19 = v23;
  *(_OWORD *)(v19 + 16) = v20;
  *(_QWORD *)(v19 + 32) = v25;
  *(_QWORD *)(v18 + ((v17 + 47) & 0xFFFFFFFFFFFFFFF8)) = v14;
  sub_244790DC4((uint64_t)&v23);
  v21 = v14;
  return sub_2447949BC();
}

uint64_t sub_24479042C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;

  *(_QWORD *)(v4 + 64) = a1;
  v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 48) = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(v4 + 56) = a4;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 72) = v6;
  *v6 = v4;
  v6[1] = sub_2447904A4;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v4 + 16, (_QWORD *)(v4 + 56));
}

uint64_t sub_2447904A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t sub_244790518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(uint64_t **)(v0 + 64);
  sub_244794710();
  swift_allocObject();
  *v2 = sub_244794704();
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2447905AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PreviewAgentConnector.connectSceneAgent(configuration:settingsPolicy:)(uint64_t a1, __int128 *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v9;
  __int128 v10;

  *(_QWORD *)(v3 + 64) = a1;
  v5 = *((_QWORD *)a2 + 2);
  v6 = *a3;
  *(_QWORD *)(v3 + 72) = sub_244795208();
  v9 = *a2;
  v10 = *(__int128 *)((char *)a2 + 24);
  *(_QWORD *)(v3 + 80) = sub_2447951FC();
  *(_OWORD *)(v3 + 16) = v9;
  *(_QWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 40) = v10;
  *(_QWORD *)(v3 + 56) = v6;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 88) = v7;
  *v7 = v3;
  v7[1] = sub_244790670;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v3 + 16, (_QWORD *)(v3 + 56));
}

uint64_t sub_244790670(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 104) = a1;
  sub_2447951D8();
  return swift_task_switch();
}

uint64_t sub_244790714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(uint64_t **)(v0 + 64);
  swift_release();
  sub_244794710();
  swift_allocObject();
  *v2 = sub_244794704();
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2447907B0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AgentSceneConfiguration.previewShellScene.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t AgentSceneConfiguration.previewShellScene.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AgentSceneConfiguration.previewShellScene.modify())()
{
  return nullsub_1;
}

uint64_t AgentSceneConfiguration.sceneIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AgentSceneConfiguration.sceneIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*AgentSceneConfiguration.sceneIdentifier.modify())()
{
  return nullsub_1;
}

id AgentSceneConfiguration.sceneSpecification.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

void AgentSceneConfiguration.sceneSpecification.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
}

uint64_t (*AgentSceneConfiguration.sceneSpecification.modify())()
{
  return nullsub_1;
}

uint64_t AgentSceneConfiguration.init(previewShellScene:sceneIdentifier:sceneSpecification:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t sub_24479090C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for PreviewAgentConnector();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 20);
  v4 = sub_244793E64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244790A28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PreviewAgentConnector() - 8) + 80);
  v5 = v1 + ((v4 + 16) & ~v4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_244707DE8;
  return sub_24478F69C(a1, v5);
}

id static AgentSceneConfiguration.mainSceneConfiguration(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t ObjectType;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id result;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_2447943D4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = swift_getObjectType();
  v11 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
  swift_unknownObjectRetain();
  v16 = v11(ObjectType, a2);
  v17 = v12;
  sub_2447950E8();
  sub_2447943C8();
  sub_2447886FC();
  sub_2447955B0();
  sub_2447950E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = v16;
  v14 = v17;
  result = objc_msgSend((id)objc_opt_self(), sel_mainSceneSpecification);
  *a3 = a1;
  a3[1] = a2;
  a3[2] = v13;
  a3[3] = v14;
  a3[4] = result;
  return result;
}

uint64_t sub_244790BDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for PreviewAgentConnector();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3 + *(int *)(v1 + 20);
  v6 = sub_244793E64();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_244790D28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(type metadata accessor for PreviewAgentConnector() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1 + v5;
  v7 = v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_244707DE8;
  v8[9] = v6;
  v8[10] = v7;
  v8[8] = a1;
  return swift_task_switch();
}

uint64_t sub_244790DC4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v2;
  return a1;
}

uint64_t sub_244790E04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for PreviewAgentConnector();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3 + *(int *)(v1 + 20);
  v6 = sub_244793E64();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_244790F60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(type metadata accessor for PreviewAgentConnector() - 8);
  v5 = (*(_QWORD *)(v4 + 64)
      + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (__int128 *)(v1 + v5);
  v7 = *(_QWORD *)(v1 + ((v5 + 47) & 0xFFFFFFFFFFFFF8));
  v8 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *(_QWORD *)v8 = v2;
  *(_QWORD *)(v8 + 8) = sub_244706734;
  *(_QWORD *)(v8 + 64) = a1;
  v10 = *v6;
  v9 = v6[1];
  *(_QWORD *)(v8 + 48) = *((_QWORD *)v6 + 4);
  *(_OWORD *)(v8 + 16) = v10;
  *(_OWORD *)(v8 + 32) = v9;
  *(_QWORD *)(v8 + 56) = v7;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 72) = v11;
  *v11 = v8;
  v11[1] = sub_2447904A4;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v8 + 16, (_QWORD *)(v8 + 56));
}

_QWORD *initializeBufferWithCopyOfBuffer for SceneInjector(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SceneInjector()
{
  return swift_release();
}

_QWORD *assignWithCopy for SceneInjector(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SceneInjector(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SceneInjector()
{
  return &type metadata for SceneInjector;
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewAgentConnector(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v25 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_244793E64();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[6];
    v12 = a3[7];
    v13 = (uint64_t *)((char *)v4 + v11);
    v14 = (uint64_t *)((char *)a2 + v11);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = v14[3];
    v13[2] = v14[2];
    v13[3] = v16;
    v17 = v14[5];
    v13[4] = v14[4];
    v13[5] = v17;
    v18 = v14[7];
    v13[6] = v14[6];
    v13[7] = v18;
    v19 = v14[9];
    v13[8] = v14[8];
    v13[9] = v19;
    v20 = v14[11];
    v13[10] = v14[10];
    v13[11] = v20;
    v21 = v14[13];
    v13[12] = v14[12];
    v13[13] = v21;
    v27 = v14[15];
    v13[14] = v14[14];
    v13[15] = v27;
    v22 = (uint64_t *)((char *)v4 + v12);
    v23 = (uint64_t *)((char *)a2 + v12);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for PreviewAgentConnector(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_244793E64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_DWORD *initializeWithCopy for PreviewAgentConnector(_DWORD *a1, _DWORD *a2, int *a3)
{
  uint64_t v5;
  char *v6;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;

  *a1 = *a2;
  v5 = a3[5];
  v6 = (char *)a1 + v5;
  v8 = (char *)a2 + v5;
  v9 = sub_244793E64();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v6, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = a1;
  v27 = a1;
  v13 = (_QWORD *)((char *)a1 + v10);
  v14 = (_QWORD *)((char *)a2 + v10);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = v14[3];
  v13[2] = v14[2];
  v13[3] = v16;
  v17 = v14[5];
  v13[4] = v14[4];
  v13[5] = v17;
  v18 = v14[7];
  v13[6] = v14[6];
  v13[7] = v18;
  v19 = v14[9];
  v13[8] = v14[8];
  v13[9] = v19;
  v24 = v14[11];
  v13[10] = v14[10];
  v13[11] = v24;
  v25 = v14[13];
  v13[12] = v14[12];
  v13[13] = v25;
  v26 = v14[15];
  v13[14] = v14[14];
  v13[15] = v26;
  v20 = (_QWORD *)((char *)v12 + v11);
  v21 = (_QWORD *)((char *)a2 + v11);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v27;
}

_DWORD *assignWithCopy for PreviewAgentConnector(_DWORD *a1, _DWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244793E64();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  v11[1] = v12[1];
  swift_retain();
  swift_release();
  v11[2] = v12[2];
  swift_retain();
  swift_release();
  v11[3] = v12[3];
  swift_retain();
  swift_release();
  v11[4] = v12[4];
  swift_retain();
  swift_release();
  v11[5] = v12[5];
  swift_retain();
  swift_release();
  v11[6] = v12[6];
  swift_retain();
  swift_release();
  v11[7] = v12[7];
  swift_retain();
  swift_release();
  v11[8] = v12[8];
  swift_retain();
  swift_release();
  v11[9] = v12[9];
  swift_retain();
  swift_release();
  v11[10] = v12[10];
  swift_retain();
  swift_release();
  v11[11] = v12[11];
  swift_retain();
  swift_release();
  v11[12] = v12[12];
  swift_retain();
  swift_release();
  v11[13] = v12[13];
  swift_retain();
  swift_release();
  v11[14] = v12[14];
  swift_retain();
  swift_release();
  v11[15] = v12[15];
  swift_retain();
  swift_release();
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  return a1;
}

_DWORD *initializeWithTake for PreviewAgentConnector(_DWORD *a1, _DWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244793E64();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (_OWORD *)((char *)a1 + v10);
  v13 = (_OWORD *)((char *)a2 + v10);
  v14 = v13[3];
  v12[2] = v13[2];
  v12[3] = v14;
  v15 = v13[1];
  *v12 = *v13;
  v12[1] = v15;
  v16 = v13[7];
  v12[6] = v13[6];
  v12[7] = v16;
  v17 = v13[5];
  v12[4] = v13[4];
  v12[5] = v17;
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

_DWORD *assignWithTake for PreviewAgentConnector(_DWORD *a1, _DWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244793E64();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  swift_release();
  v11[1] = v12[1];
  swift_release();
  v11[2] = v12[2];
  swift_release();
  v11[3] = v12[3];
  swift_release();
  v11[4] = v12[4];
  swift_release();
  v11[5] = v12[5];
  swift_release();
  v11[6] = v12[6];
  swift_release();
  v11[7] = v12[7];
  swift_release();
  v11[8] = v12[8];
  swift_release();
  v11[9] = v12[9];
  swift_release();
  v11[10] = v12[10];
  swift_release();
  v11[11] = v12[11];
  swift_release();
  v11[12] = v12[12];
  swift_release();
  v11[13] = v12[13];
  swift_release();
  v11[14] = v12[14];
  swift_release();
  v11[15] = v12[15];
  swift_release();
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewAgentConnector()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244791940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_244793E64();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewAgentConnector()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2447919CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_244793E64();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_244791A48()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244793E64();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneSettingsPolicy()
{
  return &type metadata for SceneSettingsPolicy;
}

void destroy for AgentSceneConfiguration(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for AgentSceneConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for AgentSceneConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v4;
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = (void *)a2[4];
  v6 = (void *)a1[4];
  a1[4] = v5;
  v7 = v5;

  return a1;
}

uint64_t assignWithTake for AgentSceneConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_unknownObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

ValueMetadata *type metadata accessor for AgentSceneConfiguration()
{
  return &type metadata for AgentSceneConfiguration;
}

uint64_t PreviewNonUIAgent.invalidationHandle.getter()
{
  return swift_retain();
}

uint64_t PreviewNonUIAgent.pid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for PreviewNonUIAgent() + 20) + 8);
}

uint64_t type metadata accessor for PreviewNonUIAgent()
{
  uint64_t result;

  result = qword_257381988;
  if (!qword_257381988)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t PreviewNonUIAgent.onDisconnect(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v5 = type metadata accessor for PreviewNonUIAgentProxy();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v2 + *(int *)(type metadata accessor for PreviewNonUIAgent() + 20);
  v12 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  sub_24470D480(v11, (uint64_t)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for PreviewNonUIAgentProxy);
  v13 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  sub_2447299F8((uint64_t)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, (uint64_t (*)(_QWORD))type metadata accessor for PreviewNonUIAgentProxy);
  v15 = (_QWORD *)(v14 + ((v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v15 = a1;
  v15[1] = a2;
  swift_retain();
  sub_244704384((uint64_t)v10, (uint64_t)&unk_25737FBB8, v14);
  return swift_release();
}

uint64_t sub_244791E18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for PreviewNonUIAgentProxy();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_unknownObjectRelease();
  swift_release();
  v4 = v0 + v3 + *(int *)(v1 + 24);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244791EF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for PreviewNonUIAgentProxy() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_244707DE8;
  return sub_24474BF78(a1, v6, v7, v8, v10, v11);
}

uint64_t PreviewNonUIAgent.perform<A>(update:expecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = a4;
  v23 = a1;
  v6 = sub_2447942F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = type metadata accessor for PreviewNonUIAgent();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_2447949E0();
  v16 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_24470D480(v4, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for PreviewNonUIAgent);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v6);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = (v11 + *(unsigned __int8 *)(v7 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v19 = swift_allocObject();
  v20 = v25;
  *(_QWORD *)(v19 + 16) = a3;
  *(_QWORD *)(v19 + 24) = v20;
  sub_2447299F8((uint64_t)v12, v19 + v17, (uint64_t (*)(_QWORD))type metadata accessor for PreviewNonUIAgent);
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v19 + v18, (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  return sub_2447949BC();
}

uint64_t sub_2447921A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2447921C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[5];
  v2 = v0[6];
  v3 = v0[4];
  type metadata accessor for PreviewNonUIAgent();
  v4 = nullsub_1(v1, v2);
  v0[7] = PreviewNonUIAgentProxy.perform<A>(update:expecting:)(v3, v4, v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[8] = v5;
  *v5 = v0;
  v5[1] = sub_24474C314;
  return sub_2447949B0();
}

uint64_t sub_244792260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for PreviewNonUIAgent();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_2447942F0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  v8 = v0 + v3 + *(int *)(v1 + 20);
  swift_release();
  v9 = v8 + *(int *)(type metadata accessor for PreviewNonUIAgentProxy() + 24);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_244792378(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v4 = *(_QWORD *)(type metadata accessor for PreviewNonUIAgent() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(sub_2447942F0() - 8) + 80);
  v8 = v1 + ((v5 + v6 + v7) & ~v7);
  v9 = swift_task_alloc();
  v10 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v9;
  *(_QWORD *)v9 = v2;
  *(_QWORD *)(v9 + 8) = sub_244706734;
  *(_OWORD *)(v9 + 40) = v10;
  *(_QWORD *)(v9 + 24) = v1 + v5;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 16) = a1;
  return swift_task_switch();
}

uint64_t PreviewNonUIAgent.addMessageStream(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v3 = sub_244793F18();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v1 + *(int *)(type metadata accessor for PreviewNonUIAgent() + 20);
  v10 = (uint64_t *)(v9 + *(int *)(type metadata accessor for PreviewNonUIAgentProxy() + 28));
  v11 = *v10;
  v12 = v10[1];
  v13 = *(_DWORD *)(v9 + 8);
  v18[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D100);
  v14 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  v15 = (*(unsigned __int8 *)(v4 + 80) + 36) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v11;
  *(_QWORD *)(v16 + 24) = v12;
  *(_DWORD *)(v16 + 32) = v13;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v16 + v15, (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  swift_retain();
  swift_retain();
  return sub_2447949BC();
}

uint64_t sub_2447925F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_244793F18();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 36) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t PreviewNonUIAgent.sendEndpoint(_:context:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v5 = sub_244793E40();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244794374();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BE78508];
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PreviewNonUIAgent();
  type metadata accessor for PreviewNonUIAgentProxy();
  v13 = &v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25737D118) + 48)];
  v14 = sub_244793F18();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, a3, v14);
  v15 = sub_244794494();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, a2, v15);
  sub_244793E34();
  __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
  sub_24470665C(&qword_25737FBD0, v10, MEMORY[0x24BE78500]);
  sub_2447939B4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_244707D44((uint64_t)v12, v10);
}

uint64_t PreviewSceneAgent.invalidationHandle.getter()
{
  return swift_retain();
}

id PreviewSceneAgent.scene.getter()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)(v0 + 8) + 24);
}

uint64_t PreviewSceneAgent.onDisconnect(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_244795208();
  sub_2447951FC();
  sub_2447951E4();
  swift_release();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_244792F38;
  *(_QWORD *)(v5 + 24) = v4;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737D080);
  sub_244794464();
  return swift_release();
}

uint64_t PreviewSceneAgent.perform<A>(update:with:delegate:expecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = PreviewSceneAgentProxy.perform<A>(update:with:delegate:expecting:)(a1, a2, a3, a5, a5, a6);
  sub_2447949E0();
  v15 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a5;
  v16[3] = a6;
  v16[4] = v14;
  return sub_2447949BC();
}

uint64_t sub_244792A5C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_25737D180);
  *v1 = v0;
  v1[1] = sub_244707DE8;
  return sub_2447952C8();
}

uint64_t PreviewSceneAgent.generateStaticOutput<A>(for:expecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = PreviewSceneAgentProxy.generateStaticOutput<A>(for:expecting:)(a1, a3, a3);
  sub_2447949E0();
  v11 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v10;
  return sub_2447949BC();
}

uint64_t PreviewSceneAgent.addMessageStream(for:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  PreviewSceneAgentProxy.addMessageStream(for:)(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737D100);
  v5 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  return sub_2447949BC();
}

uint64_t sub_244792D04()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_244793D14();
  __swift_instantiateConcreteTypeFromMangledName(qword_25737D180);
  *v1 = v0;
  v1[1] = sub_244706734;
  return sub_2447952C8();
}

uint64_t PreviewSceneAgent.sendEndpoint(_:context:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v5 = sub_244793E40();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244794398();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BE78550];
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25737D118) + 48)];
  v14 = sub_244793F18();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, a3, v14);
  v15 = sub_244794494();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, a2, v15);
  sub_244793E34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0A8);
  sub_24470665C(&qword_25737D120, v10, MEMORY[0x24BE78548]);
  sub_2447939B4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_244707D44((uint64_t)v12, v10);
}

uint64_t sub_244792F14()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244792F38()
{
  uint64_t v0;

  return sub_2447031BC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_244792F40()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244792F64()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_244707DE8;
  return sub_244792A5C();
}

uint64_t sub_244792FD0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_244707DE8;
  return sub_244792A5C();
}

uint64_t sub_24479303C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_244707DE8;
  return sub_244792D04();
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewNonUIAgent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    *(_QWORD *)v7 = *(uint64_t *)((char *)a2 + v6);
    *((_DWORD *)v7 + 2) = *(_DWORD *)((char *)a2 + v6 + 8);
    v9 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
    v10 = v9[6];
    v11 = &v7[v10];
    v12 = &v8[v10];
    swift_retain();
    swift_retain();
    v13 = __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = v9[7];
    v15 = &v7[v14];
    v16 = &v8[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v5;
}

uint64_t destroy for PreviewNonUIAgent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  v5 = v4 + *(int *)(type metadata accessor for PreviewNonUIAgentProxy() + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for PreviewNonUIAgent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *(_QWORD *)v5 = *(_QWORD *)((char *)a2 + v4);
  *((_DWORD *)v5 + 2) = *(_DWORD *)((char *)a2 + v4 + 8);
  v7 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
  v8 = v7[6];
  v9 = &v5[v8];
  v10 = &v6[v8];
  swift_retain();
  swift_retain();
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = v7[7];
  v13 = &v5[v12];
  v14 = &v6[v12];
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = v15;
  *(_QWORD *)&v5[v7[8]] = *(_QWORD *)&v6[v7[8]];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PreviewNonUIAgent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((_DWORD *)v7 + 2) = *((_DWORD *)v8 + 2);
  v9 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = v9[7];
  v15 = &v7[v14];
  v16 = &v8[v14];
  *(_QWORD *)&v7[v14] = *(_QWORD *)&v8[v14];
  swift_retain();
  swift_release();
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_retain();
  swift_release();
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *initializeWithTake for PreviewNonUIAgent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *(_QWORD *)v5 = *(_QWORD *)((char *)a2 + v4);
  *((_DWORD *)v5 + 2) = *(_DWORD *)((char *)a2 + v4 + 8);
  v7 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
  v8 = v7[6];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *(_OWORD *)&v5[v7[7]] = *(_OWORD *)&v6[v7[7]];
  *(_QWORD *)&v5[v7[8]] = *(_QWORD *)&v6[v7[8]];
  return a1;
}

_QWORD *assignWithTake for PreviewNonUIAgent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  swift_release();
  *((_DWORD *)v7 + 2) = *((_DWORD *)v8 + 2);
  v9 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_25737DA58);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = v9[7];
  v15 = &v7[v14];
  v16 = &v8[v14];
  *(_QWORD *)&v7[v14] = *(_QWORD *)&v8[v14];
  swift_release();
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_release();
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewNonUIAgent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2447935B0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for PreviewNonUIAgentProxy();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for PreviewNonUIAgent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_244793638(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for PreviewNonUIAgentProxy();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_2447936AC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for PreviewNonUIAgentProxy();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewSceneAgent()
{
  return &type metadata for PreviewSceneAgent;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_24479375C()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_244793768()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_244793774()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_244793780()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_24479378C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_244793798()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2447937A4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2447937B0()
{
  return MEMORY[0x24BE77FC0]();
}

uint64_t sub_2447937BC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2447937C8()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_2447937D4()
{
  return MEMORY[0x24BDCD9A8]();
}

uint64_t sub_2447937E0()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_2447937EC()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2447937F8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_244793804()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_244793810()
{
  return MEMORY[0x24BDCDBE8]();
}

uint64_t sub_24479381C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_244793828()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_244793834()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_244793840()
{
  return MEMORY[0x24BE78638]();
}

uint64_t sub_24479384C()
{
  return MEMORY[0x24BE78020]();
}

uint64_t sub_244793858()
{
  return MEMORY[0x24BE78028]();
}

uint64_t sub_244793864()
{
  return MEMORY[0x24BE78030]();
}

uint64_t sub_244793870()
{
  return MEMORY[0x24BE78040]();
}

uint64_t sub_24479387C()
{
  return MEMORY[0x24BE78048]();
}

uint64_t sub_244793888()
{
  return MEMORY[0x24BE78060]();
}

uint64_t sub_244793894()
{
  return MEMORY[0x24BE78068]();
}

uint64_t sub_2447938A0()
{
  return MEMORY[0x24BE78080]();
}

uint64_t sub_2447938AC()
{
  return MEMORY[0x24BE78090]();
}

uint64_t sub_2447938B8()
{
  return MEMORY[0x24BE780B0]();
}

uint64_t sub_2447938C4()
{
  return MEMORY[0x24BE780C0]();
}

uint64_t sub_2447938D0()
{
  return MEMORY[0x24BE780C8]();
}

uint64_t sub_2447938DC()
{
  return MEMORY[0x24BE780D8]();
}

uint64_t sub_2447938E8()
{
  return MEMORY[0x24BE780E8]();
}

uint64_t sub_2447938F4()
{
  return MEMORY[0x24BE780F0]();
}

uint64_t sub_244793900()
{
  return MEMORY[0x24BE78100]();
}

uint64_t sub_24479390C()
{
  return MEMORY[0x24BE78108]();
}

uint64_t sub_244793918()
{
  return MEMORY[0x24BE78110]();
}

uint64_t sub_244793924()
{
  return MEMORY[0x24BE78170]();
}

uint64_t sub_244793930()
{
  return MEMORY[0x24BE78178]();
}

uint64_t sub_24479393C()
{
  return MEMORY[0x24BE78180]();
}

uint64_t sub_244793948()
{
  return MEMORY[0x24BE781A0]();
}

uint64_t sub_244793954()
{
  return MEMORY[0x24BE781B0]();
}

uint64_t sub_244793960()
{
  return MEMORY[0x24BE781B8]();
}

uint64_t sub_24479396C()
{
  return MEMORY[0x24BE781C0]();
}

uint64_t sub_244793978()
{
  return MEMORY[0x24BE781C8]();
}

uint64_t sub_244793984()
{
  return MEMORY[0x24BE781D8]();
}

uint64_t sub_244793990()
{
  return MEMORY[0x24BE78208]();
}

uint64_t sub_24479399C()
{
  return MEMORY[0x24BE78240]();
}

uint64_t sub_2447939A8()
{
  return MEMORY[0x24BE78248]();
}

uint64_t sub_2447939B4()
{
  return MEMORY[0x24BE78250]();
}

uint64_t sub_2447939C0()
{
  return MEMORY[0x24BE78258]();
}

uint64_t sub_2447939CC()
{
  return MEMORY[0x24BE78260]();
}

uint64_t sub_2447939D8()
{
  return MEMORY[0x24BE78278]();
}

uint64_t sub_2447939E4()
{
  return MEMORY[0x24BE78280]();
}

uint64_t sub_2447939F0()
{
  return MEMORY[0x24BE78290]();
}

uint64_t sub_2447939FC()
{
  return MEMORY[0x24BE78298]();
}

uint64_t sub_244793A08()
{
  return MEMORY[0x24BE782A0]();
}

uint64_t sub_244793A14()
{
  return MEMORY[0x24BE782A8]();
}

uint64_t sub_244793A20()
{
  return MEMORY[0x24BE782B8]();
}

uint64_t sub_244793A2C()
{
  return MEMORY[0x24BE782D0]();
}

uint64_t sub_244793A38()
{
  return MEMORY[0x24BE782D8]();
}

uint64_t sub_244793A44()
{
  return MEMORY[0x24BE78740]();
}

uint64_t sub_244793A50()
{
  return MEMORY[0x24BE78748]();
}

uint64_t sub_244793A5C()
{
  return MEMORY[0x24BE78750]();
}

uint64_t sub_244793A68()
{
  return MEMORY[0x24BE78778]();
}

uint64_t sub_244793A74()
{
  return MEMORY[0x24BE78818]();
}

uint64_t sub_244793A80()
{
  return MEMORY[0x24BE78830]();
}

uint64_t sub_244793A8C()
{
  return MEMORY[0x24BE78860]();
}

uint64_t sub_244793A98()
{
  return MEMORY[0x24BE7D008]();
}

uint64_t sub_244793AA4()
{
  return MEMORY[0x24BE76F40]();
}

uint64_t sub_244793AB0()
{
  return MEMORY[0x24BE76F68]();
}

uint64_t sub_244793ABC()
{
  return MEMORY[0x24BE76F78]();
}

uint64_t sub_244793AC8()
{
  return MEMORY[0x24BE76F80]();
}

uint64_t sub_244793AD4()
{
  return MEMORY[0x24BE76F88]();
}

uint64_t sub_244793AE0()
{
  return MEMORY[0x24BE76FB8]();
}

uint64_t sub_244793AEC()
{
  return MEMORY[0x24BE76FC8]();
}

uint64_t sub_244793AF8()
{
  return MEMORY[0x24BE76FD0]();
}

uint64_t sub_244793B04()
{
  return MEMORY[0x24BE76FE0]();
}

uint64_t sub_244793B10()
{
  return MEMORY[0x24BE77008]();
}

uint64_t sub_244793B1C()
{
  return MEMORY[0x24BE77030]();
}

uint64_t sub_244793B28()
{
  return MEMORY[0x24BE77038]();
}

uint64_t sub_244793B34()
{
  return MEMORY[0x24BE77060]();
}

uint64_t sub_244793B40()
{
  return MEMORY[0x24BE77068]();
}

uint64_t sub_244793B4C()
{
  return MEMORY[0x24BE770A0]();
}

uint64_t sub_244793B58()
{
  return MEMORY[0x24BE770A8]();
}

uint64_t sub_244793B64()
{
  return MEMORY[0x24BE770B0]();
}

uint64_t sub_244793B70()
{
  return MEMORY[0x24BE770B8]();
}

uint64_t sub_244793B7C()
{
  return MEMORY[0x24BE770C8]();
}

uint64_t sub_244793B88()
{
  return MEMORY[0x24BE770D8]();
}

uint64_t sub_244793B94()
{
  return MEMORY[0x24BE770E0]();
}

uint64_t sub_244793BA0()
{
  return MEMORY[0x24BE770E8]();
}

uint64_t sub_244793BAC()
{
  return MEMORY[0x24BE770F0]();
}

uint64_t sub_244793BB8()
{
  return MEMORY[0x24BE770F8]();
}

uint64_t sub_244793BC4()
{
  return MEMORY[0x24BE77100]();
}

uint64_t sub_244793BD0()
{
  return MEMORY[0x24BE77108]();
}

uint64_t sub_244793BDC()
{
  return MEMORY[0x24BE77110]();
}

uint64_t sub_244793BE8()
{
  return MEMORY[0x24BE77118]();
}

uint64_t sub_244793BF4()
{
  return MEMORY[0x24BE77120]();
}

uint64_t sub_244793C00()
{
  return MEMORY[0x24BE77128]();
}

uint64_t sub_244793C0C()
{
  return MEMORY[0x24BE77130]();
}

uint64_t sub_244793C18()
{
  return MEMORY[0x24BE77150]();
}

uint64_t sub_244793C24()
{
  return MEMORY[0x24BE77178]();
}

uint64_t sub_244793C30()
{
  return MEMORY[0x24BE77180]();
}

uint64_t sub_244793C3C()
{
  return MEMORY[0x24BE77188]();
}

uint64_t sub_244793C48()
{
  return MEMORY[0x24BE77190]();
}

uint64_t sub_244793C54()
{
  return MEMORY[0x24BE77198]();
}

uint64_t sub_244793C60()
{
  return MEMORY[0x24BE771A0]();
}

uint64_t sub_244793C6C()
{
  return MEMORY[0x24BE771A8]();
}

uint64_t sub_244793C78()
{
  return MEMORY[0x24BE771B0]();
}

uint64_t sub_244793C84()
{
  return MEMORY[0x24BE771B8]();
}

uint64_t sub_244793C90()
{
  return MEMORY[0x24BE771C0]();
}

uint64_t sub_244793C9C()
{
  return MEMORY[0x24BE771C8]();
}

uint64_t sub_244793CA8()
{
  return MEMORY[0x24BE771E0]();
}

uint64_t sub_244793CB4()
{
  return MEMORY[0x24BE771E8]();
}

uint64_t sub_244793CC0()
{
  return MEMORY[0x24BE771F0]();
}

uint64_t sub_244793CCC()
{
  return MEMORY[0x24BE771F8]();
}

uint64_t sub_244793CD8()
{
  return MEMORY[0x24BE77200]();
}

uint64_t sub_244793CE4()
{
  return MEMORY[0x24BE77218]();
}

uint64_t sub_244793CF0()
{
  return MEMORY[0x24BE77220]();
}

uint64_t sub_244793CFC()
{
  return MEMORY[0x24BE77228]();
}

uint64_t sub_244793D08()
{
  return MEMORY[0x24BE77230]();
}

uint64_t sub_244793D14()
{
  return MEMORY[0x24BE77240]();
}

uint64_t sub_244793D20()
{
  return MEMORY[0x24BE77250]();
}

uint64_t sub_244793D2C()
{
  return MEMORY[0x24BE77258]();
}

uint64_t sub_244793D38()
{
  return MEMORY[0x24BE77260]();
}

uint64_t sub_244793D44()
{
  return MEMORY[0x24BE77268]();
}

uint64_t sub_244793D50()
{
  return MEMORY[0x24BE77298]();
}

uint64_t sub_244793D5C()
{
  return MEMORY[0x24BE772F0]();
}

uint64_t sub_244793D68()
{
  return MEMORY[0x24BE772F8]();
}

uint64_t sub_244793D74()
{
  return MEMORY[0x24BE77368]();
}

uint64_t sub_244793D80()
{
  return MEMORY[0x24BE77370]();
}

uint64_t sub_244793D8C()
{
  return MEMORY[0x24BE77378]();
}

uint64_t sub_244793D98()
{
  return MEMORY[0x24BE77388]();
}

uint64_t sub_244793DA4()
{
  return MEMORY[0x24BE77398]();
}

uint64_t sub_244793DB0()
{
  return MEMORY[0x24BE773C0]();
}

uint64_t sub_244793DBC()
{
  return MEMORY[0x24BE773F0]();
}

uint64_t sub_244793DC8()
{
  return MEMORY[0x24BE773F8]();
}

uint64_t sub_244793DD4()
{
  return MEMORY[0x24BE77400]();
}

uint64_t sub_244793DE0()
{
  return MEMORY[0x24BE77418]();
}

uint64_t sub_244793DEC()
{
  return MEMORY[0x24BE77450]();
}

uint64_t sub_244793DF8()
{
  return MEMORY[0x24BE77458]();
}

uint64_t sub_244793E04()
{
  return MEMORY[0x24BE77460]();
}

uint64_t sub_244793E10()
{
  return MEMORY[0x24BE774A8]();
}

uint64_t sub_244793E1C()
{
  return MEMORY[0x24BE774B8]();
}

uint64_t sub_244793E28()
{
  return MEMORY[0x24BE774C0]();
}

uint64_t sub_244793E34()
{
  return MEMORY[0x24BE774D8]();
}

uint64_t sub_244793E40()
{
  return MEMORY[0x24BE774E0]();
}

uint64_t sub_244793E4C()
{
  return MEMORY[0x24BE774F0]();
}

uint64_t sub_244793E58()
{
  return MEMORY[0x24BE77500]();
}

uint64_t sub_244793E64()
{
  return MEMORY[0x24BE77508]();
}

uint64_t sub_244793E70()
{
  return MEMORY[0x24BE77528]();
}

uint64_t sub_244793E7C()
{
  return MEMORY[0x24BE77530]();
}

uint64_t sub_244793E88()
{
  return MEMORY[0x24BE77570]();
}

uint64_t sub_244793E94()
{
  return MEMORY[0x24BE775A0]();
}

uint64_t sub_244793EA0()
{
  return MEMORY[0x24BE77608]();
}

uint64_t sub_244793EAC()
{
  return MEMORY[0x24BE77628]();
}

uint64_t sub_244793EB8()
{
  return MEMORY[0x24BE77630]();
}

uint64_t sub_244793EC4()
{
  return MEMORY[0x24BE77638]();
}

uint64_t sub_244793ED0()
{
  return MEMORY[0x24BE77768]();
}

uint64_t sub_244793EDC()
{
  return MEMORY[0x24BE77770]();
}

uint64_t sub_244793EE8()
{
  return MEMORY[0x24BE77778]();
}

uint64_t sub_244793EF4()
{
  return MEMORY[0x24BE77788]();
}

uint64_t sub_244793F00()
{
  return MEMORY[0x24BE777D8]();
}

uint64_t sub_244793F0C()
{
  return MEMORY[0x24BE777E0]();
}

uint64_t sub_244793F18()
{
  return MEMORY[0x24BE777F0]();
}

uint64_t sub_244793F24()
{
  return MEMORY[0x24BE77820]();
}

uint64_t sub_244793F30()
{
  return MEMORY[0x24BE77828]();
}

uint64_t sub_244793F3C()
{
  return MEMORY[0x24BE77860]();
}

uint64_t sub_244793F48()
{
  return MEMORY[0x24BE77868]();
}

uint64_t sub_244793F54()
{
  return MEMORY[0x24BE77888]();
}

uint64_t sub_244793F60()
{
  return MEMORY[0x24BE77898]();
}

uint64_t sub_244793F6C()
{
  return MEMORY[0x24BE778A8]();
}

uint64_t sub_244793F78()
{
  return MEMORY[0x24BE778B0]();
}

uint64_t sub_244793F84()
{
  return MEMORY[0x24BE778B8]();
}

uint64_t sub_244793F90()
{
  return MEMORY[0x24BE778C0]();
}

uint64_t sub_244793F9C()
{
  return MEMORY[0x24BE77978]();
}

uint64_t sub_244793FA8()
{
  return MEMORY[0x24BE77988]();
}

uint64_t sub_244793FB4()
{
  return MEMORY[0x24BE77990]();
}

uint64_t sub_244793FC0()
{
  return MEMORY[0x24BE77998]();
}

uint64_t sub_244793FCC()
{
  return MEMORY[0x24BE779A0]();
}

uint64_t sub_244793FD8()
{
  return MEMORY[0x24BE779A8]();
}

uint64_t sub_244793FE4()
{
  return MEMORY[0x24BE77A18]();
}

uint64_t sub_244793FF0()
{
  return MEMORY[0x24BE77A20]();
}

uint64_t sub_244793FFC()
{
  return MEMORY[0x24BE77A40]();
}

uint64_t sub_244794008()
{
  return MEMORY[0x24BE77AA8]();
}

uint64_t sub_244794014()
{
  return MEMORY[0x24BE77AB0]();
}

uint64_t sub_244794020()
{
  return MEMORY[0x24BE77AB8]();
}

uint64_t sub_24479402C()
{
  return MEMORY[0x24BE77AC0]();
}

uint64_t sub_244794038()
{
  return MEMORY[0x24BE77AC8]();
}

uint64_t sub_244794044()
{
  return MEMORY[0x24BE77AD0]();
}

uint64_t sub_244794050()
{
  return MEMORY[0x24BE77AD8]();
}

uint64_t sub_24479405C()
{
  return MEMORY[0x24BE77AE0]();
}

uint64_t sub_244794068()
{
  return MEMORY[0x24BE77AE8]();
}

uint64_t sub_244794074()
{
  return MEMORY[0x24BE77B08]();
}

uint64_t sub_244794080()
{
  return MEMORY[0x24BE77B18]();
}

uint64_t sub_24479408C()
{
  return MEMORY[0x24BE77B28]();
}

uint64_t sub_244794098()
{
  return MEMORY[0x24BE77B30]();
}

uint64_t sub_2447940A4()
{
  return MEMORY[0x24BE77B38]();
}

uint64_t sub_2447940B0()
{
  return MEMORY[0x24BE77B40]();
}

uint64_t sub_2447940BC()
{
  return MEMORY[0x24BE77B88]();
}

uint64_t sub_2447940C8()
{
  return MEMORY[0x24BE77B90]();
}

uint64_t sub_2447940D4()
{
  return MEMORY[0x24BE77BA0]();
}

uint64_t sub_2447940E0()
{
  return MEMORY[0x24BE77BA8]();
}

uint64_t sub_2447940EC()
{
  return MEMORY[0x24BE77BB0]();
}

uint64_t sub_2447940F8()
{
  return MEMORY[0x24BE77BB8]();
}

uint64_t sub_244794104()
{
  return MEMORY[0x24BE77BC8]();
}

uint64_t sub_244794110()
{
  return MEMORY[0x24BE77BD0]();
}

uint64_t sub_24479411C()
{
  return MEMORY[0x24BE77BD8]();
}

uint64_t sub_244794128()
{
  return MEMORY[0x24BE77BE0]();
}

uint64_t sub_244794134()
{
  return MEMORY[0x24BE77BE8]();
}

uint64_t sub_244794140()
{
  return MEMORY[0x24BE77BF0]();
}

uint64_t sub_24479414C()
{
  return MEMORY[0x24BE77BF8]();
}

uint64_t sub_244794158()
{
  return MEMORY[0x24BE77C08]();
}

uint64_t sub_244794164()
{
  return MEMORY[0x24BE77C10]();
}

uint64_t sub_244794170()
{
  return MEMORY[0x24BE77C58]();
}

uint64_t sub_24479417C()
{
  return MEMORY[0x24BE77C60]();
}

uint64_t sub_244794188()
{
  return MEMORY[0x24BE77C78]();
}

uint64_t sub_244794194()
{
  return MEMORY[0x24BE77CC0]();
}

uint64_t sub_2447941A0()
{
  return MEMORY[0x24BE77CE0]();
}

uint64_t sub_2447941AC()
{
  return MEMORY[0x24BE77CF0]();
}

uint64_t sub_2447941B8()
{
  return MEMORY[0x24BE77CF8]();
}

uint64_t sub_2447941C4()
{
  return MEMORY[0x24BE77DB0]();
}

uint64_t sub_2447941D0()
{
  return MEMORY[0x24BE77DB8]();
}

uint64_t sub_2447941DC()
{
  return MEMORY[0x24BE77DC0]();
}

uint64_t sub_2447941E8()
{
  return MEMORY[0x24BE77DE0]();
}

uint64_t sub_2447941F4()
{
  return MEMORY[0x24BE77DE8]();
}

uint64_t sub_244794200()
{
  return MEMORY[0x24BE77DF8]();
}

uint64_t sub_24479420C()
{
  return MEMORY[0x24BE77E00]();
}

uint64_t sub_244794218()
{
  return MEMORY[0x24BE77E08]();
}

uint64_t sub_244794224()
{
  return MEMORY[0x24BE77E18]();
}

uint64_t sub_244794230()
{
  return MEMORY[0x24BE77E20]();
}

uint64_t sub_24479423C()
{
  return MEMORY[0x24BE77E28]();
}

uint64_t sub_244794248()
{
  return MEMORY[0x24BE77E30]();
}

uint64_t sub_244794254()
{
  return MEMORY[0x24BE77E38]();
}

uint64_t sub_244794260()
{
  return MEMORY[0x24BE77E40]();
}

uint64_t sub_24479426C()
{
  return MEMORY[0x24BE77E98]();
}

uint64_t sub_244794278()
{
  return MEMORY[0x24BE77EA0]();
}

uint64_t sub_244794284()
{
  return MEMORY[0x24BE77EA8]();
}

uint64_t sub_244794290()
{
  return MEMORY[0x24BE77EC0]();
}

uint64_t sub_24479429C()
{
  return MEMORY[0x24BE77F48]();
}

uint64_t sub_2447942A8()
{
  return MEMORY[0x24BE77F60]();
}

uint64_t sub_2447942B4()
{
  return MEMORY[0x24BE782F8]();
}

uint64_t sub_2447942C0()
{
  return MEMORY[0x24BE78300]();
}

uint64_t sub_2447942CC()
{
  return MEMORY[0x24BE78318]();
}

uint64_t sub_2447942D8()
{
  return MEMORY[0x24BE78328]();
}

uint64_t sub_2447942E4()
{
  return MEMORY[0x24BE78330]();
}

uint64_t sub_2447942F0()
{
  return MEMORY[0x24BE78348]();
}

uint64_t sub_2447942FC()
{
  return MEMORY[0x24BE783B0]();
}

uint64_t sub_244794308()
{
  return MEMORY[0x24BE783F0]();
}

uint64_t sub_244794314()
{
  return MEMORY[0x24BE78420]();
}

uint64_t sub_244794320()
{
  return MEMORY[0x24BE78430]();
}

uint64_t sub_24479432C()
{
  return MEMORY[0x24BE78440]();
}

uint64_t sub_244794338()
{
  return MEMORY[0x24BE78448]();
}

uint64_t sub_244794344()
{
  return MEMORY[0x24BE784B0]();
}

uint64_t sub_244794350()
{
  return MEMORY[0x24BE784B8]();
}

uint64_t sub_24479435C()
{
  return MEMORY[0x24BE784C0]();
}

uint64_t sub_244794368()
{
  return MEMORY[0x24BE784F0]();
}

uint64_t sub_244794374()
{
  return MEMORY[0x24BE78508]();
}

uint64_t sub_244794380()
{
  return MEMORY[0x24BE78518]();
}

uint64_t sub_24479438C()
{
  return MEMORY[0x24BE78538]();
}

uint64_t sub_244794398()
{
  return MEMORY[0x24BE78550]();
}

uint64_t sub_2447943A4()
{
  return MEMORY[0x24BE78560]();
}

uint64_t sub_2447943B0()
{
  return MEMORY[0x24BE78580]();
}

uint64_t sub_2447943BC()
{
  return MEMORY[0x24BE78588]();
}

uint64_t sub_2447943C8()
{
  return MEMORY[0x24BE761F0]();
}

uint64_t sub_2447943D4()
{
  return MEMORY[0x24BE761F8]();
}

uint64_t sub_2447943E0()
{
  return MEMORY[0x24BE76288]();
}

uint64_t sub_2447943EC()
{
  return MEMORY[0x24BE76340]();
}

uint64_t sub_2447943F8()
{
  return MEMORY[0x24BE76350]();
}

uint64_t sub_244794404()
{
  return MEMORY[0x24BE76370]();
}

uint64_t sub_244794410()
{
  return MEMORY[0x24BE76378]();
}

uint64_t sub_24479441C()
{
  return MEMORY[0x24BE76380]();
}

uint64_t sub_244794428()
{
  return MEMORY[0x24BE76388]();
}

uint64_t sub_244794434()
{
  return MEMORY[0x24BE76398]();
}

uint64_t sub_244794440()
{
  return MEMORY[0x24BE763B0]();
}

uint64_t sub_24479444C()
{
  return MEMORY[0x24BE763B8]();
}

uint64_t sub_244794458()
{
  return MEMORY[0x24BE76478]();
}

uint64_t sub_244794464()
{
  return MEMORY[0x24BE76498]();
}

uint64_t sub_244794470()
{
  return MEMORY[0x24BE764B0]();
}

uint64_t sub_24479447C()
{
  return MEMORY[0x24BE764C8]();
}

uint64_t _s15PreviewShellKit21CanvasContentProviderPAAyt12HostedOutputRtzrlE6encode06hostedH020PreviewsFoundationOS12PropertyListVyt_tFZ_0()
{
  return MEMORY[0x24BE764F8]();
}

uint64_t sub_244794494()
{
  return MEMORY[0x24BE76530]();
}

uint64_t sub_2447944A0()
{
  return MEMORY[0x24BE76548]();
}

uint64_t sub_2447944AC()
{
  return MEMORY[0x24BE76550]();
}

uint64_t sub_2447944B8()
{
  return MEMORY[0x24BE76560]();
}

uint64_t sub_2447944C4()
{
  return MEMORY[0x24BE76568]();
}

uint64_t sub_2447944D0()
{
  return MEMORY[0x24BE76570]();
}

uint64_t sub_2447944DC()
{
  return MEMORY[0x24BE76578]();
}

uint64_t sub_2447944E8()
{
  return MEMORY[0x24BE76588]();
}

uint64_t sub_2447944F4()
{
  return MEMORY[0x24BE76590]();
}

uint64_t sub_244794500()
{
  return MEMORY[0x24BE76598]();
}

uint64_t sub_24479450C()
{
  return MEMORY[0x24BE765A0]();
}

uint64_t sub_244794518()
{
  return MEMORY[0x24BE765B0]();
}

uint64_t sub_244794524()
{
  return MEMORY[0x24BE765B8]();
}

uint64_t sub_244794530()
{
  return MEMORY[0x24BE765C0]();
}

uint64_t sub_24479453C()
{
  return MEMORY[0x24BE765C8]();
}

uint64_t sub_244794548()
{
  return MEMORY[0x24BE76600]();
}

uint64_t sub_244794554()
{
  return MEMORY[0x24BE76608]();
}

uint64_t sub_244794560()
{
  return MEMORY[0x24BE76620]();
}

uint64_t sub_24479456C()
{
  return MEMORY[0x24BE76628]();
}

uint64_t sub_244794578()
{
  return MEMORY[0x24BE76630]();
}

uint64_t sub_244794584()
{
  return MEMORY[0x24BE76638]();
}

uint64_t sub_244794590()
{
  return MEMORY[0x24BE76640]();
}

uint64_t sub_24479459C()
{
  return MEMORY[0x24BE76648]();
}

uint64_t sub_2447945A8()
{
  return MEMORY[0x24BE76698]();
}

uint64_t sub_2447945B4()
{
  return MEMORY[0x24BE766A0]();
}

uint64_t sub_2447945C0()
{
  return MEMORY[0x24BE766A8]();
}

uint64_t sub_2447945CC()
{
  return MEMORY[0x24BE766B0]();
}

uint64_t sub_2447945D8()
{
  return MEMORY[0x24BE766C0]();
}

uint64_t sub_2447945E4()
{
  return MEMORY[0x24BE766D8]();
}

uint64_t sub_2447945F0()
{
  return MEMORY[0x24BE766F0]();
}

uint64_t sub_2447945FC()
{
  return MEMORY[0x24BE76708]();
}

uint64_t sub_244794608()
{
  return MEMORY[0x24BE76710]();
}

uint64_t sub_244794614()
{
  return MEMORY[0x24BE76728]();
}

uint64_t sub_244794620()
{
  return MEMORY[0x24BE76748]();
}

uint64_t sub_24479462C()
{
  return MEMORY[0x24BE76750]();
}

uint64_t sub_244794638()
{
  return MEMORY[0x24BE76758]();
}

uint64_t sub_244794644()
{
  return MEMORY[0x24BE76760]();
}

uint64_t sub_244794650()
{
  return MEMORY[0x24BE76768]();
}

uint64_t sub_24479465C()
{
  return MEMORY[0x24BE76770]();
}

uint64_t sub_244794668()
{
  return MEMORY[0x24BE76778]();
}

uint64_t sub_244794674()
{
  return MEMORY[0x24BE76780]();
}

uint64_t sub_244794680()
{
  return MEMORY[0x24BE76788]();
}

uint64_t sub_24479468C()
{
  return MEMORY[0x24BE76790]();
}

uint64_t sub_244794698()
{
  return MEMORY[0x24BE767A0]();
}

uint64_t sub_2447946A4()
{
  return MEMORY[0x24BE767A8]();
}

uint64_t sub_2447946B0()
{
  return MEMORY[0x24BE767B0]();
}

uint64_t sub_2447946BC()
{
  return MEMORY[0x24BE767B8]();
}

uint64_t sub_2447946C8()
{
  return MEMORY[0x24BE767C0]();
}

uint64_t sub_2447946D4()
{
  return MEMORY[0x24BE767C8]();
}

uint64_t sub_2447946E0()
{
  return MEMORY[0x24BE767D0]();
}

uint64_t sub_2447946EC()
{
  return MEMORY[0x24BE767D8]();
}

uint64_t sub_2447946F8()
{
  return MEMORY[0x24BE767E0]();
}

uint64_t sub_244794704()
{
  return MEMORY[0x24BE767F0]();
}

uint64_t sub_244794710()
{
  return MEMORY[0x24BE767F8]();
}

uint64_t sub_24479471C()
{
  return MEMORY[0x24BE76858]();
}

uint64_t sub_244794728()
{
  return MEMORY[0x24BE76868]();
}

uint64_t sub_244794734()
{
  return MEMORY[0x24BE76870]();
}

uint64_t sub_244794740()
{
  return MEMORY[0x24BE76878]();
}

uint64_t sub_24479474C()
{
  return MEMORY[0x24BE76880]();
}

uint64_t sub_244794758()
{
  return MEMORY[0x24BE76888]();
}

uint64_t sub_244794764()
{
  return MEMORY[0x24BE76890]();
}

uint64_t sub_244794770()
{
  return MEMORY[0x24BE768A0]();
}

uint64_t sub_24479477C()
{
  return MEMORY[0x24BE768A8]();
}

uint64_t sub_244794788()
{
  return MEMORY[0x24BE768D8]();
}

uint64_t sub_244794794()
{
  return MEMORY[0x24BE768E0]();
}

uint64_t sub_2447947A0()
{
  return MEMORY[0x24BE768E8]();
}

uint64_t sub_2447947AC()
{
  return MEMORY[0x24BE768F0]();
}

uint64_t sub_2447947B8()
{
  return MEMORY[0x24BE768F8]();
}

uint64_t sub_2447947C4()
{
  return MEMORY[0x24BE76900]();
}

uint64_t sub_2447947D0()
{
  return MEMORY[0x24BE76910]();
}

uint64_t sub_2447947DC()
{
  return MEMORY[0x24BE76918]();
}

uint64_t sub_2447947E8()
{
  return MEMORY[0x24BE76928]();
}

uint64_t sub_2447947F4()
{
  return MEMORY[0x24BE76930]();
}

uint64_t sub_244794800()
{
  return MEMORY[0x24BE76940]();
}

uint64_t sub_24479480C()
{
  return MEMORY[0x24BE76950]();
}

uint64_t sub_244794818()
{
  return MEMORY[0x24BE76958]();
}

uint64_t sub_244794824()
{
  return MEMORY[0x24BE76968]();
}

uint64_t sub_244794830()
{
  return MEMORY[0x24BE769A8]();
}

uint64_t sub_24479483C()
{
  return MEMORY[0x24BE769B0]();
}

uint64_t sub_244794848()
{
  return MEMORY[0x24BE76A00]();
}

uint64_t sub_244794854()
{
  return MEMORY[0x24BE76A08]();
}

uint64_t sub_244794860()
{
  return MEMORY[0x24BE76A18]();
}

uint64_t sub_24479486C()
{
  return MEMORY[0x24BE76A20]();
}

uint64_t sub_244794878()
{
  return MEMORY[0x24BE76A28]();
}

uint64_t sub_244794884()
{
  return MEMORY[0x24BE76A30]();
}

uint64_t sub_244794890()
{
  return MEMORY[0x24BE76A40]();
}

uint64_t sub_24479489C()
{
  return MEMORY[0x24BE76A50]();
}

uint64_t sub_2447948A8()
{
  return MEMORY[0x24BE76A60]();
}

uint64_t sub_2447948B4()
{
  return MEMORY[0x24BE76AC0]();
}

uint64_t sub_2447948C0()
{
  return MEMORY[0x24BE76AC8]();
}

uint64_t sub_2447948CC()
{
  return MEMORY[0x24BE76AD0]();
}

uint64_t sub_2447948D8()
{
  return MEMORY[0x24BE76AD8]();
}

uint64_t sub_2447948E4()
{
  return MEMORY[0x24BE76AE0]();
}

uint64_t sub_2447948F0()
{
  return MEMORY[0x24BE76AE8]();
}

uint64_t sub_2447948FC()
{
  return MEMORY[0x24BE76AF0]();
}

uint64_t sub_244794908()
{
  return MEMORY[0x24BE76AF8]();
}

uint64_t sub_244794914()
{
  return MEMORY[0x24BE76B00]();
}

uint64_t sub_244794920()
{
  return MEMORY[0x24BE76B08]();
}

uint64_t sub_24479492C()
{
  return MEMORY[0x24BE76B10]();
}

uint64_t sub_244794938()
{
  return MEMORY[0x24BE76B18]();
}

uint64_t sub_244794944()
{
  return MEMORY[0x24BE76B20]();
}

uint64_t sub_244794950()
{
  return MEMORY[0x24BE76B28]();
}

uint64_t sub_24479495C()
{
  return MEMORY[0x24BE76B30]();
}

uint64_t sub_244794968()
{
  return MEMORY[0x24BE76B38]();
}

uint64_t sub_244794974()
{
  return MEMORY[0x24BE76B40]();
}

uint64_t sub_244794980()
{
  return MEMORY[0x24BE76B48]();
}

uint64_t sub_24479498C()
{
  return MEMORY[0x24BE76B50]();
}

uint64_t sub_244794998()
{
  return MEMORY[0x24BE76B58]();
}

uint64_t sub_2447949A4()
{
  return MEMORY[0x24BE76B60]();
}

uint64_t sub_2447949B0()
{
  return MEMORY[0x24BE76B70]();
}

uint64_t sub_2447949BC()
{
  return MEMORY[0x24BE76B80]();
}

uint64_t sub_2447949C8()
{
  return MEMORY[0x24BE76B88]();
}

uint64_t sub_2447949D4()
{
  return MEMORY[0x24BE76B90]();
}

uint64_t sub_2447949E0()
{
  return MEMORY[0x24BE76B98]();
}

uint64_t sub_2447949EC()
{
  return MEMORY[0x24BE76BB0]();
}

uint64_t sub_2447949F8()
{
  return MEMORY[0x24BE76BB8]();
}

uint64_t sub_244794A04()
{
  return MEMORY[0x24BE76BC0]();
}

uint64_t sub_244794A10()
{
  return MEMORY[0x24BE76BD0]();
}

uint64_t sub_244794A1C()
{
  return MEMORY[0x24BE76BE8]();
}

uint64_t sub_244794A28()
{
  return MEMORY[0x24BE76C30]();
}

uint64_t sub_244794A34()
{
  return MEMORY[0x24BE76C38]();
}

uint64_t sub_244794A40()
{
  return MEMORY[0x24BE76C58]();
}

uint64_t sub_244794A4C()
{
  return MEMORY[0x24BE76C68]();
}

uint64_t sub_244794A58()
{
  return MEMORY[0x24BE78598]();
}

uint64_t sub_244794A64()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_244794A70()
{
  return MEMORY[0x24BE76C70]();
}

uint64_t sub_244794A7C()
{
  return MEMORY[0x24BE76C80]();
}

uint64_t sub_244794A88()
{
  return MEMORY[0x24BE76C90]();
}

uint64_t sub_244794A94()
{
  return MEMORY[0x24BE76C98]();
}

uint64_t sub_244794AA0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244794AAC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244794AB8()
{
  return MEMORY[0x24BEC62E8]();
}

uint64_t sub_244794AC4()
{
  return MEMORY[0x24BEC62F8]();
}

uint64_t sub_244794AD0()
{
  return MEMORY[0x24BEC6300]();
}

uint64_t sub_244794ADC()
{
  return MEMORY[0x24BEC6310]();
}

uint64_t sub_244794AE8()
{
  return MEMORY[0x24BEC6318]();
}

uint64_t sub_244794AF4()
{
  return MEMORY[0x24BEC6320]();
}

uint64_t sub_244794B00()
{
  return MEMORY[0x24BEC6328]();
}

uint64_t sub_244794B0C()
{
  return MEMORY[0x24BEC6330]();
}

uint64_t sub_244794B18()
{
  return MEMORY[0x24BEC6338]();
}

uint64_t sub_244794B24()
{
  return MEMORY[0x24BEC6340]();
}

uint64_t sub_244794B30()
{
  return MEMORY[0x24BEC6348]();
}

uint64_t sub_244794B3C()
{
  return MEMORY[0x24BEC6350]();
}

uint64_t sub_244794B48()
{
  return MEMORY[0x24BEC6360]();
}

uint64_t sub_244794B54()
{
  return MEMORY[0x24BEC6368]();
}

uint64_t sub_244794B60()
{
  return MEMORY[0x24BEC6370]();
}

uint64_t sub_244794B6C()
{
  return MEMORY[0x24BEC6378]();
}

uint64_t sub_244794B78()
{
  return MEMORY[0x24BEC6380]();
}

uint64_t sub_244794B84()
{
  return MEMORY[0x24BEC6388]();
}

uint64_t sub_244794B90()
{
  return MEMORY[0x24BEC6398]();
}

uint64_t sub_244794B9C()
{
  return MEMORY[0x24BEC63A0]();
}

uint64_t sub_244794BA8()
{
  return MEMORY[0x24BEC63B0]();
}

uint64_t sub_244794BB4()
{
  return MEMORY[0x24BEC63B8]();
}

uint64_t sub_244794BC0()
{
  return MEMORY[0x24BEC63C0]();
}

uint64_t sub_244794BCC()
{
  return MEMORY[0x24BEC63C8]();
}

uint64_t sub_244794BD8()
{
  return MEMORY[0x24BEC63D0]();
}

uint64_t sub_244794BE4()
{
  return MEMORY[0x24BEC63D8]();
}

uint64_t sub_244794BF0()
{
  return MEMORY[0x24BEC63E8]();
}

uint64_t sub_244794BFC()
{
  return MEMORY[0x24BEC63F0]();
}

uint64_t sub_244794C08()
{
  return MEMORY[0x24BEC63F8]();
}

uint64_t sub_244794C14()
{
  return MEMORY[0x24BEC6408]();
}

uint64_t sub_244794C20()
{
  return MEMORY[0x24BEC6410]();
}

uint64_t sub_244794C2C()
{
  return MEMORY[0x24BEC6418]();
}

uint64_t sub_244794C38()
{
  return MEMORY[0x24BEC6420]();
}

uint64_t sub_244794C44()
{
  return MEMORY[0x24BEC6428]();
}

uint64_t sub_244794C50()
{
  return MEMORY[0x24BEC6430]();
}

uint64_t sub_244794C5C()
{
  return MEMORY[0x24BEC6438]();
}

uint64_t sub_244794C68()
{
  return MEMORY[0x24BEC6440]();
}

uint64_t sub_244794C74()
{
  return MEMORY[0x24BEC6450]();
}

uint64_t sub_244794C80()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_244794C8C()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_244794C98()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_244794CA4()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_244794CB0()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_244794CBC()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_244794CC8()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_244794CD4()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_244794CE0()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_244794CEC()
{
  return MEMORY[0x24BDEDED8]();
}

uint64_t sub_244794CF8()
{
  return MEMORY[0x24BDEDEE0]();
}

uint64_t sub_244794D04()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_244794D10()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_244794D1C()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_244794D28()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_244794D34()
{
  return MEMORY[0x24BDEE128]();
}

uint64_t sub_244794D40()
{
  return MEMORY[0x24BDEE130]();
}

uint64_t sub_244794D4C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_244794D58()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_244794D64()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_244794D70()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_244794D7C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_244794D88()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_244794D94()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_244794DA0()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_244794DAC()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_244794DB8()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_244794DC4()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_244794DD0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_244794DDC()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_244794DE8()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_244794DF4()
{
  return MEMORY[0x24BDF0478]();
}

uint64_t sub_244794E00()
{
  return MEMORY[0x24BDF0480]();
}

uint64_t sub_244794E0C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_244794E18()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_244794E24()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_244794E30()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_244794E3C()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_244794E48()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_244794E54()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_244794E60()
{
  return MEMORY[0x24BDF16D0]();
}

uint64_t sub_244794E6C()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_244794E78()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_244794E84()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_244794E90()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_244794E9C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_244794EA8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_244794EB4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_244794EC0()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_244794ECC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_244794ED8()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_244794EE4()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_244794EF0()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_244794EFC()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_244794F08()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_244794F14()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_244794F20()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_244794F2C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_244794F38()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_244794F44()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_244794F50()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_244794F5C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_244794F68()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_244794F74()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_244794F80()
{
  return MEMORY[0x24BDF4E10]();
}

uint64_t sub_244794F8C()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_244794F98()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_244794FA4()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_244794FB0()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_244794FBC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_244794FC8()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_244794FD4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_244794FE0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_244794FEC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_244794FF8()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_244795004()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_244795010()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_24479501C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_244795028()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_244795034()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_244795040()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24479504C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_244795058()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244795064()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_244795070()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_24479507C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_244795088()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_244795094()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2447950A0()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2447950AC()
{
  return MEMORY[0x24BE76CC8]();
}

uint64_t sub_2447950B8()
{
  return MEMORY[0x24BE76CD0]();
}

uint64_t sub_2447950C4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2447950D0()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2447950DC()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_2447950E8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2447950F4()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_244795100()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24479510C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_244795118()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_244795124()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_244795130()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_24479513C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_244795148()
{
  return MEMORY[0x24BEE0E90]();
}

uint64_t sub_244795154()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_244795160()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_24479516C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_244795178()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_244795184()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_244795190()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24479519C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2447951A8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2447951B4()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2447951C0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2447951CC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2447951D8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2447951E4()
{
  return MEMORY[0x24BE76D28]();
}

uint64_t sub_2447951F0()
{
  return MEMORY[0x24BEE6810]();
}

uint64_t sub_2447951FC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_244795208()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_244795214()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_244795220()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_24479522C()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_244795238()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_244795244()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_244795250()
{
  return MEMORY[0x24BE76D38]();
}

uint64_t sub_24479525C()
{
  return MEMORY[0x24BE76D40]();
}

uint64_t sub_244795268()
{
  return MEMORY[0x24BE76D48]();
}

uint64_t sub_244795274()
{
  return MEMORY[0x24BE76D50]();
}

uint64_t sub_244795280()
{
  return MEMORY[0x24BE76D60]();
}

uint64_t sub_24479528C()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_244795298()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_2447952A4()
{
  return MEMORY[0x24BE76D68]();
}

uint64_t sub_2447952B0()
{
  return MEMORY[0x24BE76D70]();
}

uint64_t sub_2447952BC()
{
  return MEMORY[0x24BE76D78]();
}

uint64_t sub_2447952C8()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_2447952D4()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2447952E0()
{
  return MEMORY[0x24BEE6AE8]();
}

uint64_t sub_2447952EC()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_2447952F8()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_244795304()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_244795310()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_24479531C()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_244795328()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_244795334()
{
  return MEMORY[0x24BE76DB8]();
}

uint64_t sub_244795340()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_24479534C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_244795358()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_244795364()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_244795370()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24479537C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244795388()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_244795394()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2447953A0()
{
  return MEMORY[0x24BE782C8]();
}

uint64_t sub_2447953AC()
{
  return MEMORY[0x24BE76DD8]();
}

uint64_t sub_2447953B8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2447953C4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2447953D0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2447953DC()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2447953E8()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2447953F4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_244795400()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24479540C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244795418()
{
  return MEMORY[0x24BE76E08]();
}

uint64_t sub_244795424()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_244795430()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_24479543C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_244795448()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244795454()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_244795460()
{
  return MEMORY[0x24BDD0618]();
}

uint64_t sub_24479546C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_244795478()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_244795484()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_244795490()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_24479549C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2447954A8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2447954B4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2447954C0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2447954CC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2447954D8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2447954E4()
{
  return MEMORY[0x24BEE2588]();
}

uint64_t sub_2447954F0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2447954FC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_244795508()
{
  return MEMORY[0x24BEE2AF8]();
}

uint64_t sub_244795514()
{
  return MEMORY[0x24BEE2B00]();
}

uint64_t sub_244795520()
{
  return MEMORY[0x24BEE2B08]();
}

uint64_t sub_24479552C()
{
  return MEMORY[0x24BEE2B20]();
}

uint64_t sub_244795538()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_244795544()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244795550()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24479555C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_244795568()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_244795574()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244795580()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24479558C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244795598()
{
  return MEMORY[0x24BEE3168]();
}

uint64_t sub_2447955A4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2447955B0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2447955BC()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_2447955C8()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_2447955D4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2447955E0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2447955EC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2447955F8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244795604()
{
  return MEMORY[0x24BE76E18]();
}

uint64_t sub_244795610()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24479561C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_244795628()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_244795634()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_244795640()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_24479564C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244795658()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_244795664()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_244795670()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_24479567C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244795688()
{
  return MEMORY[0x24BE76E38]();
}

uint64_t sub_244795694()
{
  return MEMORY[0x24BEE4A98]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDB60](space);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

CGImageByteOrderInfo CGImageGetByteOrderInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE640](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x24BEBE0E0]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x24BDADA40]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x24BDADA88]();
}

uint64_t container_get_path()
{
  return MEMORY[0x24BDADAC0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x24BDADB18]();
}

uint64_t container_query_free()
{
  return MEMORY[0x24BDADB20]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x24BDADB28]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x24BDADB30]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x24BDADB48]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x24BDADB58]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x24BDADB68]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x24BDADB78]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

