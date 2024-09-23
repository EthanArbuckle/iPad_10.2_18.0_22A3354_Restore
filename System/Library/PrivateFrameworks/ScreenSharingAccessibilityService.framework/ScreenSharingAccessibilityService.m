uint64_t dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.startAnnotationUIService()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245864510;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.stopAnnotationUIService()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24586432C;
  return v7(a1, a2);
}

uint64_t sub_24586432C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.processTapGestureMessage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24586432C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.processDragGestureMessage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 32) + *(_QWORD *)(a3 + 32));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245864510;
  return v9(a1, a2, a3);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_245864474(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_245864494(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2574B6060)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2574B6060);
  }
}

uint64_t dispatch thunk of ScreenSharingAnnotationViewControllerProtocol.clearDrawing()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ScreenSharingAnnotationViewControllerProtocol.processTapGestureMessage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ScreenSharingAnnotationViewControllerProtocol.processDragGestureMessage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_24586452C(char a1)
{
  if (a1 == 2)
    return 0x746E696F70;
  if (a1 == 1)
    return 0xD000000000000010;
  return 25705;
}

BOOL sub_24586457C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_245864590()
{
  sub_245869E94();
  sub_245869EA0();
  return sub_245869EAC();
}

uint64_t sub_2458645D4()
{
  return sub_245869EA0();
}

uint64_t sub_2458645FC()
{
  sub_245869E94();
  sub_245869EA0();
  return sub_245869EAC();
}

uint64_t sub_24586463C()
{
  char *v0;

  return sub_24586452C(*v0);
}

uint64_t sub_245864644@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245865904(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_245864668()
{
  return 0;
}

void sub_245864674(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_245864680()
{
  sub_2458648EC();
  return sub_245869ED0();
}

uint64_t sub_2458646A8()
{
  sub_2458648EC();
  return sub_245869EDC();
}

uint64_t DragGestureMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];
  __int128 v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B60D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2458648EC();
  sub_245869EC4();
  LOBYTE(v12) = 0;
  sub_245869C54();
  sub_245864C60(&qword_2574B60E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_245869E34();
  if (!v2)
  {
    v9 = type metadata accessor for DragGestureMessage();
    LOBYTE(v12) = 1;
    sub_245869E40();
    v12 = *(_OWORD *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    type metadata accessor for CGPoint();
    sub_245864C60(&qword_2574B60E8, (uint64_t (*)(uint64_t))type metadata accessor for CGPoint, MEMORY[0x24BDBD878]);
    sub_245869E34();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24953D53C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2458648EC()
{
  unint64_t result;

  result = qword_2574B60D8;
  if (!qword_2574B60D8)
  {
    result = MEMORY[0x24953D548](&unk_24586A444, &type metadata for DragGestureMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B60D8);
  }
  return result;
}

uint64_t type metadata accessor for DragGestureMessage()
{
  uint64_t result;

  result = qword_2574B6178;
  if (!qword_2574B6178)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t DragGestureMessage.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  __int128 v29;
  char v30;

  v23 = a2;
  v24 = sub_245869C54();
  v3 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v25 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B60F0);
  v5 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DragGestureMessage();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2458648EC();
  v27 = v7;
  v11 = v28;
  sub_245869EB8();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v28 = v8;
  v12 = v5;
  v13 = v10;
  LOBYTE(v29) = 0;
  sub_245864C60(&qword_2574B60F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v15 = v24;
  v14 = v25;
  v16 = v26;
  sub_245869E1C();
  v22[1] = v3;
  v17 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v18 = (uint64_t)v13;
  v17(v13, v14, v15);
  LOBYTE(v29) = 1;
  v19 = sub_245869E28();
  v20 = v28;
  *(_QWORD *)(v18 + *(int *)(v28 + 20)) = v19;
  type metadata accessor for CGPoint();
  v30 = 2;
  sub_245864C60(&qword_2574B6100, (uint64_t (*)(uint64_t))type metadata accessor for CGPoint, MEMORY[0x24BDBD888]);
  sub_245869E1C();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v27, v16);
  *(_OWORD *)(v18 + *(int *)(v20 + 24)) = v29;
  sub_245864CA0(v18, v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_245864CE4(v18);
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

uint64_t sub_245864C60(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24953D548](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_245864CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DragGestureMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245864CE4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DragGestureMessage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245864D20@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DragGestureMessage.init(from:)(a1, a2);
}

uint64_t sub_245864D34(_QWORD *a1)
{
  return DragGestureMessage.encode(to:)(a1);
}

uint64_t DragGestureMessage.init(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  _BYTE *v24;
  uint64_t result;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[40];
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B6108);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245869C54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_245869CCC();
  v31 = v10;
  sub_245869DD4();
  if (*(_QWORD *)(a1 + 16) && (v11 = sub_245865150((uint64_t)v32), (v12 & 1) != 0))
  {
    sub_245865234(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v33);
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
  }
  sub_245865180((uint64_t)v32);
  if (!*((_QWORD *)&v34 + 1))
    goto LABEL_23;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  v35 = v30;
  v30 = sub_245869CD8();
  v31 = v13;
  sub_245869DD4();
  if (*(_QWORD *)(a1 + 16) && (v14 = sub_245865150((uint64_t)v32), (v15 & 1) != 0))
  {
    sub_245865234(*(_QWORD *)(a1 + 56) + 32 * v14, (uint64_t)&v33);
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
  }
  sub_245865180((uint64_t)v32);
  if (!*((_QWORD *)&v34 + 1))
    goto LABEL_22;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v16 = v30;
  v30 = sub_245869CE4();
  v31 = v17;
  sub_245869DD4();
  if (*(_QWORD *)(a1 + 16) && (v18 = sub_245865150((uint64_t)v32), (v19 & 1) != 0))
  {
    sub_245865234(*(_QWORD *)(a1 + 56) + 32 * v18, (uint64_t)&v33);
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
  }
  sub_245865180((uint64_t)v32);
  if (!*((_QWORD *)&v34 + 1))
  {
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_23:
    swift_bridgeObjectRelease();
    sub_2458651F8((uint64_t)&v33, &qword_2574B6110);
LABEL_26:
    sub_2458651B4();
    swift_allocError();
    *v24 = 7;
    return swift_willThrow();
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_24;
  v20 = v30;
  v30 = sub_245869CF0();
  v31 = v21;
  sub_245869DD4();
  if (*(_QWORD *)(a1 + 16) && (v22 = sub_245865150((uint64_t)v32), (v23 & 1) != 0))
  {
    sub_245865234(*(_QWORD *)(a1 + 56) + 32 * v22, (uint64_t)&v33);
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_245865180((uint64_t)v32);
  if (!*((_QWORD *)&v34 + 1))
    goto LABEL_23;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_25;
  v26 = v30;
  sub_245869C3C();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_245869C48();
    sub_2458651F8((uint64_t)v5, &qword_2574B6108);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a2, v9, v6);
  }
  else
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v27(v9, v5, v6);
    v27(a2, v9, v6);
  }
  result = type metadata accessor for DragGestureMessage();
  v28 = (uint64_t *)&a2[*(int *)(result + 24)];
  *v28 = v16;
  v28[1] = v20;
  *(_QWORD *)&a2[*(int *)(result + 20)] = v26;
  return result;
}

unint64_t sub_245865150(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245869DBC();
  return sub_245865840(a1, v2);
}

uint64_t sub_245865180(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_2458651B4()
{
  unint64_t result;

  result = qword_2574B6118;
  if (!qword_2574B6118)
  {
    result = MEMORY[0x24953D548](&protocol conformance descriptor for AnnotationUIServiceError, &type metadata for AnnotationUIServiceError);
    atomic_store(result, (unint64_t *)&qword_2574B6118);
  }
  return result;
}

uint64_t sub_2458651F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245865234(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for DragGestureMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245869C54();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(_OWORD *)((char *)a1 + v8) = *(_OWORD *)((char *)a2 + v8);
  }
  return a1;
}

uint64_t destroy for DragGestureMessage(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245869C54();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_245869C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_245869C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  return a1;
}

uint64_t initializeWithTake for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_245869C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for DragGestureMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_245869C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for DragGestureMessage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2458654E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245869C54();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DragGestureMessage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24586552C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245869C54();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_24586556C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245869C54();
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

uint64_t getEnumTagSinglePayload for DragGestureMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DragGestureMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2458656D4 + 4 * byte_24586A2F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_245865708 + 4 * asc_24586A2F0[v4]))();
}

uint64_t sub_245865708(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245865710(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245865718);
  return result;
}

uint64_t sub_245865724(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24586572CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_245865730(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245865738(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245865744(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245865750(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DragGestureMessage.CodingKeys()
{
  return &type metadata for DragGestureMessage.CodingKeys;
}

unint64_t sub_24586576C()
{
  unint64_t result;

  result = qword_2574B61B8;
  if (!qword_2574B61B8)
  {
    result = MEMORY[0x24953D548](&unk_24586A41C, &type metadata for DragGestureMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B61B8);
  }
  return result;
}

unint64_t sub_2458657B4()
{
  unint64_t result;

  result = qword_2574B61C0;
  if (!qword_2574B61C0)
  {
    result = MEMORY[0x24953D548](&unk_24586A38C, &type metadata for DragGestureMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B61C0);
  }
  return result;
}

unint64_t sub_2458657FC()
{
  unint64_t result;

  result = qword_2574B61C8;
  if (!qword_2574B61C8)
  {
    result = MEMORY[0x24953D548](&unk_24586A3B4, &type metadata for DragGestureMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B61C8);
  }
  return result;
}

unint64_t sub_245865840(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_245865A28(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x24953D200](v9, a1);
      sub_245865180((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_245865904(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_245869E4C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024586B1B0 || (sub_245869E4C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E696F70 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_245869E4C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_245865A28(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

BOOL static AnnotationUIServiceError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AnnotationUIServiceError.hash(into:)()
{
  return sub_245869EA0();
}

uint64_t AnnotationUIServiceError.hashValue.getter()
{
  sub_245869E94();
  sub_245869EA0();
  return sub_245869EAC();
}

uint64_t AnnotationUIServiceError.errorDescription.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_245865B2C + 4 * byte_24586A4A0[*v0]))(0xD00000000000001ALL, 0x800000024586B350);
}

uint64_t sub_245865B2C@<X0>(uint64_t a1@<X8>)
{
  return a1 - 9;
}

unint64_t sub_245865BB0()
{
  unint64_t result;

  result = qword_2574B61D0;
  if (!qword_2574B61D0)
  {
    result = MEMORY[0x24953D548](&protocol conformance descriptor for AnnotationUIServiceError, &type metadata for AnnotationUIServiceError);
    atomic_store(result, (unint64_t *)&qword_2574B61D0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AnnotationUIServiceError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AnnotationUIServiceError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245865CE4 + 4 * byte_24586A4AD[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_245865D18 + 4 * byte_24586A4A8[v4]))();
}

uint64_t sub_245865D18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245865D20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245865D28);
  return result;
}

uint64_t sub_245865D34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245865D3CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_245865D40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245865D48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AnnotationUIServiceError()
{
  return &type metadata for AnnotationUIServiceError;
}

uint64_t dispatch thunk of ScreenSharingAnnotationDisplayManagerProtocol.attachViewController(forService:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245865DDC;
  return v9(a1, a2, a3);
}

uint64_t sub_245865DDC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t dispatch thunk of ScreenSharingAnnotationDisplayManagerProtocol.detachViewController(forService:viewController:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_24586432C;
  return v11(a1, a2, a3, a4);
}

uint64_t ScreenSharingAnnotationViewController.__allocating_init()()
{
  objc_class *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B61E8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (char *)objc_allocWithZone(v0);
  v4 = qword_2574B61F0;
  sub_245869CA8();
  swift_allocObject();
  v5 = v3;
  *(_QWORD *)&v3[v4] = sub_245869C9C();
  v6 = qword_2574B61F8;
  sub_245869D14();
  swift_allocObject();
  sub_245869D08();
  v7 = sub_245869CFC();
  swift_release();
  *(_QWORD *)&v5[v6] = v7;

  v8 = sub_245869C6C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 1, 1, v8);
  return sub_245869D44();
}

uint64_t ScreenSharingAnnotationViewController.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B61E8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = qword_2574B61F0;
  sub_245869CA8();
  swift_allocObject();
  v4 = v0;
  *(_QWORD *)&v0[v3] = sub_245869C9C();
  v5 = qword_2574B61F8;
  sub_245869D14();
  swift_allocObject();
  sub_245869D08();
  v6 = sub_245869CFC();
  swift_release();
  *(_QWORD *)&v4[v5] = v6;

  v7 = sub_245869C6C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 1, 1, v7);
  return sub_245869D44();
}

void sub_2458660D8(char *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = qword_2574B61F0;
  sub_245869CA8();
  swift_allocObject();
  v6 = a3;
  *(_QWORD *)&a1[v5] = sub_245869C9C();
  v7 = qword_2574B61F8;
  sub_245869D14();
  swift_allocObject();
  sub_245869D08();
  v8 = sub_245869CFC();
  swift_release();
  *(_QWORD *)&a1[v7] = v8;

  sub_245869E04();
  __break(1u);
}

id sub_2458661B0()
{
  void *v0;
  uint64_t v1;
  char *v2;
  objc_class *v3;
  id result;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_super v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B61E8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (objc_class *)type metadata accessor for ScreenSharingAnnotationViewController();
  v10.receiver = v0;
  v10.super_class = v3;
  objc_msgSendSuper2(&v10, sel_viewDidLoad);
  result = objc_msgSend(v0, sel_view);
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v6);

    result = objc_msgSend(v0, sel_view);
    if (result)
    {
      v7 = result;
      v8 = objc_msgSend(result, sel_layer);

      objc_msgSend(v8, sel_setDisableUpdateMask_, 16);
      swift_retain();
      sub_245869C60();
      v9 = sub_245869C6C();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v2, 0, 1, v9);
      return (id)sub_245869D50();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ScreenSharingAnnotationViewController()
{
  uint64_t result;

  result = qword_2574B6200;
  if (!qword_2574B6200)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24586636C(void *a1)
{
  id v1;

  v1 = a1;
  sub_2458661B0();

}

void ScreenSharingAnnotationViewController.__allocating_init(rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ScreenSharingAnnotationViewController.init(rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ScreenSharingAnnotationViewController.__allocating_init(coder:rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ScreenSharingAnnotationViewController.init(coder:rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_245866450()
{
  uint64_t v0;

  swift_release();

}

id ScreenSharingAnnotationViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScreenSharingAnnotationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2458664B0(uint64_t a1)
{
  swift_release();

}

Swift::Void __swiftcall ScreenSharingAnnotationViewController.clearDrawing()()
{
  sub_245869C78();
}

uint64_t ScreenSharingAnnotationViewController.processTapGestureMessage(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_245869CB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE84438], v2);
  sub_245869CC0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend((id)objc_opt_self(), sel_setRemoteInputMachTime_, v6);
  return sub_245869C84();
}

uint64_t ScreenSharingAnnotationViewController.processDragGestureMessage(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_245869CB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE84438], v2);
  v6 = *(int *)(type metadata accessor for DragGestureMessage() + 20);
  sub_245869CC0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend((id)objc_opt_self(), sel_setRemoteInputMachTime_, *(_QWORD *)(a1 + v6));
  return sub_245869C90();
}

uint64_t sub_245866708()
{
  return sub_245869C78();
}

uint64_t sub_245866730(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_245869CB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE84438], v2);
  sub_245869CC0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend((id)objc_opt_self(), sel_setRemoteInputMachTime_, v6);
  return sub_245869C84();
}

uint64_t sub_245866824(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_245869CB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE84438], v2);
  v6 = *(int *)(type metadata accessor for DragGestureMessage() + 20);
  sub_245869CC0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend((id)objc_opt_self(), sel_setRemoteInputMachTime_, *(_QWORD *)(a1 + v6));
  return sub_245869C90();
}

uint64_t sub_245866928()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ScreenSharingAnnotationViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ScreenSharingAnnotationViewController.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ScreenSharingAnnotationViewController + v0 + 16))();
}

uint64_t sub_2458669A0()
{
  return type metadata accessor for ScreenSharingAnnotationViewController();
}

id sub_2458669A8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id result;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = *(id *)(v0 + 16);
LABEL_5:
    v5 = v1;
    return v2;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedDisplayManager);
  if (result)
  {
    v4 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = result;
    v2 = result;

    v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t ScreenSharingAnnotationDisplayManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  ScreenSharingAnnotationDisplayManager.init()();
  return v0;
}

_QWORD *ScreenSharingAnnotationDisplayManager.init()()
{
  _QWORD *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B61E8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[2] = 0;
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for ScreenSharingAnnotationViewController());
  v4 = qword_2574B61F0;
  sub_245869CA8();
  swift_allocObject();
  v5 = v3;
  *(_QWORD *)&v3[v4] = sub_245869C9C();
  v6 = qword_2574B61F8;
  sub_245869D14();
  swift_allocObject();
  sub_245869D08();
  v7 = sub_245869CFC();
  swift_release();
  *(_QWORD *)&v5[v6] = v7;

  v8 = sub_245869C6C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 1, 1, v8);
  v0[3] = sub_245869D44();
  v0[4] = &protocol witness table for ScreenSharingAnnotationViewController;
  return v0;
}

uint64_t ScreenSharingAnnotationDisplayManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ScreenSharingAnnotationDisplayManager.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t ScreenSharingAnnotationDisplayManager.attachViewController(forService:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_2574B6258 + dword_2574B6258);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245866C34;
  return v5(a1);
}

uint64_t sub_245866C34(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  swift_task_dealloc();
  if (v2)
    return (*(uint64_t (**)(void))(v6 + 8))();
  else
    return (*(uint64_t (**)(void *, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_245866CB4(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t ScreenSharingAnnotationDisplayManager.detachViewController(forService:viewController:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  sub_245869D80();
  v3[18] = sub_245869D74();
  v3[19] = sub_245869D68();
  v3[20] = v4;
  return swift_task_switch();
}

id sub_245866D38()
{
  _QWORD *v0;
  uint64_t v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[15];
  result = sub_2458669A8();
  v0[21] = result;
  if (v1)
  {
    v3 = result;
    v5 = v0[15];
    v4 = v0[16];
    v0[7] = v0 + 22;
    v0[2] = v0;
    v0[3] = sub_245866E00;
    v6 = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v7 = v0 + 10;
    v7[1] = 0x40000000;
    v7[2] = sub_245866CB4;
    v7[3] = &block_descriptor;
    v7[4] = v6;
    objc_msgSend(v3, sel_removeContentViewController_withUserInteractionEnabled_forService_context_completion_, v4, 0, v5, 0, v7);
    return (id)swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_245866E00()
{
  return swift_task_switch();
}

uint64_t sub_245866E44()
{
  uint64_t v0;
  void *v1;
  int v2;
  _BYTE *v3;

  v1 = *(void **)(v0 + 168);
  swift_release();
  v2 = *(unsigned __int8 *)(v0 + 176);

  if (v2 != 1)
  {
    sub_2458651B4();
    swift_allocError();
    *v3 = 4;
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245866ECC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_2574B6258 + dword_2574B6258);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2458671F4;
  return v5(a1);
}

uint64_t sub_245866F34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24586432C;
  return ScreenSharingAnnotationDisplayManager.detachViewController(forService:viewController:)(a1, a2);
}

uint64_t sub_245866F94(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[15] = a1;
  v2[16] = v1;
  sub_245869D80();
  v2[17] = sub_245869D74();
  v2[18] = sub_245869D68();
  v2[19] = v3;
  return swift_task_switch();
}

uint64_t sub_245867000()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[15];
  v1 = v0[16];
  v3 = sub_2458669A8();
  v0[20] = v3;
  v4 = *(_QWORD *)(v1 + 24);
  v0[21] = v4;
  v0[22] = *(_QWORD *)(v1 + 32);
  v0[7] = v0 + 23;
  v0[2] = v0;
  v0[3] = sub_2458670E0;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_245866CB4;
  v6[3] = &block_descriptor_8;
  v6[4] = v5;
  objc_msgSend(v3, sel_addContentViewController_withUserInteractionEnabled_forService_context_userInterfaceStyle_forWindowScene_completion_, v4, 0, v2, 0, 2, 0, v6);
  return swift_continuation_await();
}

uint64_t sub_2458670E0()
{
  return swift_task_switch();
}

uint64_t sub_245867124()
{
  uint64_t v0;
  void *v1;
  int v2;
  _BYTE *v4;

  v1 = *(void **)(v0 + 160);
  swift_release();
  v2 = *(unsigned __int8 *)(v0 + 184);

  if (v2 == 1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 176));
  sub_2458651B4();
  swift_allocError();
  *v4 = 3;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for ScreenSharingAnnotationDisplayManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for ScreenSharingAnnotationDisplayManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ScreenSharingAnnotationDisplayManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t ScreenSharingAnnotationCoordinator.__allocating_init(withService:displayManager:)(uint64_t a1, __int128 *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  ScreenSharingAnnotationCoordinator.init(withService:displayManager:)(a1, a2);
  return v4;
}

uint64_t ScreenSharingAnnotationCoordinator.init(withService:displayManager:)(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  _BYTE v5[40];

  swift_unknownObjectWeakInit();
  *(_OWORD *)(v2 + 65) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  sub_2458672E0(a2, (uint64_t)v5);
  swift_beginAccess();
  sub_2458672F8((uint64_t)v5, v2 + 24);
  swift_endAccess();
  return v2;
}

uint64_t sub_2458672E0(__int128 *a1, uint64_t a2)
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

uint64_t sub_2458672F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B6320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_245867340()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[10] = v0;
  sub_245869D80();
  v1[11] = sub_245869D74();
  v1[12] = sub_245869D68();
  v1[13] = v2;
  return swift_task_switch();
}

uint64_t sub_2458673AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 80);
  swift_beginAccess();
  if (*(_QWORD *)(v1 + 48))
  {
    v2 = *(_QWORD *)(v0 + 80);
    sub_245868BF4(v1 + 24, v0 + 16);
    v3 = *(_QWORD *)(v0 + 40);
    v4 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v3);
    v5 = MEMORY[0x24953D620](v2 + 16);
    *(_QWORD *)(v0 + 112) = v5;
    v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v4 + 8) + *(_QWORD *)(v4 + 8));
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v6;
    *v6 = v0;
    v6[1] = sub_2458674B0;
    return v10(v5, v3, v4);
  }
  else
  {
    swift_release();
    v8 = *(_QWORD *)(v0 + 80);
    v9 = *(void **)(v8 + 64);
    *(_QWORD *)(v8 + 64) = 0;
    *(_QWORD *)(v8 + 72) = 0;

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2458674B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 128) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    swift_unknownObjectRelease();
    *(_QWORD *)(v6 + 136) = a2;
    *(_QWORD *)(v6 + 144) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_245867530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v1;
  *(_QWORD *)(v3 + 72) = v2;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24586758C()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;

  v1 = *(void **)(v0 + 128);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_2458651B4();
  swift_allocError();
  *v2 = 3;
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245867618()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[10] = v0;
  sub_245869D80();
  v1[11] = sub_245869D74();
  v1[12] = sub_245869D68();
  v1[13] = v2;
  return swift_task_switch();
}

uint64_t sub_245867684()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, void *, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 80);
  swift_beginAccess();
  if (*(_QWORD *)(v1 + 48))
  {
    v2 = *(_QWORD *)(v0 + 80);
    sub_245868BF4(v1 + 24, v0 + 16);
    v3 = *(_QWORD *)(v0 + 40);
    v4 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v3);
    v5 = MEMORY[0x24953D620](v2 + 16);
    *(_QWORD *)(v0 + 112) = v5;
    v6 = *(void **)(v2 + 64);
    *(_QWORD *)(v0 + 120) = v6;
    v10 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))(**(int **)(v4 + 16) + *(_QWORD *)(v4 + 16));
    v7 = v6;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v8;
    *v8 = v0;
    v8[1] = sub_245867794;
    return v10(v5, v6, v3, v4);
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245867794()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = *(void **)(v2 + 120);
    swift_unknownObjectRelease();

  }
  return swift_task_switch();
}

uint64_t sub_245867804()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245867844()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _BYTE *v3;

  v1 = *(void **)(v0 + 136);
  v2 = *(void **)(v0 + 120);
  swift_release();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_2458651B4();
  swift_allocError();
  *v3 = 4;
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ScreenSharingAnnotationCoordinator.deinit()
{
  uint64_t v0;

  sub_245867908(v0 + 16);
  sub_24586792C(v0 + 24);

  return v0;
}

uint64_t sub_245867908(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_24586792C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B6320);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ScreenSharingAnnotationCoordinator.__deallocating_deinit()
{
  uint64_t v0;

  sub_245867908(v0 + 16);
  sub_24586792C(v0 + 24);

  return swift_deallocClassInstance();
}

uint64_t ScreenSharingAnnotationCoordinator.startAnnotationUIService()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[7] = v0;
  v2 = sub_245869D38();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_245869D80();
  v1[14] = sub_245869D74();
  v1[15] = sub_245869D68();
  v1[16] = v3;
  return swift_task_switch();
}

uint64_t sub_245867A5C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _QWORD *v16;

  sub_245869D20();
  swift_retain();
  v1 = sub_245869D2C();
  v2 = sub_245869D8C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 56);
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 67240192;
    *(_DWORD *)(v0 + 160) = *(unsigned __int8 *)(v3 + 80);
    sub_245869DA4();
    swift_release();
    _os_log_impl(&dword_245862000, v1, v2, "Coordinator asked to start Screen Sharing Annotation UI Service. isRunning=%{BOOL,public}d", v4, 8u);
    MEMORY[0x24953D5A8](v4, -1, -1);
  }
  else
  {
    swift_release();
  }

  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 56);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 72) + 8);
  *(_QWORD *)(v0 + 136) = v8;
  v8(v5, v6);
  if ((*(_BYTE *)(v7 + 80) & 1) != 0)
  {
    swift_release();
    sub_245869D20();
    v9 = sub_245869D2C();
    v10 = sub_245869D8C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_245862000, v9, v10, "Annotation UI Service already running.", v11, 2u);
      MEMORY[0x24953D5A8](v11, -1, -1);
    }
    v12 = *(_QWORD *)(v0 + 88);
    v13 = *(_QWORD *)(v0 + 64);

    v8(v12, v13);
    sub_2458651B4();
    swift_allocError();
    *v14 = 5;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_BYTE *)(v7 + 80) = 1;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v16;
    *v16 = v0;
    v16[1] = sub_245867CA4;
    return sub_245867340();
  }
}

uint64_t sub_245867CA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245867D04()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  swift_release();
  sub_245869D20();
  v1 = sub_245869D2C();
  v2 = sub_245869D8C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_245862000, v1, v2, "Coordinator did show Annotation UI on screen", v3, 2u);
    MEMORY[0x24953D5A8](v3, -1, -1);
  }
  v4 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  v5 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 64);

  v4(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245867E04()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;

  v1 = *(void **)(v0 + 152);
  swift_release();
  sub_245869D20();
  v2 = v1;
  v3 = v1;
  v4 = sub_245869D2C();
  v5 = sub_245869D98();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 152);
    v19 = *(_QWORD *)(v0 + 80);
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    v18 = *(_QWORD *)(v0 + 64);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v21 = v8;
    *(_DWORD *)v7 = 136446210;
    swift_getErrorValue();
    v9 = sub_245869E58();
    *(_QWORD *)(v0 + 48) = sub_245868AF0(v9, v10, &v21);
    sub_245869DA4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245862000, v4, v5, "Coordinator could not start Screen Sharing Annotation UI Service: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24953D5A8](v8, -1, -1);
    MEMORY[0x24953D5A8](v7, -1, -1);

    v20(v19, v18);
  }
  else
  {
    v11 = *(void **)(v0 + 152);
    v12 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    v13 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 64);

    v12(v13, v14);
  }
  v15 = *(void **)(v0 + 152);
  *(_BYTE *)(*(_QWORD *)(v0 + 56) + 80) = 0;
  sub_2458651B4();
  swift_allocError();
  *v16 = 1;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ScreenSharingAnnotationCoordinator.stopAnnotationUIService()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[7] = v0;
  v2 = sub_245869D38();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_245869D80();
  v1[14] = sub_245869D74();
  v1[15] = sub_245869D68();
  v1[16] = v3;
  return swift_task_switch();
}

uint64_t sub_245868118()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t ObjectType;
  void (*v13)(uint64_t, uint64_t);
  id v14;
  _QWORD *v15;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;

  sub_245869D20();
  swift_retain();
  v1 = sub_245869D2C();
  v2 = sub_245869D8C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 56);
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 67240192;
    *(_DWORD *)(v0 + 164) = *(unsigned __int8 *)(v3 + 80);
    sub_245869DA4();
    swift_release();
    _os_log_impl(&dword_245862000, v1, v2, "Coordinator asked to stop Screen Sharing Annotation UI Service. isRunning=%{BOOL,public}d", v4, 8u);
    MEMORY[0x24953D5A8](v4, -1, -1);
  }
  else
  {
    swift_release();
  }

  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 56);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 72) + 8);
  *(_QWORD *)(v0 + 136) = v8;
  v8(v5, v6);
  if (*(_BYTE *)(v7 + 80) == 1)
  {
    v9 = *(_QWORD *)(v0 + 56);
    *(_BYTE *)(v7 + 80) = 0;
    v10 = *(void **)(v9 + 64);
    if (v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 72);
      ObjectType = swift_getObjectType();
      v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v14 = v10;
      v13(ObjectType, v11);

    }
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v15;
    *v15 = v0;
    v15[1] = sub_24586839C;
    return sub_245867618();
  }
  else
  {
    swift_release();
    sub_245869D20();
    v17 = sub_245869D2C();
    v18 = sub_245869D8C();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_245862000, v17, v18, "Annotation UI Service already not running.", v19, 2u);
      MEMORY[0x24953D5A8](v19, -1, -1);
    }
    v20 = *(_QWORD *)(v0 + 88);
    v21 = *(_QWORD *)(v0 + 64);

    v8(v20, v21);
    sub_2458651B4();
    swift_allocError();
    *v22 = 6;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_24586839C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2458683FC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  void *v6;

  swift_release();
  sub_245869D20();
  swift_retain();
  v1 = sub_245869D2C();
  v2 = sub_245869D8C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 56);
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 67240192;
    *(_DWORD *)(v0 + 160) = *(unsigned __int8 *)(v3 + 80);
    sub_245869DA4();
    swift_release();
    _os_log_impl(&dword_245862000, v1, v2, "Coordinator did hide Screen Sharing UI on main screen (isRunning=%{BOOL,public}d)", v4, 8u);
    MEMORY[0x24953D5A8](v4, -1, -1);
  }
  else
  {
    swift_release();
  }

  v5 = *(_QWORD *)(v0 + 56);
  (*(void (**)(_QWORD, _QWORD))(v0 + 136))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 64));
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = 0;
  *(_QWORD *)(v5 + 72) = 0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245868548()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;

  v1 = *(void **)(v0 + 152);
  swift_release();
  sub_245869D20();
  v2 = v1;
  v3 = v1;
  v4 = sub_245869D2C();
  v5 = sub_245869D98();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 152);
    v19 = *(_QWORD *)(v0 + 80);
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    v18 = *(_QWORD *)(v0 + 64);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v21 = v8;
    *(_DWORD *)v7 = 136446210;
    swift_getErrorValue();
    v9 = sub_245869E58();
    *(_QWORD *)(v0 + 48) = sub_245868AF0(v9, v10, &v21);
    sub_245869DA4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245862000, v4, v5, "Coordinator could not stop Screen Sharing: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24953D5A8](v8, -1, -1);
    MEMORY[0x24953D5A8](v7, -1, -1);

    v20(v19, v18);
  }
  else
  {
    v11 = *(void **)(v0 + 152);
    v12 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    v13 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 64);

    v12(v13, v14);
  }
  v15 = *(void **)(v0 + 152);
  *(_BYTE *)(*(_QWORD *)(v0 + 56) + 80) = 1;
  sub_2458651B4();
  swift_allocError();
  *v16 = 2;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ScreenSharingAnnotationCoordinator.processTapGestureMessage(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 40) = *(_QWORD *)(a1 + 16);
  sub_245869D80();
  *(_QWORD *)(v2 + 48) = sub_245869D74();
  sub_245869D68();
  return swift_task_switch();
}

uint64_t sub_245868820()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(_QWORD *, uint64_t, uint64_t);
  id v9;
  _QWORD v11[3];

  v1 = *(_QWORD *)(v0 + 16);
  swift_release();
  v2 = *(void **)(v1 + 64);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 40);
    v5 = *(_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 72);
    ObjectType = swift_getObjectType();
    v11[0] = v5;
    v11[1] = v4;
    v11[2] = v3;
    v8 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v6 + 16);
    v9 = v2;
    v8(v11, ObjectType, v6);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ScreenSharingAnnotationCoordinator.processDragGestureMessage(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  sub_245869D80();
  v2[4] = sub_245869D74();
  sub_245869D68();
  return swift_task_switch();
}

uint64_t sub_245868924()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release();
  v2 = *(void **)(v1 + 64);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 16);
    v4 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 72);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24);
    v7 = v2;
    v6(v3, ObjectType, v4);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2458689A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245864510;
  return ScreenSharingAnnotationCoordinator.startAnnotationUIService()();
}

uint64_t sub_2458689E8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24586432C;
  return ScreenSharingAnnotationCoordinator.stopAnnotationUIService()();
}

uint64_t sub_245868A30(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24586432C;
  return ScreenSharingAnnotationCoordinator.processTapGestureMessage(_:)(a1);
}

uint64_t sub_245868A80(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;

  v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  sub_245869D80();
  v2[4] = sub_245869D74();
  sub_245869D68();
  return swift_task_switch();
}

uint64_t sub_245868AF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245868C38(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245865234((uint64_t)v12, *a3);
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
      sub_245865234((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for ScreenSharingAnnotationCoordinator()
{
  return objc_opt_self();
}

uint64_t method lookup function for ScreenSharingAnnotationCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ScreenSharingAnnotationCoordinator.__allocating_init(withService:displayManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_245868BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_245868C38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_245869DB0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245868DF0(a5, a6);
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
  v8 = sub_245869DEC();
  if (!v8)
  {
    sub_245869DF8();
    __break(1u);
LABEL_17:
    result = sub_245869E10();
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

uint64_t sub_245868DF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245868E84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24586905C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24586905C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245868E84(uint64_t a1, unint64_t a2)
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
      v3 = sub_245868FF8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245869DE0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245869DF8();
      __break(1u);
LABEL_10:
      v2 = sub_245869D5C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245869E10();
    __break(1u);
LABEL_14:
    result = sub_245869DF8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245868FF8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B6438);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24586905C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B6438);
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
  result = sub_245869E10();
  __break(1u);
  return result;
}

uint64_t sub_2458691AC(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0x746E696F70;
}

BOOL sub_2458691E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2458691FC()
{
  char *v0;

  return sub_2458691AC(*v0);
}

uint64_t sub_245869204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245869B3C(a1, a2);
  *a3 = result;
  return result;
}

void sub_245869228(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_245869234()
{
  sub_2458693D8();
  return sub_245869ED0();
}

uint64_t sub_24586925C()
{
  sub_2458693D8();
  return sub_245869EDC();
}

uint64_t TapGestureMessage.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B6440);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2458693D8();
  sub_245869EC4();
  v11[0] = v8;
  v11[1] = v9;
  v12 = 0;
  type metadata accessor for CGPoint();
  sub_2458695A4(&qword_2574B60E8, MEMORY[0x24BDBD878]);
  sub_245869E34();
  if (!v2)
  {
    LOBYTE(v11[0]) = 1;
    sub_245869E40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2458693D8()
{
  unint64_t result;

  result = qword_2574B6448;
  if (!qword_2574B6448)
  {
    result = MEMORY[0x24953D548](&unk_24586A888, &type metadata for TapGestureMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B6448);
  }
  return result;
}

uint64_t TapGestureMessage.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  char v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B6450);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2458693D8();
  sub_245869EB8();
  if (!v2)
  {
    type metadata accessor for CGPoint();
    v14 = 0;
    sub_2458695A4(&qword_2574B6100, MEMORY[0x24BDBD888]);
    sub_245869E1C();
    v9 = v13[0];
    v10 = v13[1];
    LOBYTE(v13[0]) = 1;
    v11 = sub_245869E28();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2458695A4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGPoint();
    result = MEMORY[0x24953D548](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2458695E4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return TapGestureMessage.init(from:)(a1, a2);
}

uint64_t sub_2458695F8(_QWORD *a1)
{
  return TapGestureMessage.encode(to:)(a1);
}

uint64_t TapGestureMessage.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  _BYTE *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[40];
  __int128 v18;
  __int128 v19;

  v14 = sub_245869CD8();
  sub_245869DD4();
  if (*(_QWORD *)(a1 + 16) && (v4 = sub_245865150((uint64_t)v17), (v5 & 1) != 0))
  {
    sub_245865234(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_245865180((uint64_t)v17);
  if (!*((_QWORD *)&v19 + 1))
    goto LABEL_16;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v6 = v14;
  v15 = sub_245869CE4();
  sub_245869DD4();
  if (*(_QWORD *)(a1 + 16) && (v7 = sub_245865150((uint64_t)v17), (v8 & 1) != 0))
  {
    sub_245865234(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_245865180((uint64_t)v17);
  if (!*((_QWORD *)&v19 + 1))
  {
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    sub_24586984C((uint64_t)&v18);
LABEL_19:
    sub_2458651B4();
    swift_allocError();
    *v12 = 7;
    return swift_willThrow();
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_18;
  v9 = v15;
  v16 = sub_245869CF0();
  sub_245869DD4();
  if (*(_QWORD *)(a1 + 16) && (v10 = sub_245865150((uint64_t)v17), (v11 & 1) != 0))
  {
    sub_245865234(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_245865180((uint64_t)v17);
  if (!*((_QWORD *)&v19 + 1))
    goto LABEL_17;
  result = swift_dynamicCast();
  if ((result & 1) == 0)
    goto LABEL_19;
  *a2 = v6;
  a2[1] = v9;
  a2[2] = v16;
  return result;
}

uint64_t sub_24586984C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B6110);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
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

uint64_t getEnumTagSinglePayload for TapGestureMessage(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TapGestureMessage(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TapGestureMessage()
{
  return &type metadata for TapGestureMessage;
}

uint64_t getEnumTagSinglePayload for TapGestureMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TapGestureMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2458699D8 + 4 * byte_24586A755[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245869A0C + 4 * byte_24586A750[v4]))();
}

uint64_t sub_245869A0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245869A14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245869A1CLL);
  return result;
}

uint64_t sub_245869A28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245869A30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245869A34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245869A3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_245869A48(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TapGestureMessage.CodingKeys()
{
  return &type metadata for TapGestureMessage.CodingKeys;
}

unint64_t sub_245869A68()
{
  unint64_t result;

  result = qword_2574B6458;
  if (!qword_2574B6458)
  {
    result = MEMORY[0x24953D548](&unk_24586A860, &type metadata for TapGestureMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B6458);
  }
  return result;
}

unint64_t sub_245869AB0()
{
  unint64_t result;

  result = qword_2574B6460;
  if (!qword_2574B6460)
  {
    result = MEMORY[0x24953D548](&unk_24586A7D0, &type metadata for TapGestureMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B6460);
  }
  return result;
}

unint64_t sub_245869AF8()
{
  unint64_t result;

  result = qword_2574B6468;
  if (!qword_2574B6468)
  {
    result = MEMORY[0x24953D548](&unk_24586A7F8, &type metadata for TapGestureMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B6468);
  }
  return result;
}

uint64_t sub_245869B3C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x746E696F70 && a2 == 0xE500000000000000;
  if (v3 || (sub_245869E4C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024586B1B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_245869E4C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_245869C18()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_245869C24()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_245869C30()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_245869C3C()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_245869C48()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_245869C54()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_245869C60()
{
  return MEMORY[0x24BE843F0]();
}

uint64_t sub_245869C6C()
{
  return MEMORY[0x24BE843F8]();
}

uint64_t sub_245869C78()
{
  return MEMORY[0x24BE84408]();
}

uint64_t sub_245869C84()
{
  return MEMORY[0x24BE84410]();
}

uint64_t sub_245869C90()
{
  return MEMORY[0x24BE84418]();
}

uint64_t sub_245869C9C()
{
  return MEMORY[0x24BE84420]();
}

uint64_t sub_245869CA8()
{
  return MEMORY[0x24BE84428]();
}

uint64_t sub_245869CB4()
{
  return MEMORY[0x24BE84440]();
}

uint64_t sub_245869CC0()
{
  return MEMORY[0x24BE84448]();
}

uint64_t sub_245869CCC()
{
  return MEMORY[0x24BE84458]();
}

uint64_t sub_245869CD8()
{
  return MEMORY[0x24BE84460]();
}

uint64_t sub_245869CE4()
{
  return MEMORY[0x24BE84468]();
}

uint64_t sub_245869CF0()
{
  return MEMORY[0x24BE84470]();
}

uint64_t sub_245869CFC()
{
  return MEMORY[0x24BE84478]();
}

uint64_t sub_245869D08()
{
  return MEMORY[0x24BE84480]();
}

uint64_t sub_245869D14()
{
  return MEMORY[0x24BE84488]();
}

uint64_t sub_245869D20()
{
  return MEMORY[0x24BE84490]();
}

uint64_t sub_245869D2C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245869D38()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245869D44()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_245869D50()
{
  return MEMORY[0x24BDEF1E8]();
}

uint64_t sub_245869D5C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245869D68()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245869D74()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_245869D80()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_245869D8C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_245869D98()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245869DA4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245869DB0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245869DBC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_245869DC8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_245869DD4()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_245869DE0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245869DEC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245869DF8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245869E04()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_245869E10()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245869E1C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_245869E28()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_245869E34()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_245869E40()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_245869E4C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245869E58()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_245869E64()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_245869E70()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_245869E7C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_245869E88()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_245869E94()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245869EA0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245869EAC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_245869EB8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_245869EC4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_245869ED0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_245869EDC()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

