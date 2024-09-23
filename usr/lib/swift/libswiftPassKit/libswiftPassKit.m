uint64_t JPKIPassContents.userIdentity.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_retain();
}

uint64_t JPKIPassContents.signingIdentity.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
  return swift_retain();
}

uint64_t JPKIPassContents.init(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_21FD52FB4();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  v4 = sub_21FD52F9C();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_255576258);
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21FD4C848()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _BYTE *v4;

  sub_21FD4E5B8(*(void **)(v0 + 24));
  if (v1)
  {
    sub_21FD53020();
    swift_allocObject();
    *(_QWORD *)(v0 + 104) = sub_21FD52FE4();
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v2;
    *v2 = v0;
    v2[1] = sub_21FD4C974;
    return sub_21FD52FFC();
  }
  else
  {
    sub_21FD4E6A0();
    swift_allocError();
    *v4 = 4;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21FD4C974()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21FD4C9C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, unint64_t, uint64_t);
  int v12;
  void (*v13)(_QWORD, _QWORD);
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  char v25;
  int v26;
  char v27;

  v1 = *(_QWORD *)(v0 + 96);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v7 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    if (v7)
    {
      v8 = *(_QWORD *)(v0 + 40);
      v9 = *(_QWORD *)v1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
      v10 = *(_QWORD *)(v8 + 72);
      v11 = *(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
      v12 = *MEMORY[0x24BE828E8];
      v26 = *MEMORY[0x24BE828F0];
      swift_bridgeObjectRetain();
      v25 = 0;
      v27 = 0;
      do
      {
        v15 = *(_QWORD *)(v0 + 48);
        v14 = *(_QWORD *)(v0 + 56);
        v16 = *(_QWORD *)(v0 + 32);
        v11(v14, v9, v16);
        v11(v15, v14, v16);
        v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 88))(v15, v16);
        if (v17 == v12)
        {
          v13 = *(void (**)(_QWORD, _QWORD))(v8 + 8);
          v27 = 1;
        }
        else
        {
          v13 = *(void (**)(_QWORD, _QWORD))(v8 + 8);
          if (v17 == v26)
            v25 = 1;
          else
            v13(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
        }
        v13(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 32));
        v9 += v10;
        --v7;
      }
      while (v7);
      v18 = *(void **)(v0 + 24);
      swift_bridgeObjectRelease_n();

      if ((v27 & 1) != 0)
      {
        v19 = swift_retain();
        if ((v25 & 1) != 0)
        {
          v20 = v19;
LABEL_17:
          v21 = v19;
          swift_retain();
          v19 = v20;
LABEL_20:
          v22 = *(_QWORD *)(v0 + 104);
          v23 = *(uint64_t **)(v0 + 16);
          *v23 = v19;
          v23[1] = v21;
          v23[2] = v22;
          swift_release();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          v6 = *(uint64_t (**)(void))(v0 + 8);
          return v6();
        }
LABEL_19:
        v21 = 0;
        goto LABEL_20;
      }
      if ((v25 & 1) != 0)
      {
        v20 = 0;
        v19 = *(_QWORD *)(v0 + 104);
        goto LABEL_17;
      }
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    v19 = 0;
    goto LABEL_19;
  }
  v3 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v4);
  sub_21FD4F3F8(&qword_255576268, (uint64_t (*)(uint64_t))MEMORY[0x24BE828C0], MEMORY[0x24BE828D0]);
  swift_willThrowTypedImpl();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_21FD4E6A0();
  swift_allocError();
  *v5 = 4;
  swift_willThrow();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207D264C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t JPKIPassContents.UserIdentity.certificate(using:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = sub_21FD52F9C();
  *(_QWORD *)(v3 + 24) = v5;
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 40) = swift_task_alloc();
  v6 = sub_21FD52FD8();
  *(_QWORD *)(v3 + 48) = v6;
  *(_QWORD *)(v3 + 56) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 64) = swift_task_alloc();
  v7 = sub_21FD52FB4();
  *(_QWORD *)(v3 + 72) = v7;
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 88) = swift_task_alloc();
  *(_QWORD *)(v3 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_255576278);
  v8 = swift_task_alloc();
  *(_BYTE *)(v3 + 144) = *(_BYTE *)a2;
  v9 = *(_QWORD *)(a2 + 8);
  v10 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v3 + 104) = v8;
  *(_QWORD *)(v3 + 112) = v9;
  v11 = *v2;
  *(_QWORD *)(v3 + 120) = v10;
  *(_QWORD *)(v3 + 128) = v11;
  return swift_task_switch();
}

uint64_t sub_21FD4CDD0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(unsigned __int8 *)(v0 + 144);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 104))(*(_QWORD *)(v0 + 88), *MEMORY[0x24BE828E8], *(_QWORD *)(v0 + 72));
  if (v1 == 1)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 104))(*(_QWORD *)(v0 + 64), *MEMORY[0x24BE82920], *(_QWORD *)(v0 + 48));
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 120);
    v4 = *(_QWORD *)(v0 + 56);
    v3 = *(_QWORD **)(v0 + 64);
    *v3 = *(_QWORD *)(v0 + 112);
    v3[1] = v2;
    (*(void (**)(void))(v4 + 104))();
    swift_bridgeObjectRetain();
  }
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v5;
  *v5 = v0;
  v5[1] = sub_21FD4CEA0;
  return sub_21FD53008();
}

uint64_t sub_21FD4CEA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_21FD4CF30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 104);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = *(_QWORD *)(v0 + 32);
    v2 = *(_QWORD *)(v0 + 40);
    v4 = *(_QWORD *)(v0 + 24);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v4);
    sub_21FD4F3F8(&qword_255576268, (uint64_t (*)(uint64_t))MEMORY[0x24BE828C0], MEMORY[0x24BE828D0]);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    sub_21FD4E6A0();
    swift_allocError();
    *v5 = 4;
    swift_willThrow();
  }
  else
  {
    v6 = *(uint64_t **)(v0 + 16);
    v7 = sub_21FD52FA8();
    v9 = v8;
    swift_release();
    *v6 = v7;
    v6[1] = v9;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t JPKIPassContents.UserIdentity.signature(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 16) = a1;
  v7 = sub_21FD52F9C();
  *(_QWORD *)(v5 + 40) = v7;
  *(_QWORD *)(v5 + 48) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 56) = swift_task_alloc();
  v8 = sub_21FD52FD8();
  *(_QWORD *)(v5 + 64) = v8;
  *(_QWORD *)(v5 + 72) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v5 + 80) = swift_task_alloc();
  v9 = sub_21FD52FB4();
  *(_QWORD *)(v5 + 88) = v9;
  *(_QWORD *)(v5 + 96) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v5 + 104) = swift_task_alloc();
  *(_QWORD *)(v5 + 112) = __swift_instantiateConcreteTypeFromMangledName(&qword_255576288);
  v10 = swift_task_alloc();
  *(_BYTE *)(v5 + 160) = *(_BYTE *)a4;
  v11 = *(_QWORD *)(a4 + 8);
  v12 = *(_QWORD *)(a4 + 16);
  *(_QWORD *)(v5 + 120) = v10;
  *(_QWORD *)(v5 + 128) = v11;
  v13 = *v4;
  *(_QWORD *)(v5 + 136) = v12;
  *(_QWORD *)(v5 + 144) = v13;
  return swift_task_switch();
}

uint64_t sub_21FD4D18C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(unsigned __int8 *)(v0 + 160);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 104))(*(_QWORD *)(v0 + 104), *MEMORY[0x24BE828E8], *(_QWORD *)(v0 + 88));
  if (v1 == 1)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 104))(*(_QWORD *)(v0 + 80), *MEMORY[0x24BE82920], *(_QWORD *)(v0 + 64));
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 136);
    v4 = *(_QWORD *)(v0 + 72);
    v3 = *(_QWORD **)(v0 + 80);
    *v3 = *(_QWORD *)(v0 + 128);
    v3[1] = v2;
    (*(void (**)(void))(v4 + 104))();
    swift_bridgeObjectRetain();
  }
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v5;
  *v5 = v0;
  v5[1] = sub_21FD4D260;
  return sub_21FD53014();
}

uint64_t sub_21FD4D260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_21FD4D2F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 120);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = *(_QWORD *)(v0 + 48);
    v2 = *(_QWORD *)(v0 + 56);
    v4 = *(_QWORD *)(v0 + 40);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v4);
    sub_21FD4F3F8(&qword_255576268, (uint64_t (*)(uint64_t))MEMORY[0x24BE828C0], MEMORY[0x24BE828D0]);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    sub_21FD4E6A0();
    swift_allocError();
    *v5 = 4;
    swift_willThrow();
  }
  else
  {
    v6 = *(uint64_t **)(v0 + 16);
    v7 = sub_21FD52FCC();
    v9 = v8;
    sub_21FD52FC0();
    v10 = sub_21FD52FA8();
    v12 = v11;
    swift_release();
    swift_release();
    *v6 = v7;
    v6[1] = v9;
    v6[2] = v10;
    v6[3] = v12;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t JPKIPassContents.UserIdentity.changePIN(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  v6 = sub_21FD52F9C();
  v5[6] = v6;
  v5[7] = *(_QWORD *)(v6 - 8);
  v5[8] = swift_task_alloc();
  v7 = sub_21FD52FB4();
  v5[9] = v7;
  v5[10] = *(_QWORD *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_255576298);
  v5[13] = swift_task_alloc();
  v8 = sub_21FD52FD8();
  v5[14] = v8;
  v5[15] = *(_QWORD *)(v8 - 8);
  v5[16] = swift_task_alloc();
  v9 = swift_task_alloc();
  v10 = *v4;
  v5[17] = v9;
  v5[18] = v10;
  return swift_task_switch();
}

uint64_t sub_21FD4D570()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  _QWORD *v12;
  uint64_t v14;

  v2 = (_QWORD *)v0[16];
  v1 = (_QWORD *)v0[17];
  v4 = v0[14];
  v3 = v0[15];
  v5 = v0[10];
  v14 = v0[11];
  v6 = v0[9];
  v8 = v0[4];
  v7 = v0[5];
  v9 = v0[3];
  *v1 = v0[2];
  v1[1] = v9;
  v10 = *MEMORY[0x24BE82928];
  v11 = *(void (**)(void))(v3 + 104);
  v11();
  *v2 = v8;
  v2[1] = v7;
  ((void (*)(_QWORD *, uint64_t, uint64_t))v11)(v2, v10, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v14, *MEMORY[0x24BE828E8], v6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = (_QWORD *)swift_task_alloc();
  v0[19] = v12;
  *v12 = v0;
  v12[1] = sub_21FD4D66C;
  return sub_21FD52FF0();
}

uint64_t sub_21FD4D66C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_21FD4D6E0()
{
  uint64_t v0;
  uint64_t v1;
  int EnumCaseMultiPayload;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  void (*v11)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 104);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 64);
  if (EnumCaseMultiPayload == 1)
  {
    v8 = *(_QWORD *)(v0 + 48);
    v9 = *(_QWORD *)(v0 + 56);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v9 + 32))(*(_QWORD *)(v0 + 64), v1, v8);
    sub_21FD4F3F8(&qword_255576268, (uint64_t (*)(uint64_t))MEMORY[0x24BE828C0], MEMORY[0x24BE828D0]);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    sub_21FD4E6A0();
    swift_allocError();
    *v10 = 1;
    swift_willThrow();
    v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v11(v3, v5);
  }
  else
  {
    v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v11(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
  }
  v11(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21FD4D868(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21FD4D8C8;
  return JPKIPassContents.UserIdentity.certificate(using:)(a1, a2);
}

uint64_t sub_21FD4D8C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21FD4D910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_21FD4F468;
  return JPKIPassContents.UserIdentity.signature(for:using:)(a1, a2, a3, a4);
}

uint64_t JPKIPassContents.SigningIdentity.certificate(using:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3[2] = a1;
  v5 = sub_21FD52F9C();
  v3[3] = v5;
  v3[4] = *(_QWORD *)(v5 - 8);
  v3[5] = swift_task_alloc();
  v6 = sub_21FD52FD8();
  v3[6] = v6;
  v3[7] = *(_QWORD *)(v6 - 8);
  v3[8] = swift_task_alloc();
  v7 = sub_21FD52FB4();
  v3[9] = v7;
  v3[10] = *(_QWORD *)(v7 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_255576278);
  v8 = swift_task_alloc();
  v9 = *(_QWORD *)(a2 + 8);
  v10 = *(_QWORD *)(a2 + 16);
  v3[13] = v8;
  v3[14] = v9;
  v11 = *v2;
  v3[15] = v10;
  v3[16] = v11;
  return swift_task_switch();
}

uint64_t sub_21FD4DA70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[14];
  v1 = v0[15];
  v3 = (_QWORD *)v0[8];
  v4 = v0[6];
  v5 = v0[7];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[10] + 104))(v0[11], *MEMORY[0x24BE828F0], v0[9]);
  *v3 = v2;
  v3[1] = v1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v3, *MEMORY[0x24BE82928], v4);
  swift_bridgeObjectRetain();
  v6 = (_QWORD *)swift_task_alloc();
  v0[17] = v6;
  *v6 = v0;
  v6[1] = sub_21FD4CEA0;
  return sub_21FD53008();
}

uint64_t JPKIPassContents.SigningIdentity.signature(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v7 = sub_21FD52F9C();
  v5[5] = v7;
  v5[6] = *(_QWORD *)(v7 - 8);
  v5[7] = swift_task_alloc();
  v8 = sub_21FD52FD8();
  v5[8] = v8;
  v5[9] = *(_QWORD *)(v8 - 8);
  v5[10] = swift_task_alloc();
  v9 = sub_21FD52FB4();
  v5[11] = v9;
  v5[12] = *(_QWORD *)(v9 - 8);
  v5[13] = swift_task_alloc();
  v5[14] = __swift_instantiateConcreteTypeFromMangledName(&qword_255576288);
  v10 = swift_task_alloc();
  v11 = *(_QWORD *)(a4 + 8);
  v12 = *(_QWORD *)(a4 + 16);
  v5[15] = v10;
  v5[16] = v11;
  v13 = *v4;
  v5[17] = v12;
  v5[18] = v13;
  return swift_task_switch();
}

uint64_t sub_21FD4DC18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[16];
  v1 = v0[17];
  v3 = (_QWORD *)v0[10];
  v4 = v0[8];
  v5 = v0[9];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[12] + 104))(v0[13], *MEMORY[0x24BE828F0], v0[11]);
  *v3 = v2;
  v3[1] = v1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v3, *MEMORY[0x24BE82928], v4);
  swift_bridgeObjectRetain();
  v6 = (_QWORD *)swift_task_alloc();
  v0[19] = v6;
  *v6 = v0;
  v6[1] = sub_21FD4D260;
  return sub_21FD53014();
}

uint64_t JPKIPassContents.SigningIdentity.changePassword(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  v6 = sub_21FD52F9C();
  v5[6] = v6;
  v5[7] = *(_QWORD *)(v6 - 8);
  v5[8] = swift_task_alloc();
  v7 = sub_21FD52FB4();
  v5[9] = v7;
  v5[10] = *(_QWORD *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_255576298);
  v5[13] = swift_task_alloc();
  v8 = sub_21FD52FD8();
  v5[14] = v8;
  v5[15] = *(_QWORD *)(v8 - 8);
  v5[16] = swift_task_alloc();
  v9 = swift_task_alloc();
  v10 = *v4;
  v5[17] = v9;
  v5[18] = v10;
  return swift_task_switch();
}

uint64_t sub_21FD4DDC8()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  _QWORD *v12;
  uint64_t v14;

  v2 = (_QWORD *)v0[16];
  v1 = (_QWORD *)v0[17];
  v4 = v0[14];
  v3 = v0[15];
  v5 = v0[10];
  v14 = v0[11];
  v6 = v0[9];
  v8 = v0[4];
  v7 = v0[5];
  v9 = v0[3];
  *v1 = v0[2];
  v1[1] = v9;
  v10 = *MEMORY[0x24BE82928];
  v11 = *(void (**)(void))(v3 + 104);
  v11();
  *v2 = v8;
  v2[1] = v7;
  ((void (*)(_QWORD *, uint64_t, uint64_t))v11)(v2, v10, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v14, *MEMORY[0x24BE828F0], v6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = (_QWORD *)swift_task_alloc();
  v0[19] = v12;
  *v12 = v0;
  v12[1] = sub_21FD4DEC4;
  return sub_21FD52FF0();
}

uint64_t sub_21FD4DEC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_21FD4DF38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21FD4F468;
  return JPKIPassContents.SigningIdentity.certificate(using:)(a1, a2);
}

uint64_t sub_21FD4DF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_21FD4F468;
  return JPKIPassContents.SigningIdentity.signature(for:using:)(a1, a2, a3, a4);
}

uint64_t JPKIPassContents.Certificate.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_21FD4E6E4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t JPKIPassContents.Signature.signatureData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_21FD4E6E4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t JPKIPassContents.Signature.certificate.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  *a1 = v2;
  a1[1] = v3;
  return sub_21FD4E6E4(v2, v3);
}

BOOL static JPKIPassContents.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t JPKIPassContents.Error.hash(into:)()
{
  return sub_21FD531B8();
}

uint64_t JPKIPassContents.Error.hashValue.getter()
{
  sub_21FD531AC();
  sub_21FD531B8();
  return sub_21FD531D0();
}

BOOL sub_21FD4E0FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21FD4E110()
{
  sub_21FD531AC();
  sub_21FD531B8();
  return sub_21FD531D0();
}

uint64_t sub_21FD4E154()
{
  return sub_21FD531B8();
}

uint64_t sub_21FD4E17C()
{
  sub_21FD531AC();
  sub_21FD531B8();
  return sub_21FD531D0();
}

uint64_t *JPKIPassContents.AuthenticationRequest<>.init(type:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = result[1];
  if (v2)
  {
    v3 = *result;
    v4 = result[1];
  }
  else
  {
    v3 = 0;
    v4 = 0xE000000000000000;
  }
  *(_BYTE *)a2 = v2 == 0;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v4;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;

  v2 = *result;
  v3 = result[1];
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_21FD4E20C(uint64_t a1, uint64_t a2)
{
  return sub_21FD4E444(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_21FD4E218(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_21FD53038();
  *a2 = 0;
  return result;
}

uint64_t sub_21FD4E28C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_21FD53044();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21FD4E308@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_21FD53050();
  v2 = sub_21FD5302C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21FD4E348@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21FD5302C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21FD4E38C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_21FD53050();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21FD4E3B4()
{
  sub_21FD4F3F8(&qword_2555764E0, (uint64_t (*)(uint64_t))type metadata accessor for PKPaymentNetwork, (uint64_t)&unk_21FD537B0);
  sub_21FD4F3F8(&qword_2555764E8, (uint64_t (*)(uint64_t))type metadata accessor for PKPaymentNetwork, (uint64_t)&unk_21FD53750);
  return sub_21FD53140();
}

uint64_t sub_21FD4E438(uint64_t a1, uint64_t a2)
{
  return sub_21FD4E444(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_21FD4E444(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21FD53050();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21FD4E480()
{
  sub_21FD53050();
  sub_21FD53074();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FD4E4C0()
{
  uint64_t v0;

  sub_21FD53050();
  sub_21FD531AC();
  sub_21FD53074();
  v0 = sub_21FD531D0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21FD4E530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_21FD53050();
  v2 = v1;
  if (v0 == sub_21FD53050() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_21FD53158();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21FD4E5B8(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v2 = objc_msgSend(a1, sel_secureElementPass);
  if (!v2)
    return 0;
  v3 = v2;
  if (!objc_msgSend(v2, sel_isDevicePrimaryPaymentApplicationPersonalized))
    goto LABEL_7;
  v4 = objc_msgSend(v3, sel_devicePrimaryPaymentApplication);
  v5 = v4;
  if (!v4)
  {

    return 0;
  }
  v6 = objc_msgSend(v4, sel_paymentNetworkIdentifier);

  if (v6 != (id)138 || (v7 = objc_msgSend(a1, sel_uniqueID)) == 0)
  {
LABEL_7:

    return 0;
  }
  v8 = v7;
  v9 = sub_21FD53050();

  return v9;
}

unint64_t sub_21FD4E6A0()
{
  unint64_t result;

  result = qword_255576260;
  if (!qword_255576260)
  {
    result = MEMORY[0x2207D2658](&protocol conformance descriptor for JPKIPassContents.Error, &type metadata for JPKIPassContents.Error);
    atomic_store(result, (unint64_t *)&qword_255576260);
  }
  return result;
}

uint64_t sub_21FD4E6E4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

_UNKNOWN **sub_21FD4E728()
{
  return &protocol witness table for JPKIPassContents.UserIdentity;
}

_UNKNOWN **sub_21FD4E734()
{
  return &protocol witness table for JPKIPassContents.SigningIdentity;
}

unint64_t sub_21FD4E744()
{
  unint64_t result;

  result = qword_255576328;
  if (!qword_255576328)
  {
    result = MEMORY[0x2207D2658](&protocol conformance descriptor for JPKIPassContents.Error, &type metadata for JPKIPassContents.Error);
    atomic_store(result, (unint64_t *)&qword_255576328);
  }
  return result;
}

uint64_t destroy for JPKIPassContents()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *_s7PassKit16JPKIPassContentsVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for JPKIPassContents(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for JPKIPassContents(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for JPKIPassContents()
{
  return &type metadata for JPKIPassContents;
}

uint64_t dispatch thunk of JPKIPassContents.Identity.certificate(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_21FD4D8C8;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of JPKIPassContents.Identity.signature(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 32)
                                                                                     + *(_QWORD *)(a6 + 32));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_21FD4F468;
  return v15(a1, a2, a3, a4, a5, a6);
}

ValueMetadata *type metadata accessor for JPKIPassContents.UserIdentity()
{
  return &type metadata for JPKIPassContents.UserIdentity;
}

_QWORD *initializeBufferWithCopyOfBuffer for JPKIPassContents.UserIdentity.AuthenticationType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for JPKIPassContents.UserIdentity.AuthenticationType()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for JPKIPassContents.UserIdentity.AuthenticationType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JPKIPassContents.UserIdentity.AuthenticationType(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for JPKIPassContents.UserIdentity.AuthenticationType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_21FD4EB44(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_21FD4EB60(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for JPKIPassContents.UserIdentity.AuthenticationType()
{
  return &type metadata for JPKIPassContents.UserIdentity.AuthenticationType;
}

ValueMetadata *type metadata accessor for JPKIPassContents.SigningIdentity()
{
  return &type metadata for JPKIPassContents.SigningIdentity;
}

_QWORD *_s7PassKit16JPKIPassContentsV12UserIdentityV18AuthenticationTypeOwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JPKIPassContents.SigningIdentity.AuthenticationType(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for JPKIPassContents.SigningIdentity.AuthenticationType(uint64_t result, int a2, int a3)
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

uint64_t sub_21FD4EC64()
{
  return 0;
}

ValueMetadata *type metadata accessor for JPKIPassContents.SigningIdentity.AuthenticationType()
{
  return &type metadata for JPKIPassContents.SigningIdentity.AuthenticationType;
}

uint64_t sub_21FD4EC7C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t *sub_21FD4EC84(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_21FD4E6E4(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_21FD4ECC0(uint64_t a1)
{
  return sub_21FD4ECCC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t sub_21FD4ECCC(uint64_t a1, unint64_t a2)
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

uint64_t *sub_21FD4ED10(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_21FD4E6E4(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_21FD4ECCC(v5, v6);
  return a1;
}

uint64_t *sub_21FD4ED54(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_21FD4ECCC(v3, v4);
  return a1;
}

uint64_t sub_21FD4ED8C(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t sub_21FD4EDE0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t type metadata accessor for JPKIPassContents.Certificate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JPKIPassContents.Certificate);
}

uint64_t sub_21FD4EE38(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_21FD4EE68(uint64_t a1)
{
  sub_21FD4ECCC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return sub_21FD4ECCC(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t *sub_21FD4EE94(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_21FD4E6E4(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v7 = a2[2];
  v6 = a2[3];
  sub_21FD4E6E4(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *sub_21FD4EEE8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *a2;
  v5 = a2[1];
  sub_21FD4E6E4(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_21FD4ECCC(v6, v7);
  v9 = a2[2];
  v8 = a2[3];
  sub_21FD4E6E4(v9, v8);
  v10 = a1[2];
  v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_21FD4ECCC(v10, v11);
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

uint64_t *sub_21FD4EF58(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_21FD4ECCC(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_21FD4ECCC(v6, v7);
  return a1;
}

uint64_t sub_21FD4EFA0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t sub_21FD4EFF4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t type metadata accessor for JPKIPassContents.Signature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JPKIPassContents.Signature);
}

uint64_t sub_21FD4F054()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FD4F05C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FD4F090(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21FD4F0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7PassKit16JPKIPassContentsVwet_0(uint64_t a1, int a2)
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

uint64_t sub_21FD4F158(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for JPKIPassContents.AuthenticationRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JPKIPassContents.AuthenticationRequest);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JPKIPassContents.Error(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JPKIPassContents.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21FD4F290 + 4 * byte_21FD534A5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21FD4F2C4 + 4 * byte_21FD534A0[v4]))();
}

uint64_t sub_21FD4F2C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FD4F2CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FD4F2D4);
  return result;
}

uint64_t sub_21FD4F2E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FD4F2E8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21FD4F2EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FD4F2F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FD4F300(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21FD4F308(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for JPKIPassContents.Error()
{
  return &type metadata for JPKIPassContents.Error;
}

void type metadata accessor for PKPaymentNetwork()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2555764C0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2555764C0);
  }
}

uint64_t sub_21FD4F374()
{
  return sub_21FD4F3F8(&qword_2555764C8, (uint64_t (*)(uint64_t))type metadata accessor for PKPaymentNetwork, (uint64_t)&unk_21FD53714);
}

uint64_t sub_21FD4F3A0()
{
  return sub_21FD4F3F8(&qword_2555764D0, (uint64_t (*)(uint64_t))type metadata accessor for PKPaymentNetwork, (uint64_t)&unk_21FD536E8);
}

uint64_t sub_21FD4F3CC()
{
  return sub_21FD4F3F8(&qword_2555764D8, (uint64_t (*)(uint64_t))type metadata accessor for PKPaymentNetwork, (uint64_t)&unk_21FD53784);
}

uint64_t sub_21FD4F3F8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2207D2658](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2207D2628](a1, v6, a5);
}

id sub_21FD4F47C(void *a1)
{
  return objc_msgSend(a1, sel_isBlacklisted);
}

id static PKStoredValuePassBalance.== infix(_:_:)(void *a1, uint64_t a2)
{
  return objc_msgSend(a1, sel_isEqualToBalance_, a2);
}

uint64_t PKStoredValuePassBalance.amount.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_amount);
  v2 = MEMORY[0x2207D2364]();

  return v2;
}

id static PKPaymentRequest.paymentCouponCodeInvalidError(localizedDescription:)(uint64_t a1, uint64_t a2)
{
  return sub_21FD4F51C(a1, a2, (SEL *)&selRef_paymentCouponCodeInvalidErrorWithLocalizedDescription_);
}

id static PKPaymentRequest.paymentCouponCodeExpiredError(localizedDescription:)(uint64_t a1, uint64_t a2)
{
  return sub_21FD4F51C(a1, a2, (SEL *)&selRef_paymentCouponCodeExpiredErrorWithLocalizedDescription_);
}

id sub_21FD4F51C(uint64_t a1, uint64_t a2, SEL *a3)
{
  void *v4;
  id v5;

  if (a2)
    v4 = (void *)sub_21FD5302C();
  else
    v4 = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a3, v4);

  return v5;
}

unint64_t PKPaymentRequest.applePayLaterAvailability.getter@<X0>(_BYTE *a1@<X8>)
{
  void *v1;
  unint64_t result;

  result = (unint64_t)objc_msgSend(v1, sel_applePayLaterAvailability);
  if (result >= 3)
  {
    result = sub_21FD53134();
    __break(1u);
  }
  else
  {
    *a1 = 0x10002u >> (8 * result);
  }
  return result;
}

unint64_t sub_21FD4F618@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = (unint64_t)objc_msgSend(*a1, sel_applePayLaterAvailability);
  if (result >= 3)
  {
    result = sub_21FD53134();
    __break(1u);
  }
  else
  {
    *a2 = 0x10002u >> (8 * result);
  }
  return result;
}

id sub_21FD4F6B4(unsigned __int8 *a1, id *a2)
{
  int v2;
  uint64_t v3;

  v2 = *a1;
  if (v2 == 2)
  {
    v3 = 0;
  }
  else if ((v2 & 1) != 0)
  {
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  return objc_msgSend(*a2, sel_setApplePayLaterAvailability_, v3);
}

id PKPaymentRequest.applePayLaterAvailability.setter(unsigned __int8 *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *a1;
  if (v2 == 2)
  {
    v3 = v1;
    v4 = 0;
  }
  else
  {
    v3 = v1;
    if ((v2 & 1) != 0)
      v4 = 2;
    else
      v4 = 1;
  }
  return objc_msgSend(v3, sel_setApplePayLaterAvailability_, v4);
}

id (*PKPaymentRequest.applePayLaterAvailability.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  _BYTE *v2;
  unint64_t v3;
  id (*result)(uint64_t);

  *a1 = v1;
  v2 = a1 + 1;
  v3 = (unint64_t)objc_msgSend(v1, sel_applePayLaterAvailability);
  if (v3 >= 3)
  {
    result = (id (*)(uint64_t))sub_21FD53134();
    __break(1u);
  }
  else
  {
    *v2 = 0x10002u >> (8 * v3);
    return sub_21FD4F7DC;
  }
  return result;
}

id sub_21FD4F7DC(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(a1 + 8);
  v2 = 1;
  if ((v1 & 1) != 0)
    v2 = 2;
  if (v1 == 2)
    v3 = 0;
  else
    v3 = v2;
  return objc_msgSend(*(id *)a1, sel_setApplePayLaterAvailability_, v3);
}

BOOL static PKPaymentRequest.ApplePayLaterAvailability.Reason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PKPaymentRequest.ApplePayLaterAvailability.Reason.hash(into:)()
{
  return sub_21FD531B8();
}

uint64_t PKPaymentRequest.ApplePayLaterAvailability.Reason.hashValue.getter()
{
  sub_21FD531AC();
  sub_21FD531B8();
  return sub_21FD531D0();
}

BOOL sub_21FD4F888(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id PKPaymentRequest.merchantCategoryCode.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id result;

  result = objc_msgSend(v1, sel_merchantCategoryCode);
  *(_WORD *)a1 = (_WORD)result;
  *(_BYTE *)(a1 + 2) = 0;
  return result;
}

id PKPaymentRequest.merchantCategoryCode.setter(__int16 *a1)
{
  void *v1;
  __int16 *v2;

  if (*((_BYTE *)a1 + 2))
    v2 = (__int16 *)MEMORY[0x24BE6F468];
  else
    v2 = a1;
  return objc_msgSend(v1, sel_setMerchantCategoryCode_, *v2);
}

uint64_t PKPaymentRequest.MerchantCategoryCode.init(rawValue:)@<X0>(uint64_t result@<X0>, _WORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id (*PKPaymentRequest.merchantCategoryCode.modify(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_WORD *)(a1 + 8) = (unsigned __int16)objc_msgSend(v1, sel_merchantCategoryCode);
  *(_BYTE *)(a1 + 10) = 0;
  return sub_21FD4F948;
}

id sub_21FD4F948(uint64_t a1)
{
  __int16 *v1;

  v1 = (__int16 *)(a1 + 8);
  if (*(_BYTE *)(a1 + 10))
    v1 = (__int16 *)MEMORY[0x24BE6F468];
  return objc_msgSend(*(id *)a1, sel_setMerchantCategoryCode_, *v1);
}

uint64_t PKPaymentRequest.MerchantCategoryCode.rawValue.getter()
{
  unsigned __int16 *v0;

  return *v0;
}

uint64_t PKPaymentRequest.MerchantCategoryCode.init(_:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  char v22;
  unsigned __int8 *v23;
  unsigned int v24;
  int v25;
  _QWORD v26[3];

  v5 = HIBYTE(a2) & 0xF;
  v6 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v7 = v5;
  else
    v7 = result & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
    result = swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    v10 = sub_21FD51C74(result, a2, 10);
    result = swift_bridgeObjectRelease();
    if ((v10 & 0x10000) == 0)
      goto LABEL_45;
    goto LABEL_54;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v8 = (unsigned __int8 *)sub_21FD53128();
    v9 = sub_21FD51DBC(v8, v6, 10);
    LOWORD(v10) = v9;
    v11 = HIWORD(v9) & 1;
LABEL_44:
    result = swift_bridgeObjectRelease();
    if (!v11)
    {
LABEL_45:
      v22 = 0;
LABEL_55:
      *(_WORD *)a3 = v10;
      *(_BYTE *)(a3 + 2) = v22;
      return result;
    }
LABEL_54:
    LOWORD(v10) = 0;
    v22 = 1;
    goto LABEL_55;
  }
  v26[0] = result;
  v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v5)
      goto LABEL_58;
    if (v5 == 1)
      goto LABEL_31;
    v10 = (BYTE1(result) - 48);
    if (v10 > 9)
      goto LABEL_31;
    if (v5 != 2)
    {
      if ((BYTE2(result) - 48) > 9u)
        goto LABEL_31;
      LOWORD(v10) = 10 * v10 + (BYTE2(result) - 48);
      v13 = v5 - 3;
      if (v13)
      {
        v14 = (unsigned __int8 *)v26 + 3;
        while (1)
        {
          v15 = *v14 - 48;
          if (v15 > 9)
            goto LABEL_31;
          v16 = (__int16)(10 * v10);
          if (v16 != 10 * (__int16)v10)
            goto LABEL_31;
          v10 = v16 + v15;
          if ((__int16)(v16 + v15) != v10)
            goto LABEL_31;
          v11 = 0;
          ++v14;
          if (!--v13)
            goto LABEL_44;
        }
      }
    }
LABEL_43:
    v11 = 0;
    goto LABEL_44;
  }
  if (result != 45)
  {
    if (!v5)
      goto LABEL_31;
    v10 = (result - 48);
    if (v10 > 9)
      goto LABEL_31;
    if (v5 != 1)
    {
      if ((BYTE1(result) - 48) > 9u)
        goto LABEL_31;
      LOWORD(v10) = 10 * v10 + (BYTE1(result) - 48);
      v17 = v5 - 2;
      if (v17)
      {
        v18 = (unsigned __int8 *)v26 + 2;
        while (1)
        {
          v19 = *v18 - 48;
          if (v19 > 9)
            goto LABEL_31;
          v20 = (__int16)(10 * v10);
          if (v20 != 10 * (__int16)v10)
            goto LABEL_31;
          v10 = v20 + v19;
          if ((__int16)(v20 + v19) != v10)
            goto LABEL_31;
          v11 = 0;
          ++v18;
          if (!--v17)
            goto LABEL_44;
        }
      }
    }
    goto LABEL_43;
  }
  if (v5)
  {
    if (v5 != 1)
    {
      v12 = (BYTE1(result) - 48);
      if (v12 <= 9)
      {
        if (v5 == 2)
        {
          v11 = 0;
          v10 = -v12;
          goto LABEL_44;
        }
        if ((BYTE2(result) - 48) <= 9u)
        {
          LOWORD(v10) = -10 * v12 - (BYTE2(result) - 48);
          v21 = v5 - 3;
          if (!v21)
            goto LABEL_43;
          v23 = (unsigned __int8 *)v26 + 3;
          while (1)
          {
            v24 = *v23 - 48;
            if (v24 > 9)
              break;
            v25 = (__int16)(10 * v10);
            if (v25 != 10 * (__int16)v10)
              break;
            v10 = v25 - v24;
            if ((__int16)(v25 - v24) != v10)
              break;
            v11 = 0;
            ++v23;
            if (!--v21)
              goto LABEL_44;
          }
        }
      }
    }
LABEL_31:
    LOWORD(v10) = 0;
    v11 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_58:
  __break(1u);
  return result;
}

uint64_t PKPaymentRequest.MerchantCategoryCode.description.getter()
{
  unsigned __int16 *v0;
  unsigned int v1;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  if (v1 > 0x3E7)
    return sub_21FD5314C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555764F0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21FD53850;
  v4 = MEMORY[0x24BEE3F78];
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE3F30];
  *(_QWORD *)(v3 + 64) = v4;
  *(_WORD *)(v3 + 32) = v1;
  return sub_21FD5305C();
}

uint64_t PKPaymentRequest.MerchantCategoryCode.init(from:)@<X0>(_QWORD *a1@<X0>, _WORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unsigned int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FD531DC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_project_boxed_opaque_existential_1(v30, v30[3]);
  result = sub_21FD53164();
  v6 = result;
  v8 = v7;
  v9 = HIBYTE(v7) & 0xF;
  v10 = result & 0xFFFFFFFFFFFFLL;
  if ((v8 & 0x2000000000000000) != 0)
    v11 = v9;
  else
    v11 = result & 0xFFFFFFFFFFFFLL;
  if (!v11)
    goto LABEL_55;
  if ((v8 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v14 = sub_21FD51C74(v6, v8, 10);
    swift_bridgeObjectRelease();
    if ((v14 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_55;
  }
  if ((v8 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v12 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v12 = (unsigned __int8 *)sub_21FD53128();
    v13 = sub_21FD51DBC(v12, v10, 10);
    if ((v13 & 0x10000) == 0)
    {
      LOWORD(v14) = v13;
LABEL_37:
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      *a2 = v14;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
LABEL_55:
    v28 = 0;
    v29 = 0xE000000000000000;
    sub_21FD53104();
    swift_bridgeObjectRelease();
    v28 = 39;
    v29 = 0xE100000000000000;
    sub_21FD53080();
    swift_bridgeObjectRelease();
    sub_21FD53080();
    sub_21FD5311C();
    swift_allocError();
    sub_21FD53110();
    swift_bridgeObjectRelease();
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v28 = result;
  v29 = v8 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v9)
      goto LABEL_60;
    if (v9 == 1)
      goto LABEL_58;
    v14 = (BYTE1(result) - 48);
    if (v14 <= 9)
    {
      if (v9 == 2)
        goto LABEL_35;
      if ((BYTE2(result) - 48) <= 9u)
      {
        LOWORD(v14) = 10 * v14 + (BYTE2(result) - 48);
        v16 = v9 - 3;
        if (v9 != 3)
        {
          v17 = (unsigned __int8 *)&v28 + 3;
          while (1)
          {
            v18 = *v17 - 48;
            if (v18 > 9)
              goto LABEL_33;
            v19 = (__int16)(10 * v14);
            if (v19 != 10 * (__int16)v14)
              goto LABEL_33;
            v14 = v19 + v18;
            if ((__int16)(v19 + v18) != v14)
              goto LABEL_33;
            LODWORD(v9) = 0;
            ++v17;
            if (!--v16)
              goto LABEL_36;
          }
        }
        goto LABEL_35;
      }
    }
LABEL_33:
    LOWORD(v14) = 0;
    LODWORD(v9) = 1;
    goto LABEL_36;
  }
  if (result != 45)
  {
    if (!v9)
      goto LABEL_33;
    v14 = (result - 48);
    if (v14 > 9)
      goto LABEL_33;
    if (v9 == 1)
    {
LABEL_35:
      LODWORD(v9) = 0;
      goto LABEL_36;
    }
    if ((BYTE1(result) - 48) <= 9u)
    {
      LOWORD(v14) = 10 * v14 + (BYTE1(result) - 48);
      v20 = v9 - 2;
      if (v9 != 2)
      {
        v21 = (unsigned __int8 *)&v28 + 2;
        while (1)
        {
          v22 = *v21 - 48;
          if (v22 > 9)
            goto LABEL_33;
          v23 = (__int16)(10 * v14);
          if (v23 != 10 * (__int16)v14)
            goto LABEL_33;
          v14 = v23 + v22;
          if ((__int16)(v23 + v22) != v14)
            goto LABEL_33;
          LODWORD(v9) = 0;
          ++v21;
          if (!--v20)
            goto LABEL_36;
        }
      }
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  if (v9)
  {
    if (v9 != 1)
    {
      v15 = (BYTE1(result) - 48);
      if (v15 > 9)
        goto LABEL_33;
      if (v9 == 2)
      {
        LODWORD(v9) = 0;
        v14 = -v15;
        goto LABEL_36;
      }
      if ((BYTE2(result) - 48) > 9u)
        goto LABEL_33;
      LOWORD(v14) = -10 * v15 - (BYTE2(result) - 48);
      v24 = v9 - 3;
      if (v9 != 3)
      {
        v25 = (unsigned __int8 *)&v28 + 3;
        while (1)
        {
          v26 = *v25 - 48;
          if (v26 > 9)
            goto LABEL_33;
          v27 = (__int16)(10 * v14);
          if (v27 != 10 * (__int16)v14)
            goto LABEL_33;
          v14 = v27 - v26;
          if ((__int16)(v27 - v26) != v14)
            goto LABEL_33;
          LODWORD(v9) = 0;
          ++v25;
          if (!--v24)
            goto LABEL_36;
        }
      }
      goto LABEL_35;
    }
LABEL_58:
    LOWORD(v14) = 0;
LABEL_36:
    if (!(_DWORD)v9)
      goto LABEL_37;
    goto LABEL_55;
  }
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

uint64_t PKPaymentRequest.MerchantCategoryCode.encode(to:)(_QWORD *a1)
{
  unsigned __int16 *v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];
  uint64_t v8;
  __int16 v9;

  v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FD531E8();
  if (v2 <= 0x3E7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555764F0);
    v3 = swift_allocObject();
    v4 = MEMORY[0x24BEE3F30];
    *(_OWORD *)(v3 + 16) = xmmword_21FD53850;
    v5 = MEMORY[0x24BEE3F78];
    *(_QWORD *)(v3 + 56) = v4;
    *(_QWORD *)(v3 + 64) = v5;
    *(_WORD *)(v3 + 32) = v2;
    sub_21FD5305C();
  }
  else
  {
    v9 = v2;
    sub_21FD5314C();
  }
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  sub_21FD53170();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t sub_21FD50248@<X0>(_QWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return PKPaymentRequest.MerchantCategoryCode.init(from:)(a1, a2);
}

uint64_t sub_21FD5025C(_QWORD *a1)
{
  __int16 *v1;
  __int16 v2;
  _BYTE v4[24];
  uint64_t v5;
  __int16 v6;

  v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FD531E8();
  v6 = v2;
  PKPaymentRequest.MerchantCategoryCode.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
  sub_21FD53170();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t sub_21FD50310()
{
  sub_21FD531AC();
  sub_21FD531C4();
  return sub_21FD531D0();
}

uint64_t sub_21FD50354()
{
  return sub_21FD531C4();
}

uint64_t sub_21FD5037C()
{
  sub_21FD531AC();
  sub_21FD531C4();
  return sub_21FD531D0();
}

_WORD *sub_21FD503BC@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(_BYTE *)(a2 + 2) = 0;
  return result;
}

void sub_21FD503CC(_WORD *a1@<X8>)
{
  _WORD *v1;

  *a1 = *v1;
}

BOOL sub_21FD503DC(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

uint64_t static PKMerchantCapability.capability3DS.getter()
{
  return 1;
}

uint64_t static PKMerchantCapability.capabilityEMV.getter()
{
  return 2;
}

uint64_t static PKMerchantCapability.capabilityCredit.getter()
{
  return 4;
}

uint64_t static PKMerchantCapability.capabilityDebit.getter()
{
  return 8;
}

uint64_t PKDisbursementRequest.region.getter()
{
  return sub_21FD510A8((SEL *)&selRef_regionCode, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDCED38]);
}

uint64_t PKDisbursementRequest.region.setter(uint64_t a1)
{
  return sub_21FD51264(a1, (void (*)(void))MEMORY[0x24BDCECF0], (SEL *)&selRef_setRegionCode_, (uint64_t (*)(_QWORD))MEMORY[0x24BDCED08]);
}

void (*PKDisbursementRequest.region.modify(_QWORD *a1))(void ***a1, char a2)
{
  void *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  id v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = sub_21FD52F60();
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  v7 = objc_msgSend(v1, sel_regionCode);
  sub_21FD53050();

  sub_21FD52F6C();
  return sub_21FD504F8;
}

void sub_21FD504F8(void ***a1, char a2)
{
  sub_21FD51394(a1, a2, (void (*)(void))MEMORY[0x24BDCECF0], (SEL *)&selRef_setRegionCode_);
}

uint64_t PKDisbursementRequest.currency.getter()
{
  return sub_21FD510A8((SEL *)&selRef_currencyCode, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDCEDA8]);
}

uint64_t PKDisbursementRequest.currency.setter(uint64_t a1)
{
  return sub_21FD51264(a1, (void (*)(void))MEMORY[0x24BDCED68], (SEL *)&selRef_setCurrencyCode_, (uint64_t (*)(_QWORD))MEMORY[0x24BDCED80]);
}

void (*PKDisbursementRequest.currency.modify(_QWORD *a1))(void ***a1, char a2)
{
  void *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  id v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = sub_21FD52F84();
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  v7 = objc_msgSend(v1, sel_currencyCode);
  sub_21FD53050();

  sub_21FD52F90();
  return sub_21FD505F0;
}

void sub_21FD505F0(void ***a1, char a2)
{
  sub_21FD51394(a1, a2, (void (*)(void))MEMORY[0x24BDCED68], (SEL *)&selRef_setCurrencyCode_);
}

_QWORD *PKDisbursementRequest.supportedRegions.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  _QWORD *v13;

  v1 = sub_21FD52F60();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_supportedRegions);
  if (v5)
  {
    v6 = sub_21FD530EC();

    v7 = *(_QWORD *)(v6 + 16);
    if (v7)
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      sub_21FD52608(0, v7, 0);
      v5 = v13;
      v8 = v6 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_21FD52F6C();
        v13 = v5;
        v10 = v5[2];
        v9 = v5[3];
        if (v10 >= v9 >> 1)
        {
          sub_21FD52608(v9 > 1, v10 + 1, 1);
          v5 = v13;
        }
        v8 += 16;
        v5[2] = v10 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))((unint64_t)v5+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v10, v4, v1);
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return (_QWORD *)MEMORY[0x24BEE4AF8];
    }
  }
  return v5;
}

void sub_21FD50790(void **a1, void **a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *a2;
  if (*a1)
  {
    v4 = swift_bridgeObjectRetain();
    sub_21FD50898(v4);
    swift_bridgeObjectRelease();
    v2 = (void *)sub_21FD530E0();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v3, sel_setSupportedRegions_, v2);

}

void PKDisbursementRequest.supportedRegions.setter(uint64_t a1)
{
  void *v1;
  void *v2;

  v2 = (void *)a1;
  if (a1)
  {
    sub_21FD50898(a1);
    swift_bridgeObjectRelease();
    v2 = (void *)sub_21FD530E0();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v1, sel_setSupportedRegions_, v2);

}

uint64_t sub_21FD50898(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_21FD52CB8(0, v1, 0);
    v2 = v14;
    v4 = *(_QWORD *)(sub_21FD52F60() - 8);
    v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    do
    {
      v7 = sub_21FD52F54();
      v9 = v8;
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_21FD52CB8((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void (*PKDisbursementRequest.supportedRegions.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  a1[3] = v1;
  *a1 = PKDisbursementRequest.supportedRegions.getter();
  return sub_21FD509C8;
}

void sub_21FD509C8(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = swift_bridgeObjectRetain();
      sub_21FD50898(v4);
      swift_bridgeObjectRelease();
      v3 = (void *)sub_21FD530E0();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(*(id *)(a1 + 24), sel_setSupportedRegions_, v3);

    swift_bridgeObjectRelease();
  }
  else
  {
    if (v3)
    {
      sub_21FD50898(*(_QWORD *)a1);
      swift_bridgeObjectRelease();
      v5 = (id)sub_21FD530E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(*(id *)(a1 + 24), sel_setSupportedRegions_, v5, v5);

  }
}

id PKDisbursementRequest.init(merchantIdentifier:currency:region:supportedNetworks:merchantCapabilities:summaryItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v10 = (void *)sub_21FD5302C();
  swift_bridgeObjectRelease();
  sub_21FD52F54();
  v11 = (void *)sub_21FD5302C();
  swift_bridgeObjectRelease();
  sub_21FD52F54();
  v12 = (void *)sub_21FD5302C();
  swift_bridgeObjectRelease();
  type metadata accessor for PKPaymentNetwork();
  v13 = (void *)sub_21FD530E0();
  swift_bridgeObjectRelease();
  sub_21FD52624();
  v14 = (void *)sub_21FD530E0();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v9, sel_initWithMerchantIdentifier_currencyCode_regionCode_supportedNetworks_merchantCapabilities_summaryItems_, v10, v11, v12, v13, a6, v14);

  v16 = sub_21FD52F60();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a4, v16);
  v17 = sub_21FD52F84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a3, v17);
  return v15;
}

id PKPayLaterView.init(amount:currency:)(unint64_t a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  __int16 v4;
  __int16 v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  int v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;

  v4 = a3;
  v5 = a2;
  v6 = a1;
  v7 = HIDWORD(a1);
  v8 = HIWORD(a1);
  v9 = a2 >> 16;
  v10 = HIDWORD(a2);
  v11 = HIWORD(a2);
  v12 = HIWORD(a3);
  v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v23 = v5;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  v27 = v4;
  v28 = v12;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1518]), sel_initWithDecimal_, &v20);
  sub_21FD52F54();
  v15 = (void *)sub_21FD5302C();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v13, sel_initWithAmount_currencyCode_, v14, v15);

  v17 = sub_21FD52F84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a4, v17);
  return v16;
}

uint64_t PKPayLaterView.amount.getter()
{
  void *v0;
  id v1;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_amount);
  objc_msgSend(v1, sel_decimalValue);

  return v3;
}

__n128 sub_21FD50DD0@<Q0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  int v4;
  __n128 result;
  __n128 v6;
  int v7;
  __n128 v8;

  v3 = objc_msgSend(*a1, sel_amount);
  objc_msgSend(v3, sel_decimalValue);
  v4 = v7;
  v6 = v8;

  *(_DWORD *)a2 = v4;
  result = v6;
  *(__n128 *)(a2 + 4) = v6;
  return result;
}

void sub_21FD50E44(int *a1, void **a2)
{
  int v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  __int128 v8;

  v3 = *a1;
  v4 = *a2;
  v5 = objc_allocWithZone(MEMORY[0x24BDD1518]);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 1);
  v6 = objc_msgSend(v5, sel_initWithDecimal_, &v7);
  objc_msgSend(v4, sel_setAmount_, v6);

}

void PKPayLaterView.amount.setter(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  id v4;
  _QWORD v5[2];
  int v6;

  v5[0] = a1;
  v5[1] = a2;
  v6 = a3;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1518]), sel_initWithDecimal_, v5);
  objc_msgSend(v3, sel_setAmount_, v4);

}

void (*PKPayLaterView.amount.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  char *v3;
  id v4;
  int v6;
  __int128 v7;

  v3 = (char *)malloc(0x30uLL);
  *a1 = v3;
  *(_QWORD *)v3 = v1;
  v4 = objc_msgSend(v1, sel_amount);
  objc_msgSend(v4, sel_decimalValue);

  *((_DWORD *)v3 + 2) = v6;
  *(_OWORD *)(v3 + 12) = v7;
  return sub_21FD51010;
}

void sub_21FD51010(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  id v3;
  void *v4;
  id v5;
  __int128 v6;

  v1 = *(_DWORD **)a1;
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 8);
  v6 = *(_OWORD *)(*(_QWORD *)a1 + 12);
  v3 = objc_allocWithZone(MEMORY[0x24BDD1518]);
  v4 = *(void **)v1;
  v1[7] = v2;
  *((_OWORD *)v1 + 2) = v6;
  v5 = objc_msgSend(v3, sel_initWithDecimal_, v1 + 7);
  objc_msgSend(v4, sel_setAmount_, v5);

  free(v1);
}

uint64_t PKPayLaterView.currency.getter()
{
  return sub_21FD510A8((SEL *)&selRef_currencyCode, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDCEDA8]);
}

uint64_t sub_21FD510A8(SEL *a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(v2, *a1);
  v4 = sub_21FD53050();
  v6 = v5;

  return a2(v4, v6);
}

uint64_t sub_21FD51110(id *a1, uint64_t a2, uint64_t a3, SEL *a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend(*a1, *a4);
  v6 = sub_21FD53050();
  v8 = v7;

  return a5(v6, v8);
}

uint64_t sub_21FD51178(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(uint64_t), SEL *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v11 = a5(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v19 - v13;
  v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v19 - v13, a1, v11);
  v16 = *a2;
  a6(v15);
  v17 = (void *)sub_21FD5302C();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, *a7, v17);

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t PKPayLaterView.currency.setter(uint64_t a1)
{
  return sub_21FD51264(a1, (void (*)(void))MEMORY[0x24BDCED68], (SEL *)&selRef_setCurrencyCode_, (uint64_t (*)(_QWORD))MEMORY[0x24BDCED80]);
}

uint64_t sub_21FD51264(uint64_t a1, void (*a2)(void), SEL *a3, uint64_t (*a4)(_QWORD))
{
  void *v4;
  void *v7;
  void *v9;
  uint64_t v10;

  v7 = v4;
  a2();
  v9 = (void *)sub_21FD5302C();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, *a3, v9);

  v10 = a4(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
}

void (*PKPayLaterView.currency.modify(_QWORD *a1))(void ***a1, char a2)
{
  void *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  id v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = sub_21FD52F84();
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  v7 = objc_msgSend(v1, sel_currencyCode);
  sub_21FD53050();

  sub_21FD52F90();
  return sub_21FD505F0;
}

void sub_21FD51394(void ***a1, char a2, void (*a3)(void), SEL *a4)
{
  void **v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (**v10)(void *, void *, void *);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t (*v14)(void *, void *, void *);
  void *v15;

  v6 = *a1;
  v7 = (*a1)[3];
  v8 = (*a1)[4];
  v9 = (*a1)[1];
  v10 = (uint64_t (**)(void *, void *, void *))(*a1)[2];
  v11 = **a1;
  if ((a2 & 1) != 0)
  {
    v12 = v10[2]((*a1)[3], v8, v9);
    ((void (*)(uint64_t))a3)(v12);
    v13 = (void *)sub_21FD5302C();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, *a4, v13);

    v14 = v10[1];
    ((void (*)(void *, void *))v14)(v7, v9);
  }
  else
  {
    a3();
    v15 = (void *)sub_21FD5302C();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, *a4, v15);

    v14 = v10[1];
  }
  ((void (*)(void *, void *))v14)(v8, v9);
  free(v8);
  free(v7);
  free(v6);
}

uint64_t static PKPayLater.validate(amount:currency:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 88) = a2;
  *(_QWORD *)(v4 + 96) = a4;
  *(_DWORD *)(v4 + 104) = a3;
  *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_21FD514B4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_DWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 56) = v0 + 108;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_21FD51530;
  v4 = swift_continuation_init();
  sub_21FD51570(v4, v3, v1, v2);
  return swift_continuation_await();
}

uint64_t sub_21FD51530()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)v0 + 8))(*(unsigned __int8 *)(*(_QWORD *)v0 + 108));
}

void sub_21FD51570(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id v4;
  NSDecimalNumber *v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  uint64_t (*v14)(char);
  uint64_t v15;

  aBlock = a2;
  v11 = a3;
  LODWORD(v12) = a4;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1518]), sel_initWithDecimal_, &aBlock);
  sub_21FD52F54();
  v5 = (NSDecimalNumber *)v4;
  v6 = (NSString *)sub_21FD5302C();
  swift_bridgeObjectRelease();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  v14 = sub_21FD52C88;
  v15 = v7;
  aBlock = MEMORY[0x24BDAC760];
  v11 = 1107296256;
  v12 = sub_21FD516D8;
  v13 = &block_descriptor;
  v8 = _Block_copy(&aBlock);
  swift_release();
  PKPayLaterValidateAmount(v5, v6, v8);
  _Block_release(v8);

}

uint64_t sub_21FD516D8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t PKIdentityNationalIDCardDescriptor.region.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(v1, sel_regionCode);
  if (v3)
  {
    v4 = v3;
    sub_21FD53050();

  }
  sub_21FD52F6C();
  v5 = sub_21FD52F60();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 0, 1, v5);
}

uint64_t sub_21FD517A4@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_regionCode);
  if (v3)
  {
    v4 = v3;
    sub_21FD53050();

  }
  sub_21FD52F6C();
  v5 = sub_21FD52F60();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a2, 0, 1, v5);
}

uint64_t sub_21FD51834(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255576508);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FD52660(a1, (uint64_t)v3);
  return PKIdentityNationalIDCardDescriptor.region.setter((uint64_t)v3);
}

uint64_t PKIdentityNationalIDCardDescriptor.region.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255576508);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FD52660(a1, (uint64_t)v5);
  v6 = sub_21FD52F60();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_21FD526A8((uint64_t)v5);
    v8 = 0;
  }
  else
  {
    sub_21FD52F54();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    v8 = (void *)sub_21FD5302C();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v2, sel_setRegionCode_, v8);

  return sub_21FD526A8(a1);
}

void (*PKIdentityNationalIDCardDescriptor.region.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  void *v1;
  void *v2;
  _QWORD *v4;
  size_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = v1;
  v4 = malloc(0x38uLL);
  *a1 = v4;
  *v4 = v2;
  v5 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255576508) - 8) + 64);
  v4[1] = malloc(v5);
  v4[2] = malloc(v5);
  v4[3] = malloc(v5);
  v6 = malloc(v5);
  v4[4] = v6;
  v7 = objc_msgSend(v2, sel_regionCode);
  if (v7)
  {
    v8 = v7;
    sub_21FD53050();

  }
  sub_21FD52F6C();
  v9 = sub_21FD52F60();
  v4[5] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v4[6] = v10;
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
  return sub_21FD51AD0;
}

void sub_21FD51AD0(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 40);
  v4 = *(_QWORD *)(*a1 + 48);
  v5 = *(_QWORD *)(*a1 + 32);
  if ((a2 & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 8);
    v6 = *(_QWORD *)(v2 + 16);
    sub_21FD52660(v5, v6);
    sub_21FD52660(v6, v7);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3) == 1)
    {
      sub_21FD526A8(*(_QWORD *)(v2 + 8));
      v8 = 0;
    }
    else
    {
      v11 = *(_QWORD *)(v2 + 40);
      v12 = *(_QWORD *)(v2 + 48);
      v13 = *(_QWORD *)(v2 + 8);
      sub_21FD52F54();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v11);
      v8 = (void *)sub_21FD5302C();
      swift_bridgeObjectRelease();
    }
    v15 = *(void **)(v2 + 24);
    v14 = *(void **)(v2 + 32);
    v17 = *(void **)(v2 + 8);
    v16 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setRegionCode_, v8);

    sub_21FD526A8((uint64_t)v16);
  }
  else
  {
    v9 = *(_QWORD *)(v2 + 24);
    sub_21FD52660(v5, v9);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
    {
      sub_21FD526A8(*(_QWORD *)(v2 + 24));
      v10 = 0;
    }
    else
    {
      v18 = *(_QWORD *)(v2 + 40);
      v19 = *(_QWORD *)(v2 + 48);
      v20 = *(_QWORD *)(v2 + 24);
      sub_21FD52F54();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
      v10 = (void *)sub_21FD5302C();
      swift_bridgeObjectRelease();
    }
    v15 = *(void **)(v2 + 24);
    v14 = *(void **)(v2 + 32);
    v17 = *(void **)(v2 + 8);
    v16 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setRegionCode_, v10);

  }
  sub_21FD526A8((uint64_t)v14);
  free(v14);
  free(v15);
  free(v16);
  free(v17);
  free((void *)v2);
}

uint64_t sub_21FD51C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_21FD530C8();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_21FD52070();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_21FD53128();
  }
LABEL_7:
  v11 = sub_21FD51DBC(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 & 0x1FFFF;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

unsigned __int8 *sub_21FD51DBC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned __int16 v12;
  int v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  int v23;
  __int16 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  int v28;
  unsigned int v29;
  char v30;
  int v31;
  __int16 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          LOWORD(v8) = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = (__int16)v8 * (__int16)a3;
            v24 = v23;
            if ((__int16)v23 != v23)
              goto LABEL_72;
            v8 = (__int16)v23 + (v21 + v22);
            if ((__int16)(v24 + (v21 + v22)) != v8)
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 16));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          LOWORD(v28) = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = (__int16)v28 * (__int16)a3;
            v32 = v31;
            if ((__int16)v31 != v31)
              goto LABEL_72;
            v28 = (__int16)v31 + (v29 + v30);
            if ((__int16)(v32 + (v29 + v30)) != v28)
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          LOWORD(v8) = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = (__int16)v8 * (__int16)a3;
            v15 = v14;
            if ((__int16)v14 != v14)
              goto LABEL_72;
            v8 = (__int16)v14 - (v10 + v11);
            if ((__int16)(v15 - (v10 + v11)) != v8)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 16));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21FD52070()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_21FD530D4();
  v4 = sub_21FD520EC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21FD520EC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_21FD52230(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_21FD5231C(v9, 0);
      v12 = sub_21FD52380((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2207D22D4](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2207D22D4);
LABEL_9:
      sub_21FD53128();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2207D22D4]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_21FD52230(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_21FD52590(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_21FD52590(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_21FD530A4();
  }
  __break(1u);
  return result;
}

_QWORD *sub_21FD5231C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255576538);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_21FD52380(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_21FD52590(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_21FD530B0();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_21FD53128();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_21FD52590(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_21FD5308C();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21FD52590(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_21FD530BC();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2207D2304](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

size_t sub_21FD52608(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_21FD52CD4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

unint64_t sub_21FD52624()
{
  unint64_t result;

  result = qword_2555764F8;
  if (!qword_2555764F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2555764F8);
  }
  return result;
}

uint64_t sub_21FD52660(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255576508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FD526A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255576508);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21FD526EC()
{
  unint64_t result;

  result = qword_255576510;
  if (!qword_255576510)
  {
    result = MEMORY[0x2207D2658](&protocol conformance descriptor for PKPaymentRequest.ApplePayLaterAvailability.Reason, &type metadata for PKPaymentRequest.ApplePayLaterAvailability.Reason);
    atomic_store(result, (unint64_t *)&qword_255576510);
  }
  return result;
}

unint64_t sub_21FD52734()
{
  unint64_t result;

  result = qword_255576518;
  if (!qword_255576518)
  {
    result = MEMORY[0x2207D2658](&protocol conformance descriptor for PKPaymentRequest.MerchantCategoryCode, &type metadata for PKPaymentRequest.MerchantCategoryCode);
    atomic_store(result, (unint64_t *)&qword_255576518);
  }
  return result;
}

unint64_t sub_21FD5277C()
{
  unint64_t result;

  result = qword_255576520;
  if (!qword_255576520)
  {
    result = MEMORY[0x2207D2658](&protocol conformance descriptor for PKPaymentRequest.MerchantCategoryCode, &type metadata for PKPaymentRequest.MerchantCategoryCode);
    atomic_store(result, (unint64_t *)&qword_255576520);
  }
  return result;
}

id sub_21FD527C8@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_merchantCategoryCode);
  *(_WORD *)a2 = (_WORD)result;
  *(_BYTE *)(a2 + 2) = 0;
  return result;
}

id sub_21FD527FC(__int16 *a1, id *a2)
{
  __int16 *v2;

  if (*((_BYTE *)a1 + 2))
    v2 = (__int16 *)MEMORY[0x24BE6F468];
  else
    v2 = a1;
  return objc_msgSend(*a2, sel_setMerchantCategoryCode_, *v2);
}

uint64_t sub_21FD52828(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_21FD51110(a1, a2, a3, (SEL *)&selRef_regionCode, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDCED38]);
}

uint64_t sub_21FD5284C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_21FD51178(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCED08], (void (*)(uint64_t))MEMORY[0x24BDCECF0], (SEL *)&selRef_setRegionCode_);
}

uint64_t sub_21FD52878(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_21FD51110(a1, a2, a3, (SEL *)&selRef_currencyCode, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDCEDA8]);
}

uint64_t sub_21FD5289C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_21FD51178(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCED80], (void (*)(uint64_t))MEMORY[0x24BDCED68], (SEL *)&selRef_setCurrencyCode_);
}

_QWORD *sub_21FD528C8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = PKDisbursementRequest.supportedRegions.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21FD528FC(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_21FD51110(a1, a2, a3, (SEL *)&selRef_currencyCode, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDCEDA8]);
}

uint64_t sub_21FD52920(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_21FD51178(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCED80], (void (*)(uint64_t))MEMORY[0x24BDCED68], (SEL *)&selRef_setCurrencyCode_);
}

uint64_t _s25ApplePayLaterAvailabilityOwet(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
  {
    v6 = *a1;
    v7 = v6 >= 2;
    v8 = v6 - 2;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_21FD529A4 + 4 * byte_21FD53870[v4]))();
  }
}

uint64_t _s25ApplePayLaterAvailabilityOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFE)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_21FD52A4C + 4 * byte_21FD5387A[v5]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21FD52A80 + 4 * byte_21FD53875[v5]))();
}

uint64_t sub_21FD52A80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FD52A88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FD52A90);
  return result;
}

uint64_t sub_21FD52A9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FD52AA4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21FD52AA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FD52AB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FD52ABC(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 2)
    return v1 - 1;
  else
    return 0;
}

_BYTE *sub_21FD52AD0(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for PKPaymentRequest.ApplePayLaterAvailability()
{
  return &type metadata for PKPaymentRequest.ApplePayLaterAvailability;
}

uint64_t _s25ApplePayLaterAvailabilityO6ReasonOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s25ApplePayLaterAvailabilityO6ReasonOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21FD52BCC + 4 * byte_21FD53884[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21FD52C00 + 4 * byte_21FD5387F[v4]))();
}

uint64_t sub_21FD52C00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FD52C08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FD52C10);
  return result;
}

uint64_t sub_21FD52C1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FD52C24);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21FD52C28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FD52C30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21FD52C3C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PKPaymentRequest.ApplePayLaterAvailability.Reason()
{
  return &type metadata for PKPaymentRequest.ApplePayLaterAvailability.Reason;
}

ValueMetadata *type metadata accessor for PKPaymentRequest.MerchantCategoryCode()
{
  return &type metadata for PKPaymentRequest.MerchantCategoryCode;
}

ValueMetadata *type metadata accessor for PKPayLater()
{
  return &type metadata for PKPayLater;
}

uint64_t sub_21FD52C78()
{
  return swift_deallocObject();
}

uint64_t sub_21FD52C88(char a1)
{
  uint64_t v1;

  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(v1 + 16) + 64) + 40) = a1;
  return swift_continuation_resume();
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

char *sub_21FD52CB8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21FD52E48(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_21FD52CD4(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255576530);
  v10 = *(_QWORD *)(sub_21FD52F60() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_21FD52F60() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_21FD52E48(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255576528);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_21FD52F54()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_21FD52F60()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_21FD52F6C()
{
  return MEMORY[0x24BDCED38]();
}

uint64_t sub_21FD52F78()
{
  return MEMORY[0x24BDCED68]();
}

uint64_t sub_21FD52F84()
{
  return MEMORY[0x24BDCED80]();
}

uint64_t sub_21FD52F90()
{
  return MEMORY[0x24BDCEDA8]();
}

uint64_t sub_21FD52F9C()
{
  return MEMORY[0x24BE828C0]();
}

uint64_t sub_21FD52FA8()
{
  return MEMORY[0x24BE828D8]();
}

uint64_t sub_21FD52FB4()
{
  return MEMORY[0x24BE828F8]();
}

uint64_t sub_21FD52FC0()
{
  return MEMORY[0x24BE82908]();
}

uint64_t sub_21FD52FCC()
{
  return MEMORY[0x24BE82910]();
}

uint64_t sub_21FD52FD8()
{
  return MEMORY[0x24BE82930]();
}

uint64_t sub_21FD52FE4()
{
  return MEMORY[0x24BE82938]();
}

uint64_t sub_21FD52FF0()
{
  return MEMORY[0x24BE82940]();
}

uint64_t sub_21FD52FFC()
{
  return MEMORY[0x24BE82950]();
}

uint64_t sub_21FD53008()
{
  return MEMORY[0x24BE82960]();
}

uint64_t sub_21FD53014()
{
  return MEMORY[0x24BE82970]();
}

uint64_t sub_21FD53020()
{
  return MEMORY[0x24BE82980]();
}

uint64_t sub_21FD5302C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21FD53038()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21FD53044()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21FD53050()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21FD5305C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_21FD53068()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21FD53074()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21FD53080()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21FD5308C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21FD53098()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21FD530A4()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21FD530B0()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21FD530BC()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21FD530C8()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21FD530D4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21FD530E0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21FD530EC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21FD530F8()
{
  return MEMORY[0x24BDD0328]();
}

uint64_t sub_21FD53104()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21FD53110()
{
  return MEMORY[0x24BEE26B0]();
}

uint64_t sub_21FD5311C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_21FD53128()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21FD53134()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21FD53140()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21FD5314C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21FD53158()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21FD53164()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_21FD53170()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t sub_21FD5317C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21FD53188()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21FD53194()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21FD531A0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21FD531AC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21FD531B8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21FD531C4()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_21FD531D0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21FD531DC()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_21FD531E8()
{
  return MEMORY[0x24BEE4628]();
}

void PKPayLaterValidateAmount(NSDecimalNumber *amount, NSString *currencyCode, void *completion)
{
  MEMORY[0x24BE6F600](amount, currencyCode, completion);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

