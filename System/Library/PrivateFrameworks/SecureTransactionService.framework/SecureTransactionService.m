uint64_t STSReader.StateChanges.makeAsyncIterator()()
{
  type metadata accessor for STSReader.StateChanges();
  sub_2158AB478(&qword_254DE8988);
  return sub_2158D89B4();
}

uint64_t type metadata accessor for STSReader.StateChanges()
{
  uint64_t result;

  result = qword_254DE9330;
  if (!qword_254DE9330)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2158AB478(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E76A0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2158AB4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_2158AB574(a2);
  v4 = sub_2158AB478(&qword_254DE8990);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t sub_2158AB524(uint64_t a1)
{
  uint64_t v1;

  return sub_2158AB4B8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2158AB52C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2158AB478(&qword_254DE89A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2158AB574(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2158AB478(&qword_254DE89A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2158AB5B4()
{
  uint64_t v0;

  sub_2158AB478(&qword_254DE8988);
  sub_2158D89B4();
  return sub_2158AC390(v0);
}

uint64_t STSReader.start(configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  type metadata accessor for STSReader.StateChanges();
  v3[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158AB658()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (void *)v0[12];
  v2 = v0[11];
  v0[7] = v0[13];
  v0[2] = v0;
  v0[3] = sub_2158AB6BC;
  v3 = swift_continuation_init();
  sub_2158AB72C(v3, v1, v2);
  return swift_continuation_await();
}

uint64_t sub_2158AB6BC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 48))
    swift_willThrow();
  else
    sub_2158ABBA4(*(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 80));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2158AB72C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t aBlock;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  void *v43;
  uint64_t v44;

  v35 = a2;
  v36 = a3;
  v33 = a1;
  v37 = sub_2158AB478(&qword_254DE8998);
  v3 = *(_QWORD *)(v37 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2158AB478(&qword_254DE89A0);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v32 - v9;
  v11 = type metadata accessor for STSReader.StateChanges();
  v34 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v34 + 64);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - v15;
  v17 = sub_2158AB478(&qword_254DE8990);
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v10, 1, 1, v17);
  v38 = v10;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE6A10], v37);
  sub_2158D89C0();
  sub_2158AB52C((uint64_t)v10, (uint64_t)v8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v16, v8, v17);
    sub_2158AB574((uint64_t)v10);
    sub_2158AC46C((uint64_t)v16, (uint64_t)v14);
    v20 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    v21 = swift_allocObject();
    sub_2158ABBA4((uint64_t)v14, v21 + v20);
    v43 = sub_2158AC4B4;
    v44 = v21;
    v22 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v40 = 1107296256;
    v41 = sub_2158AC4E0;
    v42 = &unk_24D3A6CC8;
    v37 = (uint64_t)_Block_copy(&aBlock);
    swift_release();
    sub_2158AC46C((uint64_t)v16, (uint64_t)v14);
    v23 = swift_allocObject();
    sub_2158ABBA4((uint64_t)v14, v23 + v20);
    v43 = sub_2158AC614;
    v44 = v23;
    aBlock = v22;
    v40 = 1107296256;
    v41 = sub_2158AC620;
    v42 = &unk_24D3A6D18;
    v24 = _Block_copy(&aBlock);
    swift_release();
    sub_2158AC46C((uint64_t)v16, (uint64_t)v14);
    v25 = swift_allocObject();
    sub_2158ABBA4((uint64_t)v14, v25 + v20);
    v43 = sub_2158AC738;
    v44 = v25;
    aBlock = v22;
    v40 = 1107296256;
    v41 = sub_2158AC620;
    v42 = &unk_24D3A6D68;
    v26 = _Block_copy(&aBlock);
    swift_release();
    sub_2158AC46C((uint64_t)v16, (uint64_t)v14);
    v27 = swift_allocObject();
    sub_2158ABBA4((uint64_t)v14, v27 + v20);
    v43 = sub_2158AC8B4;
    v44 = v27;
    aBlock = v22;
    v40 = 1107296256;
    v41 = sub_2158AC620;
    v42 = &unk_24D3A6DB8;
    v28 = _Block_copy(&aBlock);
    swift_release();
    v29 = (const void *)v37;
    v30 = objc_msgSend(v35, sel_startWithConfiguration_connectionHandler_tnepStatusHandler_invalidationHandler_completion_, v36, v37, v24, v26, v28);
    _Block_release(v28);
    _Block_release(v26);
    _Block_release(v24);
    _Block_release(v29);
    if (v30)
    {
      sub_2158AB478(&qword_254DE8A50);
      swift_allocError();
      *v31 = v30;
      swift_continuation_throwingResumeWithError();
    }
    else
    {
      sub_2158AC46C((uint64_t)v16, (uint64_t)v14);
      sub_2158ABBA4((uint64_t)v14, *(_QWORD *)(*(_QWORD *)(v33 + 64) + 40));
      swift_continuation_throwingResume();
    }
    return sub_2158AC390((uint64_t)v16);
  }
  return result;
}

uint64_t sub_2158ABBA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for STSReader.StateChanges();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2158ABBEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DE89B0;
  if (!qword_254DE89B0)
  {
    v1 = sub_2158ABC38(&qword_254DE89B8);
    result = MEMORY[0x2199E76B8](MEMORY[0x24BEE6A88], v1);
    atomic_store(result, (unint64_t *)&qword_254DE89B0);
  }
  return result;
}

uint64_t sub_2158ABC38(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E76AC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t _s10StateEventOwCP(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_2158ABCC0(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

id sub_2158ABCC0(id result, unsigned __int8 a2)
{
  if (a2 <= 1u)
    return result;
  return result;
}

void _s10StateEventOwxx(uint64_t a1)
{
  sub_2158ABCE4(*(id *)a1, *(_BYTE *)(a1 + 8));
}

void sub_2158ABCE4(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u)

}

uint64_t _s10StateEventOwca(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_2158ABCC0(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_2158ABCE4(v5, v6);
  return a1;
}

uint64_t _s10StateEventOwtk(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s10StateEventOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_2158ABCE4(v4, v5);
  return a1;
}

uint64_t _s10StateEventOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s10StateEventOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_2158ABE24(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_2158ABE40(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for STSReader.StateEvent()
{
  return &type metadata for STSReader.StateEvent;
}

uint64_t *_s12StateChangesVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2158AB478(&qword_254DE8990);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2158AB478(&qword_254DE8988);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t _s12StateChangesVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_2158AB478(&qword_254DE8990);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_2158AB478(&qword_254DE8988);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t _s12StateChangesVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_2158AB478(&qword_254DE8990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2158AB478(&qword_254DE8988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t _s12StateChangesVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_2158AB478(&qword_254DE8990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2158AB478(&qword_254DE8988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t _s12StateChangesVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_2158AB478(&qword_254DE8990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2158AB478(&qword_254DE8988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t _s12StateChangesVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_2158AB478(&qword_254DE8990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2158AB478(&qword_254DE8988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t _s12StateChangesVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2158AC198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_2158AB478(&qword_254DE8990);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_2158AB478(&qword_254DE8988);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t _s12StateChangesVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2158AC220(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_2158AB478(&qword_254DE8990);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_2158AB478(&qword_254DE8988);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2158AC2A4()
{
  unint64_t v0;
  unint64_t v1;

  sub_2158AC348(319, &qword_254DE8A18, MEMORY[0x24BEE6A40]);
  if (v0 <= 0x3F)
  {
    sub_2158AC348(319, qword_254DE8A20, MEMORY[0x24BEE6A98]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_2158AC348(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, ValueMetadata *))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, &type metadata for STSReader.StateEvent);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_2158AC390(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for STSReader.StateChanges();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2158AC3CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;
  char v6;

  v0 = sub_2158AB478(&qword_254DE8A58);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = 0;
  v6 = 2;
  sub_2158AB478(&qword_254DE8990);
  sub_2158D899C();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2158AC46C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for STSReader.StateChanges();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2158AC4B4()
{
  type metadata accessor for STSReader.StateChanges();
  return sub_2158AC3CC();
}

void sub_2158AC4E0(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2158AC530(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2158AC540()
{
  return swift_release();
}

uint64_t sub_2158AC548(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v8;
  char v9;

  v2 = sub_2158AB478(&qword_254DE8A58);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v8 = (uint64_t)a1;
    v9 = 0;
    v6 = a1;
  }
  else
  {
    v8 = 1;
    v9 = 2;
  }
  sub_2158AB478(&qword_254DE8990);
  sub_2158D899C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2158AC614(uint64_t a1)
{
  return sub_2158AC8C0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2158AC548);
}

void sub_2158AC620(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_2158AC674(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v8;
  char v9;

  v2 = sub_2158AB478(&qword_254DE8A58);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1;
  v9 = 1;
  v6 = a1;
  sub_2158AB478(&qword_254DE8990);
  sub_2158D899C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_2158D89A8();
}

uint64_t sub_2158AC738(uint64_t a1)
{
  return sub_2158AC8C0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2158AC674);
}

uint64_t sub_2158AC744(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  char v9;

  v2 = sub_2158AB478(&qword_254DE8A58);
  v3 = *(_QWORD *)(v2 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v8 = a1;
    v9 = 1;
    v7 = a1;
    sub_2158AB478(&qword_254DE8990);
    sub_2158D899C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return sub_2158D89A8();
  }
  return result;
}

uint64_t sub_2158AC80C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for STSReader.StateChanges();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_2158AB478(&qword_254DE8990);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v3 + *(int *)(v1 + 20);
  v6 = sub_2158AB478(&qword_254DE8988);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t sub_2158AC8B4(uint64_t a1)
{
  return sub_2158AC8C0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2158AC744);
}

uint64_t sub_2158AC8C0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for STSReader.StateChanges() - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

void sub_2158ACB98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  uint64_t v11;
  id v12;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:]_block_invoke", 69, *(void **)(a1 + 32), CFSTR("Starting Control SE session"), v2, v3, v7);
  objc_msgSend(*(id *)(a1 + 32), "nfHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = sub_2158ACC8C;
  v10 = &unk_24D3A6E40;
  v5 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  objc_msgSend(v4, "startSecureElementManagerSession:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  **(_BYTE **)(a1 + 48) = objc_msgSend(v6, "isFirstInQueue", v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "setInitiatingSession:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));

}

void sub_2158ACC8C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_2158ACD5C;
  v12[3] = &unk_24D3A6E18;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

uint64_t sub_2158ACD5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  uint64_t result;
  double v20;
  uint64_t v21;

  if (*(_QWORD *)(a1 + 32))
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:]_block_invoke_3", 75, *(void **)(a1 + 40), CFSTR("Failed to start Control SE session: %@"), a7, a8, *(_QWORD *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(*(id *)(a1 + 40), "setMasterSESession:", *(_QWORD *)(a1 + 48));
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v9, "masterSESession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSessionDelegate:", v9);

  v11 = *(void **)(a1 + 40);
  objc_msgSend(v11, "masterSESession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v11);

  objc_msgSend(*(id *)(a1 + 40), "setInitiatingSession:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 0;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 32);
  *(_QWORD *)(v13 + 32) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 56) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:]_block_invoke_3", 88, *(void **)(a1 + 40), CFSTR("Control SE session started"), v15, v16, v21);
  objc_msgSend(*(id *)(a1 + 40), "theStartCallback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 40), "theStartCallback");
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v18[2](v18, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "setTheStartCallback:", 0);
  }
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    result = objc_msgSend(*(id *)(a1 + 56), "stsSession:didStart:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  if (!*(_QWORD *)(a1 + 32))
  {
    result = objc_msgSend(*(id *)(a1 + 40), "isTimeLimited");
    if (v20 > 0.0)
      return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 40), sel_setSessionTimeLimit_);
  }
  return result;
}

uint64_t sub_2158AD058(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_2158AD330(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_2158AD34C(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  uint64_t v3;
  int os_unfair_lock_opaque_low;
  void *v5;
  os_unfair_lock_s *v6;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 40);
  v6 = WeakRetained;
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    WeakRetained = v6;
  }
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "clearSessionTimer");
    os_unfair_lock_lock(v6 + 2);
    os_unfair_lock_opaque_low = LOBYTE(v6[14]._os_unfair_lock_opaque);
    LOBYTE(v6[14]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v6 + 2);
    WeakRetained = v6;
    if (os_unfair_lock_opaque_low)
    {
      -[os_unfair_lock_s delegate](v6, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "stsSession:didEnd:", *(_QWORD *)(a1 + 32), 0);

      WeakRetained = v6;
    }
  }

}

void sub_2158AED58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2158AED7C(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;
  objc_class *v6;
  const char *Name;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _BYTE state[22];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = _os_activity_create(&dword_2158A9000, "com.apple.sts.session.activeTimer", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v3, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)state = 136315394;
    *(_QWORD *)&state[4] = Name;
    *(_WORD *)&state[12] = 2048;
    *(_QWORD *)&state[14] = v8;
    _os_log_fault_impl(&dword_2158A9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s is still active after %lf seconds", state, 0x16u);
  }
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2158AEEE8;
  v9[3] = &unk_24D3A6EE0;
  v10 = v4;
  v11 = WeakRetained;
  v5 = v4;
  objc_msgSend(WeakRetained, "endSessionWithCompletion:", v9);

}

uint64_t sub_2158AEEE8(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "stsSessionDidEndUnexpectedly:errorCode:", *(_QWORD *)(a1 + 40), 7);
  return result;
}

void sub_2158AF214(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
    dispatch_group_leave(v1);
}

void sub_2158AF224(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
    dispatch_group_leave(v1);
}

void sub_2158AF234(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
    dispatch_group_leave(v1);
}

uint64_t sub_2158AF244(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2158AF2EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2158AF37C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2158B0930(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2158B0954(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id sub_2158B0964(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("STSXPCHelperErrorDomain"));

  if ((v6 & 1) == 0)
  {
    if (objc_msgSend(v4, "code") == 50)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NFC radio disabled");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v10;
      v29[1] = &unk_24D3B2960;
      v28[1] = CFSTR("Line");
      v28[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v11;
      v28[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 304);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[3] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 18, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      goto LABEL_13;
    }
    v14 = objc_msgSend(v4, "code");
    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == 47)
    {
      v26[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Reader mode protection enable");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      v27[1] = &unk_24D3B2978;
      v26[1] = CFSTR("Line");
      v26[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v2;
      v26[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 306);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v9, 20, v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v16;
      v24[1] = *MEMORY[0x24BDD1398];
      v17 = v4;
      if (!v4)
      {
        v19 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", v2, 5, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v25[1] = v17;
      v25[2] = &unk_24D3B2990;
      v24[2] = CFSTR("Line");
      v24[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[3] = v20;
      v24[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 308);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[4] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v9, 10, v22);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        goto LABEL_11;
    }

LABEL_11:
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "_translateSTSXPCHelperError:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v7;
}

uint64_t sub_2158B0DE4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2158B0DF4(uint64_t a1)
{

}

void sub_2158B0DFC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v7 = a3;
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]_block_invoke", 323, *(void **)(a1 + 32), CFSTR("Failed to start handover session: %@"), v9, v10, (uint64_t)v8);
    objc_msgSend(*(id *)(a1 + 32), "_activateSessionStartCompletion:", v8);

  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]_block_invoke", 328, *(void **)(a1 + 32), CFSTR("Handover session started"), v5, v6, v18);
    v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    objc_msgSend(*(id *)(a1 + 32), "setHandoverSession:", v19);
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "handoverSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v12);

    objc_sync_exit(v11);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 32), "stsNotificationListener");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "xpcEndpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startSTSNotificationListenerWithEndpoint:", v17);

    objc_msgSend(*(id *)(a1 + 32), "_activateSessionStartCompletion:", 0);
  }

}

void sub_2158B0F60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2158B0F74(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_2158B0F84(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_2158B0F94(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "_translateSTSXPCHelperError:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]_block_invoke_4", 380, *(void **)(a1 + 32), CFSTR("Failed to start QRCode handover session: %@"), v4, v5, (uint64_t)v6);
    objc_msgSend(*(id *)(a1 + 32), "_activateTnepStatusHandler:", v6);
    objc_msgSend(*(id *)(a1 + 32), "_activateInvalidationHandler:", v6);

  }
  else
  {
    objc_msgSend(v3, "_activateTnepStatusHandler:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_activateSessionStartCompletion:", 0);
  }
}

void sub_2158B17C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2158B17DC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t sub_2158B17F0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_2158B1804(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    v4 = objc_msgSend(v3, "code");
    v5 = *(void **)(a1 + 32);
    if (v4 == 6)
    {
      objc_msgSend(v5, "_activateInvalidationHandler:", v7);
    }
    else
    {
      objc_msgSend(v5, "_activateSendRequestCompletion:terminationRequested:error:", 0, 0, v7);
      v6 = *(id *)(a1 + 32);
      objc_sync_enter(v6);
      if (!objc_msgSend(*(id *)(a1 + 32), "transmissionState"))
        objc_msgSend(*(id *)(a1 + 32), "setTransmissionState:", 2);
      objc_sync_exit(v6);

    }
    v3 = v7;
  }

}

void sub_2158B189C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2158B18B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]_block_invoke", 469, *(void **)(a1 + 32), CFSTR("Timeout in getting response"), a7, a8, v17);
  v9 = *(void **)(a1 + 32);
  v10 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Timeout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = &unk_24D3B29C0;
  v18[1] = CFSTR("Line");
  v18[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v13;
  v18[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 470);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_activateSendRequestCompletion:terminationRequested:error:", 0, 0, v16);

}

void sub_2158B1B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2158B1ED0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned int *)(a1 + 48);
  v12[0] = *MEMORY[0x24BDD0FC8];
  if (v5 >= 0x18)
    v6 = 24;
  else
    v6 = v5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", off_24D3A6FA0[v6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_24D3B29F0;
  v12[1] = CFSTR("Line");
  v12[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  v12[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 518);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v11);

}

void sub_2158B27FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_2158B282C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  uint64_t v19;
  id v20;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]_block_invoke", 530, *(void **)(a1 + 32), CFSTR("Creating Proxy SE session"), a7, a8, v15);
  objc_msgSend(*(id *)(a1 + 32), "nfHwManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = sub_2158B2934;
  v18 = &unk_24D3A6E40;
  v11 = *(void **)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = v11;
  objc_msgSend(v10, "startSecureElementManagerSession:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(*(id *)(a1 + 32), "setInitiatingSession:", v14, v15, v16, v17, v18, v19);
  else
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]_block_invoke", 548, *(void **)(a1 + 32), CFSTR("Failed to start session."), v12, v13, v15);

}

void sub_2158B2934(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v7 = *(void **)(a1 + 32);
  if (a3)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]_block_invoke_2", 536, v7, CFSTR("Failed to create Proxy SE session: %@"), v5, v6, a3);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]_block_invoke_2", 538, v7, CFSTR("Got the SE Proxy"), v5, v6, v8);
    objc_msgSend(*(id *)(a1 + 32), "setInitiatingSession:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setProxyReaderSESession:", v9);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t sub_2158B29D8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t sub_2158B29F4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_2158B2A10(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Hardware Not Available");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_24D3B2A08;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 606);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v9);

}

void sub_2158B2BBC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Hardware Not Available");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_24D3B2A20;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 619);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v9);

}

uint64_t sub_2158B2D68(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "stsHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopReaderSEProxyListener");

  return objc_msgSend(*(id *)(a1 + 40), "_seProxyCleanup:", 0);
}

void sub_2158B2DB8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Hardware Not Available");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_24D3B2A38;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 639);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v9);

}

void sub_2158B3440(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2158B345C(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]_block_invoke", 701, v3, CFSTR("Session termination after SessionEstablishment"), v4, v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "_activateInvalidationHandler:", v7);

}

void sub_2158B3DBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2158B3DD0(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained;
    objc_sync_enter(v3);
    objc_msgSend(v3, "sessionStartCompletion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "sessionStartCompletion");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v5[2](v5, *(_QWORD *)(a1 + 32));

      objc_msgSend(v3, "setSessionStartCompletion:", 0);
    }
    objc_sync_exit(v3);

    WeakRetained = v6;
  }

}

void sub_2158B3E6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2158B3F48(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2158B3F5C(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained;
    objc_sync_enter(v3);
    objc_msgSend(v3, "tnepStatusHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "tnepStatusHandler");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v5[2](v5, *(_QWORD *)(a1 + 32));

      objc_msgSend(v3, "setTnepStatusHandler:", 0);
    }
    objc_sync_exit(v3);

    WeakRetained = v6;
  }

}

void sub_2158B3FF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2158B40AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_2158B40C0(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "connectionHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "connectionHandler");
      v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v3)[2](v3, v4);

      objc_msgSend(v4, "setConnectionHandler:", 0);
      WeakRetained = v4;
    }
  }

}

void sub_2158B4234(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_2158B4248(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "sendRequestCompletion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v10;
    if (v3)
    {
      objc_msgSend(v10, "_translateSTSXPCHelperError:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!*(_QWORD *)(a1 + 32))
      {
        objc_msgSend(v10, "caSessionStats");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setTotalSuccessfulTransactionsInSession:", objc_msgSend(v5, "totalSuccessfulTransactionsInSession") + 1);

      }
      objc_msgSend(v10, "sendRequestCompletion");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, *(_QWORD *)(a1 + 40), v4);

      objc_msgSend(v10, "setSendRequestCompletion:", 0);
      if (*(_BYTE *)(a1 + 64))
      {
        sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader _activateSendRequestCompletion:terminationRequested:error:]_block_invoke", 888, *(void **)(a1 + 48), CFSTR("Invoking invalidation handler"), v7, v8, v9);
        objc_msgSend(*(id *)(a1 + 48), "_activateInvalidationHandler:", *(_QWORD *)(a1 + 32));
      }

      WeakRetained = v10;
    }
  }

}

void sub_2158B4450(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2158B4464(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendRequestCompletion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(WeakRetained, "sendRequestCompletion");
      v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0, *(_QWORD *)(a1 + 32));

      objc_msgSend(WeakRetained, "setSendRequestCompletion:", 0);
    }
    objc_msgSend(WeakRetained, "invalidationHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(WeakRetained, "invalidationHandler");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v5[2](v5, *(_QWORD *)(a1 + 32));

      objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);
    }
  }

}

void sub_2158B6AE4(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v10 = v7;
  if (a3)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler startNFSessionWithCompletion:]_block_invoke", 41, v6, CFSTR("Failed to create NFPeerPaymentSession! %@"), v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[SignPeerPaymentHandler startNFSessionWithCompletion:]_block_invoke", 43, v6, CFSTR("Peer Payment session created"), v8, v9, v11);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_2158B7D20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (v8)
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) generateHandoverRequestForQRCodeWithConfiguration:responseHandler:]_block_invoke", 131, *(void **)(a1 + 32), CFSTR("request=%@"), v5, v6, (uint64_t)v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_2158B7FB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2158B7FC8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "sendRequestCompletion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v3)
    {
      objc_msgSend(v5, "sendRequestCompletion");
      v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, *(_QWORD *)(a1 + 32));

      objc_msgSend(v5, "setSendRequestCompletion:", 0);
      WeakRetained = v5;
    }
  }

}

uint64_t sub_2158B94A4(void *a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  STSXPCClientNotificationListener *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v9 = a3;
  v10 = a5;
  if (!a1)
    goto LABEL_6;
  v11 = objc_msgSend(a1, "initWithParent:", a2);
  if (v11)
  {
    v12 = -[STSXPCClientNotificationListener initWithDelegate:queue:]([STSXPCClientNotificationListener alloc], "initWithDelegate:queue:", v9, v10);
    v13 = *(void **)(v11 + 64);
    *(_QWORD *)(v11 + 64) = v12;

    *(_DWORD *)(v11 + 56) = 0;
    if (a4)
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013Handler initWithParent:notificationListenerDelegate:initSTSHelper:callbackQueue:]", 79, (void *)v11, CFSTR("Create STSHelper"), v14, v15, v22);
      v16 = objc_opt_new();
      v17 = *(void **)(v11 + 72);
      *(_QWORD *)(v11 + 72) = v16;

      v18 = *(void **)(v11 + 72);
      objc_msgSend(*(id *)(v11 + 64), "xpcEndpoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "connectToNotificationListener:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {

LABEL_6:
        v11 = 0;
      }
    }
  }

  return v11;
}

uint64_t sub_2158B95D4(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  STSXPCClientNotificationListener *v10;
  void *v11;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = objc_msgSend(a1, "initWithParent:", a3);
    if (v9)
    {
      v10 = -[STSXPCClientNotificationListener initWithDelegate:queue:]([STSXPCClientNotificationListener alloc], "initWithDelegate:queue:", v9, v8);
      v11 = *(void **)(v9 + 64);
      *(_QWORD *)(v9 + 64) = v10;

      objc_storeWeak((id *)(v9 + 80), v7);
      *(_DWORD *)(v9 + 56) = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t sub_2158B9688(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 88), "setDelegate:", 0);
    objc_msgSend(*(id *)(v1 + 88), "endSession");
    v2 = *(void **)(v1 + 88);
    *(_QWORD *)(v1 + 88) = 0;

    return objc_msgSend(*(id *)(v1 + 64), "invalidateXPCConnection");
  }
  return result;
}

void sub_2158B96E8(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

id sub_2158B9700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  _QWORD *v10;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  void *v47;
  objc_super v48;
  _QWORD v49[5];
  NSObject *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[4];
  _QWORD v61[4];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[4];
  _QWORD v65[6];

  v65[4] = *MEMORY[0x24BDAC8D0];
  v10 = *(_QWORD **)(a1 + 32);
  if (v10)
  {
    if (v10[11])
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 122, v10, CFSTR("handover session already exists, reusing"), a7, a8, v43);
      return 0;
    }
    v10[12] = 0;
    v10 = *(_QWORD **)(a1 + 32);
  }
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_2158B9F68;
  v56 = sub_2158B9F78;
  v57 = 0;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 132, v10, CFSTR("Starting handover device session, type=%lu"), a7, a8, 3);
  v12 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "nfHardwareManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = sub_2158B9F80;
  v49[3] = &unk_24D3A72B8;
  v49[4] = *(_QWORD *)(a1 + 32);
  v51 = &v52;
  v14 = v12;
  v50 = v14;
  v47 = v13;
  objc_msgSend(v13, "startSecureTransactionServicesSessionWithRole:connectionHandoverCofig:completion:", 0, 3, v49);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    sub_2158B96E8(*(_QWORD *)(a1 + 32), v17);
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(void **)(v18 + 88);
    else
      v19 = 0;
    v20 = v19;
    objc_msgSend(v20, "setDelegate:", v18);

    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 162, *(void **)(a1 + 32), CFSTR("Activating session with token: %@"), v21, v22, *(_QWORD *)(a1 + 40));
    v23 = *(_QWORD **)(a1 + 32);
    if (v23)
      v23 = (_QWORD *)v23[11];
    v24 = v23;
    objc_msgSend(v24, "activateWithToken:", *(_QWORD *)(a1 + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 165, *(void **)(a1 + 32), CFSTR("Session switching error=%@"), v26, v27, (uint64_t)v25);
      sub_2158B9688(*(_QWORD *)(a1 + 32));
      v28 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *MEMORY[0x24BDD1398];
      v63[0] = v30;
      v63[1] = v25;
      v62[1] = v31;
      v62[2] = CFSTR("Line");
      v63[2] = &unk_24D3B2E88;
      v62[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v63[3] = v8;
      v62[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 169);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v63[4] = v32;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 10, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

      if (!v53[5])
      {
        v48.receiver = *(id *)(a1 + 32);
        v48.super_class = (Class)ISO18013Handler;
        v37 = objc_msgSendSuper2(&v48, sel_startTransactionWithAuthorization_options_, 0, 0);
        v25 = 0;
        v14 = 0;
        v34 = 0;
        goto LABEL_16;
      }
      sub_2158B9688(*(_QWORD *)(a1 + 32));
      v36 = objc_msgSend((id)v53[5], "code");
      v45 = (void *)MEMORY[0x24BDD1540];
      if (v36 != 50)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v30;
        v58[1] = *MEMORY[0x24BDD1398];
        v38 = v53[5];
        if (v38)
        {
          v32 = (void *)v53[5];
        }
        else
        {
          v39 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorWithDomain:code:userInfo:", v8, 5, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v59[1] = v32;
        v59[2] = &unk_24D3B2EB8;
        v58[2] = CFSTR("Line");
        v58[3] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v59[3] = v40;
        v58[4] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 183);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v59[4] = v41;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 5);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", v29, 10, v42);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v38 == 0;

        v25 = 0;
        v14 = 0;
        if (!v46)
          goto LABEL_15;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NFC radio disabled");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v30;
      v61[1] = &unk_24D3B2EA0;
      v60[1] = CFSTR("Line");
      v60[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v61[2] = v8;
      v60[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 181);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v61[3] = v32;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", v29, 18, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v14 = 0;
    }

  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke", 153, *(void **)(a1 + 32), CFSTR("Fail to start SecureTransactionServicesSession"), v15, v16, v44);
    sub_2158B9688(*(_QWORD *)(a1 + 32));
    v35 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v29;
    v65[1] = &unk_24D3B2E70;
    v64[1] = CFSTR("Line");
    v64[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v30;
    v64[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 156);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", v25, 9, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

LABEL_15:
LABEL_16:

  _Block_object_dispose(&v52, 8);
  return v34;
}

void sub_2158B9F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2158B9F68(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2158B9F78(uint64_t a1)
{

}

void sub_2158B9F80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v8 = v5;
  v9 = *(_QWORD **)(a1 + 32);
  if (v5)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler _start18013TransactionWithToken:]_block_invoke_2", 143, v9, CFSTR("Start session failed: %@"), v6, v7, (uint64_t)v5);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v8;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    if (v9)
      v13 = (void *)v9[8];
    else
      v13 = 0;
    objc_msgSend(v13, "xpcEndpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startSTSNotificationListenerWithEndpoint:", v12);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_2158BA0AC(os_unfair_lock_s *a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  id v5;
  id v6;
  _QWORD v7[6];

  v3 = a2;
  if (a1)
  {
    v4 = a1 + 14;
    v7[1] = 3221225472;
    v7[2] = sub_2158BA140;
    v7[3] = &unk_24D3A7308;
    v7[4] = a1;
    v6 = v3;
    v7[0] = MEMORY[0x24BDAC760];
    v5 = v3;
    v7[5] = v5;
    os_unfair_lock_lock(v4);
    sub_2158BA140((uint64_t)v7);
    os_unfair_lock_unlock(v4);

    v3 = v6;
  }

}

uint64_t sub_2158BA140(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2
    && (*(_QWORD *)(v2 + 96) = 4, (v3 = *(_QWORD *)(a1 + 32)) != 0)
    && ((v4 = *(void **)(v3 + 88)) == 0 || (objc_msgSend(v4, "setDelegate:", 0), (v3 = *(_QWORD *)(a1 + 32)) != 0))
    && (v5 = *(void **)(v3 + 88)) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_2158BA248;
    v10[3] = &unk_24D3A6F80;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "endSessionWithCompletion:", v10);
    sub_2158B96E8(*(_QWORD *)(a1 + 32), 0);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 72);
  else
    v8 = 0;
  objc_msgSend(v8, "invalidate");
  return objc_msgSend(*(id *)(a1 + 32), "_tearDown");
}

uint64_t sub_2158BA248(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

id *sub_2158BA37C(id *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_semaphore_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD v24[5];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_2158B9F68;
    v31 = sub_2158B9F78;
    v32 = 0;
    objc_storeStrong(a1 + 13, a2);
    sub_2158CE0B8();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      objc_msgSend(v8, "subIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v12;
      _os_signpost_emit_with_name_impl(&dword_2158A9000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReleaseCredential", "keyIdentifier=%@", buf, 0xCu);

    }
    objc_msgSend(v8, "subIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler releaseCredential:withAuthorization:iso18013Selection:]", 266, a1, CFSTR("keyIdentifier=%@"), v14, v15, (uint64_t)v13);

    v16 = dispatch_semaphore_create(0);
    v17 = a1[8];
    objc_msgSend(v8, "subIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_2158BA62C;
    v24[3] = &unk_24D3A7330;
    v24[4] = a1;
    v26 = &v27;
    v19 = v16;
    v25 = v19;
    objc_msgSend(v17, "activateISO18013CredentialWithIdentifier:elementSelection:authData:completion:", v18, v10, v9, v24);

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler releaseCredential:withAuthorization:iso18013Selection:]", 280, a1, CFSTR("exit"), v20, v21, v23);
    a1 = (id *)(id)v28[5];

    _Block_object_dispose(&v27, 8);
  }

  return a1;
}

void sub_2158BA600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2158BA62C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler releaseCredential:withAuthorization:iso18013Selection:]_block_invoke", 273, *(void **)(a1 + 32), CFSTR("callback"), v4, v5, v8);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v9 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id *sub_2158BADC0(id *WeakRetained)
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
  return WeakRetained;
}

void sub_2158BB49C(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  _QWORD v2[5];

  if (a1)
  {
    v1 = a1 + 14;
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = sub_2158BB514;
    v2[3] = &unk_24D3A6F58;
    v2[4] = a1;
    os_unfair_lock_lock(a1 + 14);
    sub_2158BB514((uint64_t)v2);
    os_unfair_lock_unlock(v1);
  }
}

void sub_2158BB514(uint64_t a1)
{
  _QWORD *v1;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[11])
  {
    objc_initWeak(&location, v1);
    v3 = dispatch_time(0, 200000000);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_2158BB600;
    v5[3] = &unk_24D3A7210;
    objc_copyWeak(&v6, &location);
    dispatch_after(v3, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void sub_2158BB5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2158BB600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v10;
  id *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;

  sub_2158CDFE0(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler delayedStopTNEPOperation]_block_invoke_2", 509, (uint64_t)"after delay", a6, a7, a8, v12);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = WeakRetained + 14;
    v13 = WeakRetained;
    v11 = WeakRetained;
    os_unfair_lock_lock(v10);
    objc_msgSend(v11[11], "stopTNEPOperation");
    os_unfair_lock_unlock(v10);

    WeakRetained = v13;
  }

}

id sub_2158BBD64(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id sub_2158BC458(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)MEMORY[0x24BDBD1C8];
  else
    v2 = (void *)MEMORY[0x24BDBD1C0];
  v3 = v2;

  return v3;
}

void sub_2158BC590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2158BC5A8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delayWork");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v4, "addObject:", v3);

  }
}

void sub_2158BC6E0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2158BC7B8;
  v10[3] = &unk_24D3A73D8;
  v10[4] = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v11 = v4;
  v12 = v5;
  objc_msgSend(v2, "_asynchronousRemoteProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = sub_2158BC988;
  v8[3] = &unk_24D3A7400;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "sendRawDataToAlternativeCarrier:callback:", v7, v8);

}

void sub_2158BC7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener alternativerCarrierSend:completion:]_block_invoke_2", 74, *(void **)(a1 + 32), CFSTR("XPC error=%@"), a7, a8, a2);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = &unk_24D3B2F00;
  v17[1] = CFSTR("Line");
  v17[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 75);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v16);

}

uint64_t sub_2158BC988(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2158BC9E4(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_2158BCA50;
  v3[3] = &unk_24D3A6F30;
  v3[4] = v1;
  objc_msgSend(v1, "_asynchronousRemoteProxyWithErrorHandler:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendConnectionHandoverStarted");

}

void sub_2158BCA50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener sendConnectionHandoverStarted]_block_invoke_2", 89, *(void **)(a1 + 32), CFSTR("XPC error=%@"), a7, a8, a2);
}

void sub_2158BCAE0(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_2158BCB4C;
  v3[3] = &unk_24D3A6F30;
  v3[4] = v1;
  objc_msgSend(v1, "_asynchronousRemoteProxyWithErrorHandler:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendConnectionHandoverCompleted");

}

void sub_2158BCB4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener sendConnectionHandoverCompleted]_block_invoke_2", 100, *(void **)(a1 + 32), CFSTR("XPC error=%@"), a7, a8, a2);
}

void sub_2158BCC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2158BCC68(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2158BCC78(uint64_t a1)
{

}

void sub_2158BCC80(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener setRequestHandoverConfirmation:]_block_invoke", 108, *(void **)(a1 + 32), CFSTR("XPC error=%@"), v4, v5, (uint64_t)v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_2158BCDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2158BCDEC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener startHandoff]_block_invoke", 118, *(void **)(a1 + 32), CFSTR("XPC error=%@"), v4, v5, (uint64_t)v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_2158BCE50(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2158BCF6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener activateISO18013CredentialWithIdentifier:elementSelection:authData:completion:]_block_invoke", 137, *(void **)(a1 + 32), CFSTR("XPC error=%@"), a7, a8, a2);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = &unk_24D3B2F18;
  v17[1] = CFSTR("Line");
  v17[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 138);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v16);

}

void sub_2158BD230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener sendISO18013SessionEstablishment:completion:]_block_invoke", 144, *(void **)(a1 + 32), CFSTR("XPC error=%@"), a7, a8, a2);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = &unk_24D3B2F30;
  v17[1] = CFSTR("Line");
  v17[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 145);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v16);

}

uint64_t sub_2158BD400(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2158BD514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener sendISO18013SessionData:status:completion:]_block_invoke", 156, *(void **)(a1 + 32), CFSTR("XPC error=%@"), a7, a8, a2);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = &unk_24D3B2F48;
  v17[1] = CFSTR("Line");
  v17[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 157);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v16);

}

uint64_t sub_2158BD6E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2158BD7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener testGetRemoteTransceiverProxyXPCEndpointWithType:completion:]_block_invoke", 171, *(void **)(a1 + 32), CFSTR("XPC error=%@"), a7, a8, a2);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = &unk_24D3B2F60;
  v17[1] = CFSTR("Line");
  v17[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 172);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v16, 0);

}

uint64_t sub_2158BD9B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2158BDB20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2158BDBE0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD block[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke", 208, *(void **)(a1 + 32), CFSTR("Connection existed"), v3, v4, v20);
    return MEMORY[0x24BDBD1C0];
  }
  else
  {
    v6 = sub_2158CF300([STSEntitlementChecker alloc], *(void **)(a1 + 40));
    v9 = v6;
    if (!v6 || !*((_BYTE *)v6 + 8))
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke", 214, *(void **)(a1 + 32), CFSTR("Missing xpcClientNotificationListenerAccess entitlement"), v7, v8, v20);
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke", 221, *(void **)(a1 + 32), CFSTR("Accepting new connection"), v7, v8, v20);
    objc_msgSend(*(id *)(a1 + 32), "_stsHandoverNotificationListenerProtocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setExportedInterface:", v10);

    objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_stsHandoverNotificationListenerCallbackProtocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setRemoteObjectInterface:", v11);

    objc_initWeak(&location, *(id *)(a1 + 32));
    v12 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_2158BDED0;
    v25[3] = &unk_24D3A74C8;
    v25[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v26, &location);
    objc_msgSend(*(id *)(a1 + 40), "setInvalidationHandler:", v25);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = sub_2158BDF7C;
    v23[3] = &unk_24D3A74C8;
    v23[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v24, &location);
    objc_msgSend(*(id *)(a1 + 40), "setInterruptionHandler:", v23);
    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setQueue:", v14);

    objc_msgSend(*(id *)(a1 + 40), "resume");
    objc_msgSend(*(id *)(a1 + 32), "delayWork");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(*(id *)(a1 + 32), "delayWork");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = sub_2158BDFF8;
    block[3] = &unk_24D3A6EE0;
    block[4] = *(_QWORD *)(a1 + 32);
    v22 = v16;
    v19 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    return MEMORY[0x24BDBD1C8];
  }
}

void sub_2158BDE9C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_2158BDED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_s *WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke_2", 236, *(void **)(a1 + 32), CFSTR("XPC invalidated"), a7, a8, v12);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v13 = WeakRetained;
    -[os_unfair_lock_s setXpcConnection:](WeakRetained, "setXpcConnection:", 0);
    -[os_unfair_lock_s delegate](v13, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "xpcInvalidated");

    os_unfair_lock_lock(v13 + 2);
    -[os_unfair_lock_s delayWork](v13, "delayWork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    os_unfair_lock_unlock(v13 + 2);
    WeakRetained = v13;
  }

}

void sub_2158BDF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCClientNotificationListener listener:shouldAcceptNewConnection:]_block_invoke_4", 248, *(void **)(a1 + 32), CFSTR("XPC interrupted"), a7, a8, v11);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(WeakRetained, "setXpcConnection:", 0);
    objc_msgSend(v12, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "xpcInterrupted");

    WeakRetained = v12;
  }

}

void sub_2158BDFF8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "notificationClientConnected");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void sub_2158BEB08(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  STS18013RequestElement *v13;
  id v14;
  uint64_t v15;
  STS18013RequestElement *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = [STS18013RequestElement alloc];
        if (v12)
        {
          v14 = *(id *)(v12 + 16);
          v15 = *(unsigned __int16 *)(v12 + 8);
        }
        else
        {
          v14 = 0;
          v15 = 0;
        }
        v16 = -[STS18013RequestElement initWithName:retention:](v13, "initWithName:retention:", v14, v15);
        objc_msgSend(v6, "addObject:", v16);

        ++v11;
      }
      while (v9 != v11);
      v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v9 = v17;
    }
    while (v17);
  }

  v18 = *(void **)(a1 + 32);
  v19 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v18, "setValue:forKey:", v19, v4);

}

id sub_2158BED74(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(v3, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_2158BEE58;
    v11[3] = &unk_24D3A7138;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = v9;
    v13 = v10;
    dispatch_async(v8, v11);

    return 0;
  }
}

void sub_2158BEE58(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_24D3B2F78;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 505);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);

}

id sub_2158BF0A4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(v3, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_2158BF188;
    v11[3] = &unk_24D3A7138;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = v9;
    v13 = v10;
    dispatch_async(v8, v11);

    return 0;
  }
}

void sub_2158BF188(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "XPC Error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_24D3B2F90;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 520);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);

}

id *sub_2158BF3F8(id *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)STSCredentialSelect;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

void sub_2158BF804(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v10 = v7;
  if (a3)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler startNFSessionWithCompletion:]_block_invoke", 34, v6, CFSTR("Failed to create loyalty and payment session! %@"), v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[PaymentHandler startNFSessionWithCompletion:]_block_invoke", 36, v6, CFSTR("Loyalty and payment session created"), v8, v9, v11);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDelegate:");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id sub_2158C07A8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[4];
  _BYTE v52[128];
  _QWORD v53[4];
  _QWORD v54[6];

  v54[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v6 = (void *)objc_opt_new();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v43 = v5;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v45 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            if (objc_msgSend(v12, "type") != 1)
            {
              v24 = objc_msgSend(v12, "type");
              sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setAuxiliaryCredentials:]", 135, (void *)a1, CFSTR("Incorrect aux credential type: %ld"), v25, v26, v24);
              v27 = (void *)MEMORY[0x24BDD1540];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v50[0] = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v51[0] = v29;
              v51[1] = &unk_24D3B3068;
              v50[1] = CFSTR("Line");
              v50[2] = CFSTR("Method");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_setAuxiliaryCredentials_));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v51[2] = v30;
              v50[3] = *MEMORY[0x24BDD0BA0];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_setAuxiliaryCredentials_), 136);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v51[3] = v31;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 8, v32);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_16;
            }
            v13 = (objc_class *)MEMORY[0x24BE6B5D0];
            v14 = v12;
            v15 = objc_alloc_init(v13);
            objc_msgSend(v14, "merchantId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setIdentifier:", v16);

            objc_msgSend(v14, "data");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setData:", v17);

            objc_msgSend(v14, "mobileToken");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setToken:", v18);

            objc_msgSend(v15, "setUserInterventionRequired:", objc_msgSend(v14, "userInterventionRequired"));
            v19 = objc_msgSend(v14, "type");

            objc_msgSend(v15, "setType:", v19);
            objc_msgSend(v6, "addObject:", v15);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v9)
            continue;
          break;
        }
      }

      if ((objc_msgSend(*(id *)(a1 + 56), "setHostCards:", v6) & 1) != 0)
      {
        v22 = v7;
        v23 = 0;
        v7 = *(id *)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v22;
      }
      else
      {
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setAuxiliaryCredentials:]", 151, (void *)a1, CFSTR("%@ failed to set VAS cards"), v20, v21, (uint64_t)v6);
        v37 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v48[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v28;
        v49[1] = &unk_24D3B3080;
        v48[1] = CFSTR("Line");
        v48[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_setAuxiliaryCredentials_));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v49[2] = v38;
        v48[3] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_setAuxiliaryCredentials_), 152);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v49[3] = v39;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", v7, 10, v40);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      }
      v5 = v43;
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setAuxiliaryCredentials:]", 127, (void *)a1, CFSTR("NF session does not exist!"), v3, v4, v42);
      v33 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v54[0] = v7;
      v54[1] = &unk_24D3B3050;
      v53[1] = CFSTR("Line");
      v53[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_setAuxiliaryCredentials_));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v54[2] = v34;
      v53[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_setAuxiliaryCredentials_), 128);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v54[3] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", v6, 9, v36);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

id sub_2158C0DE8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[4];
  _QWORD v35[6];

  v35[4] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v9 = (void *)a1[7];
    if (v9)
    {
      v10 = a2;
      v31 = 0;
      v11 = objc_msgSend(v9, "enablePlasticCardMode:error:", a2, &v31);
      v12 = v31;
      v15 = v12;
      if ((v11 & 1) != 0)
        return v15;
      v16 = CFSTR("disabling");
      if (v10)
        v16 = CFSTR("enabling");
      v30 = v12;
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler enablePlasticCardMode:]", 167, a1, CFSTR("%@ plastic card mode failed = %@"), v13, v14, (uint64_t)v16);
      v17 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v19;
      v32[1] = *MEMORY[0x24BDD1398];
      v20 = v15;
      if (!v15)
      {
        v21 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", v11, 5, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v33[1] = v20;
      v33[2] = &unk_24D3B30B0;
      v32[2] = CFSTR("Line");
      v32[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_enablePlasticCardMode_), v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v22;
      v32[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_enablePlasticCardMode_), 168);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33[4] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 10, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      if (v15)
      {
LABEL_12:

        v15 = (void *)v25;
        return v15;
      }
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler enablePlasticCardMode:]", 161, a1, CFSTR("NF session does not exist!"), a7, a8, v29);
      v26 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v19;
      v35[1] = &unk_24D3B3098;
      v34[1] = CFSTR("Line");
      v34[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_enablePlasticCardMode_));
      v11 = objc_claimAutoreleasedReturnValue();
      v35[2] = v11;
      v34[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_enablePlasticCardMode_), 162);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[3] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v18, 9, v27);
      v25 = objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  return 0;
}

id sub_2158C11B8(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[4];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v9 = v6;
  if (!a1)
    goto LABEL_25;
  if (!a1[7])
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler felicaCredentialState:error:]", 178, a1, CFSTR("NF session does not exist!"), v7, v8, v35);
    if (a3)
    {
      v33 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v22;
      v45[1] = &unk_24D3B30C8;
      v44[1] = CFSTR("Line");
      v44[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_felicaCredentialState_error_));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v28;
      v44[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_felicaCredentialState_error_), 180);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", v13, 9, v3);
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_25:
    v17 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (v11 = (void *)a1[7],
        objc_msgSend(v9, "identifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "appletWithIdentifier:", v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    objc_msgSend(v9, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler felicaCredentialState:error:]", 203, a1, CFSTR("applet not found for identifier = %@"), v30, v31, (uint64_t)v29);

    if (!a3)
    {
      v13 = 0;
      v17 = 0;
      goto LABEL_22;
    }
    v32 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v38 = objc_claimAutoreleasedReturnValue();
    v41[0] = v38;
    v41[1] = &unk_24D3B30F8;
    v40[1] = CFSTR("Line");
    v40[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_felicaCredentialState_error_));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v23;
    v40[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_felicaCredentialState_error_), 205);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v22, 8, v24);
    v13 = 0;
    v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

    v28 = (void *)v38;
LABEL_19:

    goto LABEL_20;
  }
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler felicaCredentialState:error:]", 193, a1, CFSTR("Felica applet %@"), v14, v15, (uint64_t)v13);
  v16 = (void *)a1[7];
  v39 = 0;
  objc_msgSend(v16, "felicaAppletState:error:", v13, &v39);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v39;
  if (v17)
    v21 = v18 == 0;
  else
    v21 = 0;
  if (v21)
  {
    v22 = 0;
    goto LABEL_21;
  }
  v22 = v18;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler felicaCredentialState:error:]", 197, a1, CFSTR("get felica state failed = %@"), v19, v20, (uint64_t)v18);
  if (a3)
  {
    v37 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v38 = objc_claimAutoreleasedReturnValue();
    v42[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v23;
    v42[1] = *MEMORY[0x24BDD1398];
    v24 = v22;
    if (!v22)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v3, 5, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43[1] = v24;
    v43[2] = &unk_24D3B30E0;
    v42[2] = CFSTR("Line");
    v42[3] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_felicaCredentialState_error_));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v36;
    v42[4] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_felicaCredentialState_error_), 199);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 10, v27);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v28 = (void *)v38;
LABEL_20:

      goto LABEL_21;
    }
    goto LABEL_16;
  }
LABEL_21:

LABEL_22:
LABEL_23:

  return v17;
}

id sub_2158C17A4(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[4];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v9 = v6;
  if (!a1)
    goto LABEL_25;
  if (!a1[7])
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler transitCredentialState:error:]", 216, a1, CFSTR("NF session does not exist!"), v7, v8, v35);
    if (a3)
    {
      v33 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v22;
      v45[1] = &unk_24D3B3110;
      v44[1] = CFSTR("Line");
      v44[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_transitCredentialState_error_));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v28;
      v44[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_transitCredentialState_error_), 218);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", v13, 9, v3);
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_25:
    v17 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (v11 = (void *)a1[7],
        objc_msgSend(v9, "identifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "appletWithIdentifier:", v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    objc_msgSend(v9, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler transitCredentialState:error:]", 241, a1, CFSTR("applet not found for identifier = %@"), v30, v31, (uint64_t)v29);

    if (!a3)
    {
      v13 = 0;
      v17 = 0;
      goto LABEL_22;
    }
    v32 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v38 = objc_claimAutoreleasedReturnValue();
    v41[0] = v38;
    v41[1] = &unk_24D3B3140;
    v40[1] = CFSTR("Line");
    v40[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_transitCredentialState_error_));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v23;
    v40[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_transitCredentialState_error_), 243);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v22, 8, v24);
    v13 = 0;
    v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

    v28 = (void *)v38;
LABEL_19:

    goto LABEL_20;
  }
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler transitCredentialState:error:]", 231, a1, CFSTR("Transit applet %@"), v14, v15, (uint64_t)v13);
  v16 = (void *)a1[7];
  v39 = 0;
  objc_msgSend(v16, "transitAppletState:error:", v13, &v39);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v39;
  if (v17)
    v21 = v18 == 0;
  else
    v21 = 0;
  if (v21)
  {
    v22 = 0;
    goto LABEL_21;
  }
  v22 = v18;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler transitCredentialState:error:]", 235, a1, CFSTR("get transit state failed = %@"), v19, v20, (uint64_t)v18);
  if (a3)
  {
    v37 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v38 = objc_claimAutoreleasedReturnValue();
    v42[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v23;
    v42[1] = *MEMORY[0x24BDD1398];
    v24 = v22;
    if (!v22)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v3, 5, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43[1] = v24;
    v43[2] = &unk_24D3B3128;
    v42[2] = CFSTR("Line");
    v42[3] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_transitCredentialState_error_));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v36;
    v42[4] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_transitCredentialState_error_), 237);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 10, v27);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v28 = (void *)v38;
LABEL_20:

      goto LABEL_21;
    }
    goto LABEL_16;
  }
LABEL_21:

LABEL_22:
LABEL_23:

  return v17;
}

void sub_2158C27E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2158C2928(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2158C2E78(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_2158C361C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2158C3640(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2158C3650(uint64_t a1)
{

}

void sub_2158C3658(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHandler activateWithHandoffToken:]_block_invoke", 83, *(void **)(a1 + 32), CFSTR("%@"), v4, v5, (uint64_t)v6);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t sub_2158C3A84(void *a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  STSXPCClientNotificationListener *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v9 = a3;
  v10 = a5;
  if (!a1)
    goto LABEL_6;
  v11 = objc_msgSend(a1, "initWithParent:", a2);
  if (v11)
  {
    v12 = -[STSXPCClientNotificationListener initWithDelegate:queue:]([STSXPCClientNotificationListener alloc], "initWithDelegate:queue:", v9, v10);
    v13 = *(void **)(v11 + 64);
    *(_QWORD *)(v11 + 64) = v12;

    *(_DWORD *)(v11 + 56) = 0;
    if (a4)
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013HybridHandler initWithParent:notificationListenerDelegate:initSTSHelper:callbackQueue:]", 78, (void *)v11, CFSTR("Create STSHelper"), v14, v15, v22);
      v16 = objc_opt_new();
      v17 = *(void **)(v11 + 72);
      *(_QWORD *)(v11 + 72) = v16;

      v18 = *(void **)(v11 + 72);
      objc_msgSend(*(id *)(v11 + 64), "xpcEndpoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "connectToNotificationListener:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {

LABEL_6:
        v11 = 0;
      }
    }
  }

  return v11;
}

uint64_t sub_2158C3BB4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 88), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 88), "endSession");
  v2 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;

  return objc_msgSend(*(id *)(a1 + 64), "invalidateXPCConnection");
}

uint64_t sub_2158C3C0C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2158C3C1C(uint64_t a1)
{

}

void sub_2158C3C24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v8 = v5;
  v9 = *(void **)(a1 + 32);
  if (v5)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]_block_invoke", 131, v9, CFSTR("Start session failed: %@"), v6, v7, (uint64_t)v5);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v8;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]_block_invoke", 136, v9, CFSTR("Start session started"), v6, v7, v15);
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      v14 = *(void **)(v13 + 64);
    else
      v14 = 0;
    objc_msgSend(v14, "xpcEndpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startSTSNotificationListenerWithEndpoint:", v12);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_2158C52A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_2158C52F4(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

void sub_2158C530C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = objc_msgSend(v13, "type");
  if (v7 == objc_msgSend(*(id *)(a1 + 32), "supportedCredentialType")
    && (objc_msgSend(v13, "identifier"), (v8 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v9 = (void *)v8,
        objc_msgSend(v13, "secondarySubIdentifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    objc_msgSend(v13, "subIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = *(_QWORD *)(a1 + 40);
    else
      v12 = *(_QWORD *)(a1 + 48);
    objc_storeStrong((id *)(*(_QWORD *)(v12 + 8) + 40), a2);
  }
  else
  {
    *a4 = 1;
  }

}

void sub_2158C5440(os_unfair_lock_s *a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  id v5;
  id v6;
  _QWORD v7[6];

  v3 = a2;
  if (a1)
  {
    v4 = a1 + 14;
    v7[1] = 3221225472;
    v7[2] = sub_2158C54D4;
    v7[3] = &unk_24D3A7308;
    v7[4] = a1;
    v6 = v3;
    v7[0] = MEMORY[0x24BDAC760];
    v5 = v3;
    v7[5] = v5;
    os_unfair_lock_lock(v4);
    sub_2158C54D4((uint64_t)v7);
    os_unfair_lock_unlock(v4);

    v3 = v6;
  }

}

uint64_t sub_2158C54D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2
    && (*(_QWORD *)(v2 + 112) = 4, (v3 = *(_QWORD *)(a1 + 32)) != 0)
    && ((v4 = *(void **)(v3 + 88)) == 0 || (objc_msgSend(v4, "setDelegate:", 0), (v3 = *(_QWORD *)(a1 + 32)) != 0))
    && (v5 = *(void **)(v3 + 88)) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_2158C55F0;
    v11[3] = &unk_24D3A6F80;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v5, "endSessionWithCompletion:", v11);
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      objc_storeStrong((id *)(v6 + 88), 0);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 72);
  else
    v9 = 0;
  objc_msgSend(v9, "invalidate");
  return objc_msgSend(*(id *)(a1 + 32), "_tearDown");
}

uint64_t sub_2158C55F0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

id *sub_2158C5984(id *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_semaphore_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD v24[5];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_2158C3C0C;
    v31 = sub_2158C3C1C;
    v32 = 0;
    objc_storeStrong(a1 + 12, a2);
    sub_2158CE0B8();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      objc_msgSend(v8, "subIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v12;
      _os_signpost_emit_with_name_impl(&dword_2158A9000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReleaseCredential", "keyIdentifier=%@", buf, 0xCu);

    }
    objc_msgSend(v8, "subIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler releaseCredential:withAuthorization:iso18013Selection:]", 364, a1, CFSTR("keyIdentifier=%@"), v14, v15, (uint64_t)v13);

    v16 = dispatch_semaphore_create(0);
    v17 = a1[8];
    objc_msgSend(v8, "subIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_2158C5C34;
    v24[3] = &unk_24D3A7330;
    v24[4] = a1;
    v26 = &v27;
    v19 = v16;
    v25 = v19;
    objc_msgSend(v17, "activateISO18013CredentialWithIdentifier:elementSelection:authData:completion:", v18, v10, v9, v24);

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler releaseCredential:withAuthorization:iso18013Selection:]", 378, a1, CFSTR("exit"), v20, v21, v23);
    a1 = (id *)(id)v28[5];

    _Block_object_dispose(&v27, 8);
  }

  return a1;
}

void sub_2158C5C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2158C5C34(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler releaseCredential:withAuthorization:iso18013Selection:]_block_invoke", 371, *(void **)(a1 + 32), CFSTR("callback"), v4, v5, v8);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v9 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id *sub_2158C6770(id *WeakRetained)
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
  return WeakRetained;
}

void sub_2158C6E4C(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  _QWORD v2[5];

  if (a1)
  {
    v1 = a1 + 14;
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = sub_2158C6EC4;
    v2[3] = &unk_24D3A6F58;
    v2[4] = a1;
    os_unfair_lock_lock(a1 + 14);
    sub_2158C6EC4((uint64_t)v2);
    os_unfair_lock_unlock(v1);
  }
}

void sub_2158C6EC4(uint64_t a1)
{
  _QWORD *v1;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[11])
  {
    objc_initWeak(&location, v1);
    v3 = dispatch_time(0, 200000000);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_2158C6FB0;
    v5[3] = &unk_24D3A7210;
    objc_copyWeak(&v6, &location);
    dispatch_after(v3, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void sub_2158C6F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2158C6FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v10;
  id *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;

  sub_2158CDFE0(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler delayedStopTNEPOperation]_block_invoke_2", 621, (uint64_t)"after delay", a6, a7, a8, v12);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = WeakRetained + 14;
    v13 = WeakRetained;
    v11 = WeakRetained;
    os_unfair_lock_lock(v10);
    objc_msgSend(v11[11], "stopTNEPOperation");
    os_unfair_lock_unlock(v10);

    WeakRetained = v13;
  }

}

void sub_2158C7DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2158C7DD0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2158C7DE0(uint64_t a1)
{

}

void sub_2158C7DE8(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v6 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener startWithDelegate:]_block_invoke", 49, *(void **)(a1 + 32), CFSTR("Session created: error: %@"), v7, v8, (uint64_t)v6);
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener startWithDelegate:]_block_invoke", 50, *(void **)(a1 + 32), CFSTR("Session: %@"), v9, v10, (uint64_t)v11);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (!v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
    objc_msgSend(v11, "setDelegate:", *(_QWORD *)(a1 + 32));
  }

}

void sub_2158C7F70(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

void sub_2158C8004(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didEndSession]_block_invoke", 80, *(void **)(a1 + 32), CFSTR("firing event"), v2, v3, v4);
    objc_msgSend(v5, "listenerDidEndUnexpectedly:", *(_QWORD *)(a1 + 32));
  }

}

void sub_2158C8128(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didStartSession:]_block_invoke", 91, *(void **)(a1 + 32), CFSTR("firing event"), v2, v3, v4);
    objc_msgSend(v5, "listenerDidStart:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void sub_2158C824C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didEnterField:]_block_invoke", 103, *(void **)(a1 + 32), CFSTR("firing event"), v2, v3, v4);
    objc_msgSend(v5, "listener:didEnterField:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }

}

void sub_2158C8358(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didExitField]_block_invoke", 114, *(void **)(a1 + 32), CFSTR("firing event"), v2, v3, v4);
    objc_msgSend(v5, "listener:didExitField:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }

}

id sub_2158CA520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2158CDF18(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[CALogger postCAEventFor:eventInput:]_block_invoke", 20, CFSTR("Posting for %@ = %@"), a6, a7, a8, *(_QWORD *)(a1 + 32));
  return *(id *)(a1 + 40);
}

void sub_2158CA9A0(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v10 = v7;
  if (a3)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler startNFSessionWithCompletion:]_block_invoke", 39, v6, CFSTR("Failed to create NFECommercePaymentSession! %@"), v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[SignMerchantPaymentHandler startNFSessionWithCompletion:]_block_invoke", 41, v6, CFSTR("NFECommercePaymentSession session created"), v8, v9, v11);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_2158CB26C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_2158CB3D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2158CB494(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v10 = v7;
  if (a3)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler startNFSessionWithCompletion:]_block_invoke", 36, v6, CFSTR("Failed to create digital car key session! %@"), v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[DigitalCarKeyHandler startNFSessionWithCompletion:]_block_invoke", 38, v6, CFSTR("Digital car key session created"), v8, v9, v11);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setPassthroughDelegate:");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_2158CC1D4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t vars0;

  if (a1)
  {
    v9 = a1[7];
    if (v9)
      return MEMORY[0x24BEDD108](v9, sel_supportsSecureRanging);
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler supportsSecureRanging]", 107, a1, CFSTR("NF session does not exist!"), a7, a8, vars0);
  }
  return 0;
}

id sub_2158CC228(id a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE6B588], "vehicleReports:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    if (v3 && objc_msgSend(v3, "count"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = sub_2158CC31C;
      v10[3] = &unk_24D3A76F8;
      v2 = v7;
      v11 = v2;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler vehicleReports:]", 118, v2, CFSTR("No vehicle reports."), v4, v5, v9);
      v2 = 0;
    }

  }
  return v2;
}

void sub_2158CC31C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  v7 = -[STSVehicleReport initVehicleReport:]([STSVehicleReport alloc], "initVehicleReport:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, v6);
}

id sub_2158CC394(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if (!a1[7])
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler rkeSendPassthroughMessage:]", 136, a1, CFSTR("NF session does not exist!"), v3, v4, v27);
    v22 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v15;
    v34[1] = &unk_24D3B3548;
    v33[1] = CFSTR("Line");
    v33[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_rkeSendPassthroughMessage_));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v16;
    v33[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_rkeSendPassthroughMessage_), 137);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v17;
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = v34;
    v25 = v33;
LABEL_9:
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v22;
    v20 = v14;
    v21 = 9;
    goto LABEL_10;
  }
  objc_msgSend(a1, "activeSTSCredential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler rkeSendPassthroughMessage:]", 139, a1, CFSTR("Credential does not exist!"), v7, v8, v27);
    v22 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    v32[1] = &unk_24D3B3560;
    v31[1] = CFSTR("Line");
    v31[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_rkeSendPassthroughMessage_));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v16;
    v31[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_rkeSendPassthroughMessage_), 140);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v17;
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = v32;
    v25 = v31;
    goto LABEL_9;
  }
  v9 = (void *)a1[7];
  v28 = 0;
  v10 = objc_msgSend(v9, "sendPassthroughMessage:error:", v5, &v28);
  v11 = v28;
  v12 = v11;
  if ((v10 & 1) == 0 && !v11)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unknown Error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v15;
    v30[1] = &unk_24D3B3578;
    v29[1] = CFSTR("Line");
    v29[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_rkeSendPassthroughMessage_));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v16;
    v29[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel_rkeSendPassthroughMessage_), 147);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    v20 = v14;
    v21 = 5;
LABEL_10:
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:

  return v12;
}

id *sub_2158CC7DC(id *a1, uint64_t a2)
{
  if (a1)
  {
    objc_msgSend(a1[7], "cancelRKEFunction:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id sub_2158CC808(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE6B588], "pauseRangingForReaderIdentifier:durationInSec:", a2, a3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id sub_2158CC834(void *a1, uint64_t a2)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE6B588], "resumeRangingForReaderIdentifier:", a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id sub_2158CCEF0(uint64_t a1, void *a2, void *a3, const __CFString **a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BE6B588], "requestAssertionForKeyID:options:outError:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (a4)
      v12 = *a4;
    else
      v12 = CFSTR("(error not avail)");
    sub_2158CDF18(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[DigitalCarKeyHandler requestAssertionForKeyID:options:outError:]", 275, CFSTR("Failed to get assertion %@"), v9, v10, v11, (uint64_t)v12);
  }
  return v8;
}

uint64_t sub_2158CDC84()
{
  if (qword_254DE9348 != -1)
    dispatch_once(&qword_254DE9348, &unk_24D3A7718);
  return dword_254DE9344;
}

uint64_t sub_2158CDCC4()
{
  uint64_t result;

  result = arc4random();
  dword_254DE9344 = result;
  return result;
}

void sub_2158CDCE0(os_log_type_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (qword_254DE9358 != -1)
    dispatch_once(&qword_254DE9358, &unk_24D3A7738);
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v5, a3));
  v7 = objc_msgSend(v6, "UTF8String");
  v8 = qword_254DE9350;
  if (os_log_type_enabled((os_log_t)qword_254DE9350, a1))
  {
    v9 = 136446210;
    v10 = v7;
    _os_log_impl(&dword_2158A9000, v8, a1, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

}

void sub_2158CDDF0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sts", "logging");
  v1 = (void *)qword_254DE9350;
  qword_254DE9350 = (uint64_t)v0;

}

void sub_2158CDE20(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v14 = a5;
  v15 = a6;
  if (!a2)
    goto LABEL_5;
  if (qword_254DE9370 != -1)
    dispatch_once(&qword_254DE9370, &unk_24D3A7778);
  if (byte_254DE9340 == 1)
  {
LABEL_5:
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = v15;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%08x [%s]:%d %@"), objc_msgSend(v14, "objectInstanceID"), a3, a4, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    sub_2158CDCE0(a1, v18, (uint64_t)&a9);
  }

}

void sub_2158CDF18(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  void *v14;

  v13 = a5;
  if (!a2)
    goto LABEL_5;
  if (qword_254DE9370 != -1)
    dispatch_once(&qword_254DE9370, &unk_24D3A7778);
  if (byte_254DE9340 == 1)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s : %d : %@"), a3, a4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDCE0(a1, v14, (uint64_t)&a9);

  }
}

void sub_2158CDFE0(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v13;
  void *v14;

  if (!a2)
    goto LABEL_5;
  if (qword_254DE9370 != -1)
    dispatch_once(&qword_254DE9370, &unk_24D3A7778);
  if (byte_254DE9340 == 1)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a5, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s : %d : %@"), a3, a4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    sub_2158CDCE0(a1, v14, (uint64_t)&a9);
  }
}

id sub_2158CE0B8()
{
  if (qword_254DE9368 != -1)
    dispatch_once(&qword_254DE9368, &unk_24D3A7758);
  return (id)qword_254DE9360;
}

void sub_2158CE0F8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sts.signpost", "GeneralSignposts");
  v1 = (void *)qword_254DE9360;
  qword_254DE9360 = (uint64_t)v0;

}

uint64_t sub_2158CE128()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    byte_254DE9340 = 1;
  return result;
}

void sub_2158CE524()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_254DE9378;
  qword_254DE9378 = v0;

}

uint64_t sub_2158CEF4C(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__postReaderTransactionEvent_prepOnly_);
}

uint64_t sub_2158CEFD8(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__postReaderSessionEvent_);
}

id sub_2158CEFF0(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "rfTechnology");
  objc_msgSend(v2, "setNFCTechnology:", 0);
  objc_msgSend(v2, "setFieldType:", 1);
  v3 = objc_msgSend(v1, "notificationType");
  switch(v3)
  {
    case 3:
      v6 = v1;
      objc_msgSend(v2, "setODARequired:", objc_msgSend(v6, "odaRequired"));
      v7 = objc_msgSend(v6, "terminalType");
      v8 = objc_msgSend(v6, "terminalSubType");
      if (v7 != 1)
      {
        if (v7 == 2)
        {
          if (v8 >= 8)
            v7 = 2;
          else
            v7 = qword_2158DB918[(char)v8];
        }
        else
        {
          v7 = 7;
        }
      }
      objc_msgSend(v2, "setTerminalType:", v7);
      objc_msgSend(v6, "tciArray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setTCIS:", v12);

      objc_msgSend(v6, "openLoopSchemeBitfield");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "setOpenLoopSchemeBitfield:", v13);
      v4 = v2;
      v5 = 2;
      goto LABEL_16;
    case 2:
      v9 = v1;
      objc_msgSend(v2, "setODARequired:", objc_msgSend(v9, "odaRequired"));
      v10 = objc_msgSend(v9, "terminalMode") - 1;
      if (v10 > 3)
        v11 = 0;
      else
        v11 = dword_2158DB960[v10];
      objc_msgSend(v2, "setTerminalMode:", v11);
      objc_msgSend(v2, "setTerminalType:", 4);
      objc_msgSend(v2, "setEcpVersion:", 1);

      break;
    case 1:
      objc_msgSend(v2, "setODARequired:", 0);
      objc_msgSend(v2, "setTerminalType:", 4);
      v4 = v2;
      v5 = 0;
LABEL_16:
      objc_msgSend(v4, "setEcpVersion:", v5);
      break;
  }

  return v2;
}

id sub_2158CF300(id a1, void *a2)
{
  id v3;
  const __CFAllocator *v4;
  SecTaskRef v5;
  uint64_t v6;
  uint64_t v7;
  __SecTask *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef v12;
  CFTypeID v13;
  BOOL v14;
  audit_token_t token;
  objc_super v17;
  CFErrorRef error;

  v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)STSEntitlementChecker;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      *((_DWORD *)a1 + 3) = objc_msgSend(v3, "processIdentifier");
      v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (v3)
        objc_msgSend(v3, "auditToken");
      else
        memset(&token, 0, sizeof(token));
      v5 = SecTaskCreateWithAuditToken(v4, &token);
      if (v5)
      {
        v8 = v5;
        v9 = CFSTR("com.apple.sts.xpcclientnotification.listener");
        error = 0;
        v12 = SecTaskCopyValueForEntitlement(v8, CFSTR("com.apple.sts.xpcclientnotification.listener"), &error);
        if (error)
        {
          sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSEntitlementChecker _copyValueOfEntitlement:secTask:]", 30, a1, CFSTR("Failed to get entitlements: %@"), v10, v11, (uint64_t)error);
          CFRelease(error);
        }
        if (v12)
        {
          v13 = CFGetTypeID(v12);
          v14 = v13 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v12) != 0;
          CFRelease(v12);
        }
        else
        {
          v14 = 0;
        }

        *((_BYTE *)a1 + 8) = v14;
        CFRelease(v8);
      }
      else
      {
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSEntitlementChecker initWithConnection:]", 84, a1, CFSTR("Cannot create SecTaskRef with XPC Connection: %@"), v6, v7, (uint64_t)v3);

        a1 = 0;
      }
    }
  }

  return a1;
}

void sub_2158CFE40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158CFF0C;
  block[3] = &unk_24D3A7160;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_2158CFF0C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_2158D1684(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_2158D2B6C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_24D3B37D0;
  v10[1] = CFSTR("Line");
  v10[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 204);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 9, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);

}

uint64_t sub_2158D2D14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2158D3B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2158D3B74(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2158D3B84(uint64_t a1)
{

}

void sub_2158D3B8C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2158D3C88(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
  {
    +[STSTapToProvisionAppletData fromOR:](STSTapToProvisionAppletData, "fromOR:", a2);
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_2158D3D94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  +[STSTapToProvisionResult fromOR:](STSTapToProvisionResult, "fromOR:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void sub_2158D4638(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v10 = v7;
  if (a3)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler startNFSessionWithCompletion:]_block_invoke", 42, v6, CFSTR("Failed to create Unified Access session! %@"), v8, v9, (uint64_t)v7);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler startNFSessionWithCompletion:]_block_invoke", 44, v6, CFSTR("Unified session created"), v8, v9, v11);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDelegate:");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id sub_2158D6A50(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "activeSTSCredential");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "activeSTSCredentials");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(a1, "activeSTSCredentials", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v11, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v3, "isEqual:", v12);

            if (v13)
            {
              v14 = v11;

              v4 = v14;
              goto LABEL_13;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t sub_2158D899C()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_2158D89A8()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_2158D89B4()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_2158D89C0()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
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

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x24BDAE000]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

