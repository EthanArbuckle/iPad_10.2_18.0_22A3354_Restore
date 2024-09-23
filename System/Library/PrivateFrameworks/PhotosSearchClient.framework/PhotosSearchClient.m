uint64_t sub_2440882B4()
{
  uint64_t v0;

  v0 = sub_244089834();
  __swift_allocate_value_buffer(v0, qword_25733A558);
  __swift_project_value_buffer(v0, (uint64_t)qword_25733A558);
  return sub_244089828();
}

uint64_t PhotosSearchClientWorker.doWork(context:durationThreshold:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(double *)(v2 + 104) = a2;
  *(_QWORD *)(v2 + 96) = a1;
  v3 = sub_2440898B8();
  *(_QWORD *)(v2 + 112) = v3;
  *(_QWORD *)(v2 + 120) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 128) = swift_task_alloc();
  *(_QWORD *)(v2 + 136) = swift_task_alloc();
  v4 = sub_2440898D0();
  *(_QWORD *)(v2 + 144) = v4;
  *(_QWORD *)(v2 + 152) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 160) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2440883D4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[2];

  if ((sub_244089864() & 1) != 0)
  {
    if (qword_25733A550 != -1)
      swift_once();
    v1 = *(void **)(v0 + 96);
    v2 = sub_244089834();
    __swift_project_value_buffer(v2, (uint64_t)qword_25733A558);
    v3 = v1;
    v4 = sub_24408981C();
    v5 = sub_244089870();
    v6 = os_log_type_enabled(v4, v5);
    v7 = *(void **)(v0 + 96);
    if (v6)
    {
      v8 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      v33[0] = v31;
      *(_DWORD *)v8 = 136315394;
      v9 = sub_244089804();
      *(_QWORD *)(v0 + 80) = sub_244089094(v9, v10, v33);
      sub_244089888();
      swift_bridgeObjectRelease();

      *(_WORD *)(v8 + 12) = 2080;
      v11 = sub_244089810();
      *(_QWORD *)(v0 + 88) = sub_244089094(v11, v12, v33);
      sub_244089888();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_244087000, v4, v5, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249507BF4](v31, -1, -1);
      MEMORY[0x249507BF4](v8, -1, -1);
    }
    else
    {

    }
    sub_244089858();
    sub_2440896D4(&qword_25733A540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], MEMORY[0x24BEE6848]);
    swift_allocError();
    sub_244089840();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else if ((sub_244089864() & 1) != 0)
  {
    if (qword_25733A550 != -1)
      swift_once();
    v13 = *(void **)(v0 + 96);
    v14 = sub_244089834();
    __swift_project_value_buffer(v14, (uint64_t)qword_25733A558);
    v15 = v13;
    v16 = sub_24408981C();
    v17 = sub_244089870();
    v18 = os_log_type_enabled(v16, v17);
    v19 = *(void **)(v0 + 96);
    if (v18)
    {
      v20 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      v33[0] = v32;
      *(_DWORD *)v20 = 136315650;
      v21 = sub_244089804();
      *(_QWORD *)(v0 + 56) = sub_244089094(v21, v22, v33);
      sub_244089888();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 12) = 2080;
      v23 = sub_244089810();
      *(_QWORD *)(v0 + 64) = sub_244089094(v23, v24, v33);
      sub_244089888();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 22) = 2048;
      *(_QWORD *)(v0 + 72) = 0;
      sub_244089888();
      _os_log_impl(&dword_244087000, v16, v17, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x249507BF4](v32, -1, -1);
      MEMORY[0x249507BF4](v20, -1, -1);
    }
    else
    {

    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    *(_QWORD *)(v0 + 168) = 0;
    v27 = *(_QWORD *)(v0 + 120);
    v26 = *(_QWORD *)(v0 + 128);
    v28 = *(_QWORD *)(v0 + 112);
    sub_2440898C4();
    *(_OWORD *)(v0 + 40) = xmmword_244089AC0;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_2440896D4(&qword_25733A530, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_244089900();
    sub_2440896D4(&qword_25733A538, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_2440898DC();
    v29 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    *(_QWORD *)(v0 + 176) = v29;
    v29(v26, v28);
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v30;
    *v30 = v0;
    v30[1] = sub_244088954;
    return sub_24408990C();
  }
}

uint64_t sub_244088954()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 176))(*(_QWORD *)(v2 + 136), *(_QWORD *)(v2 + 112));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 152);
    v3 = *(_QWORD *)(v2 + 160);
    v5 = *(_QWORD *)(v2 + 144);
    (*(void (**)(_QWORD, _QWORD))(v2 + 176))(*(_QWORD *)(v2 + 136), *(_QWORD *)(v2 + 112));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_2440889F4()
{
  uint64_t v0;
  double v1;
  double v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  _QWORD *v21;
  uint64_t v22;

  v1 = *(double *)(v0 + 104);
  v2 = *(double *)(v0 + 168) + 0.25;
  if (v2 >= v1 || (sub_244089864() & 1) != 0)
  {
    if (qword_25733A550 != -1)
      swift_once();
    v3 = *(void **)(v0 + 96);
    v4 = sub_244089834();
    __swift_project_value_buffer(v4, (uint64_t)qword_25733A558);
    v5 = v3;
    v6 = sub_24408981C();
    v7 = sub_244089870();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(void **)(v0 + 96);
    if (v8)
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v22 = v11;
      *(_DWORD *)v10 = 136315650;
      v12 = sub_244089804();
      *(_QWORD *)(v0 + 56) = sub_244089094(v12, v13, &v22);
      sub_244089888();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 12) = 2080;
      v14 = sub_244089810();
      *(_QWORD *)(v0 + 64) = sub_244089094(v14, v15, &v22);
      sub_244089888();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 22) = 2048;
      *(double *)(v0 + 72) = v2;
      sub_244089888();
      _os_log_impl(&dword_244087000, v6, v7, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x249507BF4](v11, -1, -1);
      MEMORY[0x249507BF4](v10, -1, -1);
    }
    else
    {

    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(BOOL))(v0 + 8))(v2 >= v1);
  }
  else
  {
    *(double *)(v0 + 168) = v2;
    v18 = *(_QWORD *)(v0 + 120);
    v17 = *(_QWORD *)(v0 + 128);
    v19 = *(_QWORD *)(v0 + 112);
    sub_2440898C4();
    *(_OWORD *)(v0 + 40) = xmmword_244089AC0;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_2440896D4(&qword_25733A530, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_244089900();
    sub_2440896D4(&qword_25733A538, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_2440898DC();
    v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    *(_QWORD *)(v0 + 176) = v20;
    v20(v17, v19);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v21;
    *v21 = v0;
    v21[1] = sub_244088954;
    return sub_24408990C();
  }
}

uint64_t sub_244088D74()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  if (qword_25733A550 != -1)
    swift_once();
  v1 = sub_244089834();
  __swift_project_value_buffer(v1, (uint64_t)qword_25733A558);
  v2 = sub_24408981C();
  v3 = sub_24408987C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_244087000, v2, v3, "Task interruped while sleeping.", v4, 2u);
    MEMORY[0x249507BF4](v4, -1, -1);
  }
  MEMORY[0x249507B94](*(_QWORD *)(v0 + 192));

  v5 = *(_QWORD *)(v0 + 168);
  if (qword_25733A550 != -1)
    swift_once();
  v6 = *(void **)(v0 + 96);
  __swift_project_value_buffer(v1, (uint64_t)qword_25733A558);
  v7 = v6;
  v8 = sub_24408981C();
  v9 = sub_244089870();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 96);
  if (v10)
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v19 = v13;
    *(_DWORD *)v12 = 136315650;
    v14 = sub_244089804();
    *(_QWORD *)(v0 + 56) = sub_244089094(v14, v15, &v19);
    sub_244089888();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 2080;
    v16 = sub_244089810();
    *(_QWORD *)(v0 + 64) = sub_244089094(v16, v17, &v19);
    sub_244089888();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 22) = 2048;
    *(_QWORD *)(v0 + 72) = v5;
    sub_244089888();
    _os_log_impl(&dword_244087000, v8, v9, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x249507BF4](v13, -1, -1);
    MEMORY[0x249507BF4](v12, -1, -1);
  }
  else
  {

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_244089094(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_244089164(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244089744((uint64_t)v12, *a3);
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
      sub_244089744((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_244089164(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_244089894();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24408931C(a5, a6);
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
  v8 = sub_2440898AC();
  if (!v8)
  {
    sub_2440898E8();
    __break(1u);
LABEL_17:
    result = sub_2440898F4();
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

uint64_t sub_24408931C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2440893B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_244089588(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_244089588(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2440893B0(uint64_t a1, unint64_t a2)
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
      v3 = sub_244089524(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2440898A0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2440898E8();
      __break(1u);
LABEL_10:
      v2 = sub_24408984C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2440898F4();
    __break(1u);
LABEL_14:
    result = sub_2440898E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_244089524(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25733A548);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_244089588(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25733A548);
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
  result = sub_2440898F4();
  __break(1u);
  return result;
}

uint64_t sub_2440896D4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249507BB8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosSearchClientWorker()
{
  return &type metadata for PhotosSearchClientWorker;
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

uint64_t sub_244089744(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249507BAC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t sub_244089804()
{
  return MEMORY[0x24BE5F6D8]();
}

uint64_t sub_244089810()
{
  return MEMORY[0x24BE5F6E0]();
}

uint64_t sub_24408981C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244089828()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_244089834()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244089840()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_24408984C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244089858()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_244089864()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_244089870()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24408987C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244089888()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244089894()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2440898A0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2440898AC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2440898B8()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_2440898C4()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_2440898D0()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_2440898DC()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2440898E8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2440898F4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244089900()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_24408990C()
{
  return MEMORY[0x24BEE7118]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

