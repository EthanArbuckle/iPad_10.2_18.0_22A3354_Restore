uint64_t sub_243917CD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  sqlite3 *v11;
  sqlite3 *v12;
  _QWORD v14[2];

  v2 = v1;
  v4 = sub_24391E1B0();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 16) = 0;
  sub_24391E150();
  v7 = sub_24391E168();
  v9 = v8;
  OUTLINED_FUNCTION_1((uint64_t)v6);
  v10 = v14[1];
  v11 = sub_243917DE0(v7, v9);
  if (v10)
  {
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1(a1);
  }
  else
  {
    v12 = v11;
    OUTLINED_FUNCTION_1(a1);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 16) = v12;
  }
  return v2;
}

sqlite3 *sub_243917DE0(uint64_t a1, uint64_t a2)
{
  sqlite3 **v4;
  sqlite3 **v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  sqlite3 *v10;
  uint64_t v11;
  char filename[8];
  uint64_t v14;

  v4 = (sqlite3 **)swift_slowAlloc();
  v5 = v4;
  *v4 = 0;
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_24391E2AC();
    v9 = *(_DWORD *)filename;
  }
  else
  {
    MEMORY[0x24BDAC7A8](v4);
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(_QWORD *)filename = a1;
      v14 = a2 & 0xFFFFFFFFFFFFFFLL;
      v9 = sqlite3_open_v2(filename, v5, v6, 0);
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v7 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v8 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v7 = sub_24391E2B8();
      }
      v9 = sub_24391DA2C(v7, v8, (_QWORD *(*)(uint64_t *__return_ptr))sub_243919590);
    }
  }
  v10 = *v5;
  if (*v5)
  {
    if (!v9)
    {
      MEMORY[0x2494FD0B8](v5, -1, -1);
      return v10;
    }
    sub_243918050(*v5);
    sub_243919224();
    swift_allocError();
    *(_DWORD *)v11 = v9;
  }
  else
  {
    sub_243919224();
    swift_allocError();
    *(_DWORD *)v11 = 0;
  }
  *(_BYTE *)(v11 + 4) = v10 == 0;
  swift_willThrow();
  MEMORY[0x2494FD0B8](v5, -1, -1);
  return v10;
}

void sub_243917FDC()
{
  uint64_t v0;
  sqlite3 *v1;

  v1 = *(sqlite3 **)(v0 + 16);
  if (v1)
  {
    sub_243918050(v1);
    *(_QWORD *)(v0 + 16) = 0;
  }
}

uint64_t sub_243917FFC()
{
  sub_243917FDC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DataStore()
{
  return objc_opt_self();
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_2439192EC(a1, &qword_2543CA8E8);
}

void sub_243918050(sqlite3 *a1)
{
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (sqlite3_close_v2(a1))
  {
    if (qword_2543CA898 != -1)
      swift_once();
    v1 = sub_24391E21C();
    __swift_project_value_buffer(v1, (uint64_t)qword_2543CAB40);
    oslog = sub_24391E204();
    v2 = sub_24391E27C();
    if (os_log_type_enabled(oslog, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v3 = 67240192;
      sub_24391E294();
      _os_log_impl(&dword_243916000, oslog, v2, "Close db connection failed with code %{public}d", v3, 8u);
      MEMORY[0x2494FD0B8](v3, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_243918174(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;

  v9 = swift_allocObject();
  *(_BYTE *)(v9 + 16) = a4;
  sub_24391C13C(a1, a2, a3, 1, 2, (uint64_t)sub_243919270, v9, v10, v13, v14, HIDWORD(v14));
  result = swift_release();
  if (!v4)
  {
    if (v16 == 255)
    {
      sub_243919224();
      OUTLINED_FUNCTION_2();
      *(_DWORD *)v12 = 2;
      *(_BYTE *)(v12 + 4) = 1;
      return swift_willThrow();
    }
    else
    {
      return v15;
    }
  }
  return result;
}

void sub_24391825C(sqlite3_stmt *a1@<X1>, char a2@<W2>, uint64_t a3@<X8>)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  const void *v12;
  uint64_t v13;

  switch(sqlite3_column_type(a1, 0))
  {
    case 1:
      if (!a2)
      {
        sqlite3_column_int64(a1, 0);
        v8 = sub_24391E2D0();
        goto LABEL_27;
      }
      if (a2 == 1)
      {
        *(_QWORD *)a3 = sqlite3_column_int64(a1, 0);
        *(_QWORD *)(a3 + 8) = 0;
        v7 = 1;
        break;
      }
      if (a2 != 4)
        goto LABEL_21;
      *(_QWORD *)a3 = sqlite3_column_int(a1, 0);
      *(_QWORD *)(a3 + 8) = 0;
      *(_BYTE *)(a3 + 16) = 0;
      return;
    case 2:
      if (!a2)
      {
        sqlite3_column_double(a1, 0);
        v8 = sub_24391E270();
        goto LABEL_27;
      }
      if (a2 == 2 || a2 == 5)
      {
        *(double *)a3 = sqlite3_column_double(a1, 0);
        *(_QWORD *)(a3 + 8) = 0;
        v7 = 4;
        break;
      }
      goto LABEL_21;
    case 3:
      if (a2)
        goto LABEL_21;
      if (sqlite3_column_bytes(a1, 0) >= 1 && sqlite3_column_text(a1, 0))
      {
        v8 = sub_24391E264();
LABEL_27:
        *(_QWORD *)a3 = v8;
        *(_QWORD *)(a3 + 8) = v9;
      }
      else
      {
        *(_OWORD *)a3 = xmmword_24391E6C0;
      }
      v7 = 2;
      break;
    case 4:
      if (a2 != 3)
        goto LABEL_21;
      v10 = sqlite3_column_bytes(a1, 0);
      if (v10 >= 1 && (v11 = v10, (v12 = sqlite3_column_blob(a1, 0)) != 0))
      {
        *(_QWORD *)a3 = MEMORY[0x2494FCC50](v12, v11);
        *(_QWORD *)(a3 + 8) = v13;
      }
      else
      {
        *(_OWORD *)a3 = xmmword_24391E6D0;
      }
      v7 = 3;
      break;
    default:
LABEL_21:
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      v7 = -1;
      break;
  }
  *(_BYTE *)(a3 + 16) = v7;
}

uint64_t sub_243918434@<X0>(char *zSql@<X0>, sqlite3 *db@<X1>, sqlite3_stmt **ppStmt@<X2>, const char **pzTail@<X3>, _DWORD *a5@<X8>)
{
  uint64_t result;

  result = sqlite3_prepare_v2(db, zSql, -1, ppStmt, pzTail);
  *a5 = result;
  return result;
}

uint64_t sub_243918478(uint64_t result)
{
  int v1;
  uint64_t v2;

  if ((_DWORD)result)
  {
    v1 = result;
    sub_243919224();
    OUTLINED_FUNCTION_2();
    *(_DWORD *)v2 = v1;
    *(_BYTE *)(v2 + 4) = 0;
    return swift_willThrow();
  }
  return result;
}

void sub_2439184C8(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_243918880@<X0>(char *a1@<X0>, sqlite3_stmt *a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X8>)
{
  _DWORD *v4;
  const char *v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  uint64_t result;

  v7 = a3 + 1;
  if (__OFADD__(a3, 1))
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = a4;
  if (v7 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v7 > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v6 = a2;
  v5 = a1;
  if (qword_2543CAA00 != -1)
LABEL_9:
    swift_once();
  result = sqlite3_bind_text(v6, v7, v5, -1, (void (__cdecl *)(void *))qword_2543CAA08);
  *v4 = result;
  return result;
}

void sub_243918930()
{
  qword_2543CAA08 = -1;
}

uint64_t sub_243918950()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_24391E24C();
  v2 = v1;
  if (v0 == sub_24391E24C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_24391E2DC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2439189D4()
{
  uint64_t *v0;

  return sub_243918B64(*v0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2439189F8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_24391E234();
  *a2 = 0;
  return result;
}

uint64_t sub_243918A70(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_24391E240();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_243918AEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_243918B10();
  *a1 = result;
  return result;
}

uint64_t sub_243918B10()
{
  uint64_t v0;

  sub_24391E24C();
  v0 = sub_24391E228();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_243918B44()
{
  uint64_t *v0;

  return sub_243918B64(*v0, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_243918B64(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_24391E24C();
  v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_243918B9C()
{
  return sub_243918BA4();
}

uint64_t sub_243918BA4()
{
  sub_24391E24C();
  sub_24391E258();
  return swift_bridgeObjectRelease();
}

uint64_t sub_243918BE4()
{
  return sub_243918BEC();
}

uint64_t sub_243918BEC()
{
  uint64_t v0;

  sub_24391E24C();
  sub_24391E318();
  sub_24391E258();
  v0 = sub_24391E330();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_243918C5C()
{
  return sub_243918950();
}

uint64_t sub_243918C68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24391E228();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_243918CAC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_243918CD4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_243918CD8()
{
  sub_243918D8C(&qword_2572D9208, (uint64_t)&unk_24391E838);
  sub_243918D8C(&qword_2572D9210, (uint64_t)&unk_24391E7D8);
  return sub_24391E2C4();
}

uint64_t sub_243918D44()
{
  return sub_243918D8C(&qword_2572D91F0, (uint64_t)&unk_24391E79C);
}

uint64_t sub_243918D68()
{
  return sub_243918D8C(&qword_2572D91F8, (uint64_t)&unk_24391E770);
}

uint64_t sub_243918D8C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    result = MEMORY[0x2494FD058](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_243918DCC()
{
  return sub_243918D8C(&qword_2572D9200, (uint64_t)&unk_24391E80C);
}

uint64_t sub_243918DF0@<X0>(char *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_243918880(a1, *(sqlite3_stmt **)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_243918E0C(uint64_t a1, uint64_t a2, sqlite3_stmt *a3, uint64_t a4)
{
  return sub_243919030(a1, a2 & 0xFFFFFFFFFFFFLL, BYTE6(a2), a3, a4);
}

uint64_t sub_243918E34(uint64_t a1, uint64_t a2, int a3, sqlite3_stmt *a4, uint64_t a5)
{
  uint64_t v7;
  char *v10;
  uint64_t result;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  LODWORD(v7) = a3;
  v10 = (char *)sub_24391E0F0();
  if (!v10)
  {
LABEL_4:
    v12 = __OFSUB__(a2, a1);
    v13 = a2 - a1;
    if (v12)
    {
      __break(1u);
    }
    else
    {
      v14 = sub_24391E0FC();
      if (v14 >= v13)
        v15 = v13;
      else
        v15 = v14;
      v7 = a5 + 1;
      if (!__OFADD__(a5, 1))
      {
        if (v7 >= (uint64_t)0xFFFFFFFF80000000)
        {
          if (v7 <= 0x7FFFFFFF)
          {
            if (v10)
              a5 = v15;
            else
              a5 = 0;
            if (a5 >= (uint64_t)0xFFFFFFFF80000000)
            {
              if (a5 <= 0x7FFFFFFF)
              {
                if (qword_2543CAA00 == -1)
                  return sqlite3_bind_blob(a4, v7, v10, a5, (void (__cdecl *)(void *))qword_2543CAA08);
LABEL_24:
                swift_once();
                return sqlite3_bind_blob(a4, v7, v10, a5, (void (__cdecl *)(void *))qword_2543CAA08);
              }
LABEL_23:
              __break(1u);
              goto LABEL_24;
            }
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_20;
  }
  result = sub_24391E108();
  if (!__OFSUB__(a1, result))
  {
    v10 += a1 - result;
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_243918F58(void *a1, int a2, uint64_t a3, sqlite3_stmt *a4, uint64_t a5)
{
  const void *v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = a5 + 1;
  if (__OFADD__(a5, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v8 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v8 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v5 = a1;
  if (a1)
    v7 = a3;
  else
    v7 = 0;
  if (v7 < (uint64_t)0xFFFFFFFF80000000)
    goto LABEL_14;
  if (v7 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v6 = a4;
  if (qword_2543CAA00 != -1)
LABEL_16:
    swift_once();
  return sqlite3_bind_blob(v6, v8, v5, v7, (void (__cdecl *)(void *))qword_2543CAA08);
}

uint64_t sub_243919030(uint64_t a1, uint64_t a2, uint64_t a3, sqlite3_stmt *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  result = sub_2439191EC(&v8, (int)&v14, a3, a4, a5, &v7, &v14);
  if (!v5)
    return v14;
  return result;
}

void sub_243919104(_DWORD *a1@<X8>)
{
  uint64_t v1;

  sub_24391DA7C(*(void (**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

uint64_t sub_24391911C(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3)
    return sub_243919140(result, a2);
  if (a3 == 2)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_243919140(uint64_t a1, unint64_t a2)
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

uint64_t sub_243919184(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3)
    return sub_2439191A8(result, a2);
  if (a3 == 2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2439191A8(uint64_t a1, unint64_t a2)
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

uint64_t sub_2439191EC@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, sqlite3_stmt *a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X6>, _DWORD *a7@<X8>)
{
  uint64_t v7;
  uint64_t result;

  result = sub_243918F58(a1, a2, a3, a4, a5);
  if (v7)
    *a6 = v7;
  else
    *a7 = result;
  return result;
}

unint64_t sub_243919224()
{
  unint64_t result;

  result = qword_2543CA890;
  if (!qword_2543CA890)
  {
    result = MEMORY[0x2494FD058](&unk_24391E908, &type metadata for DataStore.Error);
    atomic_store(result, (unint64_t *)&qword_2543CA890);
  }
  return result;
}

uint64_t sub_243919260()
{
  return swift_deallocObject();
}

void sub_243919270(sqlite3_stmt *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_24391825C(a1, *(_BYTE *)(v2 + 16), a2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2439192A0@<X0>(const char *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sqlite3_open_v2(a1, *(sqlite3 ***)(v2 + 16), *(_DWORD *)(v2 + 24), 0);
  *a2 = result;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_2439192EC(a1, &qword_2543CA8F0);
}

void sub_2439192EC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DataStore.Error(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DataStore.Error(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_243919394(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2439193B4(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 4) = v2;
  return result;
}

ValueMetadata *type metadata accessor for DataStore.Error()
{
  return &type metadata for DataStore.Error;
}

uint64_t destroy for DataStoreValue(uint64_t a1)
{
  return sub_243919184(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s18PegasusPersistence14DataStoreValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_24391911C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DataStoreValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_24391911C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_243919184(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DataStoreValue(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_243919184(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataStoreValue(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 4)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataStoreValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_243919570(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_243919578(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataStoreValue()
{
  return &type metadata for DataStoreValue;
}

void sub_243919590(_DWORD *a1@<X8>)
{
  sub_243919104(a1);
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  sqlite3_stmt *v4;

  return sub_243918E34(a1, a2, a3, v4, v3);
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_allocError();
}

uint64_t sub_2439195CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return PegasusPersistenceReader.codableForResource<A>(_:)(a1, a2, a5, a3, a6, a4);
}

uint64_t PegasusPersistenceReader.codableForResource<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  _QWORD v14[5];

  v12 = sub_24391E0C0();
  swift_allocObject();
  v14[3] = v12;
  v14[4] = &protocol witness table for JSONDecoder;
  v14[0] = sub_24391E0B4();
  (*(void (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 24))(a1, a2, v14, a4, a6, a3, a5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
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

uint64_t sub_2439196E4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return PegasusPersistenceReader.codableForResource<A>(_:decoder:)(a1, a2, a3, a6, a4, a7, a5);
}

uint64_t PegasusPersistenceReader.codableForResource<A>(_:decoder:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 8))(a1, a2, a4, a6);
  if (!v7)
  {
    v13 = result;
    v14 = v12;
    v17 = a7;
    v16 = a3[3];
    v15 = a3[4];
    __swift_project_boxed_opaque_existential_1(a3, v16);
    (*(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 8))(a5, v13, v14, a5, v17, v16, v15);
    return sub_2439191A8(v13, v14);
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

uint64_t sub_2439197F0()
{
  return sub_24391E0A8();
}

uint64_t dispatch thunk of PegasusPersistenceReader.dataForResource(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PegasusPersistenceReader.codableForResource<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of PegasusPersistenceReader.codableForResource<A>(_:decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t dispatch thunk of CustomDecoder.decode<A>(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t static PegasusKeyValueElement<>.read(fromPegasusKeyValueStore:at:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;

  v10 = a1[3];
  v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 104))(a2, a3, a4, a6, v10, v11);
}

uint64_t PegasusKeyValueElement<>.write(toPegasusKeyValueStore:at:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;

  v12 = a1[3];
  v13 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v12);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 112))(v7, a2, a3, a4, a7, v12, v13);
}

void static Int.read(fromPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_0(a1);
  OUTLINED_FUNCTION_5(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 24));
  OUTLINED_FUNCTION_9();
}

void Int.write(toPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_2_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 32));
  OUTLINED_FUNCTION_4();
}

void sub_2439199C4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char v4;

  static Int.read(fromPegasusKeyValueStore:at:)(a1);
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v4 & 1;
}

void sub_2439199F0(_QWORD *a1)
{
  Int.write(toPegasusKeyValueStore:at:)(a1);
}

void static Double.read(fromPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_0(a1);
  OUTLINED_FUNCTION_5(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 40));
  OUTLINED_FUNCTION_9();
}

uint64_t Double.write(toPegasusKeyValueStore:at:)(_QWORD *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v7;
  uint64_t v8;

  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, double))(v8 + 48))(a2, a3, v7, v8, a4);
}

void sub_243919AA4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char v4;

  static Double.read(fromPegasusKeyValueStore:at:)(a1);
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v4 & 1;
}

uint64_t sub_243919AD0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  double *v3;

  return Double.write(toPegasusKeyValueStore:at:)(a1, a2, a3, *v3);
}

uint64_t static Date.read(fromPegasusKeyValueStore:at:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 88))(a2, a3, v5, v6);
}

void Date.write(toPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_2_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 96));
  OUTLINED_FUNCTION_4();
}

void sub_243919B7C(_QWORD *a1)
{
  Date.write(toPegasusKeyValueStore:at:)(a1);
}

uint64_t static Bool.read(fromPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 72))(v2, v1, v3, v4);
}

void Bool.write(toPegasusKeyValueStore:at:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_3(a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 80))(a4, v5, v4, v6, v7);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_243919C1C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = static Bool.read(fromPegasusKeyValueStore:at:)(a1);
  *a2 = result;
  return result;
}

void sub_243919C40(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 *v3;

  Bool.write(toPegasusKeyValueStore:at:)(a1, a2, a3, *v3);
}

void static Data.read(fromPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_0(a1);
  OUTLINED_FUNCTION_5(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56));
  OUTLINED_FUNCTION_9();
}

void Data.write(toPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_1_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 64));
  OUTLINED_FUNCTION_8();
}

void sub_243919CA8(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  static Data.read(fromPegasusKeyValueStore:at:)(a1);
  *a2 = v3;
  a2[1] = v4;
}

void sub_243919CCC(_QWORD *a1)
{
  Data.write(toPegasusKeyValueStore:at:)(a1);
}

void static String.read(fromPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_0(a1);
  OUTLINED_FUNCTION_5(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_9();
}

void String.write(toPegasusKeyValueStore:at:)(_QWORD *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_1_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 16));
  OUTLINED_FUNCTION_8();
}

void sub_243919D34(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  static String.read(fromPegasusKeyValueStore:at:)(a1);
  *a2 = v3;
  a2[1] = v4;
}

void sub_243919D58(_QWORD *a1)
{
  String.write(toPegasusKeyValueStore:at:)(a1);
}

uint64_t dispatch thunk of static PegasusKeyValueElement.read(fromPegasusKeyValueStore:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of PegasusKeyValueElement.write(toPegasusKeyValueStore:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

_QWORD *OUTLINED_FUNCTION_0_0(_QWORD *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t OUTLINED_FUNCTION_1_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return a1(v2, v1, v4, v3, v5, v6);
}

uint64_t OUTLINED_FUNCTION_2_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return a1(v1, v3, v2, v4, v5);
}

_QWORD *OUTLINED_FUNCTION_3(_QWORD *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t OUTLINED_FUNCTION_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return a1(v2, v1, v3, v4);
}

_QWORD *OUTLINED_FUNCTION_7(_QWORD *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t sub_243919E94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v18 = a2;
  v3 = sub_24391E15C();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24391E1B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v17 - v12;
  v19 = a1;
  v20 = v18;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD798], v3);
  sub_24391A2D8();
  sub_24391E1A4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_24391E150();
  v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v14(v11, v7);
  v15 = sub_24391E1BC();
  v14(v13, v7);
  return v15;
}

uint64_t sub_24391A01C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  void (*v16)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v19 = a4;
  v20 = a1;
  v21 = a2;
  v5 = sub_24391E15C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24391E1B0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v22 = a3;
  v23 = v19;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCD798], v5);
  sub_24391A2D8();
  sub_24391E1A4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_24391E150();
  v16 = *(void (**)(char *, uint64_t))(v10 + 8);
  v16(v13, v9);
  sub_24391E1D4();
  return ((uint64_t (*)(char *, uint64_t))v16)(v15, v9);
}

uint64_t sub_24391A19C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC18PegasusPersistence22PegasusFilePersistence_baseFolder;
  v2 = sub_24391E1B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_24391A1EC()
{
  return type metadata accessor for PegasusFilePersistence();
}

uint64_t type metadata accessor for PegasusFilePersistence()
{
  uint64_t result;

  result = qword_2572D9248;
  if (!qword_2572D9248)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24391A22C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24391E1B0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_24391A298(uint64_t a1, uint64_t a2)
{
  return sub_243919E94(a1, a2);
}

uint64_t sub_24391A2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24391A01C(a1, a2, a3, a4);
}

unint64_t sub_24391A2D8()
{
  unint64_t result;

  result = qword_2543CA8E0;
  if (!qword_2543CA8E0)
  {
    result = MEMORY[0x2494FD058](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2543CA8E0);
  }
  return result;
}

uint64_t sub_24391A314()
{
  uint64_t v0;

  v0 = sub_24391E21C();
  __swift_allocate_value_buffer(v0, qword_2543CAB40);
  __swift_project_value_buffer(v0, (uint64_t)qword_2543CAB40);
  return sub_24391E210();
}

uint64_t sub_24391A38C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Logging()
{
  return objc_opt_self();
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

uint64_t PegasusPersistenceContext.location.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_0_1();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t PegasusPersistenceContext.init(location:fileManager:)@<X0>(uint64_t a1@<X0>, id a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v6 = OUTLINED_FUNCTION_0_1();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a3, a1, v6);
  if (!a2)
    a2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  result = type metadata accessor for PegasusPersistenceContext();
  *(_QWORD *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for PegasusPersistenceContext()
{
  uint64_t result;

  result = qword_2543CA8A0;
  if (!qword_2543CA8A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t PegasusPersistenceContext.localDirectory()@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t);
  char *v16;
  void (*v17)(char *, uint64_t);
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  uint64_t inited;
  void *v25;
  id v26;
  char *v27;
  uint64_t result;
  char v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t);
  char *v32;
  id v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  id v40[8];

  v40[7] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = sub_24391E138();
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v35 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v34 - v6;
  v7 = sub_24391E1B0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24391E15C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40[0] = (id)0x6C61636F6CLL;
  v40[1] = (id)0xE500000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDCD790], v11);
  sub_24391A2D8();
  sub_24391E1A4();
  v15 = *(void (**)(char *, uint64_t))(v12 + 8);
  v16 = a1;
  v15(v14, v11);
  swift_bridgeObjectRelease();
  sub_24391E150();
  sub_24391E198();
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v10, v7);
  v18 = *(void **)(v1 + *(int *)(type metadata accessor for PegasusPersistenceContext() + 20));
  v19 = v39;
  v20 = (void *)sub_24391E228();
  swift_bridgeObjectRelease();
  LOBYTE(v14) = objc_msgSend(v18, sel_fileExistsAtPath_, v20);

  if ((v14 & 1) == 0)
  {
    v21 = (void *)sub_24391E18C();
    v40[0] = 0;
    v22 = objc_msgSend(v18, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v21, 1, 0, v40);

    if (!v22)
    {
      v33 = v40[0];
      sub_24391E144();

      swift_willThrow();
      return ((uint64_t (*)(char *, uint64_t))v17)(v16, v7);
    }
    v23 = v40[0];
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_2543CA900);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24391EA70;
  v25 = (void *)*MEMORY[0x24BDBCC68];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC68];
  v26 = v25;
  sub_24391A8E0(inited);
  v27 = v38;
  sub_24391E174();
  if (v27)
  {
    v17(v16, v7);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v38 = v16;
    swift_bridgeObjectRelease();
    v29 = sub_24391E114();
    v30 = v37;
    v31 = *(uint64_t (**)(char *, uint64_t))(v36 + 8);
    result = v31(v19, v37);
    if (v29 != 2 && (v29 & 1) == 0)
    {
      v32 = v35;
      sub_24391E12C();
      sub_24391E120();
      sub_24391E180();
      return v31(v32, v30);
    }
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494FD04C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_24391A8E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = a1;
  if (!*(_QWORD *)(a1 + 16)
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_2543CA8F8),
        v2 = sub_24391E2A0(),
        v3 = v2,
        (v32 = *(_QWORD *)(v1 + 16)) == 0))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    return;
  }
  v4 = 0;
  v5 = v2 + 56;
  v30 = v1;
  v31 = v1 + 32;
  while (v4 < *(_QWORD *)(v1 + 16))
  {
    v6 = *(void **)(v31 + 8 * v4);
    sub_24391E24C();
    sub_24391E318();
    v7 = v6;
    sub_24391E258();
    v8 = sub_24391E330();
    swift_bridgeObjectRelease();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = v8 & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = sub_24391E24C();
      v16 = v15;
      if (v14 == sub_24391E24C() && v16 == v17)
      {
LABEL_21:
        swift_bridgeObjectRelease_n();
LABEL_22:

        goto LABEL_23;
      }
      v19 = sub_24391E2DC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        goto LABEL_22;
      v20 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v20;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v21 = sub_24391E24C();
        v23 = v22;
        if (v21 == sub_24391E24C() && v23 == v24)
          goto LABEL_21;
        v26 = sub_24391E2DC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
          goto LABEL_22;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v10) = v7;
    v27 = *(_QWORD *)(v3 + 16);
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_26;
    *(_QWORD *)(v3 + 16) = v29;
LABEL_23:
    ++v4;
    v1 = v30;
    if (v4 == v32)
      goto LABEL_24;
  }
  __break(1u);
LABEL_26:
  __break(1u);
}

uint64_t *initializeBufferWithCopyOfBuffer for PegasusPersistenceContext(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24391E1B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void destroy for PegasusPersistenceContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24391E1B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t initializeWithCopy for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = sub_24391E1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_24391E1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  return a1;
}

uint64_t initializeWithTake for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_24391E1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for PegasusPersistenceContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_24391E1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for PegasusPersistenceContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24391AD9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_0_1();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for PegasusPersistenceContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24391AE28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_0_1();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_24391AEA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24391E1B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_24391E1B0();
}

void sub_24391AF20()
{
  PegasusKeyValueStore.codable<A>(for:)();
}

void PegasusKeyValueStore.codable<A>(for:)()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_4_0();
  v24 = v0;
  v25 = v1;
  v23 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = sub_24391E288();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v23 - v17;
  v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v12, v10, v8, v4);
  if (v20 >> 60 == 15)
  {
    __swift_storeEnumTagSinglePayload(v14, 1, 1, v6);
  }
  else
  {
    v21 = v19;
    v22 = v20;
    sub_24391E0C0();
    swift_allocObject();
    sub_24391E0B4();
    sub_24391E0A8();
    sub_24391B098(v21, v22);
    swift_release();
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v6);
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v14, v18, v15);
    OUTLINED_FUNCTION_1_1();
  }
}

uint64_t sub_24391B098(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2439191A8(a1, a2);
  return a1;
}

uint64_t sub_24391B0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return PegasusKeyValueStore.setCodable<A>(_:for:)(a1, a2, a3, a6, a4, a7);
}

uint64_t PegasusKeyValueStore.setCodable<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  sub_24391E0E4();
  swift_allocObject();
  sub_24391E0D8();
  v11 = sub_24391E0CC();
  v13 = v12;
  result = swift_release();
  if (!v6)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 64))(v11, v13, a2, a3, a4, a6);
    return sub_2439191A8(v11, v13);
  }
  return result;
}

uint64_t sub_24391B1B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return PegasusKeyValueStore.subscript.getter(a1, a2, a5, a3, a6, a4);
}

uint64_t PegasusKeyValueStore.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13[5];

  v13[3] = a3;
  v13[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  OUTLINED_FUNCTION_7_0((uint64_t)boxed_opaque_existential_1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16));
  (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 8))(v13, a1, a2, a4, a6);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

void sub_24391B2A0()
{
  PegasusKeyValueStore.subscript.setter();
}

void PegasusKeyValueStore.subscript.setter()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[6];

  OUTLINED_FUNCTION_4_0();
  v24 = v1;
  v25 = v0;
  v23 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = sub_24391E288();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - v16;
  v18 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  v26 = v12;
  OUTLINED_FUNCTION_7_0((uint64_t)v17, v21);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 120))(v24, v10, v8, v4);
    OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v17, v6);
    v27[3] = v8;
    v27[4] = v4;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v27);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_1, v25, v8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v23 + 16))(v27, v24, v10, v6);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v26, v13);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  }
  OUTLINED_FUNCTION_1_1();
}

uint64_t (*sub_24391B46C(_QWORD *a1))()
{
  _QWORD *v2;
  uint64_t v3;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  PegasusKeyValueStore.subscript.modify();
  v2[4] = v3;
  return sub_24391B4F8;
}

void PegasusKeyValueStore.subscript.modify()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  v8 = malloc(0x58uLL);
  *v7 = v8;
  v8[5] = v0;
  v8[6] = v1;
  v8[3] = v3;
  v8[4] = v2;
  v8[1] = v5;
  v8[2] = v4;
  *v8 = v6;
  v9 = sub_24391E288();
  v8[7] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[8] = v10;
  v11 = *(_QWORD *)(v10 + 64);
  v8[9] = malloc(v11);
  v8[10] = malloc(v11);
  PegasusKeyValueStore.subscript.getter(v6, v5, v4, v3, v2, v0);
  OUTLINED_FUNCTION_1_1();
}

void sub_24391B5A0(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 72);
  v4 = *(void **)(*(_QWORD *)a1 + 80);
  if ((a2 & 1) != 0)
  {
    v5 = v2[7];
    v6 = v2[8];
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v3, v4, v5);
    swift_bridgeObjectRetain();
    PegasusKeyValueStore.subscript.setter();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    swift_bridgeObjectRetain();
    PegasusKeyValueStore.subscript.setter();
  }
  free(v4);
  free(v3);
  free(v2);
}

BOOL static PegasusKeyValueStoreError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PegasusKeyValueStoreError.hash(into:)()
{
  return sub_24391E324();
}

uint64_t PegasusKeyValueStoreError.hashValue.getter()
{
  sub_24391E318();
  sub_24391E324();
  return sub_24391E330();
}

uint64_t sub_24391B72C()
{
  sub_24391E318();
  sub_24391E324();
  return sub_24391E330();
}

unint64_t sub_24391B770()
{
  unint64_t result;

  result = qword_2572D9368[0];
  if (!qword_2572D9368[0])
  {
    result = MEMORY[0x2494FD058](&protocol conformance descriptor for PegasusKeyValueStoreError, &type metadata for PegasusKeyValueStoreError);
    atomic_store(result, qword_2572D9368);
  }
  return result;
}

uint64_t sub_24391B7AC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return PegasusKeyValueStore.subscript.getter(*a2, a2[1], *(uint64_t *)((char *)a2 + a3 - 32), *(uint64_t *)((char *)a2 + a3 - 24), *(uint64_t *)((char *)a2 + a3 - 16), *(uint64_t *)((char *)a2 + a3 - 8));
}

void sub_24391B7E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_24391E288();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - v4, a1);
  swift_bridgeObjectRetain();
  PegasusKeyValueStore.subscript.setter();
}

uint64_t sub_24391B8AC()
{
  return 32;
}

__n128 sub_24391B8B8(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t dispatch thunk of PegasusKeyValueStore.string(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setString(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.integer(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setInteger(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.double(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setDouble(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.data(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setData(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.BOOL(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setBool(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 80))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.date(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setDate(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.codable<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 104))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setCodable<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 112))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.deleteValue(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 128))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 136))();
}

uint64_t dispatch thunk of PegasusKeyValueStore.subscript.modify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 144))();
}

uint64_t dispatch thunk of PegasusKeyValueStoreFullAccess.close()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PegasusKeyValueStoreFullAccess.clear()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PegasusKeyValueStoreError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PegasusKeyValueStoreError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24391BB1C + 4 * byte_24391EAB5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24391BB50 + 4 * asc_24391EAB0[v4]))();
}

uint64_t sub_24391BB50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24391BB58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24391BB60);
  return result;
}

uint64_t sub_24391BB6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24391BB74);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24391BB78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24391BB80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24391BB8C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24391BB94(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PegasusKeyValueStoreError()
{
  return &type metadata for PegasusKeyValueStoreError;
}

uint64_t sub_24391BBAC(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t v3;
  unsigned __int8 v4;

  result = sub_24391D23C(a1, a2, 3u);
  if (v4 != 3)
  {
    if (v4 != 255)
      sub_24391C070(result, v3, v4);
    return 0;
  }
  return result;
}

void sub_24391BBE4()
{
  sub_24391D2BC();
}

uint64_t sub_24391BC08(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned __int8 v4;

  v2 = sub_24391D23C(a1, a2, 4u);
  if (v4 != 255)
  {
    if (!v4)
      return (_DWORD)v2 == 1;
    sub_24391C070(v2, v3, v4);
  }
  return 2;
}

void sub_24391BC44()
{
  sub_24391D2BC();
}

uint64_t sub_24391BC70(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t v3;
  unsigned __int8 v4;

  result = sub_24391D23C(a1, a2, 0);
  if (v4 != 255)
  {
    if (v4 == 2)
      return result;
    sub_24391C070(result, v3, v4);
  }
  return 0;
}

void sub_24391BCA8()
{
  sub_24391D2BC();
}

uint64_t sub_24391BCCC(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t v3;
  unsigned __int8 v4;

  result = sub_24391D23C(a1, a2, 1u);
  if (v4 != 1)
  {
    if (v4 != 255)
      sub_24391C070(result, v3, v4);
    return 0;
  }
  return result;
}

void sub_24391BD18()
{
  sub_24391D2BC();
}

uint64_t sub_24391BD40(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t v3;
  unsigned __int8 v4;

  result = sub_24391D23C(a1, a2, 2u);
  if (v4 != 255)
  {
    if (v4 == 4)
      return result;
    sub_24391C070(result, v3, v4);
  }
  return 0;
}

void sub_24391BD80()
{
  sub_24391D2BC();
}

uint64_t sub_24391BDAC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_24391D23C(a1, a2, 5u);
  if (v6 == 255)
    goto LABEL_5;
  if (v6 != 4)
  {
    sub_24391C070(v4, v5, v6);
LABEL_5:
    v7 = 1;
    goto LABEL_6;
  }
  sub_24391E1E0();
  v7 = 0;
LABEL_6:
  v8 = sub_24391E1F8();
  return __swift_storeEnumTagSinglePayload(a3, v7, 1, v8);
}

void sub_24391BE18()
{
  sub_24391E1EC();
  sub_24391D2BC();
}

uint64_t sub_24391BE7C(uint64_t a1, unint64_t a2)
{
  return sub_24391BC70(a1, a2);
}

void sub_24391BE9C()
{
  sub_24391BCA8();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24391BEB8(uint64_t a1, unint64_t a2)
{
  return sub_24391BCCC(a1, a2);
}

void sub_24391BEDC()
{
  sub_24391BD18();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24391BEF8(uint64_t a1, unint64_t a2)
{
  return sub_24391BD40(a1, a2);
}

void sub_24391BF1C()
{
  sub_24391BD80();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24391BF38(uint64_t a1, unint64_t a2)
{
  return sub_24391BBAC(a1, a2);
}

void sub_24391BF58()
{
  sub_24391BBE4();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24391BF74(uint64_t a1, unint64_t a2)
{
  return sub_24391BC08(a1, a2);
}

void sub_24391BF94()
{
  sub_24391BC44();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24391BFB0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24391BDAC(a1, a2, a3);
}

void sub_24391BFD0()
{
  sub_24391BE18();
  OUTLINED_FUNCTION_0_2();
}

void sub_24391BFEC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  v1 = malloc(0x28uLL);
  *v0 = v1;
  PegasusKeyValueStore.subscript.modify();
  v1[4] = v2;
  OUTLINED_FUNCTION_1_1();
}

void sub_24391C044(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_24391C070(uint64_t result, unint64_t a2, char a3)
{
  if (a3 != -1)
    return sub_243919184(result, a2, a3);
  return result;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t (*v0)(_QWORD, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(*(_QWORD *)(v2 - 136), v1);
}

void OUTLINED_FUNCTION_6()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_7_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t sub_24391C0FC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for LockedState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LockedState);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2494FD034](a1, v6, a5);
}

void sub_24391C13C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11)
{
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
  sqlite3 *v21;
  uint64_t v22;
  uint64_t v23;
  sqlite3_stmt **v24;
  const char **v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[7];
  _QWORD v33[3];

  OUTLINED_FUNCTION_7_1();
  v21 = *(sqlite3 **)(v11 + 16);
  if (v21)
  {
    v22 = v14;
    v23 = v13;
    v32[4] = v18;
    v32[5] = v15;
    v32[2] = v17;
    v32[3] = v19;
    v32[0] = v16;
    v32[1] = v20;
    v24 = (sqlite3_stmt **)OUTLINED_FUNCTION_8_0();
    *v24 = 0;
    v25 = (const char **)OUTLINED_FUNCTION_8_0();
    *v25 = 0;
    v26 = MEMORY[0x24BDAC7A8](v25);
    if ((v22 & 0x1000000000000000) != 0 || !(v22 & 0x2000000000000000 | v23 & 0x1000000000000000))
    {
      sub_24391E2AC();
    }
    else
    {
      v32[6] = v32;
      MEMORY[0x24BDAC7A8](v26);
      if ((v22 & 0x2000000000000000) != 0)
      {
        v33[0] = v23;
        v33[1] = v22 & 0xFFFFFFFFFFFFFFLL;
        v29 = sqlite3_prepare_v2(v21, (const char *)v33, -1, v24, v25);
      }
      else
      {
        if ((v23 & 0x1000000000000000) != 0)
        {
          v27 = (v22 & 0xFFFFFFFFFFFFFFFLL) + 32;
          v28 = v23 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          v27 = sub_24391E2B8();
        }
        v29 = sub_24391DA2C(v27, v28, (_QWORD *(*)(uint64_t *__return_ptr))sub_24391DAB0);
      }
      a11 = v29;
    }
    sub_243918478(a11);
    if (!v12)
    {
      if (*v24)
        OUTLINED_FUNCTION_1_2();
      sub_243919224();
      OUTLINED_FUNCTION_2();
      *(_DWORD *)v31 = 1;
      *(_BYTE *)(v31 + 4) = 1;
      OUTLINED_FUNCTION_12();
    }
    OUTLINED_FUNCTION_1_2();
  }
  sub_243919224();
  OUTLINED_FUNCTION_2();
  *(_DWORD *)v30 = 0;
  *(_BYTE *)(v30 + 4) = 1;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_24391C4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *__return_ptr, uint64_t, sqlite3_stmt *), uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  sqlite3 *v9;
  sqlite3_stmt **v12;
  const char **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  sqlite3_stmt *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void (*v29)(char *__return_ptr, uint64_t, sqlite3_stmt *);
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v39;
  void (*v40)(char *__return_ptr, uint64_t, sqlite3_stmt *);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  char zSql[8];
  uint64_t v46;
  unsigned int v47;

  v9 = *(sqlite3 **)(v7 + 16);
  if (v9)
  {
    v42 = a4;
    v43 = a3;
    v39 = a5;
    v40 = a6;
    v41 = a7;
    v12 = (sqlite3_stmt **)swift_slowAlloc();
    *v12 = 0;
    v13 = (const char **)swift_slowAlloc();
    *v13 = 0;
    v14 = MEMORY[0x24BDAC7A8](v13);
    if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
    {
      sub_24391E2AC();
    }
    else
    {
      v44 = &v39;
      MEMORY[0x24BDAC7A8](v14);
      if ((a2 & 0x2000000000000000) != 0)
      {
        *(_QWORD *)zSql = a1;
        v46 = a2 & 0xFFFFFFFFFFFFFFLL;
        v17 = sqlite3_prepare_v2(v9, zSql, -1, v12, v13);
      }
      else
      {
        if ((a1 & 0x1000000000000000) != 0)
        {
          v15 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          v16 = a1 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          v15 = sub_24391E2B8();
        }
        v17 = sub_24391DA2C(v15, v16, (_QWORD *(*)(uint64_t *__return_ptr))sub_24391DAB0);
      }
      v47 = v17;
    }
    sub_243918478(v47);
    if (v8)
      goto LABEL_12;
    v19 = *v12;
    if (!*v12)
    {
      sub_243919224();
      swift_allocError();
      *(_DWORD *)v34 = 1;
      *(_BYTE *)(v34 + 4) = 1;
      swift_willThrow();
LABEL_12:
      MEMORY[0x2494FD0B8](v13, -1, -1);
      MEMORY[0x2494FD0B8](v12, -1, -1);
      return v7;
    }
    MEMORY[0x2494FD0B8](v13, -1, -1);
    MEMORY[0x2494FD0B8](v12, -1, -1);
    v20 = *(_QWORD *)(v43 + 16);
    if (v20)
    {
      v21 = 0;
      v22 = (char *)(swift_bridgeObjectRetain() + 48);
      do
      {
        v23 = *((_QWORD *)v22 - 2);
        v24 = *((_QWORD *)v22 - 1);
        v25 = *v22;
        sub_24391911C(v23, v24, *v22);
        sub_2439184C8(v23, v24, v25);
        sub_243918478(v26);
        v22 += 24;
        ++v21;
        sub_243919184(v23, v24, v25);
      }
      while (v20 != v21);
      swift_bridgeObjectRelease();
    }
    v27 = sqlite3_step(v19);
    v7 = v41;
    v28 = v42;
    v29 = v40;
    if (v27 == 101)
    {
      if (v42 <= 0 && v39 > 0)
      {
LABEL_29:
        v7 = 1;
LABEL_39:
        sqlite3_finalize(v19);
        return v7;
      }
    }
    else
    {
      v30 = v27;
      if (v27 != 100)
      {
LABEL_31:
        sub_243919224();
        swift_allocError();
        *(_DWORD *)v35 = v30;
        *(_BYTE *)(v35 + 4) = 0;
LABEL_38:
        swift_willThrow();
        goto LABEL_39;
      }
      v31 = v39 - 2;
      if (v39 >= 2)
      {
        v32 = 0;
        do
        {
          if (v29)
            v29(zSql, v32 + 1, v19);
          else
            zSql[0] = 1;
          if (v31 == v32)
          {
            v7 = zSql[0];
            goto LABEL_39;
          }
          v33 = sqlite3_step(v19);
          ++v32;
        }
        while (v33 == 100);
        v30 = v33;
        if (v33 != 101)
          goto LABEL_31;
        if (v32 >= v28)
          goto LABEL_29;
      }
    }
    sub_243919224();
    swift_allocError();
    *(_DWORD *)v37 = 3;
    *(_BYTE *)(v37 + 4) = 1;
    goto LABEL_38;
  }
  sub_243919224();
  swift_allocError();
  *(_DWORD *)v18 = 0;
  *(_BYTE *)(v18 + 4) = 1;
  swift_willThrow();
  return v7;
}

void sub_24391C918(_QWORD *(*a1)(uint64_t *__return_ptr), uint64_t a2, os_unfair_lock_s *a3)
{
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;

  v4 = a3 + 4;
  v5 = a3 + 6;
  os_unfair_lock_lock(a3 + 6);
  sub_24391C980(v4, a1);
  os_unfair_lock_unlock(v5);
}

_QWORD *sub_24391C980(_QWORD *a1, _QWORD *(*a2)(uint64_t *__return_ptr))
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = a2(&v5);
  if (!v2)
  {
    result = (_QWORD *)swift_release();
    *a1 = v5;
  }
  return result;
}

uint64_t static PegasusKeyValueStoreFactory.store(at:requiresAuthentication:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v5 = OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6_0();
  v8 = v7 - v6;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v7 - v6, a1);
  v10 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1();
  result = sub_24391CDEC(v8);
  if (!v2)
  {
    a2[3] = v10;
    a2[4] = (uint64_t)&off_25140D748;
    *a2 = result;
  }
  return result;
}

uint64_t type metadata accessor for KeyValueStore()
{
  return objc_opt_self();
}

void static PegasusKeyValueStoreFactory.deviceInfoStore(context:name:requiresAuthentication:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(char *, uint64_t);
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  OUTLINED_FUNCTION_7_1();
  v26 = v2;
  v27 = v3;
  v25 = v4;
  v5 = sub_24391E15C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6_0();
  v9 = v8 - v7;
  v28 = OUTLINED_FUNCTION_0_1();
  v10 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_3_1();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v25 - v15;
  PegasusPersistenceContext.localDirectory()(v14);
  if (!v0)
  {
    v17 = 0x642E656369766564;
    if (v27)
      v17 = v26;
    v18 = 0xE900000000000062;
    if (v27)
      v18 = v27;
    v29 = v17;
    v30 = v18;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BDCD798], v5);
    sub_24391A2D8();
    swift_bridgeObjectRetain();
    sub_24391E1A4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
    swift_bridgeObjectRelease();
    v19 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20 = v14;
    v21 = v28;
    v19(v20, v28);
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v1, v16, v21);
    v22 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_4_1();
    v23 = sub_24391CDEC(v1);
    v24 = v25;
    v25[3] = v22;
    v24[4] = (uint64_t)&off_25140D748;
    *v24 = v23;
    v19(v16, v21);
  }
  OUTLINED_FUNCTION_0_3();
}

void static PegasusKeyValueStoreFactory.defaultStore(at:requiresAuthentication:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
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
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;

  OUTLINED_FUNCTION_7_1();
  v17 = v2;
  v3 = sub_24391E15C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6_0();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_0_1();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - v11;
  v18 = 0xD000000000000017;
  v19 = 0x800000024391FA80;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x24BDCD798], v3);
  sub_24391A2D8();
  sub_24391E1A4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v1, v12, v8);
  v13 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1();
  v14 = sub_24391CDEC(v1);
  if (!v0)
  {
    v15 = v17;
    v17[3] = v13;
    v15[4] = (uint64_t)&off_25140D748;
    *v15 = v14;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_24391CDEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v3 = v1;
  v5 = sub_24391E1B0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  type metadata accessor for DataStore();
  swift_allocObject();
  v9 = sub_243917CD0((uint64_t)v8);
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v10 = v9;
    sub_24391C4F0(0xD000000000000058, 0x800000024391FC10, MEMORY[0x24BEE4AF8], 0, 1, 0, 0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543CAAB0);
    v12 = swift_allocObject();
    *(_DWORD *)(v12 + 24) = 0;
    *(_QWORD *)(v12 + 16) = v10;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    *(_QWORD *)(v3 + 16) = v12;
  }
  return v3;
}

ValueMetadata *type metadata accessor for PegasusKeyValueStoreFactory()
{
  return &type metadata for PegasusKeyValueStoreFactory;
}

uint64_t sub_24391CF8C()
{
  uint64_t v0;

  sub_24391C918((_QWORD *(*)(uint64_t *__return_ptr))sub_24391D1BC, 0, *(os_unfair_lock_s **)(v0 + 16));
  swift_release();
  return v0;
}

void sub_24391CFE8()
{
  uint64_t v0;

  sub_24391C918((_QWORD *(*)(uint64_t *__return_ptr))sub_24391D1BC, 0, *(os_unfair_lock_s **)(v0 + 16));
}

uint64_t sub_24391D00C()
{
  sub_24391CF8C();
  return swift_deallocClassInstance();
}

_QWORD *initializeBufferWithCopyOfBuffer for KeyValueStore.State(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for KeyValueStore.State()
{
  return swift_release();
}

_QWORD *assignWithCopy for KeyValueStore.State(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for KeyValueStore.State(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyValueStore.State(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for KeyValueStore.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_24391D174(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_24391D18C(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for KeyValueStore.State()
{
  return &type metadata for KeyValueStore.State;
}

uint64_t sub_24391D1BC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  _BYTE *v4;

  if (*a1)
  {
    swift_retain();
    sub_243917FDC();
    result = swift_release();
    *a2 = 0;
  }
  else
  {
    sub_24391D9A4();
    swift_allocError();
    *v4 = 2;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24391D23C(uint64_t a1, unint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  uint64_t v11;

  v7 = *(os_unfair_lock_s **)(v3 + 16);
  v8 = v7 + 4;
  v9 = v7 + 6;
  os_unfair_lock_lock(v7 + 6);
  sub_24391D558(v8, a1, a2, a3, (uint64_t)&v11);
  os_unfair_lock_unlock(v9);
  return v11;
}

void sub_24391D2BC()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  char v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;

  OUTLINED_FUNCTION_7_1();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = *(os_unfair_lock_s **)(v0 + 16);
  v14 = v13 + 4;
  v15 = v13 + 6;
  os_unfair_lock_lock(v13 + 6);
  sub_24391D6A4(v14, v0, v4, v2, v6, v12, v10, v8);
  os_unfair_lock_unlock(v15);
  OUTLINED_FUNCTION_0_3();
}

void sub_24391D340()
{
  sub_24391CFE8();
}

void sub_24391D360()
{
  sub_24391D380();
}

void sub_24391D380()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;

  v1 = *(os_unfair_lock_s **)(v0 + 16);
  v2 = v1 + 4;
  v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_24391D46C(v2);
  os_unfair_lock_unlock(v3);
}

void sub_24391D3DC(uint64_t a1, unint64_t a2)
{
  sub_24391D3FC(a1, a2);
}

void sub_24391D3FC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;

  v5 = *(os_unfair_lock_s **)(v2 + 16);
  v6 = v5 + 4;
  v7 = v5 + 6;
  os_unfair_lock_lock(v5 + 6);
  sub_24391D858(v6, v2, a1, a2);
  os_unfair_lock_unlock(v7);
}

uint64_t sub_24391D46C(_QWORD *a1)
{
  uint64_t v1;
  _BYTE *v3;

  if (*a1)
  {
    swift_retain();
    sub_24391C4F0(0xD000000000000022, 0x800000024391FBE0, MEMORY[0x24BEE4AF8], 0, 1, 0, 0);
    if (!v1)
      sub_24391C4F0(0xD000000000000058, 0x800000024391FC10, MEMORY[0x24BEE4AF8], 0, 1, 0, 0);
    return swift_release();
  }
  else
  {
    sub_24391D9A4();
    swift_allocError();
    *v3 = 2;
    return swift_willThrow();
  }
}

_QWORD *sub_24391D558@<X0>(_QWORD *result@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, unsigned __int8 a4@<W4>, uint64_t a5@<X8>)
{
  void *v5;
  uint64_t v9;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  if (!*result)
    goto LABEL_7;
  v9 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v9 = a2 & 0xFFFFFFFFFFFFLL;
  if (!v9)
    goto LABEL_7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543CA8B0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24391EC60;
  *(_QWORD *)(inited + 32) = a4 + 1;
  *(_QWORD *)(inited + 40) = 0;
  *(_BYTE *)(inited + 48) = 0;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 64) = a3;
  *(_BYTE *)(inited + 72) = 2;
  swift_retain();
  swift_bridgeObjectRetain();
  v12 = sub_243918174(0xD00000000000003ALL, 0x800000024391FBA0, inited, a4);
  if (v5)
  {

    swift_release();
    swift_setDeallocating();
    result = (_QWORD *)sub_24391D9E0();
LABEL_7:
    *(_QWORD *)a5 = 0;
    *(_QWORD *)(a5 + 8) = 0;
    *(_BYTE *)(a5 + 16) = -1;
    return result;
  }
  v15 = v12;
  v16 = v13;
  v17 = v14;
  swift_release();
  swift_setDeallocating();
  result = (_QWORD *)sub_24391D9E0();
  *(_QWORD *)a5 = v15;
  *(_QWORD *)(a5 + 8) = v16;
  *(_BYTE *)(a5 + 16) = v17;
  return result;
}

uint64_t sub_24391D6A4(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned __int8 a5, uint64_t a6, unint64_t a7, char a8)
{
  uint64_t v10;
  uint64_t inited;
  uint64_t v16;
  char *v18;
  char v19;

  if (*a1)
  {
    v10 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0)
      v10 = a3 & 0xFFFFFFFFFFFFLL;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543CA8B0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24391EC70;
      *(_QWORD *)(inited + 32) = a3;
      *(_QWORD *)(inited + 40) = a4;
      *(_BYTE *)(inited + 48) = 2;
      v16 = a5 + 1;
      *(_QWORD *)(inited + 56) = v16;
      *(_QWORD *)(inited + 64) = 0;
      *(_BYTE *)(inited + 72) = 0;
      *(_QWORD *)(inited + 80) = a6;
      *(_QWORD *)(inited + 88) = a7;
      *(_BYTE *)(inited + 96) = a8;
      *(_QWORD *)(inited + 104) = v16;
      *(_QWORD *)(inited + 112) = 0;
      *(_BYTE *)(inited + 120) = 0;
      *(_QWORD *)(inited + 128) = a6;
      *(_QWORD *)(inited + 136) = a7;
      *(_BYTE *)(inited + 144) = a8;
      sub_24391911C(a6, a7, a8);
      sub_24391911C(a6, a7, a8);
      swift_retain();
      swift_bridgeObjectRetain();
      sub_24391C4F0(0xD00000000000006FLL, 0x800000024391FB30, inited, 0, 1, 0, 0);
      swift_setDeallocating();
      sub_24391D9E0();
      return swift_release();
    }
    sub_24391D9A4();
    swift_allocError();
    v19 = 1;
  }
  else
  {
    sub_24391D9A4();
    swift_allocError();
    v19 = 2;
  }
  *v18 = v19;
  return swift_willThrow();
}

uint64_t sub_24391D858(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t inited;
  char *v9;
  char v10;

  if (*a1)
  {
    v6 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0)
      v6 = a3 & 0xFFFFFFFFFFFFLL;
    if (v6)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543CA8B0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24391EA70;
      *(_QWORD *)(inited + 32) = a3;
      *(_QWORD *)(inited + 40) = a4;
      *(_BYTE *)(inited + 48) = 2;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_24391C4F0(0xD000000000000027, 0x800000024391FB00, inited, 0, 1, 0, 0);
      swift_setDeallocating();
      sub_24391D9E0();
      return swift_release();
    }
    sub_24391D9A4();
    swift_allocError();
    v10 = 1;
  }
  else
  {
    sub_24391D9A4();
    swift_allocError();
    v10 = 2;
  }
  *v9 = v10;
  return swift_willThrow();
}

unint64_t sub_24391D9A4()
{
  unint64_t result;

  result = qword_2572D93F0;
  if (!qword_2572D93F0)
  {
    result = MEMORY[0x2494FD058](&protocol conformance descriptor for PegasusKeyValueStoreError, &type metadata for PegasusKeyValueStoreError);
    atomic_store(result, (unint64_t *)&qword_2572D93F0);
  }
  return result;
}

uint64_t sub_24391D9E0()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_24391DA10@<X0>(char *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_243918434(a1, *(sqlite3 **)(v2 + 16), *(sqlite3_stmt ***)(v2 + 24), *(const char ***)(v2 + 32), a2);
}

_QWORD *sub_24391DA2C(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr))
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;

  if (a1)
  {
    result = a3(&v5);
    if (!v3)
      return (_QWORD *)v5;
  }
  else
  {
    result = ((_QWORD *(*)(uint64_t *__return_ptr, _QWORD, _QWORD))a3)((uint64_t *)((char *)&v5 + 4), 0, 0);
    if (!v3)
      return (_QWORD *)HIDWORD(v5);
  }
  return result;
}

void sub_24391DA7C(void (*a1)(uint64_t *__return_ptr)@<X2>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  a1(&v4);
  if (!v2)
    *a2 = v4;
  OUTLINED_FUNCTION_9_0();
}

void sub_24391DAB0(_DWORD *a1@<X8>)
{
  sub_24391DAC4(a1);
}

void sub_24391DAC4(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v4);
  if (!v2)
    *a1 = v4;
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_24391DAFC@<X0>(char *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_24391DA10(a1, a2);
}

void OUTLINED_FUNCTION_1_2()
{
  JUMPOUT(0x2494FD0B8);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;
  unint64_t v1;
  char v2;

  return sub_243919184(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return type metadata accessor for KeyValueStore();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_willThrow();
}

BOOL static PegasusPersistenceControllerError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PegasusPersistenceControllerError.hash(into:)()
{
  return sub_24391E324();
}

uint64_t PegasusPersistenceControllerError.hashValue.getter()
{
  sub_24391E318();
  sub_24391E324();
  return sub_24391E330();
}

uint64_t static PegasusPersistenceControllerFactory.create(with:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v4 = sub_24391E1B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = type metadata accessor for PegasusFilePersistence();
  v9 = swift_allocObject();
  result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9 + OBJC_IVAR____TtC18PegasusPersistence22PegasusFilePersistence_baseFolder, v7, v4);
  a2[3] = v8;
  a2[4] = (uint64_t)&off_25140D518;
  *a2 = v9;
  return result;
}

unint64_t sub_24391DD14()
{
  unint64_t result;

  result = qword_2572D93F8;
  if (!qword_2572D93F8)
  {
    result = MEMORY[0x2494FD058](&protocol conformance descriptor for PegasusPersistenceControllerError, &type metadata for PegasusPersistenceControllerError);
    atomic_store(result, (unint64_t *)&qword_2572D93F8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PegasusPersistenceControllerError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24391DD9C + 4 * byte_24391ECF5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24391DDD0 + 4 * byte_24391ECF0[v4]))();
}

uint64_t sub_24391DDD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24391DDD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24391DDE0);
  return result;
}

uint64_t sub_24391DDEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24391DDF4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24391DDF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24391DE00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PegasusPersistenceControllerError()
{
  return &type metadata for PegasusPersistenceControllerError;
}

ValueMetadata *type metadata accessor for PegasusPersistenceControllerFactory()
{
  return &type metadata for PegasusPersistenceControllerFactory;
}

uint64_t sub_24391DE2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return PegasusPersistenceWriter.persistCodable<A>(_:name:)(a1, a2, a3, a6, a4, a7, a5);
}

uint64_t PegasusPersistenceWriter.persistCodable<A>(_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  _QWORD v16[5];

  v14 = sub_24391E0E4();
  swift_allocObject();
  v16[3] = v14;
  v16[4] = &protocol witness table for JSONEncoder;
  v16[0] = sub_24391E0D8();
  (*(void (**)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 24))(a1, v16, a2, a3, a5, a7, a4, a6);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
}

uint64_t sub_24391DF24(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PegasusPersistenceWriter.persistCodable<A>(_:encoder:name:)(a1, a2, a3, a4, a7, a5, a8, a6);
}

uint64_t PegasusPersistenceWriter.persistCodable<A>(_:encoder:name:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v13 = a2[3];
  v14 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v13);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8))(a1, a6, a8, v13, v14);
  if (!v8)
  {
    v17 = result;
    v18 = v16;
    (*(void (**)(void))(a7 + 8))();
    return sub_2439191A8(v17, v18);
  }
  return result;
}

uint64_t sub_24391E028()
{
  return sub_24391E0CC();
}

uint64_t dispatch thunk of PegasusPersistenceWriter.persistData(_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of PegasusPersistenceWriter.persistCodable<A>(_:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t dispatch thunk of PegasusPersistenceWriter.persistCodable<A>(_:encoder:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

uint64_t dispatch thunk of CustomEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_24391E0A8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_24391E0B4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_24391E0C0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_24391E0CC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_24391E0D8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_24391E0E4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_24391E0F0()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_24391E0FC()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_24391E108()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_24391E114()
{
  return MEMORY[0x24BDCC790]();
}

uint64_t sub_24391E120()
{
  return MEMORY[0x24BDCC7A0]();
}

uint64_t sub_24391E12C()
{
  return MEMORY[0x24BDCC808]();
}

uint64_t sub_24391E138()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_24391E144()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24391E150()
{
  return MEMORY[0x24BDCD730]();
}

uint64_t sub_24391E15C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_24391E168()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_24391E174()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_24391E180()
{
  return MEMORY[0x24BDCD8A0]();
}

uint64_t sub_24391E18C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_24391E198()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_24391E1A4()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_24391E1B0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24391E1BC()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_24391E1C8()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_24391E1D4()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_24391E1E0()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_24391E1EC()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_24391E1F8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24391E204()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24391E210()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24391E21C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24391E228()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24391E234()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_24391E240()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_24391E24C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24391E258()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24391E264()
{
  return MEMORY[0x24BEE0BF0]();
}

uint64_t sub_24391E270()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_24391E27C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24391E288()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24391E294()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24391E2A0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24391E2AC()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_24391E2B8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24391E2C4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_24391E2D0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24391E2DC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24391E2E8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24391E2F4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24391E300()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24391E30C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24391E318()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24391E324()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24391E330()
{
  return MEMORY[0x24BEE4328]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

