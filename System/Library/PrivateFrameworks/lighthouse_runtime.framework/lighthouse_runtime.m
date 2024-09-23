uint64_t GenericReporter.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B6A0DEC(a1, a2, a3, (uint64_t (*)(void))sub_24B6A1170);
}

uint64_t GenericReporter.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B6A0DEC(a1, a2, a3, (uint64_t (*)(void))sub_24B6A1144);
}

uint64_t sub_24B6A0DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;

  v6 = a4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v6;
}

void *sub_24B6A0E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  uint64_t v13;

  v7 = *(_QWORD *)(a3 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](a1, a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = a2;
  *((_QWORD *)v11 + 3) = a3;
  *((_QWORD *)v11 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], v9, a3);
  return &unk_2579ACEC8;
}

uint64_t sub_24B6A0EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 24) + *(_QWORD *)(a5 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v9;
  *v9 = v5;
  v9[1] = sub_24B6A0F78;
  return v11(a1, a4, a5);
}

uint64_t sub_24B6A0F78()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24B6A0FC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_24B6A0FD8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))(**(int **)(v0[3] + 16) + *(_QWORD *)(v0[3] + 16));
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_24B6A1038;
  return v3(v0[2]);
}

uint64_t sub_24B6A1038()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t GenericReporter.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t GenericReporter.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24B6A10C0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24B6A1454;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

void sub_24B6A1124(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void sub_24B6A1130(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_24B6A1138@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_24B6A1144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[2] = sub_24B6A0E34(a1, *(_QWORD *)(*v3 + 80), a2, a3);
  v3[3] = v4;
  return v3;
}

_QWORD *sub_24B6A1170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  type metadata accessor for GenericReporter(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_24B6A0E34(a1, *(_QWORD *)(*v8 + 80), a2, a3);
  v8[3] = v9;
  return v8;
}

uint64_t sub_24B6A11D8(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

uint64_t dispatch thunk of Reporter.report(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24B6A1454;
  return v9(a1, a2, a3);
}

uint64_t sub_24B6A125C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for GenericReporter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GenericReporter);
}

uint64_t method lookup function for GenericReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GenericReporter.__allocating_init<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of GenericReporter.report(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 112) + *(_QWORD *)(*(_QWORD *)v1 + 112));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24B6A0F78;
  return v6(a1);
}

uint64_t sub_24B6A1324()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_24B6A137C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_24B6A1454;
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v5 + 24) + *(_QWORD *)(v5 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  v6[2] = v7;
  *v7 = v6;
  v7[1] = sub_24B6A0F78;
  return v9(a1, v4, v5);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24BD251EC](a1, v6, a5);
}

uint64_t GenericWorker.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B6A0DEC(a1, a2, a3, (uint64_t (*)(void))sub_24B6A1770);
}

uint64_t GenericWorker.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B6A0DEC(a1, a2, a3, (uint64_t (*)(void))sub_24B6A1744);
}

void *sub_24B6A1470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char *v13;
  uint64_t v15;

  v9 = *(_QWORD *)(a4 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](a1, a1);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v11);
  v12 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v13 = (char *)swift_allocObject();
  *((_QWORD *)v13 + 2) = a2;
  *((_QWORD *)v13 + 3) = a3;
  *((_QWORD *)v13 + 4) = a4;
  *((_QWORD *)v13 + 5) = a5;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v13[v12], v11, a4);
  return &unk_2579ACFA8;
}

uint64_t sub_24B6A1540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);

  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a7 + 40) + *(_QWORD *)(a7 + 40));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v12;
  *v12 = v7;
  v12[1] = sub_24B6A0F78;
  return v14(a1, a2, a6, a7);
}

uint64_t sub_24B6A15CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_24B6A15E8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD, _QWORD);

  v3 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0[4] + 16) + *(_QWORD *)(v0[4] + 16));
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = v1;
  *v1 = v0;
  v1[1] = sub_24B6A1648;
  return v3(v0[2], v0[3]);
}

uint64_t sub_24B6A1648()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t GenericWorker.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t GenericWorker.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24B6A16D0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24B6A1454;
  v7[3] = a2;
  v7[4] = v6;
  v7[2] = a1;
  return swift_task_switch();
}

_QWORD *sub_24B6A1744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[2] = sub_24B6A1470(a1, *(_QWORD *)(*v3 + 80), *(_QWORD *)(*v3 + 88), a2, a3);
  v3[3] = v4;
  return v3;
}

void sub_24B6A1770()
{
  type metadata accessor for GenericWorker();
}

_QWORD *sub_24B6A17A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)swift_allocObject();
  v3[2] = sub_24B6A1470(v2, *(_QWORD *)(*v3 + 80), *(_QWORD *)(*v3 + 88), v1, v0);
  v3[3] = v4;
  return v3;
}

uint64_t sub_24B6A17E8(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 96);
}

uint64_t sub_24B6A17F0(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

uint64_t dispatch thunk of Worker.doWork(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 40) + *(_QWORD *)(a4 + 40));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_24B6A1454;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_24B6A1880()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for GenericWorker()
{
  JUMPOUT(0x24BD251ECLL);
}

uint64_t method lookup function for GenericWorker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GenericWorker.__allocating_init<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of GenericWorker.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 128) + *(_QWORD *)(*(_QWORD *)v2 + 128));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_24B6A0F78;
  return v8(a1, a2);
}

uint64_t sub_24B6A1958()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_24B6A19B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)(v2 + 32);
  v7 = *(_QWORD *)(v2 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_24B6A1454;
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v7 + 40) + *(_QWORD *)(v7 + 40));
  v9 = (_QWORD *)swift_task_alloc();
  v8[2] = v9;
  *v9 = v8;
  v9[1] = sub_24B6A0F78;
  return v11(a1, a2, v6, v7);
}

uint64_t LighthouseRuntimeProcessor.runtime.getter()
{
  return swift_retain();
}

uint64_t LighthouseRuntimeProcessor.__allocating_init(task:plugin:enforceDiagnosticCheck:)(void *a1, uint64_t a2, char a3)
{
  swift_allocObject();
  return LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)(a1, a2, a3);
}

uint64_t LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)(void *a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;

  v4 = v3;
  v7 = *v4;
  v4[3] = 0;
  if ((a3 & 1) == 0 || (static LighthouseRuntimeProcessor.isDiagnosticsSubmissionAllowed()() & 1) != 0)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedConformanceWitness();
    type metadata accessor for LighthouseRuntime();
  }

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v7 + 80) - 8) + 8))(a2);
  swift_release();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t LighthouseRuntimeProcessor.process()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v2 = sub_24B6ADD74();
  MEMORY[0x24BDAC7A8](v2, v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PluginContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_24B6A4960((uint64_t)v7);
  result = sub_24B6A36A8((uint64_t)v7, &qword_2579ACFB0);
  *a1 = 1;
  return result;
}

uint64_t LighthouseRuntimeProcessor.process(withContext:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v4 = sub_24B6ADD74();
  MEMORY[0x24BDAC7A8](v4, v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B6A309C(a1, (uint64_t)v9);
  v10 = type metadata accessor for PluginContext();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  sub_24B6A4960((uint64_t)v9);
  result = sub_24B6A36A8((uint64_t)v9, &qword_2579ACFB0);
  *a2 = 1;
  return result;
}

uint64_t LighthouseRuntimeProcessor.processAsync(withContext:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = *v2;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0) - 8);
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 + 64);
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  v3[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24B6A1FE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v14)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 32);
  if (*(_QWORD *)(v1 + 24))
  {
    sub_24B6A30E0();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 64);
    v3 = *(_QWORD *)(v0 + 72);
    v5 = *(_QWORD *)(v0 + 48);
    v6 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 24);
    v8 = sub_24B6ADD8C();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
    v9 = swift_allocObject();
    swift_weakInit();
    sub_24B6A362C(v7, v4, &qword_2579ACFB0);
    v10 = (*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = *(_QWORD *)(v6 + 80);
    v11[5] = *(_QWORD *)(v6 + 88);
    v11[6] = v9;
    sub_24B6A3230(v4, (uint64_t)v11 + v10);
    v12 = sub_24B6A23E8(v3, (uint64_t)&unk_2579ACFE0, (uint64_t)v11);
    *(_QWORD *)(v0 + 80) = v12;
    *(_QWORD *)(v1 + 24) = v12;
    swift_retain();
    swift_release();
    v14 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2579ACFE8 + dword_2579ACFE8);
    swift_retain();
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v13;
    *v13 = v0;
    v13[1] = sub_24B6A21C8;
    return v14(*(_QWORD *)(v0 + 16), v12);
  }
}

uint64_t sub_24B6A21C8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24B6A221C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 32) + 24) = 0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6A2280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 48) = a5;
  return swift_task_switch();
}

uint64_t sub_24B6A2298()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 56) = *(_QWORD *)(Strong + 16);
  swift_retain();
  swift_release();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *v2 = v0;
  v2[1] = sub_24B6A2340;
  return sub_24B6A4B84(1000, *(_QWORD *)(v0 + 48));
}

uint64_t sub_24B6A2340()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24B6A23B4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6A23E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_24B6ADD8C();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24B6ADD80();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_24B6A36A8(a1, &qword_2579ACFC8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24B6ADD68();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24B6A251C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2[3] = a1;
  v2[4] = a2;
  v3 = sub_24B6ADD74();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v4 = (_QWORD *)swift_task_alloc();
  v2[8] = v4;
  v2[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
  *v4 = v2;
  v4[1] = sub_24B6A25C4;
  return sub_24B6ADD98();
}

uint64_t sub_24B6A25C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24B6A2628()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)(v0 + 24);
  swift_release();
  *v1 = 1;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6A2668()
{
  uint64_t v0;
  void *v1;
  id v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v1 = *(void **)(v0 + 80);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v1;
  v3 = swift_dynamicCast();
  v4 = *(void **)(v0 + 80);
  if ((v3 & 1) != 0)
  {
    v6 = *(_QWORD *)(v0 + 48);
    v5 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 40);
    v8 = *(_QWORD **)(v0 + 24);

    *v8 = 2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);

    swift_release();
  }
  else
  {
    v9 = *(_QWORD **)(v0 + 24);

    swift_release();
    *v9 = v4;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall LighthouseRuntimeProcessor.stop()()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
    sub_24B6ADDA4();
    swift_release();
  }
}

id static LighthouseRuntimeProcessor.isDiagnosticsSubmissionAllowed()()
{
  id result;
  void *v1;
  unsigned int v2;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, sel_effectiveBoolValueForSetting_, *MEMORY[0x24BE638E0]);

    return (id)(v2 == 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LighthouseRuntimeProcessor.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t LighthouseRuntimeProcessor.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

id LighthouseRuntimeProcessorResult.mlrTaskResult.getter()
{
  void **v0;
  void *v1;
  uint64_t inited;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;

  v1 = *v0;
  if (v1 == (void *)3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFF0);
    inited = swift_initStackObject();
    v3 = inited;
    *(_OWORD *)(inited + 16) = xmmword_24B6AE5A0;
    *(_QWORD *)(inited + 32) = 0x746C75736572;
    *(_QWORD *)(inited + 40) = 0xE600000000000000;
    v4 = 0xD00000000000001ALL;
    v5 = 0x800000024B6AEF30;
  }
  else if (v1 == (void *)2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFF0);
    inited = swift_initStackObject();
    v3 = inited;
    *(_OWORD *)(inited + 16) = xmmword_24B6AE5A0;
    *(_QWORD *)(inited + 32) = 0x746C75736572;
    *(_QWORD *)(inited + 40) = 0xE600000000000000;
    v4 = 0x656C6C65636E6163;
    v5 = 0xE900000000000064;
  }
  else
  {
    if (v1 != (void *)1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFF0);
      v3 = swift_initStackObject();
      *(_OWORD *)(v3 + 16) = xmmword_24B6AE5B0;
      *(_QWORD *)(v3 + 32) = 0x746C75736572;
      *(_QWORD *)(v3 + 40) = 0xE600000000000000;
      *(_QWORD *)(v3 + 48) = 0x6572756C696166;
      *(_QWORD *)(v3 + 56) = 0xE700000000000000;
      *(_QWORD *)(v3 + 64) = 0x726F727265;
      *(_QWORD *)(v3 + 72) = 0xE500000000000000;
      sub_24B6A32F8(v1);
      __swift_instantiateConcreteTypeFromMangledName(qword_2579ACFF8);
      *(_QWORD *)(v3 + 80) = sub_24B6ADD20();
      *(_QWORD *)(v3 + 88) = v6;
      goto LABEL_9;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFF0);
    inited = swift_initStackObject();
    v3 = inited;
    *(_OWORD *)(inited + 16) = xmmword_24B6AE5A0;
    *(_QWORD *)(inited + 32) = 0x746C75736572;
    *(_QWORD *)(inited + 40) = 0xE600000000000000;
    v4 = 0x73736563637573;
    v5 = 0xE700000000000000;
  }
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v5;
LABEL_9:
  v7 = sub_24B6A2BD4(v3);
  sub_24B6A2CF4(v7);
  swift_bridgeObjectRelease();
  v8 = objc_allocWithZone(MEMORY[0x24BE63328]);
  v9 = (void *)sub_24B6ADCF0();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithJSONResult_unprivatizedVector_, v9, 0);

  return v10;
}

unint64_t sub_24B6A2AA0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD080);
  v2 = sub_24B6ADEB8();
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
    sub_24B6A362C(v6, (uint64_t)&v15, &qword_2579AD088);
    v7 = v15;
    v8 = v16;
    result = sub_24B6A9778(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_24B6A3670(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_24B6A2BD4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD090);
  v2 = (_QWORD *)sub_24B6ADEB8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_24B6A9778(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_24B6A2CF4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD080);
    v2 = (_QWORD *)sub_24B6ADEB8();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x24BEE4AD8] + 8;
  v11 = MEMORY[0x24BEE0D00];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_24B6A36A0();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24B6A3670(v6, v7);
    sub_24B6A3670(v7, v40);
    sub_24B6A3670(v40, &v38);
    result = sub_24B6A9778(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      result = (unint64_t)sub_24B6A3670(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_24B6A3670(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD2521C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24B6A309C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PluginContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24B6A30E0()
{
  unint64_t result;

  result = qword_2579ACFD0;
  if (!qword_2579ACFD0)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LighthouseProcessorTaskAlreadyRunning, &type metadata for LighthouseProcessorTaskAlreadyRunning);
    atomic_store(result, &qword_2579ACFD0);
  }
  return result;
}

uint64_t sub_24B6A3124()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24B6A3148()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0) - 8) + 80);
  swift_unknownObjectRelease();
  swift_release();
  v2 = (id *)(v0 + ((v1 + 56) & ~v1));
  v3 = type metadata accessor for PluginContext();
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v2, 1, v3))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4 = (char *)v2 + *(int *)(v3 + 32);
    v5 = sub_24B6ADBD0();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  }
  return swift_deallocObject();
}

uint64_t sub_24B6A3230(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B6A3278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = v0 + ((v2 + 56) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24B6A0F78;
  v5[5] = v3;
  v5[6] = v4;
  return swift_task_switch();
}

id sub_24B6A32F8(id result)
{
  if ((char *)result - 1 >= (char *)3)
    return result;
  return result;
}

uint64_t sub_24B6A330C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LighthouseRuntimeProcessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LighthouseRuntimeProcessor);
}

uint64_t method lookup function for LighthouseRuntimeProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LighthouseRuntimeProcessor.__allocating_init(task:plugin:enforceDiagnosticCheck:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for LighthouseProcessorTaskAlreadyRunning()
{
  return &type metadata for LighthouseProcessorTaskAlreadyRunning;
}

void destroy for LighthouseRuntimeProcessorResult(void **a1)
{
  void *v1;
  int v2;

  v1 = *a1;
  v2 = -1;
  if ((unint64_t)v1 < 0xFFFFFFFF)
    v2 = (int)v1;
  if ((v2 + 1) <= 1)

}

_QWORD *_s18lighthouse_runtime32LighthouseRuntimeProcessorResultOwCP_0(_QWORD *a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  LODWORD(v4) = -1;
  if ((unint64_t)*a2 < 0xFFFFFFFF)
    v4 = *a2;
  if (((_DWORD)v4 + 1) <= 1)
    v5 = v3;
  *a1 = v3;
  return a1;
}

void **assignWithCopy for LighthouseRuntimeProcessorResult(void **a1, void **a2)
{
  void *v3;
  void *v4;
  int v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;

  v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)v3 >= 0xFFFFFFFF)
    v5 = -1;
  else
    v5 = (int)v3;
  v6 = v5 + 1;
  v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF)
    v4 = *a2;
  v8 = (_DWORD)v4 + 1;
  if (v6 > 1)
  {
    if (v8 <= 1)
      v11 = v7;
    *a1 = v7;
  }
  else if (v8 > 1)
  {

    *a1 = *a2;
  }
  else
  {
    v9 = v7;
    v10 = *a1;
    *a1 = v7;

  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for LighthouseRuntimeProcessorResult(void **a1, void **a2)
{
  void *v3;
  void *v4;
  int v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;

  v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)v3 >= 0xFFFFFFFF)
    v5 = -1;
  else
    v5 = (int)v3;
  v6 = v5 + 1;
  v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF)
    v4 = *a2;
  v8 = (_DWORD)v4 + 1;
  if (v6 > 1)
    goto LABEL_11;
  if (v8 > 1)
  {

LABEL_11:
    *a1 = v7;
    return a1;
  }
  *a1 = v7;

  return a1;
}

uint64_t getEnumTagSinglePayload for LighthouseRuntimeProcessorResult(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFC && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483644);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) < 2)
    LODWORD(v3) = 0;
  if (v3 >= 4)
    return (v3 - 3);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LighthouseRuntimeProcessorResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 3;
  }
  return result;
}

uint64_t sub_24B6A35C8(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  if ((v1 + 1) >= 2)
    return v1;
  else
    return 0;
}

_QWORD *sub_24B6A35EC(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LighthouseRuntimeProcessorResult()
{
  return &type metadata for LighthouseRuntimeProcessorResult;
}

uint64_t sub_24B6A362C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_24B6A3670(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24B6A36A0()
{
  return swift_release();
}

uint64_t sub_24B6A36A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t GenericDataProvider.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B6A0DEC(a1, a2, a3, (uint64_t (*)(void))sub_24B6A398C);
}

uint64_t GenericDataProvider.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B6A0DEC(a1, a2, a3, (uint64_t (*)(void))sub_24B6A3960);
}

void *sub_24B6A36FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  uint64_t v13;

  v7 = *(_QWORD *)(a3 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](a1, a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = a2;
  *((_QWORD *)v11 + 3) = a3;
  *((_QWORD *)v11 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], v9, a3);
  return &unk_2579AD160;
}

uint64_t sub_24B6A37C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 24) + *(_QWORD *)(a5 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v9;
  *v9 = v5;
  v9[1] = sub_24B6A0F78;
  return v11(a1, a4, a5);
}

uint64_t sub_24B6A3844(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_24B6A385C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))(**(int **)(v0[3] + 16) + *(_QWORD *)(v0[3] + 16));
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_24B6A1038;
  return v3(v0[2]);
}

uint64_t GenericDataProvider.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t GenericDataProvider.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24B6A38FC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24B6A1454;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

_QWORD *sub_24B6A3960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[2] = sub_24B6A36FC(a1, *(_QWORD *)(*v3 + 80), a2, a3);
  v3[3] = v4;
  return v3;
}

_QWORD *sub_24B6A398C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  type metadata accessor for GenericDataProvider(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_24B6A36FC(a1, *(_QWORD *)(*v8 + 80), a2, a3);
  v8[3] = v9;
  return v8;
}

uint64_t dispatch thunk of DataProvider.loadData()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24B6A0F78;
  return v9(a1, a2, a3);
}

uint64_t type metadata accessor for GenericDataProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GenericDataProvider);
}

uint64_t method lookup function for GenericDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GenericDataProvider.__allocating_init<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of GenericDataProvider.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 112) + *(_QWORD *)(*(_QWORD *)v1 + 112));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24B6A1454;
  return v6(a1);
}

uint64_t sub_24B6A3AF8()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_24B6A3B50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_24B6A1454;
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v5 + 24) + *(_QWORD *)(v5 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  v6[2] = v7;
  *v7 = v6;
  v7[1] = sub_24B6A0F78;
  return v9(a1, v4, v5);
}

void LighthouseRuntime.__allocating_init(_:)()
{
  sub_24B6A9AA0();
}

uint64_t sub_24B6A3C10(uint64_t a1)
{
  void *v1;

  return a1;
}

void LighthouseRuntime.setLighthousePlugin<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24B6A9AF0(a1, a2, *(_QWORD *)(a3 + 8), a4);
  swift_retain();
  sub_24B6A9B60();
}

_QWORD *sub_24B6A3C6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  swift_retain();
  swift_release();
  v4 = sub_24B6A9BDC(v2, v1, *(_QWORD *)(v0 + 16), v3);
  swift_retain();
  swift_release();
  return v4;
}

uint64_t sub_24B6A3CB8(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aStart_2[8 * a1] == *(_QWORD *)&aStart_2[8 * a2]
    && *(_QWORD *)&aFinished_1[8 * a1 + 8] == *(_QWORD *)&aFinished_1[8 * a2 + 8])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_24B6ADF00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24B6A3D3C(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aLoaddatadowork[8 * a1] == *(_QWORD *)&aLoaddatadowork[8 * a2]
    && *(_QWORD *)&aTotalrun[8 * a1 + 8] == *(_QWORD *)&aTotalrun[8 * a2 + 8])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_24B6ADF00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24B6A3DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0);
  MEMORY[0x24BDAC7A8](v0, v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for PluginContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD3C8);
  swift_allocObject();
  result = sub_24B6ADF90();
  qword_2579AD168 = result;
  return result;
}

uint64_t static PluginContext.$current.getter()
{
  if (qword_2579ACDF0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t static PluginContext.current.getter()
{
  if (qword_2579ACDF0 != -1)
    swift_once();
  return sub_24B6ADF9C();
}

void PluginContext.init(trialId:parameters:attachments:trialNamespace:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;

  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  v8 = type metadata accessor for PluginContext();
  v9 = a1;
  sub_24B6ADBC4();
  v10 = objc_allocWithZone((Class)sub_24B6ADC0C());
  v11 = sub_24B6ADC00();

  *(_QWORD *)((char *)a6 + *(int *)(v8 + 36)) = v11;
}

uint64_t PluginContext.init(trialId:parameters:attachments:trialNamespace:MLHostContext:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v9;
  uint64_t result;

  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  v9 = type metadata accessor for PluginContext();
  result = sub_24B6ADBC4();
  *(_QWORD *)((char *)a7 + *(int *)(v9 + 36)) = a6;
  return result;
}

id PluginContext.trialId.getter()
{
  id *v0;

  return *v0;
}

void PluginContext.trialId.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*PluginContext.trialId.modify())()
{
  return nullsub_1;
}

uint64_t PluginContext.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PluginContext.parameters.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*PluginContext.parameters.modify())()
{
  return nullsub_1;
}

uint64_t PluginContext.attachments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PluginContext.attachments.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*PluginContext.attachments.modify())()
{
  return nullsub_1;
}

uint64_t PluginContext.trialNamespace.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PluginContext.trialNamespace.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*PluginContext.trialNamespace.modify())()
{
  return nullsub_1;
}

uint64_t PluginContext.correlationID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PluginContext() + 32);
  v4 = sub_24B6ADBD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PluginContext.correlationID.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PluginContext() + 32);
  v4 = sub_24B6ADBD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*PluginContext.correlationID.modify())()
{
  type metadata accessor for PluginContext();
  return nullsub_1;
}

id PluginContext.mlhostContext.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for PluginContext() + 36));
}

BOOL static LighthouseRuntimeError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t LighthouseRuntimeError.hash(into:)()
{
  return sub_24B6ADF48();
}

uint64_t LighthouseRuntimeError.hashValue.getter()
{
  sub_24B6ADF3C();
  sub_24B6ADF48();
  return sub_24B6ADF54();
}

BOOL sub_24B6A427C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24B6A4294()
{
  sub_24B6ADF3C();
  sub_24B6ADF48();
  return sub_24B6ADF54();
}

uint64_t sub_24B6A42D8()
{
  return sub_24B6ADF48();
}

uint64_t sub_24B6A4300()
{
  sub_24B6ADF3C();
  sub_24B6ADF48();
  return sub_24B6ADF54();
}

lighthouse_runtime::LHRStates_optional __swiftcall LHRStates.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  lighthouse_runtime::LHRStates_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24B6ADED0();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static LHRStates.allCases.getter()
{
  return &unk_251C8D380;
}

uint64_t LHRStates.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aStart_2[8 * *v0];
}

uint64_t sub_24B6A43C8(char *a1, char *a2)
{
  return sub_24B6A3CB8(*a1, *a2);
}

uint64_t sub_24B6A43D4()
{
  return sub_24B6A43DC();
}

uint64_t sub_24B6A43DC()
{
  sub_24B6ADF3C();
  sub_24B6ADD2C();
  swift_bridgeObjectRelease();
  return sub_24B6ADF54();
}

uint64_t sub_24B6A4444()
{
  sub_24B6ADF3C();
  sub_24B6ADD2C();
  swift_bridgeObjectRelease();
  return sub_24B6ADF54();
}

uint64_t sub_24B6A44AC()
{
  return sub_24B6A44B4();
}

uint64_t sub_24B6A44B4()
{
  sub_24B6ADD2C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B6A44F4()
{
  sub_24B6ADD2C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B6A4534()
{
  return sub_24B6A45A0();
}

uint64_t sub_24B6A453C()
{
  sub_24B6ADF3C();
  sub_24B6ADD2C();
  swift_bridgeObjectRelease();
  return sub_24B6ADF54();
}

uint64_t sub_24B6A45A0()
{
  sub_24B6ADF3C();
  sub_24B6ADD2C();
  swift_bridgeObjectRelease();
  return sub_24B6ADF54();
}

lighthouse_runtime::LHRStates_optional sub_24B6A4604(Swift::String *a1)
{
  return LHRStates.init(rawValue:)(*a1);
}

uint64_t sub_24B6A4610@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LHRStates.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_24B6A4634(_QWORD *a1@<X8>)
{
  *a1 = &unk_251C8D3A8;
}

uint64_t LRSignpostName.staticString.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_24B6A466C + 4
                                                                                * asc_24B6AE7A0[*v0]))("LoadData", 8);
}

const char *sub_24B6A466C()
{
  return "DoWork";
}

const char *sub_24B6A468C()
{
  return "TotalRuntime";
}

lighthouse_runtime::LRSignpostName_optional __swiftcall LRSignpostName.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  lighthouse_runtime::LRSignpostName_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24B6ADED0();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t LRSignpostName.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aLoaddatadowork[8 * *v0];
}

uint64_t sub_24B6A471C(char *a1, char *a2)
{
  return sub_24B6A3D3C(*a1, *a2);
}

uint64_t sub_24B6A4728()
{
  return sub_24B6A4444();
}

uint64_t sub_24B6A4730()
{
  return sub_24B6A44F4();
}

uint64_t sub_24B6A4738()
{
  return sub_24B6A453C();
}

lighthouse_runtime::LRSignpostName_optional sub_24B6A4740(Swift::String *a1)
{
  return LRSignpostName.init(rawValue:)(*a1);
}

uint64_t sub_24B6A474C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LRSignpostName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24B6A4770()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_24B6A4798 + 4 * byte_24B6AE7A4[*v0]))("LoadData", 8);
}

const char *sub_24B6A4798()
{
  return "DoWork";
}

const char *sub_24B6A47B8()
{
  return "TotalRuntime";
}

void createSignposter(subsystem:category:)()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v0 = objc_allocWithZone(MEMORY[0x24BE60C98]);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_24B6ADD08();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithName_, v1);

  v3 = objc_allocWithZone(MEMORY[0x24BE60C90]);
  swift_bridgeObjectRetain();
  v4 = v2;
  v5 = (void *)sub_24B6ADD08();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithName_subsystem_, v5, v4);

  objc_msgSend(v6, sel_setSignpostPersisted_, 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24B6ADC48();

}

uint64_t sub_24B6A4904(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t sub_24B6A4914(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return swift_release();
}

uint64_t sub_24B6A4924(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return swift_release();
}

_QWORD *LighthouseRuntime.init(_:)(void *a1)
{
  _QWORD *v2;

  v2 = sub_24B6A98BC(a1);

  return v2;
}

void sub_24B6A4960(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[2];

  v2 = v1;
  v4 = *v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5, v8);
  sub_24B6A362C(a1, (uint64_t)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2579ACFB0);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v4 + 80);
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(v4 + 88);
  *(_QWORD *)(v10 + 40) = *(_QWORD *)(v4 + 104);
  *(_QWORD *)(v10 + 48) = v2;
  sub_24B6A3230((uint64_t)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  v11 = objc_allocWithZone((Class)type metadata accessor for AsyncOperation());
  swift_retain();
  v12 = sub_24B6ACBCC((uint64_t)&unk_2579AD178, v10);
  swift_release();
  v13 = (void *)v2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD180);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_24B6AEC40;
  *(_QWORD *)(v14 + 32) = v12;
  v19[1] = v14;
  sub_24B6ADD5C();
  sub_24B6A9E04();
  v15 = (char *)v12;
  v16 = (void *)sub_24B6ADD44();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_addOperations_waitUntilFinished_, v16, 1);

  v17 = *(void **)&v15[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error];
  if (v17)
  {
    v18 = v17;
    swift_willThrow();
  }

}

uint64_t sub_24B6A4B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24B6A0F78;
  return sub_24B6A4B84(1000, a2);
}

uint64_t sub_24B6A4B84(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  v3[12] = *v2;
  v4 = sub_24B6ADC60();
  v3[13] = v4;
  v3[14] = *(_QWORD *)(v4 - 8);
  v3[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0);
  v3[16] = swift_task_alloc();
  v5 = type metadata accessor for PluginContext();
  v3[17] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[18] = v6;
  v3[19] = *(_QWORD *)(v6 + 64);
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  v7 = sub_24B6ADC30();
  v3[22] = v7;
  v3[23] = *(_QWORD *)(v7 - 8);
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24B6A4CC0()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint8_t *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;

  *(_QWORD *)(v0 + 216) = qword_2579AD198;
  sub_24B6ADC24();
  v1 = sub_24B6ADC3C();
  v2 = sub_24B6ADE4C();
  if ((sub_24B6ADE58() & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 200);
    v4 = *(_QWORD *)(v0 + 176);
    v5 = *(_QWORD *)(v0 + 184);
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v6(v3, *(_QWORD *)(v0 + 208), v4);
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    v8 = sub_24B6ADC18();
    _os_signpost_emit_with_name_impl(&dword_24B69F000, v1, v2, v8, "TotalRuntime", "", v7, 2u);
    MEMORY[0x24BD252AC](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 184);

    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  }
  *(_QWORD *)(v0 + 224) = v6;
  v10 = *(_QWORD *)(v0 + 208);
  v11 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 184);
  v13 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 144);
  v15 = *(_QWORD *)(v0 + 128);
  v16 = *(_QWORD *)(v0 + 80);
  v6(*(_QWORD *)(v0 + 200), v10, v11);
  sub_24B6ADC84();
  swift_allocObject();
  *(_QWORD *)(v0 + 232) = sub_24B6ADC78();
  v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  *(_QWORD *)(v0 + 240) = v17;
  v17(v10, v11);
  sub_24B6A362C(v16, v15, &qword_2579ACFB0);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v13);
  v19 = *(_QWORD *)(v0 + 128);
  if (v18 == 1)
  {
    sub_24B6A824C(*(_QWORD **)(v0 + 168));
    sub_24B6A36A8(v19, &qword_2579ACFB0);
  }
  else
  {
    sub_24B6A9FC4(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 168));
  }
  v20 = *(_QWORD *)(v0 + 168);
  v21 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 248) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + qword_2579AD1A0);
  *(_BYTE *)(v0 + 42) = 0;
  v22 = *(int *)(v21 + 36);
  *(_DWORD *)(v0 + 44) = v22;
  v23 = *(void **)(v20 + v22);
  *(_QWORD *)(v0 + 256) = v23;
  sub_24B6ADBF4();
  sub_24B6A9E40();
  v24 = v23;
  *(_QWORD *)(v0 + 264) = sub_24B6ADD68();
  *(_QWORD *)(v0 + 272) = v25;
  return swift_task_switch();
}

uint64_t sub_24B6A4F30()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 256);
  *(_QWORD *)(v0 + 280) = sub_24B6A9E88();
  sub_24B6ADBDC();

  return swift_task_switch();
}

uint64_t sub_24B6A4FC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v31;

  v1 = sub_24B6ADBB8();
  v3 = v2;
  v31 = v1;
  *(_QWORD *)(v0 + 288) = v1;
  *(_QWORD *)(v0 + 296) = v2;
  v4 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v5 = (void *)sub_24B6ADCF0();
  *(_QWORD *)(v0 + 48) = 0;
  v6 = objc_msgSend(v4, sel_dataWithJSONObject_options_error_, v5, 0, v0 + 48);

  v7 = *(id *)(v0 + 48);
  if (!v6)
  {
    v11 = v7;
    v12 = (void *)sub_24B6ADB94();

    swift_willThrow();
    swift_bridgeObjectRelease();
LABEL_4:
    v13 = *(_QWORD *)(v0 + 72);
    goto LABEL_5;
  }
  v8 = sub_24B6ADBAC();
  v10 = v9;

  sub_24B6ADB88();
  swift_allocObject();
  sub_24B6ADB7C();
  sub_24B6AA170();
  sub_24B6ADB70();
  sub_24B6AA1B4(v8, v10);
  swift_release();
  *(_BYTE *)(v0 + 41) = 0;
  swift_bridgeObjectRelease();
  if (*(_BYTE *)(v0 + 41) == 1)
    goto LABEL_4;
  if ((*(_QWORD *)(v0 + 24) & 1) != 0)
  {
    if ((*(_BYTE *)(v0 + 40) & 1) != 0)
      v13 = *(_QWORD *)(v0 + 72);
    else
      v13 = *(_QWORD *)(v0 + 32);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 16);
  }
LABEL_5:
  if (qword_2579ACDF8 != -1)
    swift_once();
  v14 = sub_24B6ADCB4();
  __swift_project_value_buffer(v14, (uint64_t)qword_2579AE178);
  v15 = sub_24B6ADC9C();
  v16 = sub_24B6ADDEC();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v17 = 134217984;
    *(_QWORD *)(v0 + 64) = v13;
    sub_24B6ADE70();
    _os_log_impl(&dword_24B69F000, v15, v16, "Running task with timeout %llu", v17, 0xCu);
    MEMORY[0x24BD252AC](v17, -1, -1);
  }
  v19 = *(_QWORD *)(v0 + 160);
  v18 = *(_QWORD *)(v0 + 168);
  v21 = *(_QWORD *)(v0 + 144);
  v20 = *(_QWORD *)(v0 + 152);
  v23 = *(_QWORD *)(v0 + 88);
  v22 = *(_QWORD *)(v0 + 96);

  sub_24B6A309C(v18, v19);
  v24 = (*(unsigned __int8 *)(v21 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v25 = (v20 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = swift_allocObject();
  *(_QWORD *)(v0 + 304) = v26;
  *(_QWORD *)(v26 + 16) = *(_QWORD *)(v22 + 80);
  *(_OWORD *)(v26 + 24) = *(_OWORD *)(v22 + 88);
  *(_QWORD *)(v26 + 40) = *(_QWORD *)(v22 + 104);
  sub_24B6A9FC4(v19, v26 + v24);
  *(_QWORD *)(v26 + v25) = v23;
  v27 = (uint64_t *)(v26 + ((v25 + 15) & 0xFFFFFFFFFFFFFFF8));
  *v27 = v31;
  v27[1] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  v28 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v28;
  v28[2] = &unk_2579AD1C0;
  v28[3] = v26;
  v28[4] = v13;
  v29 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v29;
  *v29 = v0;
  v29[1] = sub_24B6A53B4;
  return sub_24B6ADEDC();
}

uint64_t sub_24B6A53B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_24B6A5474()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 168);
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_release();
  sub_24B6AA134(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6A5568()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  NSObject *v3;
  os_signpost_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  char *format;
  void (*v24)(uint64_t, uint64_t);
  os_signpost_type_t v25;
  uint64_t v26[2];

  v1 = v0;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(v0 + 192);
  swift_bridgeObjectRetain();
  v3 = sub_24B6ADC3C();
  sub_24B6ADC6C();
  v4 = sub_24B6ADE40();
  if ((sub_24B6ADE58() & 1) != 0)
  {
    v25 = v4;
    v5 = *(_QWORD *)(v1 + 112);
    v6 = *(_QWORD *)(v1 + 120);
    v7 = *(_QWORD *)(v1 + 104);
    swift_retain();
    sub_24B6ADC90();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v6, v7) == *MEMORY[0x24BEE7810])
    {
      v8 = 0;
      v9 = 0;
      format = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 112) + 8))(*(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 104));
      format = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
      v9 = 2;
      v8 = 1;
    }
    v2 = (uint64_t *)(v1 + 200);
    v11 = *(_QWORD *)(v1 + 288);
    v10 = *(_QWORD *)(v1 + 296);
    v24 = *(void (**)(uint64_t, uint64_t))(v1 + 240);
    v21 = *(_QWORD *)(v1 + 176);
    v22 = *(_QWORD *)(v1 + 192);
    (*(void (**)(_QWORD))(v1 + 224))(*(_QWORD *)(v1 + 200));
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v26[0] = v13;
    *(_BYTE *)v12 = v9;
    *(_BYTE *)(v12 + 1) = v8;
    *(_WORD *)(v12 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v1 + 56) = sub_24B6A9138(v11, v10, v26);
    sub_24B6ADE70();
    swift_bridgeObjectRelease_n();
    v14 = sub_24B6ADC18();
    _os_signpost_emit_with_name_impl(&dword_24B69F000, v3, v25, v14, "TotalRuntime", format, (uint8_t *)v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD252AC](v13, -1, -1);
    MEMORY[0x24BD252AC](v12, -1, -1);

    v24(v22, v21);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v15 = *v2;
  v16 = *(int *)(v1 + 44);
  v17 = *(_QWORD *)(v1 + 168);
  (*(void (**)(uint64_t, _QWORD))(v1 + 240))(v15, *(_QWORD *)(v1 + 176));
  *(_BYTE *)(v1 + 43) = 4;
  v18 = *(void **)(v17 + v16);
  *(_QWORD *)(v1 + 336) = v18;
  v19 = v18;
  return swift_task_switch();
}

uint64_t sub_24B6A5824()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 336);
  sub_24B6ADBDC();

  return swift_task_switch();
}

uint64_t sub_24B6A58B0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 168);
  swift_release();
  sub_24B6AA134(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6A5978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0);
  v5[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24B6A59DC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int8x16_t *v5;
  _QWORD *v6;
  int8x16_t v8;

  if (qword_2579ACDF0 != -1)
    swift_once();
  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[5];
  v8 = *(int8x16_t *)(v0 + 3);
  sub_24B6A309C(v0[3], v1);
  v4 = type metadata accessor for PluginContext();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v1, 0, 1, v4);
  v5 = (int8x16_t *)swift_task_alloc();
  v0[8] = (uint64_t)v5;
  v5[1] = vextq_s8(v8, v8, 8uLL);
  v5[2].i64[0] = v3;
  v5[2].i64[1] = v2;
  v6 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_24B6A5B10;
  return sub_24B6ADFA8();
}

uint64_t sub_24B6A5B10()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 56);
  v3 = *v1;
  *(_QWORD *)(v3 + 80) = v0;
  swift_task_dealloc();
  sub_24B6A36A8(v2, &qword_2579ACFB0);
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_24B6A5BAC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6A5BE0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  v6 = *a2;
  v7 = *(_QWORD *)(*a2 + 88);
  v5[13] = v7;
  v8 = sub_24B6ADE64();
  v5[14] = v8;
  v5[15] = *(_QWORD *)(v8 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = *(_QWORD *)(v7 - 8);
  v5[18] = swift_task_alloc();
  v9 = sub_24B6ADC60();
  v5[19] = v9;
  v5[20] = *(_QWORD *)(v9 - 8);
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = swift_task_alloc();
  v10 = *(_QWORD *)(v6 + 80);
  v5[26] = v10;
  v11 = sub_24B6ADE64();
  v5[27] = v11;
  v5[28] = *(_QWORD *)(v11 - 8);
  v5[29] = swift_task_alloc();
  v5[30] = *(_QWORD *)(v10 - 8);
  v5[31] = swift_task_alloc();
  v12 = sub_24B6ADC30();
  v5[32] = v12;
  v5[33] = *(_QWORD *)(v12 - 8);
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  v5[36] = swift_task_alloc();
  v5[37] = swift_task_alloc();
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  v5[41] = swift_task_alloc();
  v5[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24B6A5DA8()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint8_t *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;

  sub_24B6ADDB0();
  *(_QWORD *)(v0 + 344) = qword_2579AD198;
  sub_24B6ADC24();
  v1 = sub_24B6ADC3C();
  v2 = sub_24B6ADE4C();
  if ((sub_24B6ADE58() & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 328);
    v4 = *(_QWORD *)(v0 + 256);
    v5 = *(_QWORD *)(v0 + 264);
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v6(v3, *(_QWORD *)(v0 + 336), v4);
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    v8 = sub_24B6ADC18();
    _os_signpost_emit_with_name_impl(&dword_24B69F000, v1, (os_signpost_type_t)v2, v8, "LoadData", "", v7, 2u);
    MEMORY[0x24BD252AC](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 264);

    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  }
  *(_QWORD *)(v0 + 352) = v6;
  v10 = *(_QWORD *)(v0 + 336);
  v11 = *(_QWORD *)(v0 + 256);
  v12 = *(_QWORD *)(v0 + 264);
  v14 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 80);
  v6(*(_QWORD *)(v0 + 328), v10, v11);
  *(_QWORD *)(v0 + 360) = sub_24B6ADC84();
  swift_allocObject();
  *(_QWORD *)(v0 + 368) = sub_24B6ADC78();
  v15 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  *(_QWORD *)(v0 + 376) = v15;
  v15(v10, v11);
  *(_QWORD *)(v0 + 384) = *(_QWORD *)(v14 + qword_2579AD1A0);
  *(_BYTE *)(v0 + 534) = 1;
  v16 = *(int *)(type metadata accessor for PluginContext() + 36);
  *(_DWORD *)(v0 + 528) = v16;
  *(_QWORD *)(v0 + 392) = *(_QWORD *)(v13 + v16);
  sub_24B6ADBF4();
  sub_24B6A9E40();
  *(_QWORD *)(v0 + 400) = sub_24B6ADD68();
  *(_QWORD *)(v0 + 408) = v17;
  return swift_task_switch();
}

uint64_t sub_24B6A608C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 416) = sub_24B6A9E88();
  sub_24B6ADBDC();
  return swift_task_switch();
}

uint64_t sub_24B6A60F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_signpost_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  const char *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_signpost_id_t v19;
  _BYTE *v20;
  char *format;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  os_signpost_type_t v25;
  uint64_t v26[2];

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 72) + 16);
  *(_QWORD *)(v0 + 424) = v1;
  if (v1)
  {
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 432) = v2;
    *v2 = v0;
    v2[1] = sub_24B6A652C;
    return sub_24B6A3844(*(_QWORD *)(v0 + 232));
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 232);
    v5 = *(_QWORD *)(v0 + 216);
    v6 = *(_QWORD *)(v0 + 224);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 240) + 56))(v4, 1, 1, *(_QWORD *)(v0 + 208));
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    swift_bridgeObjectRetain_n();
    v7 = sub_24B6ADC3C();
    sub_24B6ADC6C();
    v8 = sub_24B6ADE40();
    if ((sub_24B6ADE58() & 1) != 0)
    {
      v25 = v8;
      v9 = *(_QWORD *)(v0 + 160);
      v10 = *(_QWORD *)(v0 + 168);
      v11 = *(_QWORD *)(v0 + 152);
      swift_retain();
      sub_24B6ADC90();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v9 + 88))(v10, v11) == *MEMORY[0x24BEE7810])
      {
        v12 = 0;
        v13 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));
        v13 = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\n"
              "errorMessage=%{public, signpost.telemetry:string2, name=errorMessage,public}s\n"
              "enableTelemetry=YES";
        v12 = 2;
      }
      format = (char *)v13;
      v14 = (_QWORD *)(v0 + 328);
      v23 = *(_QWORD *)(v0 + 320);
      v24 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
      v22 = *(_QWORD *)(v0 + 256);
      v16 = *(_QWORD *)(v0 + 88);
      v15 = *(_QWORD *)(v0 + 96);
      (*(void (**)(_QWORD))(v0 + 352))(*(_QWORD *)(v0 + 328));
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v26[0] = v18;
      *(_BYTE *)v17 = v12;
      *(_BYTE *)(v17 + 1) = v12;
      *(_WORD *)(v17 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 24) = sub_24B6A9138(v16, v15, v26);
      sub_24B6ADE70();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 2082;
      *(_QWORD *)(v0 + 56) = sub_24B6A9138(0xD000000000000014, 0x800000024B6AF2D0, v26);
      sub_24B6ADE70();
      v19 = sub_24B6ADC18();
      _os_signpost_emit_with_name_impl(&dword_24B69F000, v7, v25, v19, "LoadData", format, (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24BD252AC](v18, -1, -1);
      MEMORY[0x24BD252AC](v17, -1, -1);

      v24(v23, v22);
    }
    else
    {
      v14 = (_QWORD *)(v0 + 320);
      swift_bridgeObjectRelease_n();

    }
    (*(void (**)(_QWORD, _QWORD))(v0 + 376))(*v14, *(_QWORD *)(v0 + 256));
    sub_24B6AB280();
    swift_allocError();
    *v20 = 0;
    swift_willThrow();
    swift_release();
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
}

uint64_t sub_24B6A652C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 440) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_24B6A6598()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  NSObject *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  os_signpost_id_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *format;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  os_signpost_type_t v36;
  uint64_t v37;

  v2 = *(_QWORD *)(v0 + 240);
  v1 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 208);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
  swift_bridgeObjectRetain_n();
  v5 = sub_24B6ADC3C();
  sub_24B6ADC6C();
  v6 = sub_24B6ADE40();
  if ((sub_24B6ADE58() & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 200);
    v9 = *(_QWORD *)(v0 + 152);
    v8 = *(_QWORD *)(v0 + 160);
    swift_retain();
    sub_24B6ADC90();
    swift_release();
    v36 = v6;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x24BEE7810])
    {
      v10 = 0;
      v11 = 0;
      format = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 152));
      format = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
      v11 = 2;
      v10 = 1;
    }
    v12 = (_QWORD *)(v0 + 328);
    v34 = *(_QWORD *)(v0 + 312);
    v35 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    v33 = *(_QWORD *)(v0 + 256);
    v14 = *(_QWORD *)(v0 + 88);
    v13 = *(_QWORD *)(v0 + 96);
    (*(void (**)(_QWORD))(v0 + 352))(*(_QWORD *)(v0 + 328));
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v37 = v16;
    *(_BYTE *)v15 = v11;
    *(_BYTE *)(v15 + 1) = v10;
    *(_WORD *)(v15 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = sub_24B6A9138(v14, v13, &v37);
    sub_24B6ADE70();
    swift_bridgeObjectRelease_n();
    v17 = sub_24B6ADC18();
    _os_signpost_emit_with_name_impl(&dword_24B69F000, v5, v36, v17, "LoadData", format, (uint8_t *)v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD252AC](v16, -1, -1);
    MEMORY[0x24BD252AC](v15, -1, -1);

    v35(v34, v33);
  }
  else
  {
    v12 = (_QWORD *)(v0 + 312);
    swift_bridgeObjectRelease_n();

  }
  v18 = *(_QWORD *)(v0 + 440);
  (*(void (**)(_QWORD, _QWORD))(v0 + 376))(*v12, *(_QWORD *)(v0 + 256));
  sub_24B6ADDB0();
  if (v18)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 208));
    swift_release();
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
  else
  {
    sub_24B6ADC24();
    v20 = sub_24B6ADC3C();
    v21 = sub_24B6ADE4C();
    if ((sub_24B6ADE58() & 1) != 0)
    {
      v22 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
      v23 = *(_QWORD *)(v0 + 328);
      v24 = *(_QWORD *)(v0 + 256);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 352))(v23, *(_QWORD *)(v0 + 304), v24);
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      v26 = sub_24B6ADC18();
      _os_signpost_emit_with_name_impl(&dword_24B69F000, v20, (os_signpost_type_t)v21, v26, "DoWork", "", v25, 2u);
      MEMORY[0x24BD252AC](v25, -1, -1);

      v22(v23, v24);
    }
    else
    {

    }
    v27 = *(int *)(v0 + 528);
    v28 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    v29 = *(_QWORD *)(v0 + 304);
    v30 = *(_QWORD *)(v0 + 256);
    v31 = *(_QWORD *)(v0 + 80);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 352))(*(_QWORD *)(v0 + 328), v29, v30);
    swift_allocObject();
    *(_QWORD *)(v0 + 448) = sub_24B6ADC78();
    v28(v29, v30);
    *(_BYTE *)(v0 + 533) = 2;
    *(_QWORD *)(v0 + 456) = *(_QWORD *)(v31 + v27);
    return swift_task_switch();
  }
}

uint64_t sub_24B6A6A98()
{
  sub_24B6ADBDC();
  return swift_task_switch();
}

uint64_t sub_24B6A6AE8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_signpost_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  const char *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_signpost_id_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  os_signpost_type_t v29;
  uint64_t v30[2];

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24);
  *(_QWORD *)(v0 + 464) = v1;
  if (v1)
  {
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 472) = v2;
    *v2 = v0;
    v2[1] = sub_24B6A6F58;
    return sub_24B6A15CC(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 248));
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 128);
    v5 = *(_QWORD *)(v0 + 112);
    v6 = *(_QWORD *)(v0 + 120);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 136) + 56))(v4, 1, 1, *(_QWORD *)(v0 + 104));
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    swift_bridgeObjectRetain_n();
    v7 = sub_24B6ADC3C();
    sub_24B6ADC6C();
    v8 = sub_24B6ADE40();
    if ((sub_24B6ADE58() & 1) != 0)
    {
      v29 = v8;
      v9 = *(_QWORD *)(v0 + 176);
      v11 = *(_QWORD *)(v0 + 152);
      v10 = *(_QWORD *)(v0 + 160);
      swift_retain();
      sub_24B6ADC90();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v9, v11) == *MEMORY[0x24BEE7810])
      {
        v12 = 0;
        v13 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 152));
        v13 = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\n"
              "errorMessage=%{public, signpost.telemetry:string2, name=errorMessage,public}s\n"
              "enableTelemetry=YES";
        v12 = 2;
      }
      v25 = v13;
      v27 = *(_QWORD *)(v0 + 296);
      v28 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
      v26 = *(_QWORD *)(v0 + 256);
      v15 = *(_QWORD *)(v0 + 88);
      v16 = *(_QWORD *)(v0 + 96);
      (*(void (**)(_QWORD))(v0 + 352))(*(_QWORD *)(v0 + 328));
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v30[0] = v18;
      *(_BYTE *)v17 = v12;
      *(_BYTE *)(v17 + 1) = v12;
      *(_WORD *)(v17 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 16) = sub_24B6A9138(v15, v16, v30);
      sub_24B6ADE70();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 2082;
      *(_QWORD *)(v0 + 64) = sub_24B6A9138(0xD000000000000015, 0x800000024B6AF2B0, v30);
      sub_24B6ADE70();
      v19 = sub_24B6ADC18();
      v14 = (uint64_t *)(v0 + 328);
      _os_signpost_emit_with_name_impl(&dword_24B69F000, v7, v29, v19, "LoadData", v25, (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24BD252AC](v18, -1, -1);
      MEMORY[0x24BD252AC](v17, -1, -1);

      v28(v27, v26);
    }
    else
    {
      v14 = (uint64_t *)(v0 + 296);
      swift_bridgeObjectRelease_n();

    }
    v20 = *v14;
    v21 = *(_QWORD *)(v0 + 248);
    v22 = *(_QWORD *)(v0 + 240);
    v23 = *(_QWORD *)(v0 + 208);
    (*(void (**)(uint64_t, _QWORD))(v0 + 376))(v20, *(_QWORD *)(v0 + 256));
    sub_24B6AB280();
    swift_allocError();
    *v24 = 1;
    swift_willThrow();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
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
}

uint64_t sub_24B6A6F58()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 480) = v0;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_24B6A6FC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  os_signpost_id_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *format;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  os_signpost_type_t v42;
  uint64_t v43;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 104);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
  swift_bridgeObjectRetain_n();
  v5 = sub_24B6ADC3C();
  sub_24B6ADC6C();
  v6 = sub_24B6ADE40();
  if ((sub_24B6ADE58() & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 192);
    v9 = *(_QWORD *)(v0 + 152);
    v8 = *(_QWORD *)(v0 + 160);
    swift_retain();
    sub_24B6ADC90();
    swift_release();
    v42 = v6;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x24BEE7810])
    {
      v10 = 0;
      v11 = 0;
      format = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 152));
      format = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
      v11 = 2;
      v10 = 1;
    }
    v12 = (_QWORD *)(v0 + 328);
    v40 = *(_QWORD *)(v0 + 288);
    v41 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    v39 = *(_QWORD *)(v0 + 256);
    v14 = *(_QWORD *)(v0 + 88);
    v13 = *(_QWORD *)(v0 + 96);
    (*(void (**)(_QWORD))(v0 + 352))(*(_QWORD *)(v0 + 328));
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v43 = v16;
    *(_BYTE *)v15 = v11;
    *(_BYTE *)(v15 + 1) = v10;
    *(_WORD *)(v15 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 48) = sub_24B6A9138(v14, v13, &v43);
    sub_24B6ADE70();
    swift_bridgeObjectRelease_n();
    v17 = sub_24B6ADC18();
    _os_signpost_emit_with_name_impl(&dword_24B69F000, v5, v42, v17, "DoWork", format, (uint8_t *)v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD252AC](v16, -1, -1);
    MEMORY[0x24BD252AC](v15, -1, -1);

    v41(v40, v39);
  }
  else
  {
    v12 = (_QWORD *)(v0 + 288);
    swift_bridgeObjectRelease_n();

  }
  v18 = *(_QWORD *)(v0 + 480);
  (*(void (**)(_QWORD, _QWORD))(v0 + 376))(*v12, *(_QWORD *)(v0 + 256));
  sub_24B6ADDB0();
  if (v18)
  {
    v20 = *(_QWORD *)(v0 + 240);
    v19 = *(_QWORD *)(v0 + 248);
    v21 = *(_QWORD *)(v0 + 208);
    v23 = *(_QWORD *)(v0 + 136);
    v22 = *(_QWORD *)(v0 + 144);
    v24 = *(_QWORD *)(v0 + 104);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
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
  else
  {
    sub_24B6ADC24();
    v26 = sub_24B6ADC3C();
    v27 = sub_24B6ADE4C();
    if ((sub_24B6ADE58() & 1) != 0)
    {
      v28 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
      v29 = *(_QWORD *)(v0 + 328);
      v30 = *(_QWORD *)(v0 + 256);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 352))(v29, *(_QWORD *)(v0 + 280), v30);
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      v32 = sub_24B6ADC18();
      _os_signpost_emit_with_name_impl(&dword_24B69F000, v26, (os_signpost_type_t)v27, v32, "Report", "", v31, 2u);
      MEMORY[0x24BD252AC](v31, -1, -1);

      v28(v29, v30);
    }
    else
    {

    }
    v33 = *(int *)(v0 + 528);
    v34 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    v35 = *(_QWORD *)(v0 + 280);
    v36 = *(_QWORD *)(v0 + 256);
    v37 = *(_QWORD *)(v0 + 80);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 352))(*(_QWORD *)(v0 + 328), v35, v36);
    swift_allocObject();
    *(_QWORD *)(v0 + 488) = sub_24B6ADC78();
    v34(v35, v36);
    *(_BYTE *)(v0 + 532) = 3;
    *(_QWORD *)(v0 + 496) = *(_QWORD *)(v37 + v33);
    return swift_task_switch();
  }
}

uint64_t sub_24B6A74E8()
{
  sub_24B6ADBDC();
  return swift_task_switch();
}

uint64_t sub_24B6A7538()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  os_signpost_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_signpost_id_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  os_signpost_type_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 72) + 32);
  *(_QWORD *)(v0 + 504) = v1;
  if (v1)
  {
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 512) = v2;
    *v2 = v0;
    v2[1] = sub_24B6A79B8;
    return sub_24B6A0FC0(*(_QWORD *)(v0 + 144));
  }
  else
  {
    swift_bridgeObjectRetain_n();
    v4 = sub_24B6ADC3C();
    sub_24B6ADC6C();
    v5 = sub_24B6ADE40();
    if ((sub_24B6ADE58() & 1) != 0)
    {
      v35 = v5;
      v37 = v4;
      v6 = *(_QWORD *)(v0 + 184);
      v8 = *(_QWORD *)(v0 + 152);
      v7 = *(_QWORD *)(v0 + 160);
      swift_retain();
      sub_24B6ADC90();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v7 + 88))(v6, v8) == *MEMORY[0x24BEE7810])
      {
        v9 = 0;
        v10 = 0;
        v11 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 152));
        v11 = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
        v10 = 2;
        v9 = 1;
      }
      v18 = *(_QWORD *)(v0 + 328);
      v25 = *(_QWORD *)(v0 + 272);
      v19 = *(_QWORD *)(v0 + 256);
      v33 = *(_QWORD *)(v0 + 248);
      v29 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
      v30 = *(_QWORD *)(v0 + 240);
      v31 = *(_QWORD *)(v0 + 208);
      v26 = *(_QWORD *)(v0 + 136);
      v20 = *(_QWORD *)(v0 + 96);
      v27 = *(_QWORD *)(v0 + 104);
      v28 = *(_QWORD *)(v0 + 144);
      v21 = *(_QWORD *)(v0 + 88);
      (*(void (**)(uint64_t))(v0 + 352))(v18);
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v39 = v23;
      *(_BYTE *)v22 = v10;
      *(_BYTE *)(v22 + 1) = v9;
      *(_WORD *)(v22 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 40) = sub_24B6A9138(v21, v20, &v39);
      sub_24B6ADE70();
      swift_bridgeObjectRelease_n();
      v24 = sub_24B6ADC18();
      _os_signpost_emit_with_name_impl(&dword_24B69F000, v37, v35, v24, "Report", v11, (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD252AC](v23, -1, -1);
      MEMORY[0x24BD252AC](v22, -1, -1);

      swift_release();
      swift_release();
      v29(v25, v19);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v33, v31);
      swift_release();
      v29(v18, v19);
    }
    else
    {
      v32 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
      v12 = *(_QWORD *)(v0 + 272);
      v13 = *(_QWORD *)(v0 + 256);
      v38 = *(_QWORD *)(v0 + 248);
      v34 = *(_QWORD *)(v0 + 240);
      v36 = *(_QWORD *)(v0 + 208);
      v14 = *(_QWORD *)(v0 + 136);
      v15 = *(_QWORD *)(v0 + 144);
      v16 = (void *)v4;
      v17 = *(_QWORD *)(v0 + 104);

      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();
      v32(v12, v13);
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v17);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v38, v36);
      swift_release();
    }
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
}

uint64_t sub_24B6A79B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 520) = v0;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_24B6A7A24()
{
  uint64_t v0;
  uint64_t v1;
  os_signpost_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_signpost_id_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  os_signpost_type_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;

  swift_bridgeObjectRetain_n();
  v1 = sub_24B6ADC3C();
  sub_24B6ADC6C();
  v2 = sub_24B6ADE40();
  if ((sub_24B6ADE58() & 1) != 0)
  {
    v33 = v2;
    v35 = v1;
    v3 = *(_QWORD *)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 152);
    v4 = *(_QWORD *)(v0 + 160);
    swift_retain();
    sub_24B6ADC90();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5) == *MEMORY[0x24BEE7810])
    {
      v6 = 0;
      v7 = 0;
      v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 152));
      v8 = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
      v7 = 2;
      v6 = 1;
    }
    v15 = *(_QWORD *)(v0 + 328);
    v23 = *(_QWORD *)(v0 + 272);
    v16 = *(_QWORD *)(v0 + 256);
    v31 = *(_QWORD *)(v0 + 248);
    v27 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    v28 = *(_QWORD *)(v0 + 240);
    v29 = *(_QWORD *)(v0 + 208);
    v24 = *(_QWORD *)(v0 + 136);
    v17 = *(_QWORD *)(v0 + 96);
    v25 = *(_QWORD *)(v0 + 104);
    v26 = *(_QWORD *)(v0 + 144);
    v18 = *(_QWORD *)(v0 + 88);
    (*(void (**)(uint64_t))(v0 + 352))(v15);
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v37 = v20;
    *(_BYTE *)v19 = v7;
    *(_BYTE *)(v19 + 1) = v6;
    *(_WORD *)(v19 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_24B6A9138(v18, v17, &v37);
    sub_24B6ADE70();
    swift_bridgeObjectRelease_n();
    v21 = sub_24B6ADC18();
    _os_signpost_emit_with_name_impl(&dword_24B69F000, v35, v33, v21, "Report", v8, (uint8_t *)v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD252AC](v20, -1, -1);
    MEMORY[0x24BD252AC](v19, -1, -1);

    swift_release();
    swift_release();
    v27(v23, v16);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v31, v29);
    swift_release();
    v27(v15, v16);
  }
  else
  {
    v30 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    v9 = *(_QWORD *)(v0 + 272);
    v10 = *(_QWORD *)(v0 + 256);
    v36 = *(_QWORD *)(v0 + 248);
    v32 = *(_QWORD *)(v0 + 240);
    v34 = *(_QWORD *)(v0 + 208);
    v11 = *(_QWORD *)(v0 + 136);
    v12 = *(_QWORD *)(v0 + 144);
    v13 = (void *)v1;
    v14 = *(_QWORD *)(v0 + 104);

    swift_release();
    swift_release();
    swift_bridgeObjectRelease_n();
    v30(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v14);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v36, v34);
    swift_release();
  }
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

uint64_t sub_24B6A7E44()
{
  uint64_t v0;

  swift_release();
  swift_release();
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

uint64_t sub_24B6A7F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 240);
  v1 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 208);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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

uint64_t sub_24B6A80D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 240);
  v1 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 104);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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

uint64_t sub_24B6A824C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  LighthouseRuntime.trialId.getter();
  v3 = v2;
  v4 = LighthouseRuntime.parameters.getter();
  v5 = LighthouseRuntime.attachments.getter();
  v6 = LighthouseRuntime.trialNamespace.getter();
  v8 = v7;
  v9 = objc_allocWithZone((Class)sub_24B6ADC0C());
  v10 = sub_24B6ADC00();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v8;
  v11 = type metadata accessor for PluginContext();
  result = sub_24B6ADBC4();
  *(_QWORD *)((char *)a1 + *(int *)(v11 + 36)) = v10;
  return result;
}

void LighthouseRuntime.trialId.getter()
{
  id v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v0 = LighthouseRuntime.trialClient.getter();

  if (!v0)
  {
    v6 = objc_allocWithZone(MEMORY[0x24BEBA8F8]);
    v7 = (void *)sub_24B6ADD08();
    v8 = (void *)sub_24B6ADD08();
    objc_msgSend(v6, sel_initWithBMLTTaskId_deploymentId_treatmentId_, v7, 0, v8);

    return;
  }
  v1 = LighthouseRuntime.trialClient.getter();
  if (!v1)
  {
    __break(1u);
    goto LABEL_8;
  }
  v2 = v1;
  LighthouseRuntime.trialNamespace.getter();
  if (!v3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v4 = (void *)sub_24B6ADD08();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_backgroundMLTaskIdentifiersWithNamespaceName_, v4);

  if (!v5)
LABEL_9:
    __break(1u);
}

unint64_t LighthouseRuntime.parameters.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(void **)(v0 + qword_2579AE170);
  if (v1
    && (v2 = objc_msgSend(v1, sel_parameters),
        v3 = objc_msgSend(v2, sel_dictionaryRepresentation),
        v2,
        v4 = sub_24B6ADCFC(),
        v3,
        v5 = sub_24B6A8678(v4),
        swift_bridgeObjectRelease(),
        v5))
  {
    return v5;
  }
  else
  {
    return sub_24B6A2AA0(MEMORY[0x24BEE4AF8]);
  }
}

uint64_t LighthouseRuntime.attachments.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;

  v1 = *(void **)(v0 + qword_2579AE170);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = objc_msgSend(v1, sel_attachments);
  v3 = objc_msgSend(v2, sel_attachmentURLs);

  sub_24B6ADBA0();
  v4 = sub_24B6ADD50();

  return v4;
}

uint64_t LighthouseRuntime.trialNamespace.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + qword_2579AE170);
  if (v1)
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_mlr_namespaceNameWithMLRTask_, v1);
    if (v2)
    {
      v3 = v2;
      v1 = sub_24B6ADD14();

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t LighthouseRuntime.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  swift_release();

  v1 = v0 + qword_2579AD198;
  v2 = sub_24B6ADC54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  return v0;
}

uint64_t LighthouseRuntime.__deallocating_deinit()
{
  LighthouseRuntime.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_24B6A8678(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD080);
    v2 = (_QWORD *)sub_24B6ADEB8();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_37;
      if (v13 >= v22)
      {
LABEL_33:
        sub_24B6A36A0();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v22)
          goto LABEL_33;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v22)
            goto LABEL_33;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v22)
              goto LABEL_33;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v22)
                goto LABEL_33;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_38;
                  if (v12 >= v22)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_24B6AB014(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_24B6AB050(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_24B6AB014((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_24B6A36A8((uint64_t)v30, &qword_2579AD370);
      swift_bridgeObjectRelease();
      sub_24B6A36A0();
      swift_release();
      return 0;
    }
    sub_24B6AB050((uint64_t)v31 + 8, (uint64_t)v25);
    sub_24B6A36A8((uint64_t)v30, &qword_2579AD370);
    sub_24B6A3670(v25, v26);
    v27 = v24;
    sub_24B6A3670(v26, v28);
    v16 = v27;
    sub_24B6A3670(v28, v29);
    sub_24B6A3670(v29, &v27);
    result = sub_24B6A9778(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      result = (unint64_t)sub_24B6A3670(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_24B6A3670(&v27, (_OWORD *)(v2[7] + 32 * result));
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_8:
    v7 = v12;
    v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

id LighthouseRuntime.trialClient.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + qword_2579AE170);
  if (v1)
    return objc_msgSend((id)objc_opt_self(), sel_mlr_clientWithMLRTask_, v1);
  else
    return 0;
}

uint64_t sub_24B6A8A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
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
  _QWORD *v17;
  _QWORD v19[4];
  _QWORD v20[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B6A362C(a1, (uint64_t)v10, &qword_2579ACFC8);
  v11 = sub_24B6ADD8C();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_24B6A36A8((uint64_t)v10, &qword_2579ACFC8);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_24B6ADD68();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24B6ADD80();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v17 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_24B6A8C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a2;
  v5[3] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  v5[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24B6A8C8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = v0[5];
  v1 = v0[6];
  v4 = v0[3];
  v3 = v0[4];
  v5 = sub_24B6ADD8C();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v6(v1, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v4;
  v7[5] = v3;
  swift_retain();
  sub_24B6A8A9C(v1, (uint64_t)&unk_2579AD388, (uint64_t)v7);
  sub_24B6A36A8(v1, &qword_2579ACFC8);
  v6(v1, 1, 1, v5);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v2;
  sub_24B6A8A9C(v1, (uint64_t)&unk_2579AD398, (uint64_t)v8);
  sub_24B6A36A8(v1, &qword_2579ACFC8);
  v9 = (_QWORD *)swift_task_alloc();
  v0[7] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD3A0);
  *v9 = v0;
  v9[1] = sub_24B6A8DF0;
  return sub_24B6ADDC8();
}

uint64_t sub_24B6A8DF0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24B6A8E54()
{
  uint64_t v0;
  uint64_t result;

  if ((*(_BYTE *)(v0 + 72) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
    sub_24B6ADDD4();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_24B6A8ECC()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
  sub_24B6ADDD4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6A8F38(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_24B6A1454;
  return v8(a1);
}

uint64_t sub_24B6A8F9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

void sub_24B6A8FB4()
{
  uint64_t v0;
  _QWORD *v1;

  if (is_mul_ok(*(_QWORD *)(v0 + 16), 0xF4240uLL))
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v1;
    *v1 = v0;
    v1[1] = sub_24B6A9020;
    sub_24B6ADDBC();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24B6A9020()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_24B6A908C()
{
  uint64_t v0;

  sub_24B6AB1C4();
  swift_allocError();
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6A90E4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24B6A90F4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_24B6A9128(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_24B6A9138(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24B6A9208(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24B6AB050((uint64_t)v12, *a3);
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
      sub_24B6AB050((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24B6A9208(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24B6ADE7C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24B6A93C0(a5, a6);
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
  v8 = sub_24B6ADEA0();
  if (!v8)
  {
    sub_24B6ADEAC();
    __break(1u);
LABEL_17:
    result = sub_24B6ADEC4();
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

uint64_t sub_24B6A93C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24B6A9454(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24B6A962C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24B6A962C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24B6A9454(uint64_t a1, unint64_t a2)
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
      v3 = sub_24B6A95C8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24B6ADE94();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24B6ADEAC();
      __break(1u);
LABEL_10:
      v2 = sub_24B6ADD38();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24B6ADEC4();
    __break(1u);
LABEL_14:
    result = sub_24B6ADEAC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24B6A95C8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD378);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24B6A962C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD378);
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
  result = sub_24B6ADEC4();
  __break(1u);
  return result;
}

unint64_t sub_24B6A9778(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24B6ADF3C();
  sub_24B6ADD2C();
  v4 = sub_24B6ADF54();
  return sub_24B6A97DC(a1, a2, v4);
}

unint64_t sub_24B6A97DC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24B6ADF00() & 1) == 0)
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
      while (!v14 && (sub_24B6ADF00() & 1) == 0);
    }
  }
  return v6;
}

_QWORD *sub_24B6A98BC(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v19;

  v2 = v1;
  v4 = sub_24B6ADC54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = 0;
  *(_QWORD *)((char *)v2 + qword_2579AE170) = a1;
  v9 = objc_allocWithZone(MEMORY[0x24BDD1710]);
  v10 = a1;
  v2[5] = objc_msgSend(v9, sel_init);
  v11 = objc_allocWithZone(MEMORY[0x24BE60C98]);
  v12 = (void *)sub_24B6ADD08();
  v13 = objc_msgSend(v11, sel_initWithName_, v12);

  v14 = objc_allocWithZone(MEMORY[0x24BE60C90]);
  v15 = v13;
  v16 = (void *)sub_24B6ADD08();
  v17 = objc_msgSend(v14, sel_initWithName_subsystem_, v16, v15);

  objc_msgSend(v17, sel_setSignpostPersisted_, 1);
  sub_24B6ADC48();

  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v2 + qword_2579AD198, v8, v4);
  sub_24B6ADBF4();
  *(_QWORD *)((char *)v2 + qword_2579AD1A0) = sub_24B6ADBE8();
  return v2;
}

void sub_24B6A9AA0()
{
  type metadata accessor for LighthouseRuntime();
}

_QWORD *sub_24B6A9AC8()
{
  void *v0;

  swift_allocObject();
  return sub_24B6A98BC(v0);
}

_QWORD *sub_24B6A9AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;

  v5 = v4;
  v9 = type metadata accessor for GenericDataProvider(0, *(_QWORD *)(*v5 + 80), *(_QWORD *)(*v5 + 96), a4);
  v5[2] = sub_24B6A398C(a1, a2, a3, v9);
  swift_release();
  return v5;
}

void sub_24B6A9B60()
{
  type metadata accessor for GenericWorker();
}

void sub_24B6A9B9C()
{
  sub_24B6A1770();
}

uint64_t sub_24B6A9BB4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  swift_release();
  return v1;
}

_QWORD *sub_24B6A9BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;

  v5 = v4;
  v9 = type metadata accessor for GenericReporter(0, *(_QWORD *)(*v5 + 88), *(_QWORD *)(*v5 + 104), a4);
  v5[4] = sub_24B6A1170(a1, a2, a3, v9);
  swift_release();
  return v5;
}

uint64_t type metadata accessor for PluginContext()
{
  uint64_t result;

  result = qword_2579AD2A0;
  if (!qword_2579AD2A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24B6A9C88()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0) - 8) + 80);
  swift_release();
  v2 = (id *)(v0 + ((v1 + 56) & ~v1));
  v3 = type metadata accessor for PluginContext();
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v2, 1, v3))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4 = (char *)v2 + *(int *)(v3 + 32);
    v5 = sub_24B6ADBD0();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  }
  return swift_deallocObject();
}

uint64_t sub_24B6A9D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB0) - 8) + 80);
  v3 = v0 + ((v2 + 56) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_24B6A1454;
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = sub_24B6A0F78;
  return sub_24B6A4B84(1000, v3);
}

unint64_t sub_24B6A9E04()
{
  unint64_t result;

  result = qword_2579AD188;
  if (!qword_2579AD188)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2579AD188);
  }
  return result;
}

unint64_t sub_24B6A9E40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2579AD1A8;
  if (!qword_2579AD1A8)
  {
    v1 = sub_24B6ADBF4();
    result = MEMORY[0x24BD25234](MEMORY[0x24BE5F6A8], v1);
    atomic_store(result, (unint64_t *)&qword_2579AD1A8);
  }
  return result;
}

unint64_t sub_24B6A9E88()
{
  unint64_t result;

  result = qword_2579AD1B0;
  if (!qword_2579AD1B0)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LHRStates, &type metadata for LHRStates);
    atomic_store(result, &qword_2579AD1B0);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_24B6A9EE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for PluginContext();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 48) & ~v2));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (char *)v3 + *(int *)(v1 + 32);
  v5 = sub_24B6ADBD0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B6A9FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PluginContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B6AA008(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for PluginContext() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + v6);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_24B6A1454;
  return sub_24B6A5978(a1, v8, v7, v10, v11);
}

uint64_t sub_24B6AA0B8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_24B6A1454;
  return sub_24B6A8C2C(a1, a2, v6, v7, v8);
}

uint64_t sub_24B6AA134(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PluginContext();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24B6AA170()
{
  unint64_t result;

  result = qword_2579AD1D8;
  if (!qword_2579AD1D8)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LighthouseRuntimeParams, &type metadata for LighthouseRuntimeParams);
    atomic_store(result, (unint64_t *)&qword_2579AD1D8);
  }
  return result;
}

uint64_t sub_24B6AA1B4(uint64_t a1, unint64_t a2)
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

unint64_t sub_24B6AA1FC()
{
  unint64_t result;

  result = qword_2579AD1E0;
  if (!qword_2579AD1E0)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LighthouseRuntimeError, &type metadata for LighthouseRuntimeError);
    atomic_store(result, (unint64_t *)&qword_2579AD1E0);
  }
  return result;
}

unint64_t sub_24B6AA244()
{
  unint64_t result;

  result = qword_2579AD1E8;
  if (!qword_2579AD1E8)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LHRStates, &type metadata for LHRStates);
    atomic_store(result, (unint64_t *)&qword_2579AD1E8);
  }
  return result;
}

unint64_t sub_24B6AA28C()
{
  unint64_t result;

  result = qword_2579AD1F0;
  if (!qword_2579AD1F0)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LHRStates, &type metadata for LHRStates);
    atomic_store(result, (unint64_t *)&qword_2579AD1F0);
  }
  return result;
}

unint64_t sub_24B6AA2D4()
{
  unint64_t result;

  result = qword_2579AD1F8;
  if (!qword_2579AD1F8)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LHRStates, &type metadata for LHRStates);
    atomic_store(result, (unint64_t *)&qword_2579AD1F8);
  }
  return result;
}

unint64_t sub_24B6AA31C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2579AD200;
  if (!qword_2579AD200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579AD208);
    result = MEMORY[0x24BD25234](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2579AD200);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD25228](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24B6AA3B0()
{
  unint64_t result;

  result = qword_2579AD210;
  if (!qword_2579AD210)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LRSignpostName, &type metadata for LRSignpostName);
    atomic_store(result, (unint64_t *)&qword_2579AD210);
  }
  return result;
}

unint64_t sub_24B6AA3F8()
{
  unint64_t result;

  result = qword_2579AD218;
  if (!qword_2579AD218)
  {
    result = MEMORY[0x24BD25234](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2579AD218);
  }
  return result;
}

unint64_t sub_24B6AA43C(uint64_t a1)
{
  unint64_t result;

  result = sub_24B6AA460();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24B6AA460()
{
  unint64_t result;

  result = qword_2579AD240;
  if (!qword_2579AD240)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LRSignpostName, &type metadata for LRSignpostName);
    atomic_store(result, (unint64_t *)&qword_2579AD240);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for PluginContext(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  char *v19;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v8;
    v9 = a2[4];
    *((_QWORD *)a1 + 3) = a2[3];
    *((_QWORD *)a1 + 4) = v9;
    v10 = *(int *)(a3 + 32);
    v19 = &a1[v10];
    v11 = (uint64_t)a2 + v10;
    v12 = sub_24B6ADBD0();
    v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    v14 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v19, v11, v12);
    v15 = *(int *)(a3 + 36);
    v16 = *(char **)((char *)a2 + v15);
    *(_QWORD *)&v7[v15] = v16;
    v17 = v16;
  }
  return v7;
}

void destroy for PluginContext(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (char *)a1 + *(int *)(a2 + 32);
  v5 = sub_24B6ADBD0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

_QWORD *initializeWithCopy for PluginContext(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  char *v18;

  v7 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v8 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v8;
  a1[4] = *(_QWORD *)(a2 + 32);
  v9 = *(int *)(a3 + 32);
  v18 = (char *)a1 + v9;
  v10 = a2 + v9;
  v11 = sub_24B6ADBD0();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v13 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v18, v10, v11);
  v14 = *(int *)(a3 + 36);
  v15 = *(void **)(a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = v15;
  v16 = v15;
  return a1;
}

uint64_t assignWithCopy for PluginContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 32);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_24B6ADBD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = *(int *)(a3 + 36);
  v14 = *(void **)(a2 + v13);
  v15 = *(void **)(a1 + v13);
  *(_QWORD *)(a1 + v13) = v14;
  v16 = v14;

  return a1;
}

uint64_t initializeWithTake for PluginContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(int *)(a3 + 32);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_24B6ADBD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_QWORD *)(a1 + *(int *)(a3 + 36)) = *(_QWORD *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t assignWithTake for PluginContext(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_bridgeObjectRelease();
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 32);
  v9 = a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_24B6ADBD0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = *(int *)(a3 + 36);
  v13 = *(void **)(a1 + v12);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)((char *)a2 + v12);

  return a1;
}

uint64_t getEnumTagSinglePayload for PluginContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B6AA8FC(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_24B6ADBD0();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 32)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for PluginContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_24B6AA984(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_24B6ADBD0();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 32)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_24B6AA9F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24B6ADBD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LighthouseRuntimeError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LighthouseRuntimeError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B6AAB74 + 4 * byte_24B6AE7AD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24B6AABA8 + 4 * byte_24B6AE7A8[v4]))();
}

uint64_t sub_24B6AABA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AABB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B6AABB8);
  return result;
}

uint64_t sub_24B6AABC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B6AABCCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24B6AABD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AABD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AABE4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24B6AABEC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LighthouseRuntimeError()
{
  return &type metadata for LighthouseRuntimeError;
}

uint64_t getEnumTagSinglePayload for LHRStates(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LHRStates(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B6AACE4 + 4 * byte_24B6AE7B7[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24B6AAD18 + 4 * byte_24B6AE7B2[v4]))();
}

uint64_t sub_24B6AAD18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AAD20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B6AAD28);
  return result;
}

uint64_t sub_24B6AAD34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B6AAD3CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24B6AAD40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AAD48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LHRStates()
{
  return &type metadata for LHRStates;
}

uint64_t dispatch thunk of StaticStringConvertible.staticString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t getEnumTagSinglePayload for LRSignpostName(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LRSignpostName(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B6AAE48 + 4 * byte_24B6AE7C1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24B6AAE7C + 4 * byte_24B6AE7BC[v4]))();
}

uint64_t sub_24B6AAE7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AAE84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B6AAE8CLL);
  return result;
}

uint64_t sub_24B6AAE98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B6AAEA0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24B6AAEA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AAEAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24B6AAEB8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LRSignpostName()
{
  return &type metadata for LRSignpostName;
}

uint64_t sub_24B6AAED0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24B6ADC54();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for LighthouseRuntime()
{
  JUMPOUT(0x24BD251ECLL);
}

uint64_t method lookup function for LighthouseRuntime()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LighthouseRuntime.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of LighthouseRuntime.process(withContext:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of LighthouseRuntime.processAsync(withTimeoutInMilliseconds:withContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 256) + *(_QWORD *)(*(_QWORD *)v2 + 256));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_24B6A0F78;
  return v8(a1, a2);
}

uint64_t sub_24B6AB014(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_24B6AB050(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24B6AB090()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B6AB0BC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_24B6A1454;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2579AD380 + dword_2579AD380))(a1, v4, v5, v6);
}

uint64_t sub_24B6AB140()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B6AB164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24B6A1454;
  v3[2] = v2;
  return swift_task_switch();
}

unint64_t sub_24B6AB1C4()
{
  unint64_t result;

  result = qword_2579AD3A8;
  if (!qword_2579AD3A8)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for TimedOutError, &type metadata for TimedOutError);
    atomic_store(result, &qword_2579AD3A8);
  }
  return result;
}

uint64_t sub_24B6AB208(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = (uint64_t *)v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_24B6A1454;
  return sub_24B6A5BE0(a1, v4, v5, v7, v6);
}

unint64_t sub_24B6AB280()
{
  unint64_t result;

  result = qword_2579AD3C0;
  if (!qword_2579AD3C0)
  {
    result = MEMORY[0x24BD25234](&protocol conformance descriptor for LighthouseRuntimeError, &type metadata for LighthouseRuntimeError);
    atomic_store(result, (unint64_t *)&qword_2579AD3C0);
  }
  return result;
}

uint64_t Dictionary<>.toObject<A>()@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_24B6ADCF0();
  v15[0] = 0;
  v6 = objc_msgSend(v4, sel_dataWithJSONObject_options_error_, v5, 0, v15);

  v7 = v15[0];
  if (v6)
  {
    v8 = sub_24B6ADBAC();
    v10 = v9;

    sub_24B6ADB88();
    swift_allocObject();
    sub_24B6ADB7C();
    sub_24B6ADB70();
    sub_24B6AA1B4(v8, v10);
    swift_release();
    v13 = 0;
  }
  else
  {
    v11 = v7;
    v12 = (void *)sub_24B6ADB94();

    swift_willThrow();
    v13 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, v13, 1, a1);
}

uint64_t LighthouseRuntimeParams.processTimeoutInMilliseconds.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

unint64_t sub_24B6AB488()
{
  _BYTE *v0;

  if (*v0)
    return 0xD00000000000001BLL;
  else
    return 0xD00000000000001CLL;
}

uint64_t sub_24B6AB4C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24B6ABACC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24B6AB4E8()
{
  return 0;
}

void sub_24B6AB4F4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24B6AB500()
{
  sub_24B6AB840();
  return sub_24B6ADF78();
}

uint64_t sub_24B6AB528()
{
  sub_24B6AB840();
  return sub_24B6ADF84();
}

uint64_t LighthouseRuntimeParams.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD3D0);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  v11 = *(unsigned __int8 *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B6AB840();
  sub_24B6ADF6C();
  v13 = 0;
  sub_24B6ADEF4();
  if (!v2)
  {
    v12 = 1;
    sub_24B6ADEF4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v7, v4);
}

uint64_t LighthouseRuntimeParams.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v14;
  char *v15;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD3E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B6AB840();
  sub_24B6ADF60();
  if (!v2)
  {
    v20 = 0;
    v10 = sub_24B6ADEE8();
    v12 = v11;
    v19 = 1;
    v14 = sub_24B6ADEE8();
    v15 = v9;
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
    *(_QWORD *)a2 = v10;
    *(_BYTE *)(a2 + 8) = v12 & 1;
    *(_QWORD *)(a2 + 16) = v14;
    *(_BYTE *)(a2 + 24) = v17 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_24B6AB7F4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return LighthouseRuntimeParams.init(from:)(a1, a2);
}

uint64_t sub_24B6AB808(_QWORD *a1)
{
  return LighthouseRuntimeParams.encode(to:)(a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24B6AB840()
{
  unint64_t result;

  result = qword_2579AD3D8;
  if (!qword_2579AD3D8)
  {
    result = MEMORY[0x24BD25234](&unk_24B6AEDBC, &type metadata for LighthouseRuntimeParams.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579AD3D8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LighthouseRuntimeParams(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for LighthouseRuntimeParams(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LighthouseRuntimeParams(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
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
  *(_BYTE *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for LighthouseRuntimeParams()
{
  return &type metadata for LighthouseRuntimeParams;
}

uint64_t storeEnumTagSinglePayload for LighthouseRuntimeParams.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B6AB974 + 4 * byte_24B6AEC65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24B6AB9A8 + 4 * byte_24B6AEC60[v4]))();
}

uint64_t sub_24B6AB9A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AB9B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B6AB9B8);
  return result;
}

uint64_t sub_24B6AB9C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B6AB9CCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24B6AB9D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B6AB9D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LighthouseRuntimeParams.CodingKeys()
{
  return &type metadata for LighthouseRuntimeParams.CodingKeys;
}

unint64_t sub_24B6AB9F8()
{
  unint64_t result;

  result = qword_2579AD3E8;
  if (!qword_2579AD3E8)
  {
    result = MEMORY[0x24BD25234](&unk_24B6AED94, &type metadata for LighthouseRuntimeParams.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579AD3E8);
  }
  return result;
}

unint64_t sub_24B6ABA40()
{
  unint64_t result;

  result = qword_2579AD3F0;
  if (!qword_2579AD3F0)
  {
    result = MEMORY[0x24BD25234](&unk_24B6AED04, &type metadata for LighthouseRuntimeParams.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579AD3F0);
  }
  return result;
}

unint64_t sub_24B6ABA88()
{
  unint64_t result;

  result = qword_2579AD3F8;
  if (!qword_2579AD3F8)
  {
    result = MEMORY[0x24BD25234](&unk_24B6AED2C, &type metadata for LighthouseRuntimeParams.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579AD3F8);
  }
  return result;
}

uint64_t sub_24B6ABACC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001CLL && a2 == 0x800000024B6AF310 || (sub_24B6ADF00() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000024B6AF330)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_24B6ADF00();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

id AsyncOperation.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = sub_24B6ACBCC(a1, a2);
  swift_release();
  return v6;
}

uint64_t sub_24B6ABC08()
{
  uint64_t v0;

  v0 = sub_24B6ADCB4();
  __swift_allocate_value_buffer(v0, qword_2579AE178);
  __swift_project_value_buffer(v0, (uint64_t)qword_2579AE178);
  return sub_24B6ADCA8();
}

id AsyncOperation.init(_:)(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = sub_24B6ACBCC(a1, a2);
  swift_release();
  return v2;
}

id AsyncOperation.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  if (*(_QWORD *)&v0[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task])
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
    sub_24B6ADDA4();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24B6ABE28()
{
  return 1;
}

uint64_t sub_24B6ABE3C()
{
  return sub_24B6ABF54();
}

void sub_24B6ABEAC(int a1)
{
  sub_24B6AC030(a1, 0x7475636578457369, 0xEB00000000676E69, (uint64_t)sub_24B6ACFE0);
}

uint64_t sub_24B6ABEE0(void *a1)
{
  id v1;
  unsigned __int8 v3;

  v1 = a1;
  sub_24B6ADE28();

  return v3;
}

uint64_t sub_24B6ABF48()
{
  return sub_24B6ABF54();
}

uint64_t sub_24B6ABF54()
{
  unsigned __int8 v1;

  sub_24B6ADE28();
  return v1;
}

void sub_24B6AC00C(int a1)
{
  sub_24B6AC030(a1, 0x6873696E69467369, 0xEA00000000006465, (uint64_t)sub_24B6ACFC8);
}

void sub_24B6AC030(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;

  v16 = a4;
  v5 = v4;
  HIDWORD(v15) = a1;
  v6 = sub_24B6ADCCC();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)sub_24B6ADD08();
  objc_msgSend(v5, sel_willChangeValueForKey_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD470);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_24B6AE5A0;
  sub_24B6ADCC0();
  v19 = v13;
  sub_24B6AD0BC(&qword_2579AD478, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD480);
  sub_24B6AD0FC(&qword_2579AD488, &qword_2579AD480);
  sub_24B6ADE88();
  v17 = v5;
  v18 = BYTE4(v15);
  sub_24B6ADE1C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  v14 = (void *)sub_24B6ADD08();
  objc_msgSend(v5, sel_didChangeValueForKey_, v14);

}

id sub_24B6AC20C()
{
  void *v0;
  uint64_t v1;

  if ((objc_msgSend(v0, sel_isCancelled) & 1) != 0)
  {
    objc_msgSend(v0, sel_setExecuting_, 0);
    return objc_msgSend(v0, sel_setFinished_, 1);
  }
  else
  {
    objc_msgSend(v0, sel_setFinished_, 0);
    objc_msgSend(v0, sel_setExecuting_, 1);
    return objc_msgSend(v0, sel_main, v1);
  }
}

uint64_t sub_24B6AC328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24B6ADD8C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v6;
  v8 = sub_24B6AC7BC((uint64_t)v4, (uint64_t)&unk_2579AD418, (uint64_t)v7);
  sub_24B6ACEE4((uint64_t)v4);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task) = v8;
  return swift_release();
}

uint64_t sub_24B6AC41C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 48) = a4;
  return swift_task_switch();
}

uint64_t sub_24B6AC434()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  uint64_t (*v7)(void);

  v1 = v0[6] + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24BD25324](v1);
  v0[7] = v2;
  if (v2)
  {
    v3 = *(int **)(v2 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_action);
    v0[8] = *(_QWORD *)(v2 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_action + 8);
    v7 = (uint64_t (*)(void))((char *)v3 + *v3);
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    v0[9] = v4;
    *v4 = v0;
    v4[1] = sub_24B6AC4E4;
    v5 = v7;
  }
  else
  {
    v5 = (uint64_t (*)(void))v0[1];
  }
  return v5();
}

uint64_t sub_24B6AC4E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24B6AC548()
{
  uint64_t v0;
  void *v1;

  swift_release();
  v1 = *(void **)(v0 + 56);
  objc_msgSend(v1, sel_setExecuting_, 0);
  objc_msgSend(v1, sel_setFinished_, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6AC5AC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  swift_release();
  if (qword_2579ACDF8 != -1)
    swift_once();
  v1 = *(void **)(v0 + 80);
  v2 = sub_24B6ADCB4();
  __swift_project_value_buffer(v2, (uint64_t)qword_2579AE178);
  v3 = v1;
  v4 = v1;
  v5 = sub_24B6ADC9C();
  v6 = sub_24B6ADDF8();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 80);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v12;
    sub_24B6ADE70();
    *v10 = v12;

    _os_log_impl(&dword_24B69F000, v5, v6, "Error while running async operation. %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD490);
    swift_arrayDestroy();
    MEMORY[0x24BD252AC](v10, -1, -1);
    MEMORY[0x24BD252AC](v9, -1, -1);
  }
  else
  {

  }
  v13 = *(_QWORD *)(v0 + 80);
  v14 = *(_QWORD *)(v0 + 56);

  v15 = *(void **)(v14 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error);
  *(_QWORD *)(v14 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error) = v13;

  v16 = *(void **)(v0 + 56);
  objc_msgSend(v16, sel_setExecuting_, 0);
  objc_msgSend(v16, sel_setFinished_, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6AC7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B6ACFF8(a1, (uint64_t)v8);
  v9 = sub_24B6ADD8C();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_24B6ACEE4((uint64_t)v8);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  else
  {
    sub_24B6ADD80();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v11 = sub_24B6ADD68();
  v13 = v12;
  swift_unknownObjectRelease();
  if (v13 | v11)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v11;
    v15[3] = v13;
  }
  return swift_task_create();
}

id sub_24B6ACA38()
{
  char *v0;
  objc_super v2;

  if (*(_QWORD *)&v0[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task])
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
    sub_24B6ADDA4();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncOperation();
  return objc_msgSendSuper2(&v2, sel_cancel);
}

id AsyncOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AsyncOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_24B6ACBCC(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _QWORD *v13;
  uint64_t v14;
  objc_class *v15;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  uint64_t v23;

  v20 = a1;
  v21 = a2;
  v19 = sub_24B6ADE10();
  v3 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19, v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24B6ADE04();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v7, v9);
  v10 = sub_24B6ADCE4();
  MEMORY[0x24BDAC7A8](v10, v11);
  v18 = OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_lockQueue;
  v17[1] = sub_24B6AD080();
  v12 = v2;
  sub_24B6ADCD8();
  v23 = MEMORY[0x24BEE4AF8];
  sub_24B6AD0BC(&qword_2579AD4A0, v8, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AD4A8);
  sub_24B6AD0FC(&qword_2579AD4B0, &qword_2579AD4A8);
  sub_24B6ADE88();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEE5750], v19);
  *(_QWORD *)(v17[2] + v18) = sub_24B6ADE34();
  *(_QWORD *)&v12[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error] = 0;
  v12[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isExecuting] = 0;
  v12[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isFinished] = 0;
  v13 = &v12[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_action];
  v14 = v21;
  *v13 = v20;
  v13[1] = v14;
  swift_retain();

  v15 = (objc_class *)type metadata accessor for AsyncOperation();
  v22.receiver = v12;
  v22.super_class = v15;
  return objc_msgSendSuper2(&v22, sel_init);
}

uint64_t type metadata accessor for AsyncOperation()
{
  return objc_opt_self();
}

void sub_24B6ACE2C(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isExecuting);
}

void sub_24B6ACE44(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isFinished);
}

uint64_t sub_24B6ACE5C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24B6ACE84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24B6A1454;
  v3[6] = v2;
  return swift_task_switch();
}

uint64_t sub_24B6ACEE4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for AsyncOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncOperation.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B6ACF68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24B6A0F78;
  v3[6] = v2;
  return swift_task_switch();
}

void sub_24B6ACFC8()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isFinished) = *(_BYTE *)(v0 + 24);
}

void sub_24B6ACFE0()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isExecuting) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_24B6ACFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
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

unint64_t sub_24B6AD080()
{
  unint64_t result;

  result = qword_2579AD498;
  if (!qword_2579AD498)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2579AD498);
  }
  return result;
}

uint64_t sub_24B6AD0BC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BD25234](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24B6AD0FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD25234](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_24B6AD13C(_BYTE *a1@<X8>)
{
  sub_24B6ACE44(a1);
}

void sub_24B6AD150(_BYTE *a1@<X8>)
{
  sub_24B6ACE2C(a1);
}

uint64_t waitForTaskCompletion<A>(withTimeoutInMilliseconds:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_24B6AD184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 40) = v2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  *v5 = v0;
  v5[1] = sub_24B6AD228;
  return sub_24B6ADEDC();
}

uint64_t sub_24B6AD228()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24B6AD29C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6AD2D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
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
  _QWORD *v17;
  _QWORD v19[4];
  _QWORD v20[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B6ACFF8(a1, (uint64_t)v10);
  v11 = sub_24B6ADD8C();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_24B6ACEE4((uint64_t)v10);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_24B6ADD68();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24B6ADD80();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v17 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t static TimedOutError.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_24B6AD45C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  sub_24B6ADE64();
  v6[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFC8);
  v6[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24B6AD4E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  v1 = v0[9];
  v3 = v0[6];
  v2 = v0[7];
  v5 = v0[4];
  v4 = v0[5];
  v6 = sub_24B6ADD8C();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v1, 1, 1, v6);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v2;
  v8[5] = v5;
  v8[6] = v4;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579ACFB8);
  sub_24B6ADDE0();
  sub_24B6AD2D0(v1, (uint64_t)&unk_2579AD4D8, (uint64_t)v8);
  sub_24B6ACEE4(v1);
  v7(v1, 1, 1, v6);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = v3;
  sub_24B6AD2D0(v1, (uint64_t)&unk_2579AD4E8, (uint64_t)v9);
  sub_24B6ACEE4(v1);
  v10 = (_QWORD *)swift_task_alloc();
  v0[10] = v10;
  *v10 = v0;
  v10[1] = sub_24B6AD660;
  return sub_24B6ADDC8();
}

uint64_t sub_24B6AD660()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24B6AD6C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v1 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v1);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 16), v2, v1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
    sub_24B6ADDD4();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_24B6AD778()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2579ACFB8);
  sub_24B6ADDD4();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6AD7F0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_24B6A0F78;
  return sub_24B6AD45C(a1, a2, v7, v9, v8, v6);
}

ValueMetadata *type metadata accessor for TimedOutError()
{
  return &type metadata for TimedOutError;
}

uint64_t sub_24B6AD880(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_24B6A0F78;
  return v8(a1);
}

uint64_t sub_24B6AD8E4()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B6AD910(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[5];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_24B6A1454;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2579AD4D0 + dword_2579AD4D0))(a1, v4, v5, v6);
}

uint64_t sub_24B6AD9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

void sub_24B6AD9BC()
{
  uint64_t v0;
  _QWORD *v1;

  if (is_mul_ok(*(_QWORD *)(v0 + 16), 0xF4240uLL))
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v1;
    *v1 = v0;
    v1[1] = sub_24B6ADA28;
    sub_24B6ADDBC();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24B6ADA28()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_24B6ADA94()
{
  uint64_t v0;

  sub_24B6AB1C4();
  swift_allocError();
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B6ADAEC()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B6ADB10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24B6A1454;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_24B6ADB70()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_24B6ADB7C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_24B6ADB88()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_24B6ADB94()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24B6ADBA0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24B6ADBAC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24B6ADBB8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_24B6ADBC4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24B6ADBD0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24B6ADBDC()
{
  return MEMORY[0x24BE5F688]();
}

uint64_t sub_24B6ADBE8()
{
  return MEMORY[0x24BE5F690]();
}

uint64_t sub_24B6ADBF4()
{
  return MEMORY[0x24BE5F698]();
}

uint64_t sub_24B6ADC00()
{
  return MEMORY[0x24BE5F6D0]();
}

uint64_t sub_24B6ADC0C()
{
  return MEMORY[0x24BE5F6E8]();
}

uint64_t sub_24B6ADC18()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_24B6ADC24()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_24B6ADC30()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_24B6ADC3C()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_24B6ADC48()
{
  return MEMORY[0x24BEE77C8]();
}

uint64_t sub_24B6ADC54()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_24B6ADC60()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_24B6ADC6C()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_24B6ADC78()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_24B6ADC84()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_24B6ADC90()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_24B6ADC9C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24B6ADCA8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24B6ADCB4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24B6ADCC0()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_24B6ADCCC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24B6ADCD8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24B6ADCE4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24B6ADCF0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24B6ADCFC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24B6ADD08()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24B6ADD14()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24B6ADD20()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24B6ADD2C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24B6ADD38()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24B6ADD44()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24B6ADD50()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24B6ADD5C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24B6ADD68()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_24B6ADD74()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_24B6ADD80()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_24B6ADD8C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_24B6ADD98()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_24B6ADDA4()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_24B6ADDB0()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_24B6ADDBC()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_24B6ADDC8()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_24B6ADDD4()
{
  return MEMORY[0x24BEE6BE0]();
}

uint64_t sub_24B6ADDE0()
{
  return MEMORY[0x24BEE6BE8]();
}

uint64_t sub_24B6ADDEC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24B6ADDF8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24B6ADE04()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_24B6ADE10()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24B6ADE1C()
{
  return MEMORY[0x24BEE5778]();
}

uint64_t sub_24B6ADE28()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_24B6ADE34()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24B6ADE40()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_24B6ADE4C()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_24B6ADE58()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_24B6ADE64()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24B6ADE70()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24B6ADE7C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24B6ADE88()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24B6ADE94()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24B6ADEA0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24B6ADEAC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24B6ADEB8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24B6ADEC4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24B6ADED0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24B6ADEDC()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_24B6ADEE8()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_24B6ADEF4()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_24B6ADF00()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24B6ADF0C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24B6ADF18()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24B6ADF24()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24B6ADF30()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24B6ADF3C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24B6ADF48()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24B6ADF54()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24B6ADF60()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24B6ADF6C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24B6ADF78()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24B6ADF84()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_24B6ADF90()
{
  return MEMORY[0x24BEE7160]();
}

uint64_t sub_24B6ADF9C()
{
  return MEMORY[0x24BEE7168]();
}

uint64_t sub_24B6ADFA8()
{
  return MEMORY[0x24BEE7178]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

