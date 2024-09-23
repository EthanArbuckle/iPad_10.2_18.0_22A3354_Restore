void sub_21AB61EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id shcore_log_object()
{
  if (shcore_log_object_onceToken != -1)
    dispatch_once(&shcore_log_object_onceToken, &__block_literal_global_0);
  return (id)shcore_log_object_sLogObject;
}

void __shcore_log_object_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.shazam.ShazamCore", (const char *)objc_msgSend(CFSTR("core"), "cStringUsingEncoding:", 4));
  v1 = (void *)shcore_log_object_sLogObject;
  shcore_log_object_sLogObject = (uint64_t)v0;

}

void sub_21AB64718(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21AB64828(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21AB64A8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21AB64BB4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21AB65A28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21AB65D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t Dictionary.mapKeys<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  _QWORD v15[10];
  uint64_t v16;
  uint64_t v17;

  v17 = a3;
  v15[2] = a4;
  v15[3] = a5;
  v15[4] = a6;
  v15[5] = a7;
  v15[6] = a8;
  v15[7] = a1;
  v15[8] = a2;
  v9 = sub_21AB697E4();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25510FD58);
  v12 = MEMORY[0x220751D7C](MEMORY[0x24BEE04E8], v9);
  result = sub_21AB6899C((void (*)(char *, char *))sub_21AB68968, (uint64_t)v15, v9, TupleTypeMetadata2, v11, v12, MEMORY[0x24BEE3F20], (uint64_t)&v16);
  if (!v8)
  {
    v17 = result;
    v14 = sub_21AB69814();
    MEMORY[0x220751D7C](MEMORY[0x24BEE12C8], v14);
    return sub_21AB697D8();
  }
  return result;
}

uint64_t sub_21AB68818@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>, _QWORD *a7)
{
  uint64_t v7;
  uint64_t TupleTypeMetadata2;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = a5;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)v23 - v14;
  result = a2(a1);
  if (v7)
  {
    *a7 = v7;
  }
  else
  {
    v17 = a6 + *(int *)(swift_getTupleTypeMetadata2() + 48);
    v18 = *(int *)(TupleTypeMetadata2 + 48);
    v19 = &v15[v18];
    v20 = a1 + v18;
    v21 = *(_QWORD *)(a3 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v15, a1, a3);
    v22 = *(_QWORD *)(a4 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v19, v20, a4);
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v17, v19, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v15, a3);
  }
  return result;
}

uint64_t sub_21AB68968@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21AB68818(a1, *(uint64_t (**)(uint64_t))(v3 + 56), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), a3, a2);
}

uint64_t sub_21AB6899C(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  void (*v24)(char *, _QWORD);
  void (*v25)(char *);
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
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43[32];
  uint64_t v44;

  v30 = a5;
  v31 = a8;
  v38 = a1;
  v39 = a2;
  v29 = *(_QWORD *)(a5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v40 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = (char *)&v29 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(v17 - 8);
  v33 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v29 - v18;
  v20 = sub_21AB69850();
  if (!v20)
    return sub_21AB69808();
  v36 = AssociatedTypeWitness;
  v21 = v20;
  v44 = sub_21AB6988C();
  v34 = sub_21AB69898();
  sub_21AB69874();
  v37 = v8;
  result = sub_21AB69844();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21;
    v35 = v16;
    while (v23)
    {
      v41 = v23;
      v24 = (void (*)(char *, _QWORD))sub_21AB69868();
      v25 = *(void (**)(char *))(v11 + 16);
      v26 = v11;
      v27 = v36;
      v25(v14);
      v24(v43, 0);
      v28 = v42;
      v38(v14, v40);
      if (v28)
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v40, v30);
      }
      v42 = 0;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
      sub_21AB69880();
      result = sub_21AB6985C();
      v23 = v41 - 1;
      v11 = v26;
      if (v41 == 1)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v44;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220751D70]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21AB68DE8(const void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = _Block_copy(a1);
  v4 = (uint64_t (__cdecl *)())((char *)&dword_25510FDB0 + dword_25510FDB0);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_21AB68E48;
  return v4();
}

uint64_t sub_21AB68E48()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD, _QWORD))(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  v2 = (void *)sub_21AB697F0();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v2);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

SHStorefront __swiftcall SHStorefront.init()()
{
  return (SHStorefront)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SHStorefront.init()()
{
  objc_super v1;

  v1.super_class = (Class)SHStorefront;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for SHStorefront()
{
  unint64_t result;

  result = qword_25510FD60;
  if (!qword_25510FD60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25510FD60);
  }
  return result;
}

uint64_t sub_21AB68FA0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_21AB68FCC()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  _QWORD *v3;

  v2 = *(const void **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21AB6978C;
  return ((uint64_t (*)(const void *))((char *)&dword_25510FD70 + dword_25510FD70))(v2);
}

uint64_t sub_21AB69030(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_21AB6978C;
  return v6();
}

uint64_t sub_21AB69088()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_21AB6978C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_25510FD80 + dword_25510FD80))(v2, v3, v4);
}

uint64_t sub_21AB69100(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_21AB6978C;
  return v7();
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AB69184(uint64_t a1)
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
  v7[1] = sub_21AB69208;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25510FD90 + dword_25510FD90))(a1, v4, v5, v6);
}

uint64_t sub_21AB69208()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21AB69250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21AB69838();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21AB6982C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21AB69750(a1, &qword_25510FD68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21AB69820();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21AB6939C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21AB69400;
  return v6(a1);
}

uint64_t sub_21AB69400()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21AB6944C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AB69470(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21AB69208;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25510FDA0 + dword_25510FDA0))(a1, v4);
}

uint64_t sub_21AB694E0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_21AB697C0();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25510FDB8);
  v0[5] = swift_task_alloc();
  v2 = (_QWORD *)swift_task_alloc();
  v0[6] = v2;
  *v2 = v0;
  v2[1] = sub_21AB69574;
  return sub_21AB697CC();
}

uint64_t sub_21AB69574(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  swift_task_dealloc();
  if (v2)
  {

  }
  else
  {
    *(_QWORD *)(v6 + 56) = a2;
    *(_QWORD *)(v6 + 64) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_21AB695F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_21AB697FC();
  v3 = v2;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v3);
}

uint64_t sub_21AB69654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  sub_21AB69790();
  sub_21AB697B4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  v5 = sub_21AB697A8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5);
  v8 = *(_QWORD *)(v0 + 40);
  if (v7 == 1)
  {
    sub_21AB69750(*(_QWORD *)(v0 + 40), &qword_25510FDB8);
    v9 = 0xE100000000000000;
    v10 = 45;
  }
  else
  {
    sub_21AB6979C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
    v10 = sub_21AB697FC();
    v9 = v11;
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v10, v9);
}

uint64_t sub_21AB69750(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21AB69790()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_21AB6979C()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_21AB697A8()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_21AB697B4()
{
  return MEMORY[0x24BDCED50]();
}

uint64_t sub_21AB697C0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21AB697CC()
{
  return MEMORY[0x24BDDE828]();
}

uint64_t sub_21AB697D8()
{
  return MEMORY[0x24BEE02B8]();
}

uint64_t sub_21AB697E4()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_21AB697F0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21AB697FC()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_21AB69808()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_21AB69814()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21AB69820()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21AB6982C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21AB69838()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21AB69844()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21AB69850()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21AB6985C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21AB69868()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21AB69874()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_21AB69880()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_21AB6988C()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_21AB69898()
{
  return MEMORY[0x24BEE2A08]();
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x24BED29E8](s);
}

ssize_t AAArchiveStreamProcess(AAArchiveStream istream, AAArchiveStream ostream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x24BED29F0](istream, ostream, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x24BED2A38](s);
}

AAArchiveStream AADecodeArchiveInputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x24BED2B50](stream, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

AAByteStream AADecompressionInputStreamOpen(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x24BED2B58](compressed_stream, flags, *(_QWORD *)&n_threads);
}

AAArchiveStream AAExtractArchiveOutputStreamOpen(const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x24BED2C10](dir, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x24BED2C90](path, *(_QWORD *)&open_flags, open_mode);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x24BEDB998](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB9A8](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x24BEDB9B0](stream, *(_QWORD *)&flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t tcc_authorization_check_audit_token()
{
  return MEMORY[0x24BEB39A0]();
}

