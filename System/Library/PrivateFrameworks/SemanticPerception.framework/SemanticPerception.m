Swift::Void __swiftcall SPPeriodicTaskScheduler.registerForPeriodicContextLogging()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  id v39;
  void *v40;
  char *v41;
  id v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  _QWORD *v47;
  id v48;
  void *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_245BE45DC();
  v53 = *(_QWORD *)(v0 - 8);
  v54 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v52 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v50 - v4;
  v6 = MEMORY[0x24BDAC7A8](v3);
  v51 = (char *)&v50 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v50 - v8;
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(v10, sel_sharedScheduler);
  v12 = (void *)sub_245BE45E8();
  aBlock[4] = sub_245BE383C;
  aBlock[5] = 0;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_245BE3D50;
  aBlock[3] = &block_descriptor;
  v13 = _Block_copy(aBlock);
  v14 = objc_msgSend(v11, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v12, 0, v13);
  _Block_release(v13);

  if (v14)
  {
    v15 = objc_msgSend(v10, sel_sharedScheduler);
    v16 = (void *)sub_245BE45E8();
    v17 = objc_msgSend(v15, sel_taskRequestForIdentifier_, v16);

    if (v17)
    {
      sub_245BE45D0();
      v18 = v17;
      v19 = sub_245BE45C4();
      v20 = sub_245BE4618();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v22 = (void *)swift_slowAlloc();
        aBlock[0] = v22;
        *(_DWORD *)v21 = 136315138;
        v52 = (char *)(v21 + 4);
        v23 = objc_msgSend(v18, sel_identifier);
        v24 = sub_245BE45F4();
        v26 = v25;

        v55 = sub_245BE3EA0(v24, v26, (uint64_t *)aBlock);
        sub_245BE4624();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245BE2000, v19, v20, "On-screen context refresh (%s) was already scheduled with dasd", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249543934](v22, -1, -1);
        MEMORY[0x249543934](v21, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v54);
    }
    else
    {
      v30 = objc_msgSend(v10, sel_sharedScheduler);
      v31 = objc_allocWithZone(MEMORY[0x24BE0B718]);
      v32 = (void *)sub_245BE45E8();
      v33 = objc_msgSend(v31, sel_initWithIdentifier_, v32);

      objc_msgSend(v33, sel_setPriority_, 2);
      objc_msgSend(v33, sel_setInterval_, 300.0);
      objc_msgSend(v33, sel_setMinDurationBetweenInstances_, 15.0);
      objc_msgSend(v33, sel_setRequiresProtectionClass_, 3);
      aBlock[0] = 0;
      LODWORD(v31) = objc_msgSend(v30, sel_submitTaskRequest_error_, v33, aBlock);

      if ((_DWORD)v31)
      {
        v34 = aBlock[0];
        v35 = v51;
        sub_245BE45D0();
        v36 = sub_245BE45C4();
        v37 = sub_245BE4618();
        if (os_log_type_enabled(v36, v37))
        {
          v38 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_245BE2000, v36, v37, "Scheduled on-screen context refresh with dasd", v38, 2u);
          MEMORY[0x249543934](v38, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v54);
      }
      else
      {
        v39 = aBlock[0];
        v40 = (void *)sub_245BE45B8();

        swift_willThrow();
        v41 = v52;
        sub_245BE45D0();
        v42 = v40;
        v43 = v40;
        v44 = sub_245BE45C4();
        v45 = sub_245BE460C();
        if (os_log_type_enabled(v44, v45))
        {
          v46 = (uint8_t *)swift_slowAlloc();
          v47 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v46 = 138412290;
          v48 = v40;
          v49 = (void *)_swift_stdlib_bridgeErrorToNSError();
          aBlock[0] = v49;
          sub_245BE4624();
          *v47 = v49;

          _os_log_impl(&dword_245BE2000, v44, v45, "Failed to register on-screen context refresh with dasd due to error: %@", v46, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_257514328);
          swift_arrayDestroy();
          MEMORY[0x249543934](v47, -1, -1);
          MEMORY[0x249543934](v46, -1, -1);

        }
        else
        {

        }
        (*(void (**)(char *, uint64_t))(v53 + 8))(v41, v54);
      }
    }
  }
  else
  {
    sub_245BE45D0();
    v27 = sub_245BE45C4();
    v28 = sub_245BE460C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_245BE2000, v27, v28, "Could not register on-screen context refresh with dasd", v29, 2u);
      MEMORY[0x249543934](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v53 + 8))(v5, v54);
  }
}

id sub_245BE383C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void (*v15)(char *, uint64_t);
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  int v31;
  uint8_t *v32;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  void *v36;
  _QWORD *v37;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  id v42[2];

  v42[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_245BE45DC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v39 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v39 - v10;
  sub_245BE45D0();
  v12 = sub_245BE45C4();
  v13 = sub_245BE4618();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_245BE2000, v12, v13, "Performing on-screen context refresh", v14, 2u);
    MEMORY[0x249543934](v14, -1, -1);
  }

  v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v11, v2);
  v16 = objc_msgSend((id)objc_opt_self(), sel_clientWithDefaultRequestType_, 10);
  v17 = objc_msgSend(v16, sel_newRequest);
  objc_msgSend(v17, sel_setIncludeStructuredExtractionResults_, 1);
  objc_msgSend(v17, sel_setIncludeRequestInResponse_, 1);
  objc_msgSend(v17, sel_setDebug_, 1);

  v18 = objc_msgSend((id)objc_opt_self(), sel_sharedScheduler);
  v19 = objc_allocWithZone(MEMORY[0x24BE0B718]);
  v20 = (void *)sub_245BE45E8();
  v21 = objc_msgSend(v19, sel_initWithIdentifier_, v20);

  objc_msgSend(v21, sel_setPriority_, 2);
  objc_msgSend(v21, sel_setInterval_, 300.0);
  objc_msgSend(v21, sel_setMinDurationBetweenInstances_, 15.0);
  objc_msgSend(v21, sel_setRequiresProtectionClass_, 3);
  v42[0] = 0;
  LODWORD(v20) = objc_msgSend(v18, sel_submitTaskRequest_error_, v21, v42);

  if ((_DWORD)v20)
  {
    v22 = v42[0];
    sub_245BE45D0();
    v23 = sub_245BE45C4();
    v24 = sub_245BE4618();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_245BE2000, v23, v24, "Scheduled on-screen context refresh with dasd", v25, 2u);
      MEMORY[0x249543934](v25, -1, -1);
    }

  }
  else
  {
    v26 = v42[0];
    v27 = (void *)sub_245BE45B8();

    swift_willThrow();
    sub_245BE45D0();
    v28 = v27;
    v29 = v27;
    v30 = sub_245BE45C4();
    v31 = sub_245BE460C();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v41 = v15;
      v34 = (_QWORD *)v33;
      v40 = v6;
      *(_DWORD *)v32 = 138412290;
      v35 = v27;
      v36 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v42[0] = v36;
      sub_245BE4624();
      *v34 = v36;

      _os_log_impl(&dword_245BE2000, v30, (os_log_type_t)v31, "Failed to register on-screen context refresh with dasd due to error: %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257514328);
      swift_arrayDestroy();
      v37 = v34;
      v15 = v41;
      MEMORY[0x249543934](v37, -1, -1);
      MEMORY[0x249543934](v32, -1, -1);

      v9 = v40;
    }
    else
    {

      v9 = v6;
    }
  }
  v15(v9, v2);
  return objc_msgSend(a1, sel_setTaskCompleted);
}

void sub_245BE3D50(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

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

Swift::Void __swiftcall SPPeriodicTaskScheduler.ping()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;

  v0 = sub_245BE45DC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245BE45D0();
  v4 = sub_245BE45C4();
  v5 = sub_245BE4618();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_245BE2000, v4, v5, "pong", v6, 2u);
    MEMORY[0x249543934](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_245BE3EA0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245BE3F70(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245BE4550((uint64_t)v12, *a3);
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
      sub_245BE4550((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_245BE3F70(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_245BE4630();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245BE4128(a5, a6);
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
  v8 = sub_245BE4648();
  if (!v8)
  {
    sub_245BE4654();
    __break(1u);
LABEL_17:
    result = sub_245BE4660();
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

uint64_t sub_245BE4128(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245BE41BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245BE4394(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245BE4394(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245BE41BC(uint64_t a1, unint64_t a2)
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
      v3 = sub_245BE4330(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245BE463C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245BE4654();
      __break(1u);
LABEL_10:
      v2 = sub_245BE4600();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245BE4660();
    __break(1u);
LABEL_14:
    result = sub_245BE4654();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245BE4330(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257514330);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245BE4394(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257514330);
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
  result = sub_245BE4660();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495438F8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SPPeriodicTaskScheduler()
{
  return &type metadata for SPPeriodicTaskScheduler;
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

uint64_t sub_245BE4550(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::Void __swiftcall SPContextManager.registerForPeriodicLogging()()
{
  SPPeriodicTaskScheduler.registerForPeriodicContextLogging()();
}

ValueMetadata *type metadata accessor for SPContextManager()
{
  return &type metadata for SPContextManager;
}

uint64_t sub_245BE45B8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_245BE45C4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245BE45D0()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t sub_245BE45DC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245BE45E8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245BE45F4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245BE4600()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245BE460C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245BE4618()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_245BE4624()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245BE4630()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245BE463C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245BE4648()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245BE4654()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245BE4660()
{
  return MEMORY[0x24BEE30B0]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

