uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_CollabEmbeddingMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E47060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_CollabEmbeddingMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E47110(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_247E471B0()
{
  unint64_t v0;
  unint64_t v1;

  sub_247E81DBC();
  if (v0 <= 0x3F)
  {
    sub_247E47260(319, (unint64_t *)&qword_25445AA60, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_247E47260(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_247E82560();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_247E81DBC();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizer(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizer(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *initializeWithTake for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizer(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizer(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizer()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E47544(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_247E81DBC();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizer()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_247E475CC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_247E81DBC();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_247E47640()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81DBC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Embedding_StringSub(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_247E81DBC();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Embedding_StringSub(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_StringSub(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

_QWORD *assignWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_StringSub(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for Com_Apple_News_Algorithms_Proto_Embedding_StringSub(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for Com_Apple_News_Algorithms_Proto_Embedding_StringSub(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_StringSub()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E479C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_StringSub()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E47A4C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_247E47AC0()
{
  return sub_247E4AF48();
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Embedding_CollabTokenEmbedding(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v45;
  uint64_t v46;
  _QWORD *__dst;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t *, uint64_t *, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247E81DBC();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706298);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v49 = v13;
      v16 = v11[1];
      *v10 = *v11;
      v10[1] = v16;
      v17 = *(int *)(v12 + 20);
      v18 = (char *)v10 + v17;
      v19 = (char *)v11 + v17;
      swift_bridgeObjectRetain();
      v8((uint64_t *)v18, (uint64_t *)v19, v7);
      v20 = *(int *)(v12 + 24);
      v21 = (char *)v10 + v20;
      v50 = v8;
      v22 = (char *)v11 + v20;
      v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
      v24 = *(_QWORD *)(v23 - 8);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
      {
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
        memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
        v26 = v49;
        v8 = v50;
      }
      else
      {
        v48 = v24;
        *v21 = *v22;
        v50((uint64_t *)&v21[*(int *)(v23 + 20)], (uint64_t *)&v22[*(int *)(v23 + 20)], v7);
        v27 = *(int *)(v23 + 24);
        __dst = &v21[v27];
        v28 = &v22[v27];
        v29 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
        v46 = *(_QWORD *)(v29 - 8);
        if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v46 + 48))(v28, 1, v29))
        {
          v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
          memcpy(__dst, v28, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
          v31 = v21;
          v8 = v50;
        }
        else
        {
          *(_BYTE *)__dst = *(_BYTE *)v28;
          v32 = v28[2];
          __dst[1] = v28[1];
          __dst[2] = v32;
          v33 = *(int *)(v29 + 24);
          v45 = (char *)__dst + v33;
          v34 = (char *)v28 + v33;
          swift_bridgeObjectRetain();
          v35 = v34;
          v8 = v50;
          v50((uint64_t *)v45, (uint64_t *)v35, v7);
          (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v46 + 56))(__dst, 0, 1, v29);
          v31 = v21;
        }
        v26 = v49;
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v31, 0, 1, v23);
      }
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v10, 0, 1, v12);
    }
    v36 = *(int *)(a3 + 24);
    v37 = (uint64_t *)((char *)a1 + v36);
    v38 = (uint64_t *)((char *)a2 + v36);
    v39 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List(0);
    v40 = *(_QWORD *)(v39 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
    {
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_257704A58);
      memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    }
    else
    {
      v42 = *v38;
      v43 = v38[1];
      sub_247DBFCE0(*v38, v43);
      *v37 = v42;
      v37[1] = v43;
      v8((_QWORD *)((char *)v37 + *(int *)(v39 + 20)), (uint64_t *)((char *)v38 + *(int *)(v39 + 20)), v7);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
    }
  }
  return a1;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Embedding_CollabTokenEmbedding(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  void (*v14)(uint64_t, uint64_t);

  v4 = sub_247E81DBC();
  v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v14(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
  {
    swift_bridgeObjectRelease();
    v14(v5 + *(int *)(v6 + 20), v4);
    v7 = v5 + *(int *)(v6 + 24);
    v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
    {
      v14(v7 + *(int *)(v8 + 20), v4);
      v9 = v7 + *(int *)(v8 + 24);
      v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10))
      {
        swift_bridgeObjectRelease();
        v14(v9 + *(int *)(v10 + 24), v4);
      }
    }
  }
  v11 = a1 + *(int *)(a2 + 24);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v11, 1, v12);
  if (!(_DWORD)result)
  {
    sub_247DBCA8C(*(_QWORD *)v11, *(_QWORD *)(v11 + 8));
    return ((uint64_t (*)(uint64_t, uint64_t))v14)(v11 + *(int *)(v12 + 20), v4);
  }
  return result;
}

uint64_t initializeWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_CollabTokenEmbedding(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  _BYTE *v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;

  v6 = sub_247E81DBC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706298);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v47 = v12;
    v48 = a3;
    v14 = v10[1];
    *v9 = *v10;
    v9[1] = v14;
    v15 = *(int *)(v11 + 20);
    v16 = (char *)v9 + v15;
    v17 = (char *)v10 + v15;
    swift_bridgeObjectRetain();
    v7((uint64_t)v16, (uint64_t)v17, v6);
    v18 = *(int *)(v11 + 24);
    v19 = (char *)v9 + v18;
    v20 = v7;
    v21 = (char *)v10 + v18;
    v22 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
    v23 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
      memcpy(v19, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
      v7 = v20;
    }
    else
    {
      v45 = v23;
      v46 = v20;
      *v19 = *v21;
      v20((uint64_t)&v19[*(int *)(v22 + 20)], (uint64_t)&v21[*(int *)(v22 + 20)], v6);
      v25 = *(int *)(v22 + 24);
      v26 = &v19[v25];
      v27 = &v21[v25];
      v28 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
      v44 = *(_QWORD *)(v28 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v44 + 48))(v27, 1, v28))
      {
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
        memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
        v7 = v46;
      }
      else
      {
        *(_BYTE *)v26 = *(_BYTE *)v27;
        v30 = v27[2];
        v26[1] = v27[1];
        v26[2] = v30;
        v31 = *(int *)(v28 + 24);
        v43 = (char *)v26 + v31;
        v32 = (char *)v27 + v31;
        swift_bridgeObjectRetain();
        v33 = v32;
        v7 = v46;
        v46((uint64_t)v43, (uint64_t)v33, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v26, 0, 1, v28);
      }
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v19, 0, 1, v22);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v9, 0, 1, v11);
    a3 = v48;
  }
  v34 = *(int *)(a3 + 24);
  v35 = (_QWORD *)(a1 + v34);
  v36 = (uint64_t *)(a2 + v34);
  v37 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List(0);
  v38 = *(_QWORD *)(v37 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
  {
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_257704A58);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
  }
  else
  {
    v40 = *v36;
    v41 = v36[1];
    sub_247DBFCE0(*v36, v41);
    *v35 = v40;
    v35[1] = v41;
    v7((uint64_t)v35 + *(int *)(v37 + 20), (uint64_t)v36 + *(int *)(v37 + 20), v6);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
  }
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_CollabTokenEmbedding(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  void *v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(_BYTE *, uint64_t, uint64_t);
  int v36;
  int v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t *, uint64_t, uint64_t);
  int v56;
  int v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t, uint64_t);
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  void (*v77)(uint64_t, _BYTE *, uint64_t);
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *__dst;
  char *__dsta;
  void (*v85)(char *, char *, uint64_t);
  void (*v86)(char *, char *, uint64_t);
  void (*v87)(uint64_t, uint64_t, uint64_t);
  void (*v88)(uint64_t, uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;

  v6 = sub_247E81DBC();
  v89 = *(_QWORD *)(v6 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 24);
  v7(a1, a2, v6);
  v90 = a3;
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      *v9 = *v10;
      v9[1] = v10[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v7((uint64_t)v9 + *(int *)(v11 + 20), (uint64_t)v10 + *(int *)(v11 + 20), v6);
      v30 = *(int *)(v11 + 24);
      v31 = (char *)v9 + v30;
      v32 = (char *)v10 + v30;
      v33 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
      v34 = *(_QWORD *)(v33 - 8);
      v35 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v34 + 48);
      v36 = v35(v31, 1, v33);
      v37 = v35(v32, 1, v33);
      if (v36)
      {
        if (!v37)
        {
          *v31 = *v32;
          v86 = *(void (**)(char *, char *, uint64_t))(v89 + 16);
          v88 = v7;
          v86(&v31[*(int *)(v33 + 20)], &v32[*(int *)(v33 + 20)], v6);
          v38 = *(int *)(v33 + 24);
          v39 = &v31[v38];
          v40 = &v32[v38];
          v41 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
          v42 = *(_QWORD *)(v41 - 8);
          if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
          {
            v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
            memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
          }
          else
          {
            *(_BYTE *)v39 = *(_BYTE *)v40;
            v39[1] = v40[1];
            v39[2] = v40[2];
            v78 = *(int *)(v41 + 24);
            __dsta = (char *)v39 + v78;
            v79 = (char *)v40 + v78;
            swift_bridgeObjectRetain();
            v86(__dsta, v79, v6);
            (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
          }
          v7 = v88;
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
          goto LABEL_9;
        }
      }
      else
      {
        if (!v37)
        {
          *v31 = *v32;
          v7((uint64_t)&v31[*(int *)(v33 + 20)], (uint64_t)&v32[*(int *)(v33 + 20)], v6);
          v66 = *(int *)(v33 + 24);
          v67 = (uint64_t)&v31[v66];
          v68 = &v32[v66];
          v69 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
          v70 = *(_QWORD *)(v69 - 8);
          v71 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
          v72 = v71(v67, 1, v69);
          v73 = v71((uint64_t)v68, 1, v69);
          if (v72)
          {
            if (!v73)
            {
              *(_BYTE *)v67 = *v68;
              *(_QWORD *)(v67 + 8) = *((_QWORD *)v68 + 1);
              *(_QWORD *)(v67 + 16) = *((_QWORD *)v68 + 2);
              v74 = *(int *)(v69 + 24);
              v75 = v67 + v74;
              v76 = &v68[v74];
              v77 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v89 + 16);
              swift_bridgeObjectRetain();
              v77(v75, v76, v6);
              (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v70 + 56))(v67, 0, 1, v69);
              goto LABEL_9;
            }
          }
          else
          {
            if (!v73)
            {
              *(_BYTE *)v67 = *v68;
              *(_QWORD *)(v67 + 8) = *((_QWORD *)v68 + 1);
              *(_QWORD *)(v67 + 16) = *((_QWORD *)v68 + 2);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              v7(v67 + *(int *)(v69 + 24), (uint64_t)&v68[*(int *)(v69 + 24)], v6);
              goto LABEL_9;
            }
            sub_247E3F750(v67, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec);
          }
          v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706288) - 8) + 64);
          v27 = (void *)v67;
          v28 = v68;
LABEL_8:
          memcpy(v27, v28, v26);
LABEL_9:
          v29 = v90;
          goto LABEL_22;
        }
        sub_247E3F750((uint64_t)v31, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec);
      }
      v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706280) - 8) + 64);
      v27 = v31;
      v28 = v32;
      goto LABEL_8;
    }
    sub_247E3F750((uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken);
LABEL_7:
    v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706298) - 8) + 64);
    v27 = v9;
    v28 = v10;
    goto LABEL_8;
  }
  if (v15)
    goto LABEL_7;
  v87 = v7;
  *v9 = *v10;
  v9[1] = v10[1];
  v16 = *(int *)(v11 + 20);
  v17 = (char *)v9 + v16;
  v18 = (char *)v10 + v16;
  v19 = *(void (**)(char *, char *, uint64_t))(v89 + 16);
  swift_bridgeObjectRetain();
  v85 = v19;
  v19(v17, v18, v6);
  v20 = *(int *)(v11 + 24);
  v21 = (char *)v9 + v20;
  v22 = (char *)v10 + v20;
  v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    v82 = v24;
    *v21 = *v22;
    v85(&v21[*(int *)(v23 + 20)], &v22[*(int *)(v23 + 20)], v6);
    v44 = *(int *)(v23 + 24);
    __dst = &v21[v44];
    v45 = &v22[v44];
    v46 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
    v81 = *(_QWORD *)(v46 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v81 + 48))(v45, 1, v46))
    {
      v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
      memcpy(__dst, v45, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    }
    else
    {
      *(_BYTE *)__dst = *(_BYTE *)v45;
      __dst[1] = v45[1];
      __dst[2] = v45[2];
      v48 = *(int *)(v46 + 24);
      v80 = (char *)__dst + v48;
      v49 = (char *)v45 + v48;
      swift_bridgeObjectRetain();
      v85(v80, v49, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v81 + 56))(__dst, 0, 1, v46);
    }
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v82 + 56))(v21, 0, 1, v23);
  }
  v7 = v87;
  v29 = v90;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_22:
  v50 = *(int *)(v29 + 24);
  v51 = (uint64_t *)(a1 + v50);
  v52 = (uint64_t *)(a2 + v50);
  v53 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List(0);
  v54 = *(_QWORD *)(v53 - 8);
  v55 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v54 + 48);
  v56 = v55(v51, 1, v53);
  v57 = v55(v52, 1, v53);
  if (!v56)
  {
    if (!v57)
    {
      v62 = *v52;
      v63 = v52[1];
      sub_247DBFCE0(*v52, v63);
      v64 = *v51;
      v65 = v51[1];
      *v51 = v62;
      v51[1] = v63;
      sub_247DBCA8C(v64, v65);
      v7((uint64_t)v51 + *(int *)(v53 + 20), (uint64_t)v52 + *(int *)(v53 + 20), v6);
      return a1;
    }
    sub_247E3F750((uint64_t)v51, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List);
    goto LABEL_27;
  }
  if (v57)
  {
LABEL_27:
    v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_257704A58);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
    return a1;
  }
  v58 = *v52;
  v59 = v52[1];
  sub_247DBFCE0(*v52, v59);
  *v51 = v58;
  v51[1] = v59;
  (*(void (**)(char *, char *, uint64_t))(v89 + 16))((char *)v51 + *(int *)(v53 + 20), (char *)v52 + *(int *)(v53 + 20), v6);
  (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
  return a1;
}

uint64_t initializeWithTake for Com_Apple_News_Algorithms_Proto_Embedding_CollabTokenEmbedding(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  _BYTE *v29;
  uint64_t v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  _BYTE *__src;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);

  v6 = sub_247E81DBC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (_OWORD *)(a1 + v8);
  v10 = (_OWORD *)(a2 + v8);
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706298);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v41 = a3;
    *v9 = *v10;
    v7((uint64_t)v9 + *(int *)(v11 + 20), (uint64_t)v10 + *(int *)(v11 + 20), v6);
    v14 = *(int *)(v11 + 24);
    v42 = v7;
    v15 = (char *)v9 + v14;
    v16 = (char *)v10 + v14;
    v17 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      a3 = v41;
      v7 = v42;
    }
    else
    {
      v39 = v18;
      *v15 = *v16;
      v42((uint64_t)&v15[*(int *)(v17 + 20)], (uint64_t)&v16[*(int *)(v17 + 20)], v6);
      v20 = *(int *)(v17 + 24);
      v40 = v15;
      v21 = &v15[v20];
      v22 = &v16[v20];
      v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
      v37 = *(_QWORD *)(v23 - 8);
      __src = v22;
      v24 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v37 + 48))(v22, 1, v23);
      v25 = v17;
      if (v24)
      {
        v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
        memcpy(v21, __src, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
        v7 = v42;
      }
      else
      {
        *v21 = *__src;
        *(_OWORD *)(v21 + 8) = *(_OWORD *)(__src + 8);
        v27 = *(int *)(v23 + 24);
        v28 = &v21[v27];
        v29 = v21;
        v7 = v42;
        v42((uint64_t)v28, (uint64_t)&__src[v27], v6);
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v29, 0, 1, v23);
      }
      a3 = v41;
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v25);
    }
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v30 = *(int *)(a3 + 24);
  v31 = (_OWORD *)(a1 + v30);
  v32 = (_OWORD *)(a2 + v30);
  v33 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List(0);
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_257704A58);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    *v31 = *v32;
    v7((uint64_t)v31 + *(int *)(v33 + 20), (uint64_t)v32 + *(int *)(v33 + 20), v6);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Embedding_CollabTokenEmbedding(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(_BYTE *, uint64_t, uint64_t);
  int v33;
  int v34;
  uint64_t v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t *, uint64_t, uint64_t);
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t);
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  _BYTE *__dst;
  void (*v70)(char *, char *, uint64_t);
  void (*v71)(_BYTE *, _BYTE *, uint64_t);
  void (*v72)(uint64_t, uint64_t, uint64_t);
  void (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;

  v6 = sub_247E81DBC();
  v74 = *(_QWORD *)(v6 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 40);
  v7(a1, a2, v6);
  v75 = a3;
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      v26 = v10[1];
      *v9 = *v10;
      v9[1] = v26;
      swift_bridgeObjectRelease();
      v7((uint64_t)v9 + *(int *)(v11 + 20), (uint64_t)v10 + *(int *)(v11 + 20), v6);
      v27 = *(int *)(v11 + 24);
      v28 = (char *)v9 + v27;
      v29 = (char *)v10 + v27;
      v30 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
      v31 = *(_QWORD *)(v30 - 8);
      v32 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v31 + 48);
      v33 = v32(v28, 1, v30);
      v34 = v32(v29, 1, v30);
      if (v33)
      {
        if (!v34)
        {
          *v28 = *v29;
          v71 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v74 + 32);
          v73 = v7;
          v71(&v28[*(int *)(v30 + 20)], &v29[*(int *)(v30 + 20)], v6);
          v35 = *(int *)(v30 + 24);
          v36 = &v28[v35];
          v37 = &v29[v35];
          v38 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
          v39 = *(_QWORD *)(v38 - 8);
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
          {
            v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
            memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
          }
          else
          {
            *v36 = *v37;
            *(_OWORD *)(v36 + 8) = *(_OWORD *)(v37 + 8);
            v71(&v36[*(int *)(v38 + 24)], &v37[*(int *)(v38 + 24)], v6);
            (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
          }
          v7 = v73;
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
          goto LABEL_9;
        }
      }
      else
      {
        if (!v34)
        {
          *v28 = *v29;
          v7((uint64_t)&v28[*(int *)(v30 + 20)], (uint64_t)&v29[*(int *)(v30 + 20)], v6);
          v57 = *(int *)(v30 + 24);
          v58 = (uint64_t)&v28[v57];
          v59 = &v29[v57];
          v60 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
          v61 = *(_QWORD *)(v60 - 8);
          v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
          v63 = v62(v58, 1, v60);
          v64 = v62((uint64_t)v59, 1, v60);
          if (v63)
          {
            if (!v64)
            {
              *(_BYTE *)v58 = *v59;
              *(_OWORD *)(v58 + 8) = *(_OWORD *)(v59 + 8);
              (*(void (**)(uint64_t, _BYTE *, uint64_t))(v74 + 32))(v58 + *(int *)(v60 + 24), &v59[*(int *)(v60 + 24)], v6);
              (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v61 + 56))(v58, 0, 1, v60);
              goto LABEL_9;
            }
          }
          else
          {
            if (!v64)
            {
              *(_BYTE *)v58 = *v59;
              v65 = *((_QWORD *)v59 + 2);
              *(_QWORD *)(v58 + 8) = *((_QWORD *)v59 + 1);
              *(_QWORD *)(v58 + 16) = v65;
              swift_bridgeObjectRelease();
              v7(v58 + *(int *)(v60 + 24), (uint64_t)&v59[*(int *)(v60 + 24)], v6);
              goto LABEL_9;
            }
            sub_247E3F750(v58, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec);
          }
          v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706288) - 8) + 64);
          v24 = (void *)v58;
          v25 = v59;
LABEL_8:
          memcpy(v24, v25, v23);
LABEL_9:
          v22 = v75;
          goto LABEL_22;
        }
        sub_247E3F750((uint64_t)v28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec);
      }
      v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706280) - 8) + 64);
      v24 = v28;
      v25 = v29;
      goto LABEL_8;
    }
    sub_247E3F750((uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken);
LABEL_7:
    v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706298) - 8) + 64);
    v24 = v9;
    v25 = v10;
    goto LABEL_8;
  }
  if (v15)
    goto LABEL_7;
  *(_OWORD *)v9 = *(_OWORD *)v10;
  v70 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
  v72 = v7;
  v70((char *)v9 + *(int *)(v11 + 20), (char *)v10 + *(int *)(v11 + 20), v6);
  v16 = *(int *)(v11 + 24);
  v17 = (char *)v9 + v16;
  v18 = (char *)v10 + v16;
  v19 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    v7 = v72;
    v22 = v75;
  }
  else
  {
    v67 = v20;
    *v17 = *v18;
    v70(&v17[*(int *)(v19 + 20)], &v18[*(int *)(v19 + 20)], v6);
    v41 = *(int *)(v19 + 24);
    v68 = v17;
    __dst = &v17[v41];
    v42 = &v18[v41];
    v43 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
    v66 = *(_QWORD *)(v43 - 8);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v66 + 48))(v42, 1, v43))
    {
      v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
      memcpy(__dst, v42, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    }
    else
    {
      *__dst = *v42;
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(v42 + 8);
      v70(&__dst[*(int *)(v43 + 24)], &v42[*(int *)(v43 + 24)], v6);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v66 + 56))(__dst, 0, 1, v43);
    }
    v22 = v75;
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v67 + 56))(v68, 0, 1, v19);
    v7 = v72;
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_22:
  v45 = *(int *)(v22 + 24);
  v46 = (uint64_t *)(a1 + v45);
  v47 = (uint64_t *)(a2 + v45);
  v48 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List(0);
  v49 = *(_QWORD *)(v48 - 8);
  v50 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v49 + 48);
  v51 = v50(v46, 1, v48);
  v52 = v50(v47, 1, v48);
  if (!v51)
  {
    if (!v52)
    {
      v55 = *v46;
      v56 = v46[1];
      *(_OWORD *)v46 = *(_OWORD *)v47;
      sub_247DBCA8C(v55, v56);
      v7((uint64_t)v46 + *(int *)(v48 + 20), (uint64_t)v47 + *(int *)(v48 + 20), v6);
      return a1;
    }
    sub_247E3F750((uint64_t)v46, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List);
    goto LABEL_27;
  }
  if (v52)
  {
LABEL_27:
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_257704A58);
    memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    return a1;
  }
  *(_OWORD *)v46 = *(_OWORD *)v47;
  (*(void (**)(char *, char *, uint64_t))(v74 + 32))((char *)v46 + *(int *)(v48 + 20), (char *)v47 + *(int *)(v48 + 20), v6);
  (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_CollabTokenEmbedding()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E4923C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_247E81DBC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706298);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257704A58);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_CollabTokenEmbedding()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E492E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_247E81DBC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706298);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257704A58);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_247E49390()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_247E81DBC();
  if (v0 <= 0x3F)
  {
    sub_247E47260(319, &qword_257706668, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken);
    if (v1 <= 0x3F)
    {
      sub_247E47260(319, qword_257706670, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Float16List);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v30;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_247E81DBC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      *v14 = *v15;
      v12(&v14[*(int *)(v16 + 20)], &v15[*(int *)(v16 + 20)], v11);
      v20 = *(int *)(v16 + 24);
      v21 = &v14[v20];
      v22 = &v15[v20];
      v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
      v24 = *(_QWORD *)(v23 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
      {
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
        memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      }
      else
      {
        *(_BYTE *)v21 = *(_BYTE *)v22;
        v26 = v22[2];
        v21[1] = v22[1];
        v21[2] = v26;
        v27 = *(int *)(v23 + 24);
        v30 = (char *)v21 + v27;
        v28 = (char *)v22 + v27;
        swift_bridgeObjectRetain();
        v12(v30, v28, v11);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      }
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_247E81DBC();
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v11(v4, v5);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    v11(v6 + *(int *)(v7 + 20), v5);
    v9 = v6 + *(int *)(v7 + 24);
    v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10);
    if (!(_DWORD)result)
    {
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(uint64_t, uint64_t))v11)(v9 + *(int *)(v10 + 24), v5);
    }
  }
  return result;
}

_QWORD *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v28;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_247E81DBC();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v13 = *v14;
    v11(&v13[*(int *)(v15 + 20)], &v14[*(int *)(v15 + 20)], v10);
    v18 = *(int *)(v15 + 24);
    v19 = &v13[v18];
    v20 = &v14[v18];
    v21 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      *(_BYTE *)v19 = *(_BYTE *)v20;
      v24 = v20[2];
      v19[1] = v20[1];
      v19[2] = v24;
      v25 = *(int *)(v21 + 24);
      v28 = (char *)v19 + v25;
      v26 = (char *)v20 + v25;
      swift_bridgeObjectRetain();
      v11(v28, v26, v10);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

_QWORD *assignWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_BYTE *, uint64_t, uint64_t);
  int v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  void *v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  void (*v40)(uint64_t, _BYTE *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v44;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v8) = v17(v13, 1, v15);
  v18 = v17(v14, 1, v15);
  if (!(_DWORD)v8)
  {
    if (!v18)
    {
      *v13 = *v14;
      v11(&v13[*(int *)(v15 + 20)], &v14[*(int *)(v15 + 20)], v9);
      v29 = *(int *)(v15 + 24);
      v30 = (uint64_t)&v13[v29];
      v31 = &v14[v29];
      v32 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
      v33 = *(_QWORD *)(v32 - 8);
      v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
      v35 = v34(v30, 1, v32);
      v36 = v34((uint64_t)v31, 1, v32);
      if (v35)
      {
        if (!v36)
        {
          *(_BYTE *)v30 = *v31;
          *(_QWORD *)(v30 + 8) = *((_QWORD *)v31 + 1);
          *(_QWORD *)(v30 + 16) = *((_QWORD *)v31 + 2);
          v37 = *(int *)(v32 + 24);
          v38 = v30 + v37;
          v39 = &v31[v37];
          v40 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v10 + 16);
          swift_bridgeObjectRetain();
          v40(v38, v39, v9);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
          return a1;
        }
      }
      else
      {
        if (!v36)
        {
          *(_BYTE *)v30 = *v31;
          *(_QWORD *)(v30 + 8) = *((_QWORD *)v31 + 1);
          *(_QWORD *)(v30 + 16) = *((_QWORD *)v31 + 2);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v11((char *)(v30 + *(int *)(v32 + 24)), &v31[*(int *)(v32 + 24)], v9);
          return a1;
        }
        sub_247E3F750(v30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec);
      }
      v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706288) - 8) + 64);
      v27 = (void *)v30;
      v28 = v31;
      goto LABEL_8;
    }
    sub_247E3F750((uint64_t)v13, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec);
LABEL_7:
    v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706280) - 8) + 64);
    v27 = v13;
    v28 = v14;
LABEL_8:
    memcpy(v27, v28, v26);
    return a1;
  }
  if (v18)
    goto LABEL_7;
  *v13 = *v14;
  v19 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v19(&v13[*(int *)(v15 + 20)], &v14[*(int *)(v15 + 20)], v9);
  v20 = *(int *)(v15 + 24);
  v21 = &v13[v20];
  v22 = &v14[v20];
  v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    *(_BYTE *)v21 = *(_BYTE *)v22;
    v21[1] = v22[1];
    v21[2] = v22[2];
    v41 = *(int *)(v23 + 24);
    v44 = (char *)v21 + v41;
    v42 = (char *)v22 + v41;
    swift_bridgeObjectRetain();
    v19(v44, v42, v9);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

_OWORD *initializeWithTake for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    *v12 = *v13;
    v10(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v9);
    v17 = *(int *)(v14 + 24);
    v18 = &v12[v17];
    v19 = &v13[v17];
    v20 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      *v18 = *v19;
      *(_OWORD *)(v18 + 8) = *(_OWORD *)(v19 + 8);
      v10(&v18[*(int *)(v20 + 24)], &v19[*(int *)(v20 + 24)], v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

_QWORD *assignWithTake for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_BYTE *, uint64_t, uint64_t);
  int v19;
  void (*v20)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v21;
  _BYTE *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  int v36;
  int v37;
  uint64_t v39;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_247E81DBC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v9) = v18(v14, 1, v16);
  v19 = v18(v15, 1, v16);
  if (!(_DWORD)v9)
  {
    if (!v19)
    {
      *v14 = *v15;
      v12(&v14[*(int *)(v16 + 20)], &v15[*(int *)(v16 + 20)], v10);
      v30 = *(int *)(v16 + 24);
      v31 = (uint64_t)&v14[v30];
      v32 = &v15[v30];
      v33 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
      v34 = *(_QWORD *)(v33 - 8);
      v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48);
      v36 = v35(v31, 1, v33);
      v37 = v35((uint64_t)v32, 1, v33);
      if (v36)
      {
        if (!v37)
        {
          *(_BYTE *)v31 = *v32;
          *(_OWORD *)(v31 + 8) = *(_OWORD *)(v32 + 8);
          (*(void (**)(uint64_t, _BYTE *, uint64_t))(v11 + 32))(v31 + *(int *)(v33 + 24), &v32[*(int *)(v33 + 24)], v10);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
          return a1;
        }
      }
      else
      {
        if (!v37)
        {
          *(_BYTE *)v31 = *v32;
          v39 = *((_QWORD *)v32 + 2);
          *(_QWORD *)(v31 + 8) = *((_QWORD *)v32 + 1);
          *(_QWORD *)(v31 + 16) = v39;
          swift_bridgeObjectRelease();
          v12((char *)(v31 + *(int *)(v33 + 24)), &v32[*(int *)(v33 + 24)], v10);
          return a1;
        }
        sub_247E3F750(v31, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706288) - 8) + 64);
      v28 = (void *)v31;
      v29 = v32;
      goto LABEL_8;
    }
    sub_247E3F750((uint64_t)v14, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257706280) - 8) + 64);
    v28 = v14;
    v29 = v15;
LABEL_8:
    memcpy(v28, v29, v27);
    return a1;
  }
  if (v19)
    goto LABEL_7;
  *v14 = *v15;
  v20 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v11 + 32);
  v20(&v14[*(int *)(v16 + 20)], &v15[*(int *)(v16 + 20)], v10);
  v21 = *(int *)(v16 + 24);
  v22 = &v14[v21];
  v23 = &v15[v21];
  v24 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    *v22 = *v23;
    *(_OWORD *)(v22 + 8) = *(_OWORD *)(v23 + 8);
    v20(&v22[*(int *)(v24 + 24)], &v23[*(int *)(v24 + 24)], v10);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E4A0C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_CollabToken()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E4A178(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706280);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_247E4A218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_247E4AAD4(a1, a2, a3, (uint64_t)&unk_247E8AD38, qword_257706710, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec);
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_247E81DBC();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)v4 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      *(_BYTE *)v13 = *(_BYTE *)v14;
      v19 = v14[2];
      v13[1] = v14[1];
      v13[2] = v19;
      v20 = *(int *)(v15 + 24);
      v21 = (char *)v13 + v20;
      v22 = (char *)v14 + v20;
      swift_bridgeObjectRetain();
      v11(v21, v22, v10);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return v4;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void (*v9)(uint64_t, uint64_t);

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_247E81DBC();
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v9(v4, v5);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v6 + *(int *)(v7 + 24), v5);
  }
  return result;
}

_BYTE *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_247E81DBC();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 24);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    *(_BYTE *)v12 = *(_BYTE *)v13;
    v17 = v13[2];
    v12[1] = v13[1];
    v12[2] = v17;
    v18 = *(int *)(v14 + 24);
    v19 = (char *)v12 + v18;
    v20 = (char *)v13 + v18;
    swift_bridgeObjectRetain();
    v10(v19, v20, v9);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

_BYTE *assignWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD *, uint64_t, uint64_t);
  int v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_247E81DBC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 24);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v8) = v17(v13, 1, v15);
  v18 = v17(v14, 1, v15);
  if (!(_DWORD)v8)
  {
    if (!v18)
    {
      *(_BYTE *)v13 = *(_BYTE *)v14;
      v13[1] = v14[1];
      v13[2] = v14[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v11((_BYTE *)v13 + *(int *)(v15 + 24), (_BYTE *)v14 + *(int *)(v15 + 24), v9);
      return a1;
    }
    sub_247E3F750((uint64_t)v13, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    return a1;
  }
  *(_BYTE *)v13 = *(_BYTE *)v14;
  v13[1] = v14[1];
  v13[2] = v14[2];
  v19 = *(int *)(v15 + 24);
  v20 = (char *)v13 + v19;
  v21 = (char *)v14 + v19;
  v22 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  swift_bridgeObjectRetain();
  v22(v20, v21, v9);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

_BYTE *initializeWithTake for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  void (*v10)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_247E81DBC();
  v10 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 24);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    *v12 = *v13;
    *(_OWORD *)(v12 + 8) = *(_OWORD *)(v13 + 8);
    v10(&v12[*(int *)(v14 + 24)], &v13[*(int *)(v14 + 24)], v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

_BYTE *assignWithTake for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  int v18;
  uint64_t v19;
  uint64_t v21;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_247E81DBC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 24);
  v13 = (uint64_t)&a1[v12];
  v14 = &a2[v12];
  v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v8) = v17(v13, 1, v15);
  v18 = v17((uint64_t)v14, 1, v15);
  if (!(_DWORD)v8)
  {
    if (!v18)
    {
      *(_BYTE *)v13 = *v14;
      v21 = *((_QWORD *)v14 + 2);
      *(_QWORD *)(v13 + 8) = *((_QWORD *)v14 + 1);
      *(_QWORD *)(v13 + 16) = v21;
      swift_bridgeObjectRelease();
      v11((_BYTE *)(v13 + *(int *)(v15 + 24)), &v14[*(int *)(v15 + 24)], v9);
      return a1;
    }
    sub_247E3F750(v13, type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
    memcpy((void *)v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    return a1;
  }
  *(_BYTE *)v13 = *v14;
  *(_OWORD *)(v13 + 8) = *(_OWORD *)(v14 + 8);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v10 + 32))(v13 + *(int *)(v15 + 24), &v14[*(int *)(v15 + 24)], v9);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E4A96C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    v5 = v4 >= 2;
    v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5)
      return (v6 + 1);
    else
      return 0;
  }
  else
  {
    v10 = sub_247E81DBC();
    v11 = *(_QWORD *)(v10 - 8);
    if (*(_DWORD *)(v11 + 84) == (_DWORD)a2)
    {
      v12 = v10;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
      v11 = *(_QWORD *)(v12 - 8);
      v13 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v11 + 48))(&a1[v13], a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_TargetTokenSpec()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_247E4AA1C(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 254)
  {
    *result = a2 + 1;
  }
  else
  {
    v8 = sub_247E81DBC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706288);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_247E4AAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_247E4AAD4(a1, a2, a3, (uint64_t)&unk_247E8AE10, qword_2577067B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec);
}

void sub_247E4AAD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void (*a6)(uint64_t))
{
  unint64_t v8;
  unint64_t v9;

  sub_247E81DBC();
  if (v8 <= 0x3F)
  {
    sub_247E47260(319, a5, a6);
    if (v9 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = a2[2];
    a1[1] = a2[1];
    a1[2] = v5;
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_247E81DBC();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(int *)(a3 + 24);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_247E81DBC();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E4AE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Embedding_TokenNormalizationSpec()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E4AEC8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_247E4AF3C()
{
  return sub_247E4AF48();
}

uint64_t sub_247E4AF48()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81DBC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247E4AFBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  *a1 = MEMORY[0x24BEE4AF8];
  a1[1] = v2;
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(uint64_t a1)
{
  return sub_247E56E28(a1, (uint64_t *)&unk_25445A750);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ComputationNode.underlyingResource.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(0);
  sub_247E4DC5C(v1 + *(int *)(v6 + 28), (uint64_t)v5, &qword_25445A7A8);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_247E4BBF0((uint64_t)v5, a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v8 = a1 + *(int *)(v7 + 20);
  v9 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = a1 + *(int *)(v7 + 24);
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  return sub_247E601D4((uint64_t)v5, &qword_25445A7A8);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPackage.modelStorage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  sub_247E4DC5C(v1 + *(int *)(v6 + 20), (uint64_t)v5, &qword_25445A7D8);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_247E4BBF0((uint64_t)v5, a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v5, &qword_25445A7D8);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPackage.modelSpec.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  sub_247E4DC5C(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_25445A708);
  v7 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v7 - 1) + 48))(v5, 1, v7) != 1)
    return sub_247E4BBF0((uint64_t)v5, a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v8 = a1 + v7[5];
  v9 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = a1 + v7[6];
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = a1 + v7[7];
  v13 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  return sub_247E601D4((uint64_t)v5, &qword_25445A708);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.modelID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_25445A6A8);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_247E4BBF0((uint64_t)v5, a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0xE000000000000000;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v5, &qword_25445A6A8);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.modelIoSpec.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(v1 + *(int *)(v6 + 28), (uint64_t)v5, &qword_25445A760);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_247E4BBF0((uint64_t)v5, (uint64_t)a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  v8 = MEMORY[0x24BEE4AF8];
  *a1 = MEMORY[0x24BEE4AF8];
  a1[1] = v8;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v5, &qword_25445A760);
}

uint64_t sub_247E4B5C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(0);
  sub_247E4DC5C(a1 + *(int *)(v7 + 28), (uint64_t)v6, &qword_25445A7A8);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_247E4BBF0((uint64_t)v6, a2, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v9 = a2 + *(int *)(v8 + 20);
  v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = a2 + *(int *)(v8 + 24);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  return sub_247E601D4((uint64_t)v6, &qword_25445A7A8);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ComputationNode.underlyingResource.setter(uint64_t a1)
{
  return sub_247E4CE38(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, &qword_25445A7A8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPackage.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v2 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  v3 = a1 + *(int *)(v2 + 20);
  v4 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = a1 + *(int *)(v2 + 24);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(uint64_t a1)
{
  return sub_247E56E28(a1, (uint64_t *)&unk_25445ABC0);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(uint64_t a1)
{
  return sub_247E56E28(a1, (uint64_t *)&unk_25445A798);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(uint64_t a1)
{
  return sub_247E56E28(a1, (uint64_t *)&unk_25445A7C8);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(uint64_t a1)
{
  return sub_247E56E28(a1, (uint64_t *)&unk_25445A6F8);
}

void (*Com_Apple_News_Algorithms_Proto_Model_ComputationNode.underlyingResource.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = (char *)malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(0) + 28);
  *((_DWORD *)v3 + 12) = v10;
  sub_247E4DC5C(v1 + v10, (uint64_t)v5, &qword_25445A7A8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
    v11 = &v9[*(int *)(v6 + 20)];
    v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v13 = &v9[*(int *)(v6 + 24)];
    v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
    sub_247E601D4((uint64_t)v5, &qword_25445A7A8);
  }
  else
  {
    sub_247E4BBF0((uint64_t)v5, (uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
  }
  return sub_247E4B964;
}

void sub_247E4B964(uint64_t a1, char a2)
{
  sub_247E4DDEC(a1, a2, &qword_25445A7A8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

BOOL Com_Apple_News_Algorithms_Proto_Model_ComputationNode.hasUnderlyingResource.getter()
{
  return sub_247E4D00C(&qword_25445A7A8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

Swift::Void __swiftcall Com_Apple_News_Algorithms_Proto_Model_ComputationNode.clearUnderlyingResource()()
{
  sub_247E4D0E4(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, &qword_25445A7A8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ComputationNode.inputAliases.modify())()
{
  return nullsub_212;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ComputationNode.outputAliases.modify())()
{
  return nullsub_213;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ComputationNode.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4D4D8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ComputationNode.unknownFields.setter(uint64_t a1)
{
  return sub_247E4D530(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ComputationNode.unknownFields.modify())()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(0);
  return nullsub_214;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ComputationNode.init()@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = MEMORY[0x24BEE4AF8];
  *a1 = sub_247DFFC84(MEMORY[0x24BEE4AF8]);
  a1[1] = sub_247DFFC84(v2);
  v3 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(0);
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v4 = (char *)a1 + *(int *)(v3 + 28);
  v5 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
}

uint64_t sub_247E4BA98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  sub_247E4DC5C(a1 + *(int *)(v7 + 20), (uint64_t)v6, &qword_25445A7D8);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_247E4BBF0((uint64_t)v6, a2, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0xE000000000000000;
  *(_QWORD *)(a2 + 16) = 0;
  *(_BYTE *)(a2 + 24) = 1;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v6, &qword_25445A7D8);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPackage.modelStorage.setter(uint64_t a1)
{
  return sub_247E4DB9C(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, &qword_25445A7D8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorage.init()@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

uint64_t sub_247E4BBF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void (*Com_Apple_News_Algorithms_Proto_Model_ModelPackage.modelStorage.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0) + 20);
  *((_DWORD *)v3 + 12) = v10;
  sub_247E4DC5C(v1 + v10, (uint64_t)v5, &qword_25445A7D8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = 0;
    v9[1] = 0xE000000000000000;
    v9[2] = 0;
    *((_BYTE *)v9 + 24) = 1;
    _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
    sub_247E601D4((uint64_t)v5, &qword_25445A7D8);
  }
  else
  {
    sub_247E4BBF0((uint64_t)v5, (uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  }
  return sub_247E4BD68;
}

void sub_247E4BD68(uint64_t a1, char a2)
{
  sub_247E4DDEC(a1, a2, &qword_25445A7D8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

BOOL Com_Apple_News_Algorithms_Proto_Model_ModelPackage.hasModelStorage.getter()
{
  return sub_247E4C54C(&qword_25445A7D8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

Swift::Void __swiftcall Com_Apple_News_Algorithms_Proto_Model_ModelPackage.clearModelStorage()()
{
  sub_247E4C624(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, &qword_25445A7D8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t sub_247E4BDB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  sub_247E4DC5C(a1 + *(int *)(v7 + 24), (uint64_t)v6, &qword_25445A708);
  v8 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v8 - 1) + 48))(v6, 1, v8) != 1)
    return sub_247E4BBF0((uint64_t)v6, a2, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v9 = a2 + v8[5];
  v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = a2 + v8[6];
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = a2 + v8[7];
  v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  return sub_247E601D4((uint64_t)v6, &qword_25445A708);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPackage.modelSpec.setter(uint64_t a1)
{
  return sub_247E4C874(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, &qword_25445A708, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.init()@<X0>(uint64_t a1@<X8>)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v2 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  v3 = a1 + v2[5];
  v4 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = a1 + v2[6];
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a1 + v2[7];
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(uint64_t a1)
{
  return sub_247E56E28(a1, (uint64_t *)&unk_25445A698);
}

void (*Com_Apple_News_Algorithms_Proto_Model_ModelPackage.modelSpec.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  int *v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  v3[2] = v6;
  v7 = *((_QWORD *)v6 - 1);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = (char *)malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0) + 24);
  *((_DWORD *)v3 + 12) = v10;
  sub_247E4DC5C(v1 + v10, (uint64_t)v5, &qword_25445A708);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
    v11 = &v9[v6[5]];
    v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v13 = &v9[v6[6]];
    v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
    v15 = &v9[v6[7]];
    v16 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
    sub_247E601D4((uint64_t)v5, &qword_25445A708);
  }
  else
  {
    sub_247E4BBF0((uint64_t)v5, (uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  }
  return sub_247E4C19C;
}

void sub_247E4C19C(uint64_t a1, char a2)
{
  sub_247E4DDEC(a1, a2, &qword_25445A708, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

BOOL Com_Apple_News_Algorithms_Proto_Model_ModelPackage.hasModelSpec.getter()
{
  return sub_247E4CB1C(&qword_25445A708, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

Swift::Void __swiftcall Com_Apple_News_Algorithms_Proto_Model_ModelPackage.clearModelSpec()()
{
  sub_247E4CBF4(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, &qword_25445A708, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelPackage.unknownFields.modify())()
{
  return nullsub_215;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.id.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(v1 + *(int *)(v6 + 20), (uint64_t)v5, &qword_25445AA58);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_247E4BBF0((uint64_t)v5, (uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v5, &qword_25445AA58);
}

uint64_t sub_247E4C2EC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(a1 + *(int *)(v7 + 20), (uint64_t)v6, &qword_25445AA58);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_247E4BBF0((uint64_t)v6, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v6, &qword_25445AA58);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.id.setter(uint64_t a1)
{
  return sub_247E4DB9C(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445AA58, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
}

void (*Com_Apple_News_Algorithms_Proto_Model_ModelSpec.id.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0) + 20);
  *((_DWORD *)v3 + 12) = v10;
  sub_247E4DC5C(v1 + v10, (uint64_t)v5, &qword_25445AA58);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = 0;
    v9[1] = 0xE000000000000000;
    _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
    sub_247E601D4((uint64_t)v5, &qword_25445AA58);
  }
  else
  {
    sub_247E4BBF0((uint64_t)v5, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
  }
  return sub_247E4C51C;
}

void sub_247E4C51C(uint64_t a1, char a2)
{
  sub_247E4DDEC(a1, a2, &qword_25445AA58, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
}

BOOL Com_Apple_News_Algorithms_Proto_Model_ModelSpec.hasID.getter()
{
  return sub_247E4C54C(&qword_25445AA58, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
}

BOOL sub_247E4C54C(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2(0);
  sub_247E4DC5C(v3 + *(int *)(v10 + 20), (uint64_t)v9, a1);
  v11 = a3(0);
  v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 1, v11) != 1;
  sub_247E601D4((uint64_t)v9, a1);
  return v12;
}

Swift::Void __swiftcall Com_Apple_News_Algorithms_Proto_Model_ModelSpec.clearID()()
{
  sub_247E4C624(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445AA58, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
}

uint64_t sub_247E4C624(uint64_t (*a1)(_QWORD), uint64_t *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = v3 + *(int *)(a1(0) + 20);
  sub_247E601D4(v6, a2);
  v7 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
}

uint64_t sub_247E4C68C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(a1 + *(int *)(v7 + 24), (uint64_t)v6, &qword_25445A6A8);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_247E4BBF0((uint64_t)v6, a2, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0xE000000000000000;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0xE000000000000000;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v6, &qword_25445A6A8);
}

uint64_t sub_247E4C788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v12 = a5(0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - v14;
  sub_247E4C934(a1, (uint64_t)&v18 - v14, a5);
  v16 = a2 + *(int *)(a6(0) + 24);
  sub_247E601D4(v16, a7);
  sub_247E4BBF0((uint64_t)v15, v16, a5);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.modelID.setter(uint64_t a1)
{
  return sub_247E4C874(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445A6A8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t sub_247E4C874(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = v4 + *(int *)(a2(0) + 24);
  sub_247E601D4(v8, a3);
  sub_247E4BBF0(a1, v8, a4);
  v9 = a4(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.init()@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0xE000000000000000;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

uint64_t sub_247E4C934(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247E4C978(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void (*Com_Apple_News_Algorithms_Proto_Model_ModelSpec.modelID.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0) + 24);
  *((_DWORD *)v3 + 12) = v10;
  sub_247E4DC5C(v1 + v10, (uint64_t)v5, &qword_25445A6A8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = 0;
    v9[1] = 0xE000000000000000;
    v9[2] = 0;
    v9[3] = 0xE000000000000000;
    v9[4] = 0;
    *((_BYTE *)v9 + 40) = 1;
    _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
    sub_247E601D4((uint64_t)v5, &qword_25445A6A8);
  }
  else
  {
    sub_247E4BBF0((uint64_t)v5, (uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  }
  return sub_247E4CAEC;
}

void sub_247E4CAEC(uint64_t a1, char a2)
{
  sub_247E4DDEC(a1, a2, &qword_25445A6A8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

BOOL Com_Apple_News_Algorithms_Proto_Model_ModelSpec.hasModelID.getter()
{
  return sub_247E4CB1C(&qword_25445A6A8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

BOOL sub_247E4CB1C(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2(0);
  sub_247E4DC5C(v3 + *(int *)(v10 + 24), (uint64_t)v9, a1);
  v11 = a3(0);
  v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 1, v11) != 1;
  sub_247E601D4((uint64_t)v9, a1);
  return v12;
}

Swift::Void __swiftcall Com_Apple_News_Algorithms_Proto_Model_ModelSpec.clearModelID()()
{
  sub_247E4CBF4(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445A6A8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t sub_247E4CBF4(uint64_t (*a1)(_QWORD), uint64_t *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = v3 + *(int *)(a1(0) + 24);
  sub_247E601D4(v6, a2);
  v7 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
}

uint64_t sub_247E4CC5C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(a1 + *(int *)(v7 + 28), (uint64_t)v6, &qword_25445A760);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_247E4BBF0((uint64_t)v6, (uint64_t)a2, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  v9 = MEMORY[0x24BEE4AF8];
  *a2 = MEMORY[0x24BEE4AF8];
  a2[1] = v9;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v6, &qword_25445A760);
}

uint64_t sub_247E4CD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v12 = a5(0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - v14;
  sub_247E4C934(a1, (uint64_t)&v18 - v14, a5);
  v16 = a2 + *(int *)(a6(0) + 28);
  sub_247E601D4(v16, a7);
  sub_247E4BBF0((uint64_t)v15, v16, a5);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.modelIoSpec.setter(uint64_t a1)
{
  return sub_247E4CE38(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445A760, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t sub_247E4CE38(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = v4 + *(int *)(a2(0) + 28);
  sub_247E601D4(v8, a3);
  sub_247E4BBF0(a1, v8, a4);
  v9 = a4(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
}

void (*Com_Apple_News_Algorithms_Proto_Model_ModelSpec.modelIoSpec.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0) + 28);
  *((_DWORD *)v3 + 12) = v10;
  sub_247E4DC5C(v1 + v10, (uint64_t)v5, &qword_25445A760);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    *v9 = MEMORY[0x24BEE4AF8];
    v9[1] = v11;
    _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
    sub_247E601D4((uint64_t)v5, &qword_25445A760);
  }
  else
  {
    sub_247E4BBF0((uint64_t)v5, (uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  }
  return sub_247E4CFDC;
}

void sub_247E4CFDC(uint64_t a1, char a2)
{
  sub_247E4DDEC(a1, a2, &qword_25445A760, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

BOOL Com_Apple_News_Algorithms_Proto_Model_ModelSpec.hasModelIoSpec.getter()
{
  return sub_247E4D00C(&qword_25445A760, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

BOOL sub_247E4D00C(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2(0);
  sub_247E4DC5C(v3 + *(int *)(v10 + 28), (uint64_t)v9, a1);
  v11 = a3(0);
  v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 1, v11) != 1;
  sub_247E601D4((uint64_t)v9, a1);
  return v12;
}

Swift::Void __swiftcall Com_Apple_News_Algorithms_Proto_Model_ModelSpec.clearModelIoSpec()()
{
  sub_247E4D0E4(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445A760, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t sub_247E4D0E4(uint64_t (*a1)(_QWORD), uint64_t *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = v3 + *(int *)(a1(0) + 28);
  sub_247E601D4(v6, a2);
  v7 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelSpec.unknownFields.modify())()
{
  return nullsub_216;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.md5HexDigest.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.md5HexDigest.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.md5HexDigest.modify())()
{
  return nullsub_217;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.name.modify())()
{
  return nullsub_218;
}

void Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.type.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 32);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.type.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)result;
  *(_BYTE *)(v1 + 40) = v2;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.type.modify())()
{
  return nullsub_219;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4D644(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.unknownFields.setter(uint64_t a1)
{
  return sub_247E4D6B0(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.unknownFields.modify())()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  return nullsub_220;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelType.unknownFields.modify())()
{
  return nullsub_221;
}

unint64_t Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 7;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

unint64_t sub_247E4D308@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum.init(rawValue:)(*a1, a2);
}

uint64_t sub_247E4D314()
{
  sub_247E56550();
  return sub_247E81DF8();
}

BOOL sub_247E4D350(uint64_t a1, uint64_t *a2)
{
  return sub_247E1A46C(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_247E4D370()
{
  qword_2577068E8 = (uint64_t)&unk_251960EA8;
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum.allCases.getter()
{
  return sub_247E4E7AC(&qword_257703E98);
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum.allCases.setter(uint64_t a1)
{
  return sub_247E4E820(a1, &qword_257703E98, &qword_2577068E8);
}

uint64_t (*static Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum.allCases.modify())()
{
  if (qword_257703E98 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess_2_0;
}

uint64_t sub_247E4D428@<X0>(_QWORD *a1@<X8>)
{
  return sub_247E4E90C(&qword_257703E98, &qword_2577068E8, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.inputs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.inputs.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.inputs.modify())()
{
  return nullsub_222;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.outputs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.outputs.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.outputs.modify())()
{
  return nullsub_223;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4D4D8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, a1);
}

uint64_t sub_247E4D4D8@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1(0) + 24);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.unknownFields.setter(uint64_t a1)
{
  return sub_247E4D530(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t sub_247E4D530(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2(0) + 24);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.unknownFields.modify())()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  return nullsub_224;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIO.name.modify())()
{
  return nullsub_225;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.shape.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.shape.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIO.shape.modify())()
{
  return nullsub_226;
}

void Com_Apple_News_Algorithms_Proto_Model_ModelIO.dtype.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 24);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.dtype.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)(v1 + 24) = *(_QWORD *)result;
  *(_BYTE *)(v1 + 32) = v2;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIO.dtype.modify())()
{
  return nullsub_227;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4D644(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, a1);
}

uint64_t sub_247E4D644@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1(0) + 28);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(uint64_t a1)
{
  return sub_247E56E28(a1, (uint64_t *)&unk_25445A6D0);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.unknownFields.setter(uint64_t a1)
{
  return sub_247E4D6B0(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
}

uint64_t sub_247E4D6B0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2(0) + 28);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelIO.unknownFields.modify())()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0);
  return nullsub_228;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.init()@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0);
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_DType.unknownFields.modify())()
{
  return nullsub_229;
}

unint64_t Com_Apple_News_Algorithms_Proto_Model_DType.Enum.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 8;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

unint64_t sub_247E4D7A8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return Com_Apple_News_Algorithms_Proto_Model_DType.Enum.init(rawValue:)(*a1, a2);
}

uint64_t sub_247E4D7B4()
{
  sub_247E10C14();
  return sub_247E81DF8();
}

BOOL sub_247E4D7F0(uint64_t a1, uint64_t *a2)
{
  return sub_247E1A468(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_247E4D810()
{
  qword_2577068F0 = (uint64_t)&unk_251960F38;
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_DType.Enum.allCases.getter()
{
  return sub_247E4E7AC(&qword_257703EA0);
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_DType.Enum.allCases.setter(uint64_t a1)
{
  return sub_247E4E820(a1, &qword_257703EA0, &qword_2577068F0);
}

uint64_t (*static Com_Apple_News_Algorithms_Proto_Model_DType.Enum.allCases.modify())()
{
  if (qword_257703EA0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess_2;
}

uint64_t sub_247E4D8C8@<X0>(_QWORD *a1@<X8>)
{
  return sub_247E4E90C(&qword_257703EA0, &qword_2577068F0, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.binaryClassifierSpec.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(0);
  sub_247E4DC5C(v1 + *(int *)(v6 + 20), (uint64_t)v5, &qword_257706AD0);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_247E4BBF0((uint64_t)v5, (uint64_t)a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  *a1 = 0;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v5, &qword_257706AD0);
}

uint64_t sub_247E4D9C8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(0);
  sub_247E4DC5C(a1 + *(int *)(v7 + 20), (uint64_t)v6, &qword_257706AD0);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_247E4BBF0((uint64_t)v6, (uint64_t)a2, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  *a2 = 0;
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  return sub_247E601D4((uint64_t)v6, &qword_257706AD0);
}

uint64_t sub_247E4DAB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v12 = a5(0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - v14;
  sub_247E4C934(a1, (uint64_t)&v18 - v14, a5);
  v16 = a2 + *(int *)(a6(0) + 20);
  sub_247E601D4(v16, a7);
  sub_247E4BBF0((uint64_t)v15, v16, a5);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.binaryClassifierSpec.setter(uint64_t a1)
{
  return sub_247E4DB9C(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, &qword_257706AD0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t sub_247E4DB9C(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = v4 + *(int *)(a2(0) + 20);
  sub_247E601D4(v8, a3);
  sub_247E4BBF0(a1, v8, a4);
  v9 = a4(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.init()@<X0>(_DWORD *a1@<X8>)
{
  *a1 = 0;
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(uint64_t a1)
{
  return sub_247E56E28(a1, (uint64_t *)&unk_257706E10);
}

uint64_t sub_247E4DC5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(uint64_t a1)
{
  return sub_247E56E28(a1, qword_257706EA8);
}

void (*Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.binaryClassifierSpec.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _DWORD *v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(0) + 20);
  *((_DWORD *)v3 + 12) = v10;
  sub_247E4DC5C(v1 + v10, (uint64_t)v5, &qword_257706AD0);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = 0;
    _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
    sub_247E601D4((uint64_t)v5, &qword_257706AD0);
  }
  else
  {
    sub_247E4BBF0((uint64_t)v5, (uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  }
  return sub_247E4DDD8;
}

void sub_247E4DDD8(uint64_t a1, char a2)
{
  sub_247E4DDEC(a1, a2, &qword_257706AD0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

void sub_247E4DDEC(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = *(void **)a1;
  v7 = *(int *)(*(_QWORD *)a1 + 48);
  v8 = *(void **)(*(_QWORD *)a1 + 32);
  v9 = *(void **)(*(_QWORD *)a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v11 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v12 = *(void **)(*(_QWORD *)a1 + 8);
  v13 = **(_QWORD **)a1 + v7;
  if ((a2 & 1) != 0)
  {
    sub_247E4C934(*(_QWORD *)(*(_QWORD *)a1 + 40), (uint64_t)v8, a4);
    sub_247E601D4(v13, a3);
    sub_247E4BBF0((uint64_t)v8, v13, a4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    sub_247E4C978((uint64_t)v9, a4);
  }
  else
  {
    sub_247E601D4(**(_QWORD **)a1 + v7, a3);
    sub_247E4BBF0((uint64_t)v9, v13, a4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
  }
  free(v9);
  free(v8);
  free(v12);
  free(v6);
}

BOOL Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.hasBinaryClassifierSpec.getter()
{
  return sub_247E4C54C(&qword_257706AD0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

Swift::Void __swiftcall Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.clearBinaryClassifierSpec()()
{
  sub_247E4C624(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, &qword_257706AD0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.unknownFields.modify())()
{
  return nullsub_230;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v2 = a1 + *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(0) + 20);
  v3 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
}

float Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.threshold.getter()
{
  uint64_t v0;

  return *(float *)v0;
}

void Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.threshold.setter(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.threshold.modify())()
{
  return nullsub_231;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4E260(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.unknownFields.setter(uint64_t a1)
{
  return sub_247E4E2CC(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.unknownFields.modify())()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  return nullsub_232;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelStorage.modelPath.modify())()
{
  return nullsub_233;
}

void Com_Apple_News_Algorithms_Proto_Model_ModelStorage.modelStorageType.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorage.modelStorageType.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)result;
  *(_BYTE *)(v1 + 24) = v2;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelStorage.modelStorageType.modify())()
{
  return nullsub_234;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorage.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4D4D8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorage.unknownFields.setter(uint64_t a1)
{
  return sub_247E4D530(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelStorage.unknownFields.modify())()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  return nullsub_235;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.unknownFields.modify())()
{
  return nullsub_236;
}

void Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

unint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 0xB;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_247E4E0D8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t sub_247E4E0EC()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

unint64_t sub_247E4E0F4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum.init(rawValue:)(*a1, a2);
}

void sub_247E4E0FC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_247E4E10C()
{
  sub_247E56D78();
  return sub_247E81DF8();
}

BOOL sub_247E4E148(uint64_t a1, uint64_t *a2)
{
  return sub_247E04C54(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_247E4E168()
{
  qword_2577068F8 = (uint64_t)&unk_251960FD8;
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum.allCases.getter()
{
  return sub_247E4E7AC(&qword_257703EA8);
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum.allCases.setter(uint64_t a1)
{
  return sub_247E4E820(a1, &qword_257703EA8, &qword_2577068F8);
}

uint64_t (*static Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum.allCases.modify())()
{
  if (qword_257703EA8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess_2;
}

uint64_t sub_247E4E224@<X0>(_QWORD *a1@<X8>)
{
  return sub_247E4E90C(&qword_257703EA8, &qword_2577068F8, a1);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.extractorSpecs.modify())()
{
  return nullsub_237;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4E260(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, a1);
}

uint64_t sub_247E4E260@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1(0) + 20);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(uint64_t a1)
{
  return sub_247E56E28(a1, qword_257706FC8);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.unknownFields.setter(uint64_t a1)
{
  return sub_247E4E2CC(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
}

uint64_t sub_247E4E2CC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2(0) + 20);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.unknownFields.modify())()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(0);
  return nullsub_238;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.init()@<X0>(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(0);
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.name.modify())()
{
  return nullsub_239;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.type.modify())()
{
  return nullsub_240;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.sourceFieldNames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.sourceFieldNames.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.sourceFieldNames.modify())()
{
  return nullsub_241;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.joinString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.joinString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.joinString.modify())()
{
  return nullsub_242;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(0) + 32);
  v4 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(uint64_t a1)
{
  return sub_247E56E28(a1, qword_257707058);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(0) + 32);
  v4 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.unknownFields.modify())()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(0);
  return nullsub_243;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.init()@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0xE000000000000000;
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(0);
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G7PackageV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G7PackageV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvs_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*Com_Apple_News_Algorithms_Proto_Model_ExtractorType.unknownFields.modify())()
{
  return nullsub_244;
}

unint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

unint64_t sub_247E4E624@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

_QWORD *sub_247E4E63C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;
  char v3;

  v2 = *result >= 3uLL;
  *(_QWORD *)a2 = *result;
  v3 = !v2;
  *(_BYTE *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_247E4E65C()
{
  sub_247E828E4();
  sub_247E821DC();
  return sub_247E828FC();
}

uint64_t sub_247E4E6C4()
{
  sub_247E56DD0();
  return sub_247E81DF8();
}

uint64_t sub_247E4E700()
{
  sub_247E828E4();
  sub_247E821DC();
  return sub_247E828FC();
}

BOOL sub_247E4E764(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_247E4E77C()
{
  qword_257706900 = (uint64_t)&unk_2519610A8;
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum.allCases.getter()
{
  return sub_247E4E7AC(&qword_257703EB0);
}

uint64_t sub_247E4E7AC(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum.allCases.setter(uint64_t a1)
{
  return sub_247E4E820(a1, &qword_257703EB0, &qword_257706900);
}

uint64_t sub_247E4E820(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 != -1)
    swift_once();
  swift_beginAccess();
  *a3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum.allCases.modify())()
{
  if (qword_257703EB0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess_2_1;
}

uint64_t sub_247E4E8F0@<X0>(_QWORD *a1@<X8>)
{
  return sub_247E4E90C(&qword_257703EB0, &qword_257706900, a1);
}

uint64_t sub_247E4E90C@<X0>(_QWORD *a1@<X2>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  *a3 = *a2;
  return swift_bridgeObjectRetain();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ComputationNode.protoMessageName.getter()
{
  return 0xD000000000000035;
}

uint64_t sub_247E4E98C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706908);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706908);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83520;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "underlying_resource";
  *(_QWORD *)(v7 + 8) = 19;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "input_aliases";
  *((_QWORD *)v11 + 1) = 13;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "output_aliases";
  *(_QWORD *)(v12 + 8) = 14;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ComputationNode._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703EB8, (uint64_t)qword_257706908, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ComputationNode.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;

  v5 = v3;
  result = sub_247E81E1C();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result == 3 || result == 2)
      {
        sub_247E81D98();
        sub_247E81E10();
      }
      else if (result == 1)
      {
        sub_247E4FDB4(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, &qword_25445A778, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
      }
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ComputationNode.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;

  result = sub_247E4EDA8((uint64_t)v3, a1, a2, a3);
  if (!v4)
  {
    if (*(_QWORD *)(*v3 + 16))
    {
      sub_247E81D98();
      sub_247E81F18();
    }
    if (*(_QWORD *)(v3[1] + 16))
    {
      sub_247E81D98();
      sub_247E81F18();
    }
    type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(0);
    return sub_247E81DA4();
  }
  return result;
}

uint64_t sub_247E4EDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(0);
  sub_247E4DC5C(a1 + *(int *)(v12 + 28), (uint64_t)v7, &qword_25445A7A8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_247E601D4((uint64_t)v7, &qword_25445A7A8);
  sub_247E4BBF0((uint64_t)v7, (uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
  sub_247E55910(&qword_25445A778, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
  sub_247E81FA8();
  return sub_247E4C978((uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ComputationNode.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, &qword_257706AD8, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
}

uint64_t sub_247E4EF3C@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v4 = MEMORY[0x24BEE4AF8];
  *a2 = sub_247DFFC84(MEMORY[0x24BEE4AF8]);
  a2[1] = sub_247DFFC84(v4);
  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v5 = (char *)a2 + *(int *)(a1 + 28);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
}

unint64_t sub_247E4EFB8()
{
  return 0xD000000000000035;
}

uint64_t (*sub_247E4EFE0())()
{
  return nullsub_245;
}

uint64_t sub_247E4EFF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Com_Apple_News_Algorithms_Proto_Model_ComputationNode.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_247E4F00C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Com_Apple_News_Algorithms_Proto_Model_ComputationNode.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_247E4F024()
{
  sub_247E55910(&qword_2577071A0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
  return sub_247E81DEC();
}

uint64_t sub_247E4F078@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703EB8, (uint64_t)qword_257706908, a1);
}

uint64_t sub_247E4F094()
{
  sub_247E55910(&qword_25445ABB0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
  return sub_247E81EE8();
}

uint64_t sub_247E4F0D8()
{
  sub_247E55910(&qword_25445ABB0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelPackage.protoMessageName.getter()
{
  return 0xD000000000000032;
}

uint64_t sub_247E4F14C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706920);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706920);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83500;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "model_storage";
  *(_QWORD *)(v7 + 8) = 13;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "model_spec";
  *((_QWORD *)v11 + 1) = 10;
  v11[16] = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelPackage._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703EC0, (uint64_t)qword_257706920, a1);
}

uint64_t sub_247E4F2B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_247E81FD8();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPackage.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;

  v5 = v3;
  result = sub_247E81E1C();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result == 2)
      {
        sub_247E4FD10(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445A6E8, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
      }
      else if (result == 1)
      {
        sub_247E52144(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, &qword_25445A7B8, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
      }
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPackage.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_247E4F490(v3, a1, a2, a3);
  if (!v4)
  {
    sub_247E4F604(v3, a1, a2, a3);
    return sub_247E81DA4();
  }
  return result;
}

uint64_t sub_247E4F490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  sub_247E4DC5C(a1 + *(int *)(v12 + 20), (uint64_t)v7, &qword_25445A7D8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_247E601D4((uint64_t)v7, &qword_25445A7D8);
  sub_247E4BBF0((uint64_t)v7, (uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  sub_247E55910(&qword_25445A7B8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  sub_247E81FA8();
  return sub_247E4C978((uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t sub_247E4F604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  sub_247E4DC5C(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_25445A708);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_247E601D4((uint64_t)v7, &qword_25445A708);
  sub_247E4BBF0((uint64_t)v7, (uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  sub_247E55910(&qword_25445A6E8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  sub_247E81FA8();
  return sub_247E4C978((uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPackage.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, &qword_25445A780, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

uint64_t sub_247E4F798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v4 = a2 + *(int *)(a1 + 20);
  v5 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = a2 + *(int *)(a1 + 24);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
}

unint64_t sub_247E4F818()
{
  return 0xD000000000000032;
}

uint64_t (*sub_247E4F840())()
{
  return nullsub_246;
}

uint64_t sub_247E4F854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelPackage.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_247E4F868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelPackage.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_247E4F880()
{
  sub_247E55910(&qword_257707198, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
  return sub_247E81DEC();
}

uint64_t sub_247E4F8D4@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703EC0, (uint64_t)qword_257706920, a1);
}

uint64_t sub_247E4F8F0@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_247E81FD8();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_247E4F95C()
{
  sub_247E55910(&qword_25445A778, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
  return sub_247E81EE8();
}

uint64_t sub_247E4F9A0()
{
  sub_247E55910(&qword_25445A778, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelSpec.protoMessageName.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_247E4FA14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706938);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706938);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83520;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "id";
  *(_QWORD *)(v7 + 8) = 2;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "model_id";
  *((_QWORD *)v11 + 1) = 8;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 4;
  *(_QWORD *)v12 = "model_io_spec";
  *(_QWORD *)(v12 + 8) = 13;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelSpec._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703EC8, (uint64_t)qword_257706938, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;

  v5 = v3;
  result = sub_247E81E1C();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 4:
          sub_247E4FDB4(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, &qword_25445A740, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
          break;
        case 2:
          sub_247E4FD10(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, &qword_25445A688, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
          break;
        case 1:
          sub_247E52144(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID, &qword_25445AA38, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Common_UUID);
          break;
      }
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t sub_247E4FD10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  a5(0);
  a6(0);
  sub_247E55910(a7, a6, a8);
  return sub_247E81EB8();
}

uint64_t sub_247E4FDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  a5(0);
  a6(0);
  sub_247E55910(a7, a6, a8);
  return sub_247E81EB8();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_247E4FEDC(v3, a1, a2, a3);
  if (!v4)
  {
    sub_247E50050(v3, a1, a2, a3);
    sub_247E501C4(v3, a1, a2, a3);
    return sub_247E81DA4();
  }
  return result;
}

uint64_t sub_247E4FEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(a1 + *(int *)(v12 + 20), (uint64_t)v7, &qword_25445AA58);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_247E601D4((uint64_t)v7, &qword_25445AA58);
  sub_247E4BBF0((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
  sub_247E55910(&qword_25445AA38, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Common_UUID);
  sub_247E81FA8();
  return sub_247E4C978((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
}

uint64_t sub_247E50050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_25445A6A8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_247E601D4((uint64_t)v7, &qword_25445A6A8);
  sub_247E4BBF0((uint64_t)v7, (uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  sub_247E55910(&qword_25445A688, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  sub_247E81FA8();
  return sub_247E4C978((uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t sub_247E501C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(a1 + *(int *)(v12 + 28), (uint64_t)v7, &qword_25445A760);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_247E601D4((uint64_t)v7, &qword_25445A760);
  sub_247E4BBF0((uint64_t)v7, (uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  sub_247E55910(&qword_25445A740, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  sub_247E81FA8();
  return sub_247E4C978((uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelSpec.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_257706AE0, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

uint64_t sub_247E50358@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v4 = a2 + a1[5];
  v5 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = a2 + a1[6];
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = a2 + a1[7];
  v9 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
}

unint64_t sub_247E50404()
{
  return 0xD00000000000002FLL;
}

uint64_t (*sub_247E5042C())()
{
  return nullsub_247;
}

uint64_t sub_247E50440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelSpec.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_247E50454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelSpec.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_247E5046C()
{
  sub_247E55910(&qword_257707190, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  return sub_247E81DEC();
}

uint64_t sub_247E504C0@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703EC8, (uint64_t)qword_257706938, a1);
}

uint64_t sub_247E504DC()
{
  sub_247E55910(&qword_25445A6E8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  return sub_247E81EE8();
}

uint64_t sub_247E50520()
{
  sub_247E55910(&qword_25445A6E8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.protoMessageName.getter()
{
  return 0xD000000000000039;
}

uint64_t sub_247E50594()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706950);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706950);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83520;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "md5_hex_digest";
  *(_QWORD *)(v7 + 8) = 14;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "name";
  *((_QWORD *)v11 + 1) = 4;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "type";
  *(_QWORD *)(v12 + 8) = 4;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelIdentification._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703ED0, (uint64_t)qword_257706950, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_247E81E1C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 3)
      {
        sub_247E56550();
        sub_247E81E40();
      }
      else if (result == 2 || result == 1)
      {
        sub_247E81EA0();
      }
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_247E81F90(), !v1))
  {
    v5 = v0[3];
    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    if (!v6 || (result = sub_247E81F90(), !v1))
    {
      if (!v0[4] || (sub_247E56550(), result = sub_247E81F48(), !v1))
      {
        type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
        return sub_247E81DA4();
      }
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, &qword_257706AE8, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t sub_247E50988@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0xE000000000000000;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

unint64_t sub_247E509BC()
{
  return 0xD000000000000039;
}

uint64_t (*sub_247E509E4())()
{
  return nullsub_248;
}

uint64_t sub_247E509FC()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E50A10()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelIdentification.traverse<A>(visitor:)();
}

uint64_t sub_247E50A28()
{
  sub_247E55910(&qword_257707188, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  return sub_247E81DEC();
}

uint64_t sub_247E50A7C@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703ED0, (uint64_t)qword_257706950, a1);
}

uint64_t sub_247E50A98()
{
  sub_247E55910(&qword_25445A688, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  return sub_247E81EE8();
}

uint64_t sub_247E50ADC()
{
  sub_247E55910(&qword_25445A688, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelType.protoMessageName.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_247E50B50(uint64_t a1)
{
  return sub_247E53FE8(a1, qword_257706968);
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelType._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703ED8, (uint64_t)qword_257706968, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelType.decodeMessage<A>(decoder:)()
{
  return sub_247E5405C();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelType.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType, &qword_257706AF0, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType);
}

unint64_t sub_247E50BB0()
{
  return 0xD00000000000002FLL;
}

uint64_t (*sub_247E50BD8())()
{
  return nullsub_249;
}

uint64_t sub_247E50BEC()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E50C00()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.traverse<A>(visitor:)();
}

uint64_t sub_247E50C18()
{
  sub_247E55910(&qword_257707180, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType);
  return sub_247E81DEC();
}

uint64_t sub_247E50C6C@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703ED8, (uint64_t)qword_257706968, a1);
}

uint64_t sub_247E50C88()
{
  sub_247E55910(&qword_257706BD0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType);
  return sub_247E81EE8();
}

uint64_t sub_247E50CCC()
{
  sub_247E55910(&qword_257706BD0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType);
  return sub_247E81EF4();
}

uint64_t sub_247E50D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706980);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706980);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E8AE80;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "UNKNOWN";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "TENSORFLOW";
  *(_QWORD *)(v11 + 8) = 10;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "MESSAGE_PREPROCESSING";
  *((_QWORD *)v13 + 1) = 21;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "TEXT_PREPROCESSING";
  *((_QWORD *)v15 + 1) = 18;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 4;
  *(_QWORD *)v17 = "TEXT_OUTPUT";
  *((_QWORD *)v17 + 1) = 11;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 5;
  *(_QWORD *)v19 = "TEXT_CODES";
  *((_QWORD *)v19 + 1) = 10;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 6;
  *(_QWORD *)v21 = "COREML";
  *((_QWORD *)v21 + 1) = 6;
  v21[16] = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703EE0, (uint64_t)qword_257706980, a1);
}

uint64_t sub_247E50FA4@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703EE0, (uint64_t)qword_257706980, a1);
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.protoMessageName.getter()
{
  return 0xD000000000000031;
}

uint64_t sub_247E50FDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706998);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706998);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83500;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "inputs";
  *(_QWORD *)(v7 + 8) = 6;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "outputs";
  *((_QWORD *)v11 + 1) = 7;
  v11[16] = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703EE8, (uint64_t)qword_257706998, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_247E81E1C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1)
      {
        type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0);
        sub_247E55910(&qword_25445A6C0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
        sub_247E81EAC();
      }
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*v0 + 16)
    || (type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0),
        sub_247E55910(&qword_25445A6C0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO), result = sub_247E81F9C(), !v1))
  {
    if (!*(_QWORD *)(v0[1] + 16)
      || (type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0),
          sub_247E55910(&qword_25445A6C0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO), result = sub_247E81F9C(), !v1))
    {
      type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
      return sub_247E81DA4();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, &qword_257706AF8, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t sub_247E513AC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  *a1 = MEMORY[0x24BEE4AF8];
  a1[1] = v1;
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

unint64_t sub_247E513D4()
{
  return 0xD000000000000031;
}

uint64_t (*sub_247E513FC())()
{
  return nullsub_250;
}

uint64_t sub_247E51414()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E51428()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec.traverse<A>(visitor:)();
}

uint64_t sub_247E51440()
{
  sub_247E55910(&qword_257707178, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  return sub_247E81DEC();
}

uint64_t sub_247E51494@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703EE8, (uint64_t)qword_257706998, a1);
}

uint64_t sub_247E514B0()
{
  sub_247E55910(&qword_25445A740, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  return sub_247E81EE8();
}

uint64_t sub_247E514F4()
{
  sub_247E55910(&qword_25445A740, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelIO.protoMessageName.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_247E51568()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_2577069B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2577069B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83520;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "name";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "shape";
  *((_QWORD *)v11 + 1) = 5;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "dtype";
  *(_QWORD *)(v12 + 8) = 5;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelIO._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703EF0, (uint64_t)qword_2577069B0, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_247E81E1C();
  v3 = v0;
  if (!v0)
  {
    while (1)
    {
      if ((v2 & 1) != 0)
        return result;
      if (result == 3)
        break;
      if (result == 2)
      {
        v4 = v3;
        sub_247E81E58();
        goto LABEL_5;
      }
      if (result == 1)
      {
        v4 = v3;
        sub_247E81EA0();
        goto LABEL_5;
      }
LABEL_6:
      result = sub_247E81E1C();
    }
    sub_247E10C14();
    v4 = v3;
    sub_247E81E40();
LABEL_5:
    v3 = v4;
    goto LABEL_6;
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_247E81F90(), !v1))
  {
    if (!*(_QWORD *)(v0[2] + 16) || (result = sub_247E81F30(), !v1))
    {
      if (!v0[3] || (sub_247E10C14(), result = sub_247E81F48(), !v1))
      {
        type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0);
        return sub_247E81DA4();
      }
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelIO.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, &qword_257706B00, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
}

uint64_t sub_247E51948@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

unint64_t sub_247E51980()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_247E519A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 28);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_247E519E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 28);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_247E51A28())()
{
  return nullsub_251;
}

uint64_t sub_247E51A40()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelIO.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E51A54()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelIO.traverse<A>(visitor:)();
}

uint64_t sub_247E51A6C()
{
  sub_247E55910(&qword_257707170, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
  return sub_247E81DEC();
}

uint64_t sub_247E51AC0@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703EF0, (uint64_t)qword_2577069B0, a1);
}

uint64_t sub_247E51ADC()
{
  sub_247E55910(&qword_25445A6C0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
  return sub_247E81EE8();
}

uint64_t sub_247E51B20()
{
  sub_247E55910(&qword_25445A6C0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_DType.protoMessageName.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_247E51B94(uint64_t a1)
{
  return sub_247E53FE8(a1, qword_2577069C8);
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_DType._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703EF8, (uint64_t)qword_2577069C8, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_DType.decodeMessage<A>(decoder:)()
{
  return sub_247E5405C();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_DType.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType, &qword_257706B08, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType);
}

unint64_t sub_247E51BF4()
{
  return 0xD00000000000002BLL;
}

uint64_t (*sub_247E51C1C())()
{
  return nullsub_252;
}

uint64_t sub_247E51C30()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E51C44()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.traverse<A>(visitor:)();
}

uint64_t sub_247E51C5C()
{
  sub_247E55910(&qword_257707168, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType);
  return sub_247E81DEC();
}

uint64_t sub_247E51CB0@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703EF8, (uint64_t)qword_2577069C8, a1);
}

uint64_t sub_247E51CCC()
{
  sub_247E55910(&qword_257706BF8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType);
  return sub_247E81EE8();
}

uint64_t sub_247E51D10()
{
  sub_247E55910(&qword_257706BF8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType);
  return sub_247E81EF4();
}

uint64_t sub_247E51D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v24;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_2577069E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2577069E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_247E8AE90;
  v5 = v24 + v4;
  v6 = v24 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v24 + v4) = 0;
  *(_QWORD *)v6 = "UNKNOWN";
  *(_QWORD *)(v6 + 8) = 7;
  *(_BYTE *)(v6 + 16) = 2;
  v7 = *MEMORY[0x24BE5C318];
  v8 = sub_247E81FB4();
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  v10 = v5 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v3) = 1;
  *(_QWORD *)v10 = "TEXT";
  *(_QWORD *)(v10 + 8) = 4;
  *(_BYTE *)(v10 + 16) = 2;
  v9();
  v11 = (_QWORD *)(v5 + 2 * v3);
  v12 = (char *)v11 + *(int *)(v1 + 48);
  *v11 = 2;
  *(_QWORD *)v12 = "INT_32";
  *((_QWORD *)v12 + 1) = 6;
  v12[16] = 2;
  v9();
  v13 = (_QWORD *)(v5 + 3 * v3);
  v14 = (char *)v13 + *(int *)(v1 + 48);
  *v13 = 3;
  *(_QWORD *)v14 = "INT_64";
  *((_QWORD *)v14 + 1) = 6;
  v14[16] = 2;
  v9();
  v15 = (_QWORD *)(v5 + 4 * v3);
  v16 = (char *)v15 + *(int *)(v1 + 48);
  *v15 = 4;
  *(_QWORD *)v16 = "FLOAT_32";
  *((_QWORD *)v16 + 1) = 8;
  v16[16] = 2;
  v9();
  v17 = (_QWORD *)(v5 + 5 * v3);
  v18 = (char *)v17 + *(int *)(v1 + 48);
  *v17 = 5;
  *(_QWORD *)v18 = "FLOAT_64";
  *((_QWORD *)v18 + 1) = 8;
  v18[16] = 2;
  v9();
  v19 = (_QWORD *)(v5 + 6 * v3);
  v20 = (char *)v19 + *(int *)(v1 + 48);
  *v19 = 6;
  *(_QWORD *)v20 = "BYTES";
  *((_QWORD *)v20 + 1) = 5;
  v20[16] = 2;
  v9();
  v21 = (_QWORD *)(v5 + 7 * v3);
  v22 = (char *)v21 + *(int *)(v1 + 48);
  *v21 = 7;
  *(_QWORD *)v22 = "FLOAT_16";
  *((_QWORD *)v22 + 1) = 8;
  v22[16] = 2;
  v9();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_DType.Enum._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F00, (uint64_t)qword_2577069E0, a1);
}

uint64_t sub_247E52014@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F00, (uint64_t)qword_2577069E0, a1);
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.protoMessageName.getter()
{
  return 0xD000000000000035;
}

uint64_t sub_247E5204C(uint64_t a1)
{
  return sub_247E533F8(a1, qword_2577069F8, (uint64_t)"binary_classifier_spec", 22, MEMORY[0x24BE5C328]);
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F08, (uint64_t)qword_2577069F8, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;

  v5 = v3;
  result = sub_247E81E1C();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result == 1)
        sub_247E52144(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, &qword_257706C28, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t sub_247E52144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  a5(0);
  a6(0);
  sub_247E55910(a7, a6, a8);
  return sub_247E81EB8();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_247E5223C(v3, a1, a2, a3);
  if (!v4)
    return sub_247E81DA4();
  return result;
}

uint64_t sub_247E5223C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(0);
  sub_247E4DC5C(a1 + *(int *)(v12 + 20), (uint64_t)v7, &qword_257706AD0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_247E601D4((uint64_t)v7, &qword_257706AD0);
  sub_247E4BBF0((uint64_t)v7, (uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  sub_247E55910(&qword_257706C28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  sub_247E81FA8();
  return sub_247E4C978((uint64_t)v11, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, &qword_257706B10, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec);
}

uint64_t sub_247E523D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
  v4 = a2 + *(int *)(a1 + 20);
  v5 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
}

unint64_t sub_247E5241C()
{
  return 0xD000000000000035;
}

uint64_t (*sub_247E52444())()
{
  return nullsub_253;
}

uint64_t sub_247E52458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_247E5246C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_247E52484()
{
  sub_247E55910(&qword_257707160, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec);
  return sub_247E81DEC();
}

uint64_t sub_247E524D8@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F08, (uint64_t)qword_2577069F8, a1);
}

uint64_t sub_247E524F4()
{
  sub_247E55910(&qword_257706C10, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec);
  return sub_247E81EE8();
}

uint64_t sub_247E52538()
{
  sub_247E55910(&qword_257706C10, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.protoMessageName.getter()
{
  return 0xD00000000000003ALL;
}

uint64_t sub_247E525AC(uint64_t a1)
{
  return sub_247E533F8(a1, qword_257706A10, (uint64_t)"threshold", 9, MEMORY[0x24BE5C318]);
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F10, (uint64_t)qword_257706A10, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_247E81E1C();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
      sub_247E81E70();
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.traverse<A>(visitor:)()
{
  float *v0;
  uint64_t v1;
  uint64_t result;

  if (*v0 == 0.0 || (result = sub_247E81F60(), !v1))
  {
    type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
    return sub_247E81DA4();
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, &qword_257706B18, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t sub_247E52708@<X0>(_DWORD *a1@<X8>)
{
  *a1 = 0;
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

unint64_t sub_247E52728()
{
  return 0xD00000000000003ALL;
}

uint64_t (*sub_247E52750())()
{
  return nullsub_254;
}

uint64_t sub_247E52768()
{
  return Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E5277C()
{
  return Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec.traverse<A>(visitor:)();
}

uint64_t sub_247E52794()
{
  sub_247E55910(&qword_257707158, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  return sub_247E81DEC();
}

uint64_t sub_247E527E8@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F10, (uint64_t)qword_257706A10, a1);
}

uint64_t sub_247E52804()
{
  sub_247E55910(&qword_257706C28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  return sub_247E81EE8();
}

uint64_t sub_247E52848()
{
  sub_247E55910(&qword_257706C28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelStorage.protoMessageName.getter()
{
  return 0xD000000000000032;
}

uint64_t sub_247E528BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706A28);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706A28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83500;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "model_path";
  *(_QWORD *)(v7 + 8) = 10;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "model_storage_type";
  *((_QWORD *)v11 + 1) = 18;
  v11[16] = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelStorage._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F18, (uint64_t)qword_257706A28, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorage.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_247E81E1C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_247E56D78();
        sub_247E81E40();
      }
      else if (result == 1)
      {
        sub_247E81EA0();
      }
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorage.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_247E81F90(), !v1))
  {
    if (!v0[2] || (sub_247E56D78(), result = sub_247E81F48(), !v1))
    {
      type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
      return sub_247E81DA4();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorage.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, &qword_257706B20, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t sub_247E52C18@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

unint64_t sub_247E52C48()
{
  return 0xD000000000000032;
}

uint64_t sub_247E52C6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_247E52CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 24);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_247E52CF0())()
{
  return nullsub_255;
}

uint64_t sub_247E52D08()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorage.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E52D1C()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorage.traverse<A>(visitor:)();
}

uint64_t sub_247E52D34()
{
  sub_247E55910(&qword_257707150, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  return sub_247E81DEC();
}

uint64_t sub_247E52D88@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F18, (uint64_t)qword_257706A28, a1);
}

uint64_t sub_247E52DA4()
{
  sub_247E55910(&qword_25445A7B8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  return sub_247E81EE8();
}

uint64_t sub_247E52DE8()
{
  sub_247E55910(&qword_25445A7B8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.protoMessageName.getter()
{
  return 0xD000000000000036;
}

uint64_t sub_247E52E5C(uint64_t a1)
{
  return sub_247E53FE8(a1, qword_257706A40);
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelStorageType._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F20, (uint64_t)qword_257706A40, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.decodeMessage<A>(decoder:)()
{
  return sub_247E5405C();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.traverse<A>(visitor:)()
{
  return sub_247E81DA4();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType, &qword_257706B28, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType);
}

unint64_t sub_247E52ED0()
{
  return 0xD000000000000036;
}

uint64_t (*sub_247E52EF8())()
{
  return nullsub_256;
}

uint64_t sub_247E52F0C()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E52F20()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.traverse<A>(visitor:)();
}

uint64_t sub_247E52F38()
{
  sub_247E55910(&qword_257707148, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType);
  return sub_247E81DEC();
}

uint64_t sub_247E52F8C@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F20, (uint64_t)qword_257706A40, a1);
}

uint64_t sub_247E52FA8()
{
  sub_247E55910(&qword_257706C48, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType);
  return sub_247E81EE8();
}

uint64_t sub_247E52FEC()
{
  sub_247E55910(&qword_257706C48, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType);
  return sub_247E81EF4();
}

uint64_t sub_247E53044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  _QWORD *v27;
  char *v28;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706A58);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706A58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E868A0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "UNKNOWN";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "TENSORFLOW_SAVED_MODEL";
  *(_QWORD *)(v11 + 8) = 22;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "MESSAGE_PREPROCESSING_SPEC_PB";
  *((_QWORD *)v13 + 1) = 29;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "TOKENIZER_PB";
  *((_QWORD *)v15 + 1) = 12;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 4;
  *(_QWORD *)v17 = "FROZEN_GRAPH_PB";
  *((_QWORD *)v17 + 1) = 15;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 5;
  *(_QWORD *)v19 = "TENSORFLOW_H5";
  *((_QWORD *)v19 + 1) = 13;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 6;
  *(_QWORD *)v21 = "TEXT_CODES_PB";
  *((_QWORD *)v21 + 1) = 13;
  v21[16] = 2;
  v10();
  v22 = (_QWORD *)(v6 + 7 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 7;
  *(_QWORD *)v23 = "CODES_SPEC_PB";
  *((_QWORD *)v23 + 1) = 13;
  v23[16] = 2;
  v10();
  v24 = v6 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 8 * v3) = 8;
  *(_QWORD *)v24 = "COREML_MLMODEL";
  *(_QWORD *)(v24 + 8) = 14;
  *(_BYTE *)(v24 + 16) = 2;
  v10();
  v25 = (_QWORD *)(v6 + 9 * v3);
  v26 = (char *)v25 + *(int *)(v1 + 48);
  *v25 = 9;
  *(_QWORD *)v26 = "COREML_MLPACKAGE";
  *((_QWORD *)v26 + 1) = 16;
  v26[16] = 2;
  v10();
  v27 = (_QWORD *)(v6 + 10 * v3);
  v28 = (char *)v27 + *(int *)(v1 + 48);
  *v27 = 10;
  *(_QWORD *)v28 = "COREML_COMPILED_MODEL";
  *((_QWORD *)v28 + 1) = 21;
  v28[16] = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F28, (uint64_t)qword_257706A58, a1);
}

uint64_t sub_247E533A0@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F28, (uint64_t)qword_257706A58, a1);
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.protoMessageName.getter()
{
  return 0xD00000000000003ELL;
}

uint64_t sub_247E533D8(uint64_t a1)
{
  return sub_247E533F8(a1, qword_257706A70, (uint64_t)"extractor_specs", 15, MEMORY[0x24BE5C328]);
}

uint64_t sub_247E533F8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = sub_247E81FD8();
  __swift_allocate_value_buffer(v9, a2);
  __swift_project_value_buffer(v9, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v11 + 32) & ~v11;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_247E83230;
  v14 = v13 + v12 + *(int *)(v10 + 48);
  *(_QWORD *)(v13 + v12) = 1;
  *(_QWORD *)v14 = a3;
  *(_QWORD *)(v14 + 8) = a4;
  *(_BYTE *)(v14 + 16) = 2;
  v15 = *a5;
  v16 = sub_247E81FB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F30, (uint64_t)qword_257706A70, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_247E81E1C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(0);
        sub_247E55910(&qword_257706B30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
        sub_247E81EAC();
      }
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 16)
    || (type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(0),
        sub_247E55910(&qword_257706B30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec), result = sub_247E81F9C(), !v1))
  {
    type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(0);
    return sub_247E81DA4();
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, &qword_257706B38, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
}

uint64_t sub_247E536F0@<X0>(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

unint64_t sub_247E53718()
{
  return 0xD00000000000003ELL;
}

uint64_t sub_247E5373C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_247E53780(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 20);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_247E537C0())()
{
  return nullsub_257;
}

uint64_t sub_247E537D8()
{
  return Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E537EC()
{
  return Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec.traverse<A>(visitor:)();
}

uint64_t sub_247E53804()
{
  sub_247E55910(&qword_257707140, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
  return sub_247E81DEC();
}

uint64_t sub_247E53858@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F30, (uint64_t)qword_257706A70, a1);
}

uint64_t sub_247E53874()
{
  sub_247E55910(&qword_257706C60, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
  return sub_247E81EE8();
}

uint64_t sub_247E538B8()
{
  sub_247E55910(&qword_257706C60, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.protoMessageName.getter()
{
  return 0xD000000000000033;
}

uint64_t sub_247E5392C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706A88);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706A88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83510;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "name";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "type";
  *(_QWORD *)(v11 + 8) = 4;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "source_field_names";
  *((_QWORD *)v13 + 1) = 18;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "join_string";
  *((_QWORD *)v15 + 1) = 11;
  v15[16] = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F38, (uint64_t)qword_257706A88, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_247E81E1C();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 4:
          v4 = v3;
          sub_247E81EA0();
          goto LABEL_5;
        case 2:
          sub_247E56DD0();
          v4 = v3;
          sub_247E81E40();
          goto LABEL_5;
        case 3:
          v4 = v3;
          sub_247E81E94();
LABEL_5:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_247E81E1C();
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_247E81F90(), !v1))
  {
    if (!v0[2] || (sub_247E56DD0(), result = sub_247E81F48(), !v1))
    {
      if (!*(_QWORD *)(v0[4] + 16) || (result = sub_247E81F84(), !v1))
      {
        v5 = v0[6];
        v6 = HIBYTE(v5) & 0xF;
        if ((v5 & 0x2000000000000000) == 0)
          v6 = v0[5] & 0xFFFFFFFFFFFFLL;
        if (!v6 || (result = sub_247E81F90(), !v1))
        {
          type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(0);
          return sub_247E81DA4();
        }
      }
    }
  }
  return result;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, &qword_257706B48, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
}

uint64_t sub_247E53D90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  v1 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(a1 + 24) = 1;
  *(_QWORD *)(a1 + 32) = v1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0xE000000000000000;
  return _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
}

unint64_t sub_247E53DD0()
{
  return 0xD000000000000033;
}

uint64_t sub_247E53DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_247E53E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 32);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_247E53E70())()
{
  return nullsub_258;
}

uint64_t sub_247E53E88()
{
  return Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E53E9C()
{
  return Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec.traverse<A>(visitor:)();
}

uint64_t sub_247E53EB4()
{
  sub_247E55910(&qword_257707138, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
  return sub_247E81DEC();
}

uint64_t sub_247E53F08@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F38, (uint64_t)qword_257706A88, a1);
}

uint64_t sub_247E53F24()
{
  sub_247E55910(&qword_257706B30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
  return sub_247E81EE8();
}

uint64_t sub_247E53F68()
{
  sub_247E55910(&qword_257706B30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
  return sub_247E81EF4();
}

unint64_t static Com_Apple_News_Algorithms_Proto_Model_ExtractorType.protoMessageName.getter()
{
  return 0xD000000000000033;
}

uint64_t sub_247E53FDC(uint64_t a1)
{
  return sub_247E53FE8(a1, qword_257706AA0);
}

uint64_t sub_247E53FE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_247E81FD8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_247E81FCC();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ExtractorType._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F40, (uint64_t)qword_257706AA0, a1);
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorType.decodeMessage<A>(decoder:)()
{
  return sub_247E5405C();
}

uint64_t sub_247E5405C()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  do
    result = sub_247E81E1C();
  while (!v0 && (v2 & 1) == 0);
  return result;
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G4TypeV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v4 = sub_247E81DBC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v15 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&v15 - v10, a1, v4);
  v12(v9, a2, v4);
  sub_247E55910(&qword_25445A660, v5, MEMORY[0x24BE5BF20]);
  LOBYTE(a2) = sub_247E821F4();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v4);
  v13(v11, v4);
  return a2 & 1;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorType.hashValue.getter()
{
  return sub_247E541C8(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType, &qword_257706B50, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType);
}

uint64_t sub_247E541C8(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  sub_247E828E4();
  a1(0);
  sub_247E55910(a2, a1, a3);
  sub_247E821DC();
  return sub_247E828FC();
}

unint64_t sub_247E54248()
{
  return 0xD000000000000033;
}

uint64_t sub_247E5426C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_247E542A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*sub_247E542E0())()
{
  return nullsub_259;
}

uint64_t sub_247E542F4()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.decodeMessage<A>(decoder:)();
}

uint64_t sub_247E54308()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.traverse<A>(visitor:)();
}

uint64_t sub_247E54320()
{
  sub_247E55910(&qword_257707130, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType);
  return sub_247E81DEC();
}

uint64_t sub_247E54374@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F40, (uint64_t)qword_257706AA0, a1);
}

uint64_t sub_247E54390()
{
  sub_247E55910(&qword_257706C88, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType);
  return sub_247E81EE8();
}

uint64_t sub_247E543D4()
{
  sub_247E828E4();
  sub_247E821DC();
  return sub_247E828FC();
}

uint64_t sub_247E54428()
{
  sub_247E55910(&qword_257706C88, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType);
  return sub_247E81EF4();
}

uint64_t sub_247E5447C()
{
  sub_247E828E4();
  sub_247E821DC();
  return sub_247E828FC();
}

uint64_t sub_247E544D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v4 = sub_247E81DBC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v15 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&v15 - v10, a1, v4);
  v12(v9, a2, v4);
  sub_247E55910(&qword_25445A660, v5, MEMORY[0x24BE5BF20]);
  LOBYTE(a2) = sub_247E821F4();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v4);
  v13(v11, v4);
  return a2 & 1;
}

uint64_t sub_247E545DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_247E81FD8();
  __swift_allocate_value_buffer(v0, qword_257706AB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_257706AB8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458C50);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458BD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83520;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "UNKNOWN";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_247E81FB4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "SIMPLE";
  *((_QWORD *)v11 + 1) = 6;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 2;
  *(_QWORD *)v12 = "STRING_JOIN";
  *(_QWORD *)(v12 + 8) = 11;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_247E81FC0();
}

uint64_t static Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F2B8(&qword_257703F48, (uint64_t)qword_257706AB8, a1);
}

uint64_t sub_247E54788@<X0>(uint64_t a1@<X8>)
{
  return sub_247E4F8F0(&qword_257703F48, (uint64_t)qword_257706AB8, a1);
}

uint64_t _s4Tabi62Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpecV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_247E81DBC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if ((sub_247E21EE8(*a1, *a2) & 1) != 0)
  {
    v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(0);
    v12 = (char *)a1 + *(int *)(v11 + 20);
    v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, (char *)a2 + *(int *)(v11 + 20), v4);
    sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_247E821F4();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t _s4Tabi58Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpecV2eeoiySbAC_ACtFZ_0(float *a1, float *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_247E81DBC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if (*a1 == *a2)
  {
    v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
    v12 = (char *)a1 + *(int *)(v11 + 20);
    v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, (char *)a2 + *(int *)(v11 + 20), v4);
    sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_247E821F4();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t _s4Tabi53Com_Apple_News_Algorithms_Proto_Model_ComputationNodeV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  char v31;
  uint64_t *v32;
  uint64_t *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  char *v39;
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t *v49;
  char *v50;

  v4 = sub_247E81DBC();
  v46 = *(_QWORD *)(v4 - 8);
  v47 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v45 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)&v43 - v7;
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v50 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257705AB0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v43 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v43 - v21;
  v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(0);
  v24 = *(int *)(v23 + 28);
  v48 = a1;
  v25 = (uint64_t)a1 + v24;
  v26 = v23;
  sub_247E4DC5C(v25, (uint64_t)v22, &qword_25445A7A8);
  v27 = *(int *)(v26 + 28);
  v49 = a2;
  sub_247E4DC5C((uint64_t)a2 + v27, (uint64_t)v20, &qword_25445A7A8);
  v28 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_247E4DC5C((uint64_t)v22, (uint64_t)v13, &qword_25445A7A8);
  sub_247E4DC5C((uint64_t)v20, v28, &qword_25445A7A8);
  v29 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v29((uint64_t)v13, 1, v8) != 1)
  {
    v30 = (uint64_t)v50;
    sub_247E4DC5C((uint64_t)v13, (uint64_t)v17, &qword_25445A7A8);
    if (v29(v28, 1, v8) != 1)
    {
      sub_247E4BBF0(v28, v30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
      v31 = _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G7PackageV2eeoiySbAC_ACtFZ_0((uint64_t)v17, v30);
      sub_247E4C978(v30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
      sub_247E601D4((uint64_t)v20, &qword_25445A7A8);
      sub_247E601D4((uint64_t)v22, &qword_25445A7A8);
      sub_247E4C978((uint64_t)v17, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
      sub_247E601D4((uint64_t)v13, &qword_25445A7A8);
      if ((v31 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      v40 = 0;
      return v40 & 1;
    }
    sub_247E601D4((uint64_t)v20, &qword_25445A7A8);
    sub_247E601D4((uint64_t)v22, &qword_25445A7A8);
    sub_247E4C978((uint64_t)v17, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
LABEL_6:
    sub_247E601D4((uint64_t)v13, &qword_257705AB0);
    goto LABEL_11;
  }
  sub_247E601D4((uint64_t)v20, &qword_25445A7A8);
  sub_247E601D4((uint64_t)v22, &qword_25445A7A8);
  if (v29(v28, 1, v8) != 1)
    goto LABEL_6;
  sub_247E601D4((uint64_t)v13, &qword_25445A7A8);
LABEL_8:
  v32 = v48;
  v33 = v49;
  if ((sub_247E01B4C(*v48, *v49) & 1) == 0 || (sub_247E01B4C(v32[1], v33[1]) & 1) == 0)
    goto LABEL_11;
  v34 = (char *)v32 + *(int *)(v26 + 24);
  v36 = v46;
  v35 = v47;
  v37 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v38 = v44;
  v37(v44, v34, v47);
  v39 = v45;
  v37(v45, (char *)v33 + *(int *)(v26 + 24), v35);
  sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v40 = sub_247E821F4();
  v41 = *(void (**)(char *, uint64_t))(v36 + 8);
  v41(v39, v35);
  v41(v38, v35);
  return v40 & 1;
}

uint64_t _s4Tabi51Com_Apple_News_Algorithms_Proto_Model_ExtractorSpecV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v4 = sub_247E81DBC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
  {
    v12 = 0;
    if ((sub_247E82854() & 1) == 0)
      return v12 & 1;
  }
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(a2 + 24) != 1)
  {
    if (v13 == v14)
      goto LABEL_16;
    goto LABEL_21;
  }
  if (!v14)
  {
    if (!v13)
      goto LABEL_16;
LABEL_21:
    v12 = 0;
    return v12 & 1;
  }
  if (v14 != 1)
  {
    if (v13 == 2)
      goto LABEL_16;
    goto LABEL_21;
  }
  if (v13 != 1)
    goto LABEL_21;
LABEL_16:
  if ((sub_247E221E0(*(_QWORD **)(a1 + 32), *(_QWORD **)(a2 + 32)) & 1) == 0)
    goto LABEL_21;
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40) && *(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48)
    || (v12 = 0, (sub_247E82854() & 1) != 0))
  {
    v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(0);
    v16 = a1 + *(int *)(v15 + 32);
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v17(v10, v16, v4);
    v17(v8, a2 + *(int *)(v15 + 32), v4);
    sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v12 = sub_247E821F4();
    v18 = *(void (**)(char *, uint64_t))(v5 + 8);
    v18(v8, v4);
    v18(v10, v4);
  }
  return v12 & 1;
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G7StorageV2eeoiySbAC_ACtFZ_0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_247E81DBC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *a1 == *(_QWORD *)a2 && a1[1] == *(_QWORD *)(a2 + 8);
  if (v11 || (v12 = 0, (sub_247E82854() & 1) != 0))
  {
    v13 = *(_QWORD *)(a2 + 16);
    if (*(_BYTE *)(a2 + 24) == 1)
      __asm { BR              X11 }
    if (a1[2] == v13)
    {
      v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
      v15 = (char *)a1 + *(int *)(v14 + 24);
      v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v16(v10, v15, v4);
      v16(v8, (char *)(a2 + *(int *)(v14 + 24)), v4);
      sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v12 = sub_247E821F4();
      v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
    }
    else
    {
      v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G7PackageV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v47;
  char v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v69 = a1;
  v70 = a2;
  v61 = sub_247E81DBC();
  v59 = *(_QWORD *)(v61 - 8);
  v2 = MEMORY[0x24BDAC7A8](v61);
  v58 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v57 = (char *)&v55 - v4;
  v67 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  v64 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v56 = (uint64_t)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A718);
  MEMORY[0x24BDAC7A8](v63);
  v68 = (uint64_t)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v60 = (uint64_t)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v65 = (uint64_t)&v55 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v66 = (uint64_t)&v55 - v12;
  v13 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (uint64_t *)((char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7E8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v55 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v55 - v27;
  v29 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  sub_247E4DC5C(v69 + *(int *)(v29 + 20), (uint64_t)v28, &qword_25445A7D8);
  v62 = v29;
  sub_247E4DC5C(v70 + *(int *)(v29 + 20), (uint64_t)v26, &qword_25445A7D8);
  v30 = (uint64_t)&v19[*(int *)(v17 + 48)];
  sub_247E4DC5C((uint64_t)v28, (uint64_t)v19, &qword_25445A7D8);
  sub_247E4DC5C((uint64_t)v26, v30, &qword_25445A7D8);
  v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  if (v31((uint64_t)v19, 1, v13) == 1)
  {
    sub_247E601D4((uint64_t)v26, &qword_25445A7D8);
    sub_247E601D4((uint64_t)v28, &qword_25445A7D8);
    if (v31(v30, 1, v13) == 1)
    {
      sub_247E601D4((uint64_t)v19, &qword_25445A7D8);
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  sub_247E4DC5C((uint64_t)v19, (uint64_t)v23, &qword_25445A7D8);
  if (v31(v30, 1, v13) == 1)
  {
    sub_247E601D4((uint64_t)v26, &qword_25445A7D8);
    sub_247E601D4((uint64_t)v28, &qword_25445A7D8);
    sub_247E4C978((uint64_t)v23, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
LABEL_9:
    v41 = &qword_25445A7E8;
    v42 = (uint64_t)v19;
LABEL_20:
    sub_247E601D4(v42, v41);
    goto LABEL_21;
  }
  sub_247E4BBF0(v30, (uint64_t)v16, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  if ((*(_QWORD *)v23 != *v16 || *((_QWORD *)v23 + 1) != v16[1]) && (sub_247E82854() & 1) == 0
    || !sub_247E04C54(*((_QWORD *)v23 + 2), v23[24], v16[2]))
  {
    sub_247E4C978((uint64_t)v16, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
    sub_247E601D4((uint64_t)v26, &qword_25445A7D8);
    sub_247E601D4((uint64_t)v28, &qword_25445A7D8);
    sub_247E4C978((uint64_t)v23, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
    v42 = (uint64_t)v19;
    v41 = &qword_25445A7D8;
    goto LABEL_20;
  }
  sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v43 = sub_247E821F4();
  sub_247E4C978((uint64_t)v16, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  sub_247E601D4((uint64_t)v26, &qword_25445A7D8);
  sub_247E601D4((uint64_t)v28, &qword_25445A7D8);
  sub_247E4C978((uint64_t)v23, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
  sub_247E601D4((uint64_t)v19, &qword_25445A7D8);
  if ((v43 & 1) == 0)
    goto LABEL_21;
LABEL_4:
  v32 = v62;
  v33 = v69;
  v34 = v66;
  sub_247E4DC5C(v69 + *(int *)(v62 + 24), v66, &qword_25445A708);
  v35 = v70;
  v36 = v65;
  sub_247E4DC5C(v70 + *(int *)(v32 + 24), v65, &qword_25445A708);
  v37 = v68;
  v38 = v68 + *(int *)(v63 + 48);
  sub_247E4DC5C(v34, v68, &qword_25445A708);
  sub_247E4DC5C(v36, v38, &qword_25445A708);
  v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48);
  v40 = v67;
  if (v39(v37, 1, v67) == 1)
  {
    sub_247E601D4(v36, &qword_25445A708);
    sub_247E601D4(v34, &qword_25445A708);
    if (v39(v38, 1, v40) == 1)
    {
      sub_247E601D4(v37, &qword_25445A708);
LABEL_24:
      v49 = v59;
      v50 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 16);
      v51 = v57;
      v52 = v61;
      v50(v57, v33, v61);
      v53 = v58;
      v50(v58, v35, v52);
      sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v45 = sub_247E821F4();
      v54 = *(void (**)(char *, uint64_t))(v49 + 8);
      v54(v53, v52);
      v54(v51, v52);
      return v45 & 1;
    }
    goto LABEL_19;
  }
  v44 = v60;
  sub_247E4DC5C(v37, v60, &qword_25445A708);
  if (v39(v38, 1, v40) == 1)
  {
    sub_247E601D4(v36, &qword_25445A708);
    sub_247E601D4(v34, &qword_25445A708);
    sub_247E4C978(v44, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
LABEL_19:
    v41 = &qword_25445A718;
    v42 = v37;
    goto LABEL_20;
  }
  v47 = v56;
  sub_247E4BBF0(v38, v56, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  v48 = _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G4SpecV2eeoiySbAC_ACtFZ_0(v44, v47);
  sub_247E4C978(v47, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  sub_247E601D4(v36, &qword_25445A708);
  sub_247E601D4(v34, &qword_25445A708);
  sub_247E4C978(v44, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
  sub_247E601D4(v37, &qword_25445A708);
  if ((v48 & 1) != 0)
    goto LABEL_24;
LABEL_21:
  v45 = 0;
  return v45 & 1;
}

uint64_t sub_247E55910(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495930AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G6IOSpecV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_247E81DBC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if ((sub_247E24740(*a1, *a2) & 1) != 0 && (sub_247E24740(a1[1], a2[1]) & 1) != 0)
  {
    v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
    v12 = (char *)a1 + *(int *)(v11 + 24);
    v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, (char *)a2 + *(int *)(v11 + 24), v4);
    sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_247E821F4();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G4SpecV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  int v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int (*v64)(uint64_t, uint64_t, uint64_t);
  uint64_t v65;
  void (*v66)(char *, uint64_t, uint64_t);
  char *v67;
  uint64_t v68;
  char *v69;
  char v70;
  void (*v71)(char *, uint64_t);
  uint64_t *v72;
  uint64_t *v73;
  char v74;
  uint64_t *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;

  v97 = a2;
  v98 = a1;
  v85 = sub_247E81DBC();
  v79 = *(_QWORD *)(v85 - 8);
  v2 = MEMORY[0x24BDAC7A8](v85);
  v78 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v77 = (char *)&v76 - v4;
  v95 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v83 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v76 = (uint64_t *)((char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A770);
  MEMORY[0x24BDAC7A8](v82);
  v86 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v80 = (uint64_t *)((char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x24BDAC7A8](v8);
  v93 = (char *)&v76 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v94 = (char *)&v76 - v12;
  v91 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v88 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v81 = (uint64_t)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6B8);
  MEMORY[0x24BDAC7A8](v87);
  v92 = (uint64_t)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v84 = (uint64_t **)((char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = MEMORY[0x24BDAC7A8](v16);
  v89 = (uint64_t)&v76 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v90 = (uint64_t)&v76 - v20;
  v21 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (uint64_t **)((char *)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA68);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v31 = (uint64_t **)((char *)&v76 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  v32 = MEMORY[0x24BDAC7A8](v29);
  v34 = (char *)&v76 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v76 - v35;
  v37 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  sub_247E4DC5C(v98 + *(int *)(v37 + 20), (uint64_t)v36, &qword_25445AA58);
  v96 = v37;
  sub_247E4DC5C(v97 + *(int *)(v37 + 20), (uint64_t)v34, &qword_25445AA58);
  v38 = (uint64_t)&v27[*(int *)(v25 + 48)];
  sub_247E4DC5C((uint64_t)v36, (uint64_t)v27, &qword_25445AA58);
  sub_247E4DC5C((uint64_t)v34, v38, &qword_25445AA58);
  v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  if (v39((uint64_t)v27, 1, v21) == 1)
  {
    sub_247E601D4((uint64_t)v34, &qword_25445AA58);
    sub_247E601D4((uint64_t)v36, &qword_25445AA58);
    if (v39(v38, 1, v21) == 1)
    {
      sub_247E601D4((uint64_t)v27, &qword_25445AA58);
      goto LABEL_11;
    }
LABEL_6:
    v40 = &qword_25445AA68;
    v41 = (uint64_t)v27;
LABEL_31:
    sub_247E601D4(v41, v40);
    goto LABEL_32;
  }
  sub_247E4DC5C((uint64_t)v27, (uint64_t)v31, &qword_25445AA58);
  if (v39(v38, 1, v21) == 1)
  {
    sub_247E601D4((uint64_t)v34, &qword_25445AA58);
    sub_247E601D4((uint64_t)v36, &qword_25445AA58);
    sub_247E4C978((uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
    goto LABEL_6;
  }
  sub_247E4BBF0(v38, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
  if ((*v31 != *v24 || v31[1] != v24[1]) && (sub_247E82854() & 1) == 0)
  {
    sub_247E4C978((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
    sub_247E601D4((uint64_t)v34, &qword_25445AA58);
    sub_247E601D4((uint64_t)v36, &qword_25445AA58);
    sub_247E4C978((uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
    v41 = (uint64_t)v27;
    v40 = &qword_25445AA58;
    goto LABEL_31;
  }
  sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v42 = sub_247E821F4();
  sub_247E4C978((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
  sub_247E601D4((uint64_t)v34, &qword_25445AA58);
  sub_247E601D4((uint64_t)v36, &qword_25445AA58);
  sub_247E4C978((uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
  sub_247E601D4((uint64_t)v27, &qword_25445AA58);
  if ((v42 & 1) == 0)
    goto LABEL_32;
LABEL_11:
  v43 = v96;
  v44 = v90;
  sub_247E4DC5C(v98 + *(int *)(v96 + 24), v90, &qword_25445A6A8);
  v45 = v89;
  sub_247E4DC5C(v97 + *(int *)(v43 + 24), v89, &qword_25445A6A8);
  v46 = v92;
  v47 = v92 + *(int *)(v87 + 48);
  sub_247E4DC5C(v44, v92, &qword_25445A6A8);
  sub_247E4DC5C(v45, v47, &qword_25445A6A8);
  v48 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v88 + 48);
  v49 = v91;
  if (v48(v46, 1, v91) == 1)
  {
    sub_247E601D4(v45, &qword_25445A6A8);
    sub_247E601D4(v44, &qword_25445A6A8);
    v50 = v48(v47, 1, v49);
    v51 = (uint64_t)v86;
    v52 = (uint64_t)v94;
    v53 = v95;
    v54 = (uint64_t)v93;
    if (v50 == 1)
    {
      sub_247E601D4(v46, &qword_25445A6A8);
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v55 = v84;
  sub_247E4DC5C(v46, (uint64_t)v84, &qword_25445A6A8);
  v56 = v48(v47, 1, v49);
  v57 = v94;
  v53 = v95;
  if (v56 == 1)
  {
    sub_247E601D4(v45, &qword_25445A6A8);
    sub_247E601D4(v44, &qword_25445A6A8);
    sub_247E4C978((uint64_t)v55, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
LABEL_16:
    v40 = &qword_25445A6B8;
    v41 = v46;
    goto LABEL_31;
  }
  v58 = v81;
  v59 = v93;
  sub_247E4BBF0(v47, v81, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  v60 = _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G14IdentificationV2eeoiySbAC_ACtFZ_0(v55, v58);
  sub_247E4C978(v58, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  sub_247E601D4(v45, &qword_25445A6A8);
  sub_247E601D4(v44, &qword_25445A6A8);
  v54 = (uint64_t)v59;
  v51 = (uint64_t)v86;
  sub_247E4C978((uint64_t)v55, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
  sub_247E601D4(v46, &qword_25445A6A8);
  v52 = (uint64_t)v57;
  if ((v60 & 1) == 0)
    goto LABEL_32;
LABEL_18:
  v61 = v96;
  sub_247E4DC5C(v98 + *(int *)(v96 + 28), v52, &qword_25445A760);
  v62 = v97;
  sub_247E4DC5C(v97 + *(int *)(v61 + 28), v54, &qword_25445A760);
  v63 = v51 + *(int *)(v82 + 48);
  sub_247E4DC5C(v52, v51, &qword_25445A760);
  sub_247E4DC5C(v54, v63, &qword_25445A760);
  v64 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v83 + 48);
  if (v64(v51, 1, v53) != 1)
  {
    v72 = v80;
    sub_247E4DC5C(v51, (uint64_t)v80, &qword_25445A760);
    if (v64(v63, 1, v53) == 1)
    {
      sub_247E601D4(v54, &qword_25445A760);
      sub_247E601D4(v52, &qword_25445A760);
      sub_247E4C978((uint64_t)v72, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
      goto LABEL_24;
    }
    v73 = v76;
    sub_247E4BBF0(v63, (uint64_t)v76, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
    if ((sub_247E24740(*v72, *v73) & 1) == 0 || (sub_247E24740(v72[1], v73[1]) & 1) == 0)
    {
      sub_247E4C978((uint64_t)v73, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
      sub_247E601D4(v54, &qword_25445A760);
      sub_247E601D4(v52, &qword_25445A760);
      sub_247E4C978((uint64_t)v72, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
      v41 = v51;
      v40 = &qword_25445A760;
      goto LABEL_31;
    }
    sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v74 = sub_247E821F4();
    sub_247E4C978((uint64_t)v73, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
    sub_247E601D4(v54, &qword_25445A760);
    sub_247E601D4(v52, &qword_25445A760);
    sub_247E4C978((uint64_t)v72, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
    sub_247E601D4(v51, &qword_25445A760);
    if ((v74 & 1) != 0)
      goto LABEL_21;
LABEL_32:
    v70 = 0;
    return v70 & 1;
  }
  sub_247E601D4(v54, &qword_25445A760);
  sub_247E601D4(v52, &qword_25445A760);
  if (v64(v63, 1, v53) != 1)
  {
LABEL_24:
    v40 = &qword_25445A770;
    v41 = v51;
    goto LABEL_31;
  }
  sub_247E601D4(v51, &qword_25445A760);
LABEL_21:
  v65 = v79;
  v66 = *(void (**)(char *, uint64_t, uint64_t))(v79 + 16);
  v67 = v77;
  v68 = v85;
  v66(v77, v98, v85);
  v69 = v78;
  v66(v78, v62, v68);
  sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v70 = sub_247E821F4();
  v71 = *(void (**)(char *, uint64_t))(v65 + 8);
  v71(v69, v68);
  v71(v67, v68);
  return v70 & 1;
}

unint64_t sub_247E56550()
{
  unint64_t result;

  result = qword_25445A720;
  if (!qword_25445A720)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445A720);
  }
  return result;
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G2IOV2eeoiySbAC_ACtFZ_0(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  v4 = sub_247E81DBC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - v9;
  v11 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *((_QWORD *)a2 + 1);
  if (v11 || (v12 = 0, (sub_247E82854() & 1) != 0))
  {
    if (sub_247E226F0(*(_QWORD *)(a1 + 16), *((_QWORD *)a2 + 2))
      && sub_247E1A468(*(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32), *((_QWORD *)a2 + 3)))
    {
      v13 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0);
      v14 = (char *)(a1 + *(int *)(v13 + 28));
      v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v15(v10, v14, v4);
      v15(v8, &a2[*(int *)(v13 + 28)], v4);
      sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v12 = sub_247E821F4();
      v16 = *(void (**)(char *, uint64_t))(v5 + 8);
      v16(v8, v4);
      v16(v10, v4);
    }
    else
    {
      v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G14IdentificationV2eeoiySbAC_ACtFZ_0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v4 = sub_247E81DBC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v11 = *a1 == *(_QWORD *)a2 && a1[1] == *(_QWORD *)(a2 + 8);
  if (v11 || (v12 = 0, (sub_247E82854() & 1) != 0))
  {
    v13 = a1[2] == *(_QWORD *)(a2 + 16) && a1[3] == *(_QWORD *)(a2 + 24);
    if (v13 || (v12 = 0, (sub_247E82854() & 1) != 0))
    {
      v14 = *(_QWORD *)(a2 + 32);
      if (*(_BYTE *)(a2 + 40) == 1)
        __asm { BR              X11 }
      if (a1[4] == v14)
      {
        v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
        v16 = (char *)a1 + *(int *)(v15 + 28);
        v17 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
        v17(v10, v16, v4);
        v17(v8, (char *)(a2 + *(int *)(v15 + 28)), v4);
        sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v12 = sub_247E821F4();
        v18 = *(void (**)(char *, uint64_t))(v5 + 8);
        v18(v8, v4);
        v18(v10, v4);
      }
      else
      {
        v12 = 0;
      }
    }
  }
  return v12 & 1;
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType(uint64_t a1)
{
  return sub_247E56E28(a1, qword_257706CF0);
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType(uint64_t a1)
{
  return sub_247E56E28(a1, qword_257706D80);
}

uint64_t _s4Tabi038Com_Apple_News_Algorithms_Proto_Model_G10PolicySpecV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  float *v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  float *v33;
  char v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  char *v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  float *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  float *v48;

  v4 = sub_247E81DBC();
  v46 = *(_QWORD *)(v4 - 8);
  v47 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v45 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)&v41 - v7;
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v41 = (float *)((char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577071A8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v48 = (float *)((char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v41 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v41 - v20;
  v22 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(0);
  v23 = *(int *)(v22 + 20);
  v42 = a1;
  sub_247E4DC5C(a1 + v23, (uint64_t)v21, &qword_257706AD0);
  v24 = *(int *)(v22 + 20);
  v43 = a2;
  sub_247E4DC5C(a2 + v24, (uint64_t)v19, &qword_257706AD0);
  v25 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_247E4DC5C((uint64_t)v21, (uint64_t)v13, &qword_257706AD0);
  sub_247E4DC5C((uint64_t)v19, v25, &qword_257706AD0);
  v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v26((uint64_t)v13, 1, v8) == 1)
  {
    sub_247E601D4((uint64_t)v19, &qword_257706AD0);
    sub_247E601D4((uint64_t)v21, &qword_257706AD0);
    if (v26(v25, 1, v8) == 1)
    {
      sub_247E601D4((uint64_t)v13, &qword_257706AD0);
      v27 = v47;
LABEL_11:
      v35 = v46;
      v36 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
      v37 = v44;
      v36(v44, v42, v27);
      v38 = v45;
      v36(v45, v43, v27);
      sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v31 = sub_247E821F4();
      v39 = *(void (**)(char *, uint64_t))(v35 + 8);
      v39(v38, v27);
      v39(v37, v27);
      return v31 & 1;
    }
    goto LABEL_6;
  }
  v28 = v48;
  sub_247E4DC5C((uint64_t)v13, (uint64_t)v48, &qword_257706AD0);
  if (v26(v25, 1, v8) == 1)
  {
    sub_247E601D4((uint64_t)v19, &qword_257706AD0);
    sub_247E601D4((uint64_t)v21, &qword_257706AD0);
    sub_247E4C978((uint64_t)v28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
LABEL_6:
    v29 = &qword_2577071A8;
    v30 = (uint64_t)v13;
LABEL_7:
    sub_247E601D4(v30, v29);
    goto LABEL_8;
  }
  v32 = v25;
  v33 = v41;
  sub_247E4BBF0(v32, (uint64_t)v41, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  if (*v28 != *v33)
  {
    sub_247E4C978((uint64_t)v33, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
    sub_247E601D4((uint64_t)v19, &qword_257706AD0);
    sub_247E601D4((uint64_t)v21, &qword_257706AD0);
    sub_247E4C978((uint64_t)v28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
    v30 = (uint64_t)v13;
    v29 = &qword_257706AD0;
    goto LABEL_7;
  }
  sub_247E55910(&qword_25445A660, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v27 = v47;
  v34 = sub_247E821F4();
  sub_247E4C978((uint64_t)v33, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  sub_247E601D4((uint64_t)v19, &qword_257706AD0);
  sub_247E601D4((uint64_t)v21, &qword_257706AD0);
  sub_247E4C978((uint64_t)v28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
  sub_247E601D4((uint64_t)v13, &qword_257706AD0);
  if ((v34 & 1) != 0)
    goto LABEL_11;
LABEL_8:
  v31 = 0;
  return v31 & 1;
}

unint64_t sub_247E56D78()
{
  unint64_t result;

  result = qword_25445A668;
  if (!qword_25445A668)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445A668);
  }
  return result;
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType(uint64_t a1)
{
  return sub_247E56E28(a1, qword_257706F38);
}

unint64_t sub_247E56DD0()
{
  unint64_t result;

  result = qword_257706B40;
  if (!qword_257706B40)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum);
    atomic_store(result, (unint64_t *)&qword_257706B40);
  }
  return result;
}

uint64_t type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType(uint64_t a1)
{
  return sub_247E56E28(a1, qword_2577070F8);
}

uint64_t sub_247E56E28(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_247E56E60()
{
  unint64_t result;

  result = qword_25445A728;
  if (!qword_25445A728)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445A728);
  }
  return result;
}

unint64_t sub_247E56EA8()
{
  unint64_t result;

  result = qword_25445A738;
  if (!qword_25445A738)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445A738);
  }
  return result;
}

unint64_t sub_247E56EF0()
{
  unint64_t result;

  result = qword_25445A730;
  if (!qword_25445A730)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445A730);
  }
  return result;
}

uint64_t sub_247E56F34()
{
  return sub_247E5724C(&qword_257706B58, &qword_257706B60);
}

unint64_t sub_247E56F5C()
{
  unint64_t result;

  result = qword_25445AA78;
  if (!qword_25445AA78)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_DType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445AA78);
  }
  return result;
}

unint64_t sub_247E56FA4()
{
  unint64_t result;

  result = qword_25445AA88;
  if (!qword_25445AA88)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_DType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445AA88);
  }
  return result;
}

unint64_t sub_247E56FEC()
{
  unint64_t result;

  result = qword_25445AA80;
  if (!qword_25445AA80)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_DType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445AA80);
  }
  return result;
}

uint64_t sub_247E57030()
{
  return sub_247E5724C(&qword_257706B68, &qword_257706B70);
}

unint64_t sub_247E57058()
{
  unint64_t result;

  result = qword_25445A670;
  if (!qword_25445A670)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445A670);
  }
  return result;
}

unint64_t sub_247E570A0()
{
  unint64_t result;

  result = qword_25445A680;
  if (!qword_25445A680)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445A680);
  }
  return result;
}

unint64_t sub_247E570E8()
{
  unint64_t result;

  result = qword_25445A678;
  if (!qword_25445A678)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum);
    atomic_store(result, (unint64_t *)&qword_25445A678);
  }
  return result;
}

uint64_t sub_247E5712C()
{
  return sub_247E5724C(&qword_257706B78, &qword_257706B80);
}

unint64_t sub_247E57154()
{
  unint64_t result;

  result = qword_257706B88;
  if (!qword_257706B88)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum);
    atomic_store(result, (unint64_t *)&qword_257706B88);
  }
  return result;
}

unint64_t sub_247E5719C()
{
  unint64_t result;

  result = qword_257706B90;
  if (!qword_257706B90)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum);
    atomic_store(result, (unint64_t *)&qword_257706B90);
  }
  return result;
}

unint64_t sub_247E571E4()
{
  unint64_t result;

  result = qword_257706B98;
  if (!qword_257706B98)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum, &type metadata for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum);
    atomic_store(result, (unint64_t *)&qword_257706B98);
  }
  return result;
}

uint64_t sub_247E57228()
{
  return sub_247E5724C(&qword_257706BA0, &qword_257706BA8);
}

uint64_t sub_247E5724C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495930AC](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247E5728C()
{
  return sub_247E55910(&qword_25445ABB8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
}

uint64_t sub_247E572B8()
{
  return sub_247E55910(&qword_25445ABB0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
}

uint64_t sub_247E572E4()
{
  return sub_247E55910(&qword_257706AD8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
}

uint64_t sub_247E57310()
{
  return sub_247E55910(&qword_257706BB0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode);
}

uint64_t sub_247E5733C()
{
  return sub_247E55910(&qword_25445A790, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

uint64_t sub_247E57368()
{
  return sub_247E55910(&qword_25445A778, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

uint64_t sub_247E57394()
{
  return sub_247E55910(&qword_25445A780, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

uint64_t sub_247E573C0()
{
  return sub_247E55910(&qword_25445A788, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
}

uint64_t sub_247E573EC()
{
  return sub_247E55910(&qword_25445A6F0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

uint64_t sub_247E57418()
{
  return sub_247E55910(&qword_25445A6E8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

uint64_t sub_247E57444()
{
  return sub_247E55910(&qword_257706AE0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

uint64_t sub_247E57470()
{
  return sub_247E55910(&qword_257706BB8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
}

uint64_t sub_247E5749C()
{
  return sub_247E55910(&qword_25445A690, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t sub_247E574C8()
{
  return sub_247E55910(&qword_25445A688, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t sub_247E574F4()
{
  return sub_247E55910(&qword_257706AE8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t sub_247E57520()
{
  return sub_247E55910(&qword_257706BC0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
}

uint64_t sub_247E5754C()
{
  return sub_247E55910(&qword_257706BC8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType);
}

uint64_t sub_247E57578()
{
  return sub_247E55910(&qword_257706BD0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType);
}

uint64_t sub_247E575A4()
{
  return sub_247E55910(&qword_257706AF0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType);
}

uint64_t sub_247E575D0()
{
  return sub_247E55910(&qword_257706BD8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelType);
}

uint64_t sub_247E575FC()
{
  return sub_247E55910(&qword_25445A748, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t sub_247E57628()
{
  return sub_247E55910(&qword_25445A740, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t sub_247E57654()
{
  return sub_247E55910(&qword_257706AF8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t sub_247E57680()
{
  return sub_247E55910(&qword_257706BE0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
}

uint64_t sub_247E576AC()
{
  return sub_247E55910(&qword_25445A6C8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
}

uint64_t sub_247E576D8()
{
  return sub_247E55910(&qword_25445A6C0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
}

uint64_t sub_247E57704()
{
  return sub_247E55910(&qword_257706B00, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
}

uint64_t sub_247E57730()
{
  return sub_247E55910(&qword_257706BE8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
}

uint64_t sub_247E5775C()
{
  return sub_247E55910(&qword_257706BF0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType);
}

uint64_t sub_247E57788()
{
  return sub_247E55910(&qword_257706BF8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType);
}

uint64_t sub_247E577B4()
{
  return sub_247E55910(&qword_257706B08, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType);
}

uint64_t sub_247E577E0()
{
  return sub_247E55910(&qword_257706C00, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_DType);
}

uint64_t sub_247E5780C()
{
  return sub_247E55910(&qword_257706C08, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec);
}

uint64_t sub_247E57838()
{
  return sub_247E55910(&qword_257706C10, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec);
}

uint64_t sub_247E57864()
{
  return sub_247E55910(&qword_257706B10, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec);
}

uint64_t sub_247E57890()
{
  return sub_247E55910(&qword_257706C18, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec);
}

uint64_t sub_247E578BC()
{
  return sub_247E55910(&qword_257706C20, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t sub_247E578E8()
{
  return sub_247E55910(&qword_257706C28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t sub_247E57914()
{
  return sub_247E55910(&qword_257706B18, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t sub_247E57940()
{
  return sub_247E55910(&qword_257706C30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
}

uint64_t sub_247E5796C()
{
  return sub_247E55910(&qword_25445A7C0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t sub_247E57998()
{
  return sub_247E55910(&qword_25445A7B8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t sub_247E579C4()
{
  return sub_247E55910(&qword_257706B20, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t sub_247E579F0()
{
  return sub_247E55910(&qword_257706C38, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
}

uint64_t sub_247E57A1C()
{
  return sub_247E55910(&qword_257706C40, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType);
}

uint64_t sub_247E57A48()
{
  return sub_247E55910(&qword_257706C48, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType);
}

uint64_t sub_247E57A74()
{
  return sub_247E55910(&qword_257706B28, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType);
}

uint64_t sub_247E57AA0()
{
  return sub_247E55910(&qword_257706C50, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType);
}

uint64_t sub_247E57ACC()
{
  return sub_247E55910(&qword_257706C58, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
}

uint64_t sub_247E57AF8()
{
  return sub_247E55910(&qword_257706C60, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
}

uint64_t sub_247E57B24()
{
  return sub_247E55910(&qword_257706B38, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
}

uint64_t sub_247E57B50()
{
  return sub_247E55910(&qword_257706C68, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec);
}

uint64_t sub_247E57B7C()
{
  return sub_247E55910(&qword_257706C70, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
}

uint64_t sub_247E57BA8()
{
  return sub_247E55910(&qword_257706B30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
}

uint64_t sub_247E57BD4()
{
  return sub_247E55910(&qword_257706B48, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
}

uint64_t sub_247E57C00()
{
  return sub_247E55910(&qword_257706C78, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec);
}

uint64_t sub_247E57C2C()
{
  return sub_247E55910(&qword_257706C80, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType);
}

uint64_t sub_247E57C58()
{
  return sub_247E55910(&qword_257706C88, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType);
}

uint64_t sub_247E57C84()
{
  return sub_247E55910(&qword_257706B50, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType);
}

uint64_t sub_247E57CB0()
{
  return sub_247E55910(&qword_257706C90, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType);
}

uint64_t sub_247E57CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247E4CD4C(a1, a2, a3, a4, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ComputationNode, &qword_25445A7A8);
}

uint64_t sub_247E57D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247E4DAB0(a1, a2, a3, a4, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, &qword_25445A7D8);
}

uint64_t sub_247E57D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247E4C788(a1, a2, a3, a4, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage, &qword_25445A708);
}

uint64_t sub_247E57D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247E4DAB0(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445AA58);
}

uint64_t sub_247E57DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247E4C788(a1, a2, a3, a4, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445A6A8);
}

uint64_t sub_247E57DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247E4CD4C(a1, a2, a3, a4, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec, &qword_25445A760);
}

uint64_t sub_247E57E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247E4DAB0(a1, a2, a3, a4, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec, &qword_257706AD0);
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  char *__dst;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    a1[1] = a2[1];
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_247E81DBC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 28);
    __dst = (char *)v7 + v13;
    v14 = (char *)a2 + v13;
    v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
      memcpy(__dst, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v12(__dst, v14, v11);
      v18 = *(int *)(v15 + 20);
      v19 = &__dst[v18];
      v20 = &v14[v18];
      v21 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
      v22 = *(_QWORD *)(v21 - 8);
      v72 = v12;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        v24 = *((_QWORD *)v20 + 1);
        *(_QWORD *)v19 = *(_QWORD *)v20;
        *((_QWORD *)v19 + 1) = v24;
        *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
        v19[24] = v20[24];
        v25 = *(int *)(v21 + 24);
        v70 = v16;
        v26 = &v19[v25];
        v27 = &v20[v25];
        swift_bridgeObjectRetain();
        v28 = v26;
        v16 = v70;
        v12(v28, v27, v11);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      }
      v29 = *(int *)(v15 + 24);
      v73 = &__dst[v29];
      v30 = &v14[v29];
      v31 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
      v32 = *((_QWORD *)v31 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v32 + 48))(v30, 1, v31))
      {
        v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
        memcpy(v73, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v69 = v32;
        v71 = v16;
        v12(v73, v30, v11);
        v34 = v31[5];
        v66 = &v73[v34];
        v35 = &v30[v34];
        v36 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
        v37 = *(_QWORD *)(v36 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
        {
          v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
          memcpy(v66, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
        }
        else
        {
          v39 = *((_QWORD *)v35 + 1);
          *(_QWORD *)v66 = *(_QWORD *)v35;
          *((_QWORD *)v66 + 1) = v39;
          v40 = *(int *)(v36 + 20);
          v65 = &v66[v40];
          v41 = &v35[v40];
          swift_bridgeObjectRetain();
          v72(v65, v41, v11);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v66, 0, 1, v36);
        }
        v42 = v31[6];
        v43 = &v73[v42];
        v44 = &v30[v42];
        v45 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
        v46 = *(_QWORD *)(v45 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
        {
          v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
          memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
          v48 = v72;
        }
        else
        {
          v49 = *((_QWORD *)v44 + 1);
          *(_QWORD *)v43 = *(_QWORD *)v44;
          *((_QWORD *)v43 + 1) = v49;
          v50 = *((_QWORD *)v44 + 3);
          *((_QWORD *)v43 + 2) = *((_QWORD *)v44 + 2);
          *((_QWORD *)v43 + 3) = v50;
          *((_QWORD *)v43 + 4) = *((_QWORD *)v44 + 4);
          v43[40] = v44[40];
          v51 = *(int *)(v45 + 28);
          v67 = &v43[v51];
          v52 = &v44[v51];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v53 = v52;
          v48 = v72;
          v72(v67, v53, v11);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
        }
        v54 = v31[7];
        v55 = &v73[v54];
        v56 = &v30[v54];
        v57 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
        v58 = *(_QWORD *)(v57 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v56, 1, v57))
        {
          v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
          memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
        }
        else
        {
          v60 = v48;
          v61 = *((_QWORD *)v56 + 1);
          *(_QWORD *)v55 = *(_QWORD *)v56;
          *((_QWORD *)v55 + 1) = v61;
          v62 = *(int *)(v57 + 24);
          v68 = &v55[v62];
          v63 = &v56[v62];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v60(v68, v63, v11);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v55, 0, 1, v57);
        }
        v16 = v71;
        (*(void (**)(char *, _QWORD, uint64_t, int *))(v69 + 56))(v73, 0, 1, v31);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
    }
  }
  return v7;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_247E81DBC();
  v19 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v19(v4, v5);
  v6 = a1 + *(int *)(a2 + 28);
  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    v19(v6, v5);
    v9 = v6 + *(int *)(v7 + 20);
    v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10))
    {
      swift_bridgeObjectRelease();
      v19(v9 + *(int *)(v10 + 24), v5);
    }
    v11 = v6 + *(int *)(v7 + 24);
    v12 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
    result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v12 - 1) + 48))(v11, 1, v12);
    if (!(_DWORD)result)
    {
      v19(v11, v5);
      v13 = v11 + v12[5];
      v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v13, 1, v14))
      {
        swift_bridgeObjectRelease();
        v19(v13 + *(int *)(v14 + 20), v5);
      }
      v15 = v11 + v12[6];
      v16 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v15, 1, v16))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v19(v15 + *(int *)(v16 + 28), v5);
      }
      v17 = v11 + v12[7];
      v18 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v17, 1, v18);
      if (!(_DWORD)result)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return ((uint64_t (*)(uint64_t, uint64_t))v19)(v17 + *(int *)(v18 + 24), v5);
      }
    }
  }
  return result;
}

_QWORD *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  char *__dst;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_247E81DBC();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 28);
  __dst = (char *)a1 + v12;
  v13 = (char *)a2 + v12;
  v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
    memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v11(__dst, v13, v10);
    v17 = *(int *)(v14 + 20);
    v18 = &__dst[v17];
    v19 = &v13[v17];
    v20 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
    v21 = *(_QWORD *)(v20 - 8);
    v72 = v11;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      v23 = *((_QWORD *)v19 + 1);
      *(_QWORD *)v18 = *(_QWORD *)v19;
      *((_QWORD *)v18 + 1) = v23;
      *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
      v18[24] = v19[24];
      v24 = *(int *)(v20 + 24);
      v70 = v15;
      v25 = &v18[v24];
      v26 = &v19[v24];
      swift_bridgeObjectRetain();
      v27 = v25;
      v15 = v70;
      v11(v27, v26, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    v28 = *(int *)(v14 + 24);
    v29 = &__dst[v28];
    v30 = &v13[v28];
    v31 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
    v32 = *((_QWORD *)v31 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v32 + 48))(v30, 1, v31))
    {
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    }
    else
    {
      v69 = v32;
      v71 = v15;
      v11(v29, v30, v10);
      v34 = v31[5];
      v35 = &v29[v34];
      v36 = &v30[v34];
      v37 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
      v38 = *(_QWORD *)(v37 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
      {
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
        memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      }
      else
      {
        v40 = *((_QWORD *)v36 + 1);
        *(_QWORD *)v35 = *(_QWORD *)v36;
        *((_QWORD *)v35 + 1) = v40;
        v41 = *(int *)(v37 + 20);
        v67 = &v35[v41];
        v42 = &v36[v41];
        swift_bridgeObjectRetain();
        v72(v67, v42, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
      }
      v43 = v31[6];
      v44 = &v29[v43];
      v45 = &v30[v43];
      v46 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
      v47 = *(_QWORD *)(v46 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
      {
        v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
        memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
        v49 = v72;
      }
      else
      {
        v50 = *((_QWORD *)v45 + 1);
        *(_QWORD *)v44 = *(_QWORD *)v45;
        *((_QWORD *)v44 + 1) = v50;
        v51 = *((_QWORD *)v45 + 3);
        *((_QWORD *)v44 + 2) = *((_QWORD *)v45 + 2);
        *((_QWORD *)v44 + 3) = v51;
        *((_QWORD *)v44 + 4) = *((_QWORD *)v45 + 4);
        v44[40] = v45[40];
        v52 = *(int *)(v46 + 28);
        v66 = &v44[v52];
        v53 = &v45[v52];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v54 = v53;
        v49 = v72;
        v72(v66, v54, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
      }
      v55 = v31[7];
      v56 = &v29[v55];
      v57 = &v30[v55];
      v58 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
      v59 = *(_QWORD *)(v58 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v57, 1, v58))
      {
        v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
        memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
      }
      else
      {
        v73 = v29;
        v61 = v49;
        v62 = *((_QWORD *)v57 + 1);
        *(_QWORD *)v56 = *(_QWORD *)v57;
        *((_QWORD *)v56 + 1) = v62;
        v63 = *(int *)(v58 + 24);
        v68 = &v56[v63];
        v64 = &v57[v63];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v61(v68, v64, v10);
        v29 = v73;
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
      }
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v69 + 56))(v29, 0, 1, v31);
      v15 = v71;
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
  }
  return a1;
}

_QWORD *assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, int *);
  int v18;
  void (*v19)(uint64_t, char *, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  void *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t, int *);
  int v67;
  int v68;
  void (*v69)(uint64_t, char *, uint64_t);
  uint64_t v70;
  _QWORD *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  void (*v96)(uint64_t, _QWORD, uint64_t, int *);
  uint64_t v97;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t (*v106)(char *, uint64_t, uint64_t);
  int v107;
  int v108;
  uint64_t v109;
  char *v110;
  char *v111;
  void (*v112)(char *, char *, uint64_t);
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  _QWORD *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  char *v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t (*v143)(char *, uint64_t, uint64_t);
  int v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  void (*v149)(char *, char *, uint64_t);
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t (*v157)(char *, uint64_t, uint64_t);
  int v158;
  int v159;
  uint64_t v160;
  char *v161;
  char *v162;
  void (*v163)(char *, char *, uint64_t);
  uint64_t v164;
  char *v165;
  char *v166;
  char *v167;
  uint64_t v168;
  char *v169;
  char *v170;
  void (*v171)(char *, char *, uint64_t);
  void (*v172)(char *, char *, uint64_t);
  void (*v173)(uint64_t, char *, uint64_t);
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 28);
  v13 = (uint64_t)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  v16 = *((_QWORD *)v15 - 1);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v16 + 48);
  LODWORD(v8) = v17(v13, 1, v15);
  v18 = v17((uint64_t)v14, 1, v15);
  if ((_DWORD)v8)
  {
    if (!v18)
    {
      v174 = v16;
      v19 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 16);
      v19(v13, v14, v9);
      v20 = v15[5];
      v21 = (_QWORD *)(v13 + v20);
      v22 = &v14[v20];
      v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
      v24 = *(_QWORD *)(v23 - 8);
      v171 = (void (*)(char *, char *, uint64_t))v19;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
      {
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
        memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      }
      else
      {
        *v21 = *(_QWORD *)v22;
        v21[1] = *((_QWORD *)v22 + 1);
        v44 = *((_QWORD *)v22 + 2);
        *((_BYTE *)v21 + 24) = v22[24];
        v21[2] = v44;
        v45 = *(int *)(v23 + 24);
        v178 = v9;
        v46 = (char *)v21 + v45;
        v47 = &v22[v45];
        swift_bridgeObjectRetain();
        v48 = v46;
        v9 = v178;
        v19((uint64_t)v48, v47, v178);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      }
      v49 = v174;
      v50 = v15[6];
      v51 = (char *)(v13 + v50);
      v52 = &v14[v50];
      v53 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
      v54 = *((_QWORD *)v53 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v54 + 48))(v52, 1, v53))
      {
        v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
        memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
      }
      else
      {
        v168 = v54;
        v171(v51, v52, v9);
        v56 = v53[5];
        v169 = v51;
        v57 = &v51[v56];
        v179 = v9;
        v58 = &v52[v56];
        v59 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
        v60 = *(_QWORD *)(v59 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48))(v58, 1, v59))
        {
          v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
          memcpy(v57, v58, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
        }
        else
        {
          *(_QWORD *)v57 = *(_QWORD *)v58;
          *((_QWORD *)v57 + 1) = *((_QWORD *)v58 + 1);
          v76 = *(int *)(v59 + 20);
          v165 = &v57[v76];
          v77 = &v58[v76];
          swift_bridgeObjectRetain();
          v171(v165, v77, v179);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v60 + 56))(v57, 0, 1, v59);
        }
        v78 = v53[6];
        v79 = &v169[v78];
        v80 = &v52[v78];
        v81 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
        v82 = *(_QWORD *)(v81 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v80, 1, v81))
        {
          v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
          memcpy(v79, v80, *(_QWORD *)(*(_QWORD *)(v83 - 8) + 64));
        }
        else
        {
          *(_QWORD *)v79 = *(_QWORD *)v80;
          *((_QWORD *)v79 + 1) = *((_QWORD *)v80 + 1);
          *((_QWORD *)v79 + 2) = *((_QWORD *)v80 + 2);
          *((_QWORD *)v79 + 3) = *((_QWORD *)v80 + 3);
          v84 = *((_QWORD *)v80 + 4);
          v79[40] = v80[40];
          *((_QWORD *)v79 + 4) = v84;
          v85 = *(int *)(v81 + 28);
          v166 = &v79[v85];
          v86 = &v80[v85];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v171(v166, v86, v179);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v82 + 56))(v79, 0, 1, v81);
        }
        v87 = v53[7];
        v88 = v169;
        v89 = &v169[v87];
        v90 = &v52[v87];
        v91 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
        v92 = *(_QWORD *)(v91 - 8);
        v49 = v174;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v92 + 48))(v90, 1, v91))
        {
          v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
          memcpy(v89, v90, *(_QWORD *)(*(_QWORD *)(v93 - 8) + 64));
        }
        else
        {
          *(_QWORD *)v89 = *(_QWORD *)v90;
          *((_QWORD *)v89 + 1) = *((_QWORD *)v90 + 1);
          v94 = *(int *)(v91 + 24);
          v167 = &v89[v94];
          v95 = &v90[v94];
          swift_bridgeObjectRetain();
          v88 = v169;
          v49 = v174;
          swift_bridgeObjectRetain();
          v171(v167, v95, v179);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v92 + 56))(v89, 0, 1, v91);
        }
        (*(void (**)(char *, _QWORD, uint64_t, int *))(v168 + 56))(v88, 0, 1, v53);
      }
      v96 = *(void (**)(uint64_t, _QWORD, uint64_t, int *))(v49 + 56);
      v97 = v13;
LABEL_37:
      v96(v97, 0, 1, v15);
      return a1;
    }
    goto LABEL_7;
  }
  if (!v18)
  {
    v175 = v10;
    v177 = v9;
    v172 = v11;
    v11((char *)v13, v14, v9);
    v29 = v15[5];
    v30 = (char *)(v13 + v29);
    v31 = &v14[v29];
    v32 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
    v33 = *(_QWORD *)(v32 - 8);
    v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
    v35 = v34(v30, 1, v32);
    v36 = v34(v31, 1, v32);
    if (v35)
    {
      if (!v36)
      {
        *(_QWORD *)v30 = *(_QWORD *)v31;
        *((_QWORD *)v30 + 1) = *((_QWORD *)v31 + 1);
        v37 = *((_QWORD *)v31 + 2);
        v30[24] = v31[24];
        *((_QWORD *)v30 + 2) = v37;
        v38 = *(int *)(v32 + 24);
        v39 = &v30[v38];
        v40 = &v31[v38];
        v41 = *(void (**)(char *, char *, uint64_t))(v175 + 16);
        swift_bridgeObjectRetain();
        v42 = v39;
        v43 = v177;
        v41(v42, v40, v177);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
        goto LABEL_21;
      }
    }
    else
    {
      if (!v36)
      {
        *(_QWORD *)v30 = *(_QWORD *)v31;
        *((_QWORD *)v30 + 1) = *((_QWORD *)v31 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v99 = *((_QWORD *)v31 + 2);
        v30[24] = v31[24];
        *((_QWORD *)v30 + 2) = v99;
        v43 = v177;
        v172(&v30[*(int *)(v32 + 24)], &v31[*(int *)(v32 + 24)], v177);
LABEL_21:
        v63 = v15[6];
        v64 = v13 + v63;
        v14 += v63;
        v15 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
        v65 = *((_QWORD *)v15 - 1);
        v66 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v65 + 48);
        v67 = v66(v64, 1, v15);
        v68 = v66((uint64_t)v14, 1, v15);
        if (v67)
        {
          if (!v68)
          {
            v69 = *(void (**)(uint64_t, char *, uint64_t))(v175 + 16);
            v69(v64, v14, v43);
            v70 = v15[5];
            v176 = v64;
            v71 = (_QWORD *)(v64 + v70);
            v72 = &v14[v70];
            v73 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
            v74 = *(_QWORD *)(v73 - 8);
            v173 = v69;
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48))(v72, 1, v73))
            {
              v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
              memcpy(v71, v72, *(_QWORD *)(*(_QWORD *)(v75 - 8) + 64));
            }
            else
            {
              *v71 = *(_QWORD *)v72;
              v71[1] = *((_QWORD *)v72 + 1);
              v113 = *(int *)(v73 + 20);
              v114 = (char *)v71 + v113;
              v115 = &v72[v113];
              swift_bridgeObjectRetain();
              v69((uint64_t)v114, v115, v177);
              (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v74 + 56))(v71, 0, 1, v73);
            }
            v116 = v15[6];
            v117 = (_QWORD *)(v176 + v116);
            v118 = &v14[v116];
            v119 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
            v120 = *(_QWORD *)(v119 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v120 + 48))(v118, 1, v119))
            {
              v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
              memcpy(v117, v118, *(_QWORD *)(*(_QWORD *)(v121 - 8) + 64));
            }
            else
            {
              *v117 = *(_QWORD *)v118;
              v117[1] = *((_QWORD *)v118 + 1);
              v117[2] = *((_QWORD *)v118 + 2);
              v117[3] = *((_QWORD *)v118 + 3);
              v122 = *((_QWORD *)v118 + 4);
              *((_BYTE *)v117 + 40) = v118[40];
              v117[4] = v122;
              v123 = *(int *)(v119 + 28);
              v124 = (char *)v117 + v123;
              v125 = &v118[v123];
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v126 = v124;
              v69 = v173;
              v173((uint64_t)v126, v125, v177);
              (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v120 + 56))(v117, 0, 1, v119);
            }
            v127 = v15[7];
            v128 = v176;
            v129 = (_QWORD *)(v176 + v127);
            v130 = &v14[v127];
            v131 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
            v132 = *(_QWORD *)(v131 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v132 + 48))(v130, 1, v131))
            {
              v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
              memcpy(v129, v130, *(_QWORD *)(*(_QWORD *)(v133 - 8) + 64));
            }
            else
            {
              *v129 = *(_QWORD *)v130;
              v129[1] = *((_QWORD *)v130 + 1);
              v134 = *(int *)(v131 + 24);
              v135 = (char *)v129 + v134;
              v136 = &v130[v134];
              swift_bridgeObjectRetain();
              v128 = v176;
              swift_bridgeObjectRetain();
              v69((uint64_t)v135, v136, v177);
              (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v132 + 56))(v129, 0, 1, v131);
            }
            v96 = *(void (**)(uint64_t, _QWORD, uint64_t, int *))(v65 + 56);
            v97 = v128;
            goto LABEL_37;
          }
          goto LABEL_27;
        }
        if (v68)
        {
          sub_247E4C978(v64, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
LABEL_27:
          v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A708) - 8) + 64);
          v27 = (void *)v64;
          goto LABEL_8;
        }
        v172((char *)v64, v14, v43);
        v100 = v15[5];
        v101 = v64;
        v102 = (char *)(v64 + v100);
        v103 = &v14[v100];
        v104 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
        v105 = *(_QWORD *)(v104 - 8);
        v106 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v105 + 48);
        v107 = v106(v102, 1, v104);
        v108 = v106(v103, 1, v104);
        if (v107)
        {
          if (!v108)
          {
            *(_QWORD *)v102 = *(_QWORD *)v103;
            *((_QWORD *)v102 + 1) = *((_QWORD *)v103 + 1);
            v109 = *(int *)(v104 + 20);
            v110 = &v102[v109];
            v111 = &v103[v109];
            v112 = *(void (**)(char *, char *, uint64_t))(v175 + 16);
            swift_bridgeObjectRetain();
            v112(v110, v111, v177);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v105 + 56))(v102, 0, 1, v104);
            goto LABEL_54;
          }
        }
        else
        {
          if (!v108)
          {
            *(_QWORD *)v102 = *(_QWORD *)v103;
            *((_QWORD *)v102 + 1) = *((_QWORD *)v103 + 1);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v172(&v102[*(int *)(v104 + 20)], &v103[*(int *)(v104 + 20)], v177);
LABEL_54:
            v138 = v15[6];
            v139 = (char *)(v101 + v138);
            v140 = &v14[v138];
            v141 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
            v142 = *(_QWORD *)(v141 - 8);
            v143 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v142 + 48);
            v144 = v143(v139, 1, v141);
            v145 = v143(v140, 1, v141);
            if (v144)
            {
              if (!v145)
              {
                *(_QWORD *)v139 = *(_QWORD *)v140;
                *((_QWORD *)v139 + 1) = *((_QWORD *)v140 + 1);
                *((_QWORD *)v139 + 2) = *((_QWORD *)v140 + 2);
                *((_QWORD *)v139 + 3) = *((_QWORD *)v140 + 3);
                v146 = *((_QWORD *)v140 + 4);
                v139[40] = v140[40];
                *((_QWORD *)v139 + 4) = v146;
                v147 = *(int *)(v141 + 28);
                v170 = &v139[v147];
                v148 = &v140[v147];
                v149 = *(void (**)(char *, char *, uint64_t))(v175 + 16);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                v150 = v177;
                v149(v170, v148, v177);
                (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v142 + 56))(v139, 0, 1, v141);
LABEL_60:
                v152 = v15[7];
                v153 = (char *)(v101 + v152);
                v154 = &v14[v152];
                v155 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
                v156 = *(_QWORD *)(v155 - 8);
                v157 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v156 + 48);
                v158 = v157(v153, 1, v155);
                v159 = v157(v154, 1, v155);
                if (v158)
                {
                  if (!v159)
                  {
                    *(_QWORD *)v153 = *(_QWORD *)v154;
                    *((_QWORD *)v153 + 1) = *((_QWORD *)v154 + 1);
                    v160 = *(int *)(v155 + 24);
                    v161 = &v153[v160];
                    v162 = &v154[v160];
                    v163 = *(void (**)(char *, char *, uint64_t))(v175 + 16);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    v163(v161, v162, v150);
                    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v156 + 56))(v153, 0, 1, v155);
                    return a1;
                  }
                }
                else
                {
                  if (!v159)
                  {
                    *(_QWORD *)v153 = *(_QWORD *)v154;
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRelease();
                    *((_QWORD *)v153 + 1) = *((_QWORD *)v154 + 1);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRelease();
                    v172(&v153[*(int *)(v155 + 24)], &v154[*(int *)(v155 + 24)], v150);
                    return a1;
                  }
                  sub_247E4C978((uint64_t)v153, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
                }
                v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A760) - 8)
                                + 64);
                v27 = v153;
                v28 = v154;
                goto LABEL_9;
              }
            }
            else
            {
              if (!v145)
              {
                *(_QWORD *)v139 = *(_QWORD *)v140;
                *((_QWORD *)v139 + 1) = *((_QWORD *)v140 + 1);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                *((_QWORD *)v139 + 2) = *((_QWORD *)v140 + 2);
                *((_QWORD *)v139 + 3) = *((_QWORD *)v140 + 3);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                v164 = *((_QWORD *)v140 + 4);
                v139[40] = v140[40];
                *((_QWORD *)v139 + 4) = v164;
                v150 = v177;
                v172(&v139[*(int *)(v141 + 28)], &v140[*(int *)(v141 + 28)], v177);
                goto LABEL_60;
              }
              sub_247E4C978((uint64_t)v139, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
            }
            v151 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
            memcpy(v139, v140, *(_QWORD *)(*(_QWORD *)(v151 - 8) + 64));
            v150 = v177;
            goto LABEL_60;
          }
          sub_247E4C978((uint64_t)v102, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
        }
        v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
        memcpy(v102, v103, *(_QWORD *)(*(_QWORD *)(v137 - 8) + 64));
        goto LABEL_54;
      }
      sub_247E4C978((uint64_t)v30, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
    }
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
    v43 = v177;
    goto LABEL_21;
  }
  sub_247E4C978(v13, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
LABEL_7:
  v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8) - 8) + 64);
  v27 = (void *)v13;
LABEL_8:
  v28 = v14;
LABEL_9:
  memcpy(v27, v28, v26);
  return a1;
}

_OWORD *initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, char *, uint64_t);
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  void (*v54)(char *, char *, uint64_t);
  char *v55;

  *a1 = *a2;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 28);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v9);
    v17 = *(int *)(v14 + 20);
    v55 = v12;
    v18 = &v12[v17];
    v19 = v10;
    v20 = &v13[v17];
    v21 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
    v22 = *(_QWORD *)(v21 - 8);
    v54 = v19;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
      memcpy(v18, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      *(_OWORD *)v18 = *(_OWORD *)v20;
      *((_QWORD *)v18 + 2) = *((_QWORD *)v20 + 2);
      v18[24] = v20[24];
      v19(&v18[*(int *)(v21 + 24)], &v20[*(int *)(v21 + 24)], v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v18, 0, 1, v21);
    }
    v24 = *(int *)(v14 + 24);
    v25 = v55;
    v26 = &v55[v24];
    v27 = &v13[v24];
    v28 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
    v29 = *((_QWORD *)v28 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v29 + 48))(v27, 1, v28))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      v51 = v29;
      v52 = v15;
      v54(v26, v27, v9);
      v31 = v28[5];
      v53 = v26;
      v32 = &v26[v31];
      v33 = &v27[v31];
      v34 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
      v35 = *(_QWORD *)(v34 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
      {
        v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
        memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      }
      else
      {
        *(_OWORD *)v32 = *(_OWORD *)v33;
        v54(&v32[*(int *)(v34 + 20)], &v33[*(int *)(v34 + 20)], v9);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      }
      v37 = v28[6];
      v38 = &v53[v37];
      v39 = &v27[v37];
      v40 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
      v41 = *(_QWORD *)(v40 - 8);
      v25 = v55;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
      {
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
        memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
      }
      else
      {
        v43 = *((_OWORD *)v39 + 1);
        *(_OWORD *)v38 = *(_OWORD *)v39;
        *((_OWORD *)v38 + 1) = v43;
        *((_QWORD *)v38 + 4) = *((_QWORD *)v39 + 4);
        v38[40] = v39[40];
        v54(&v38[*(int *)(v40 + 28)], &v39[*(int *)(v40 + 28)], v9);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
      }
      v15 = v52;
      v44 = v28[7];
      v45 = &v53[v44];
      v46 = &v27[v44];
      v47 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
      v48 = *(_QWORD *)(v47 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v46, 1, v47))
      {
        v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
        memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
      }
      else
      {
        *(_OWORD *)v45 = *(_OWORD *)v46;
        v54(&v45[*(int *)(v47 + 24)], &v46[*(int *)(v47 + 24)], v9);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
      }
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v51 + 56))(v53, 0, 1, v28);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v25, 0, 1, v14);
  }
  return a1;
}

_QWORD *assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ComputationNode(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, int *);
  int v18;
  void (*v19)(uint64_t, char *, uint64_t);
  uint64_t v20;
  _OWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  size_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(char *, uint64_t, uint64_t);
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  int *v45;
  uint64_t v46;
  size_t v47;
  void *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t, int *);
  int v59;
  int v60;
  void (*v61)(uint64_t, char *, uint64_t);
  uint64_t v62;
  _OWORD *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t (*v89)(char *, uint64_t, uint64_t);
  int v90;
  int v91;
  uint64_t v92;
  _OWORD *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  uint64_t v99;
  _OWORD *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t (*v110)(char *, uint64_t, uint64_t);
  int v111;
  int v112;
  uint64_t v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t, uint64_t);
  int v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *__dst;
  char *v129;
  void (*v130)(char *, char *, uint64_t);
  void (*v131)(uint64_t, char *, uint64_t);
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 40);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 28);
  v13 = (uint64_t)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(0);
  v16 = *((_QWORD *)v15 - 1);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v16 + 48);
  LODWORD(v8) = v17(v13, 1, v15);
  v18 = v17((uint64_t)v14, 1, v15);
  if ((_DWORD)v8)
  {
    if (!v18)
    {
      v134 = v16;
      v19 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
      v19(v13, v14, v9);
      v20 = v15[5];
      v21 = (_OWORD *)(v13 + v20);
      v22 = &v14[v20];
      v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
      v24 = *(_QWORD *)(v23 - 8);
      v130 = (void (*)(char *, char *, uint64_t))v19;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
      {
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
        memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      }
      else
      {
        *v21 = *(_OWORD *)v22;
        *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
        *((_BYTE *)v21 + 24) = v22[24];
        v19((uint64_t)v21 + *(int *)(v23 + 24), &v22[*(int *)(v23 + 24)], v9);
        (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      }
      v41 = v134;
      v42 = v15[6];
      v43 = (char *)(v13 + v42);
      v44 = &v14[v42];
      v45 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
      v46 = *((_QWORD *)v45 - 1);
      if (!(*(unsigned int (**)(char *, uint64_t, int *))(v46 + 48))(v44, 1, v45))
      {
        v127 = v46;
        v130(v43, v44, v9);
        v50 = v45[5];
        __dst = &v43[v50];
        v129 = v43;
        v51 = &v44[v50];
        v52 = v9;
        v53 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
        v54 = *(_QWORD *)(v53 - 8);
        v133 = v52;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v51, 1, v53))
        {
          v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
          memcpy(__dst, v51, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
        }
        else
        {
          *(_OWORD *)__dst = *(_OWORD *)v51;
          v130(&__dst[*(int *)(v53 + 20)], &v51[*(int *)(v53 + 20)], v52);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(__dst, 0, 1, v53);
        }
        v68 = v45[6];
        v69 = &v129[v68];
        v70 = &v44[v68];
        v71 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
        v72 = *(_QWORD *)(v71 - 8);
        v41 = v134;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71))
        {
          v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
          memcpy(v69, v70, *(_QWORD *)(*(_QWORD *)(v73 - 8) + 64));
        }
        else
        {
          v74 = *((_OWORD *)v70 + 1);
          *(_OWORD *)v69 = *(_OWORD *)v70;
          *((_OWORD *)v69 + 1) = v74;
          *((_QWORD *)v69 + 4) = *((_QWORD *)v70 + 4);
          v69[40] = v70[40];
          v130(&v69[*(int *)(v71 + 28)], &v70[*(int *)(v71 + 28)], v133);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
        }
        v75 = v45[7];
        v76 = &v129[v75];
        v77 = &v44[v75];
        v78 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
        v79 = *(_QWORD *)(v78 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48))(v77, 1, v78))
        {
          v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
          memcpy(v76, v77, *(_QWORD *)(*(_QWORD *)(v80 - 8) + 64));
        }
        else
        {
          *(_OWORD *)v76 = *(_OWORD *)v77;
          v130(&v76[*(int *)(v78 + 24)], &v77[*(int *)(v78 + 24)], v133);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v79 + 56))(v76, 0, 1, v78);
        }
        (*(void (**)(char *, _QWORD, uint64_t, int *))(v127 + 56))(v129, 0, 1, v45);
        goto LABEL_38;
      }
      v47 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A708) - 8) + 64);
      v48 = v43;
      v49 = v44;
      goto LABEL_16;
    }
    goto LABEL_7;
  }
  if (!v18)
  {
    v132 = v9;
    v135 = v10;
    v131 = (void (*)(uint64_t, char *, uint64_t))v11;
    v11((char *)v13, v14, v9);
    v30 = v15[5];
    v31 = (char *)(v13 + v30);
    v32 = &v14[v30];
    v33 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
    v34 = *(_QWORD *)(v33 - 8);
    v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48);
    v36 = v35(v31, 1, v33);
    v37 = v35(v32, 1, v33);
    if (v36)
    {
      if (!v37)
      {
        *(_OWORD *)v31 = *(_OWORD *)v32;
        *((_QWORD *)v31 + 2) = *((_QWORD *)v32 + 2);
        v31[24] = v32[24];
        v39 = v132;
        v38 = v135;
        (*(void (**)(char *, char *, uint64_t))(v135 + 32))(&v31[*(int *)(v33 + 24)], &v32[*(int *)(v33 + 24)], v132);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
        v40 = v131;
        goto LABEL_23;
      }
    }
    else
    {
      if (!v37)
      {
        v82 = *((_QWORD *)v32 + 1);
        *(_QWORD *)v31 = *(_QWORD *)v32;
        *((_QWORD *)v31 + 1) = v82;
        swift_bridgeObjectRelease();
        *((_QWORD *)v31 + 2) = *((_QWORD *)v32 + 2);
        v31[24] = v32[24];
        v83 = *(int *)(v33 + 24);
        v40 = v131;
        v39 = v132;
        v131((uint64_t)&v31[v83], &v32[v83], v132);
        goto LABEL_22;
      }
      sub_247E4C978((uint64_t)v31, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
    }
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
    v40 = v131;
    v39 = v132;
LABEL_22:
    v38 = v135;
LABEL_23:
    v57 = v15[6];
    v13 += v57;
    v14 += v57;
    v15 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
    v41 = *((_QWORD *)v15 - 1);
    v58 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v41 + 48);
    v59 = v58(v13, 1, v15);
    v60 = v58((uint64_t)v14, 1, v15);
    if (v59)
    {
      if (!v60)
      {
        v61 = *(void (**)(uint64_t, char *, uint64_t))(v38 + 32);
        v61(v13, v14, v39);
        v62 = v15[5];
        v63 = (_OWORD *)(v13 + v62);
        v64 = &v14[v62];
        v65 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
        v66 = *(_QWORD *)(v65 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v64, 1, v65))
        {
          v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
          memcpy(v63, v64, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
        }
        else
        {
          *v63 = *(_OWORD *)v64;
          v61((uint64_t)v63 + *(int *)(v65 + 20), &v64[*(int *)(v65 + 20)], v132);
          (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v63, 0, 1, v65);
        }
        v92 = v15[6];
        v93 = (_OWORD *)(v13 + v92);
        v94 = &v14[v92];
        v95 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
        v96 = *(_QWORD *)(v95 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v96 + 48))(v94, 1, v95))
        {
          v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
          memcpy(v93, v94, *(_QWORD *)(*(_QWORD *)(v97 - 8) + 64));
        }
        else
        {
          v98 = *((_OWORD *)v94 + 1);
          *v93 = *(_OWORD *)v94;
          v93[1] = v98;
          *((_QWORD *)v93 + 4) = *((_QWORD *)v94 + 4);
          *((_BYTE *)v93 + 40) = v94[40];
          v61((uint64_t)v93 + *(int *)(v95 + 28), &v94[*(int *)(v95 + 28)], v132);
          (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v96 + 56))(v93, 0, 1, v95);
        }
        v99 = v15[7];
        v100 = (_OWORD *)(v13 + v99);
        v101 = &v14[v99];
        v102 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
        v103 = *(_QWORD *)(v102 - 8);
        if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v103 + 48))(v101, 1, v102))
        {
          *v100 = *(_OWORD *)v101;
          v61((uint64_t)v100 + *(int *)(v102 + 24), &v101[*(int *)(v102 + 24)], v132);
          (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v103 + 56))(v100, 0, 1, v102);
          goto LABEL_38;
        }
        v47 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A760) - 8) + 64);
        v48 = v100;
        v49 = v101;
LABEL_16:
        memcpy(v48, v49, v47);
LABEL_38:
        (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v41 + 56))(v13, 0, 1, v15);
        return a1;
      }
      goto LABEL_29;
    }
    if (v60)
    {
      sub_247E4C978(v13, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
LABEL_29:
      v26 = &qword_25445A708;
      goto LABEL_8;
    }
    v40(v13, v14, v39);
    v84 = v15[5];
    v85 = (char *)(v13 + v84);
    v86 = &v14[v84];
    v87 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
    v88 = *(_QWORD *)(v87 - 8);
    v89 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 48);
    v90 = v89(v85, 1, v87);
    v91 = v89(v86, 1, v87);
    if (v90)
    {
      if (!v91)
      {
        *(_OWORD *)v85 = *(_OWORD *)v86;
        (*(void (**)(char *, char *, uint64_t))(v135 + 32))(&v85[*(int *)(v87 + 20)], &v86[*(int *)(v87 + 20)], v132);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v88 + 56))(v85, 0, 1, v87);
        goto LABEL_54;
      }
    }
    else
    {
      if (!v91)
      {
        v124 = *((_QWORD *)v86 + 1);
        *(_QWORD *)v85 = *(_QWORD *)v86;
        *((_QWORD *)v85 + 1) = v124;
        swift_bridgeObjectRelease();
        v131((uint64_t)&v85[*(int *)(v87 + 20)], &v86[*(int *)(v87 + 20)], v132);
LABEL_54:
        v105 = v15[6];
        v106 = (char *)(v13 + v105);
        v107 = &v14[v105];
        v108 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
        v109 = *(_QWORD *)(v108 - 8);
        v110 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v109 + 48);
        v111 = v110(v106, 1, v108);
        v112 = v110(v107, 1, v108);
        if (v111)
        {
          v113 = v132;
          if (!v112)
          {
            v114 = *((_OWORD *)v107 + 1);
            *(_OWORD *)v106 = *(_OWORD *)v107;
            *((_OWORD *)v106 + 1) = v114;
            *((_QWORD *)v106 + 4) = *((_QWORD *)v107 + 4);
            v106[40] = v107[40];
            (*(void (**)(char *, char *, uint64_t))(v135 + 32))(&v106[*(int *)(v108 + 28)], &v107[*(int *)(v108 + 28)], v132);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v109 + 56))(v106, 0, 1, v108);
LABEL_60:
            v116 = v15[7];
            v117 = v13 + v116;
            v118 = &v14[v116];
            v119 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
            v120 = *(_QWORD *)(v119 - 8);
            v121 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v120 + 48);
            v122 = v121(v117, 1, v119);
            v123 = v121((uint64_t)v118, 1, v119);
            if (v122)
            {
              if (!v123)
              {
                *(_OWORD *)v117 = *(_OWORD *)v118;
                (*(void (**)(uint64_t, char *, uint64_t))(v135 + 32))(v117 + *(int *)(v119 + 24), &v118[*(int *)(v119 + 24)], v113);
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v120 + 56))(v117, 0, 1, v119);
                return a1;
              }
            }
            else
            {
              if (!v123)
              {
                *(_QWORD *)v117 = *(_QWORD *)v118;
                swift_bridgeObjectRelease();
                *(_QWORD *)(v117 + 8) = *((_QWORD *)v118 + 1);
                swift_bridgeObjectRelease();
                v131(v117 + *(int *)(v119 + 24), &v118[*(int *)(v119 + 24)], v113);
                return a1;
              }
              sub_247E4C978(v117, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
            }
            v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A760) - 8) + 64);
            v28 = (void *)v117;
            v29 = v118;
            goto LABEL_9;
          }
        }
        else
        {
          v113 = v132;
          if (!v112)
          {
            v125 = *((_QWORD *)v107 + 1);
            *(_QWORD *)v106 = *(_QWORD *)v107;
            *((_QWORD *)v106 + 1) = v125;
            swift_bridgeObjectRelease();
            v126 = *((_QWORD *)v107 + 3);
            *((_QWORD *)v106 + 2) = *((_QWORD *)v107 + 2);
            *((_QWORD *)v106 + 3) = v126;
            swift_bridgeObjectRelease();
            *((_QWORD *)v106 + 4) = *((_QWORD *)v107 + 4);
            v106[40] = v107[40];
            v131((uint64_t)&v106[*(int *)(v108 + 28)], &v107[*(int *)(v108 + 28)], v132);
            goto LABEL_60;
          }
          sub_247E4C978((uint64_t)v106, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
        }
        v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
        memcpy(v106, v107, *(_QWORD *)(*(_QWORD *)(v115 - 8) + 64));
        goto LABEL_60;
      }
      sub_247E4C978((uint64_t)v85, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
    }
    v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    memcpy(v85, v86, *(_QWORD *)(*(_QWORD *)(v104 - 8) + 64));
    goto LABEL_54;
  }
  sub_247E4C978(v13, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
LABEL_7:
  v26 = &qword_25445A7A8;
LABEL_8:
  v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(v26) - 8) + 64);
  v28 = (void *)v13;
  v29 = v14;
LABEL_9:
  memcpy(v28, v29, v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ComputationNode()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5A558(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ComputationNode()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_247E5A608(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7A8);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_247E5A6A8()
{
  unint64_t v0;
  unint64_t v1;

  sub_247E81DBC();
  if (v0 <= 0x3F)
  {
    sub_247E5C5C4(319, &qword_25445A7B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelPackage);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v56;
  char *v57;
  void (*v58)(char *, char *, uint64_t);
  uint64_t v59;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247E81DBC();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8((char *)a1, (char *)a2, v7);
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v16 = v11[1];
      *v10 = *v11;
      v10[1] = v16;
      v10[2] = v11[2];
      *((_BYTE *)v10 + 24) = *((_BYTE *)v11 + 24);
      v17 = *(int *)(v12 + 24);
      v18 = (char *)v10 + v17;
      v19 = (char *)v11 + v17;
      swift_bridgeObjectRetain();
      v8(v18, v19, v7);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v20 = *(int *)(a3 + 24);
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    v23 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
    v24 = *((_QWORD *)v23 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v24 + 48))(v22, 1, v23))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      v59 = v24;
      v8(v21, v22, v7);
      v26 = v23[5];
      v27 = &v21[v26];
      v28 = &v22[v26];
      v29 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
      v30 = *(_QWORD *)(v29 - 8);
      v58 = v8;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
      {
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
        memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
      }
      else
      {
        v32 = *((_QWORD *)v28 + 1);
        *(_QWORD *)v27 = *(_QWORD *)v28;
        *((_QWORD *)v27 + 1) = v32;
        v33 = *(int *)(v29 + 20);
        v56 = &v27[v33];
        v34 = &v28[v33];
        swift_bridgeObjectRetain();
        v8(v56, v34, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
      }
      v35 = v23[6];
      v36 = &v21[v35];
      v37 = &v22[v35];
      v38 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
      v39 = *(_QWORD *)(v38 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
      {
        v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
        memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
      }
      else
      {
        v41 = *((_QWORD *)v37 + 1);
        *(_QWORD *)v36 = *(_QWORD *)v37;
        *((_QWORD *)v36 + 1) = v41;
        v42 = *((_QWORD *)v37 + 3);
        *((_QWORD *)v36 + 2) = *((_QWORD *)v37 + 2);
        *((_QWORD *)v36 + 3) = v42;
        *((_QWORD *)v36 + 4) = *((_QWORD *)v37 + 4);
        v36[40] = v37[40];
        v43 = *(int *)(v38 + 28);
        v57 = &v36[v43];
        v44 = &v37[v43];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v58(v57, v44, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
      }
      v45 = v23[7];
      v46 = &v21[v45];
      v47 = &v22[v45];
      v48 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
      v49 = *(_QWORD *)(v48 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v47, 1, v48))
      {
        v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
        memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
      }
      else
      {
        v51 = *((_QWORD *)v47 + 1);
        *(_QWORD *)v46 = *(_QWORD *)v47;
        *((_QWORD *)v46 + 1) = v51;
        v52 = *(int *)(v48 + 24);
        v53 = &v46[v52];
        v54 = &v47[v52];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v58(v53, v54, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
      }
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v59 + 56))(v21, 0, 1, v23);
    }
  }
  return a1;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);

  v4 = sub_247E81DBC();
  v16 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v16(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
  {
    swift_bridgeObjectRelease();
    v16(v5 + *(int *)(v6 + 24), v4);
  }
  v7 = a1 + *(int *)(a2 + 24);
  v8 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v8 - 1) + 48))(v7, 1, v8);
  if (!(_DWORD)result)
  {
    v16(v7, v4);
    v10 = v7 + v8[5];
    v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
    {
      swift_bridgeObjectRelease();
      v16(v10 + *(int *)(v11 + 20), v4);
    }
    v12 = v7 + v8[6];
    v13 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 1, v13))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v16(v12 + *(int *)(v13 + 28), v4);
    }
    v14 = v7 + v8[7];
    v15 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v14, 1, v15);
    if (!(_DWORD)result)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(uint64_t, uint64_t))v16)(v14 + *(int *)(v15 + 24), v4);
    }
  }
  return result;
}

uint64_t initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v54;
  char *v55;
  void (*v56)(char *, char *, uint64_t);
  uint64_t v57;

  v6 = sub_247E81DBC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = v10[1];
    *v9 = *v10;
    v9[1] = v14;
    v9[2] = v10[2];
    *((_BYTE *)v9 + 24) = *((_BYTE *)v10 + 24);
    v15 = *(int *)(v11 + 24);
    v16 = (char *)v9 + v15;
    v17 = (char *)v10 + v15;
    swift_bridgeObjectRetain();
    v7((uint64_t)v16, (uint64_t)v17, v6);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v18 = *(int *)(a3 + 24);
  v19 = (char *)(a1 + v18);
  v20 = (char *)(a2 + v18);
  v21 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  v22 = *((_QWORD *)v21 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    v57 = v22;
    v7((uint64_t)v19, (uint64_t)v20, v6);
    v24 = v21[5];
    v25 = &v19[v24];
    v26 = &v20[v24];
    v27 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
    v28 = *(_QWORD *)(v27 - 8);
    v56 = (void (*)(char *, char *, uint64_t))v7;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    }
    else
    {
      v30 = *((_QWORD *)v26 + 1);
      *(_QWORD *)v25 = *(_QWORD *)v26;
      *((_QWORD *)v25 + 1) = v30;
      v31 = *(int *)(v27 + 20);
      v54 = &v25[v31];
      v32 = &v26[v31];
      swift_bridgeObjectRetain();
      v7((uint64_t)v54, (uint64_t)v32, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    v33 = v21[6];
    v34 = &v19[v33];
    v35 = &v20[v33];
    v36 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
    v37 = *(_QWORD *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v39 = *((_QWORD *)v35 + 1);
      *(_QWORD *)v34 = *(_QWORD *)v35;
      *((_QWORD *)v34 + 1) = v39;
      v40 = *((_QWORD *)v35 + 3);
      *((_QWORD *)v34 + 2) = *((_QWORD *)v35 + 2);
      *((_QWORD *)v34 + 3) = v40;
      *((_QWORD *)v34 + 4) = *((_QWORD *)v35 + 4);
      v34[40] = v35[40];
      v41 = *(int *)(v36 + 28);
      v55 = &v34[v41];
      v42 = &v35[v41];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v56(v55, v42, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
    }
    v43 = v21[7];
    v44 = &v19[v43];
    v45 = &v20[v43];
    v46 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
    v47 = *(_QWORD *)(v46 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46))
    {
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
      memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    }
    else
    {
      v49 = *((_QWORD *)v45 + 1);
      *(_QWORD *)v44 = *(_QWORD *)v45;
      *((_QWORD *)v44 + 1) = v49;
      v50 = *(int *)(v46 + 24);
      v51 = &v44[v50];
      v52 = &v45[v50];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v56(v51, v52, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
    }
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v57 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, int *);
  int v27;
  int v28;
  void (*v29)(uint64_t, char *, uint64_t);
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(char *, uint64_t, uint64_t);
  int v46;
  int v47;
  uint64_t v48;
  char *v49;
  char *v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  _QWORD *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(char *, uint64_t, uint64_t);
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  void (*v86)(char *, char *, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t (*v94)(char *, uint64_t, uint64_t);
  int v95;
  int v96;
  uint64_t v97;
  char *v98;
  char *v99;
  void (*v100)(char *, char *, uint64_t);
  uint64_t v101;
  char *v102;
  char *v103;
  void (*v104)(uint64_t, uint64_t, uint64_t);
  uint64_t v105;
  void (*v106)(char *, char *, uint64_t);
  uint64_t v107;

  v6 = sub_247E81DBC();
  v105 = *(_QWORD *)(v6 - 8);
  v104 = *(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 24);
  v104(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  v107 = v6;
  if (v13)
  {
    if (!v14)
    {
      *(_QWORD *)v8 = *(_QWORD *)v9;
      *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
      v15 = *(_QWORD *)(v9 + 16);
      *(_BYTE *)(v8 + 24) = *(_BYTE *)(v9 + 24);
      *(_QWORD *)(v8 + 16) = v15;
      v16 = *(int *)(v10 + 24);
      v17 = v8 + v16;
      v18 = v9 + v16;
      v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 16);
      swift_bridgeObjectRetain();
      v19(v17, v18, v6);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_247E4C978(v8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
    memcpy((void *)v8, (const void *)v9, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v39 = *(_QWORD *)(v9 + 16);
  *(_BYTE *)(v8 + 24) = *(_BYTE *)(v9 + 24);
  *(_QWORD *)(v8 + 16) = v39;
  v104(v8 + *(int *)(v10 + 24), v9 + *(int *)(v10 + 24), v6);
LABEL_7:
  v21 = *(int *)(a3 + 24);
  v22 = a1 + v21;
  v23 = (char *)(a2 + v21);
  v24 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  v25 = *((_QWORD *)v24 - 1);
  v26 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v25 + 48);
  v27 = v26(v22, 1, v24);
  v28 = v26((uint64_t)v23, 1, v24);
  if (!v27)
  {
    if (v28)
    {
      sub_247E4C978(v22, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
      goto LABEL_13;
    }
    v104(v22, (uint64_t)v23, v107);
    v40 = v24[5];
    v41 = (char *)(v22 + v40);
    v42 = &v23[v40];
    v43 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
    v44 = *(_QWORD *)(v43 - 8);
    v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
    v46 = v45(v41, 1, v43);
    v47 = v45(v42, 1, v43);
    if (v46)
    {
      if (!v47)
      {
        *(_QWORD *)v41 = *(_QWORD *)v42;
        *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
        v48 = *(int *)(v43 + 20);
        v49 = &v41[v48];
        v50 = &v42[v48];
        v51 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
        swift_bridgeObjectRetain();
        v51(v49, v50, v107);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
        goto LABEL_31;
      }
    }
    else
    {
      if (!v47)
      {
        *(_QWORD *)v41 = *(_QWORD *)v42;
        *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v104((uint64_t)&v41[*(int *)(v43 + 20)], (uint64_t)&v42[*(int *)(v43 + 20)], v107);
LABEL_31:
        v75 = v24[6];
        v76 = (char *)(v22 + v75);
        v77 = &v23[v75];
        v78 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
        v79 = *(_QWORD *)(v78 - 8);
        v80 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v79 + 48);
        v81 = v80(v76, 1, v78);
        v82 = v80(v77, 1, v78);
        if (v81)
        {
          if (!v82)
          {
            *(_QWORD *)v76 = *(_QWORD *)v77;
            *((_QWORD *)v76 + 1) = *((_QWORD *)v77 + 1);
            *((_QWORD *)v76 + 2) = *((_QWORD *)v77 + 2);
            *((_QWORD *)v76 + 3) = *((_QWORD *)v77 + 3);
            v83 = *((_QWORD *)v77 + 4);
            v76[40] = v77[40];
            *((_QWORD *)v76 + 4) = v83;
            v84 = *(int *)(v78 + 28);
            v103 = &v76[v84];
            v85 = &v77[v84];
            v86 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v87 = v107;
            v86(v103, v85, v107);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v79 + 56))(v76, 0, 1, v78);
LABEL_37:
            v89 = v24[7];
            v90 = (char *)(v22 + v89);
            v91 = &v23[v89];
            v92 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
            v93 = *(_QWORD *)(v92 - 8);
            v94 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v93 + 48);
            v95 = v94(v90, 1, v92);
            v96 = v94(v91, 1, v92);
            if (v95)
            {
              if (!v96)
              {
                *(_QWORD *)v90 = *(_QWORD *)v91;
                *((_QWORD *)v90 + 1) = *((_QWORD *)v91 + 1);
                v97 = *(int *)(v92 + 24);
                v98 = &v90[v97];
                v99 = &v91[v97];
                v100 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                v100(v98, v99, v87);
                (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v93 + 56))(v90, 0, 1, v92);
                return a1;
              }
            }
            else
            {
              if (!v96)
              {
                *(_QWORD *)v90 = *(_QWORD *)v91;
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                *((_QWORD *)v90 + 1) = *((_QWORD *)v91 + 1);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                v104((uint64_t)&v90[*(int *)(v92 + 24)], (uint64_t)&v91[*(int *)(v92 + 24)], v87);
                return a1;
              }
              sub_247E4C978((uint64_t)v90, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
            }
            v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A760) - 8) + 64);
            v37 = v90;
            v38 = v91;
            goto LABEL_14;
          }
        }
        else
        {
          if (!v82)
          {
            *(_QWORD *)v76 = *(_QWORD *)v77;
            *((_QWORD *)v76 + 1) = *((_QWORD *)v77 + 1);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            *((_QWORD *)v76 + 2) = *((_QWORD *)v77 + 2);
            *((_QWORD *)v76 + 3) = *((_QWORD *)v77 + 3);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v101 = *((_QWORD *)v77 + 4);
            v76[40] = v77[40];
            *((_QWORD *)v76 + 4) = v101;
            v87 = v107;
            v104((uint64_t)&v76[*(int *)(v78 + 28)], (uint64_t)&v77[*(int *)(v78 + 28)], v107);
            goto LABEL_37;
          }
          sub_247E4C978((uint64_t)v76, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
        }
        v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
        memcpy(v76, v77, *(_QWORD *)(*(_QWORD *)(v88 - 8) + 64));
        v87 = v107;
        goto LABEL_37;
      }
      sub_247E4C978((uint64_t)v41, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
    }
    v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v74 - 8) + 64));
    goto LABEL_31;
  }
  if (v28)
  {
LABEL_13:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A708) - 8) + 64);
    v37 = (void *)v22;
    v38 = v23;
LABEL_14:
    memcpy(v37, v38, v36);
    return a1;
  }
  v29 = *(void (**)(uint64_t, char *, uint64_t))(v105 + 16);
  v29(v22, v23, v107);
  v30 = v24[5];
  v31 = (_QWORD *)(v22 + v30);
  v32 = &v23[v30];
  v33 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v34 = *(_QWORD *)(v33 - 8);
  v106 = (void (*)(char *, char *, uint64_t))v29;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    *v31 = *(_QWORD *)v32;
    v31[1] = *((_QWORD *)v32 + 1);
    v52 = *(int *)(v33 + 20);
    v53 = (char *)v31 + v52;
    v54 = &v32[v52];
    swift_bridgeObjectRetain();
    v106(v53, v54, v107);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  v55 = v24[6];
  v56 = (_QWORD *)(v22 + v55);
  v57 = &v23[v55];
  v58 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v59 = *(_QWORD *)(v58 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v57, 1, v58))
  {
    v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
    memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
  }
  else
  {
    *v56 = *(_QWORD *)v57;
    v56[1] = *((_QWORD *)v57 + 1);
    v56[2] = *((_QWORD *)v57 + 2);
    v56[3] = *((_QWORD *)v57 + 3);
    v61 = *((_QWORD *)v57 + 4);
    *((_BYTE *)v56 + 40) = v57[40];
    v56[4] = v61;
    v62 = *(int *)(v58 + 28);
    v102 = (char *)v56 + v62;
    v63 = &v57[v62];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v106(v102, v63, v107);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
  }
  v64 = v24[7];
  v65 = (_QWORD *)(v22 + v64);
  v66 = &v23[v64];
  v67 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v68 = *(_QWORD *)(v67 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v66, 1, v67))
  {
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
    memcpy(v65, v66, *(_QWORD *)(*(_QWORD *)(v69 - 8) + 64));
  }
  else
  {
    *v65 = *(_QWORD *)v66;
    v65[1] = *((_QWORD *)v66 + 1);
    v70 = *(int *)(v67 + 24);
    v71 = (char *)v65 + v70;
    v72 = &v66[v70];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v106(v71, v72, v107);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v68 + 56))(v65, 0, 1, v67);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v25 + 56))(v22, 0, 1, v24);
  return a1;
}

uint64_t initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;

  v6 = sub_247E81DBC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (_OWORD *)(a1 + v8);
  v10 = (_OWORD *)(a2 + v8);
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    *v9 = *v10;
    *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
    *((_BYTE *)v9 + 24) = *((_BYTE *)v10 + 24);
    v7((uint64_t)v9 + *(int *)(v11 + 24), (uint64_t)v10 + *(int *)(v11 + 24), v6);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = *(int *)(a3 + 24);
  v15 = (char *)(a1 + v14);
  v16 = (char *)(a2 + v14);
  v17 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  v18 = *((_QWORD *)v17 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v40 = v18;
    v7((uint64_t)v15, (uint64_t)v16, v6);
    v20 = v17[5];
    v21 = &v15[v20];
    v22 = &v16[v20];
    v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
    v24 = *(_QWORD *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      *(_OWORD *)v21 = *(_OWORD *)v22;
      v7((uint64_t)&v21[*(int *)(v23 + 20)], (uint64_t)&v22[*(int *)(v23 + 20)], v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    v26 = v17[6];
    v27 = &v15[v26];
    v28 = &v16[v26];
    v29 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = *((_OWORD *)v28 + 1);
      *(_OWORD *)v27 = *(_OWORD *)v28;
      *((_OWORD *)v27 + 1) = v32;
      *((_QWORD *)v27 + 4) = *((_QWORD *)v28 + 4);
      v27[40] = v28[40];
      v7((uint64_t)&v27[*(int *)(v29 + 28)], (uint64_t)&v28[*(int *)(v29 + 28)], v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    v33 = v17[7];
    v34 = &v15[v33];
    v35 = &v16[v33];
    v36 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
    v37 = *(_QWORD *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      *(_OWORD *)v34 = *(_OWORD *)v35;
      v7((uint64_t)&v34[*(int *)(v36 + 24)], (uint64_t)&v35[*(int *)(v36 + 24)], v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
    }
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v40 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelPackage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, int *);
  int v22;
  int v23;
  void (*v24)(uint64_t, char *, uint64_t);
  uint64_t v25;
  _OWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  size_t v31;
  void *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t);
  int v41;
  size_t v42;
  void *v43;
  uint64_t v44;
  _OWORD *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  _OWORD *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t (*v63)(char *, uint64_t, uint64_t);
  int v64;
  int v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t, uint64_t);
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *__src;
  void (*v80)(uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);

  v6 = sub_247E81DBC();
  v82 = *(_QWORD *)(v6 - 8);
  v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 40);
  v80(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
      *(_BYTE *)(v8 + 24) = *(_BYTE *)(v9 + 24);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 32))(v8 + *(int *)(v10 + 24), v9 + *(int *)(v10 + 24), v6);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_247E4C978(v8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
    memcpy((void *)v8, (const void *)v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v34 = *(_QWORD *)(v9 + 8);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = v34;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
  *(_BYTE *)(v8 + 24) = *(_BYTE *)(v9 + 24);
  v80(v8 + *(int *)(v10 + 24), v9 + *(int *)(v10 + 24), v6);
LABEL_7:
  v16 = *(int *)(a3 + 24);
  v17 = a1 + v16;
  v18 = (char *)(a2 + v16);
  v19 = (int *)type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(0);
  v20 = *((_QWORD *)v19 - 1);
  v21 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21((uint64_t)v18, 1, v19);
  if (!v22)
  {
    if (v23)
    {
      sub_247E4C978(v17, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
      goto LABEL_13;
    }
    v80(v17, (uint64_t)v18, v6);
    v35 = v19[5];
    v36 = v17 + v35;
    v37 = &v18[v35];
    v38 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
    v39 = *(_QWORD *)(v38 - 8);
    v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
    v78 = v36;
    LODWORD(v36) = v40(v36, 1, v38);
    v41 = v40((uint64_t)v37, 1, v38);
    if ((_DWORD)v36)
    {
      if (v41)
      {
        v42 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58) - 8) + 64);
        v43 = (void *)v78;
LABEL_30:
        memcpy(v43, v37, v42);
        goto LABEL_33;
      }
      *(_OWORD *)v78 = *(_OWORD *)v37;
      (*(void (**)(uint64_t, char *, uint64_t))(v82 + 32))(v78 + *(int *)(v38 + 20), &v37[*(int *)(v38 + 20)], v6);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v78, 0, 1, v38);
    }
    else
    {
      if (v41)
      {
        sub_247E4C978(v78, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
        v42 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58) - 8) + 64);
        v43 = (void *)v78;
        goto LABEL_30;
      }
      v58 = *((_QWORD *)v37 + 1);
      *(_QWORD *)v78 = *(_QWORD *)v37;
      *(_QWORD *)(v78 + 8) = v58;
      swift_bridgeObjectRelease();
      v80(v78 + *(int *)(v38 + 20), (uint64_t)&v37[*(int *)(v38 + 20)], v6);
    }
LABEL_33:
    v59 = v19[6];
    v60 = (char *)(v17 + v59);
    v61 = &v18[v59];
    v62 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
    __src = *(_QWORD **)(v62 - 8);
    v63 = (uint64_t (*)(char *, uint64_t, uint64_t))__src[6];
    v64 = v63(v60, 1, v62);
    v65 = v63(v61, 1, v62);
    if (v64)
    {
      if (!v65)
      {
        v66 = *((_OWORD *)v61 + 1);
        *(_OWORD *)v60 = *(_OWORD *)v61;
        *((_OWORD *)v60 + 1) = v66;
        *((_QWORD *)v60 + 4) = *((_QWORD *)v61 + 4);
        v60[40] = v61[40];
        (*(void (**)(char *, char *, uint64_t))(v82 + 32))(&v60[*(int *)(v62 + 28)], &v61[*(int *)(v62 + 28)], v6);
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))__src[7])(v60, 0, 1, v62);
LABEL_39:
        v68 = v19[7];
        v69 = v17 + v68;
        v70 = &v18[v68];
        v71 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
        v72 = *(_QWORD *)(v71 - 8);
        v73 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
        v74 = v73(v69, 1, v71);
        v75 = v73((uint64_t)v70, 1, v71);
        if (v74)
        {
          if (!v75)
          {
            *(_OWORD *)v69 = *(_OWORD *)v70;
            (*(void (**)(uint64_t, char *, uint64_t))(v82 + 32))(v69 + *(int *)(v71 + 24), &v70[*(int *)(v71 + 24)], v6);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v72 + 56))(v69, 0, 1, v71);
            return a1;
          }
        }
        else
        {
          if (!v75)
          {
            *(_QWORD *)v69 = *(_QWORD *)v70;
            swift_bridgeObjectRelease();
            *(_QWORD *)(v69 + 8) = *((_QWORD *)v70 + 1);
            swift_bridgeObjectRelease();
            v80(v69 + *(int *)(v71 + 24), (uint64_t)&v70[*(int *)(v71 + 24)], v6);
            return a1;
          }
          sub_247E4C978(v69, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
        }
        v31 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A760) - 8) + 64);
        v32 = (void *)v69;
        v33 = v70;
        goto LABEL_14;
      }
    }
    else
    {
      if (!v65)
      {
        v76 = *((_QWORD *)v61 + 1);
        *(_QWORD *)v60 = *(_QWORD *)v61;
        *((_QWORD *)v60 + 1) = v76;
        swift_bridgeObjectRelease();
        v77 = *((_QWORD *)v61 + 3);
        *((_QWORD *)v60 + 2) = *((_QWORD *)v61 + 2);
        *((_QWORD *)v60 + 3) = v77;
        swift_bridgeObjectRelease();
        *((_QWORD *)v60 + 4) = *((_QWORD *)v61 + 4);
        v60[40] = v61[40];
        v80((uint64_t)&v60[*(int *)(v62 + 28)], (uint64_t)&v61[*(int *)(v62 + 28)], v6);
        goto LABEL_39;
      }
      sub_247E4C978((uint64_t)v60, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
    }
    v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
    memcpy(v60, v61, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
    goto LABEL_39;
  }
  if (v23)
  {
LABEL_13:
    v31 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445A708) - 8) + 64);
    v32 = (void *)v17;
    v33 = v18;
LABEL_14:
    memcpy(v32, v33, v31);
    return a1;
  }
  v81 = a1;
  v24 = *(void (**)(uint64_t, char *, uint64_t))(v82 + 32);
  v24(v17, v18, v6);
  v25 = v19[5];
  v26 = (_OWORD *)(v17 + v25);
  v27 = &v18[v25];
  v28 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v29 = *(_QWORD *)(v28 - 8);
  v83 = (void (*)(char *, char *, uint64_t))v24;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    *v26 = *(_OWORD *)v27;
    v24((uint64_t)v26 + *(int *)(v28 + 20), &v27[*(int *)(v28 + 20)], v6);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  v44 = v19[6];
  v45 = (_OWORD *)(v17 + v44);
  v46 = &v18[v44];
  v47 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v48 = *(_QWORD *)(v47 - 8);
  a1 = v81;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v46, 1, v47))
  {
    v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
    memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
  }
  else
  {
    v50 = *((_OWORD *)v46 + 1);
    *v45 = *(_OWORD *)v46;
    v45[1] = v50;
    *((_QWORD *)v45 + 4) = *((_QWORD *)v46 + 4);
    *((_BYTE *)v45 + 40) = v46[40];
    v83((char *)v45 + *(int *)(v47 + 28), &v46[*(int *)(v47 + 28)], v6);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
  }
  v51 = v19[7];
  v52 = (_OWORD *)(v17 + v51);
  v53 = &v18[v51];
  v54 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v55 = *(_QWORD *)(v54 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54))
  {
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
    memcpy(v52, v53, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
  }
  else
  {
    *v52 = *(_OWORD *)v53;
    v83((char *)v52 + *(int *)(v54 + 24), &v53[*(int *)(v54 + 24)], v6);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v55 + 56))(v52, 0, 1, v54);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelPackage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5C3B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_247E81DBC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelPackage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5C45C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_247E81DBC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A7D8);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A708);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_247E5C504()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_247E81DBC();
  if (v0 <= 0x3F)
  {
    sub_247E5C5C4(319, &qword_25445A7E0, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorage);
    if (v1 <= 0x3F)
    {
      sub_247E5C5C4(319, &qword_25445A710, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelSpec);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_247E5C5C4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_247E82560();
    if (!v5)
      atomic_store(v4, a2);
  }
}

char *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  void (*v42)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247E81DBC();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
    v13 = *(_QWORD *)(v12 - 8);
    v42 = v8;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v16 = *((_QWORD *)v11 + 1);
      *(_QWORD *)v10 = *(_QWORD *)v11;
      *((_QWORD *)v10 + 1) = v16;
      v17 = *(int *)(v12 + 20);
      v18 = &v10[v17];
      v19 = &v11[v17];
      swift_bridgeObjectRetain();
      v8(v18, v19, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v20 = a3[6];
    v21 = &a1[v20];
    v22 = &a2[v20];
    v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
    v24 = *(_QWORD *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      v26 = *((_QWORD *)v22 + 1);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v26;
      v27 = *((_QWORD *)v22 + 3);
      *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
      *((_QWORD *)v21 + 3) = v27;
      *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
      v21[40] = v22[40];
      v28 = *(int *)(v23 + 28);
      v29 = &v21[v28];
      v30 = &v22[v28];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v42(v29, v30, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    v31 = a3[7];
    v32 = &a1[v31];
    v33 = &a2[v31];
    v34 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
    v35 = *(_QWORD *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      v37 = *((_QWORD *)v33 + 1);
      *(_QWORD *)v32 = *(_QWORD *)v33;
      *((_QWORD *)v32 + 1) = v37;
      v38 = *(int *)(v34 + 24);
      v39 = &v32[v38];
      v40 = &v33[v38];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v42(v39, v40, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
  }
  return a1;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  void (*v12)(uint64_t, uint64_t);

  v4 = sub_247E81DBC();
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v12(a1, v4);
  v5 = a1 + a2[5];
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
  {
    swift_bridgeObjectRelease();
    v12(v5 + *(int *)(v6 + 20), v4);
  }
  v7 = a1 + a2[6];
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12(v7 + *(int *)(v8 + 28), v4);
  }
  v9 = a1 + a2[7];
  v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v12)(v9 + *(int *)(v10 + 24), v4);
  }
  return result;
}

char *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  void (*v7)(char *, char *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  void (*v40)(char *, char *, uint64_t);

  v6 = sub_247E81DBC();
  v7 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v12 = *(_QWORD *)(v11 - 8);
  v40 = v7;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = *((_QWORD *)v10 + 1);
    *(_QWORD *)v9 = *(_QWORD *)v10;
    *((_QWORD *)v9 + 1) = v14;
    v15 = *(int *)(v11 + 20);
    v16 = &v9[v15];
    v17 = &v10[v15];
    swift_bridgeObjectRetain();
    v7(v16, v17, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v18 = a3[6];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    v24 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v24;
    v25 = *((_QWORD *)v20 + 3);
    *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
    *((_QWORD *)v19 + 3) = v25;
    *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
    v19[40] = v20[40];
    v26 = *(int *)(v21 + 28);
    v27 = &v19[v26];
    v28 = &v20[v26];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v40(v27, v28, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v29 = a3[7];
  v30 = &a1[v29];
  v31 = &a2[v29];
  v32 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v33 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    v35 = *((_QWORD *)v31 + 1);
    *(_QWORD *)v30 = *(_QWORD *)v31;
    *((_QWORD *)v30 + 1) = v35;
    v36 = *(int *)(v32 + 24);
    v37 = &v30[v36];
    v38 = &v31[v36];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v40(v37, v38, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  }
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(_QWORD *, uint64_t, uint64_t);
  int v40;
  int v41;
  uint64_t v42;
  char *v43;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;

  v6 = sub_247E81DBC();
  v51 = *(_QWORD *)(v6 - 8);
  v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 24);
  v49(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      *v8 = *v9;
      v8[1] = v9[1];
      v15 = *(int *)(v10 + 20);
      v16 = (char *)v8 + v15;
      v17 = (char *)v9 + v15;
      v18 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
      swift_bridgeObjectRetain();
      v18(v16, v17, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_247E4C978((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v49((uint64_t)v8 + *(int *)(v10 + 20), (uint64_t)v9 + *(int *)(v10 + 20), v6);
LABEL_7:
  v20 = a3[6];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
  v26 = v25(v21, 1, v23);
  v27 = v25(v22, 1, v23);
  v50 = v6;
  if (v26)
  {
    if (!v27)
    {
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
      *(_QWORD *)(v21 + 16) = *(_QWORD *)(v22 + 16);
      *(_QWORD *)(v21 + 24) = *(_QWORD *)(v22 + 24);
      v28 = *(_QWORD *)(v22 + 32);
      *(_BYTE *)(v21 + 40) = *(_BYTE *)(v22 + 40);
      *(_QWORD *)(v21 + 32) = v28;
      v29 = *(int *)(v23 + 28);
      v30 = v21 + v29;
      v31 = v22 + v29;
      v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v32(v30, v31, v50);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v27)
  {
    sub_247E4C978(v21, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
LABEL_12:
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
    memcpy((void *)v21, (const void *)v22, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v21 + 16) = *(_QWORD *)(v22 + 16);
  *(_QWORD *)(v21 + 24) = *(_QWORD *)(v22 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v48 = *(_QWORD *)(v22 + 32);
  *(_BYTE *)(v21 + 40) = *(_BYTE *)(v22 + 40);
  *(_QWORD *)(v21 + 32) = v48;
  v49(v21 + *(int *)(v23 + 28), v22 + *(int *)(v23 + 28), v6);
LABEL_13:
  v34 = a3[7];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (_QWORD *)(a2 + v34);
  v37 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v38 + 48);
  v40 = v39(v35, 1, v37);
  v41 = v39(v36, 1, v37);
  if (!v40)
  {
    if (!v41)
    {
      *v35 = *v36;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v35[1] = v36[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v49((uint64_t)v35 + *(int *)(v37 + 24), (uint64_t)v36 + *(int *)(v37 + 24), v50);
      return a1;
    }
    sub_247E4C978((uint64_t)v35, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
    goto LABEL_18;
  }
  if (v41)
  {
LABEL_18:
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
    return a1;
  }
  *v35 = *v36;
  v35[1] = v36[1];
  v42 = *(int *)(v37 + 24);
  v43 = (char *)v35 + v42;
  v44 = (char *)v36 + v42;
  v45 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v45(v43, v44, v50);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
  return a1;
}

char *initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  void (*v7)(char *, char *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_247E81DBC();
  v7 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    *(_OWORD *)v9 = *(_OWORD *)v10;
    v7(&v9[*(int *)(v11 + 20)], &v10[*(int *)(v11 + 20)], v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v20 = *((_OWORD *)v16 + 1);
    *(_OWORD *)v15 = *(_OWORD *)v16;
    *((_OWORD *)v15 + 1) = v20;
    *((_QWORD *)v15 + 4) = *((_QWORD *)v16 + 4);
    v15[40] = v16[40];
    v7(&v15[*(int *)(v17 + 28)], &v16[*(int *)(v17 + 28)], v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    *(_OWORD *)v22 = *(_OWORD *)v23;
    v7(&v22[*(int *)(v24 + 24)], &v23[*(int *)(v24 + 24)], v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelSpec(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);
  int v22;
  int v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;

  v6 = sub_247E81DBC();
  v40 = *(_QWORD *)(v6 - 8);
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 40);
  v39(a1, a2, v6);
  v7 = a3[5];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      *(_OWORD *)v8 = *(_OWORD *)v9;
      (*(void (**)(char *, char *, uint64_t))(v40 + 32))(&v8[*(int *)(v10 + 20)], &v9[*(int *)(v10 + 20)], v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_247E4C978((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v36 = *((_QWORD *)v9 + 1);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *((_QWORD *)v8 + 1) = v36;
  swift_bridgeObjectRelease();
  v39((uint64_t)&v8[*(int *)(v10 + 20)], (uint64_t)&v9[*(int *)(v10 + 20)], v6);
LABEL_7:
  v16 = a3[6];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      v24 = *(_OWORD *)(v18 + 16);
      *(_OWORD *)v17 = *(_OWORD *)v18;
      *(_OWORD *)(v17 + 16) = v24;
      *(_QWORD *)(v17 + 32) = *(_QWORD *)(v18 + 32);
      *(_BYTE *)(v17 + 40) = *(_BYTE *)(v18 + 40);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v17 + *(int *)(v19 + 28), v18 + *(int *)(v19 + 28), v6);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    sub_247E4C978(v17, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
LABEL_12:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
    memcpy((void *)v17, (const void *)v18, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  v37 = *(_QWORD *)(v18 + 8);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_QWORD *)(v17 + 8) = v37;
  swift_bridgeObjectRelease();
  v38 = *(_QWORD *)(v18 + 24);
  *(_QWORD *)(v17 + 16) = *(_QWORD *)(v18 + 16);
  *(_QWORD *)(v17 + 24) = v38;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v17 + 32) = *(_QWORD *)(v18 + 32);
  *(_BYTE *)(v17 + 40) = *(_BYTE *)(v18 + 40);
  v39(v17 + *(int *)(v19 + 28), v18 + *(int *)(v19 + 28), v6);
LABEL_13:
  v26 = a3[7];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  v29 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v30 + 48);
  v32 = v31(v27, 1, v29);
  v33 = v31(v28, 1, v29);
  if (!v32)
  {
    if (!v33)
    {
      *v27 = *v28;
      swift_bridgeObjectRelease();
      v27[1] = v28[1];
      swift_bridgeObjectRelease();
      v39((uint64_t)v27 + *(int *)(v29 + 24), (uint64_t)v28 + *(int *)(v29 + 24), v6);
      return a1;
    }
    sub_247E4C978((uint64_t)v27, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
    goto LABEL_18;
  }
  if (v33)
  {
LABEL_18:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    return a1;
  }
  *(_OWORD *)v27 = *(_OWORD *)v28;
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))((char *)v27 + *(int *)(v29 + 24), (char *)v28 + *(int *)(v29 + 24), v6);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelSpec()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5D648(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_247E81DBC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = a3[5];
    }
    else
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
      v12 = *(_QWORD *)(v14 - 8);
      if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
      {
        v8 = v14;
        v13 = a3[6];
      }
      else
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
        v12 = *(_QWORD *)(v8 - 8);
        v13 = a3[7];
      }
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelSpec()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5D71C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = sub_247E81DBC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AA58);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[5];
    }
    else
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6A8);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[6];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A760);
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[7];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_247E5D7EC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_247E81DBC();
  if (v0 <= 0x3F)
  {
    sub_247E5C5C4(319, (unint64_t *)&qword_25445AA60, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Common_UUID);
    if (v1 <= 0x3F)
    {
      sub_247E5C5C4(319, &qword_25445A6B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification);
      if (v2 <= 0x3F)
      {
        sub_247E5C5C4(319, &qword_25445A768, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)(a1 + 32) = a2[4];
    v7 = *(int *)(a3 + 28);
    v8 = (uint64_t)a2 + v7;
    v9 = a1 + v7;
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    v10 = sub_247E81DBC();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v9, v8, v10);
  }
  return v3;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v6 = *(int *)(a3 + 28);
  v7 = a2 + v6;
  v8 = a1 + v6;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v9 = sub_247E81DBC();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v8, v7, v9);
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(int *)(a3 + 28);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(int *)(a3 + 28);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelIdentification()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5DC48()
{
  return sub_247E5E4FC();
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelType()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelType()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

ValueMetadata *type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum()
{
  return &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelType.Enum;
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    a1[1] = a2[1];
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_247E81DBC();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_247E81DBC();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5DF94(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_247E81DBC();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_247E5E01C(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_247E81DBC();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_247E5E090()
{
  return sub_247E5F484();
}

_QWORD *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ModelIO(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = *(int *)(a3 + 28);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v10 = sub_247E81DBC();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ModelIO(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelIO(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_247E81DBC();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelIO(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelIO(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(int *)(a3 + 28);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelIO(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelIO()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_17Tm_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelIO()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_18Tm_1(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_247E5E4EC()
{
  return sub_247E5E4FC();
}

uint64_t sub_247E5E4FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81DBC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_DType()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_DType()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

ValueMetadata *type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_DType.Enum()
{
  return &type metadata for Com_Apple_News_Algorithms_Proto_Model_DType.Enum;
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247E81DBC();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = *(int *)(a3 + 20);
    v10 = (_DWORD *)((char *)a1 + v9);
    v11 = (_DWORD *)((char *)a2 + v9);
    v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      *v10 = *v11;
      v8((uint64_t *)((char *)v10 + *(int *)(v12 + 20)), (uint64_t *)((char *)v11 + *(int *)(v12 + 20)), v7);
      (*(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void (*v8)(uint64_t, uint64_t);

  v4 = sub_247E81DBC();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v8(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v5 + *(int *)(v6 + 20), v4);
  return result;
}

char *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(char *, char *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_247E81DBC();
  v7 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    *(_DWORD *)v9 = *(_DWORD *)v10;
    v7(&v9[*(int *)(v11 + 20)], &v10[*(int *)(v11 + 20)], v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_DWORD *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  v6 = sub_247E81DBC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = (_DWORD *)(a1 + v9);
  v11 = (_DWORD *)(a2 + v9);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      *v10 = *v11;
      v8((uint64_t)v10 + *(int *)(v12 + 20), (uint64_t)v11 + *(int *)(v12 + 20), v6);
      return a1;
    }
    sub_247E4C978((uint64_t)v10, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  *v10 = *v11;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v10 + *(int *)(v12 + 20), (char *)v11 + *(int *)(v12 + 20), v6);
  (*(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

char *initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(char *, char *, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_247E81DBC();
  v7 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    *(_DWORD *)v9 = *(_DWORD *)v10;
    v7(&v9[*(int *)(v11 + 20)], &v10[*(int *)(v11 + 20)], v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_DWORD *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  v6 = sub_247E81DBC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = (_DWORD *)(a1 + v9);
  v11 = (_DWORD *)(a2 + v9);
  v12 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      *v10 = *v11;
      v8((uint64_t)v10 + *(int *)(v12 + 20), (uint64_t)v11 + *(int *)(v12 + 20), v6);
      return a1;
    }
    sub_247E4C978((uint64_t)v10, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  *v10 = *v11;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))((char *)v10 + *(int *)(v12 + 20), (char *)v11 + *(int *)(v12 + 20), v6);
  (*(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5EC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_247E81DBC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelPolicySpec()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5EC90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_247E81DBC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257706AD0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_247E5ED10()
{
  unint64_t v0;
  unint64_t v1;

  sub_247E81DBC();
  if (v0 <= 0x3F)
  {
    sub_247E5C5C4(319, qword_257706E20, (void (*)(uint64_t))type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_247E81DBC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_DWORD *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_DWORD *initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithTake for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5EFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_BinaryClassifierSpec()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5F02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_247E5F070()
{
  return sub_247E5F970();
}

_QWORD *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    v6 = *(int *)(a3 + 24);
    v7 = a1 + v6;
    v8 = (uint64_t)a2 + v6;
    v9 = sub_247E81DBC();
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(int *)(a3 + 24);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_247E81DBC();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ModelStorage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelStorage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5F374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelStorage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5F3FC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_247E5F470()
{
  return sub_247E5F484();
}

uint64_t sub_247E5F484()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81DBC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_247E5F57C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_247E5F59C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum()
{
  return &type metadata for Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.Enum;
}

uint64_t *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_247E81DBC();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247E81DBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5F864(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_247E81DBC();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_MessagePreprocessingSpec()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_247E5F8EC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_247E81DBC();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_247E5F960()
{
  return sub_247E5F970();
}

uint64_t sub_247E5F970()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81DBC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    v6 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v6;
    v7 = *(int *)(a3 + 32);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    *(_QWORD *)(a1 + 48) = a2[6];
    v10 = sub_247E81DBC();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(int *)(a3 + 32);
  v7 = a1 + v6;
  v8 = a2 + v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v9 = sub_247E81DBC();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 32);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v4 = *(int *)(a3 + 32);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 32);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5FD98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ExtractorSpec()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E5FE20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_247E81DBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t sub_247E5FE94()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81DBC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s4Tabi47Com_Apple_News_Algorithms_Proto_Model_ModelTypeVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81DBC();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s4Tabi47Com_Apple_News_Algorithms_Proto_Model_ModelTypeVwxx_0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t _s4Tabi47Com_Apple_News_Algorithms_Proto_Model_ModelTypeVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t _s4Tabi47Com_Apple_News_Algorithms_Proto_Model_ModelTypeVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t _s4Tabi47Com_Apple_News_Algorithms_Proto_Model_ModelTypeVwtk_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t _s4Tabi47Com_Apple_News_Algorithms_Proto_Model_ModelTypeVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81DBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ExtractorType()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_19Tm_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for Com_Apple_News_Algorithms_Proto_Model_ExtractorType()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_20Tm_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81DBC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_247E60158()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81DBC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum()
{
  return &type metadata for Com_Apple_News_Algorithms_Proto_Model_ExtractorType.Enum;
}

uint64_t sub_247E601D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_DType.traverse<A>(visitor:)()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.traverse<A>(visitor:)();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ModelType.traverse<A>(visitor:)()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.traverse<A>(visitor:)();
}

uint64_t Com_Apple_News_Algorithms_Proto_Model_ExtractorType.traverse<A>(visitor:)()
{
  return Com_Apple_News_Algorithms_Proto_Model_ModelStorageType.traverse<A>(visitor:)();
}

uint64_t Request.features.getter()
{
  return swift_retain();
}

uint64_t Request.outputs.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *Request.__allocating_init()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v0 = MEMORY[0x24BEE4AF8];
  v1 = sub_247DFF854(MEMORY[0x24BEE4AF8]);
  type metadata accessor for Features();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v1;
  result = (_QWORD *)swift_allocObject();
  v4 = MEMORY[0x24BEE4B08];
  result[3] = v0;
  result[4] = v4;
  result[2] = v2;
  return result;
}

_QWORD *Request.__allocating_init(features:outputs:)(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;

  result = (_QWORD *)swift_allocObject();
  v5 = MEMORY[0x24BEE4B08];
  result[3] = a2;
  result[4] = v5;
  result[2] = a1;
  return result;
}

_QWORD *Request.init(features:outputs:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = MEMORY[0x24BEE4B08];
  v2[3] = a2;
  v2[4] = v3;
  v2[2] = a1;
  return v2;
}

uint64_t Request.toProtoRequest()()
{
  type metadata accessor for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest(0);
  sub_247E6182C(&qword_257704460, type metadata accessor for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest);
  return sub_247E81F00();
}

uint64_t sub_247E60454(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v4 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Features(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247E6182C(&qword_257704680, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Features, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_Features);
  sub_247E81F00();
  v8 = (uint64_t)a1 + *(int *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest(0) + 24);
  sub_247E6186C(v8, &qword_25445AAE0);
  sub_247E618A8((uint64_t)v7, v8, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_Features);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
  v9 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *a1 = v9;
  return result;
}

uint64_t sub_247E6057C(_QWORD *a1)
{
  uint64_t v1;

  return sub_247E60454(a1, v1);
}

BOOL sub_247E60594(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247E605A8()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E605EC()
{
  return sub_247E828F0();
}

uint64_t sub_247E60614()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E60654()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x7374757074756FLL;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x7365727574616566;
}

uint64_t sub_247E606B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247E60DF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247E606D8()
{
  return 0;
}

void sub_247E606E4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_247E606F0()
{
  sub_247E609A0();
  return sub_247E82920();
}

uint64_t sub_247E60718()
{
  sub_247E609A0();
  return sub_247E8292C();
}

uint64_t Request.encode(to:)(_QWORD *a1)
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
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577071B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247E609A0();
  sub_247E82914();
  swift_beginAccess();
  swift_retain();
  v9 = swift_bridgeObjectRetain();
  v10 = sub_247E61350(v9, v3);
  swift_bridgeObjectRelease();
  swift_release();
  type metadata accessor for Features();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v14 = v11;
  HIBYTE(v13) = 0;
  sub_247E6182C(&qword_2577071C0, (uint64_t (*)(uint64_t))type metadata accessor for Features, (uint64_t)&protocol conformance descriptor for Features);
  sub_247E8280C();
  swift_release();
  if (!v2)
  {
    v14 = *(_QWORD *)(v3 + 24);
    HIBYTE(v13) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD80);
    sub_247E61504(&qword_2577071C8, &qword_25445AD80, MEMORY[0x24BEE12A0]);
    sub_247E8280C();
    v14 = *(_QWORD *)(v3 + 32);
    HIBYTE(v13) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577071D0);
    sub_247E61504(&qword_2577071D8, &qword_2577071D0, MEMORY[0x24BEE1700]);
    sub_247E8280C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_247E609A0()
{
  unint64_t result;

  result = qword_2577071B8;
  if (!qword_2577071B8)
  {
    result = MEMORY[0x2495930AC](&unk_247E8CF5C, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2577071B8);
  }
  return result;
}

uint64_t Request.description.getter()
{
  return 0x7571655269626154;
}

uint64_t Request.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Request.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_247E60A64(_QWORD *a1)
{
  return Request.encode(to:)(a1);
}

uint64_t sub_247E60A84()
{
  return 0x7571655269626154;
}

uint64_t sub_247E60AA4(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v42 = a1;
  v7 = type metadata accessor for Feature();
  v45 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v44 = (uint64_t)&v40 - v10;
  if (!a3)
    return MEMORY[0x24BEE4B00];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v43 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445AE28);
  result = sub_247E82758();
  v12 = result;
  v41 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *v42;
  v14 = 0;
  v15 = result + 64;
  v16 = v43;
  while (1)
  {
    if (v13)
    {
      v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v46 = v14;
      v18 = v17 | (v14 << 6);
    }
    else
    {
      v19 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v19 >= v41)
        return v12;
      v20 = v42[v19];
      v21 = v14 + 1;
      if (!v20)
      {
        v21 = v14 + 2;
        if (v14 + 2 >= v41)
          return v12;
        v20 = v42[v21];
        if (!v20)
        {
          v21 = v14 + 3;
          if (v14 + 3 >= v41)
            return v12;
          v20 = v42[v21];
          if (!v20)
          {
            v22 = v14 + 4;
            if (v14 + 4 >= v41)
              return v12;
            v20 = v42[v22];
            if (!v20)
            {
              while (1)
              {
                v21 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v21 >= v41)
                  return v12;
                v20 = v42[v21];
                ++v22;
                if (v20)
                  goto LABEL_24;
              }
            }
            v21 = v14 + 4;
          }
        }
      }
LABEL_24:
      v13 = (v20 - 1) & v20;
      v46 = v21;
      v18 = __clz(__rbit64(v20)) + (v21 << 6);
    }
    v23 = a4[7];
    v24 = a4;
    v25 = (uint64_t *)(a4[6] + 16 * v18);
    v26 = *v25;
    v27 = v25[1];
    v28 = v44;
    v29 = *(_QWORD *)(v45 + 72);
    sub_247DF5D0C(v23 + v29 * v18, v44);
    sub_247E618A8(v28, v16, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
    sub_247E828E4();
    swift_bridgeObjectRetain();
    sub_247E82284();
    result = sub_247E828FC();
    v30 = -1 << *(_BYTE *)(v12 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      v16 = v43;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v30) >> 6;
      v16 = v43;
      do
      {
        if (++v32 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v36 = v32 == v35;
        if (v32 == v35)
          v32 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v32);
      }
      while (v37 == -1);
      v33 = __clz(__rbit64(~v37)) + (v32 << 6);
    }
    *(_QWORD *)(v15 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    v38 = (_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v33);
    *v38 = v26;
    v38[1] = v27;
    result = sub_247E618A8(v16, *(_QWORD *)(v12 + 56) + v33 * v29, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v24;
    v14 = v46;
    if (!a3)
      return v12;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_247E60DF8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7365727574616566 && a2 == 0xE800000000000000;
  if (v2 || (sub_247E82854() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7374757074756FLL && a2 == 0xE700000000000000 || (sub_247E82854() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000247E90AC0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_247E82854();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_247E60F48(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  BOOL v31;
  uint64_t v32;
  _QWORD *v33;
  BOOL v34;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  int64_t v48;
  unint64_t v49;

  v45 = a4;
  v37 = a2;
  v38 = a1;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD50);
  MEMORY[0x24BDAC7A8](v44);
  v6 = (uint64_t *)((char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for Feature();
  v43 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  v46 = (_QWORD *)a3;
  v12 = *(_QWORD *)(a3 + 64);
  v39 = 0;
  v40 = a3 + 64;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  if (v13 < 64)
    v14 = ~(-1 << v13);
  else
    v14 = -1;
  v15 = v14 & v12;
  v41 = (unint64_t)(v13 + 63) >> 6;
  v42 = v10;
  while (v15)
  {
    v16 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v17 = v16 | (v11 << 6);
LABEL_22:
    v21 = (uint64_t *)(v46[6] + 16 * v17);
    v23 = *v21;
    v22 = v21[1];
    sub_247DF5D0C(v46[7] + *(_QWORD *)(v43 + 72) * v17, (uint64_t)v10);
    *v6 = v23;
    v6[1] = v22;
    sub_247DF5D0C((uint64_t)v10, (uint64_t)v6 + *(int *)(v44 + 48));
    v24 = *(_QWORD *)(v45 + 32);
    if (*(_QWORD *)(v24 + 16))
    {
      v47 = v17;
      v25 = (uint64_t)v6;
      v49 = v15;
      sub_247E828E4();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_247E82284();
      v26 = sub_247E828FC();
      v27 = -1 << *(_BYTE *)(v24 + 32);
      v28 = v26 & ~v27;
      if (((*(_QWORD *)(v24 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v15 = v49;
LABEL_40:
        v17 = v47;
        goto LABEL_41;
      }
      v48 = v11;
      v29 = *(_QWORD *)(v24 + 48);
      v30 = (_QWORD *)(v29 + 16 * v28);
      v31 = *v30 == v23 && v30[1] == v22;
      if (!v31 && (sub_247E82854() & 1) == 0)
      {
        v32 = ~v27;
        while (1)
        {
          v28 = (v28 + 1) & v32;
          if (((*(_QWORD *)(v24 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
            break;
          v33 = (_QWORD *)(v29 + 16 * v28);
          v34 = *v33 == v23 && v33[1] == v22;
          if (v34 || (sub_247E82854() & 1) != 0)
            goto LABEL_5;
        }
        swift_bridgeObjectRelease();
        v6 = (_QWORD *)v25;
        v10 = v42;
        v11 = v48;
        v15 = v49;
        goto LABEL_40;
      }
LABEL_5:
      swift_bridgeObjectRelease();
      v6 = (_QWORD *)v25;
      v10 = v42;
      v11 = v48;
      v15 = v49;
      sub_247E6186C(v25, &qword_25445AD50);
      sub_247E617D8((uint64_t)v10);
      result = swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain_n();
LABEL_41:
      sub_247E6186C((uint64_t)v6, &qword_25445AD50);
      sub_247E617D8((uint64_t)v10);
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v38 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      if (__OFADD__(v39++, 1))
      {
        __break(1u);
        return sub_247E60AA4(v38, v37, v39, v46);
      }
    }
  }
  v18 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_46;
  }
  if (v18 >= v41)
    return sub_247E60AA4(v38, v37, v39, v46);
  v19 = *(_QWORD *)(v40 + 8 * v18);
  ++v11;
  if (v19)
    goto LABEL_21;
  v11 = v18 + 1;
  if (v18 + 1 >= v41)
    return sub_247E60AA4(v38, v37, v39, v46);
  v19 = *(_QWORD *)(v40 + 8 * v11);
  if (v19)
    goto LABEL_21;
  v11 = v18 + 2;
  if (v18 + 2 >= v41)
    return sub_247E60AA4(v38, v37, v39, v46);
  v19 = *(_QWORD *)(v40 + 8 * v11);
  if (v19)
  {
LABEL_21:
    v15 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v11 << 6);
    goto LABEL_22;
  }
  v20 = v18 + 3;
  if (v20 >= v41)
    return sub_247E60AA4(v38, v37, v39, v46);
  v19 = *(_QWORD *)(v40 + 8 * v20);
  if (v19)
  {
    v11 = v20;
    goto LABEL_21;
  }
  while (1)
  {
    v11 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v11 >= v41)
      return sub_247E60AA4(v38, v37, v39, v46);
    v19 = *(_QWORD *)(v40 + 8 * v11);
    ++v20;
    if (v19)
      goto LABEL_21;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_247E61350(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  unsigned int v7;
  unint64_t v8;
  size_t v9;
  uint64_t isStackAllocationSafe;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v3 = v2;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_BYTE *)(a1 + 32);
  v7 = v6 & 0x3F;
  v8 = (unint64_t)((1 << v6) + 63) >> 6;
  v9 = 8 * v8;
  isStackAllocationSafe = swift_retain_n();
  if (v7 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    swift_retain();
    v11 = sub_247E60F48((_QWORD *)((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, a1, a2);
    swift_release();
    if (v3)
      swift_willThrow();
    swift_release_n();
  }
  else
  {
    v12 = (void *)swift_slowAlloc();
    bzero(v12, v9);
    swift_retain();
    v11 = sub_247E60F48((unint64_t *)v12, v8, a1, a2);
    swift_release();
    MEMORY[0x249593160](v12, -1, -1);
    swift_release_n();
  }
  return v11;
}

uint64_t sub_247E61504(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = MEMORY[0x24BEE0D08];
    result = MEMORY[0x2495930AC](a3, v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for Request()
{
  return objc_opt_self();
}

uint64_t method lookup function for Request()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Request.__allocating_init(features:outputs:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t getEnumTagSinglePayload for Request.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Request.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247E6166C + 4 * byte_247E8CDFD[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247E616A0 + 4 * byte_247E8CDF8[v4]))();
}

uint64_t sub_247E616A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E616A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247E616B0);
  return result;
}

uint64_t sub_247E616BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247E616C4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_247E616C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E616D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E616DC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247E616E8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Request.CodingKeys()
{
  return &type metadata for Request.CodingKeys;
}

unint64_t sub_247E61704()
{
  unint64_t result;

  result = qword_2577071E0;
  if (!qword_2577071E0)
  {
    result = MEMORY[0x2495930AC](&unk_247E8CF34, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2577071E0);
  }
  return result;
}

unint64_t sub_247E6174C()
{
  unint64_t result;

  result = qword_2577071E8;
  if (!qword_2577071E8)
  {
    result = MEMORY[0x2495930AC](&unk_247E8CEA4, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2577071E8);
  }
  return result;
}

unint64_t sub_247E61794()
{
  unint64_t result;

  result = qword_2577071F0;
  if (!qword_2577071F0)
  {
    result = MEMORY[0x2495930AC](&unk_247E8CECC, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2577071F0);
  }
  return result;
}

uint64_t sub_247E617D8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Feature();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247E61814(uint64_t *a1)
{
  return sub_247E00AC4(a1);
}

uint64_t sub_247E6182C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495930AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247E6186C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247E618A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t static PackageServiceTypeErrors.== infix(_:_:)()
{
  return 1;
}

uint64_t PackageServiceTypeErrors.hash(into:)()
{
  return sub_247E828F0();
}

uint64_t PackageServiceTypeErrors.hashValue.getter()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E61958()
{
  return 1;
}

uint64_t sub_247E61960()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E619A0()
{
  return sub_247E828F0();
}

uint64_t sub_247E619C4()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E61A10()
{
  return sub_247E61C0C();
}

uint64_t PackageServiceType.fetchBundledTabiPackages()()
{
  return sub_247E61C0C();
}

id sub_247E61A38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458DD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v17 - v9;
  sub_247E82668();
  swift_getAssociatedConformanceWitness();
  sub_247E82824();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  v11 = (void *)sub_247E82200();
  swift_bridgeObjectRelease();
  v12 = sub_247E81C54();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v12) != 1)
  {
    v14 = (void *)sub_247E81BE8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)GTUnarchivablePackage), sel_initWithIdentifier_fileURL_, v11, v14);

  return v15;
}

uint64_t sub_247E61C0C()
{
  sub_247E61E7C();
  swift_allocError();
  return swift_willThrow();
}

unint64_t sub_247E61C54()
{
  unint64_t result;

  result = qword_2577071F8;
  if (!qword_2577071F8)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for PackageServiceTypeErrors, &type metadata for PackageServiceTypeErrors);
    atomic_store(result, (unint64_t *)&qword_2577071F8);
  }
  return result;
}

uint64_t dispatch thunk of PackageType.fileURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t getEnumTagSinglePayload for PackageServiceTypeErrors(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for PackageServiceTypeErrors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247E61D30 + 4 * byte_247E8CFB0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247E61D50 + 4 * byte_247E8CFB5[v4]))();
}

_BYTE *sub_247E61D30(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247E61D50(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247E61D58(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247E61D60(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247E61D68(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247E61D70(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_247E61D7C()
{
  return 0;
}

ValueMetadata *type metadata accessor for PackageServiceTypeErrors()
{
  return &type metadata for PackageServiceTypeErrors;
}

uint64_t dispatch thunk of PackageServiceType.fetchBundledTabiPackages()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PackageServiceType.fetchTabiPackages(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 32) + *(_QWORD *)(a3 + 32));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_247E61E2C;
  return v9(a1, a2, a3);
}

uint64_t sub_247E61E2C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

unint64_t sub_247E61E7C()
{
  unint64_t result;

  result = qword_257707208;
  if (!qword_257707208)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for PackageServiceTypeErrors, &type metadata for PackageServiceTypeErrors);
    atomic_store(result, (unint64_t *)&qword_257707208);
  }
  return result;
}

uint64_t sub_247E61EC0(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  void (*v22)(char *, _QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char v38[32];
  uint64_t v39;

  v27 = a5;
  v28 = a8;
  v33 = a1;
  v34 = a2;
  v26 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v35 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v31 = (char *)&v24 - v13;
  v36 = a4;
  MEMORY[0x24BDAC7A8](v12);
  v30 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_getAssociatedTypeWitness();
  v29 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - v16;
  v18 = sub_247E82428();
  if (!v18)
    return sub_247E82344();
  v19 = v18;
  v25 = v15;
  v39 = sub_247E826F8();
  v32 = sub_247E82704();
  sub_247E826BC();
  v36 = v17;
  result = sub_247E8241C();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    v21 = v31;
    while (1)
    {
      v22 = (void (*)(char *, _QWORD))sub_247E8244C();
      (*(void (**)(char *))(v11 + 16))(v21);
      v22(v38, 0);
      v23 = v37;
      v33(v21, v35);
      if (v23)
        break;
      v37 = 0;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
      sub_247E826EC();
      sub_247E82434();
      if (!--v19)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
        return v39;
      }
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v35, v27);
  }
  return result;
}

uint64_t sub_247E6219C@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *);
  uint64_t v29;

  v26 = a5;
  v27 = a2;
  v28 = a1;
  v29 = a6;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(v29, 1, 1, a4);
  v25 = a3;
  v24 = v26;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
  v28(v18, v12);
  result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  if (v6)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v24, v12, v25);
  return result;
}

uint64_t sub_247E62338(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = sub_247E823B0();
  v3 = 0;
  v18 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_247E7F5E0(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

BOOL static WorkService.PerformanceOptimizationPolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WorkService.PerformanceOptimizationPolicy.hash(into:)()
{
  return sub_247E828F0();
}

uint64_t WorkService.PerformanceOptimizationPolicy.hashValue.getter()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E6256C()
{
  sub_247E828E4();
  WorkService.PerformanceOptimizationPolicy.hash(into:)();
  return sub_247E828FC();
}

uint64_t WorkService.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 128);
  swift_getAssociatedTypeWitness();
  v4 = sub_247E82560();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void WorkService.__allocating_init(configurationManager:analyticsEnabled:configuration:packageService:setup:tabiResourcesContentDirectory:tabiModelsContentDirectory:tabiUserFeaturesFactory:workEventProcessorRegistry:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _QWORD *a12)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  v39 = a8;
  v40 = a7;
  v41 = a5;
  v42 = a6;
  v43 = a1;
  v44 = a3;
  v38 = a2;
  v36 = a10;
  v37 = a9;
  v33 = a4;
  v34 = a11;
  v35 = a12;
  v31 = v12[11];
  v30 = *(_QWORD *)(v31 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v12[12];
  v17 = *(_QWORD *)(v16 - 8);
  v29[1] = v16;
  v29[2] = v17;
  v18 = v17;
  MEMORY[0x24BDAC7A8](v13);
  v20 = (char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_247E82560();
  v22 = *(_QWORD *)(v21 - 8);
  v29[3] = v21;
  v29[4] = v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)v29 - v24;
  v26 = *(_QWORD *)(v12[10] - 8);
  v32 = v12[10];
  MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)v29 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v26 + 16))(v28, v43);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v25, v44, v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v33, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v15, v34, v31);
  v45 = 1;
  swift_allocObject();
  WorkService.init(configurationManager:analyticsEnabled:configuration:packageService:requestProcessor:setup:tabiResourcesContentDirectory:tabiModelsContentDirectory:tabiUserFeaturesFactory:workEventProcessorRegistry:performanceOptimizationPolicy:)((uint64_t)v28, v38, (uint64_t)v25, (uint64_t)v20, 0, 0, v41, v42, v40, v39, v37, v36, (uint64_t)v15, v35);
}

uint64_t sub_247E62818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v3);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 240) + 8))(v4, *(_QWORD *)(v6 - 248));
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 224) + 8))(*(_QWORD *)(v6 - 104), *(_QWORD *)(v6 - 232));
  (*(void (**)(_QWORD, _QWORD))(v1 + 8))(*(_QWORD *)(v6 - 112), *(_QWORD *)(v6 - 200));
  return v0;
}

uint64_t sub_247E62880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;

  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v4);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a2, 1, 1, AssociatedTypeWitness);
  }
  else
  {
    v6 = swift_getAssociatedTypeWitness();
    v7 = *(_QWORD *)(v6 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a2, v4, v6);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
}

void WorkService.__allocating_init(configurationManager:analyticsEnabled:configuration:packageService:requestProcessor:setup:tabiResourcesContentDirectory:tabiModelsContentDirectory:tabiUserFeaturesFactory:workEventProcessorRegistry:performanceOptimizationPolicy:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  swift_allocObject();
  WorkService.init(configurationManager:analyticsEnabled:configuration:packageService:requestProcessor:setup:tabiResourcesContentDirectory:tabiModelsContentDirectory:tabiUserFeaturesFactory:workEventProcessorRegistry:performanceOptimizationPolicy:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_247E62A40()
{
  uint64_t v0;

  return v0;
}

void WorkService.init(configurationManager:analyticsEnabled:configuration:packageService:requestProcessor:setup:tabiResourcesContentDirectory:tabiModelsContentDirectory:tabiUserFeaturesFactory:workEventProcessorRegistry:performanceOptimizationPolicy:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[8];
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v46 = a8;
  v44 = a7;
  v47 = a5;
  v48 = a6;
  v42 = a4;
  v36 = a3;
  v29 = a2;
  v51 = a1;
  v35 = a14;
  v43 = a13;
  v34 = a11;
  v33 = a12;
  v31 = a9;
  v30 = a10;
  v15 = (_QWORD *)*v14;
  v16 = *a14;
  v26 = sub_247E820D4();
  v25[6] = *(_QWORD *)(v26 - 8);
  v17 = MEMORY[0x24BDAC7A8](v26);
  v25[5] = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *(_QWORD *)(*(_QWORD *)(v16 + 80) - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v25[4] = (char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[2] = v20;
  MEMORY[0x24BDAC7A8](v19);
  v27 = (char *)v25 - v21;
  v25[7] = v22;
  v39 = sub_247E82560();
  v45 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v32 = (char *)v25 - v23;
  v24 = v15[11];
  v49 = v15[10];
  v37 = v24;
  v41 = v15[12];
  v38 = v15[13];
  v40 = v15[14];
  v50 = v15[15];
  v52 = v49;
  v53 = v24;
  v54 = v41;
  v55 = v38;
  v56 = v40;
  v57 = v50;
  type metadata accessor for WorkService.ConfigurationResolution();
}

void sub_247E62C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
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
  char *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  *(_QWORD *)(v12 - 336) = a1;
  *(_QWORD *)(v12 - 304) = *(_QWORD *)(a1 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v12 - 384) = (char *)&a9 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)(v12 - 216) = (char *)&a9 - v15;
  v16 = sub_247E81C54();
  *(_QWORD *)(v12 - 184) = v16;
  *(_QWORD *)(v12 - 208) = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v12 - 408) = (char *)&a9 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v12 - 240) = (char *)&a9 - v19;
  v20 = sub_247E824DC();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&a9 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_247E824C4();
  v25 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v24);
  v26 = sub_247E82104();
  *(_QWORD *)(v12 - 488) = v26;
  *(_QWORD *)(v12 - 504) = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&a9 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_DWORD *)(v12 - 412) = *v11;
  *(_QWORD *)(v12 - 400) = *(_QWORD *)(v10 + 192);
  *(_QWORD *)(v12 - 424) = sub_247E71424(0, &qword_25445ADE0);
  sub_247E820F8();
  *(_QWORD *)(v12 - 144) = MEMORY[0x24BEE4AF8];
  sub_247E71740(&qword_25445ADD8, v25, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD98);
  sub_247E70064(&qword_25445ADA0, &qword_25445AD98);
  sub_247E825B4();
  (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v23, *MEMORY[0x24BEE5750], v20);
  *(_QWORD *)(v12 - 512) = v28;
  *(_QWORD *)(v9 + *(_QWORD *)(v12 - 400)) = sub_247E82500();
  v29 = (_QWORD *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 208));
  *v29 = 0;
  v29[1] = 0;
  v30 = *(_QWORD *)(*(_QWORD *)v9 + 216);
  v31 = *(_QWORD *)(v12 - 272);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for WorkServiceData(255, AssociatedTypeWitness, AssociatedConformanceWitness, v34);
  sub_247E82560();
  *(_OWORD *)(v12 - 144) = 0u;
  *(_OWORD *)(v12 - 128) = 0u;
  *(_OWORD *)(v12 - 112) = 0u;
  *(_QWORD *)(v9 + v30) = sub_247DBB964();
  *(_BYTE *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 224)) = 0;
  v35 = *(_QWORD *)(*(_QWORD *)v9 + 232);
  *(_QWORD *)(v9 + v35) = dispatch_group_create();
  *(_BYTE *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 240)) = 0;
  *(_BYTE *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 248)) = 0;
  *(_BYTE *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 256)) = 0;
  *(_BYTE *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 264)) = 0;
  v36 = *(_QWORD *)(*(_QWORD *)v9 + 272);
  swift_getAssociatedTypeWitness();
  *(_QWORD *)(v12 - 144) = sub_247E82344();
  sub_247E82368();
  v37 = sub_247DBB964();
  v38 = *(_QWORD *)(v12 - 320);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v9 + v36) = v37;
  v39 = *(_QWORD *)(*(_QWORD *)v9 + 280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445ADF8);
  v40 = swift_allocObject();
  *(_DWORD *)(v40 + 24) = 0;
  *(_QWORD *)(v9 + v39) = v40;
  *(_QWORD *)(v40 + 16) = 0;
  v41 = v9 + *(_QWORD *)(*(_QWORD *)v9 + 136);
  v42 = *(_QWORD *)(v12 - 176);
  v43 = *(_QWORD *)(v42 - 8);
  *(_QWORD *)(v12 - 400) = v43;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 16))(v41, *(_QWORD *)(v12 - 160), v42);
  *(_BYTE *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 144)) = *(_DWORD *)(v12 - 392);
  v44 = v9 + *(_QWORD *)(*(_QWORD *)v9 + 152);
  v45 = *(_QWORD *)(v31 - 8);
  *(_QWORD *)(v12 - 392) = v45;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v45 + 16))(v44, *(_QWORD *)(v12 - 264), v31);
  v46 = (uint64_t *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 160));
  v47 = *(_QWORD *)(v12 - 200);
  v48 = *(_QWORD *)(v12 - 192);
  *v46 = v47;
  v46[1] = v48;
  v49 = (uint64_t *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 168));
  v50 = *(_QWORD *)(v12 - 248);
  v51 = *(_QWORD *)(v12 - 224);
  *v49 = v50;
  v49[1] = v51;
  sub_247E6FF48(v47);
  sub_247E6FF48(v50);
  v52 = *(_QWORD *)(v12 - 240);
  sub_247E81BC4();
  swift_bridgeObjectRelease();
  v53 = *(_QWORD *)(v12 - 208);
  v54 = *(_QWORD *)(v12 - 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v9 + *(_QWORD *)(*(_QWORD *)v9 + 176), v52, v54);
  v55 = *(_QWORD *)(v12 - 408);
  sub_247E81BC4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v9 + *(_QWORD *)(*(_QWORD *)v9 + 184), v55, v54);
  v56 = v9 + *(_QWORD *)(*(_QWORD *)v9 + 200);
  v57 = *(_QWORD *)(v12 - 312);
  v58 = *(_QWORD *)(v57 - 8);
  *(_QWORD *)(v12 - 344) = v58;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v58 + 16))(v56, *(_QWORD *)(v12 - 256), v57);
  *(_QWORD *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 288)) = *(_QWORD *)(v12 - 328);
  *(_BYTE *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 296)) = *(_DWORD *)(v12 - 412);
  swift_retain();
  sub_247E63750(v38, v52, *(_QWORD *)(v12 - 160), v42, v57, v31, *(_QWORD *)(v12 - 296), *(_QWORD *)(v12 - 280), *(char **)(v12 - 216), *(_QWORD *)(v12 - 168));
}

uint64_t sub_247E63264()
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
  int EnumCaseMultiPayload;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(uint64_t, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v7 = *(_QWORD *)(v6 - 360);
  v8 = v1;
  sub_247E62880(v3, v7);
  v9 = *(_QWORD *)(v6 - 304);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 232) + 32))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 128), v7, v4);
  v10 = *(_QWORD *)(v6 - 384);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v10, v8, v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      swift_release();
      sub_247E6FF58(*(_QWORD *)(v6 - 248));
      sub_247E6FF58(*(_QWORD *)(v6 - 200));
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v6 - 344) + 8))(*(_QWORD *)(v6 - 256), v5);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 392) + 8))(*(_QWORD *)(v6 - 264), *(_QWORD *)(v6 - 272));
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 232) + 8))(v2, v4);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 400) + 8))(*(_QWORD *)(v6 - 160), *(_QWORD *)(v6 - 176));
      v12 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v12(*(_QWORD *)(v6 - 216), v3);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 208) + 8))(*(_QWORD *)(v6 - 240), *(_QWORD *)(v6 - 184));
      v12(v10, v3);
    }
    else
    {
      swift_release();
      sub_247E6FF58(*(_QWORD *)(v6 - 248));
      sub_247E6FF58(*(_QWORD *)(v6 - 200));
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v6 - 344) + 8))(*(_QWORD *)(v6 - 256), v5);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 392) + 8))(*(_QWORD *)(v6 - 264), *(_QWORD *)(v6 - 272));
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 232) + 8))(v2, v4);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 400) + 8))(*(_QWORD *)(v6 - 160), *(_QWORD *)(v6 - 176));
      (*(void (**)(_QWORD, uint64_t))(v9 + 8))(*(_QWORD *)(v6 - 216), v3);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 208) + 8))(*(_QWORD *)(v6 - 240), *(_QWORD *)(v6 - 184));
    }
  }
  else
  {
    v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 432) + 32);
    v14 = *(_QWORD *)(v6 - 432);
    v15 = *(char **)(v6 - 440);
    v16 = *(_QWORD *)(v6 - 456);
    v13(v15, v10, v16);
    *(_QWORD *)(v6 - 352) = *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 192));
    v17 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 16);
    v18 = v14;
    v19 = *(_QWORD *)(v6 - 480);
    v17(v19, v15, v16);
    v20 = (*(unsigned __int8 *)(v18 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v21 = (char *)swift_allocObject();
    *((_QWORD *)v21 + 2) = *(_QWORD *)(v6 - 176);
    *((_QWORD *)v21 + 3) = v5;
    v22 = *(_QWORD *)(v6 - 272);
    v23 = *(_QWORD *)(v6 - 296);
    *((_QWORD *)v21 + 4) = v22;
    *((_QWORD *)v21 + 5) = v23;
    v24 = *(_QWORD *)(v6 - 168);
    *((_QWORD *)v21 + 6) = *(_QWORD *)(v6 - 280);
    *((_QWORD *)v21 + 7) = v24;
    *((_QWORD *)v21 + 8) = v0;
    v13(&v21[v20], v19, v16);
    *(_QWORD *)(v6 - 112) = sub_247E6FFF4;
    *(_QWORD *)(v6 - 104) = v21;
    *(_QWORD *)(v6 - 144) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v6 - 136) = 1107296256;
    *(_QWORD *)(v6 - 128) = sub_247E65090;
    *(_QWORD *)(v6 - 120) = &block_descriptor;
    v25 = _Block_copy((const void *)(v6 - 144));
    swift_retain();
    v26 = *(_QWORD *)(v6 - 512);
    sub_247E820EC();
    *(_QWORD *)(v6 - 152) = MEMORY[0x24BEE4AF8];
    sub_247E71740(&qword_254458F80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD70);
    sub_247E70064(&qword_25445AD78, &qword_25445AD70);
    v27 = *(_QWORD *)(v6 - 472);
    v28 = *(_QWORD *)(v6 - 448);
    sub_247E825B4();
    MEMORY[0x249592788](0, v26, v27, v25);
    _Block_release(v25);
    swift_release();
    sub_247E6FF58(*(_QWORD *)(v6 - 248));
    sub_247E6FF58(*(_QWORD *)(v6 - 200));
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 344) + 8))(*(_QWORD *)(v6 - 256), *(_QWORD *)(v6 - 312));
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v6 - 392) + 8))(*(_QWORD *)(v6 - 264), v22);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 232) + 8))(*(_QWORD *)(v6 - 320), *(_QWORD *)(v6 - 288));
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 400) + 8))(*(_QWORD *)(v6 - 160), *(_QWORD *)(v6 - 176));
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 464) + 8))(v27, v28);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 504) + 8))(v26, *(_QWORD *)(v6 - 488));
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v6 - 432) + 8))(*(_QWORD *)(v6 - 440), v16);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 304) + 8))(*(_QWORD *)(v6 - 216), *(_QWORD *)(v6 - 336));
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 208) + 8))(*(_QWORD *)(v6 - 240), *(_QWORD *)(v6 - 184));
    swift_release();
  }
  return v0;
}

void type metadata accessor for WorkService.ConfigurationResolution()
{
  JUMPOUT(0x24959304CLL);
}

void sub_247E63750(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v41)(uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[16];
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v48 = a5;
  v49 = a6;
  v46[14] = a3;
  v46[15] = a2;
  v47 = a9;
  v50 = a10;
  v51 = a8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = sub_247E82560();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v46[10] = (char *)v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v46 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v46[9] = (char *)v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v46[12] = (char *)v46 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v46[11] = (char *)v46 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)v46 - v28;
  v30 = a1;
  v32 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v21, v30, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v21, 1, AssociatedTypeWitness) == 1)
  {
    v46[8] = v32;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v14);
    v52 = a4;
    v53 = v48;
    v54 = v49;
    v55 = a7;
    v56 = v51;
    v57 = v50;
    type metadata accessor for WorkService();
  }
  v33 = a4;
  v34 = v49;
  v35 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
  v35(v29, v21, AssociatedTypeWitness);
  if (qword_254458F78 != -1)
    swift_once();
  v36 = (void *)qword_25445AD08;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_247E83230;
  v38 = a7;
  v39 = v33;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v41 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
  v42 = v36;
  v43 = v41(AssociatedTypeWitness, AssociatedConformanceWitness);
  v45 = v44;
  *(_QWORD *)(v37 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v37 + 64) = sub_247DBCF64();
  *(_QWORD *)(v37 + 32) = v43;
  *(_QWORD *)(v37 + 40) = v45;
  sub_247E824A0();
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  v35(v47, v29, AssociatedTypeWitness);
  v52 = v39;
  v53 = v48;
  v54 = v34;
  v55 = v38;
  v56 = v51;
  v57 = v50;
  type metadata accessor for WorkService.ConfigurationResolution();
}

uint64_t sub_247E64304()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  uint64_t AssociatedConformanceWitness;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = sub_247E82368();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  swift_bridgeObjectRetain();
  MEMORY[0x2495930AC](MEMORY[0x24BEE12C8], v2);
  sub_247E823F8();
  v4 = swift_getAssociatedConformanceWitness();
  sub_247E681D0(AssociatedTypeWitness, AssociatedConformanceWitness, v4);
  if (!v0)
  {
    if (qword_254458F78 != -1)
      swift_once();
    v5 = (void *)qword_25445AD08;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_247E83230;
    v7 = sub_247E823EC();
    v8 = v5;
    MEMORY[0x2495930AC](MEMORY[0x24BEE1730], v7);
    sub_247E8283C();
    *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v6 + 64) = sub_247DBCF64();
    *(_QWORD *)(v6 + 32) = 0;
    *(_QWORD *)(v6 + 40) = 0xE000000000000000;
    sub_247E824A0();
    sub_247E81FE4();

    swift_bridgeObjectRelease();
    AssociatedTypeWitness = sub_247E823A4();
  }
  swift_bridgeObjectRelease();
  return AssociatedTypeWitness;
}

uint64_t sub_247E645A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  __int128 v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  unint64_t v52;
  uint64_t v53;

  v49 = a1;
  v53 = *MEMORY[0x24BDAC8D0];
  v1 = sub_247E81C54();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static WorkService.loadedConfigurationURL(resourcesDirectory:)();
  if (qword_254458F78 != -1)
    swift_once();
  v5 = (void *)qword_25445AD08;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_247E83230;
  v8 = sub_247E71740((unint64_t *)&qword_25445A628, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
  v9 = v5;
  v46 = v8;
  v10 = sub_247E82824();
  v12 = v11;
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  v48 = sub_247DBCF64();
  *(_QWORD *)(v7 + 64) = v48;
  *(_QWORD *)(v7 + 32) = v10;
  *(_QWORD *)(v7 + 40) = v12;
  sub_247E824A0();
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v14 = (void *)sub_247E81BE8();
  v51 = 0;
  v15 = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, &v51);

  v16 = v51;
  v47 = v1;
  if (v15)
  {
    v45 = v6;
    sub_247E81AF8();
    swift_allocObject();
    v17 = v16;
    sub_247E81AEC();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v44 = sub_247E81AE0();
    v35 = v34;
    swift_release();
    v36 = (void *)qword_25445AD08;
    v37 = swift_allocObject();
    v42 = xmmword_247E83500;
    *(_OWORD *)(v37 + 16) = xmmword_247E83500;
    v38 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
    v43 = v36;
    v39 = v38(AssociatedTypeWitness, AssociatedConformanceWitness);
    v40 = v48;
    *(_QWORD *)(v37 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v37 + 64) = v40;
    *(_QWORD *)(v37 + 32) = v39;
    *(_QWORD *)(v37 + 40) = v41;
    v51 = 0;
    v52 = 0xE000000000000000;
    __asm { BR              X10 }
  }
  v20 = v51;
  v21 = (void *)sub_247E81B7C();

  swift_willThrow();
  v22 = (id)qword_25445AD08;
  sub_247E82488();
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_247E83500;
  swift_getAssociatedTypeWitness();
  v24 = swift_getAssociatedConformanceWitness();
  v25 = *(uint64_t (**)(uint64_t, uint64_t))(v24 + 48);
  v26 = swift_checkMetadataState();
  v27 = v25(v26, v24);
  v28 = MEMORY[0x24BEE0D00];
  v29 = v48;
  *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v23 + 64) = v29;
  *(_QWORD *)(v23 + 32) = v27;
  *(_QWORD *)(v23 + 40) = v30;
  v51 = 0;
  v52 = 0xE000000000000000;
  v50 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
  sub_247E82710();
  v31 = v51;
  v32 = v52;
  *(_QWORD *)(v23 + 96) = v28;
  *(_QWORD *)(v23 + 104) = v29;
  *(_QWORD *)(v23 + 72) = v31;
  *(_QWORD *)(v23 + 80) = v32;
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v47);
}

void sub_247E64C88(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;

  v2 = v1;
  v4 = *v1;
  v5 = sub_247E82134();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (_QWORD **)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)((char *)v2 + *(_QWORD *)(v4 + 192));
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5610], v5);
  v10 = v9;
  LOBYTE(v9) = sub_247E8214C();
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) != 0)
  {
    swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 56);
    v13 = swift_checkMetadataState();
    v26 = v12(v13, AssociatedConformanceWitness);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    v14 = sub_247E82368();
    swift_getAssociatedConformanceWitness();
    MEMORY[0x2495930AC](MEMORY[0x24BEE12C8], v14);
    sub_247E823F8();
    sub_247E66304();
    swift_bridgeObjectRelease();
    if (qword_25445AFA8 != -1)
      swift_once();
    v24 = (id)qword_25445B018;
    sub_247E824A0();
    sub_247E81FE4();

    sub_247E645A0(a1);
  }
  else
  {
    __break(1u);
    swift_once();
    v15 = (id)qword_25445B018;
    sub_247E82488();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_247E83500;
    v26 = 0;
    v27 = 0xE000000000000000;
    v25 = (_QWORD *)v6;
    v17 = sub_247E823EC();
    MEMORY[0x2495930AC](MEMORY[0x24BEE1730], v17);
    sub_247E8283C();
    swift_bridgeObjectRelease();
    v18 = v26;
    v19 = v27;
    v20 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v16 + 56) = MEMORY[0x24BEE0D00];
    v21 = sub_247DBCF64();
    *(_QWORD *)(v16 + 64) = v21;
    *(_QWORD *)(v16 + 32) = v18;
    *(_QWORD *)(v16 + 40) = v19;
    v26 = 0;
    v27 = 0xE000000000000000;
    v25 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
    sub_247E82710();
    v22 = v26;
    v23 = v27;
    *(_QWORD *)(v16 + 96) = v20;
    *(_QWORD *)(v16 + 104) = v21;
    *(_QWORD *)(v16 + 72) = v22;
    *(_QWORD *)(v16 + 80) = v23;
    sub_247E81FE4();

    swift_bridgeObjectRelease();
  }
}

uint64_t WorkService.runningVersion.getter()
{
  char *v0;
  uint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;

  v1 = *(_QWORD *)v0;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = sub_247E82560();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - v5;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)&v11 - v5, &v0[*(_QWORD *)(v1 + 128)], v3);
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v6, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return 0;
  }
  else
  {
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v6, AssociatedTypeWitness);
  }
  return v8;
}

uint64_t WorkService.loadedVersion.getter()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = sub_247E82560();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - v3;
  sub_247DBB9E4((uint64_t)&v9 - v3);
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v4, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return 0;
  }
  else
  {
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v4, AssociatedTypeWitness);
  }
  return v6;
}

Swift::Void __swiftcall WorkService.enteredBackground()()
{
  sub_247E65D00((uint64_t)&unk_251963AC0, (uint64_t)sub_247E700C8, (uint64_t)&block_descriptor_9);
}

void sub_247E65334()
{
  uint64_t Strong;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    v2 = *(_QWORD *)(*(_QWORD *)Strong + 240);
    if ((*(_BYTE *)(Strong + v2) & 1) != 0)
    {
      if (qword_25445AFB0 != -1)
        swift_once();
      v3 = (id)qword_25445B020;
      sub_247E82494();
      sub_247E81FE4();
      swift_release();

    }
    else
    {
      *(_BYTE *)(Strong + v2) = 1;
      if (qword_25445AFB0 != -1)
        swift_once();
      v4 = (id)qword_25445B020;
      sub_247E824A0();
      sub_247E81FE4();

      dispatch_group_enter(*(dispatch_group_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 232)));
      sub_247E65498();
      sub_247E6584C();
      swift_release();
    }
  }
}

void sub_247E65498()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v1 = *v0;
  v2 = sub_247E820D4();
  v24 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_247E82104();
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_247E82134();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (id *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)((char *)v0 + *(_QWORD *)(v1 + 192));
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5610], v8);
  v22 = v12;
  LOBYTE(v12) = sub_247E8214C();
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = *(_QWORD *)(*v0 + 248);
  if ((*((_BYTE *)v0 + v13) & 1) != 0)
  {
    if (qword_25445AFB0 == -1)
    {
LABEL_4:
      v14 = (id)qword_25445B020;
      sub_247E824A0();
      sub_247E81FE4();

      return;
    }
LABEL_9:
    swift_once();
    goto LABEL_4;
  }
  if (qword_25445AFB0 != -1)
    swift_once();
  v15 = (id)qword_25445B020;
  sub_247E824A0();
  v16 = MEMORY[0x24BEE4AF8];
  sub_247E81FE4();

  *((_BYTE *)v0 + v13) = 1;
  v17 = *(void **)((char *)v0 + *(_QWORD *)(*v0 + 232));
  v18 = swift_allocObject();
  swift_weakInit();
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = *(_OWORD *)(v1 + 80);
  *(_QWORD *)(v19 + 32) = *(_QWORD *)(v1 + 96);
  *(_OWORD *)(v19 + 40) = *(_OWORD *)(v1 + 104);
  *(_QWORD *)(v19 + 56) = *(_QWORD *)(v1 + 120);
  *(_QWORD *)(v19 + 64) = v18;
  aBlock[4] = sub_247E71358;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247E662D4;
  aBlock[3] = &block_descriptor_48;
  v20 = _Block_copy(aBlock);
  v21 = v17;
  swift_retain();
  sub_247E820EC();
  v25 = v16;
  sub_247E71740(&qword_254458F80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD70);
  sub_247E70064(&qword_25445AD78, &qword_25445AD70);
  sub_247E825B4();
  sub_247E824B8();
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v23);
  swift_release();
  swift_release();
}

uint64_t sub_247E6584C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t AssociatedConformanceWitness;
  void (*v25)(_QWORD, _QWORD);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(_QWORD, _QWORD);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD aBlock[7];

  v1 = v0;
  v2 = *v0;
  v3 = sub_247E820D4();
  v55 = *(_QWORD *)(v3 - 8);
  v56 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v54 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_247E82104();
  v52 = *(_QWORD *)(v5 - 8);
  v53 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v51 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247E820E0();
  v46 = *(_QWORD *)(v7 - 8);
  v47 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_247E820C8();
  v43 = *(_QWORD *)(v9 - 8);
  v44 = (void (*)(_QWORD, _QWORD))v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v50 = sub_247E82128();
  v42 = *(_QWORD *)(v50 - 8);
  v12 = MEMORY[0x24BDAC7A8](v50);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v49 = (char *)&v41 - v15;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = sub_247E82560();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v41 - v19;
  v21 = *(_QWORD *)(v2 + 128);
  v48 = v1;
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v20, (char *)v1 + v21, v17);
  v22 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, AssociatedTypeWitness) == 1)
  {
    v23 = 10000;
  }
  else
  {
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 40))(AssociatedTypeWitness, AssociatedConformanceWitness);
    v18 = v22;
    v17 = AssociatedTypeWitness;
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  sub_247E8211C();
  *v11 = v23;
  v26 = v43;
  v25 = v44;
  (*(void (**)(uint64_t *, _QWORD, void (*)(_QWORD, _QWORD)))(v43 + 104))(v11, *MEMORY[0x24BEE5410], v44);
  v27 = v49;
  MEMORY[0x2495923D4](v14, v11);
  (*(void (**)(uint64_t *, _QWORD))(v26 + 8))(v11, v25);
  v44 = *(void (**)(_QWORD, _QWORD))(v42 + 8);
  v28 = v50;
  v44(v14, v50);
  sub_247E71424(0, &qword_25445ADE0);
  v30 = v45;
  v29 = v46;
  v31 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v45, *MEMORY[0x24BEE5498], v47);
  v32 = (void *)sub_247E8250C();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  v33 = *(void **)((char *)v48 + *(_QWORD *)(*v48 + 232));
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v33;
  aBlock[4] = sub_247E71350;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247E65090;
  aBlock[3] = &block_descriptor_41;
  v35 = _Block_copy(aBlock);
  v36 = v33;
  v37 = v51;
  sub_247E820EC();
  v57 = MEMORY[0x24BEE4AF8];
  sub_247E71740(&qword_254458F80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD70);
  sub_247E70064(&qword_25445AD78, &qword_25445AD70);
  v38 = v54;
  v39 = v56;
  sub_247E825B4();
  MEMORY[0x249592764](v27, v37, v38, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v39);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v53);
  v44(v27, v28);
  return swift_release();
}

uint64_t sub_247E65D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v17[0] = a3;
  v5 = *v3;
  v6 = sub_247E820D4();
  v18 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_247E82104();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = *(uint64_t *)((char *)v3 + *(_QWORD *)(v5 + 192));
  v13 = swift_allocObject();
  swift_weakInit();
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = *(_OWORD *)(v5 + 80);
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v5 + 96);
  *(_OWORD *)(v14 + 40) = *(_OWORD *)(v5 + 104);
  *(_QWORD *)(v14 + 56) = *(_QWORD *)(v5 + 120);
  *(_QWORD *)(v14 + 64) = v13;
  aBlock[4] = a2;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247E65090;
  aBlock[3] = v17[0];
  v15 = _Block_copy(aBlock);
  swift_retain();
  sub_247E820EC();
  v19 = MEMORY[0x24BEE4AF8];
  sub_247E71740(&qword_254458F80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD70);
  sub_247E70064(&qword_25445AD78, &qword_25445AD70);
  sub_247E825B4();
  MEMORY[0x249592788](0, v12, v8, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
  return swift_release();
}

uint64_t sub_247E65F34()
{
  uint64_t result;
  uint64_t v1;
  id v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    if (qword_25445AFB0 != -1)
      swift_once();
    v2 = (id)qword_25445B020;
    sub_247E824A0();
    sub_247E81FE4();

    dispatch_group_enter(*(dispatch_group_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 232)));
    sub_247E65498();
    sub_247E6584C();
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall WorkService.didBecomeActive()()
{
  sub_247E65D00((uint64_t)&unk_251963B10, (uint64_t)sub_247E700F8, (uint64_t)&block_descriptor_16);
}

void sub_247E66024()
{
  uint64_t Strong;
  id v1;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(_BYTE *)(Strong + *(_QWORD *)(*(_QWORD *)Strong + 240)) = 0;
    if (qword_25445AFB0 != -1)
      swift_once();
    v1 = (id)qword_25445B020;
    sub_247E824A0();
    sub_247E81FE4();
    swift_release();

  }
}

void sub_247E660EC()
{
  uint64_t Strong;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    if ((*(_BYTE *)(Strong + *(_QWORD *)(*(_QWORD *)Strong + 240)) & 1) != 0
      || (*(_BYTE *)(Strong + *(_QWORD *)(*(_QWORD *)Strong + 296)) & 1) == 0)
    {
      if (qword_25445AFB0 != -1)
        swift_once();
      v3 = (id)qword_25445B020;
      sub_247E824A0();
      sub_247E81FE4();

      v4 = (uint64_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 208));
      v5 = *v4;
      *v4 = 0;
      v4[1] = 0;
      sub_247E70104(v5);
      *(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 224)) = 0;
    }
    else
    {
      if (qword_25445AFB0 != -1)
        swift_once();
      v2 = (id)qword_25445B020;
      sub_247E824A0();
      sub_247E81FE4();

    }
    *(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 248)) = 0;
    swift_release();
  }
  else
  {
    if (qword_25445AFB0 != -1)
      swift_once();
    v6 = (id)qword_25445B020;
    sub_247E82488();
    sub_247E81FE4();

  }
}

uint64_t sub_247E662D8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_247E66304()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  char v7;

  v2 = *v0;
  if (qword_25445AFA8 != -1)
    swift_once();
  v3 = (id)qword_25445B018;
  sub_247E824A0();
  sub_247E81FE4();

  result = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v2 + 120) + 24))(*(_QWORD *)(v2 + 96), *(_QWORD *)(v2 + 120));
  if (!v1)
  {
    v5 = (void *)result;
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    swift_checkMetadataState();
    swift_getAssociatedConformanceWitness();
    v6 = sub_247E821C4();
    swift_bridgeObjectRetain();
    MEMORY[0x2495930AC](MEMORY[0x24BEE0310], v6);
    sub_247E823F8();
    v7 = sub_247E823BC();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
      type metadata accessor for WorkService.Errors();
    sub_247E6EBA0(v5);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247E665FC(int a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t result;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void (**v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t AssociatedConformanceWitness;
  uint64_t v37;
  uint64_t *v38;
  os_unfair_lock_s *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;
  unint64_t *v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  char *v64;
  void (*v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  os_unfair_lock_s *v75;
  uint64_t v76;
  uint64_t *p_stride;
  id v78;
  uint64_t v79;
  __int128 v80;
  unint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  os_unfair_lock_s *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  os_unfair_lock_s *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  unint64_t *v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  void *v118;
  __int128 v119;

  v2 = (uint64_t)v1;
  v116 = a1;
  v3 = (_QWORD *)*v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458DD0);
  MEMORY[0x24BDAC7A8](v4);
  v108 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_247E81C54();
  v106 = *(unint64_t **)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v107 = (char *)&v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v3[13];
  v109 = v3[10];
  v110 = v8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_247E82560();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v99 - v13;
  v115 = AssociatedTypeWitness;
  v111 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v12);
  v112 = (uint64_t)&v99 - v15;
  v16 = sub_247E82128();
  v113 = *(_QWORD *)(v16 - 8);
  v114 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v117 = (uint64_t)&v99 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_247E82134();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (unint64_t *)((char *)&v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = *(void **)(v2 + v3[24]);
  *v21 = v22;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x24BEE5610], v18);
  v23 = v22;
  LOBYTE(v22) = sub_247E8214C();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v19 + 8))(v21, v18);
  if ((v22 & 1) == 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  v25 = *(_QWORD *)v2;
  v21 = *(_QWORD **)(*(_QWORD *)v2 + 224);
  if (*((_BYTE *)v21 + v2) == 1 && ((v116 & 1) == 0 || (*(_BYTE *)(v2 + *(_QWORD *)(v25 + 256)) & 1) != 0))
    return result;
  if (*(_BYTE *)(v2 + *(_QWORD *)(v25 + 240)) == 1)
  {
    if (qword_25445AFB0 == -1)
    {
LABEL_7:
      v26 = (id)qword_25445B020;
      sub_247E824A0();
      sub_247E81FE4();

      sub_247E65498();
      goto LABEL_8;
    }
LABEL_31:
    swift_once();
    goto LABEL_7;
  }
LABEL_8:
  v27 = sub_247E8211C();
  if ((*((_BYTE *)v21 + v2) & 1) != 0)
  {
    if (qword_25445AFA0 != -1)
      swift_once();
    v28 = (id)qword_25445B010;
    sub_247E824A0();
    sub_247E81FE4();

  }
  else
  {
    v29 = *(_QWORD *)v2;
    v30 = (void (**)(uint64_t))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 168));
    if (*v30)
    {
      (*v30)(v27);
      v29 = *(_QWORD *)v2;
    }
    v31 = v115;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v2 + *(_QWORD *)(v29 + 128), v10);
    v32 = v111;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v111 + 48))(v14, 1, v31) == 1)
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      if (qword_25445AFA0 != -1)
        swift_once();
      v33 = (id)qword_25445B010;
      sub_247E824A0();
      sub_247E81FE4();

      v34 = *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 216));
      v35 = swift_getAssociatedTypeWitness();
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      type metadata accessor for WorkServiceData(255, v35, AssociatedConformanceWitness, v37);
      sub_247E82560();
      v38 = (uint64_t *)(v34 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v34 + 16));
      v39 = (os_unfair_lock_s *)(v34 + ((*(unsigned int *)(*(_QWORD *)v34 + 48) + 3) & 0x1FFFFFFFCLL));
      swift_retain();
      os_unfair_lock_lock(v39);
      sub_247E6778C(v38);
      os_unfair_lock_unlock(v39);
      swift_release();
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v112, v14, v31);
      if (*(_BYTE *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 256)) == 1)
      {
        if (qword_25445AFB0 != -1)
          swift_once();
        v40 = (id)qword_25445B020;
        sub_247E824A0();
        sub_247E81FE4();

      }
      v104 = v6;
      v41 = swift_getAssociatedConformanceWitness();
      (*(void (**)(uint64_t))(v41 + 56))(v31);
      sub_247E6785C();
      v105 = 0;
      swift_bridgeObjectRelease();
      if (qword_25445AFA0 != -1)
        swift_once();
      v42 = (void *)qword_25445B010;
      v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
      v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_247E83510;
      v44 = *(uint64_t (**)(uint64_t, uint64_t))(v41 + 48);
      v102 = v42;
      v45 = v115;
      v46 = v44(v115, v41);
      v48 = v47;
      *(_QWORD *)(v43 + 56) = MEMORY[0x24BEE0D00];
      v49 = sub_247DBCF64();
      *(_QWORD *)(v43 + 64) = v49;
      *(_QWORD *)(v43 + 32) = v46;
      *(_QWORD *)(v43 + 40) = v48;
      v101 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 176);
      sub_247E71740((unint64_t *)&qword_25445A628, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v50 = v104;
      v51 = sub_247E82824();
      v52 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v43 + 96) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v43 + 104) = v49;
      *(_QWORD *)(v43 + 72) = v51;
      *(_QWORD *)(v43 + 80) = v53;
      v100 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 184);
      v54 = sub_247E82824();
      *(_QWORD *)(v43 + 136) = v52;
      *(_QWORD *)(v43 + 144) = v49;
      *(_QWORD *)(v43 + 112) = v54;
      *(_QWORD *)(v43 + 120) = v55;
      v56 = *(uint64_t (**)(uint64_t, uint64_t))(v41 + 64);
      v57 = v56(v45, v41);
      v58 = sub_247E67CD8(v57);
      *(_QWORD *)(v43 + 176) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v43 + 184) = v49;
      v99 = v49;
      *(_QWORD *)(v43 + 152) = v58;
      *(_QWORD *)(v43 + 160) = v59;
      sub_247E824A0();
      v60 = v102;
      sub_247E81FE4();

      swift_bridgeObjectRelease();
      v61 = v106;
      v62 = (uint64_t)v107;
      v63 = (void (*)(char *, uint64_t, uint64_t))v106[2];
      v63(v107, v101, v50);
      v64 = v108;
      v63(v108, v100, v50);
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v61[7])(v64, 0, 1, v50);
      v65 = (void (*)(char *, uint64_t, uint64_t))v56(v115, v41);
      type metadata accessor for ResourceReader();
      swift_allocObject();
      v66 = (uint64_t)v64;
      v67 = v105;
      v68 = ResourceReader.init(baseDirectory:modelsDirectory:computeUnits:)(v62, v66, v65);
      v69 = v67;
      if (v67)
      {
        v70 = *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 216));
        v71 = swift_getAssociatedTypeWitness();
        v72 = swift_getAssociatedConformanceWitness();
        type metadata accessor for WorkServiceData(255, v71, v72, v73);
        sub_247E82560();
        v74 = (uint64_t *)(v70 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v70 + 16));
        v75 = (os_unfair_lock_s *)(v70 + ((*(unsigned int *)(*(_QWORD *)v70 + 48) + 3) & 0x1FFFFFFFCLL));
        swift_retain();
        os_unfair_lock_lock(v75);
        v76 = v112;
        sub_247E68E48(v74, v112, v2);
        os_unfair_lock_unlock(v75);
        swift_release();
        p_stride = &value witness table for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest.stride;
        v78 = (id)qword_25445B010;
        sub_247E82488();
        v79 = swift_allocObject();
        *(_OWORD *)(v79 + 16) = xmmword_247E83230;
        *(_QWORD *)&v119 = 0;
        *((_QWORD *)&v119 + 1) = 0xE000000000000000;
        v118 = v69;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
        sub_247E82710();
        v80 = v119;
        v81 = v99;
        *(_QWORD *)(v79 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v79 + 64) = v81;
        *(_OWORD *)(v79 + 32) = v80;
        sub_247E81FE4();

        swift_bridgeObjectRelease();
      }
      else
      {
        v82 = v68;
        sub_247E262A0(&v119);
        v86 = (uint64_t *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 208));
        v87 = *v86;
        *(_OWORD *)v86 = v119;
        sub_247E70104(v87);
        v106 = &v99;
        v88 = *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 216));
        v89 = (char *)v3[15];
        v107 = (char *)v3[12];
        v108 = v89;
        v90 = swift_getAssociatedTypeWitness();
        v91 = swift_getAssociatedConformanceWitness();
        type metadata accessor for WorkServiceData(255, v90, v91, v92);
        sub_247E82560();
        v93 = (uint64_t *)(v88 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v88 + 16));
        v94 = (os_unfair_lock_s *)(v88 + ((*(unsigned int *)(*(_QWORD *)v88 + 48) + 3) & 0x1FFFFFFFCLL));
        swift_retain();
        os_unfair_lock_lock(v94);
        v95 = v112;
        sub_247E67DEC(v93, v112, v82, v2);
        os_unfair_lock_unlock(v94);
        swift_release();
        v106 = &v99;
        v96 = *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 272));
        swift_getAssociatedTypeWitness();
        sub_247E82368();
        v97 = (uint64_t *)(v96 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v96 + 16));
        v98 = (os_unfair_lock_s *)(v96 + ((*(unsigned int *)(*(_QWORD *)v96 + 48) + 3) & 0x1FFFFFFFCLL));
        swift_retain();
        os_unfair_lock_lock(v98);
        v76 = v95;
        sub_247E68A48(v97);
        os_unfair_lock_unlock(v98);
        swift_release();
        swift_release();
        p_stride = (_QWORD *)(&value witness table for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest + 72);
      }
      v83 = (id)p_stride[2];
      sub_247E824A0();
      sub_247E81FE4();

      (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v76, v115);
    }
  }
  v84 = v2;
  v85 = v117;
  sub_247E674F4(v116 & 1, v84, v117);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 8))(v85, v114);
}

uint64_t sub_247E674F4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t p_stride;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  __int128 v23;

  v6 = sub_247E82128();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)a2;
  p_stride = (unint64_t)&value witness table for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest.stride;
  if ((a1 & 1) == 0 || (*(_BYTE *)(a2 + *(_QWORD *)(v10 + 256)) & 1) != 0)
    goto LABEL_8;
  if (qword_25445AFA0 != -1)
    goto LABEL_13;
  while (1)
  {
    v12 = *(id *)(p_stride + 16);
    sub_247E824A0();
    sub_247E81FE4();

    v13 = (uint64_t *)(a2 + *(_QWORD *)(*(_QWORD *)a2 + 208));
    v14 = *v13;
    if (*v13)
    {
      v15 = v13[1];
      *(_QWORD *)&v23 = *v13;
      *((_QWORD *)&v23 + 1) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247E6E83C(&v23);
      sub_247E70104(v14);
    }
    else
    {
      v16 = *(id *)(p_stride + 16);
      sub_247E82488();
      sub_247E81FE4();

    }
    sub_247E6FDCC(a3, a2);
    v10 = *(_QWORD *)a2;
LABEL_8:
    *(_BYTE *)(a2 + *(_QWORD *)(v10 + 224)) = 1;
    if (qword_25445AFA0 != -1)
      swift_once();
    v17 = *(void **)(p_stride + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_247E83230;
    v19 = v17;
    sub_247E8211C();
    p_stride = sub_247E82110();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    a2 = a3;
    v20 = sub_247E82110();
    if (p_stride >= v20)
      break;
    __break(1u);
LABEL_13:
    swift_once();
  }
  v21 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v18 + 64) = v21;
  *(double *)(v18 + 32) = (double)(p_stride - v20) / 1000000.0;
  sub_247E824A0();
  sub_247E81FE4();

  return swift_bridgeObjectRelease();
}

double sub_247E6778C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;

  sub_247E714AC(*a1, a1[1]);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  static WorkServiceData.uninitalized.getter((uint64_t)&v6);
  v2 = v8;
  v3 = v9;
  v4 = v10;
  *a1 = v6;
  result = *(double *)&v7;
  *(_OWORD *)(a1 + 1) = v7;
  a1[3] = v2;
  a1[4] = v3;
  a1[5] = v4;
  return result;
}

void sub_247E6785C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t AssociatedConformanceWitness;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;

  if ((*(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 264)) & 1) != 0)
  {
    if (qword_254458F78 != -1)
      swift_once();
    v2 = (id)qword_25445AD08;
    sub_247E824A0();
    sub_247E81FE4();

  }
  else
  {
    v3 = v0;
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = sub_247E82368();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    swift_bridgeObjectRetain();
    MEMORY[0x2495930AC](MEMORY[0x24BEE12C8], v5);
    sub_247E823F8();
    v7 = swift_getAssociatedConformanceWitness();
    sub_247E681D0(AssociatedTypeWitness, AssociatedConformanceWitness, v7);
    if (v1)
    {
      swift_bridgeObjectRelease();
      *(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 264)) = 1;
    }
    else
    {
      if (qword_254458F78 != -1)
        swift_once();
      v8 = (void *)qword_25445AD08;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
      v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_247E83230;
      v10 = sub_247E823EC();
      v11 = v8;
      MEMORY[0x2495930AC](MEMORY[0x24BEE1730], v10);
      sub_247E8283C();
      *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
      v17 = sub_247DBCF64();
      *(_QWORD *)(v9 + 64) = v17;
      *(_QWORD *)(v9 + 32) = 0;
      *(_QWORD *)(v9 + 40) = 0xE000000000000000;
      sub_247E824A0();
      sub_247E81FE4();

      swift_bridgeObjectRelease();
      v12 = sub_247E823A4();
      swift_bridgeObjectRelease();
      if ((sub_247E823D4() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v13 = (id)qword_25445AD08;
        sub_247E824A0();
        sub_247E81FE4();

      }
      else
      {
        v14 = (void *)qword_25445AD08;
        v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_247E83230;
        v16 = v14;
        sub_247E8283C();
        *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v15 + 64) = v17;
        *(_QWORD *)(v15 + 32) = 0;
        *(_QWORD *)(v15 + 40) = 0xE000000000000000;
        sub_247E824A0();
        sub_247E81FE4();

        swift_bridgeObjectRelease();
        sub_247E6DCA8(v12);
        swift_bridgeObjectRelease();
      }
      *(_BYTE *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 264)) = 1;
    }
  }
}

unint64_t sub_247E67CD8(uint64_t a1)
{
  unint64_t result;
  _QWORD v3[2];

  result = 0x796C6E4F757063;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x5047646E41757063;
      break;
    case 2:
      result = 7105633;
      break;
    case 3:
      result = 0xD000000000000012;
      break;
    default:
      sub_247E82650();
      swift_bridgeObjectRelease();
      strcpy((char *)v3, "unknown value ");
      HIBYTE(v3[1]) = -18;
      sub_247E82824();
      sub_247E8229C();
      swift_bridgeObjectRelease();
      result = v3[0];
      break;
  }
  return result;
}

double sub_247E67DEC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double result;
  _QWORD v37[10];
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  unsigned __int8 v51;
  uint64_t v52;
  uint64_t v53;

  v41 = a1;
  v5 = *(_QWORD **)a4;
  v6 = *(_QWORD *)(*(_QWORD *)a4 + 104);
  v7 = *(_QWORD *)(*(_QWORD *)a4 + 80);
  swift_getAssociatedTypeWitness();
  v39 = v7;
  v40 = v6;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
  v10 = swift_checkMetadataState();
  v11 = v9(v10, AssociatedConformanceWitness);
  v45 = v12;
  v46 = v11;
  v44 = sub_247E24B00();
  v47 = a4;
  v13 = v5[15];
  v14 = v5[12];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16 = swift_getAssociatedConformanceWitness();
  v17 = swift_getAssociatedTypeWitness();
  v42 = AssociatedTypeWitness;
  v43 = v16;
  v18 = swift_getAssociatedConformanceWitness();
  v19 = swift_getAssociatedConformanceWitness();
  v20 = sub_247E681D0(v17, v18, v19);
  if (v38)
  {

    v20 = 0;
  }
  v53 = v20;
  v21 = (_QWORD *)swift_allocObject();
  v38 = &v38;
  v22 = v40;
  v21[2] = v39;
  v21[3] = v5[11];
  v21[4] = v14;
  v21[5] = v22;
  v21[6] = v5[14];
  v21[7] = v13;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v37[2] = v25;
  v37[3] = v24;
  v37[4] = v14;
  v37[5] = v26;
  v37[6] = v27;
  v37[7] = v13;
  v37[8] = sub_247E71494;
  v37[9] = v23;
  sub_247E823EC();
  sub_247E82560();
  v28 = sub_247E82368();
  sub_247E6219C((void (*)(char *, char *))sub_247E71498, (uint64_t)v37, MEMORY[0x24BEE4078], v28, v29, (uint64_t)&v48);
  v30 = v41;
  sub_247E714AC(*v41, v41[1]);
  swift_release();
  swift_bridgeObjectRelease();
  if (v48)
  {
    v53 = v48;
    MEMORY[0x2495930AC](MEMORY[0x24BEE12C8], v28);
    swift_getAssociatedConformanceWitness();
    v31 = sub_247E822F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v31 = sub_247E82344();
  }
  if (*(_BYTE *)(v47 + *(_QWORD *)(*(_QWORD *)v47 + 144)) == 1)
    v32 = sub_247DFFDA4(MEMORY[0x24BEE4AF8]);
  else
    v32 = 0;
  swift_checkMetadataState();
  WorkServiceData.init(configurationVersion:packageVersions:cachedPackageIDs:resolvedGlobalGraph:requestsByWorkName:)(v46, v45, (uint64_t)v44, v31, 1, v32, (uint64_t)&v48);
  v33 = v50;
  v34 = v51;
  v35 = v52;
  *v30 = v48;
  result = *(double *)&v49;
  *(_OWORD *)(v30 + 1) = v49;
  v30[3] = v33;
  v30[4] = v34;
  v30[5] = v35;
  return result;
}

uint64_t sub_247E681D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t inited;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  char v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  void (*v64)(char *, uint64_t);
  char *v65;
  id v66;
  uint64_t *v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  char *v71;
  void (*v72)(char *, unint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;

  v83 = a3;
  v86 = a2;
  v95 = *MEMORY[0x24BDAC8D0];
  v75 = sub_247E82560();
  v74 = *(_QWORD *)(v75 - 8);
  v5 = MEMORY[0x24BDAC7A8](v75);
  v82 = (char *)&v68 - v6;
  v87 = a1;
  v81 = *(_QWORD *)(a1 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v80 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v79 = (char *)&v68 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v78 = (char *)&v68 - v11;
  v12 = sub_247E81C54();
  v89 = *(_QWORD *)(v12 - 8);
  v90 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v92 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458DD0);
  MEMORY[0x24BDAC7A8](v14);
  v85 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_247E81B70();
  v84 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v68 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AEB8);
  inited = swift_initStackObject();
  v88 = xmmword_247E83230;
  *(_OWORD *)(inited + 16) = xmmword_247E83230;
  v24 = (void *)*MEMORY[0x24BDBCC60];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC60];
  v76 = v24;
  sub_247E7C8A4(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  v26 = v25;
  swift_arrayDestroy();
  v27 = v3;
  v28 = v91;
  sub_247E81BB8();
  result = swift_bridgeObjectRelease();
  if (!v28)
  {
    v77 = v26;
    v73 = v22;
    v71 = v19;
    v30 = sub_247E81B58();
    v84 = *(_QWORD *)(v84 + 8);
    ((void (*)(char *, uint64_t))v84)(v21, v16);
    if ((v30 & 1) == 0)
    {
      _s6ErrorsOMa();
      sub_247E71740(&qword_257707330, (uint64_t (*)(uint64_t))_s6ErrorsOMa, (uint64_t)&unk_247E8D408);
      swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 16))(v31, v27, v90);
      swift_storeEnumTagMultiPayload();
      return swift_willThrow();
    }
    v91 = 0;
    v94 = sub_247E82194();
    v32 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v33 = (void *)sub_247E81BE8();
    v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = v88;
    v35 = v76;
    *(_QWORD *)(v34 + 32) = v76;
    v76 = v35;
    v36 = (void *)sub_247E82308();
    swift_bridgeObjectRelease();
    v93 = 0;
    v37 = objc_msgSend(v32, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v33, v36, 0, &v93);

    v38 = v93;
    if (!v37)
    {
      v66 = v93;
      swift_bridgeObjectRelease();
      sub_247E81B7C();

      return swift_willThrow();
    }
    v39 = v90;
    v40 = sub_247E82314();
    v41 = v38;

    v42 = *(_QWORD *)(v40 + 16);
    if (v42)
    {
      v43 = v89;
      v44 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
      v68 = v40;
      v45 = v40 + v44;
      v70 = *(_QWORD *)(v89 + 72);
      v72 = *(void (**)(char *, unint64_t, uint64_t))(v89 + 16);
      v46 = v92;
      v47 = v85;
      v48 = v71;
      v72(v85, v45, v39);
      while (1)
      {
        v69 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56);
        v69(v47, 0, 1, v39);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v47, 1, v39) == 1)
          break;
        (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v46, v47, v39);
        v49 = swift_initStackObject();
        *(_OWORD *)(v49 + 16) = v88;
        v50 = v76;
        *(_QWORD *)(v49 + 32) = v76;
        v51 = v50;
        sub_247E7C8A4(v49);
        swift_setDeallocating();
        v46 = v92;
        swift_arrayDestroy();
        v52 = v91;
        sub_247E81BB8();
        v91 = v52;
        if (v52)
        {
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v89 + 8))(v46, v90);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        v53 = sub_247E81B58();
        ((void (*)(char *, uint64_t))v84)(v48, v16);
        if ((v53 & 1) != 0)
        {
          v54 = v16;
          v55 = sub_247E81BDC();
          v57 = v56;
          swift_bridgeObjectRetain();
          v58 = v82;
          v59 = v87;
          sub_247E82830();
          v60 = v58;
          v61 = v81;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48))(v60, 1, v59) == 1)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v74 + 8))(v60, v75);
            _s6ErrorsOMa();
            sub_247E71740(&qword_257707330, (uint64_t (*)(uint64_t))_s6ErrorsOMa, (uint64_t)&unk_247E8D408);
            swift_allocError();
            *v67 = v55;
            v67[1] = v57;
            swift_storeEnumTagMultiPayload();
            swift_willThrow();
            return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v92, v90);
          }
          swift_bridgeObjectRelease();
          v62 = v78;
          (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v78, v60, v59);
          (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v80, v62, v59);
          sub_247E823EC();
          v63 = v79;
          sub_247E823C8();
          v64 = *(void (**)(char *, uint64_t))(v61 + 8);
          v64(v63, v59);
          v65 = v62;
          v47 = v85;
          v64(v65, v59);
          v46 = v92;
          v16 = v54;
          v48 = v71;
        }
        v43 = v89;
        v39 = v90;
        (*(void (**)(char *, uint64_t))(v89 + 8))(v46, v90);
        v45 += v70;
        if (!--v42)
        {
          v69(v47, 1, 1, v39);
          break;
        }
        v72(v47, v45, v39);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v89 + 56))(v85, 1, 1, v39);
    }
    swift_bridgeObjectRelease();
    return v94;
  }
  return result;
}

uint64_t sub_247E68A48(uint64_t *a1)
{
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 56);
  v4 = swift_checkMetadataState();
  result = v3(v4, AssociatedConformanceWitness);
  *a1 = result;
  return result;
}

double sub_247E68B00(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double result;
  _QWORD v37[10];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  unsigned __int8 v51;
  uint64_t v52;
  uint64_t v53;

  v5 = *(_QWORD **)a4;
  v6 = *(_QWORD *)(*(_QWORD *)a4 + 104);
  v7 = *(_QWORD *)(*(_QWORD *)a4 + 80);
  swift_getAssociatedTypeWitness();
  v41 = v7;
  v42 = v6;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
  v10 = swift_checkMetadataState();
  v11 = v9(v10, AssociatedConformanceWitness);
  v46 = v12;
  v47 = v11;
  v45 = sub_247E24B00();
  v13 = v5[15];
  v14 = v5[12];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v40 = v13;
  v16 = swift_getAssociatedConformanceWitness();
  v17 = swift_getAssociatedTypeWitness();
  v43 = AssociatedTypeWitness;
  v44 = v16;
  v18 = swift_getAssociatedConformanceWitness();
  v19 = swift_getAssociatedConformanceWitness();
  v20 = sub_247E681D0(v17, v18, v19);
  if (v39)
  {

    v20 = 0;
  }
  v53 = v20;
  v21 = (_QWORD *)swift_allocObject();
  v39 = &v38;
  v22 = v42;
  v21[2] = v41;
  v21[3] = v5[11];
  v21[4] = v14;
  v21[5] = v22;
  v23 = v40;
  v21[6] = v5[14];
  v21[7] = v23;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v37[2] = v26;
  v37[3] = v25;
  v37[4] = v14;
  v37[5] = v27;
  v37[6] = v28;
  v37[7] = v29;
  v37[8] = sub_247E7150C;
  v37[9] = v24;
  sub_247E823EC();
  sub_247E82560();
  v30 = sub_247E82368();
  sub_247E6219C((void (*)(char *, char *))sub_247E71530, (uint64_t)v37, MEMORY[0x24BEE4078], v30, v31, (uint64_t)&v48);
  sub_247E714AC(*a1, a1[1]);
  swift_release();
  swift_bridgeObjectRelease();
  v32 = v48;
  if (!v48)
    v32 = sub_247E82344();
  swift_checkMetadataState();
  WorkServiceData.init(configurationVersion:packageVersions:cachedPackageIDs:resolvedGlobalGraph:requestsByWorkName:)(v47, v46, (uint64_t)v45, v32, 0, 0, (uint64_t)&v48);
  v33 = v50;
  v34 = v51;
  v35 = v52;
  *a1 = v48;
  result = *(double *)&v49;
  *(_OWORD *)(a1 + 1) = v49;
  a1[3] = v33;
  a1[4] = v34;
  a1[5] = v35;
  return result;
}

double sub_247E68E48(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double result;
  _QWORD v35[10];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  unsigned __int8 v47;
  uint64_t v48;
  uint64_t v49;

  v4 = *(_QWORD **)a3;
  v5 = *(_QWORD *)(*(_QWORD *)a3 + 104);
  v6 = *(_QWORD *)(*(_QWORD *)a3 + 80);
  swift_getAssociatedTypeWitness();
  v39 = v6;
  v40 = v5;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
  v9 = swift_checkMetadataState();
  v10 = v8(v9, AssociatedConformanceWitness);
  v42 = v11;
  v43 = v10;
  v12 = v4[15];
  v13 = v4[12];
  swift_getAssociatedTypeWitness();
  v38 = v12;
  v14 = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v41 = v14;
  v16 = swift_getAssociatedConformanceWitness();
  v17 = swift_getAssociatedConformanceWitness();
  v18 = sub_247E681D0(AssociatedTypeWitness, v16, v17);
  if (v37)
  {

    v18 = 0;
  }
  v49 = v18;
  v19 = (_QWORD *)swift_allocObject();
  v37 = &v36;
  v20 = v40;
  v19[2] = v39;
  v19[3] = v4[11];
  v19[4] = v13;
  v19[5] = v20;
  v21 = v38;
  v19[6] = v4[14];
  v19[7] = v21;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v35[2] = v24;
  v35[3] = v23;
  v35[4] = v13;
  v35[5] = v25;
  v35[6] = v26;
  v35[7] = v27;
  v35[8] = sub_247E71554;
  v35[9] = v22;
  sub_247E823EC();
  sub_247E82560();
  v28 = sub_247E82368();
  sub_247E6219C((void (*)(char *, char *))sub_247E71558, (uint64_t)v35, MEMORY[0x24BEE4078], v28, v29, (uint64_t)&v44);
  sub_247E714AC(*a1, a1[1]);
  swift_release();
  swift_bridgeObjectRelease();
  v30 = v44;
  if (!v44)
    v30 = sub_247E82344();
  swift_checkMetadataState();
  WorkServiceData.init(configurationVersion:packageVersions:cachedPackageIDs:resolvedGlobalGraph:requestsByWorkName:)(v43, v42, MEMORY[0x24BEE4AF8], v30, 0, 0, (uint64_t)&v44);
  v31 = v46;
  v32 = v47;
  v33 = v48;
  *a1 = v44;
  result = *(double *)&v45;
  *(_OWORD *)(a1 + 1) = v45;
  a1[3] = v31;
  a1[4] = v32;
  a1[5] = v33;
  return result;
}

uint64_t sub_247E69188()
{
  uint64_t v0;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v0 = sub_247E823EC();
  swift_bridgeObjectRetain();
  MEMORY[0x2495930AC](MEMORY[0x24BEE1718], v0);
  return sub_247E82374();
}

uint64_t *WorkService.deinit()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = *v0;
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 128);
  v3 = *(_QWORD *)(*v0 + 80);
  swift_getAssociatedTypeWitness();
  v4 = sub_247E82560();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 136), v3);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 96) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 152));
  sub_247E6FF58(*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 160)));
  sub_247E6FF58(*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 168)));
  v5 = (uint64_t)v0 + *(_QWORD *)(*v0 + 176);
  v6 = sub_247E81C54();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((uint64_t)v0 + *(_QWORD *)(*v0 + 184), v6);

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 200));
  sub_247E70104(*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 208)));
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t WorkService.__deallocating_deinit()
{
  WorkService.deinit();
  return swift_deallocClassInstance();
}

uint64_t WorkService.perform<A, B>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  id v12;
  uint64_t v13;

  dispatch_group_enter(*(dispatch_group_t *)(v5 + *(_QWORD *)(*(_QWORD *)v5 + 232)));
  sub_247E695F0(a1, a2, a3, a4, a5);
  if (!v6)
    return sub_247E6584C();
  sub_247E6584C();
  if (qword_254458F78 != -1)
    swift_once();
  v12 = (id)qword_25445AD08;
  sub_247E82494();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_247E83230;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
  sub_247E82710();
  *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v13 + 64) = sub_247DBCF64();
  *(_QWORD *)(v13 + 32) = 0;
  *(_QWORD *)(v13 + 40) = 0xE000000000000000;
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t sub_247E695F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  _QWORD *v5;
  _QWORD *v6;
  _OWORD *v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t result;
  void *v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30[2];
  _QWORD *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v31 = a3;
  v6 = v5;
  v11 = (_OWORD *)*v6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)v30 - v13;
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 96);
  v37 = a1;
  if ((v15(a2, a4) & 1) == 0)
  {
    if (qword_254458F78 != -1)
      swift_once();
    v25 = (void *)qword_25445AD08;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_247E83230;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = 0xE000000000000000;
    v27 = v25;
    sub_247E82668();
    swift_getAssociatedConformanceWitness();
    sub_247E8283C();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v14, AssociatedTypeWitness);
    v28 = v34;
    *(_QWORD *)(v26 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v26 + 64) = sub_247DBCF64();
    *(_OWORD *)(v26 + 32) = v28;
    sub_247E824A0();
    sub_247E81FE4();

    swift_bridgeObjectRelease();
    v29 = v11[6];
    v34 = v11[5];
    v35 = v29;
    v36 = v11[7];
    type metadata accessor for WorkService.Errors();
  }
  v30[0] = a5;
  if (qword_254458F78 != -1)
    swift_once();
  v16 = (void *)qword_25445AD08;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_247E83230;
  *(_QWORD *)&v34 = 0;
  *((_QWORD *)&v34 + 1) = 0xE000000000000000;
  v18 = v16;
  v19 = v37;
  sub_247E82668();
  swift_getAssociatedConformanceWitness();
  sub_247E8283C();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v14, AssociatedTypeWitness);
  v20 = v34;
  *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v17 + 64) = sub_247DBCF64();
  *(_OWORD *)(v17 + 32) = v20;
  sub_247E824A0();
  sub_247E81FE4();

  v21 = swift_bridgeObjectRelease();
  MEMORY[0x24BDAC7A8](v21);
  v22 = v30[1];
  v23 = v31;
  v30[-6] = a2;
  v30[-5] = (uint64_t)v23;
  v30[-4] = a4;
  v30[-3] = (uint64_t)v6;
  v30[-2] = v19;
  result = sub_247E824E8();
  if (!v22)
  {
    v33 = v34;
    sub_247E69AE0((uint64_t *)&v33, v19, a2, v23, a4, v30[0]);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247E699F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
{
  char v6;
  _QWORD *v7;
  uint64_t v8;

  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 72))(a2, a3);
  sub_247E665FC(v6 & 1);
  v7 = (_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 208));
  if (!*v7)
    type metadata accessor for WorkService.Errors();
  v8 = v7[1];
  *a4 = *v7;
  a4[1] = v8;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_247E69AE0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t *v6;
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
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t AssociatedConformanceWitness;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  char *v100;
  __n128 v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t AssociatedTypeWitness;
  void (*v119)(char *, uint64_t);
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  __int128 v134;
  void (*v135)(uint64_t, uint64_t, uint64_t);
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint64_t v150;
  __int128 v151;
  _BYTE v152[32];
  uint64_t v153;

  v153 = a2;
  v111 = a6;
  v11 = *v6;
  v109 = type metadata accessor for WorkPreparationEvent(0, a3, a5, (uint64_t)a4);
  v108 = *(_QWORD *)(v109 - 8);
  v12 = MEMORY[0x24BDAC7A8](v109);
  v107 = (char *)&v106 - v13;
  v139 = a4;
  v110 = *(a4 - 1);
  MEMORY[0x24BDAC7A8](v12);
  v117 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v112 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v125 = (char *)&v106 - v15;
  v16 = *(_QWORD *)(v11 + 104);
  v123 = v11;
  v17 = *(_QWORD *)(v11 + 80);
  v122 = v16;
  v121 = v17;
  v18 = swift_getAssociatedTypeWitness();
  v136 = sub_247E82560();
  v135 = *(void (**)(uint64_t, uint64_t, uint64_t))(v136 - 8);
  v19 = MEMORY[0x24BDAC7A8](v136);
  *(_QWORD *)&v134 = (char *)&v106 - v20;
  v138 = v18;
  v21 = *(_QWORD *)(v18 - 8);
  v22 = a3;
  v137 = v21;
  v23 = MEMORY[0x24BDAC7A8](v19);
  v126 = (char *)&v106 - v24;
  v143 = *(_QWORD *)(a3 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v106 = (char *)&v106 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v142 = (uint64_t)&v106 - v27;
  v141 = *(_QWORD *)(a5 + 8);
  v140 = swift_getAssociatedTypeWitness();
  v133 = *(_QWORD *)(v140 - 8);
  MEMORY[0x24BDAC7A8](v140);
  v29 = (char *)&v106 - v28;
  v132 = sub_247E81CB4();
  v130 = *(_QWORD *)(v132 - 8);
  MEMORY[0x24BDAC7A8](v132);
  v31 = (char *)&v106 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = sub_247E82128();
  v129 = *(_QWORD *)(v131 - 8);
  MEMORY[0x24BDAC7A8](v131);
  v115 = *a1;
  v114 = a1[1];
  v128 = (uint64_t)&v106 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247E8211C();
  v127 = v31;
  sub_247E81CA8();
  if (qword_254458F78 != -1)
    swift_once();
  v33 = (void *)qword_25445AD08;
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_247E83500;
  v35 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 64);
  v36 = v33;
  v37 = v35(a3, a5);
  v39 = v38;
  v40 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v34 + 56) = MEMORY[0x24BEE0D00];
  v41 = sub_247DBCF64();
  *(_QWORD *)(v34 + 64) = v41;
  *(_QWORD *)(v34 + 32) = v37;
  *(_QWORD *)(v34 + 40) = v39;
  v150 = 0;
  *(_QWORD *)&v151 = 0xE000000000000000;
  v42 = v29;
  sub_247E82668();
  v144 = a5;
  v43 = v140;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v116 = v42;
  v120 = AssociatedConformanceWitness;
  sub_247E8283C();
  v119 = *(void (**)(char *, uint64_t))(v133 + 8);
  v119(v42, v43);
  v45 = v150;
  v46 = v151;
  *(_QWORD *)(v34 + 96) = v40;
  *(_QWORD *)(v34 + 104) = v41;
  v133 = v41;
  *(_QWORD *)(v34 + 72) = v45;
  *(_QWORD *)(v34 + 80) = v46;
  sub_247E824A0();
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  v47 = v142;
  v48 = v143;
  v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v143 + 16);
  v50 = v22;
  v49(v142, v153, v22);
  v51 = v135;
  v52 = v134;
  v53 = v136;
  (*((void (**)(_QWORD, uint64_t, uint64_t))v135 + 2))(v134, v145 + *(_QWORD *)(*(_QWORD *)v145 + 128), v136);
  v54 = v137;
  v55 = v138;
  v56 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v137 + 48))(v52, 1, v138);
  v57 = v48;
  v58 = v50;
  if (v56 == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v47, v50);
    (*((void (**)(uint64_t, uint64_t))v51 + 1))(v52, v53);
    v150 = v121;
    v151 = *(_OWORD *)(v123 + 88);
    *(_QWORD *)v152 = v122;
    *(_OWORD *)&v152[8] = *(_OWORD *)(v123 + 112);
    type metadata accessor for WorkService.Errors();
  }
  v135 = v49;
  v59 = v126;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v126, v52, v55);
  v60 = v144;
  v61 = v125;
  v62 = v153;
  v63 = v124;
  (*(void (**)(char *, uint64_t, uint64_t))(v144 + 80))(v59, v50, v144);
  v136 = v63;
  if (v63)
  {
    (*(void (**)(char *, uint64_t))(v54 + 8))(v59, v55);
    (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v142, v50);
    v64 = (uint64_t)v127;
    v65 = v145;
    v66 = (void *)v136;
LABEL_9:
    v92 = v66;
    sub_247E715BC(0, v64, v58, v60);
    swift_willThrow();

    v93 = v128;
    sub_247E6B820(v62, v128, v65, v58, (uint64_t)v139, v60);
    (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v64, v132);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v129 + 8))(v93, v131);
  }
  v67 = (void *)qword_25445AD08;
  v68 = swift_allocObject();
  v134 = xmmword_247E83230;
  *(_OWORD *)(v68 + 16) = xmmword_247E83230;
  v150 = 0;
  *(_QWORD *)&v151 = 0xE000000000000000;
  v69 = v67;
  v70 = v116;
  sub_247E82668();
  v71 = v140;
  sub_247E8283C();
  v119(v70, v71);
  v72 = v150;
  v73 = v151;
  v74 = v133;
  *(_QWORD *)(v68 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v68 + 64) = v74;
  *(_QWORD *)(v68 + 32) = v72;
  *(_QWORD *)(v68 + 40) = v73;
  sub_247E824A0();
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  v75 = AssociatedTypeWitness;
  v76 = swift_getAssociatedConformanceWitness();
  v77 = (*(uint64_t (**)(uint64_t, uint64_t))(v76 + 8))(v75, v76);
  v78 = v142;
  v79 = v145;
  v124 = sub_247E6BAE0(v77, v142, v145, v115, v114, v58, v139, v144);
  v81 = v80;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v78, v58);
  v82 = (void *)qword_25445AD08;
  v83 = swift_allocObject();
  *(_OWORD *)(v83 + 16) = v134;
  v150 = 0;
  *(_QWORD *)&v151 = 0xE000000000000000;
  v84 = v82;
  sub_247E82668();
  sub_247E8283C();
  v85 = v71;
  v86 = v61;
  v119(v70, v85);
  v87 = v150;
  v88 = v151;
  v89 = v133;
  *(_QWORD *)(v83 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v83 + 64) = v89;
  *(_QWORD *)(v83 + 32) = v87;
  *(_QWORD *)(v83 + 40) = v88;
  sub_247E824A0();
  sub_247E81FE4();

  v90 = v81;
  v62 = v153;
  v60 = v144;
  swift_bridgeObjectRelease();
  v91 = (void *)v136;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 88))(v61, v81, v58, v60);
  v66 = v91;
  if (v91)
  {
    swift_release();
    swift_release();
    v64 = (uint64_t)v127;
    v65 = v79;
    sub_247E715BC(0, (uint64_t)v127, v58, v60);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v112 + 8))(v86, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v126, v138);
    goto LABEL_9;
  }
  v95 = v124;
  v96 = sub_247E7608C(v58, v60);
  v97 = v79;
  if (v96)
  {
    v98 = v96;
    v143 = v90;
    v99 = (uint64_t)v106;
    v135((uint64_t)v106, v153, v58);
    swift_retain();
    WorkService.getExtendedWorkServiceData()((uint64_t)&v150);
    v146 = v150;
    v147 = v151;
    v148 = *(_OWORD *)v152;
    v149 = *(_OWORD *)&v152[16];
    v100 = v107;
    v101 = sub_247E74FB0(v95, v99, (__int128 *)&v146, v58, v60, v107);
    (*(void (**)(char *, __n128))((*MEMORY[0x24BEE4EA0] & *v98) + 0x60))(v100, v101);

    (*(void (**)(char *, uint64_t))(v108 + 8))(v100, v109);
  }
  v102 = AssociatedTypeWitness;
  v103 = (uint64_t)v127;
  sub_247E715BC(1, (uint64_t)v127, v58, v60);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v112 + 8))(v125, v102);
  (*(void (**)(char *, uint64_t))(v137 + 8))(v126, v138);
  v104 = v139;
  (*(void (**)(uint64_t, char *, _QWORD *))(v110 + 32))(v111, v117, v139);
  v105 = v128;
  sub_247E6B820(v153, v128, v97, v58, (uint64_t)v104, v60);
  (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v103, v132);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v129 + 8))(v105, v131);
}

uint64_t WorkService.performAsync<A, B>(_:qos:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[10] = a6;
  v7[11] = v6;
  v7[8] = a4;
  v7[9] = a5;
  v7[6] = a2;
  v7[7] = a3;
  v7[5] = a1;
  return swift_task_switch();
}

uint64_t sub_247E6A75C()
{
  uint64_t *v0;
  _QWORD *v1;

  dispatch_group_enter(*(dispatch_group_t *)(v0[11] + *(_QWORD *)(*(_QWORD *)v0[11] + 232)));
  v1 = (_QWORD *)swift_task_alloc();
  v0[12] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_247E6A7C8;
  return sub_247E6A9B4(v0[5], v0[6], v0[7], v0[8], v0[9], v0[10]);
}

uint64_t sub_247E6A7C8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247E6A82C()
{
  uint64_t v0;

  sub_247E6584C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6A860()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_247E6584C();
  if (qword_254458F78 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 104);
  v2 = (id)qword_25445AD08;
  sub_247E82494();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  *(_OWORD *)(v3 + 16) = xmmword_247E83230;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
  sub_247E82710();
  v4 = *(_QWORD *)(v0 + 16);
  v5 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 64) = sub_247DBCF64();
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6A9B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t AssociatedTypeWitness;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v7[9] = *(_QWORD *)(a6 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[10] = AssociatedTypeWitness;
  v7[11] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247E6AA40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _OWORD *v7;
  _QWORD *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (qword_254458F78 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = (void *)qword_25445AD08;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83230;
  v6 = v4;
  v12 = *(_OWORD *)(v0 + 40);
  v11 = *(_OWORD *)(v0 + 56);
  v10 = *(_OWORD *)(v0 + 24);
  sub_247E82668();
  swift_getAssociatedConformanceWitness();
  sub_247E8283C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 64) = sub_247DBCF64();
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = 0xE000000000000000;
  sub_247E824A0();
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  v7 = (_OWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v7;
  v7[1] = v12;
  v7[2] = v11;
  v7[3] = v10;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v8;
  *v8 = v0;
  v8[1] = sub_247E6AC40;
  return sub_247E8286C();
}

uint64_t sub_247E6AC40()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 120) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_247E6ACC0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6ACFC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD aBlock[7];

  v50 = a7;
  v44 = a6;
  v42 = a5;
  v47 = a3;
  v48 = a4;
  v46 = a1;
  v41 = *a2;
  v9 = v41;
  v53 = sub_247E820D4();
  v56 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v52 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_247E82104();
  v54 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v51 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_247E820E0();
  v43 = *(_QWORD *)(v57 - 8);
  v45 = *(_QWORD *)(v43 + 64);
  v13 = MEMORY[0x24BDAC7A8](v57);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v15;
  v16 = *(_QWORD *)(*(_QWORD *)(a5 - 8) + 64);
  v17 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v38 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458F98);
  v18 = sub_247E82398();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v36 - v21;
  v49 = *(uint64_t *)((char *)a2 + *(_QWORD *)(v9 + 192));
  v40 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v46, v18);
  v37 = v17;
  v23 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v47, v42);
  v24 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v15, v48, v57);
  v25 = (*(unsigned __int8 *)(v19 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v26 = (v20 + *(unsigned __int8 *)(v17 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v27 = (v16 + *(unsigned __int8 *)(v24 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v28 = swift_allocObject();
  v29 = v41;
  *(_OWORD *)(v28 + 16) = *(_OWORD *)(v41 + 80);
  *(_QWORD *)(v28 + 32) = *(_QWORD *)(v29 + 96);
  *(_QWORD *)(v28 + 40) = v23;
  *(_QWORD *)(v28 + 48) = v44;
  *(_OWORD *)(v28 + 56) = *(_OWORD *)(v29 + 104);
  v30 = v50;
  *(_QWORD *)(v28 + 72) = *(_QWORD *)(v29 + 120);
  *(_QWORD *)(v28 + 80) = v30;
  *(_QWORD *)(v28 + 88) = v40;
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v28 + v25, v22, v18);
  (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v28 + v26, v38, v23);
  (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v28 + v27, v39, v57);
  aBlock[4] = sub_247E71970;
  aBlock[5] = v28;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247E65090;
  aBlock[3] = &block_descriptor_80;
  v31 = _Block_copy(aBlock);
  swift_retain();
  v32 = v51;
  sub_247E820EC();
  v58 = MEMORY[0x24BEE4AF8];
  sub_247E71740(&qword_254458F80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD70);
  sub_247E70064(&qword_25445AD78, &qword_25445AD70);
  v33 = v52;
  v34 = v53;
  sub_247E825B4();
  MEMORY[0x249592788](0, v32, v33, v31);
  _Block_release(v31);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v32, v55);
  swift_release();
  return swift_release();
}

uint64_t sub_247E6B154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(), uint64_t a8, uint64_t a9, void *a10, uint64_t (*a11)(), char *a12, uint64_t a13)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t Strong;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  void *v37;
  char *v38;
  uint64_t v39;
  void *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)();
  uint64_t (*v63)();
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t aBlock;
  uint64_t v69;
  uint64_t (*v70)();
  void *v71;
  uint64_t (*v72)();
  char *v73;

  v63 = a7;
  v60 = a5;
  v61 = a6;
  v50 = a4;
  v57 = a3;
  v64 = a12;
  v65 = a2;
  v62 = a11;
  v53 = sub_247E820D4();
  v14 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_247E82104();
  v55 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v54 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458F98);
  v52 = a9;
  v18 = sub_247E82398();
  v51 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v59 = (char *)&v46 - v20;
  v66 = a8;
  v21 = *(_QWORD *)(a8 - 8);
  v22 = *(_QWORD *)(v21 + 64);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    aBlock = v60;
    v69 = v61;
    v70 = v63;
    v71 = a10;
    v72 = v62;
    v73 = v64;
    type metadata accessor for WorkService.Errors();
  }
  v25 = Strong;
  v49 = a10;
  v58 = v18;
  v47 = v16;
  v48 = v14;
  v26 = v57;
  v27 = (*(uint64_t (**)(uint64_t, uint64_t))(a13 + 72))(v66, a13);
  sub_247E665FC(v27 & 1);
  v28 = (uint64_t *)(v25 + *(_QWORD *)(*(_QWORD *)v25 + 208));
  v29 = *v28;
  if (!*v28)
  {
    aBlock = v60;
    v69 = v61;
    v70 = v63;
    v71 = v49;
    v72 = v62;
    v73 = v64;
    type metadata accessor for WorkService.Errors();
  }
  v46 = v28[1];
  sub_247E71424(0, &qword_25445ADE0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v50 = sub_247E8250C();
  v30 = v26;
  v31 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))((char *)&v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v30, v66);
  v57 = a13;
  v32 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v59, v65, v58);
  v33 = (*(unsigned __int8 *)(v21 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v34 = (v22 + v33 + *(unsigned __int8 *)(v32 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  v35 = (char *)swift_allocObject();
  v36 = v61;
  *((_QWORD *)v35 + 2) = v60;
  *((_QWORD *)v35 + 3) = v36;
  *((_QWORD *)v35 + 4) = v63;
  *((_QWORD *)v35 + 5) = v31;
  v37 = v49;
  *((_QWORD *)v35 + 6) = v52;
  *((_QWORD *)v35 + 7) = v37;
  v38 = v64;
  *((_QWORD *)v35 + 8) = v62;
  *((_QWORD *)v35 + 9) = v38;
  *((_QWORD *)v35 + 10) = v57;
  *((_QWORD *)v35 + 11) = v25;
  v39 = v46;
  *((_QWORD *)v35 + 12) = v29;
  *((_QWORD *)v35 + 13) = v39;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v35[v33], v23, v31);
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v35[v34], v59, v58);
  v72 = sub_247E71B4C;
  v73 = v35;
  aBlock = MEMORY[0x24BDAC760];
  v69 = 1107296256;
  v70 = sub_247E65090;
  v71 = &block_descriptor_86;
  v40 = _Block_copy(&aBlock);
  swift_retain();
  v41 = v54;
  sub_247E820EC();
  v67 = MEMORY[0x24BEE4AF8];
  sub_247E71740(&qword_254458F80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD70);
  sub_247E70064(&qword_25445AD78, &qword_25445AD70);
  v42 = v47;
  v43 = v53;
  sub_247E825B4();
  v44 = (void *)v50;
  MEMORY[0x249592788](0, v41, v42, v40);
  _Block_release(v40);
  swift_release();

  (*(void (**)(char *, uint64_t))(v48 + 8))(v42, v43);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v41, v56);
  return swift_release();
}

uint64_t sub_247E6B6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _BYTE v21[16];
  uint64_t v22[2];

  v8 = *(_QWORD *)(a7 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v21[-v12];
  v22[0] = v14;
  v22[1] = v15;
  sub_247E69AE0(v22, v16, v17, v18, v19, (uint64_t)&v21[-v12]);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, a7);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458F98);
  sub_247E82398();
  sub_247E8238C();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, a7);
}

unint64_t sub_247E6B820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t result;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v29 = a3;
  v34 = a2;
  v31 = a1;
  v8 = sub_247E82128();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v30 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)&v27 - v12;
  if (qword_254458F78 != -1)
    swift_once();
  v14 = (void *)qword_25445AD08;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_247E83520;
  v16 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 64);
  v28 = v14;
  v17 = v16(a4, a6);
  v19 = v18;
  *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
  v20 = sub_247DBCF64();
  *(_QWORD *)(v15 + 64) = v20;
  *(_QWORD *)(v15 + 32) = v17;
  *(_QWORD *)(v15 + 40) = v19;
  v35 = 0;
  v36 = 0xE000000000000000;
  sub_247E82668();
  swift_getAssociatedConformanceWitness();
  sub_247E8283C();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, AssociatedTypeWitness);
  v21 = v35;
  v22 = v36;
  *(_QWORD *)(v15 + 96) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v15 + 104) = v20;
  *(_QWORD *)(v15 + 72) = v21;
  *(_QWORD *)(v15 + 80) = v22;
  sub_247E8211C();
  v23 = sub_247E82110();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v33);
  result = sub_247E82110();
  if (v23 < result)
  {
    __break(1u);
  }
  else
  {
    v25 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v15 + 136) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v15 + 144) = v25;
    *(double *)(v15 + 112) = (double)(v23 - result) / 1000000.0;
    sub_247E824A0();
    v26 = v28;
    sub_247E81FE4();

    result = swift_bridgeObjectRelease();
    if ((*(_BYTE *)(v29 + *(_QWORD *)(*(_QWORD *)v29 + 296)) & 1) == 0)
      return sub_247E65D00((uint64_t)&unk_251963DE0, (uint64_t)sub_247E71320, (uint64_t)&block_descriptor_35);
  }
  return result;
}

uint64_t sub_247E6BAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t, char *);
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44[2];

  v42 = a7;
  v40 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest(0);
  MEMORY[0x24BDAC7A8](v40);
  v41 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v38 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v18 = (char *)&v33 - v17;
  v39 = a2;
  v43 = a1;
  v19 = sub_247E6BD5C(a2, a3, a1, a6, (uint64_t)v42, a8);
  v42 = v20;
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *))(a3 + *(_QWORD *)(*(_QWORD *)a3 + 160));
  if (v21)
  {
    v36 = a4;
    v37 = a5;
    v22 = *(uint64_t (**)(uint64_t, uint64_t))(a8 + 64);
    swift_retain();
    v23 = v22(a6, a8);
    v34 = v24;
    v35 = v23;
    sub_247E82668();
    swift_getAssociatedConformanceWitness();
    v25 = sub_247E82824();
    v27 = v26;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v18, AssociatedTypeWitness);
    sub_247E71740(&qword_257704460, type metadata accessor for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest);
    v28 = v19;
    v29 = v41;
    sub_247E81F00();
    v30 = v25;
    a5 = v37;
    v21(v35, v34, v30, v27, v29);
    a4 = v36;
    sub_247E6FF58((uint64_t)v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31 = (uint64_t)v29;
    v19 = v28;
    sub_247E73904(v31, type metadata accessor for Com_Apple_News_Algorithms_Proto_Gambit_TabiRequest);
  }
  v44[0] = a4;
  v44[1] = a5;
  _s4Tabi19SubGraphComputationC12buildAndCall06globalC011boundInputs16requestedOutputsAA8FeaturesCAA06GlobalC0V_AISaySSGtFZ_0(v44, v42, *(_QWORD **)(v43 + 24));
  swift_release();
  return v19;
}

uint64_t sub_247E6BD5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t result;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  int64_t v39;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD50);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (_QWORD *)((char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a6 + 72))(a4, a6) & 1) == 0
    || (v13 = *(_QWORD *)(a2 + *(_QWORD *)(*(_QWORD *)a2 + 280)),
        swift_retain(),
        os_unfair_lock_lock((os_unfair_lock_t)(v13 + 24)),
        v14 = *(_QWORD *)(v13 + 16),
        swift_retain(),
        os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 24)),
        swift_release(),
        !v14))
  {
    v35 = 0;
LABEL_27:
    swift_retain();
    return v35;
  }
  swift_beginAccess();
  v15 = swift_bridgeObjectRetain();
  *(_QWORD *)(a3 + 32) = sub_247E62338(v15);
  swift_bridgeObjectRelease();
  v36[1] = v36;
  v37 = v14;
  v16 = *(_QWORD *)(a3 + 16);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = *(_QWORD *)(v17 + 64);
  v38 = v17 + 64;
  v19 = 1 << *(_BYTE *)(v17 + 32);
  v20 = -1;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  v21 = v20 & v18;
  v39 = (unint64_t)(v19 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v23 = 0;
  while (1)
  {
    if (v21)
    {
      v24 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      v25 = v24 | (v23 << 6);
      goto LABEL_7;
    }
    v32 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v32 >= v39)
      goto LABEL_26;
    v33 = *(_QWORD *)(v38 + 8 * v32);
    ++v23;
    if (!v33)
    {
      v23 = v32 + 1;
      if (v32 + 1 >= v39)
        goto LABEL_26;
      v33 = *(_QWORD *)(v38 + 8 * v23);
      if (!v33)
      {
        v23 = v32 + 2;
        if (v32 + 2 >= v39)
          goto LABEL_26;
        v33 = *(_QWORD *)(v38 + 8 * v23);
        if (!v33)
        {
          v23 = v32 + 3;
          if (v32 + 3 >= v39)
            goto LABEL_26;
          v33 = *(_QWORD *)(v38 + 8 * v23);
          if (!v33)
            break;
        }
      }
    }
LABEL_24:
    v21 = (v33 - 1) & v33;
    v25 = __clz(__rbit64(v33)) + (v23 << 6);
LABEL_7:
    v26 = *(_QWORD *)(v17 + 56);
    v27 = (uint64_t *)(*(_QWORD *)(v17 + 48) + 16 * v25);
    v28 = *v27;
    v29 = v27[1];
    v30 = v26 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for Feature() - 8) + 72) * v25;
    v31 = (uint64_t)v12 + *(int *)(v10 + 48);
    sub_247E717C0(v30, v31, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
    *v12 = v28;
    v12[1] = v29;
    swift_bridgeObjectRetain();
    sub_247E00384(v28, v29, v31, 0, v16);
    result = sub_247E71780((uint64_t)v12);
  }
  v34 = v32 + 4;
  if (v34 >= v39)
  {
LABEL_26:
    swift_release();
    swift_bridgeObjectRelease();
    v35 = v37;
    goto LABEL_27;
  }
  v33 = *(_QWORD *)(v38 + 8 * v34);
  if (v33)
  {
    v23 = v34;
    goto LABEL_24;
  }
  while (1)
  {
    v23 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v23 >= v39)
      goto LABEL_26;
    v33 = *(_QWORD *)(v38 + 8 * v23);
    ++v34;
    if (v33)
      goto LABEL_24;
  }
LABEL_29:
  __break(1u);
  return result;
}

double WorkService.getExtendedWorkServiceData()@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  double result;
  _OWORD v8[3];
  _OWORD v9[3];

  v3 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 272));
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  sub_247E82368();
  v4 = *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v5);
  v6 = *(_QWORD *)(v3 + v4);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v5);
  swift_release();
  WorkService.getWorkServiceData()((uint64_t *)v9);
  v8[0] = v9[0];
  v8[1] = v9[1];
  v8[2] = v9[2];
  swift_checkMetadataState();
  *(_QWORD *)&result = ExtendedWorkServiceData.init(packageAssetIDs:workServiceData:)(v6, (uint64_t)v8, a1).n128_u64[0];
  return result;
}

uint64_t sub_247E6C1B0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v37;
  uint64_t v38;

  v15 = type metadata accessor for RequestData(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v37 - v20;
  v22 = sub_247E81CB4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v21, a2, v22);
  type metadata accessor for TimedData(0);
  sub_247E81CA8();
  v21[*(int *)(v15 + 20)] = a3;
  if (*(_QWORD *)(a1 + 8) && *(_QWORD *)(a1 + 40))
  {
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a11 + 64))(a7, a11);
    v25 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v25 + 16) && (v26 = sub_247DBB6D4(v23, v24), (v27 & 1) != 0))
    {
      v28 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v26);
      swift_bridgeObjectRetain();
    }
    else
    {
      v28 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v28 = MEMORY[0x24BEE4AF8];
  }
  v29 = *(_QWORD *)(v28 + 16);
  if (v29 <= 0x31)
  {
    sub_247E717C0((uint64_t)v21, (uint64_t)v19, type metadata accessor for RequestData);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v28 = sub_247DF8BA8(0, v29 + 1, 1, v28);
    v31 = *(_QWORD *)(v28 + 16);
    v30 = *(_QWORD *)(v28 + 24);
    if (v31 >= v30 >> 1)
      v28 = sub_247DF8BA8(v30 > 1, v31 + 1, 1, v28);
    *(_QWORD *)(v28 + 16) = v31 + 1;
    sub_247E71804((uint64_t)v19, v28+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * v31);
    if (*(_QWORD *)(a1 + 8) && *(_QWORD *)(a1 + 40))
    {
      v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a11 + 64))(a7, a11);
      v34 = v33;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v38 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0x8000000000000000;
      sub_247E1ADA0(v28, v32, v34, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(a1 + 40) = v38;
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  return sub_247E73904((uint64_t)v21, type metadata accessor for RequestData);
}

uint64_t sub_247E6C438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return WorkService.perform<A, B>(_:)(a1, a2, a3, a4, a5);
}

uint64_t sub_247E6C458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v14;
  _QWORD *v15;

  v14 = *v6;
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_247E6C4F4;
  v15[10] = a6;
  v15[11] = v14;
  v15[8] = a4;
  v15[9] = a5;
  v15[6] = a2;
  v15[7] = a3;
  v15[5] = a1;
  return swift_task_switch();
}

uint64_t sub_247E6C4F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_247E6C53C()
{
  return WorkService.runningVersion.getter();
}

uint64_t sub_247E6C55C()
{
  return WorkService.loadedVersion.getter();
}

uint64_t sub_247E6C57C@<X0>(uint64_t a1@<X8>)
{
  return WorkService.configuration.getter(a1);
}

uint64_t WorkService.startup()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;

  v1[11] = v0;
  v1[12] = *v0;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1[13] = AssociatedTypeWitness;
  v3 = sub_247E82560();
  v1[14] = v3;
  v1[15] = *(_QWORD *)(v3 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v1[18] = swift_task_alloc();
  v4 = sub_247E82128();
  v1[19] = v4;
  v1[20] = *(_QWORD *)(v4 - 8);
  v1[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247E6C678()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  _QWORD *v7;

  if (qword_25445AFA8 != -1)
    swift_once();
  v1 = v0[11];
  v2 = (id)qword_25445B018;
  sub_247E824A0();
  sub_247E81FE4();

  sub_247E8211C();
  v3 = *(NSObject **)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 192));
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_247E70130;
  *(_QWORD *)(v4 + 24) = v1;
  v0[6] = (uint64_t)sub_247E70148;
  v0[7] = v4;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = (uint64_t)sub_247E6CBF8;
  v0[5] = (uint64_t)&block_descriptor_24;
  v5 = _Block_copy(v0 + 2);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v3, v5);
  _Block_release(v5);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v5 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v7 = (_QWORD *)swift_task_alloc();
    v0[22] = (uint64_t)v7;
    *v7 = v0;
    v7[1] = sub_247E6C830;
    return sub_247E6CC18(v0[16]);
  }
  return result;
}

uint64_t sub_247E6C830()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247E6C894()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 104);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(v1, *(_QWORD *)(v0 + 112));
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 144);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v4, v1, v3);
    sub_247E645A0(v4);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v4, v3);
  }
  if ((*(_BYTE *)(*(_QWORD *)(v0 + 88) + *(_QWORD *)(**(_QWORD **)(v0 + 88) + 296)) & 1) == 0)
    sub_247E65D00((uint64_t)&unk_251963DE0, (uint64_t)sub_247E71320, (uint64_t)&block_descriptor_35);
  v6 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 168);
  v7 = *(_QWORD *)(v0 + 152);
  sub_247E6FB04();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6C9C4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(void **)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = (id)qword_25445B018;
  sub_247E82488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247E83230;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0xE000000000000000;
  *(_QWORD *)(v0 + 80) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
  sub_247E82710();
  v6 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 64) = sub_247DBCF64();
  *(_QWORD *)(v4 + 32) = v6;
  *(_QWORD *)(v4 + 40) = v5;
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  if ((*(_BYTE *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 296)) & 1) == 0)
    sub_247E65D00((uint64_t)&unk_251963DE0, (uint64_t)sub_247E71320, (uint64_t)&block_descriptor_35);
  v8 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 168);
  v9 = *(_QWORD *)(v0 + 152);
  sub_247E6FB04();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6CB68()
{
  id v0;

  if (qword_25445AFA8 != -1)
    swift_once();
  v0 = (id)qword_25445B018;
  sub_247E824A0();
  sub_247E81FE4();

  return sub_247E665FC(0);
}

uint64_t sub_247E6CBF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_247E6CC18(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = *v1;
  v3 = *v1;
  v2[7] = *v1;
  v2[8] = *(_QWORD *)(v3 + 104);
  v2[9] = *(_QWORD *)(v3 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[10] = AssociatedTypeWitness;
  v5 = sub_247E82560();
  v2[11] = v5;
  v2[12] = *(_QWORD *)(v5 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v6 = sub_247E82128();
  v2[17] = v6;
  v2[18] = *(_QWORD *)(v6 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v7 = sub_247E82134();
  v2[21] = v7;
  v2[22] = *(_QWORD *)(v7 - 8);
  v2[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247E6CD74()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = v0[22];
  v1 = (_QWORD *)v0[23];
  v3 = *(void **)(v0[5] + *(_QWORD *)(*(_QWORD *)v0[5] + 192));
  v4 = v0[21];
  *v1 = v3;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BEE5608], v4);
  v5 = v3;
  LOBYTE(v3) = sub_247E8214C();
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v1, v4);
  if ((v3 & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (qword_25445AFA8 != -1)
LABEL_5:
    swift_once();
  v6 = v0[8];
  v7 = (id)qword_25445B018;
  sub_247E824A0();
  sub_247E81FE4();

  sub_247E8211C();
  v8 = *(int **)(v6 + 40);
  v9 = *v8;
  v10 = (_QWORD *)swift_task_alloc();
  v0[24] = v10;
  *v10 = v0;
  v10[1] = sub_247E6CEF8;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))((char *)v8 + v9))(v0[16], 0, v0[9], v0[8]);
}

uint64_t sub_247E6CEF8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247E6CFA0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t AssociatedConformanceWitness;
  uint64_t (*v5)(uint64_t, uint64_t);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t (*v32)(void);
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  id v37;
  char v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  unint64_t v79;

  v1 = v0[10];
  v2 = (void *)qword_25445B018;
  v0[26] = __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247E83230;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48);
  v6 = v2;
  v78 = v5;
  v7 = v5(v1, AssociatedConformanceWitness);
  v9 = v8;
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  v79 = sub_247DBCF64();
  *(_QWORD *)(v3 + 64) = v79;
  *(_QWORD *)(v3 + 32) = v7;
  *(_QWORD *)(v3 + 40) = v9;
  sub_247E824A0();
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 56))(v1, AssociatedConformanceWitness);
  v0[27] = v10;
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v12 = (void *)sub_247E81BE8();
  v0[2] = 0;
  LODWORD(v9) = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v12, 1, 0, v0 + 2);

  v13 = (void *)v0[2];
  if (!(_DWORD)v9)
  {
    v28 = v0[16];
    v29 = v0[14];
    v30 = v0[10];
    v31 = v13;
    swift_bridgeObjectRelease();
    sub_247E81B7C();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
LABEL_5:
    sub_247E6FB04();
    (*(void (**)(_QWORD, _QWORD))(v0[18] + 8))(v0[20], v0[17]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v32 = (uint64_t (*)(void))v0[1];
    return v32();
  }
  v77 = v10;
  v15 = v0[13];
  v14 = v0[14];
  v16 = v0[10];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[12] + 16))(v15, v0[5] + *(_QWORD *)(*(_QWORD *)v0[5] + 128), v0[11]);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v16) != 1)
  {
    v34 = v0[15];
    v35 = v0[10];
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v0[14] + 32))(v34, v0[13], v35);
    v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 72);
    v37 = v13;
    v38 = v36(v34, v35, AssociatedConformanceWitness);
    v39 = (void *)qword_25445B018;
    if ((v38 & 1) != 0)
    {
      v40 = v0[25];
      v41 = (id)qword_25445B018;
      sub_247E824A0();
      sub_247E81FE4();

      v42 = sub_247E64304();
      if (v40)
      {
        v44 = v0[15];
        v43 = v0[16];
        v45 = v0[14];
        v46 = v0[10];
        swift_bridgeObjectRelease();
        v47 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
        v47(v44, v46);
        v47(v43, v46);
        goto LABEL_5;
      }
      v61 = v42;
      swift_getAssociatedTypeWitness();
      swift_getAssociatedConformanceWitness();
      swift_getAssociatedTypeWitness();
      swift_getAssociatedConformanceWitness();
      if ((sub_247E823D4() & 1) != 0)
      {
        v62 = v0[18];
        v64 = v0[15];
        v63 = v0[16];
        v65 = v0[14];
        v66 = v0[10];
        v67 = v0[4];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v68 = (id)qword_25445B018;
        sub_247E824A0();
        sub_247E81FE4();

        v69 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
        v69(v64, v66);
        v69(v63, v66);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56))(v67, 1, 1, v66);
        sub_247E6FB04();
        (*(void (**)(_QWORD, _QWORD))(v62 + 8))(v0[20], v0[17]);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v32 = (uint64_t (*)(void))v0[1];
        return v32();
      }
      v70 = v0[10];
      v71 = (void *)qword_25445B018;
      v72 = swift_allocObject();
      *(_OWORD *)(v72 + 16) = xmmword_247E83500;
      v50 = v71;
      v73 = v78(v70, AssociatedConformanceWitness);
      v74 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v72 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v72 + 64) = v79;
      *(_QWORD *)(v72 + 32) = v73;
      *(_QWORD *)(v72 + 40) = v75;
      v0[3] = v61;
      v76 = sub_247E823EC();
      MEMORY[0x2495930AC](MEMORY[0x24BEE1730], v76);
      sub_247E8283C();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v72 + 96) = v74;
      *(_QWORD *)(v72 + 104) = v79;
      *(_QWORD *)(v72 + 72) = 0;
      *(_QWORD *)(v72 + 80) = 0xE000000000000000;
      sub_247E824A0();
    }
    else
    {
      v48 = v0[10];
      v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_247E83500;
      v50 = v39;
      v51 = v78(v48, AssociatedConformanceWitness);
      v52 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v49 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v49 + 64) = v79;
      *(_QWORD *)(v49 + 32) = v51;
      *(_QWORD *)(v49 + 40) = v53;
      v54 = v78(v48, AssociatedConformanceWitness);
      *(_QWORD *)(v49 + 96) = v52;
      *(_QWORD *)(v49 + 104) = v79;
      *(_QWORD *)(v49 + 72) = v54;
      *(_QWORD *)(v49 + 80) = v55;
      sub_247E824A0();
    }
    sub_247E81FE4();
    v27 = v77;
    v57 = v0[14];
    v56 = v0[15];
    v58 = v0[10];
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v58);
    goto LABEL_12;
  }
  v17 = v0[13];
  v19 = v0[10];
  v18 = v0[11];
  v20 = *(void (**)(uint64_t, uint64_t))(v0[12] + 8);
  v21 = v13;
  v20(v17, v18);
  v22 = (void *)qword_25445B018;
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_247E83230;
  v24 = v22;
  v25 = v78(v19, AssociatedConformanceWitness);
  *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v23 + 64) = v79;
  *(_QWORD *)(v23 + 32) = v25;
  *(_QWORD *)(v23 + 40) = v26;
  sub_247E824A0();
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  v27 = v77;
LABEL_12:
  v59 = (_QWORD *)swift_task_alloc();
  v0[28] = v59;
  *v59 = v0;
  v59[1] = sub_247E6D804;
  v60 = (_QWORD *)v0[5];
  v59[3] = v27;
  v59[4] = v60;
  v59[5] = *v60;
  v59[6] = *v60;
  return swift_task_switch();
}

uint64_t sub_247E6D804(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 232) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_BYTE *)(v4 + 240) = a1 & 1;
  return swift_task_switch();
}

uint64_t sub_247E6D8C8()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v18)(uint64_t, uint64_t);

  v1 = *(unsigned __int8 *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v5 = (void *)qword_25445B018;
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_247E83230;
  v7 = v5;
  sub_247E8211C();
  v8 = sub_247E82110();
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v2, v3);
  v10 = sub_247E82110();
  v11 = v8 - v10;
  v18 = v9;
  if (v1 == 1)
  {
    if (v8 >= v10)
      goto LABEL_5;
    __break(1u);
LABEL_7:
    __break(1u);
  }
  if (v8 < v10)
    goto LABEL_7;
LABEL_5:
  v12 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 112);
  v14 = *(_QWORD *)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 32);
  v16 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v6 + 64) = v16;
  *(double *)(v6 + 32) = (double)v11 / 1000000.0;
  sub_247E824A0();
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v15, v12, v14);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v14);
  sub_247E6FB04();
  v18(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6DAE8()
{
  uint64_t v0;

  sub_247E6FB04();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6DBBC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 80));
  sub_247E6FB04();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6DCA8(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void (*v38)(unint64_t, char *, uint64_t);
  char *v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t, uint64_t);
  int64_t v47;
  uint64_t result;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  void (*v63)(unint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  __int128 v67;
  char *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int64_t v79;
  unint64_t v80;

  v3 = (_QWORD *)*v1;
  v4 = sub_247E81C54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v54 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254458DD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v3[15];
  v11 = v3[12];
  swift_getAssociatedTypeWitness();
  v64 = v11;
  v65 = v10;
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v74 = (char *)&v49 - v14;
  sub_247E82560();
  v15 = MEMORY[0x24BDAC7A8](a1);
  v17 = (char *)&v49 - v16;
  v56 = v3;
  if ((v15 & 0xC000000000000001) != 0)
  {
    v73 = v9;
    swift_bridgeObjectRetain();
    sub_247E825D8();
    swift_getAssociatedConformanceWitness();
    v9 = v73;
    sub_247E823E0();
    v18 = v76;
    v51 = v77;
    v19 = v78;
    v66 = v79;
    v20 = v80;
    v21 = v75;
    v3 = (_QWORD *)*v75;
  }
  else
  {
    v22 = -1 << *(_BYTE *)(v15 + 32);
    v23 = *(_QWORD *)(v15 + 56);
    v51 = v15 + 56;
    v19 = ~v22;
    v24 = -v22;
    if (v24 < 64)
      v25 = ~(-1 << v24);
    else
      v25 = -1;
    v20 = v25 & v23;
    v18 = swift_bridgeObjectRetain();
    v66 = 0;
    v21 = v75;
  }
  v26 = v3[23];
  v69 = (char *)v21 + v3[22];
  v70 = 0;
  v68 = (char *)v21 + v26;
  v52 = v18 & 0x7FFFFFFFFFFFFFFFLL;
  v49 = v19;
  v50 = (unint64_t)(v19 + 64) >> 6;
  v67 = xmmword_247E83500;
  v27 = v74;
  v57 = v18;
  v55 = v5;
  v53 = AssociatedTypeWitness;
  v71 = v17;
  v72 = v13;
  while (v18 < 0)
  {
    v75 = (_QWORD *)v20;
    v30 = v18;
    v28 = v5;
    if (!sub_247E825FC())
      goto LABEL_36;
    sub_247E82848();
    swift_unknownObjectRelease();
LABEL_24:
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v27, v17, AssociatedTypeWitness);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445AE48);
    v33 = AssociatedTypeWitness;
    v34 = *(_QWORD *)(v28 + 72);
    v35 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = v67;
    v37 = v36 + v35;
    v38 = *(void (**)(unint64_t, char *, uint64_t))(v28 + 16);
    v38(v37, v69, v4);
    v39 = (char *)(v37 + v34);
    v38(v37 + v34, v68, v4);
    swift_bridgeObjectRetain();
    v38((unint64_t)v9, (char *)v37, v4);
    v73 = *(char **)(v28 + 56);
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v73)(v9, 0, 1, v4);
    v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
    if (v40(v9, 1, v4) == 1)
    {
      v27 = v74;
      AssociatedTypeWitness = v33;
      v5 = v28;
    }
    else
    {
      v20 = (unint64_t)v54;
      v62 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
      v62(v54, v9, v4);
      v41 = v56[11];
      v42 = v28;
      v43 = v56[13];
      v44 = v56[14];
      v58 = v56[10];
      v59 = v41;
      v61 = v43;
      v60 = v44;
      v45 = v70;
      sub_247E6E3E8(v20);
      v31 = *(_QWORD *)(v42 + 8);
      v46 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v73;
      if (v45)
        goto LABEL_38;
      v63 = (void (*)(unint64_t, uint64_t))v31;
      ((void (*)(unint64_t, uint64_t))v31)(v20, v4);
      v38((unint64_t)v9, v39, v4);
      v46(v9, 0, 1, v4);
      if (v40(v9, 1, v4) == 1)
      {
        v70 = 0;
      }
      else
      {
        v62((char *)v20, v9, v4);
        sub_247E6E3E8(v20);
        v70 = 0;
        v63(v20, v4);
        v46(v9, 1, 1, v4);
      }
      v30 = v57;
      v5 = v55;
      AssociatedTypeWitness = v53;
      v27 = v74;
    }
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v13 = v72;
    (*(void (**)(char *, uint64_t))(v72 + 8))(v27, AssociatedTypeWitness);
    v17 = v71;
    v18 = v30;
    v20 = (unint64_t)v75;
  }
  if (v20)
  {
    v28 = v5;
    v75 = (_QWORD *)((v20 - 1) & v20);
    v29 = __clz(__rbit64(v20)) | (v66 << 6);
LABEL_23:
    v30 = v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v17, *(_QWORD *)(v18 + 48) + *(_QWORD *)(v13 + 72) * v29, AssociatedTypeWitness);
    goto LABEL_24;
  }
  v31 = v66 + 1;
  if (!__OFADD__(v66, 1))
  {
    if (v31 >= v50)
      goto LABEL_36;
    v32 = *(_QWORD *)(v51 + 8 * v31);
    if (!v32)
    {
      if (v66 + 2 >= v50)
        goto LABEL_36;
      v32 = *(_QWORD *)(v51 + 8 * (v66 + 2));
      if (v32)
      {
        v28 = v5;
        v31 = v66 + 2;
        goto LABEL_22;
      }
      v31 = v66 + 3;
      if (v66 + 3 >= v50)
        goto LABEL_36;
      v32 = *(_QWORD *)(v51 + 8 * v31);
      if (!v32)
      {
        v47 = v66 + 4;
        while (v50 != v47)
        {
          v32 = *(_QWORD *)(v51 + 8 * v47++);
          if (v32)
          {
            v28 = v5;
            v31 = v47 - 1;
            goto LABEL_22;
          }
        }
LABEL_36:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v17, 1, 1, AssociatedTypeWitness);
        return sub_247E715A8();
      }
    }
    v28 = v5;
LABEL_22:
    v75 = (_QWORD *)((v32 - 1) & v32);
    v29 = __clz(__rbit64(v32)) + (v31 << 6);
    v66 = v31;
    goto LABEL_23;
  }
  __break(1u);
LABEL_38:
  ((void (*)(unint64_t, uint64_t))v31)(v20, v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  result = swift_deallocClassInstance();
  __break(1u);
  return result;
}

uint64_t sub_247E6E3E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t (*v18)(char *, uint64_t);
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  unint64_t v35;
  uint64_t v36;

  v30[1] = a1;
  v36 = *MEMORY[0x24BDAC8D0];
  v1 = sub_247E81BA0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_247E81C54();
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v34 = (id)sub_247E82824();
  v35 = v8;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCD790], v1);
  sub_247DBCFA8();
  sub_247E81C48();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  if (qword_254458F78 != -1)
    swift_once();
  v9 = (void *)qword_25445AD08;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247E83230;
  sub_247E71740((unint64_t *)&qword_25445A628, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
  v11 = v9;
  v12 = sub_247E82824();
  v14 = v13;
  *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
  v15 = sub_247DBCF64();
  *(_QWORD *)(v10 + 64) = v15;
  *(_QWORD *)(v10 + 32) = v12;
  *(_QWORD *)(v10 + 40) = v14;
  sub_247E824A0();
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  v16 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v17 = (void *)sub_247E81BE8();
  v34 = 0;
  LODWORD(v14) = objc_msgSend(v16, sel_removeItemAtURL_error_, v17, &v34);

  if ((_DWORD)v14)
  {
    v18 = *(uint64_t (**)(char *, uint64_t))(v31 + 8);
    v19 = v34;
  }
  else
  {
    v20 = v34;
    v21 = (void *)sub_247E81B7C();

    swift_willThrow();
    v22 = (id)qword_25445AD08;
    sub_247E82494();
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_247E83500;
    v24 = sub_247E82824();
    v25 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v23 + 64) = v15;
    *(_QWORD *)(v23 + 32) = v24;
    *(_QWORD *)(v23 + 40) = v26;
    v34 = 0;
    v35 = 0xE000000000000000;
    v33 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
    sub_247E82710();
    v27 = v34;
    v28 = v35;
    *(_QWORD *)(v23 + 96) = v25;
    *(_QWORD *)(v23 + 104) = v15;
    *(_QWORD *)(v23 + 72) = v27;
    *(_QWORD *)(v23 + 80) = v28;
    sub_247E81FE4();

    swift_bridgeObjectRelease();
    v18 = *(uint64_t (**)(char *, uint64_t))(v31 + 8);
  }
  return v18(v7, v32);
}

uint64_t sub_247E6E83C(__int128 *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t AssociatedConformanceWitness;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25[3];
  uint64_t v26;

  v2 = v1;
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 112);
  v6 = *(_QWORD *)(*v2 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v23 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v22 - v8;
  v10 = sub_247E82134();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(void **)((char *)v2 + *(_QWORD *)(v4 + 192));
  v24 = *a1;
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEE5610], v10);
  v15 = v14;
  LOBYTE(a1) = sub_247E8214C();
  (*(void (**)(_QWORD *, uint64_t))(v11 + 8))(v13, v10);
  if ((a1 & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (qword_254458F78 != -1)
LABEL_5:
    swift_once();
  v16 = (id)qword_25445AD08;
  sub_247E824A0();
  sub_247E81FE4();

  *(_OWORD *)v25 = v24;
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v6, v5);
  v17 = (_QWORD *)type metadata accessor for Features();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_247E69AE0(v25, (uint64_t)v9, AssociatedTypeWitness, v17, *(_QWORD *)(AssociatedConformanceWitness + 8), (uint64_t)&v26);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, AssociatedTypeWitness);
  v19 = v26;
  v20 = *(uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 280));
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v20 + 24));
  swift_release();
  *(_QWORD *)(v20 + 16) = v19;
  swift_retain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 24));
  swift_release();
  return swift_release();
}

uint64_t sub_247E6EBA0(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 *v45;
  void *v47;
  _BYTE v48[16];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t AssociatedConformanceWitness;
  uint64_t AssociatedTypeWitness;
  __int128 *v61;
  __int128 *v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73[2];

  v72 = a1;
  v73[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)*v1;
  if (qword_25445AFA8 != -1)
    swift_once();
  v63 = (id)qword_25445B018;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v64 = swift_allocObject();
  v57 = xmmword_247E83230;
  *(_OWORD *)(v64 + 16) = xmmword_247E83230;
  v71 = v2[15];
  v3 = v2[12];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v62 = (__int128 *)swift_checkMetadataState();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v73[0] = v72;
  MEMORY[0x24BDAC7A8](AssociatedConformanceWitness);
  v4 = v2[11];
  v51 = v2[10];
  v52 = v4;
  v68 = v4;
  v69 = v51;
  v6 = v2[13];
  v5 = v2[14];
  v70 = v3;
  v67 = v6;
  v56 = v71;
  KeyPath = swift_getKeyPath();
  v61 = &v57;
  v49 = v51;
  v50 = v4;
  v51 = v3;
  v52 = v6;
  v53 = v5;
  v54 = v71;
  v55 = MEMORY[0x24BDAC7A8](KeyPath);
  v8 = (void *)sub_247E821D0();
  v9 = v63;
  v10 = v72;
  swift_bridgeObjectRetain();
  v11 = MEMORY[0x2495930AC](MEMORY[0x24BEE03C8], v8);
  v12 = MEMORY[0x24BEE0D00];
  AssociatedTypeWitness = v11;
  v13 = v65;
  v15 = sub_247E61EC0((void (*)(char *, char *))sub_247E73B04, (uint64_t)v48, (uint64_t)v8, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], v11, MEMORY[0x24BEE40A8], v14);
  v65 = v13;
  swift_release();
  swift_bridgeObjectRelease();
  v16 = MEMORY[0x2495925B4](v15, v12);
  v18 = v17;
  swift_bridgeObjectRelease();
  v19 = (_QWORD *)v64;
  *(_QWORD *)(v64 + 56) = v12;
  v61 = (__int128 *)sub_247DBCF64();
  v19[8] = v61;
  v19[4] = v16;
  v19[5] = v18;
  sub_247E824A0();
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  v20 = (void *)objc_opt_self();
  v73[0] = v10;
  swift_bridgeObjectRetain();
  MEMORY[0x2495930AC](MEMORY[0x24BEE03C0], v8);
  v63 = v8;
  v73[0] = (id)sub_247E82374();
  MEMORY[0x24BDAC7A8](v73[0]);
  v51 = v69;
  v52 = v68;
  v53 = v70;
  v54 = v67;
  v64 = v5;
  v55 = v5;
  v56 = v71;
  v21 = sub_247E82368();
  v22 = (char *)sub_247E71424(0, &qword_257707340);
  v23 = MEMORY[0x2495930AC](MEMORY[0x24BEE12E0], v21);
  v24 = v65;
  sub_247E61EC0((void (*)(char *, char *))sub_247E71400, (uint64_t)&v49, v21, v22, MEMORY[0x24BEE4078], v23, MEMORY[0x24BEE40A8], v25);
  swift_bridgeObjectRelease();
  v26 = (void *)sub_247E82308();
  swift_bridgeObjectRelease();
  sub_247E81C30();
  v27 = (void *)sub_247E82200();
  swift_bridgeObjectRelease();
  v73[0] = 0;
  LOBYTE(v19) = objc_msgSend(v20, sel_unarchivePackages_into_error_, v26, v27, v73);

  v28 = v73[0];
  if ((v19 & 1) != 0)
  {
    v65 = (id)qword_25445B018;
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = v57;
    v66 = v24;
    v73[0] = v72;
    MEMORY[0x24BDAC7A8](v29);
    v30 = v68;
    v31 = v69;
    v51 = v69;
    v52 = v68;
    v33 = v70;
    v32 = v71;
    v34 = v67;
    v53 = v70;
    v54 = v67;
    v35 = v64;
    v55 = v64;
    v56 = v71;
    v36 = swift_getKeyPath();
    v62 = &v57;
    v37 = MEMORY[0x24BDAC7A8](v36);
    v49 = v31;
    v50 = v30;
    v51 = v33;
    v52 = v34;
    v53 = v35;
    v54 = v32;
    v55 = v37;
    swift_bridgeObjectRetain();
    v38 = v65;
    v39 = MEMORY[0x24BEE0D00];
    v41 = sub_247E61EC0((void (*)(char *, char *))sub_247E7145C, (uint64_t)v48, (uint64_t)v63, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], AssociatedTypeWitness, MEMORY[0x24BEE40A8], v40);
    swift_release();
    swift_bridgeObjectRelease();
    v42 = MEMORY[0x2495925B4](v41, v39);
    v44 = v43;
    swift_bridgeObjectRelease();
    v45 = v61;
    *(_QWORD *)(v29 + 56) = v39;
    *(_QWORD *)(v29 + 64) = v45;
    *(_QWORD *)(v29 + 32) = v42;
    *(_QWORD *)(v29 + 40) = v44;
    sub_247E824A0();
    sub_247E81FE4();

    return swift_bridgeObjectRelease();
  }
  else
  {
    v47 = v28;
    sub_247E81B7C();

    return swift_willThrow();
  }
}

uint64_t sub_247E6F20C()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_247E82668();
}

uint64_t sub_247E6F29C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  result = sub_247E82824();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id sub_247E6F374@<X0>(_QWORD *a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  id result;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  result = sub_247E61A38(AssociatedTypeWitness, AssociatedConformanceWitness);
  *a1 = result;
  return result;
}

uint64_t sub_247E6F414(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[3] = a1;
  v2[4] = v1;
  v2[5] = *v1;
  return swift_task_switch();
}

uint64_t sub_247E6F434()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD, uint64_t, uint64_t);

  if (qword_25445AFA8 != -1)
    swift_once();
  v1 = v0[5];
  v2 = v0[3];
  v3 = (void *)qword_25445B018;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247E83230;
  v0[2] = v2;
  v5 = *(_QWORD *)(v1 + 120);
  v6 = *(_QWORD *)(v1 + 96);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v7 = sub_247E823EC();
  v8 = v3;
  MEMORY[0x2495930AC](MEMORY[0x24BEE1730], v7);
  sub_247E8283C();
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 64) = sub_247DBCF64();
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0xE000000000000000;
  sub_247E824A0();
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  v11 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v5 + 32) + *(_QWORD *)(v5 + 32));
  v9 = (_QWORD *)swift_task_alloc();
  v0[6] = v9;
  *v9 = v0;
  v9[1] = sub_247E6F664;
  return v11(v0[3], v6, v5);
}

uint64_t sub_247E6F664(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 56) = a1;
  *(_QWORD *)(v3 + 64) = v1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_247E6F6D8()
{
  uint64_t v0;

  sub_247E6EBA0(*(void **)(v0 + 56));
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247E6F72C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[3] = a1;
  v2[4] = v1;
  v2[5] = *v1;
  v2[6] = *v1;
  return swift_task_switch();
}

uint64_t sub_247E6F754()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v10;
  _QWORD *v11;

  if (qword_25445AFA8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 24);
  v2 = (void *)qword_25445B018;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247E83230;
  *(_QWORD *)(v0 + 16) = v1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v0 + 56) = swift_getAssociatedTypeWitness();
  v4 = sub_247E82368();
  v5 = v2;
  MEMORY[0x2495930AC](MEMORY[0x24BEE12F8], v4);
  sub_247E8283C();
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 64) = sub_247DBCF64();
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0xE000000000000000;
  sub_247E824A0();
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  v6 = sub_247E64304();
  *(_QWORD *)(v0 + 64) = v6;
  v7 = v6;
  *(_QWORD *)(v0 + 72) = swift_getAssociatedConformanceWitness();
  if ((sub_247E823D4() & 1) != 0)
  {
    v8 = sub_247E823D4();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(BOOL))(v0 + 8))((v8 & 1) == 0);
  }
  else
  {
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v10;
    *v10 = v0;
    v10[1] = sub_247E6FA18;
    v11 = *(_QWORD **)(v0 + 32);
    v10[3] = v7;
    v10[4] = v11;
    v10[5] = *v11;
    return swift_task_switch();
  }
}

uint64_t sub_247E6FA18()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247E6FA7C()
{
  uint64_t v0;
  char v1;

  v1 = sub_247E823D4();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(BOOL))(v0 + 8))((v1 & 1) == 0);
}

uint64_t sub_247E6FACC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

unint64_t sub_247E6FB04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t result;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_247E82128();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25445AFA8 != -1)
    swift_once();
  v4 = (void *)qword_25445B018;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247E83230;
  v6 = v4;
  sub_247E8211C();
  v7 = sub_247E82110();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  result = sub_247E82110();
  if (v7 < result)
  {
    __break(1u);
  }
  else
  {
    v9 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v5 + 64) = v9;
    *(double *)(v5 + 32) = (double)(v7 - result) / 1000000.0;
    sub_247E824A0();
    sub_247E81FE4();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t WorkService.getWorkServiceData()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v6;
  uint64_t *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 216));
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for WorkServiceData(255, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  sub_247E82560();
  v7 = (uint64_t *)(v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16));
  v8 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v8);
  v9 = *v7;
  v10 = v7[1];
  v11 = v7[2];
  v12 = v7[3];
  v13 = v7[4];
  v14 = v7[5];
  *a1 = *v7;
  a1[1] = v10;
  a1[2] = v11;
  a1[3] = v12;
  a1[4] = v13;
  a1[5] = v14;
  sub_247E712D0(v9, v10);
  os_unfair_lock_unlock(v8);
  return swift_release();
}

uint64_t sub_247E6FD8C@<X0>(uint64_t *a1@<X8>)
{
  return WorkService.getWorkServiceData()(a1);
}

double sub_247E6FDAC@<D0>(uint64_t a1@<X8>)
{
  return WorkService.getExtendedWorkServiceData()(a1);
}

unint64_t sub_247E6FDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t result;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_247E82128();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25445AFA0 != -1)
    swift_once();
  v7 = (void *)qword_25445B010;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_247E83230;
  v9 = v7;
  sub_247E8211C();
  v10 = sub_247E82110();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  result = sub_247E82110();
  if (v10 < result)
  {
    __break(1u);
  }
  else
  {
    v12 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v8 + 64) = v12;
    *(double *)(v8 + 32) = (double)(v10 - result) / 1000000.0;
    sub_247E824A0();
    sub_247E81FE4();

    result = swift_bridgeObjectRelease();
    *(_BYTE *)(a2 + *(_QWORD *)(*(_QWORD *)a2 + 256)) = 1;
  }
  return result;
}

uint64_t sub_247E6FF48(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_247E6FF58(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_247E6FF68()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

void sub_247E6FFF4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  sub_247E64C88(v0 + ((v1 + 72) & ~v1));
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

uint64_t sub_247E70064(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495930AC](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247E700A4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_247E700C8()
{
  return sub_247E71364((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_247E65334);
}

uint64_t sub_247E700D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247E700F8()
{
  return sub_247E71364((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_247E66024);
}

uint64_t sub_247E70104(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247E70130()
{
  return sub_247E6CB68();
}

uint64_t sub_247E70138()
{
  return swift_deallocObject();
}

uint64_t sub_247E70148()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_247E70168()
{
  JUMPOUT(0x2495930ACLL);
}

uint64_t sub_247E70178()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_247E70198()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t dispatch thunk of WorkServiceType.perform<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of WorkServiceType.performAsync<A, B>(_:qos:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v17;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a8 + 32) + *(_QWORD *)(a8 + 32));
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v17;
  *v17 = v8;
  v17[1] = sub_247E70288;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_247E70288()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of WorkServiceType.runningVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of WorkServiceType.loadedVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of WorkServiceType.configuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t method lookup function for WorkService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WorkService.__allocating_init(configurationManager:analyticsEnabled:configuration:packageService:requestProcessor:setup:tabiResourcesContentDirectory:tabiModelsContentDirectory:tabiUserFeaturesFactory:workEventProcessorRegistry:performanceOptimizationPolicy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t sub_247E70324()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_247E7032C(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_247E703BC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247E70408 + 4 * byte_247E8D0D9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247E7043C + 4 * byte_247E8D0D4[v4]))();
}

uint64_t sub_247E7043C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E70444(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247E7044CLL);
  return result;
}

uint64_t sub_247E70458(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247E70460);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247E70464(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E7046C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E70478(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247E70484(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for WorkService.PerformanceOptimizationPolicy()
{
  JUMPOUT(0x24959304CLL);
}

uint64_t sub_247E7049C()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_247E704A4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247E704D0()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_247E704D8(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_247E70518(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247E70548(uint64_t a1, int a2)
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

uint64_t sub_247E70590(uint64_t result, int a2, int a3)
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

uint64_t sub_247E705CC()
{
  return 0;
}

void type metadata accessor for WorkService.WorkErrors()
{
  JUMPOUT(0x24959304CLL);
}

uint64_t sub_247E705E8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_247E705F0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_247E7066C(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if (v7 <= 7 && (unint64_t)(v6 + 1) <= 0x18 && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    v11 = *((unsigned __int8 *)a2 + v6);
    if (v11 >= 2)
    {
      if (v6 <= 3)
        v12 = v6;
      else
        v12 = 4;
      __asm { BR              X14 }
    }
    if (v11 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      *((_BYTE *)a1 + v6) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      *((_BYTE *)a1 + v6) = 0;
    }
  }
  else
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return a1;
}

uint64_t sub_247E707C4(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = *(_QWORD *)(v3 + 64);
  if (*(unsigned __int8 *)(a1 + v4) >= 2u)
  {
    if (v4 <= 3)
      v5 = v4;
    else
      v5 = 4;
    __asm { BR              X14 }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_247E7089C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(unsigned __int8 *)(a2 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v7 == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    *(_BYTE *)(a1 + v6) = 1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    *(_BYTE *)(a1 + v6) = 0;
  }
  return a1;
}

uint64_t sub_247E709B4(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(_QWORD *)(v5 + 64);
    if (*(unsigned __int8 *)(a1 + v6) >= 2u)
    {
      if (v6 <= 3)
        v7 = v6;
      else
        v7 = 4;
      __asm { BR              X12 }
    }
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    v8 = *(unsigned __int8 *)(a2 + v6);
    if (v8 >= 2)
    {
      if (v6 <= 3)
        v9 = v6;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      *(_BYTE *)(a1 + v6) = 1;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      *(_BYTE *)(a1 + v6) = 0;
    }
  }
  return a1;
}

uint64_t sub_247E70B6C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(unsigned __int8 *)(a2 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v7 == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    *(_BYTE *)(a1 + v6) = 1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    *(_BYTE *)(a1 + v6) = 0;
  }
  return a1;
}

uint64_t sub_247E70C84(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(_QWORD *)(v5 + 64);
    if (*(unsigned __int8 *)(a1 + v6) >= 2u)
    {
      if (v6 <= 3)
        v7 = v6;
      else
        v7 = 4;
      __asm { BR              X12 }
    }
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    v8 = *(unsigned __int8 *)(a2 + v6);
    if (v8 >= 2)
    {
      if (v6 <= 3)
        v9 = v6;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      *(_BYTE *)(a1 + v6) = 1;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      *(_BYTE *)(a1 + v6) = 0;
    }
  }
  return a1;
}

uint64_t sub_247E70E3C(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char v7;
  int v8;
  unsigned int v10;
  int v11;
  unsigned int v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (!a2)
    return 0;
  v5 = *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
  if (a2 < 0xFE)
    goto LABEL_19;
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if ((v5 + 1) <= 3)
  {
    v10 = ((a2 + ~(-1 << v7) - 253) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = *(_DWORD *)(a1 + v6);
      if (!v8)
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v10 > 0xFF)
    {
      v8 = *(unsigned __int16 *)(a1 + v6);
      if (!*(_WORD *)(a1 + v6))
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v10 < 2)
    {
LABEL_19:
      v12 = *(unsigned __int8 *)(a1 + v5);
      if (v12 >= 3)
        return (v12 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v8 = *(unsigned __int8 *)(a1 + v6);
  if (!*(_BYTE *)(a1 + v6))
    goto LABEL_19;
LABEL_12:
  v11 = (v8 - 1) << v7;
  if (v6 > 3)
    v11 = 0;
  if ((_DWORD)v6)
  {
    if (v6 > 3)
      LODWORD(v6) = 4;
    __asm { BR              X11 }
  }
  return (v11 + 254);
}

void sub_247E70F78(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  size_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v6 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  v7 = v6 + 1;
  if (a3 < 0xFE)
  {
    v8 = 0;
  }
  else if (v7 <= 3)
  {
    v10 = ((a3 + ~(-1 << (8 * v7)) - 253) >> (8 * v7)) + 1;
    if (HIWORD(v10))
    {
      v8 = 4u;
    }
    else if (v10 >= 0x100)
    {
      v8 = 2;
    }
    else
    {
      v8 = v10 > 1;
    }
  }
  else
  {
    v8 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v9 = a2 - 254;
  if (v7 < 4)
  {
    if ((_DWORD)v6 != -1)
    {
      v11 = v9 & ~(-1 << (8 * v7));
      bzero(a1, v7);
      if ((_DWORD)v7 == 3)
      {
        *(_WORD *)a1 = v11;
        a1[2] = BYTE2(v11);
      }
      else if ((_DWORD)v7 == 2)
      {
        *(_WORD *)a1 = v11;
      }
      else
      {
        *a1 = v11;
      }
    }
  }
  else
  {
    bzero(a1, v6 + 1);
    *(_DWORD *)a1 = v9;
  }
  __asm { BR              X10 }
}

uint64_t sub_247E71138(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  result = *(unsigned __int8 *)(a1 + v2);
  if (result >= 2)
  {
    if (v2 <= 3)
      v4 = v2;
    else
      v4 = 4;
    __asm { BR              X12 }
  }
  return result;
}

void sub_247E711F4(_BYTE *a1, unsigned int a2)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  v4 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_247E712D0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_247E71320()
{
  return sub_247E71364((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_247E65F34);
}

uint64_t sub_247E7132C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_247E71350()
{
  uint64_t v0;

  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t sub_247E71358()
{
  return sub_247E71364((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_247E660EC);
}

uint64_t sub_247E71364(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[8], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t _s6ErrorsOMa()
{
  uint64_t result;

  result = qword_2577073C0;
  if (!qword_2577073C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247E713BC()
{
  return 48;
}

__n128 sub_247E713C8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_247E713E0()
{
  return 48;
}

__n128 sub_247E713EC(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

id sub_247E71400@<X0>(_QWORD *a1@<X8>)
{
  return sub_247E6F374(a1);
}

uint64_t sub_247E71424(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_247E7145C()
{
  return swift_getAtKeyPath();
}

uint64_t sub_247E71484()
{
  return swift_deallocObject();
}

uint64_t sub_247E71498@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247E7156C(a1, a2);
}

uint64_t sub_247E714AC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247E714FC()
{
  return swift_deallocObject();
}

uint64_t sub_247E71510()
{
  return sub_247E69188();
}

uint64_t sub_247E71530@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247E7156C(a1, a2);
}

uint64_t sub_247E71544()
{
  return swift_deallocObject();
}

uint64_t sub_247E71558@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247E7156C(a1, a2);
}

uint64_t sub_247E7156C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 64))(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_247E715A8()
{
  return swift_release();
}

void type metadata accessor for WorkService.Errors()
{
  JUMPOUT(0x24959304CLL);
}

uint64_t sub_247E715BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;

  v5 = *(_QWORD **)v4;
  if (*(_BYTE *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 144)) == 1)
  {
    v9 = result;
    v24 = &v20;
    v10 = *(_QWORD *)(v4 + v5[27]);
    v11 = v5[10];
    v12 = v5[12];
    v21 = v5[11];
    v22 = v11;
    v13 = v5[14];
    v23 = v5[13];
    v14 = v5[15];
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    type metadata accessor for WorkServiceData(255, AssociatedTypeWitness, AssociatedConformanceWitness, v17);
    sub_247E82560();
    v18 = v10 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v10 + 16);
    v19 = (os_unfair_lock_s *)(v10 + ((*(unsigned int *)(*(_QWORD *)v10 + 48) + 3) & 0x1FFFFFFFCLL));
    swift_retain();
    os_unfair_lock_lock(v19);
    sub_247E6C1B0(v18, a2, v9 & 1, v22, v21, v12, a3, v23, v13, v14, a4);
    os_unfair_lock_unlock(v19);
    return swift_release();
  }
  return result;
}

uint64_t sub_247E71728(_QWORD *a1)
{
  uint64_t v1;

  return sub_247E60454(a1, v1);
}

uint64_t sub_247E71740(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495930AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247E71780(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247E717C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247E71804(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RequestData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247E71848(uint64_t a1)
{
  uint64_t v1;

  return sub_247E6ACFC(a1, *(uint64_t **)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_247E71858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 40);
  v12 = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458F98);
  v11 = sub_247E82398();
  v2 = *(_QWORD *)(v11 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = (v3 + *(_QWORD *)(v2 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = sub_247E820E0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (v5 + v6 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v11);
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v12);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v9, v7);
  return swift_deallocObject();
}

uint64_t sub_247E71970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 24);
  v15 = *(_QWORD *)(v0 + 16);
  v2 = *(uint64_t (**)())(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v14 = *(_OWORD *)(v0 + 56);
  v5 = *(char **)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458F98);
  v7 = *(_QWORD *)(sub_247E82398() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v3 - 8);
  v10 = (v8 + *(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 64);
  v12 = *(unsigned __int8 *)(*(_QWORD *)(sub_247E820E0() - 8) + 80);
  return sub_247E6B154(*(_QWORD *)(v0 + 88), v0 + v8, v0 + v10, v0 + ((v10 + v11 + v12) & ~v12), v15, v1, v2, v3, v4, (void *)v14, *((uint64_t (**)())&v14 + 1), v5, v6);
}

uint64_t sub_247E71A6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458F98);
  v5 = sub_247E82398();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_247E71B4C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = v0[5];
  v2 = v0[6];
  v3 = *(_QWORD *)(v1 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458F98);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_247E82398() - 8) + 80);
  return sub_247E6B6D8(v0[11], v0[12], v0[13], (uint64_t)v0 + v4, (uint64_t)v0 + ((v5 + v6) & ~v6), v1, v2);
}

uint64_t sub_247E71BE4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_247E699F0(v1[5], v1[2], v1[4], a1);
}

uint64_t sub_247E71C04()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_247E71C0C()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_247E71CF0(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(v5 + 64);
  if (v6 > 3)
  {
    v7 = *(_DWORD *)(v5 + 80);
    if ((unint64_t)(v6 + 1) > 0x18 || (v7 & 0x1000F8) != 0)
    {
LABEL_30:
      v15 = *a2;
      *a1 = *a2;
      a1 = (uint64_t *)(v15 + (((v7 & 0xF8 | 7u) + 16) & ~(unint64_t)(v7 & 0xF8 | 7u)));
      swift_retain();
      return a1;
    }
LABEL_10:
    v9 = *((unsigned __int8 *)a2 + v6);
    if (v9 < 2)
      goto LABEL_36;
LABEL_32:
    if (v6 <= 3)
      v16 = v6;
    else
      v16 = 4;
    __asm { BR              X13 }
  }
  v10 = ((1 << (8 * v6)) + 3) >> (8 * v6);
  v7 = *(_DWORD *)(v5 + 80);
  if (v10 > 0xFFFD)
  {
    if ((unint64_t)(v6 + 4) > 0x18 || (v7 & 0x1000F8) != 0)
      goto LABEL_30;
    v9 = *(_DWORD *)((char *)a2 + v6);
    if (v9 >= 2)
      goto LABEL_32;
  }
  else
  {
    v11 = v7 & 0x1000F8;
    if (v10 <= 0xFD)
    {
      if ((unint64_t)(v6 + 1) > 0x18 || v11 != 0)
        goto LABEL_30;
      goto LABEL_10;
    }
    if ((unint64_t)(v6 + 2) > 0x18 || v11 != 0)
      goto LABEL_30;
    v9 = *(unsigned __int16 *)((char *)a2 + v6);
    if (v9 >= 2)
      goto LABEL_32;
  }
LABEL_36:
  if (v9 == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
    if (v6 > 3)
      goto LABEL_42;
    v18 = ((1 << (8 * v6)) + 3) >> (8 * v6);
    if (v18 > 0xFFFD)
    {
      *(_DWORD *)((char *)a1 + v6) = 1;
      return a1;
    }
    if (v18 <= 0xFD)
LABEL_42:
      *((_BYTE *)a1 + v6) = 1;
    else
      *(_WORD *)((char *)a1 + v6) = 1;
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    if (v6 <= 3)
    {
      v17 = ((1 << (8 * v6)) + 3) >> (8 * v6);
      if (v17 > 0xFFFD)
      {
        *(_DWORD *)((char *)a1 + v6) = 0;
        return a1;
      }
      if (v17 > 0xFD)
      {
        *(_WORD *)((char *)a1 + v6) = 0;
        return a1;
      }
    }
    *((_BYTE *)a1 + v6) = 0;
  }
  return a1;
}

uint64_t sub_247E72018(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = *(_QWORD *)(v3 + 64);
  if (v4 <= 8)
    v4 = 8;
  if (v4 > 3)
    goto LABEL_4;
  v6 = ((1 << (8 * v4)) + 3) >> (8 * v4);
  if (v6 > 0xFFFD)
  {
    v5 = *(_DWORD *)(a1 + v4);
  }
  else
  {
    if (v6 <= 0xFD)
    {
LABEL_4:
      v5 = *(unsigned __int8 *)(a1 + v4);
      goto LABEL_9;
    }
    v5 = *(unsigned __int16 *)(a1 + v4);
  }
LABEL_9:
  if (v5 >= 2)
  {
    if (v4 <= 3)
      v7 = v4;
    else
      v7 = 4;
    __asm { BR              X14 }
  }
  if (v5 == 1)
    return swift_bridgeObjectRelease();
  else
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
}

_QWORD *sub_247E721B8(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(v5 + 64);
  if (v6 > 3)
    goto LABEL_5;
  v8 = ((1 << (8 * v6)) + 3) >> (8 * v6);
  if (v8 > 0xFFFD)
  {
    v7 = *(_DWORD *)((char *)a2 + v6);
  }
  else
  {
    if (v8 <= 0xFD)
    {
LABEL_5:
      v7 = *((unsigned __int8 *)a2 + v6);
      goto LABEL_10;
    }
    v7 = *(unsigned __int16 *)((char *)a2 + v6);
  }
LABEL_10:
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v9 = v6;
    else
      v9 = 4;
    __asm { BR              X13 }
  }
  if (v7 == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
    if (v6 > 3)
      goto LABEL_21;
    v11 = ((1 << (8 * v6)) + 3) >> (8 * v6);
    if (v11 > 0xFFFD)
    {
      *(_DWORD *)((char *)a1 + v6) = 1;
      return a1;
    }
    if (v11 <= 0xFD)
LABEL_21:
      *((_BYTE *)a1 + v6) = 1;
    else
      *(_WORD *)((char *)a1 + v6) = 1;
  }
  else
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    if (v6 <= 3)
    {
      v10 = ((1 << (8 * v6)) + 3) >> (8 * v6);
      if (v10 > 0xFFFD)
      {
        *(_DWORD *)((char *)a1 + v6) = 0;
        return a1;
      }
      if (v10 > 0xFD)
      {
        *(_WORD *)((char *)a1 + v6) = 0;
        return a1;
      }
    }
    *((_BYTE *)a1 + v6) = 0;
  }
  return a1;
}

_QWORD *sub_247E72428(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;

  if (a1 == a2)
    return a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(v5 + 64);
  if (v6 > 3)
    goto LABEL_6;
  v8 = ((1 << (8 * v6)) + 3) >> (8 * v6);
  if (v8 > 0xFFFD)
  {
    v7 = *(_DWORD *)((char *)a1 + v6);
  }
  else
  {
    if (v8 <= 0xFD)
    {
LABEL_6:
      v7 = *((unsigned __int8 *)a1 + v6);
      goto LABEL_11;
    }
    v7 = *(unsigned __int16 *)((char *)a1 + v6);
  }
LABEL_11:
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v9 = v6;
    else
      v9 = 4;
    __asm { BR              X12 }
  }
  if (v7 == 1)
  {
    swift_bridgeObjectRelease();
    if (v6 > 3)
      goto LABEL_22;
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    if (v6 > 3)
      goto LABEL_22;
  }
  v10 = ((1 << (8 * v6)) + 3) >> (8 * v6);
  if (v10 <= 0xFFFD)
  {
    if (v10 > 0xFD)
    {
      v11 = *(unsigned __int16 *)((char *)a2 + v6);
      if (v11 < 2)
        goto LABEL_31;
      goto LABEL_27;
    }
LABEL_22:
    v11 = *((unsigned __int8 *)a2 + v6);
    if (v11 < 2)
      goto LABEL_31;
LABEL_27:
    if (v6 <= 3)
      v12 = v6;
    else
      v12 = 4;
    __asm { BR              X12 }
  }
  v11 = *(_DWORD *)((char *)a2 + v6);
  if (v11 >= 2)
    goto LABEL_27;
LABEL_31:
  if (v11 == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
    if (v6 > 3)
      goto LABEL_37;
    v14 = ((1 << (8 * v6)) + 3) >> (8 * v6);
    if (v14 > 0xFFFD)
    {
      *(_DWORD *)((char *)a1 + v6) = 1;
      return a1;
    }
    if (v14 <= 0xFD)
LABEL_37:
      *((_BYTE *)a1 + v6) = 1;
    else
      *(_WORD *)((char *)a1 + v6) = 1;
  }
  else
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    if (v6 <= 3)
    {
      v13 = ((1 << (8 * v6)) + 3) >> (8 * v6);
      if (v13 > 0xFFFD)
      {
        *(_DWORD *)((char *)a1 + v6) = 0;
        return a1;
      }
      if (v13 > 0xFD)
      {
        *(_WORD *)((char *)a1 + v6) = 0;
        return a1;
      }
    }
    *((_BYTE *)a1 + v6) = 0;
  }
  return a1;
}

_QWORD *sub_247E727C4(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(v5 + 64);
  if (v6 > 3)
    goto LABEL_5;
  v8 = ((1 << (8 * v6)) + 3) >> (8 * v6);
  if (v8 > 0xFFFD)
  {
    v7 = *(_DWORD *)((char *)a2 + v6);
  }
  else
  {
    if (v8 <= 0xFD)
    {
LABEL_5:
      v7 = *((unsigned __int8 *)a2 + v6);
      goto LABEL_10;
    }
    v7 = *(unsigned __int16 *)((char *)a2 + v6);
  }
LABEL_10:
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v9 = v6;
    else
      v9 = 4;
    __asm { BR              X13 }
  }
  if (v7 == 1)
  {
    *a1 = *a2;
    if (v6 > 3)
      goto LABEL_21;
    v11 = ((1 << (8 * v6)) + 3) >> (8 * v6);
    if (v11 > 0xFFFD)
    {
      *(_DWORD *)((char *)a1 + v6) = 1;
      return a1;
    }
    if (v11 <= 0xFD)
LABEL_21:
      *((_BYTE *)a1 + v6) = 1;
    else
      *(_WORD *)((char *)a1 + v6) = 1;
  }
  else
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    if (v6 <= 3)
    {
      v10 = ((1 << (8 * v6)) + 3) >> (8 * v6);
      if (v10 > 0xFFFD)
      {
        *(_DWORD *)((char *)a1 + v6) = 0;
        return a1;
      }
      if (v10 > 0xFD)
      {
        *(_WORD *)((char *)a1 + v6) = 0;
        return a1;
      }
    }
    *((_BYTE *)a1 + v6) = 0;
  }
  return a1;
}

_QWORD *sub_247E72A30(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;

  if (a1 == a2)
    return a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(v5 + 64);
  if (v6 > 3)
    goto LABEL_6;
  v8 = ((1 << (8 * v6)) + 3) >> (8 * v6);
  if (v8 > 0xFFFD)
  {
    v7 = *(_DWORD *)((char *)a1 + v6);
  }
  else
  {
    if (v8 <= 0xFD)
    {
LABEL_6:
      v7 = *((unsigned __int8 *)a1 + v6);
      goto LABEL_11;
    }
    v7 = *(unsigned __int16 *)((char *)a1 + v6);
  }
LABEL_11:
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v9 = v6;
    else
      v9 = 4;
    __asm { BR              X12 }
  }
  if (v7 == 1)
  {
    swift_bridgeObjectRelease();
    if (v6 > 3)
      goto LABEL_22;
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    if (v6 > 3)
      goto LABEL_22;
  }
  v10 = ((1 << (8 * v6)) + 3) >> (8 * v6);
  if (v10 <= 0xFFFD)
  {
    if (v10 > 0xFD)
    {
      v11 = *(unsigned __int16 *)((char *)a2 + v6);
      if (v11 < 2)
        goto LABEL_31;
      goto LABEL_27;
    }
LABEL_22:
    v11 = *((unsigned __int8 *)a2 + v6);
    if (v11 < 2)
      goto LABEL_31;
LABEL_27:
    if (v6 <= 3)
      v12 = v6;
    else
      v12 = 4;
    __asm { BR              X12 }
  }
  v11 = *(_DWORD *)((char *)a2 + v6);
  if (v11 >= 2)
    goto LABEL_27;
LABEL_31:
  if (v11 == 1)
  {
    *a1 = *a2;
    if (v6 > 3)
      goto LABEL_37;
    v14 = ((1 << (8 * v6)) + 3) >> (8 * v6);
    if (v14 > 0xFFFD)
    {
      *(_DWORD *)((char *)a1 + v6) = 1;
      return a1;
    }
    if (v14 <= 0xFD)
LABEL_37:
      *((_BYTE *)a1 + v6) = 1;
    else
      *(_WORD *)((char *)a1 + v6) = 1;
  }
  else
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    if (v6 <= 3)
    {
      v13 = ((1 << (8 * v6)) + 3) >> (8 * v6);
      if (v13 > 0xFFFD)
      {
        *(_DWORD *)((char *)a1 + v6) = 0;
        return a1;
      }
      if (v13 > 0xFD)
      {
        *(_WORD *)((char *)a1 + v6) = 0;
        return a1;
      }
    }
    *((_BYTE *)a1 + v6) = 0;
  }
  return a1;
}

uint64_t sub_247E72DC8(uint64_t a1, unsigned int a2)
{
  unint64_t v4;
  int v5;
  unsigned int v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  int v20;
  unsigned int v22;
  int v23;
  int v24;
  unsigned int v25;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (v4 <= 8)
    v4 = 8;
  if (v4 > 3)
  {
    v5 = 3;
LABEL_7:
    v7 = 8;
    goto LABEL_8;
  }
  v6 = ((1 << (8 * v4)) + 3) >> (8 * v4);
  if (v6 > 0xFFFD)
    goto LABEL_11;
  v5 = v6 + 2;
  if (v6 <= 0xFD)
    goto LABEL_7;
  v7 = 16;
LABEL_8:
  v8 = (1 << v7) - v5;
  if ((v8 & 0x80000000) == 0)
  {
    if (v4 > 3)
      goto LABEL_15;
LABEL_12:
    v9 = ((1 << (8 * v4)) + 3) >> (8 * v4);
    v10 = 2;
    if (v9 > 0xFFFD)
      v10 = 4;
    if (v9 > 0xFD)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_11:
  v8 = 0x7FFFFFFF;
  if (v4 <= 3)
    goto LABEL_12;
LABEL_15:
  v10 = 1;
LABEL_16:
  if (!a2)
    return 0;
  if (a2 <= v8)
    goto LABEL_34;
  v11 = v10 + v4;
  v12 = 8 * v11;
  if (v11 <= 3)
  {
    v14 = ((a2 - v8 + ~(-1 << v12)) >> v12) + 1;
    if (HIWORD(v14))
    {
      v13 = *(_DWORD *)(a1 + v11);
      if (!v13)
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v14 > 0xFF)
    {
      v13 = *(unsigned __int16 *)(a1 + v11);
      if (!*(_WORD *)(a1 + v11))
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v14 < 2)
    {
LABEL_34:
      if (v8)
      {
        if (v4 <= 3)
        {
          v22 = ((1 << (8 * v4)) + 3) >> (8 * v4);
          if (v22 > 0xFFFD)
          {
            v17 = *(_DWORD *)(a1 + v4);
            v18 = ~v17;
LABEL_44:
            v25 = 0x7FFFFFFF;
LABEL_45:
            if (v25 > v18)
              return -v17;
            else
              return 0;
          }
          v20 = v22 + 2;
          if (v22 > 0xFD)
          {
            v24 = *(unsigned __int16 *)(a1 + v4);
            v17 = v24 | 0xFFFF0000;
            v18 = v24 ^ 0xFFFF;
            v19 = 16;
          }
          else
          {
            v23 = *(unsigned __int8 *)(a1 + v4);
            v17 = v23 | 0xFFFFFF00;
            v18 = v23 ^ 0xFF;
            v19 = 8;
          }
        }
        else
        {
          v16 = *(unsigned __int8 *)(a1 + v4);
          v17 = v16 | 0xFFFFFF00;
          v18 = v16 ^ 0xFF;
          v19 = 8;
          v20 = 3;
        }
        v25 = (1 << v19) - v20;
        if ((v25 & 0x80000000) == 0)
          goto LABEL_45;
        goto LABEL_44;
      }
      return 0;
    }
  }
  v13 = *(unsigned __int8 *)(a1 + v11);
  if (!*(_BYTE *)(a1 + v11))
    goto LABEL_34;
LABEL_27:
  v15 = (v13 - 1) << v12;
  if (v11 > 3)
    v15 = 0;
  if ((_DWORD)v11)
  {
    if (v11 > 3)
      LODWORD(v11) = 4;
    __asm { BR              X12 }
  }
  return v8 + v15 + 1;
}

void sub_247E7309C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v6;
  char v7;
  int v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  size_t v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v6 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (v6 <= 8)
    v6 = 8;
  v7 = 8 * v6;
  if (v6 <= 3)
  {
    v11 = ((1 << v7) + 3) >> v7;
    if (v11 > 0xFFFD)
      goto LABEL_12;
    v8 = v11 + 2;
    if (v11 > 0xFD)
    {
      v9 = 16;
LABEL_6:
      v10 = (1 << v9) - v8;
      if ((v10 & 0x80000000) == 0)
      {
        if (v6 > 3)
          goto LABEL_16;
LABEL_13:
        v12 = ((1 << v7) + 3) >> v7;
        v13 = 2;
        if (v12 > 0xFFFD)
          v13 = 4;
        if (v12 > 0xFD)
        {
LABEL_17:
          v14 = v13 + v6;
          if (a3 <= v10)
          {
            v15 = 0;
          }
          else if (v14 <= 3)
          {
            v17 = ((a3 - v10 + ~(-1 << (8 * v14))) >> (8 * v14)) + 1;
            if (HIWORD(v17))
            {
              v15 = 4u;
            }
            else if (v17 >= 0x100)
            {
              v15 = 2;
            }
            else
            {
              v15 = v17 > 1;
            }
          }
          else
          {
            v15 = 1u;
          }
          if (v10 < a2)
          {
            v16 = ~v10 + a2;
            if (v14 < 4)
            {
              if ((_DWORD)v14)
              {
                v18 = v16 & ~(-1 << (8 * v14));
                bzero(a1, v14);
                if ((_DWORD)v14 == 3)
                {
                  *(_WORD *)a1 = v18;
                  a1[2] = BYTE2(v18);
                }
                else if ((_DWORD)v14 == 2)
                {
                  *(_WORD *)a1 = v18;
                }
                else
                {
                  *a1 = v18;
                }
              }
            }
            else
            {
              bzero(a1, v14);
              *(_DWORD *)a1 = v16;
            }
            __asm { BR              X10 }
          }
          __asm { BR              X12 }
        }
LABEL_16:
        v13 = 1;
        goto LABEL_17;
      }
LABEL_12:
      v10 = 0x7FFFFFFF;
      if (v6 > 3)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  else
  {
    v8 = 3;
  }
  v9 = 8;
  goto LABEL_6;
}

uint64_t sub_247E73394(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  unsigned int v4;
  uint64_t v5;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v2 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (v2 <= 8)
    v2 = 8;
  if (v2 > 3)
    goto LABEL_4;
  v4 = ((1 << (8 * v2)) + 3) >> (8 * v2);
  if (v4 > 0xFFFD)
  {
    result = *(unsigned int *)(a1 + v2);
  }
  else
  {
    if (v4 <= 0xFD)
    {
LABEL_4:
      result = *(unsigned __int8 *)(a1 + v2);
      goto LABEL_9;
    }
    result = *(unsigned __int16 *)(a1 + v2);
  }
LABEL_9:
  if (result >= 2)
  {
    if (v2 <= 3)
      v5 = v2;
    else
      v5 = 4;
    __asm { BR              X12 }
  }
  return result;
}

uint64_t sub_247E734F4(_BYTE *a1, unsigned int a2)
{
  uint64_t result;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int *v9;
  unsigned int v10;
  int v11;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  result = swift_getAssociatedTypeWitness();
  if (*(_QWORD *)(*(_QWORD *)(result - 8) + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(result - 8) + 64);
  if (a2 > 1)
  {
    v6 = a2 - 2;
    if (v5 < 4)
    {
      v8 = (v6 >> (8 * v5)) + 2;
      v9 = (int *)&a1[v5];
      v10 = ((1 << (8 * v5)) + 3) >> (8 * v5);
      if (v10 > 0xFFFD)
      {
        *v9 = v8;
      }
      else if (v10 > 0xFD)
      {
        *(_WORD *)v9 = v8;
      }
      else
      {
        *(_BYTE *)v9 = v8;
      }
    }
    else
    {
      a1[v5] = 2;
    }
    if (v5 <= 3)
      v11 = v5;
    else
      v11 = 4;
    bzero(a1, v5);
    __asm { BR              X10 }
  }
  if (v5 > 3)
    goto LABEL_6;
  v7 = ((1 << (8 * v5)) + 3) >> (8 * v5);
  if (v7 > 0xFFFD)
  {
    *(_DWORD *)&a1[v5] = a2;
  }
  else
  {
    if (v7 <= 0xFD)
    {
LABEL_6:
      a1[v5] = a2;
      return result;
    }
    *(_WORD *)&a1[v5] = a2;
  }
  return result;
}

uint64_t *sub_247E736B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
    }
    else
    {
      v8 = sub_247E81C54();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_247E73774(uint64_t a1)
{
  uint64_t v3;

  if (swift_getEnumCaseMultiPayload() == 1)
    return swift_bridgeObjectRelease();
  v3 = sub_247E81C54();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

_QWORD *sub_247E737C4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    v5 = sub_247E81C54();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_247E73854(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_247E73904((uint64_t)a1, (uint64_t (*)(_QWORD))_s6ErrorsOMa);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      v4 = sub_247E81C54();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_247E73904(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_247E73940(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_247E81C54();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_247E739C8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_247E73904((uint64_t)a1, (uint64_t (*)(_QWORD))_s6ErrorsOMa);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_247E81C54();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_247E73A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_247E73A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_247E73A88()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_247E73A98()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81C54();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_247E73B04()
{
  return sub_247E7145C();
}

unint64_t static WorkServiceData.uninitalized.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;

  swift_getAssociatedTypeWitness();
  v2 = sub_247E82344();
  v3 = MEMORY[0x24BEE4AF8];
  result = sub_247DFFDA4(MEMORY[0x24BEE4AF8]);
  strcpy((char *)a1, "uninitialized");
  *(_WORD *)(a1 + 14) = -4864;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v2;
  *(_BYTE *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t WorkServiceData.init(configurationVersion:packageVersions:cachedPackageIDs:resolvedGlobalGraph:requestsByWorkName:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(_QWORD *)a7 = result;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  *(_BYTE *)(a7 + 32) = a5;
  *(_QWORD *)(a7 + 40) = a6;
  return result;
}

uint64_t TimedData.init(startTimestamp:endTimestamp:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  v6 = sub_247E81CB4();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v9(a3, a1, v6);
  v7 = a3 + *(int *)(type metadata accessor for TimedData(0) + 20);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(v7, a2, v6);
}

uint64_t RequestData.init(timedData:successful:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t result;

  sub_247E73FA0(a1, a3);
  result = type metadata accessor for RequestData(0);
  *(_BYTE *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

__n128 ExtendedWorkServiceData.init(packageAssetIDs:workServiceData:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v3;
  __n128 result;

  *(_QWORD *)a3 = a1;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a3 + 8) = *(_OWORD *)a2;
  *(_OWORD *)(a3 + 24) = v3;
  result = *(__n128 *)(a2 + 32);
  *(__n128 *)(a3 + 40) = result;
  return result;
}

uint64_t ExtendedWorkServiceData.packageIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ExtendedWorkServiceData.workServiceData.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v6 = v1[5];
  v7 = v1[6];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  return sub_247E7402C(v2, v3);
}

uint64_t TimedData.startTimestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247E81CB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TimedData.endTimestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TimedData(0) + 20);
  v4 = sub_247E81CB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t RequestData.timedData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_247E7407C(v1, a1);
}

uint64_t RequestData.timedData.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_247E740C0(a1, v1);
}

uint64_t (*RequestData.timedData.modify())()
{
  return nullsub_273;
}

uint64_t RequestData.successful.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for RequestData(0) + 20));
}

uint64_t RequestData.successful.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for RequestData(0);
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*RequestData.successful.modify())()
{
  type metadata accessor for RequestData(0);
  return nullsub_274;
}

uint64_t WorkServiceData.configurationVersion.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WorkServiceData.configurationVersion.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*WorkServiceData.configurationVersion.modify())()
{
  return nullsub_275;
}

uint64_t WorkServiceData.packageVersions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorkServiceData.packageVersions.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*WorkServiceData.packageVersions.modify())()
{
  return nullsub_276;
}

uint64_t WorkServiceData.cachedPackageIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorkServiceData.cachedPackageIDs.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*WorkServiceData.cachedPackageIDs.modify())()
{
  return nullsub_277;
}

uint64_t WorkServiceData.resolvedGlobalGraph.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t WorkServiceData.resolvedGlobalGraph.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = result;
  return result;
}

uint64_t (*WorkServiceData.resolvedGlobalGraph.modify())()
{
  return nullsub_278;
}

uint64_t WorkServiceData.requestsByWorkName.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorkServiceData.requestsByWorkName.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t (*WorkServiceData.requestsByWorkName.modify())()
{
  return nullsub_279;
}

uint64_t type metadata accessor for TimedData(uint64_t a1)
{
  return sub_247E73FF8(a1, qword_254458788);
}

uint64_t sub_247E73FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TimedData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RequestData(uint64_t a1)
{
  return sub_247E73FF8(a1, qword_254458908);
}

uint64_t sub_247E73FF8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247E7402C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_247E7407C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TimedData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247E740C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TimedData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of WorkServiceDataProviderType.getWorkServiceData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of WorkServiceDataProviderType.getExtendedWorkServiceData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_247E74114()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_247E7411C(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + 16);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247E7416C(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = v5;
    v6 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = v6;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 24);
    *v4 = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v7;
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  return a1;
}

uint64_t sub_247E74210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 16);
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    v9 = *(_OWORD *)(a2 + 8);
    v10 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v10;
    *(_OWORD *)(a1 + 8) = v9;
    return a1;
  }
  if (!v7)
  {
    v8 = type metadata accessor for WorkServiceData(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v6);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1 + 8, v8);
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_247E74388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_5;
  v7 = *(_QWORD *)(a2 + 16);
  if (!v7)
  {
    v8 = type metadata accessor for WorkServiceData(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v6);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1 + 8, v8);
LABEL_5:
    v9 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v9;
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    return a1;
  }
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247E74460(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_247E744A8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ExtendedWorkServiceData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ExtendedWorkServiceData);
}

uint64_t *initializeBufferWithCopyOfBuffer for TimedData(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
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
    v7 = sub_247E81CB4();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for TimedData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = sub_247E81CB4();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t initializeWithCopy for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_247E81CB4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithCopy for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_247E81CB4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t initializeWithTake for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_247E81CB4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for TimedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_247E81CB4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimedData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E747D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81CB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TimedData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E74818(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_247E81CB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_247E74858()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247E81CB4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for RequestData(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247E81CB4();
    v8 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = type metadata accessor for TimedData(0);
    v8((_QWORD *)((char *)a1 + *(int *)(v9 + 20)), (_QWORD *)((char *)a2 + *(int *)(v9 + 20)), v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for RequestData(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v5)(uint64_t, uint64_t);

  v2 = sub_247E81CB4();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v5(a1, v2);
  v3 = a1 + *(int *)(type metadata accessor for TimedData(0) + 20);
  return ((uint64_t (*)(uint64_t, uint64_t))v5)(v3, v2);
}

uint64_t initializeWithCopy for RequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_247E81CB4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = type metadata accessor for TimedData(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for RequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_247E81CB4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = type metadata accessor for TimedData(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for RequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_247E81CB4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = type metadata accessor for TimedData(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for RequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_247E81CB4();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = type metadata accessor for TimedData(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E74BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for TimedData(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RequestData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247E74C88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for TimedData(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t sub_247E74D00()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for TimedData(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247E74D70(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_247E74DA0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247E74DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247E74E3C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_247E74EEC(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247E74F58(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t dispatch thunk of UserFeaturesWorkFactoryType.work()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

__n128 sub_247E74FB0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __n128 result;
  __n128 v13;
  __int128 v14;
  __int128 v15;

  v14 = a3[1];
  v15 = *a3;
  v13 = (__n128)a3[2];
  v9 = *((_QWORD *)a3 + 6);
  *(_QWORD *)a6 = a1;
  v10 = type metadata accessor for WorkPreparationEvent(0, a4, a5, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(&a6[*(int *)(v10 + 36)], a2, a4);
  v11 = &a6[*(int *)(v10 + 40)];
  *(_OWORD *)v11 = v15;
  *((_OWORD *)v11 + 1) = v14;
  result = v13;
  *((__n128 *)v11 + 2) = v13;
  *((_QWORD *)v11 + 6) = v9;
  return result;
}

uint64_t WorkPreparationEvent.userFeatures.getter()
{
  return swift_retain();
}

uint64_t WorkPreparationEvent.work.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t WorkPreparationEvent.extendedWorkServiceData.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (_QWORD *)(v2 + *(int *)(a1 + 40));
  v4 = v3[1];
  v5 = v3[2];
  v6 = v3[3];
  v7 = v3[4];
  v8 = v3[5];
  v9 = v3[6];
  *a2 = *v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  swift_bridgeObjectRetain();
  return sub_247E750E8(v4, v5);
}

uint64_t sub_247E750E8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

id WorkEventProcessor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id WorkEventProcessor.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for WorkEventProcessor(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_247E751A8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_247E751B0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_247E75230(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((v7 + ((v6 + 8) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 56 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v12 = ((unint64_t)a1 + v6 + 8) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 8) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
    v15 = (v7 + v12) & 0xFFFFFFFFFFFFFFF8;
    v16 = (v7 + v13) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)v15 = *(_QWORD *)v16;
    v17 = *(_QWORD *)(v16 + 16);
    swift_bridgeObjectRetain();
    if (v17)
    {
      *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
      *(_QWORD *)(v15 + 16) = *(_QWORD *)(v16 + 16);
      *(_QWORD *)(v15 + 24) = *(_QWORD *)(v16 + 24);
      *(_QWORD *)(v15 + 32) = *(_QWORD *)(v16 + 32);
      *(_BYTE *)(v15 + 40) = *(_BYTE *)(v16 + 40);
      *(_QWORD *)(v15 + 48) = *(_QWORD *)(v16 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v18 = *(_OWORD *)(v16 + 8);
      v19 = *(_OWORD *)(v16 + 40);
      *(_OWORD *)(v15 + 24) = *(_OWORD *)(v16 + 24);
      *(_OWORD *)(v15 + 40) = v19;
      *(_OWORD *)(v15 + 8) = v18;
    }
  }
  return a1;
}

uint64_t sub_247E75384(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  swift_release();
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v5 = (a1 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v5);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  result = *(_QWORD *)(v6 + 16);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_247E75420(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = ((unint64_t)a1 + v6 + 8) & ~v6;
  v8 = ((unint64_t)a2 + v6 + 8) & ~v6;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  swift_retain();
  v9(v7, v8, v4);
  v10 = *(_QWORD *)(v5 + 64) + 7;
  v11 = (v10 + v7) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v10 + v8) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v13 = *(_QWORD *)(v12 + 16);
  swift_bridgeObjectRetain();
  if (v13)
  {
    *(_QWORD *)(v11 + 8) = *(_QWORD *)(v12 + 8);
    *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(v11 + 24) = *(_QWORD *)(v12 + 24);
    *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
    *(_BYTE *)(v11 + 40) = *(_BYTE *)(v12 + 40);
    *(_QWORD *)(v11 + 48) = *(_QWORD *)(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v14 = *(_OWORD *)(v12 + 8);
    v15 = *(_OWORD *)(v12 + 40);
    *(_OWORD *)(v11 + 24) = *(_OWORD *)(v12 + 24);
    *(_OWORD *)(v11 + 40) = v15;
    *(_OWORD *)(v11 + 8) = v14;
  }
  return a1;
}

_QWORD *sub_247E75524(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 24))(v8, v9, *(_QWORD *)(a3 + 16));
  v10 = *(_QWORD *)(v6 + 64) + 7;
  v11 = (v10 + v8) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v10 + v9) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v11 = *(_QWORD *)v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = (_OWORD *)(v11 + 8);
  v14 = *(_QWORD *)(v12 + 16);
  if (!*(_QWORD *)(v11 + 16))
  {
    if (v14)
    {
      *(_QWORD *)(v11 + 8) = *(_QWORD *)(v12 + 8);
      *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(v11 + 24) = *(_QWORD *)(v12 + 24);
      *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
      *(_BYTE *)(v11 + 40) = *(_BYTE *)(v12 + 40);
      *(_QWORD *)(v11 + 48) = *(_QWORD *)(v12 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    v19 = *(_OWORD *)(v12 + 8);
    v20 = *(_OWORD *)(v12 + 40);
    *(_OWORD *)(v11 + 24) = *(_OWORD *)(v12 + 24);
    *(_OWORD *)(v11 + 40) = v20;
    *v13 = v19;
    return a1;
  }
  if (!v14)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v18 = type metadata accessor for WorkServiceData(0, AssociatedTypeWitness, AssociatedConformanceWitness, v17);
    (*(void (**)(_OWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v13, v18);
    goto LABEL_7;
  }
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(v12 + 8);
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v11 + 24) = *(_QWORD *)(v12 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v11 + 40) = *(_BYTE *)(v12 + 40);
  *(_QWORD *)(v11 + 48) = *(_QWORD *)(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_247E75780(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 8) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 8) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  v9 = (v8 + v6) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v8 + v7) & 0xFFFFFFFFFFFFFFF8;
  v12 = *(_OWORD *)(v10 + 16);
  v11 = *(_OWORD *)(v10 + 32);
  v13 = *(_OWORD *)v10;
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 16) = v12;
  *(_OWORD *)(v9 + 32) = v11;
  *(_OWORD *)v9 = v13;
  return a1;
}

_QWORD *sub_247E75810(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  *a1 = *a2;
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 40))(v8, v9, *(_QWORD *)(a3 + 16));
  v10 = *(_QWORD *)(v6 + 64) + 7;
  v11 = (v10 + v8) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v10 + v9) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v11 = *(_QWORD *)v12;
  swift_bridgeObjectRelease();
  v13 = (_OWORD *)(v11 + 8);
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_5;
  if (!*(_QWORD *)(v12 + 16))
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v17 = type metadata accessor for WorkServiceData(0, AssociatedTypeWitness, AssociatedConformanceWitness, v16);
    (*(void (**)(_OWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v13, v17);
LABEL_5:
    v18 = *(_OWORD *)(v12 + 8);
    v19 = *(_OWORD *)(v12 + 40);
    v13[1] = *(_OWORD *)(v12 + 24);
    v13[2] = v19;
    *v13 = v18;
    return a1;
  }
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(v12 + 8);
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v11 + 24) = *(_QWORD *)(v12 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
  swift_bridgeObjectRelease();
  *(_BYTE *)(v11 + 40) = *(_BYTE *)(v12 + 40);
  *(_QWORD *)(v11 + 48) = *(_QWORD *)(v12 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247E759E8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  if (v6 >= a2)
  {
    v13 = (a1 + v7 + 8) & ~v7;
    if (v5 < 0x7FFFFFFF)
    {
      v14 = *(_QWORD *)((v8 + v13) & 0xFFFFFFFFFFFFF8);
      if (v14 >= 0xFFFFFFFF)
        LODWORD(v14) = -1;
      return (v14 + 1);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t))(v4 + 48))(v13);
    }
  }
  else
  {
    if (((((v8 + ((v7 + 8) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 56) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_247E75A74 + 4 * byte_247E8D5B0[v11]))();
  }
}

void sub_247E75B04(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 8) & ~(_DWORD)v7)) & 0xFFFFFFF8) == 0xFFFFFFC8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X14 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 8) & ~(_DWORD)v7)) & 0xFFFFFFF8) != 0xFFFFFFC8)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7 + ((v7 + 8) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 56);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_247E75C0C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x247E75C94);
}

void sub_247E75C14(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x247E75C1CLL);
  JUMPOUT(0x247E75C94);
}

void sub_247E75C60()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x247E75C94);
}

void sub_247E75C68()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x247E75C94);
}

uint64_t sub_247E75C70@<X0>(int a1@<W1>, unsigned int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a1)
    JUMPOUT(0x247E75C94);
  if (a2 < 0x7FFFFFFF)
  {
    if ((a1 & 0x80000000) == 0)
      JUMPOUT(0x247E75C90);
    JUMPOUT(0x247E75C7CLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))((v6 + v5 + 8) & a3);
}

uint64_t type metadata accessor for WorkPreparationEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WorkPreparationEvent);
}

uint64_t method lookup function for WorkEventProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WorkEventProcessor.process(preparationEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t WorkEventProcessorRegistry.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4B00];
  return result;
}

id sub_247E75D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247E7608C(a2, a3);
}

uint64_t sub_247E75D18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  sub_247E20140(a1, (uint64_t)&v9);
  type metadata accessor for WorkEventProcessor(0, a2, a3, v7);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
    *a4 = 0;
  return result;
}

id sub_247E75D94(uint64_t a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_allocWithZone(v1);
  return sub_247E75E04(a1, v4, v5, v6);
}

uint64_t WorkEventProcessorRegistry.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WorkEventProcessorRegistry.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

id sub_247E75E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  objc_class *v6;
  objc_super v8;

  v5 = *MEMORY[0x24BEE4EA0] & *v4;
  *(_QWORD *)((char *)v4 + qword_2577073F8) = a1;
  v6 = (objc_class *)type metadata accessor for TabiWorkEventMultiProcessor(0, *(_QWORD *)(v5 + 104), *(_QWORD *)(v5 + 112), a4);
  v8.receiver = v4;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_247E75E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  type metadata accessor for WorkEventProcessor(255, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x68), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x70), a4);
  v5 = sub_247E82368();
  swift_bridgeObjectRetain();
  MEMORY[0x2495930AC](MEMORY[0x24BEE12C8], v5);
  sub_247E822E4();
  return swift_bridgeObjectRelease();
}

void sub_247E75F0C()
{
  sub_247E762FC();
}

uint64_t sub_247E75F28()
{
  return swift_bridgeObjectRelease();
}

id sub_247E75F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for TabiWorkEventMultiProcessor(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x68), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x70), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_247E75F84()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_247E75F94(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_247E75FF4(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
}

unint64_t sub_247E75FA0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t sub_247E75FE8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_247E75FF4(a1, a2, a3, a4, a5, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
}

uint64_t sub_247E75FF4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(_QWORD))
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = (_QWORD *)(a5[6] + 16 * a1);
  *v10 = a2;
  v10[1] = a3;
  v11 = a5[7];
  v12 = a6(0);
  result = sub_247E76390(a4, v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * a1, a6);
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

id sub_247E7608C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = (*(uint64_t (**)(void))(a2 + 64))();
  v7 = v6;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v2 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    sub_247DBB6D4(v5, v7);
    if ((v8 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v9 = swift_bridgeObjectRelease();
      MEMORY[0x24BDAC7A8](v9);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254458BC0);
      type metadata accessor for WorkEventProcessor(0, a1, a2, v10);
      sub_247E76344();
      v11 = sub_247E822D8();
      swift_bridgeObjectRelease();
      v12 = sub_247E82368();
      MEMORY[0x2495930AC](MEMORY[0x24BEE12E0], v12);
      if ((sub_247E82440() & 1) == 0)
      {
        v15 = objc_allocWithZone((Class)type metadata accessor for TabiWorkEventMultiProcessor(0, a1, a2, v13));
        return sub_247E75E04(v11, v16, v17, v18);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t method lookup function for WorkEventProcessorRegistry()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WorkEventProcessorRegistry.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of WorkEventProcessorRegistry.eventProcessor<A>(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t sub_247E76264()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for TabiWorkEventMultiProcessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TabiWorkEventMultiProcessor);
}

uint64_t sub_247E762B4(_QWORD **a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **a1) + 0x60))(*(_QWORD *)(v1 + 32));
}

void sub_247E762FC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_247E76328@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_247E75D18(a1, *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

unint64_t sub_247E76344()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254458BC8;
  if (!qword_254458BC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458BC0);
    result = MEMORY[0x2495930AC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254458BC8);
  }
  return result;
}

uint64_t sub_247E76390(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t dispatch thunk of WorkRequestContextType.request.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static WorkType.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of WorkType.includeUserFeatures.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of WorkType.requestContext(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of WorkType.product(with:resultFeatures:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of WorkType.isSupported.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t sub_247E76424()
{
  return 10000;
}

uint64_t ConfigurationType.graphUnloadIdleDuration.getter()
{
  return 10000;
}

uint64_t ConfigurationType.isIdentical(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 48);
  v6 = v5(a2, a3);
  v8 = v7;
  if (v6 == v5(a2, a3) && v8 == v9)
    v11 = 1;
  else
    v11 = sub_247E82854();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_247E764E8@<X0>(uint64_t a1@<X8>)
{
  return ConfigurationManagerType.bundledConfiguration.getter(a1);
}

uint64_t ConfigurationManagerType.bundledConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a1, 1, 1, AssociatedTypeWitness);
}

uint64_t dispatch thunk of ConfigurationType.graphUnloadIdleDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ConfigurationType.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ConfigurationType.packageIDs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ConfigurationType.mlComputeUnits.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of ConfigurationType.isIdentical(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of ConfigurationType.init(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of ConfigurationManagerType.configuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ConfigurationManagerType.bundledConfiguration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ConfigurationManagerType.fetchConfigurationIfNeeded(cachedOnly:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 40) + *(_QWORD *)(a4 + 40));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_247E76630;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_247E76630()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of ConfigurationManagerType.onChangeOfConfiguration(perform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_247E76680@<X0>(unint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t result;
  _QWORD *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *i;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;

  v4 = v3;
  v6 = a1;
  if (a1 >> 62)
    goto LABEL_33;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (i = a2; v7; i = a2)
  {
    v8 = 0;
    v43 = v6 & 0xC000000000000001;
    v36 = v6 + 32;
    v9 = (_QWORD *)MEMORY[0x24BEE4B00];
    v37 = v7;
    v38 = v4;
    v40 = v6;
    while (v43)
    {
      v10 = MEMORY[0x249592908](v8, v6);
      v11 = __OFADD__(v8++, 1);
      if (v11)
        goto LABEL_32;
LABEL_11:
      a2 = (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)v10 + 128))();
      v12 = a2[2];
      if (v12)
      {
        v41 = v8;
        swift_bridgeObjectRetain();
        v42 = a2;
        v13 = a2 + 5;
        while (1)
        {
          v16 = *(v13 - 1);
          v6 = *v13;
          v17 = v9[2];
          swift_bridgeObjectRetain();
          if (v17)
          {
            swift_bridgeObjectRetain();
            sub_247DBB6D4(v16, v6);
            v19 = v18;
            swift_bridgeObjectRelease();
            if ((v19 & 1) != 0)
            {
              sub_247E77BC8();
              swift_allocError();
              *v32 = v16;
              v32[1] = v6;
              swift_willThrow();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              swift_release();
              swift_bridgeObjectRelease();
              return swift_bridgeObjectRelease_n();
            }
          }
          v44 = v12;
          v20 = v10;
          swift_retain();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v45 = v9;
          a2 = v9;
          v23 = sub_247DBB6D4(v16, v6);
          v24 = v9[2];
          v25 = (v22 & 1) == 0;
          v26 = v24 + v25;
          if (__OFADD__(v24, v25))
          {
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          v4 = v22;
          if (v9[3] >= v26)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              v9 = v45;
              if ((v22 & 1) != 0)
                goto LABEL_13;
            }
            else
            {
              a2 = &v45;
              sub_247E2CF30();
              v9 = v45;
              if ((v4 & 1) != 0)
                goto LABEL_13;
            }
          }
          else
          {
            sub_247E2BE54(v26, isUniquelyReferenced_nonNull_native);
            a2 = v45;
            v27 = sub_247DBB6D4(v16, v6);
            if ((v4 & 1) != (v28 & 1))
            {
              result = sub_247E82884();
              __break(1u);
              return result;
            }
            v23 = v27;
            v9 = v45;
            if ((v4 & 1) != 0)
            {
LABEL_13:
              v14 = v9[7];
              v15 = 8 * v23;
              swift_release();
              v10 = v20;
              *(_QWORD *)(v14 + v15) = v20;
              goto LABEL_14;
            }
          }
          v9[(v23 >> 6) + 8] |= 1 << v23;
          v29 = (uint64_t *)(v9[6] + 16 * v23);
          *v29 = v16;
          v29[1] = v6;
          *(_QWORD *)(v9[7] + 8 * v23) = v20;
          v30 = v9[2];
          v11 = __OFADD__(v30, 1);
          v31 = v30 + 1;
          if (v11)
            goto LABEL_31;
          v10 = v20;
          v9[2] = v31;
          swift_bridgeObjectRetain();
LABEL_14:
          v13 += 2;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v12 = v44 - 1;
          if (v44 == 1)
          {
            swift_release();
            a2 = v42;
            swift_bridgeObjectRelease();
            v7 = v37;
            v4 = v38;
            v6 = v40;
            v8 = v41;
            goto LABEL_5;
          }
        }
      }
      swift_release();
LABEL_5:
      swift_bridgeObjectRelease();
      if (v8 == v7)
        goto LABEL_35;
    }
    v10 = *(_QWORD *)(v36 + 8 * v8);
    swift_retain();
    v11 = __OFADD__(v8++, 1);
    if (!v11)
      goto LABEL_11;
LABEL_32:
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain_n();
    v7 = sub_247E82734();
    swift_bridgeObjectRelease();
  }
  v9 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_35:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((sub_247E76AA0((uint64_t)v9) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_247E77BC8();
    swift_allocError();
    *v34 = 0;
    v34[1] = 0;
    swift_willThrow();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *a3 = v9;
    a3[1] = i;
  }
  return result;
}

uint64_t sub_247E76AA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = a1;
  v29 = MEMORY[0x24BEE4B08];
  v30 = MEMORY[0x24BEE4B08];
  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  v26 = v2;
  v27 = result;
  v25 = v6;
  while (v5)
  {
    v10 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    v11 = v10 | (v8 << 6);
LABEL_25:
    v15 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v11);
    v16 = v30;
    if ((v30 & 0xC000000000000001) != 0)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v17 = sub_247E82608();
      swift_bridgeObjectRelease();
      if ((v17 & 1) == 0)
        goto LABEL_6;
      result = swift_release();
    }
    else if (*(_QWORD *)(v30 + 16))
    {
      v28 = v8;
      sub_247E828E4();
      sub_247E81CE4();
      sub_247E1DDA8();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_247E821DC();
      v18 = sub_247E828FC();
      v19 = -1 << *(_BYTE *)(v16 + 32);
      v20 = v18 & ~v19;
      if (((*(_QWORD *)(v16 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
        goto LABEL_35;
      swift_retain();
      v21 = sub_247E81CCC();
      swift_release();
      if ((v21 & 1) == 0)
      {
        v22 = ~v19;
        while (1)
        {
          v20 = (v20 + 1) & v22;
          if (((*(_QWORD *)(v16 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
            break;
          swift_retain();
          v23 = sub_247E81CCC();
          swift_release();
          if ((v23 & 1) != 0)
            goto LABEL_34;
        }
LABEL_35:
        swift_bridgeObjectRelease();
        v2 = v26;
        v1 = v27;
        v6 = v25;
        v8 = v28;
        goto LABEL_6;
      }
LABEL_34:
      swift_release();
      result = swift_bridgeObjectRelease();
      v2 = v26;
      v1 = v27;
      v6 = v25;
      v8 = v28;
    }
    else
    {
      swift_retain();
LABEL_6:
      v9 = sub_247E76E2C(v15, &v30, &v29, v1);
      result = swift_release();
      if ((v9 & 1) != 0)
      {
        swift_release();
        v24 = 1;
        goto LABEL_38;
      }
    }
  }
  v12 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v12 >= v6)
      goto LABEL_36;
    v13 = *(_QWORD *)(v2 + 8 * v12);
    ++v8;
    if (!v13)
    {
      v8 = v12 + 1;
      if (v12 + 1 >= v6)
        goto LABEL_36;
      v13 = *(_QWORD *)(v2 + 8 * v8);
      if (!v13)
      {
        v8 = v12 + 2;
        if (v12 + 2 >= v6)
          goto LABEL_36;
        v13 = *(_QWORD *)(v2 + 8 * v8);
        if (!v13)
        {
          v8 = v12 + 3;
          if (v12 + 3 >= v6)
            goto LABEL_36;
          v13 = *(_QWORD *)(v2 + 8 * v8);
          if (!v13)
          {
            v14 = v12 + 4;
            if (v14 >= v6)
            {
LABEL_36:
              swift_release();
              v24 = 0;
LABEL_38:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return v24;
            }
            v13 = *(_QWORD *)(v2 + 8 * v14);
            if (!v13)
            {
              while (1)
              {
                v8 = v14 + 1;
                if (__OFADD__(v14, 1))
                  goto LABEL_40;
                if (v8 >= v6)
                  goto LABEL_36;
                v13 = *(_QWORD *)(v2 + 8 * v8);
                ++v14;
                if (v13)
                  goto LABEL_24;
              }
            }
            v8 = v14;
          }
        }
      }
    }
LABEL_24:
    v5 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v8 << 6);
    goto LABEL_25;
  }
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_247E76E2C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40[9];

  swift_retain();
  v38 = a2;
  sub_247E7F78C(v40, a1);
  swift_release();
  swift_retain();
  v39 = a3;
  sub_247E7F78C(v40, a1);
  v8 = swift_release();
  v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(v8);
  v10 = *(_QWORD *)(v9 + 16);
  if (!v10)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    sub_247E77268();
    swift_release();
    return 0;
  }
  v11 = 0;
  v12 = v9 + 32;
  v36 = v9 + 32;
  v37 = *(_QWORD *)(v9 + 16);
  while (1)
  {
    if (!*(_QWORD *)(a4 + 16))
      goto LABEL_4;
    v13 = (uint64_t *)(v12 + 16 * v11);
    v14 = *v13;
    v15 = v13[1];
    swift_bridgeObjectRetain();
    v16 = sub_247DBB6D4(v14, v15);
    if ((v17 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    swift_retain();
    swift_bridgeObjectRelease();
    v19 = *v38;
    if ((*v38 & 0xC000000000000001) == 0)
      break;
    swift_retain();
    v20 = sub_247E82608();
    swift_release();
    if ((v20 & 1) == 0)
      goto LABEL_17;
LABEL_18:
    v27 = *v39;
    if ((*v39 & 0xC000000000000001) != 0)
    {
      swift_retain();
      v28 = sub_247E82608();
      swift_release_n();
      v12 = v36;
      v10 = v37;
      if ((v28 & 1) != 0)
        goto LABEL_32;
    }
    else
    {
      if (*(_QWORD *)(v27 + 16))
      {
        sub_247E828E4();
        sub_247E81CE4();
        sub_247E1DDA8();
        sub_247E821DC();
        v29 = sub_247E828FC();
        v30 = -1 << *(_BYTE *)(v27 + 32);
        v31 = v29 & ~v30;
        if (((*(_QWORD *)(v27 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) != 0)
        {
          swift_retain();
          v32 = sub_247E81CCC();
          swift_release();
          if ((v32 & 1) != 0)
          {
LABEL_30:
            swift_bridgeObjectRelease();
            swift_release();
            return 1;
          }
          v33 = ~v30;
          while (1)
          {
            v31 = (v31 + 1) & v33;
            if (((*(_QWORD *)(v27 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
              break;
            swift_retain();
            v34 = sub_247E81CCC();
            swift_release();
            if ((v34 & 1) != 0)
              goto LABEL_30;
          }
        }
      }
      swift_release();
      v12 = v36;
      v10 = v37;
    }
LABEL_4:
    if (++v11 == v10)
      goto LABEL_29;
  }
  if (*(_QWORD *)(v19 + 16))
  {
    sub_247E828E4();
    sub_247E81CE4();
    sub_247E1DDA8();
    sub_247E821DC();
    v21 = sub_247E828FC();
    v22 = -1 << *(_BYTE *)(v19 + 32);
    v23 = v21 & ~v22;
    if (((*(_QWORD *)(v19 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
    {
      swift_retain();
      v24 = sub_247E81CCC();
      swift_release();
      if ((v24 & 1) != 0)
        goto LABEL_18;
      v25 = ~v22;
      while (1)
      {
        v23 = (v23 + 1) & v25;
        if (((*(_QWORD *)(v19 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          break;
        swift_retain();
        v26 = sub_247E81CCC();
        swift_release();
        if ((v26 & 1) != 0)
          goto LABEL_18;
      }
    }
  }
LABEL_17:
  if ((sub_247E76E2C(v18, v38, v39, a4) & 1) == 0)
    goto LABEL_18;
  swift_release();
LABEL_32:
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_247E77268()
{
  uint64_t *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v13;

  v1 = *v0;
  if ((*v0 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    v2 = sub_247E82608();
    swift_release();
    if ((v2 & 1) != 0)
    {
      v3 = sub_247E77480();
      swift_bridgeObjectRelease();
      return v3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_247E828E4();
  sub_247E81CE4();
  sub_247E1DDA8();
  swift_bridgeObjectRetain();
  sub_247E821DC();
  v4 = sub_247E828FC();
  v5 = -1 << *(_BYTE *)(v1 + 32);
  v6 = v4 & ~v5;
  if (((*(_QWORD *)(v1 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    goto LABEL_12;
  swift_retain();
  v7 = sub_247E81CCC();
  swift_release();
  if ((v7 & 1) == 0)
  {
    v8 = ~v5;
    do
    {
      v6 = (v6 + 1) & v8;
      if (((*(_QWORD *)(v1 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
        goto LABEL_12;
      swift_retain();
      v9 = sub_247E81CCC();
      swift_release();
    }
    while ((v9 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v0;
  v13 = *v0;
  *v0 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_247E808D8();
    v11 = v13;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v6);
  sub_247E77654(v6);
  *v0 = v13;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_247E77480()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  swift_bridgeObjectRelease();
  v1 = sub_247E825E4();
  v2 = swift_unknownObjectRetain();
  v3 = sub_247E7FA98(v2, v1);
  v12 = v3;
  sub_247E828E4();
  sub_247E81CE4();
  sub_247E1DDA8();
  swift_retain();
  sub_247E821DC();
  v4 = sub_247E828FC();
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = v4 & ~v5;
  if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    swift_retain();
    v7 = sub_247E81CCC();
    swift_release();
    if ((v7 & 1) != 0)
    {
LABEL_6:
      swift_release();
      v10 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v6);
      sub_247E77654(v6);
      if ((sub_247E81CCC() & 1) != 0)
      {
        *v0 = v12;
        return v10;
      }
      __break(1u);
    }
    else
    {
      v8 = ~v5;
      while (1)
      {
        v6 = (v6 + 1) & v8;
        if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        swift_retain();
        v9 = sub_247E81CCC();
        swift_release();
        if ((v9 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release();
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_247E77654(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_247E825C0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_247E828E4();
        sub_247E81CE4();
        sub_247E1DDA8();
        swift_retain();
        sub_247E821DC();
        v10 = sub_247E828FC();
        swift_release();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_QWORD *)(v12 + 8 * v2);
          v14 = (_QWORD *)(v12 + 8 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t _s4Tabi11GlobalGraphV6ErrorsO2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      if (*a1 != *a2 || v3 != v4)
        return sub_247E82854();
      return 1;
    }
    return 0;
  }
  if (v4)
    return 0;
  swift_bridgeObjectRelease_n();
  return 1;
}

uint64_t destroy for GlobalGraph()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s4Tabi11GlobalGraphVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GlobalGraph(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for GlobalGraph(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GlobalGraph(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GlobalGraph(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GlobalGraph()
{
  return &type metadata for GlobalGraph;
}

_QWORD *initializeBufferWithCopyOfBuffer for GlobalGraph.Errors(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GlobalGraph.Errors()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for GlobalGraph.Errors(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for GlobalGraph.Errors(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GlobalGraph.Errors(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GlobalGraph.Errors(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_247E77B7C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_247E77B98(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for GlobalGraph.Errors()
{
  return &type metadata for GlobalGraph.Errors;
}

unint64_t sub_247E77BC8()
{
  unint64_t result;

  result = qword_257707408;
  if (!qword_257707408)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for GlobalGraph.Errors, &type metadata for GlobalGraph.Errors);
    atomic_store(result, (unint64_t *)&qword_257707408);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TextNormalizerError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for TextNormalizerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247E77CA0 + 4 * byte_247E8D830[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247E77CC0 + 4 * byte_247E8D835[v4]))();
}

_BYTE *sub_247E77CA0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247E77CC0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247E77CC8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247E77CD0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247E77CD8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247E77CE0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_247E77CEC()
{
  return 0;
}

ValueMetadata *type metadata accessor for TextNormalizerError()
{
  return &type metadata for TextNormalizerError;
}

uint64_t initializeBufferWithCopyOfBuffer for TextNormalizer(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TextNormalizer()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for TextNormalizer(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for TextNormalizer(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TextNormalizer(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TextNormalizer(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TextNormalizer()
{
  return &type metadata for TextNormalizer;
}

unint64_t sub_247E77E58()
{
  unint64_t result;

  result = qword_257707410;
  if (!qword_257707410)
  {
    result = MEMORY[0x2495930AC](&unk_247E8D8A4, &type metadata for TextNormalizerError);
    atomic_store(result, (unint64_t *)&qword_257707410);
  }
  return result;
}

uint64_t sub_247E77E9C()
{
  return 1;
}

uint64_t sub_247E77EA4()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E77EE4()
{
  return sub_247E828F0();
}

uint64_t sub_247E77F08()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E77F58(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v28 = MEMORY[0x24BEE4AF8];
  sub_247DFC41C(0, v1, 0);
  v2 = v28;
  result = sub_247E81024(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v23 = v1;
  v24 = v5;
  v25 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    v26 = v7;
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
    v13 = *v12;
    v14 = v12[1];
    v27 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v6);
    v15 = *(_QWORD *)(v28 + 16);
    v16 = *(_QWORD *)(v28 + 24);
    result = swift_bridgeObjectRetain();
    if (v15 >= v16 >> 1)
      result = sub_247DFC41C(v16 > 1, v15 + 1, 1);
    *(_QWORD *)(v28 + 16) = v15 + 1;
    v17 = v28 + 24 * v15;
    *(_QWORD *)(v17 + 32) = v13;
    *(_QWORD *)(v17 + 40) = v14;
    *(_DWORD *)(v17 + 48) = v27;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v18 = *(_QWORD *)(v25 + 8 * v11);
    if ((v18 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v24;
    if (*(_DWORD *)(a1 + 36) != v24)
      goto LABEL_27;
    v19 = v18 & (-2 << (v6 & 0x3F));
    if (v19)
    {
      v9 = __clz(__rbit64(v19)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v23;
    }
    else
    {
      v20 = v11 + 1;
      v21 = (unint64_t)(v9 + 63) >> 6;
      v10 = v23;
      if (v11 + 1 < v21)
      {
        v22 = *(_QWORD *)(v25 + 8 * v20);
        if (v22)
        {
LABEL_20:
          v9 = __clz(__rbit64(v22)) + (v20 << 6);
        }
        else
        {
          while (v21 - 2 != v11)
          {
            v22 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v22)
            {
              v20 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v7 = v26 + 1;
    v6 = v9;
    if (v26 + 1 == v10)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_247E78174()
{
  return 1;
}

uint64_t sub_247E7817C()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E781BC()
{
  return sub_247E828F0();
}

uint64_t sub_247E781E0()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

void sub_247E7822C(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v42 = *(_DWORD *)(a1 + 48);
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v11 = sub_247DBB6D4(v8, v7);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_247E2CBD4();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v8;
    v21[1] = v7;
    *(_DWORD *)(v20[7] + 4 * v11) = v42;
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    v25 = v4 - 1;
    if (v4 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = (_DWORD *)(a1 + 72);
    while (1)
    {
      v28 = *((_QWORD *)v26 - 2);
      v27 = *((_QWORD *)v26 - 1);
      v29 = *v26;
      v30 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v31 = sub_247DBB6D4(v28, v27);
      v33 = v30[2];
      v34 = (v32 & 1) == 0;
      v23 = __OFADD__(v33, v34);
      v35 = v33 + v34;
      if (v23)
        break;
      v36 = v32;
      if (v30[3] < v35)
      {
        sub_247E2B840(v35, 1);
        v31 = sub_247DBB6D4(v28, v27);
        if ((v36 & 1) != (v37 & 1))
          goto LABEL_25;
      }
      if ((v36 & 1) != 0)
        goto LABEL_10;
      v38 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      *v39 = v28;
      v39[1] = v27;
      *(_DWORD *)(v38[7] + 4 * v31) = v29;
      v40 = v38[2];
      v23 = __OFADD__(v40, 1);
      v41 = v40 + 1;
      if (v23)
        goto LABEL_24;
      v26 += 6;
      v38[2] = v41;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_247E2B840(v14, a2 & 1);
  v16 = sub_247DBB6D4(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_247E82884();
  __break(1u);
LABEL_26:
  sub_247E82650();
  sub_247E8229C();
  sub_247E82710();
  sub_247E8229C();
  sub_247E82728();
  __break(1u);
}

uint64_t sub_247E785AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t result;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (!v4)
    return v5;
  v31 = MEMORY[0x24BEE4AF8];
  sub_247DFC0DC(0, v4, 0);
  v10 = 0;
  v5 = v31;
  v27 = 4 * a2;
  v28 = a1 + 32;
  v25 = v4;
  v26 = a2;
  while (1)
  {
    if (a2 < 0)
      goto LABEL_22;
    v11 = *(_QWORD *)(v28 + 8 * v10);
    swift_bridgeObjectRetain_n();
    v29 = v5;
    v30 = v10;
    if (a2)
    {
      v12 = sub_247E82350();
      *(_QWORD *)(v12 + 16) = a2;
      bzero((void *)(v12 + 32), v27);
      v13 = *(_QWORD *)(v11 + 16);
      if (v13)
        break;
      goto LABEL_17;
    }
    v12 = MEMORY[0x24BEE4AF8];
    v13 = *(_QWORD *)(v11 + 16);
    if (v13)
      break;
LABEL_17:
    swift_bridgeObjectRelease_n();
    v5 = v29;
    v23 = *(_QWORD *)(v29 + 16);
    v22 = *(_QWORD *)(v29 + 24);
    if (v23 >= v22 >> 1)
    {
      sub_247DFC0DC(v22 > 1, v23 + 1, 1);
      v5 = v29;
    }
    v10 = v30 + 1;
    *(_QWORD *)(v5 + 16) = v23 + 1;
    *(_QWORD *)(v5 + 8 * v23 + 32) = v12;
    if (v30 + 1 == v4)
      return v5;
  }
  v14 = 0;
  v15 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  while (v14 >= *(_QWORD *)(v12 + 16))
  {
LABEL_9:
    v15 += 2;
    if (v13 == ++v14)
    {
      swift_bridgeObjectRelease();
      v4 = v25;
      a2 = v26;
      goto LABEL_17;
    }
  }
  v16 = *(v15 - 1);
  v17 = *v15;
  v18 = *(_QWORD *)(a3 + 16);
  swift_bridgeObjectRetain();
  v19 = a4;
  if (v18)
  {
    v20 = sub_247DBB6D4(v16, v17);
    v19 = a4;
    if ((v21 & 1) != 0)
      v19 = *(_DWORD *)(*(_QWORD *)(a3 + 56) + 4 * v20);
  }
  if (v14 < *(_QWORD *)(v12 + 16))
  {
    *(_DWORD *)(v12 + 32 + 4 * v14) = v19;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  __break(1u);
LABEL_22:
  result = sub_247E8271C();
  __break(1u);
  return result;
}

uint64_t sub_247E787EC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;

  v3 = swift_bridgeObjectRetain();
  v4 = sub_247E77F58(v3);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v4 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445AE38);
    v5 = sub_247E82758();
  }
  else
  {
    v5 = MEMORY[0x24BEE4B00];
  }
  v12 = v5;
  v6 = swift_bridgeObjectRetain();
  sub_247E7822C(v6, 1, &v12);
  if (!v1)
  {
    swift_bridgeObjectRelease();
    v7 = v12;
    if (*(_QWORD *)(v12 + 16))
    {
      v9 = *a1;
      v8 = a1[1];
      swift_bridgeObjectRetain_n();
      sub_247DBB6D4(v9, v8);
      if ((v10 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v7;
      }
      swift_release();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_release();
    }
    sub_247E7895C();
    swift_allocError();
    swift_willThrow();
    return v7;
  }
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

unint64_t sub_247E7895C()
{
  unint64_t result;

  result = qword_257707418;
  if (!qword_257707418)
  {
    result = MEMORY[0x2495930AC](&unk_247E8D99C, &type metadata for TokenCodeError);
    atomic_store(result, (unint64_t *)&qword_257707418);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TokenCodeError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for TokenCodeError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247E78A30 + 4 * byte_247E8D90C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247E78A50 + 4 * byte_247E8D911[v4]))();
}

_BYTE *sub_247E78A30(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247E78A50(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247E78A58(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247E78A60(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247E78A68(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247E78A70(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_247E78A7C()
{
  return 0;
}

ValueMetadata *type metadata accessor for TokenCodeError()
{
  return &type metadata for TokenCodeError;
}

uint64_t initializeBufferWithCopyOfBuffer for TokenCodes(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TokenCodes()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TokenCodes(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TokenCodes(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy28_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TokenCodes(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenCodes(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 28))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenCodes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 28) = 1;
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
    *(_BYTE *)(result + 28) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenCodes()
{
  return &type metadata for TokenCodes;
}

unint64_t sub_247E78CA4()
{
  unint64_t result;

  result = qword_257707420;
  if (!qword_257707420)
  {
    result = MEMORY[0x2495930AC](&unk_247E8D974, &type metadata for TokenCodeError);
    atomic_store(result, (unint64_t *)&qword_257707420);
  }
  return result;
}

uint64_t sub_247E78CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
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
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t *v43;
  char *v44;
  int64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, unint64_t, uint64_t);
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  unint64_t v68;
  unint64_t v69;
  int64_t v70;
  uint64_t result;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  char *v76;
  char *v77;
  char *v78;
  _QWORD *v79;
  char *v80;
  uint64_t *v81;
  char *v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  int64_t v91;
  int64_t v92;
  _QWORD *v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254458880);
  v86 = *(_QWORD *)(v4 - 8);
  v87 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v78 = (char *)&v72 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD10);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v10);
  v77 = (char *)&v72 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445B040);
  v88 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v82 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v85 = (char *)&v72 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v76 = (char *)&v72 - v19;
  v84 = __swift_instantiateConcreteTypeFromMangledName(qword_2544589C0);
  v20 = MEMORY[0x24BDAC7A8](v84);
  v81 = (uint64_t *)((char *)&v72 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = MEMORY[0x24BDAC7A8](v20);
  v75 = (uint64_t *)((char *)&v72 - v23);
  MEMORY[0x24BDAC7A8](v22);
  v74 = (uint64_t)&v72 - v24;
  v25 = *(_QWORD *)(a1 + 16);
  v90 = *(_QWORD *)(a2 + 16);
  if (v90 >= v25)
    v26 = v25;
  else
    v26 = v90;
  v97 = MEMORY[0x24BEE4AF8];
  sub_247DFC3C4(0, v26, 0);
  v95 = v14;
  v83 = v25;
  v73 = a1;
  v89 = a2;
  if (v26)
  {
    v27 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = 0;
    v29 = (_QWORD *)(a1 + 64);
    v30 = v27;
    v91 = v26;
    v79 = v12;
    v80 = v7;
    while (v25 != v28)
    {
      if (v90 == v28)
        goto LABEL_34;
      v32 = *(v29 - 4);
      v31 = *(v29 - 3);
      v33 = *(v29 - 2);
      v92 = *(v29 - 1);
      v93 = v29;
      v34 = *v29;
      v35 = a2 + ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80));
      v36 = v88;
      v37 = *(_QWORD *)(v88 + 72);
      *(_QWORD *)&v94 = v28;
      v38 = v35 + v37 * v28;
      v39 = *(void (**)(char *, uint64_t, uint64_t))(v88 + 16);
      v39((char *)v12, v38, v30);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v12, 0, 1, v30);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v36 + 48))(v12, 1, v30) == 1)
        goto LABEL_37;
      v40 = v30;
      v41 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
      v42 = v82;
      v41(v82, (char *)v12, v40);
      v43 = v81;
      v44 = (char *)v81 + *(int *)(v84 + 48);
      *v81 = v32;
      v43[1] = v31;
      v45 = v92;
      v43[2] = v33;
      v43[3] = v45;
      v43[4] = v34;
      v41(v44, v42, v95);
      v30 = v95;
      v39(v85, (uint64_t)v44, v95);
      v96 = v33;
      sub_247DBFCE0(v32, v31);
      swift_bridgeObjectRetain();
      v46 = v80;
      sub_247E81CF0();
      sub_247E7CD5C((uint64_t)v43, qword_2544589C0);
      v47 = v97;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_247DFC3C4(0, *(_QWORD *)(v47 + 16) + 1, 1);
        v47 = v97;
      }
      v48 = v94;
      v50 = *(_QWORD *)(v47 + 16);
      v49 = *(_QWORD *)(v47 + 24);
      a2 = v89;
      v12 = v79;
      if (v50 >= v49 >> 1)
      {
        sub_247DFC3C4(v49 > 1, v50 + 1, 1);
        v47 = v97;
      }
      v28 = v48 + 1;
      *(_QWORD *)(v47 + 16) = v50 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v86 + 32))(v47+ ((*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80))+ *(_QWORD *)(v86 + 72) * v50, v46, v87);
      v29 = v93 + 5;
      v26 = v91;
      v25 = v83;
      if (v91 == v28)
        goto LABEL_16;
    }
    __break(1u);
LABEL_34:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_16:
    v51 = (uint64_t)v77;
    if (v25 <= v90)
    {
LABEL_32:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v97;
    }
    v52 = v90;
    if (v26 > (uint64_t)v90)
      v52 = v26;
    v92 = v52;
    v12 = (_QWORD *)(v73 + 40 * v26 + 64);
    while (v25 != v26)
    {
      if (v90 == v26)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 56))(v51, 1, 1, v95);
LABEL_31:
        sub_247E7CD5C(v51, &qword_25445AD10);
        goto LABEL_32;
      }
      if (v92 == v26)
        goto LABEL_36;
      v53 = *(v12 - 4);
      v94 = *(_OWORD *)(v12 - 3);
      v55 = *(v12 - 1);
      v54 = *v12;
      v93 = v12;
      v56 = v88;
      v57 = *(void (**)(uint64_t, unint64_t, uint64_t))(v88 + 16);
      v58 = v95;
      v57(v51, v89+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(_QWORD *)(v88 + 72) * v26, v95);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v56 + 56))(v51, 0, 1, v58);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v51, 1, v58) == 1)
        goto LABEL_31;
      v91 = v26;
      v59 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 32);
      v60 = v76;
      v59(v76, v51, v58);
      v61 = v84;
      v62 = (uint64_t)v75;
      v63 = (char *)v75 + *(int *)(v84 + 48);
      *v75 = v53;
      *(_OWORD *)(v62 + 8) = v94;
      *(_QWORD *)(v62 + 24) = v55;
      *(_QWORD *)(v62 + 32) = v54;
      v59(v63, (uint64_t)v60, v58);
      v64 = v74;
      sub_247DBD4A4(v62, v74, qword_2544589C0);
      v65 = *(_QWORD *)(v64 + 16);
      v57((uint64_t)v85, v64 + *(int *)(v61 + 48), v58);
      v96 = v65;
      sub_247DBFCE0(v53, v94);
      swift_bridgeObjectRetain();
      sub_247E81CF0();
      sub_247E7CD5C(v64, qword_2544589C0);
      v66 = v97;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_247DFC3C4(0, *(_QWORD *)(v66 + 16) + 1, 1);
        v66 = v97;
      }
      v25 = v83;
      v67 = v93;
      v69 = *(_QWORD *)(v66 + 16);
      v68 = *(_QWORD *)(v66 + 24);
      v70 = v91;
      if (v69 >= v68 >> 1)
      {
        sub_247DFC3C4(v68 > 1, v69 + 1, 1);
        v66 = v97;
      }
      v26 = v70 + 1;
      *(_QWORD *)(v66 + 16) = v69 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v86 + 32))(v66+ ((*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80))+ *(_QWORD *)(v86 + 72) * v69, v78, v87);
      v12 = v67 + 5;
      v51 = (uint64_t)v77;
      if (v25 == v26)
        goto LABEL_32;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  result = sub_247E7CD5C((uint64_t)v12, &qword_25445AD10);
  __break(1u);
  return result;
}

uint64_t sub_247E79430(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_247DFC150(0, v1, 0);
    v2 = v11;
    v4 = (unint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      sub_247DBFCE0(v5, *v4);
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      if (v8 >= v7 >> 1)
        sub_247DFC150(v7 > 1, v8 + 1, 1);
      v4 += 5;
      *(_QWORD *)(v11 + 16) = v8 + 1;
      v9 = v11 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v5;
      *(_QWORD *)(v9 + 40) = v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t UserEmbeddingManager.LogisticRegressionClassifierConfiguration.l2Penalty.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t UserEmbeddingManager.LogisticRegressionClassifierConfiguration.l1Penalty.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t UserEmbeddingManager.LogisticRegressionClassifierConfiguration.maximumIterations.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t UserEmbeddingManager.LogisticRegressionClassifierConfiguration.stepSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t UserEmbeddingManager.LogisticRegressionClassifierConfiguration.convergenceThreshold.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

void __swiftcall UserEmbeddingManager.LogisticRegressionClassifierConfiguration.init(l2Penalty:l1Penalty:maximumIterations:stepSize:convergenceThreshold:)(Tabi::UserEmbeddingManager::LogisticRegressionClassifierConfiguration *__return_ptr retstr, Swift::Double_optional l2Penalty, Swift::Double_optional l1Penalty, Swift::Int_optional maximumIterations, Swift::Double_optional stepSize, Swift::Double_optional convergenceThreshold)
{
  Swift::Double v6;
  char v7;
  Swift::Double v8;
  char v9;

  retstr->l2Penalty.value = *(Swift::Double *)&l2Penalty.is_nil;
  retstr->l2Penalty.is_nil = l1Penalty.is_nil;
  *(_QWORD *)&retstr->l1Penalty.value = maximumIterations.value;
  retstr->l1Penalty.is_nil = maximumIterations.is_nil;
  retstr->maximumIterations.value = *(_QWORD *)&stepSize.is_nil;
  retstr->maximumIterations.is_nil = convergenceThreshold.is_nil;
  retstr->stepSize.value = v6;
  retstr->stepSize.is_nil = v7 & 1;
  retstr->convergenceThreshold.value = v8;
  retstr->convergenceThreshold.is_nil = v9 & 1;
}

uint64_t sub_247E7959C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_247E795D8 + 4 * byte_247E8D9E0[a1]))(0x746C616E6550326CLL, 0xE900000000000079);
}

uint64_t sub_247E795D8()
{
  return 0x746C616E6550316CLL;
}

unint64_t sub_247E795EC()
{
  return 0xD000000000000011;
}

uint64_t sub_247E79608()
{
  return 0x657A695370657473;
}

unint64_t sub_247E79620()
{
  return 0xD000000000000014;
}

BOOL sub_247E79640(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247E79654()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E79698()
{
  return sub_247E828F0();
}

uint64_t sub_247E796C0()
{
  sub_247E828E4();
  sub_247E828F0();
  return sub_247E828FC();
}

uint64_t sub_247E79700()
{
  unsigned __int8 *v0;

  return sub_247E7959C(*v0);
}

uint64_t sub_247E79708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247E7CAD0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247E7972C()
{
  return 0;
}

void sub_247E79738(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_247E79744()
{
  sub_247E79990();
  return sub_247E82920();
}

uint64_t sub_247E7976C()
{
  sub_247E79990();
  return sub_247E8292C();
}

uint64_t UserEmbeddingManager.LogisticRegressionClassifierConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _DWORD v9[4];
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257707428);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v1 + 16);
  v15 = *(unsigned __int8 *)(v1 + 24);
  v14 = *(_QWORD *)(v1 + 32);
  v13 = *(unsigned __int8 *)(v1 + 40);
  v12 = *(_QWORD *)(v1 + 48);
  v11 = *(unsigned __int8 *)(v1 + 56);
  v10 = *(_QWORD *)(v1 + 64);
  v9[3] = *(unsigned __int8 *)(v1 + 72);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247E79990();
  sub_247E82914();
  v22 = 0;
  v7 = v17;
  sub_247E827DC();
  if (!v7)
  {
    v21 = 1;
    sub_247E827DC();
    v20 = 2;
    sub_247E827E8();
    v19 = 3;
    sub_247E827DC();
    v18 = 4;
    sub_247E827DC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_247E79990()
{
  unint64_t result;

  result = qword_257707430;
  if (!qword_257707430)
  {
    result = MEMORY[0x2495930AC](&unk_247E8DBF0, &type metadata for UserEmbeddingManager.LogisticRegressionClassifierConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257707430);
  }
  return result;
}

uint64_t UserEmbeddingManager.LogisticRegressionClassifierConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  char *v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257707438);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247E79990();
  sub_247E82908();
  if (!v2)
  {
    v33 = 0;
    v9 = sub_247E82788();
    v11 = v10;
    v32 = 1;
    v12 = sub_247E82788();
    v27 = v13;
    v28 = v12;
    v31 = 2;
    v14 = sub_247E82794();
    v25 = v15;
    v26 = v14;
    v30 = 3;
    v16 = sub_247E82788();
    HIDWORD(v23) = v17;
    v24 = v16;
    v29 = 4;
    v19 = sub_247E82788();
    v20 = v8;
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v20, v5);
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v11 & 1;
    *(_QWORD *)(a2 + 16) = v28;
    *(_BYTE *)(a2 + 24) = v27 & 1;
    *(_QWORD *)(a2 + 32) = v26;
    *(_BYTE *)(a2 + 40) = v25 & 1;
    *(_QWORD *)(a2 + 48) = v24;
    *(_BYTE *)(a2 + 56) = BYTE4(v23) & 1;
    *(_QWORD *)(a2 + 64) = v19;
    *(_BYTE *)(a2 + 72) = v22 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_247E79BFC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return UserEmbeddingManager.LogisticRegressionClassifierConfiguration.init(from:)(a1, a2);
}

uint64_t sub_247E79C10(_QWORD *a1)
{
  return UserEmbeddingManager.LogisticRegressionClassifierConfiguration.encode(to:)(a1);
}

uint64_t sub_247E79C24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_254458FA8);
  MEMORY[0x24BDAC7A8](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AF08);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v14[-v8];
  v10 = v1 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager____lazy_storage___classifier;
  swift_beginAccess();
  sub_247E7CD18(v10, (uint64_t)v9, &qword_25445AF08);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A658);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v12 + 32))(a1, v9, v11);
  sub_247E7CD5C((uint64_t)v9, &qword_25445AF08);
  sub_247DBAAC0((uint64_t)&unk_2519610F8);
  sub_247DBCF20();
  sub_247E81D50();
  sub_247E81D74();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v7, a1, v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess();
  sub_247E7BA1C((uint64_t)v7, v10);
  return swift_endAccess();
}

uint64_t UserEmbeddingManager.__allocating_init(directory:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_247E81C54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = swift_allocObject();
  UserEmbeddingManager.init(directory:writeHumanReadableParametersToDisk:)((uint64_t)v5, 0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

uint64_t UserEmbeddingManager.__allocating_init(directory:writeHumanReadableParametersToDisk:)(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  UserEmbeddingManager.init(directory:writeHumanReadableParametersToDisk:)(a1, a2);
  return v4;
}

Swift::Void __swiftcall UserEmbeddingManager.clearCachedUserEmbedding()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[2];
  id v21;
  unint64_t v22;
  uint64_t v23;

  v1 = v0;
  v23 = *MEMORY[0x24BDAC8D0];
  v2 = sub_247E81C54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_unfairLock;
  os_unfair_lock_lock_with_options();
  if (qword_25445B028 != -1)
    swift_once();
  v7 = (id)qword_25445B030;
  sub_247E824A0();
  sub_247E81FE4();

  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_247E81C00();
  v9 = (void *)sub_247E81BE8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v21 = 0;
  v10 = objc_msgSend(v8, sel_removeItemAtURL_error_, v9, &v21);

  v11 = v21;
  if (!v10)
  {
    v12 = v11;
    v13 = (void *)sub_247E81B7C();

    swift_willThrow();
    v14 = (id)qword_25445B030;
    sub_247E82488();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_247E83230;
    v21 = 0;
    v22 = 0xE000000000000000;
    v20[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
    sub_247E82710();
    v16 = v21;
    v17 = v22;
    *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v15 + 64) = sub_247DBCF64();
    *(_QWORD *)(v15 + 32) = v16;
    *(_QWORD *)(v15 + 40) = v17;
    sub_247E81FE4();

    swift_bridgeObjectRelease();
  }
  v18 = v1 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_loadedUserEmbedding;
  *(_QWORD *)v18 = 0;
  *(_DWORD *)(v18 + 8) = 0;
  swift_bridgeObjectRelease();
  v19 = (id)qword_25445B030;
  sub_247E824A0();
  sub_247E81FE4();

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v6));
}

uint64_t UserEmbeddingManager.generateEmbedding(history:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;

  v6 = *(_BYTE *)(a3 + 8);
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_BYTE *)(a3 + 24);
  v9 = *(_QWORD *)(a3 + 32);
  v10 = *(_BYTE *)(a3 + 40);
  v11 = *(_QWORD *)(a3 + 48);
  v12 = *(_BYTE *)(a3 + 56);
  v13 = *(_QWORD *)(a3 + 64);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)a3;
  v14 = *(_BYTE *)(a3 + 72);
  *(_BYTE *)(v3 + 24) = v6;
  *(_QWORD *)(v3 + 32) = v7;
  *(_BYTE *)(v3 + 40) = v8;
  *(_QWORD *)(v3 + 48) = v9;
  *(_BYTE *)(v3 + 56) = v10;
  *(_QWORD *)(v3 + 64) = v11;
  *(_BYTE *)(v3 + 72) = v12;
  *(_QWORD *)(v3 + 80) = v13;
  *(_BYTE *)(v3 + 88) = v14;
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 96) = v15;
  *v15 = v3;
  v15[1] = sub_247E7A338;
  return UserEmbeddingManager.generateEmbedding(history:configuration:writeHumanReadableHistoryToDisk:)(a1, a2, (uint64_t *)(v3 + 16), 0);
}

uint64_t sub_247E7A338()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 104) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_247E7A3A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t UserEmbeddingManager.generateEmbedding(history:configuration:writeHumanReadableHistoryToDisk:)(uint64_t a1, uint64_t a2, uint64_t *a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v5 + 120) = a2;
  *(_QWORD *)(v5 + 128) = v4;
  *(_BYTE *)(v5 + 68) = a4;
  *(_QWORD *)(v5 + 112) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458DD0);
  *(_QWORD *)(v5 + 136) = swift_task_alloc();
  v7 = sub_247E81C54();
  *(_QWORD *)(v5 + 144) = v7;
  *(_QWORD *)(v5 + 152) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 160) = swift_task_alloc();
  *(_QWORD *)(v5 + 168) = swift_task_alloc();
  *(_QWORD *)(v5 + 176) = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_254458DD8);
  *(_QWORD *)(v5 + 184) = v8;
  *(_QWORD *)(v5 + 192) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v5 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445AF08);
  *(_QWORD *)(v5 + 208) = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A658);
  *(_QWORD *)(v5 + 216) = v9;
  *(_QWORD *)(v5 + 224) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v5 + 232) = swift_task_alloc();
  *(_QWORD *)(v5 + 240) = swift_task_alloc();
  *(_QWORD *)(v5 + 248) = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254458FA8);
  *(_QWORD *)(v5 + 256) = v10;
  *(_QWORD *)(v5 + 264) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v5 + 272) = swift_task_alloc();
  *(_QWORD *)(v5 + 280) = swift_task_alloc();
  v11 = sub_247E82128();
  *(_QWORD *)(v5 + 288) = v11;
  *(_QWORD *)(v5 + 296) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v5 + 304) = swift_task_alloc();
  *(_QWORD *)(v5 + 312) = swift_task_alloc();
  *(_QWORD *)(v5 + 320) = swift_task_alloc();
  v12 = *a3;
  *(_BYTE *)(v5 + 69) = *((_BYTE *)a3 + 8);
  v13 = a3[2];
  *(_QWORD *)(v5 + 328) = v12;
  *(_QWORD *)(v5 + 336) = v13;
  *(_BYTE *)(v5 + 70) = *((_BYTE *)a3 + 24);
  *(_QWORD *)(v5 + 344) = a3[4];
  *(_BYTE *)(v5 + 71) = *((_BYTE *)a3 + 40);
  v14 = a3[6];
  *(_BYTE *)(v5 + 424) = *((_BYTE *)a3 + 56);
  v15 = a3[8];
  *(_QWORD *)(v5 + 352) = v14;
  *(_QWORD *)(v5 + 360) = v15;
  *(_BYTE *)(v5 + 425) = *((_BYTE *)a3 + 72);
  return swift_task_switch();
}

unint64_t sub_247E7A5BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;

  v1 = v0;
  if (qword_25445B028 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 120);
  v3 = (void *)qword_25445B030;
  *(_QWORD *)(v1 + 368) = __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_247E83230;
  v5 = *(_QWORD *)(v2 + 16);
  v6 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 32) = v5;
  v7 = v3;
  sub_247E824A0();
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  sub_247E8211C();
  v8 = sub_247E79430(v2);
  v9 = sub_247DFB54C(v8);
  swift_bridgeObjectRelease();
  v10 = swift_bridgeObjectRetain();
  v11 = sub_247E78CE8(v10, v9);
  *(_QWORD *)(v1 + 376) = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247E8211C();
  v12 = (void *)qword_25445B030;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_247E83500;
  v14 = *(_QWORD *)(v11 + 16);
  *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v13 + 64) = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v13 + 32) = v14;
  v15 = v12;
  v16 = sub_247E82110();
  result = sub_247E82110();
  v18 = v16 - result;
  if (v16 < result)
  {
    __break(1u);
  }
  else
  {
    v19 = *(_BYTE *)(v1 + 69);
    v20 = *(_QWORD *)(v1 + 320);
    v22 = *(_QWORD *)(v1 + 296);
    v21 = *(_QWORD *)(v1 + 304);
    v23 = *(_QWORD *)(v1 + 288);
    v24 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v13 + 96) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v13 + 104) = v24;
    *(double *)(v13 + 72) = (double)v18 / 1000000.0;
    sub_247E824A0();
    sub_247E81FE4();
    swift_bridgeObjectRelease();

    sub_247E8211C();
    v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    *(_QWORD *)(v1 + 384) = v25;
    v25(v20, v23);
    v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
    *(_QWORD *)(v1 + 392) = v26;
    v26(v20, v21, v23);
    sub_247DBCF20();
    sub_247E81D50();
    if ((v19 & 1) == 0)
      sub_247E81D44();
    if ((*(_BYTE *)(v1 + 70) & 1) == 0)
      sub_247E81D38();
    if ((*(_BYTE *)(v1 + 71) & 1) == 0)
      sub_247E81D14();
    if ((*(_BYTE *)(v1 + 424) & 1) == 0)
      sub_247E81D2C();
    v35 = v11;
    if ((*(_BYTE *)(v1 + 425) & 1) == 0)
      sub_247E81D20();
    v27 = *(_QWORD *)(v1 + 240);
    v28 = *(_QWORD *)(v1 + 248);
    v30 = *(_QWORD *)(v1 + 216);
    v29 = *(_QWORD *)(v1 + 224);
    v31 = *(_QWORD *)(v1 + 208);
    v32 = *(_QWORD *)(v1 + 128);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v1 + 264) + 32))(*(_QWORD *)(v1 + 280), *(_QWORD *)(v1 + 272), *(_QWORD *)(v1 + 256));
    sub_247E79C24(v28);
    sub_247E81D5C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v31, v28, v30);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v31, 0, 1, v30);
    v33 = v32 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager____lazy_storage___classifier;
    swift_beginAccess();
    sub_247E7BA1C(v31, v33);
    swift_endAccess();
    sub_247E79C24(v27);
    *(_QWORD *)(v1 + 88) = v35;
    v34 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 400) = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254458B90);
    sub_247E7BA64(&qword_254458B98, &qword_254458B90, MEMORY[0x24BEE12C8]);
    *v34 = v1;
    v34[1] = sub_247E7AC2C;
    return sub_247E81D68();
  }
  return result;
}

uint64_t sub_247E7AC2C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 408) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[28] + 8))(v2[30], v2[27]);
  }
  else
  {
    v3 = v2[30];
    v4 = v2[27];
    v5 = *(void (**)(uint64_t, uint64_t))(v2[28] + 8);
    v2[52] = v5;
    v5(v3, v4);
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

unint64_t sub_247E7ACC0()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t result;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD, _QWORD);
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(void);
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  int v92;

  v1 = v0;
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 392);
  v3 = *(void (**)(uint64_t, uint64_t))(v1 + 384);
  v4 = *(_QWORD *)(v1 + 312);
  v5 = *(_QWORD *)(v1 + 304);
  v6 = *(_QWORD *)(v1 + 288);
  sub_247E8211C();
  v3(v4, v6);
  v2(v4, v5, v6);
  v7 = (void *)qword_25445B030;
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_247E83500;
  v9 = v7;
  v10 = sub_247E82110();
  result = sub_247E82110();
  if (v10 >= result)
  {
    v12 = *(unsigned __int8 *)(v1 + 68);
    v13 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v8 + 64) = v13;
    *(double *)(v8 + 32) = (double)(v10 - result) / 1000000.0;
    v14 = sub_247E81D80();
    *(_QWORD *)(v8 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_25445B048);
    *(_QWORD *)(v8 + 104) = sub_247E7BA64(&qword_254458BB8, &qword_25445B048, MEMORY[0x24BDCFBF8]);
    *(_QWORD *)(v8 + 72) = v14;
    sub_247E824A0();
    sub_247E81FE4();
    swift_bridgeObjectRelease();

    v15 = *(_QWORD *)(v1 + 408);
    v16 = MEMORY[0x24BEE0D00];
    if (v12 == 1)
    {
      v17 = *(_QWORD *)(v1 + 168);
      v19 = *(_QWORD *)(v1 + 144);
      v18 = *(_QWORD *)(v1 + 152);
      v86 = *(_QWORD *)(v1 + 120);
      sub_247E81C18();
      sub_247E81BF4();
      v89 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
      v89(v17, v19);
      v20 = (void *)qword_25445B030;
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_247E83230;
      sub_247E7BAA4();
      v22 = v20;
      v23 = sub_247E82824();
      v25 = v24;
      *(_QWORD *)(v21 + 56) = v16;
      *(_QWORD *)(v21 + 64) = sub_247DBCF64();
      *(_QWORD *)(v21 + 32) = v23;
      *(_QWORD *)(v21 + 40) = v25;
      sub_247E824A0();
      sub_247E81FE4();
      swift_bridgeObjectRelease();

      sub_247E81AF8();
      swift_allocObject();
      sub_247E81AEC();
      *(_QWORD *)(v1 + 104) = v86;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254458BA0);
      sub_247E7BD40();
      v26 = sub_247E81AE0();
      if (v15)
      {
        v84 = v15;
        v28 = *(void (**)(uint64_t, uint64_t))(v1 + 384);
        v29 = *(_QWORD *)(v1 + 312);
        v88 = *(_QWORD *)(v1 + 320);
        v30 = *(_QWORD *)(v1 + 288);
        v31 = *(_QWORD *)(v1 + 192);
        v32 = *(_QWORD *)(v1 + 200);
        v34 = *(_QWORD *)(v1 + 176);
        v33 = *(_QWORD *)(v1 + 184);
        v35 = *(_QWORD *)(v1 + 144);
        swift_release();
        v89(v34, v35);
        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
        v28(v29, v30);
        v28(v88, v30);
        goto LABEL_8;
      }
      v59 = v26;
      v60 = v27;
      swift_release();
      sub_247E81C9C();
      v89(*(_QWORD *)(v1 + 176), *(_QWORD *)(v1 + 144));
      sub_247DBCA8C(v59, v60);
    }
    v36 = *(_QWORD *)(v1 + 232);
    v37 = *(_QWORD *)(v1 + 128);
    v38 = OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_unfairLock;
    os_unfair_lock_lock_with_options();
    sub_247E79C24(v36);
    sub_247E7BA64(&qword_25445A650, &qword_25445A658, MEMORY[0x24BDC5F20]);
    sub_247E81D08();
    v39 = *(void (**)(_QWORD, _QWORD))(v1 + 416);
    if (!v15)
    {
      v90 = v38;
      v39(*(_QWORD *)(v1 + 232), *(_QWORD *)(v1 + 216));
      v47 = (void *)qword_25445B030;
      v48 = swift_allocObject();
      *(_OWORD *)(v48 + 16) = xmmword_247E83230;
      sub_247E7BAA4();
      v49 = v47;
      v50 = sub_247E82824();
      v52 = v51;
      *(_QWORD *)(v48 + 56) = MEMORY[0x24BEE0D00];
      v53 = sub_247DBCF64();
      *(_QWORD *)(v48 + 64) = v53;
      *(_QWORD *)(v48 + 32) = v50;
      *(_QWORD *)(v48 + 40) = v52;
      sub_247E824A0();
      sub_247E81FE4();
      swift_bridgeObjectRelease();

      sub_247E7BAEC((uint64_t)&v91);
      v61 = *(_QWORD *)(v1 + 144);
      v62 = *(_QWORD *)(v1 + 152);
      v63 = *(_QWORD *)(v1 + 136);
      v87 = v91;
      v64 = v92;
      sub_247E7CD18(*(_QWORD *)(v1 + 128) + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_humanReadableParametersPath, v63, &qword_254458DD0);
      v65 = v37;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v63, 1, v61) == 1)
      {
        sub_247E7CD5C(*(_QWORD *)(v1 + 136), &qword_254458DD0);
      }
      else
      {
        v85 = v37;
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v1 + 152) + 32))(*(_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144));
        v76 = (void *)qword_25445B030;
        v77 = swift_allocObject();
        *(_OWORD *)(v77 + 16) = xmmword_247E83230;
        v78 = v76;
        v79 = sub_247E82824();
        *(_QWORD *)(v77 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v77 + 64) = v53;
        *(_QWORD *)(v77 + 32) = v79;
        *(_QWORD *)(v77 + 40) = v80;
        sub_247E824A0();
        sub_247E81FE4();
        swift_bridgeObjectRelease();

        sub_247E81AF8();
        swift_allocObject();
        sub_247E81AEC();
        *(_QWORD *)(v1 + 56) = v87;
        *(_DWORD *)(v1 + 64) = v64;
        sub_247E1BBA8();
        v81 = sub_247E81AE0();
        v83 = v82;
        swift_release();
        sub_247E81C9C();
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 152) + 8))(*(_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 144));
        sub_247DBCA8C(v81, v83);
        v65 = v85;
      }
      v66 = *(_QWORD *)(v1 + 128) + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_loadedUserEmbedding;
      v67 = v90;
      if (!*(_QWORD *)v66)
      {
        *(_QWORD *)v66 = v87;
        *(_DWORD *)(v66 + 8) = v64;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v67 = v90;
      }
      v68 = *(void (**)(uint64_t, uint64_t))(v1 + 384);
      v69 = *(_QWORD *)(v1 + 312);
      v70 = *(_QWORD *)(v1 + 320);
      v71 = *(_QWORD *)(v1 + 288);
      v72 = *(_QWORD *)(v1 + 200);
      v74 = *(_QWORD *)(v1 + 184);
      v73 = *(_QWORD *)(v1 + 192);
      v75 = *(_QWORD *)(v1 + 112);
      *(_QWORD *)v75 = v87;
      *(_DWORD *)(v75 + 8) = v64;
      os_unfair_lock_unlock(*(os_unfair_lock_t *)(v65 + v67));
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v72, v74);
      v68(v69, v71);
      v68(v70, v71);
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
      v58 = *(uint64_t (**)(void))(v1 + 8);
      return v58();
    }
    v84 = v15;
    v40 = *(void (**)(uint64_t, uint64_t))(v1 + 384);
    v42 = *(_QWORD *)(v1 + 312);
    v41 = *(_QWORD *)(v1 + 320);
    v43 = *(_QWORD *)(v1 + 288);
    v45 = *(_QWORD *)(v1 + 192);
    v44 = *(_QWORD *)(v1 + 200);
    v46 = *(_QWORD *)(v1 + 184);
    v39(*(_QWORD *)(v1 + 232), *(_QWORD *)(v1 + 216));
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v37 + v38));
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    v40(v42, v43);
    v40(v41, v43);
LABEL_8:
    v54 = (id)qword_25445B030;
    sub_247E82488();
    v55 = swift_allocObject();
    *(_QWORD *)(v1 + 40) = 0;
    *(_OWORD *)(v55 + 16) = xmmword_247E83230;
    *(_QWORD *)(v1 + 48) = 0xE000000000000000;
    *(_QWORD *)(v1 + 96) = v84;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
    sub_247E82710();
    v56 = *(_QWORD *)(v1 + 40);
    v57 = *(_QWORD *)(v1 + 48);
    *(_QWORD *)(v55 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v55 + 64) = sub_247DBCF64();
    *(_QWORD *)(v55 + 32) = v56;
    *(_QWORD *)(v55 + 40) = v57;
    sub_247E81FE4();
    swift_bridgeObjectRelease();

    swift_willThrow();
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
    v58 = *(uint64_t (**)(void))(v1 + 8);
    return v58();
  }
  __break(1u);
  return result;
}

uint64_t sub_247E7B810()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
  v2 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 288);
  v1(*(_QWORD *)(v0 + 312), v3);
  v1(v2, v3);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v0 + 408);
  v5 = (id)qword_25445B030;
  sub_247E82488();
  v6 = swift_allocObject();
  *(_QWORD *)(v0 + 40) = 0;
  *(_OWORD *)(v6 + 16) = xmmword_247E83230;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  *(_QWORD *)(v0 + 96) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254458F98);
  sub_247E82710();
  v7 = *(_QWORD *)(v0 + 40);
  v8 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 64) = sub_247DBCF64();
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  sub_247E81FE4();
  swift_bridgeObjectRelease();

  swift_willThrow();
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

uint64_t sub_247E7BA1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AF08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_247E7BA64(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495930AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247E7BAA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25445A628;
  if (!qword_25445A628)
  {
    v1 = sub_247E81C54();
    result = MEMORY[0x2495930AC](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_25445A628);
  }
  return result;
}

uint64_t sub_247E7BAEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v22 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A658);
  v2 = *(_QWORD *)(v1 - 8);
  v23 = v1;
  v24 = v2;
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_254458DD8);
  v20 = *(_QWORD *)(v5 - 8);
  v21 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25445B028 != -1)
    swift_once();
  v8 = (void *)qword_25445B030;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_247E83230;
  sub_247E81C54();
  sub_247E7BAA4();
  v10 = v8;
  v11 = sub_247E82824();
  v13 = v12;
  *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v9 + 64) = sub_247DBCF64();
  *(_QWORD *)(v9 + 32) = v11;
  *(_QWORD *)(v9 + 40) = v13;
  sub_247E824A0();
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  sub_247E79C24((uint64_t)v4);
  sub_247E7BA64(&qword_25445A650, &qword_25445A658, MEMORY[0x24BDC5F20]);
  v14 = v23;
  v15 = v25;
  sub_247E81CFC();
  result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v4, v14);
  if (!v15)
  {
    v17 = v21;
    v18 = sub_247E81D80();
    sub_247E7C018(v18, v22);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v17);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_247E7BD40()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254458BA8;
  if (!qword_254458BA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254458BA0);
    v2 = sub_247E7BDA4();
    result = MEMORY[0x2495930AC](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254458BA8);
  }
  return result;
}

unint64_t sub_247E7BDA4()
{
  unint64_t result;

  result = qword_2544589B8;
  if (!qword_2544589B8)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for LabeledEmbeddingData, &type metadata for LabeledEmbeddingData);
    atomic_store(result, (unint64_t *)&qword_2544589B8);
  }
  return result;
}

Tabi::UserEmbedding_optional __swiftcall UserEmbeddingManager.userEmbedding()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  os_unfair_lock_s *v7;
  void *v8;
  float v9;
  id v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  Tabi::UserEmbedding_optional result;

  v2 = v0;
  v3 = OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_unfairLock;
  os_unfair_lock_lock_with_options();
  v4 = v1 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_loadedUserEmbedding;
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_loadedUserEmbedding);
  if (v5)
  {
    v6 = *(_DWORD *)(v4 + 8);
    *(_QWORD *)v2 = v5;
    *(_DWORD *)(v2 + 8) = v6;
    v7 = *(os_unfair_lock_s **)(v1 + v3);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v7);
  }
  else
  {
    if (qword_25445B028 != -1)
      swift_once();
    v10 = (id)qword_25445B030;
    sub_247E824A0();
    sub_247E81FE4();

    sub_247E7BAEC((uint64_t)&v13);
    v11 = v13;
    v12 = v14;
    *(_QWORD *)v4 = v13;
    *(_DWORD *)(v4 + 8) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)v2 = v11;
    *(_DWORD *)(v2 + 8) = v12;
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v3));
  }
  result.value.parameters.parameters._rawValue = v8;
  result.value.parameters.bias = v9;
  return result;
}

void sub_247E7C018(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _OWORD *v12;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v5 = a1 + 32;
    v6 = *(_DWORD *)(a1 + 32 + 4 * v3 - 4);
    v7 = 2 * v3 - 1;
    sub_247E82860();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain_n();
    v8 = swift_dynamicCastClass();
    if (!v8)
    {
      swift_bridgeObjectRelease();
      v8 = MEMORY[0x24BEE4AF8];
    }
    v9 = *(_QWORD *)(v8 + 16);
    swift_release();
    if (v9 == v7 >> 1)
    {
      v10 = swift_dynamicCastClass();
      if (!v10)
      {
        swift_bridgeObjectRelease();
        v10 = MEMORY[0x24BEE4AF8];
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v10 = sub_247E2B5AC(a1, v5, 0, v7);
    }
    swift_bridgeObjectRelease();
    if (qword_25445B028 != -1)
      swift_once();
    v11 = (id)qword_25445B030;
    sub_247E824A0();
    sub_247E81FE4();

    *(_QWORD *)a2 = v10;
    *(_DWORD *)(a2 + 8) = v6;
  }
  else
  {
    sub_247E7CCD4();
    swift_allocError();
    *v12 = xmmword_247E8DC40;
    swift_willThrow();
  }
}

uint64_t UserEmbeddingManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_path;
  v2 = sub_247E81C54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_247E7CD5C(v0 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager____lazy_storage___classifier, &qword_25445AF08);
  swift_bridgeObjectRelease();
  sub_247E7CD5C(v0 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_humanReadableParametersPath, &qword_254458DD0);
  return v0;
}

uint64_t UserEmbeddingManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_path;
  v2 = sub_247E81C54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_247E7CD5C(v0 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager____lazy_storage___classifier, &qword_25445AF08);
  swift_bridgeObjectRelease();
  sub_247E7CD5C(v0 + OBJC_IVAR____TtC4Tabi20UserEmbeddingManager_humanReadableParametersPath, &qword_254458DD0);
  return swift_deallocClassInstance();
}

uint64_t sub_247E7C2D0()
{
  return type metadata accessor for UserEmbeddingManager();
}

uint64_t method lookup function for UserEmbeddingManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UserEmbeddingManager.__allocating_init(directory:writeHumanReadableParametersToDisk:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

void sub_247E7C2EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25445AEC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25445A658);
    v0 = sub_247E82560();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25445AEC8);
  }
}

unint64_t destroy for UserEmbeddingManager.Errors(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s4Tabi20UserEmbeddingManagerC6ErrorsOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for UserEmbeddingManager.Errors(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UserEmbeddingManager.Errors(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserEmbeddingManager.Errors(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for UserEmbeddingManager.Errors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_247E7C55C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_247E7C578(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for UserEmbeddingManager.Errors()
{
  return &type metadata for UserEmbeddingManager.Errors;
}

uint64_t initializeBufferWithCopyOfBuffer for UserEmbeddingManager.LogisticRegressionClassifierConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for UserEmbeddingManager.LogisticRegressionClassifierConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 73))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for UserEmbeddingManager.LogisticRegressionClassifierConfiguration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 72) = 0;
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
  *(_BYTE *)(result + 73) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for UserEmbeddingManager.LogisticRegressionClassifierConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UserEmbeddingManager.LogisticRegressionClassifierConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247E7C738 + 4 * byte_247E8D9EA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_247E7C76C + 4 * byte_247E8D9E5[v4]))();
}

uint64_t sub_247E7C76C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E7C774(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247E7C77CLL);
  return result;
}

uint64_t sub_247E7C788(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247E7C790);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_247E7C794(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E7C79C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247E7C7A8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247E7C7B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UserEmbeddingManager.LogisticRegressionClassifierConfiguration.CodingKeys()
{
  return &type metadata for UserEmbeddingManager.LogisticRegressionClassifierConfiguration.CodingKeys;
}

unint64_t sub_247E7C7D0()
{
  unint64_t result;

  result = qword_257707450;
  if (!qword_257707450)
  {
    result = MEMORY[0x2495930AC](&unk_247E8DBC8, &type metadata for UserEmbeddingManager.LogisticRegressionClassifierConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257707450);
  }
  return result;
}

unint64_t sub_247E7C818()
{
  unint64_t result;

  result = qword_257707458;
  if (!qword_257707458)
  {
    result = MEMORY[0x2495930AC](&unk_247E8DB38, &type metadata for UserEmbeddingManager.LogisticRegressionClassifierConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257707458);
  }
  return result;
}

unint64_t sub_247E7C860()
{
  unint64_t result;

  result = qword_257707460;
  if (!qword_257707460)
  {
    result = MEMORY[0x2495930AC](&unk_247E8DB60, &type metadata for UserEmbeddingManager.LogisticRegressionClassifierConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257707460);
  }
  return result;
}

uint64_t sub_247E7C8A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254458F90);
    v3 = sub_247E82644();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_247E82224();
      sub_247E828E4();
      v7 = v6;
      sub_247E82284();
      v8 = sub_247E828FC();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_247E82224();
        v17 = v16;
        if (v15 == sub_247E82224() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_247E82854();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_247E82224();
          v24 = v23;
          if (v22 == sub_247E82224() && v24 == v25)
            goto LABEL_3;
          v27 = sub_247E82854();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_247E7CAD0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x746C616E6550326CLL && a2 == 0xE900000000000079;
  if (v3 || (sub_247E82854() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746C616E6550316CLL && a2 == 0xE900000000000079 || (sub_247E82854() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000247E92570 || (sub_247E82854() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x657A695370657473 && a2 == 0xE800000000000000 || (sub_247E82854() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000247E92590)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_247E82854();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

unint64_t sub_247E7CCD4()
{
  unint64_t result;

  result = qword_257707468;
  if (!qword_257707468)
  {
    result = MEMORY[0x2495930AC](&protocol conformance descriptor for UserEmbeddingManager.Errors, &type metadata for UserEmbeddingManager.Errors);
    atomic_store(result, (unint64_t *)&qword_257707468);
  }
  return result;
}

uint64_t sub_247E7CD18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247E7CD5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247E7CD98(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_247DFC0C0(0, v1, 0);
    v2 = v13;
    v4 = *(_QWORD *)(type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0) - 8);
    v5 = *(_QWORD *)(v4 + 72);
    v6 = (uint64_t *)(((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + a1 + 8);
    do
    {
      v8 = *(v6 - 1);
      v7 = *v6;
      v10 = *(_QWORD *)(v13 + 16);
      v9 = *(_QWORD *)(v13 + 24);
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1)
        sub_247DFC0C0(v9 > 1, v10 + 1, 1);
      v6 = (uint64_t *)((char *)v6 + v5);
      *(_QWORD *)(v13 + 16) = v10 + 1;
      v11 = v13 + 16 * v10;
      *(_QWORD *)(v11 + 32) = v8;
      *(_QWORD *)(v11 + 40) = v7;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_247E7CE8C(uint64_t a1)
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
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD50);
  v3 = MEMORY[0x24BDAC7A8](v57);
  v56 = (uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v55 = (uint64_t *)((char *)&v45 - v6);
  MEMORY[0x24BDAC7A8](v5);
  v54 = (char *)&v45 - v7;
  v8 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0);
  v52 = *(_QWORD *)(v8 - 8);
  v53 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  if (!v11)
    return v12;
  v60 = v1;
  v61 = MEMORY[0x24BEE4AF8];
  sub_247DFC3F0(0, v11, 0);
  result = sub_247E81028(a1);
  v15 = result;
  v16 = 0;
  v17 = a1 + 64;
  v46 = a1 + 80;
  v47 = v11;
  v50 = v10;
  v51 = a1;
  v48 = v14;
  v49 = a1 + 64;
  while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(_BYTE *)(a1 + 32))
  {
    v20 = (unint64_t)v15 >> 6;
    if ((*(_QWORD *)(v17 + 8 * ((unint64_t)v15 >> 6)) & (1 << v15)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v14)
      goto LABEL_26;
    v58 = v16;
    v59 = 1 << v15;
    v21 = v57;
    v22 = v54;
    v23 = (uint64_t)&v54[*(int *)(v57 + 48)];
    v24 = *(_QWORD *)(a1 + 56);
    v25 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v15);
    v26 = *v25;
    v27 = v25[1];
    v28 = type metadata accessor for Feature();
    sub_247E8191C(v24 + *(_QWORD *)(*(_QWORD *)(v28 - 8) + 72) * v15, v23, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
    *v22 = v26;
    v22[1] = v27;
    v29 = v55;
    *v55 = v26;
    v29[1] = v27;
    sub_247E8191C(v23, (uint64_t)v29 + *(int *)(v21 + 48), (uint64_t (*)(_QWORD))type metadata accessor for Feature);
    v30 = (uint64_t)v29;
    v31 = v56;
    sub_247DFE1CC(v30, v56);
    swift_bridgeObjectRetain_n();
    v32 = sub_247E81960((uint64_t)v22, &qword_25445AD50);
    v33 = (uint64_t)v50;
    MEMORY[0x24BDAC7A8](v32);
    *(&v45 - 4) = v34;
    *(&v45 - 3) = v35;
    *(&v45 - 2) = v36;
    sub_247E81A7C(&qword_25445A6C0, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO, (uint64_t)&protocol conformance descriptor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
    v37 = v60;
    sub_247E81F00();
    v60 = v37;
    sub_247E81960(v31, &qword_25445AD50);
    v12 = v61;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_247DFC3F0(0, *(_QWORD *)(v12 + 16) + 1, 1);
      v12 = v61;
    }
    v39 = *(_QWORD *)(v12 + 16);
    v38 = *(_QWORD *)(v12 + 24);
    a1 = v51;
    if (v39 >= v38 >> 1)
    {
      sub_247DFC3F0(v38 > 1, v39 + 1, 1);
      v12 = v61;
    }
    *(_QWORD *)(v12 + 16) = v39 + 1;
    result = sub_247E8199C(v33, v12+ ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(_QWORD *)(v52 + 72) * v39, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
    v18 = 1 << *(_BYTE *)(a1 + 32);
    if (v15 >= v18)
      goto LABEL_27;
    v17 = v49;
    v40 = *(_QWORD *)(v49 + 8 * v20);
    if ((v40 & v59) == 0)
      goto LABEL_28;
    LODWORD(v14) = v48;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v48)
      goto LABEL_29;
    v41 = v40 & (-2 << (v15 & 0x3F));
    if (v41)
    {
      v18 = __clz(__rbit64(v41)) | v15 & 0xFFFFFFFFFFFFFFC0;
      v19 = v47;
    }
    else
    {
      v42 = v20 + 1;
      v43 = (unint64_t)(v18 + 63) >> 6;
      v19 = v47;
      if (v20 + 1 < v43)
      {
        v44 = *(_QWORD *)(v49 + 8 * v42);
        if (v44)
        {
LABEL_22:
          v18 = __clz(__rbit64(v44)) + (v42 << 6);
        }
        else
        {
          while (v43 - 2 != v20)
          {
            v44 = *(_QWORD *)(v46 + 8 * v20++);
            if (v44)
            {
              v42 = v20 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    v16 = v58 + 1;
    v15 = v18;
    if (v58 + 1 == v19)
      return v12;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_247E7D2B4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_247E82854();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_247E82854() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t SubGraphComputation.__allocating_init(modelIOSpec:graph:)(uint64_t a1, _OWORD *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_OWORD *)(v4 + OBJC_IVAR____TtC4Tabi19SubGraphComputation_graph) = *a2;
  sub_247E8191C(a1, v4 + OBJC_IVAR____TtC4Tabi19AbstractComputation_modelIOSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  sub_247E81CD8();
  sub_247E819E0(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  return v4;
}

uint64_t SubGraphComputation.init(modelIOSpec:graph:)(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v5 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v2 + OBJC_IVAR____TtC4Tabi19SubGraphComputation_graph) = *a2;
  sub_247E8191C(a1, (uint64_t)v7, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  sub_247E81CD8();
  sub_247E8199C((uint64_t)v7, v2 + OBJC_IVAR____TtC4Tabi19AbstractComputation_modelIOSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  sub_247E819E0(a1, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  return v2;
}

uint64_t sub_247E7D4E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  BOOL v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56[3];
  uint64_t v57;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = MEMORY[0x24BEE4AF8];
  v6 = swift_bridgeObjectRetain();
  v7 = (_QWORD *)sub_247E7CD98(v6);
  v51 = 0;
  swift_bridgeObjectRelease();
  if (!v7[2])
    goto LABEL_56;
  v49 = a1;
  v8 = a1 + 16;
  v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC4Tabi19SubGraphComputation_graph);
  v55 = (uint64_t *)(v1 + OBJC_IVAR____TtC4Tabi19SubGraphComputation_graph);
  v52 = v8;
  while (1)
  {
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
    {
      v11 = v7[2];
      if (!v11)
        goto LABEL_57;
    }
    else
    {
      result = (uint64_t)sub_247DF8BF0(v7);
      v7 = (_QWORD *)result;
      v11 = *(_QWORD *)(result + 16);
      if (!v11)
      {
LABEL_57:
        __break(1u);
        goto LABEL_58;
      }
    }
    v12 = v11 - 1;
    v13 = &v7[2 * v12];
    v14 = v13[4];
    v15 = v13[5];
    v7[2] = v12;
    swift_beginAccess();
    v16 = *(_QWORD *)v8;
    if (*(_QWORD *)(*(_QWORD *)v8 + 16))
    {
      swift_bridgeObjectRetain();
      v17 = sub_247DBB6D4(v14, v15);
      if ((v18 & 1) != 0)
      {
        v19 = v17;
        v20 = *(_QWORD *)(v16 + 56);
        v21 = type metadata accessor for Feature();
        v22 = *(_QWORD *)(v21 - 8);
        v23 = v20 + *(_QWORD *)(v22 + 72) * v19;
        v9 = v55;
        sub_247E8191C(v23, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v5, 0, 1, v21);
      }
      else
      {
        v21 = type metadata accessor for Feature();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v5, 1, 1, v21);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = type metadata accessor for Feature();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v5, 1, 1, v21);
    }
    swift_endAccess();
    type metadata accessor for Feature();
    v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v5, 1, v21);
    sub_247E81960((uint64_t)v5, &qword_25445AD00);
    if (v24 == 1)
    {
      v25 = *v9;
      if (*(_QWORD *)(*v9 + 16))
        break;
    }
    swift_bridgeObjectRelease();
LABEL_4:
    if (!v7[2])
    {
      a1 = v49;
LABEL_56:
      v56[0] = MEMORY[0x24BEE4B08];
      swift_retain();
      v47 = swift_bridgeObjectRetain();
      sub_247E810B0(v47, v56, a1);
      swift_bridgeObjectRelease_n();
      swift_release();
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a1;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = sub_247DBB6D4(v14, v15);
  if ((v27 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_4;
  }
  v28 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v26);
  swift_retain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v29 = swift_bridgeObjectRelease_n();
  MEMORY[0x249592590](v29);
  if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_247E82338();
  sub_247E8235C();
  v30 = sub_247E8232C();
  v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v28 + 120))(v30);
  v32 = *(_QWORD *)(v31 + 16);
  if (!v32)
  {
    swift_bridgeObjectRelease();
    swift_release();
    v8 = v52;
    goto LABEL_4;
  }
  v53 = v31;
  v54 = v28;
  v33 = v31 + 32;
  swift_bridgeObjectRetain();
  v34 = 0;
  while (2)
  {
    v38 = (uint64_t *)(v33 + 16 * v34);
    v39 = *v38;
    v40 = v38[1];
    v41 = v7[2];
    if (!v41)
      goto LABEL_20;
    v42 = v7[4] == v39 && v7[5] == v40;
    if (v42 || (sub_247E82854() & 1) != 0)
      goto LABEL_23;
    if (v41 == 1)
      goto LABEL_20;
    v43 = v7[6] == v39 && v7[7] == v40;
    if (v43 || (sub_247E82854() & 1) != 0)
      goto LABEL_23;
    if (v41 == 2)
    {
LABEL_20:
      v35 = v7[2];
      v36 = v7[3];
      swift_bridgeObjectRetain_n();
      if (v35 >= v36 >> 1)
        v7 = sub_247DF8454((_QWORD *)(v36 > 1), v35 + 1, 1, v7);
      v7[2] = v35 + 1;
      v37 = &v7[2 * v35];
      v37[4] = v39;
      v37[5] = v40;
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    if (v7[8] == v39 && v7[9] == v40 || (result = sub_247E82854(), (result & 1) != 0))
    {
LABEL_23:
      if (++v34 == v32)
      {
        swift_release();
        swift_bridgeObjectRelease_n();
        v8 = v52;
        v9 = v55;
        goto LABEL_4;
      }
      continue;
    }
    break;
  }
  if (v41 == 3)
    goto LABEL_20;
  v44 = v7 + 11;
  v45 = 3;
  while (!__OFADD__(v45, 1))
  {
    if (*(v44 - 1) == v39 && *v44 == v40)
      goto LABEL_23;
    v50 = v45 + 1;
    result = sub_247E82854();
    if ((result & 1) != 0)
      goto LABEL_23;
    v44 += 2;
    ++v45;
    if (v50 == v41)
      goto LABEL_20;
  }
LABEL_58:
  __break(1u);
  return result;
}

uint64_t sub_247E7DA10(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;

  v4 = v3;
  v43 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD50);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_QWORD *)((char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = sub_247E8202C();
  v36 = *(_QWORD *)(v10 - 8);
  v37 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v40 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v38 = a2;
  v13 = *a2;
  swift_bridgeObjectRetain();
  v39 = v12;
  LOBYTE(a2) = sub_247E1D9EC(v12, v13);
  result = swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
  {
    v35[2] = v4;
    if (qword_254458F78 != -1)
LABEL_29:
      swift_once();
    v15 = (id)qword_25445AD08;
    sub_247E82014();
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v39 + 104))(v43);
    swift_beginAccess();
    v35[0] = v35;
    v35[1] = v16;
    v17 = *(_QWORD *)(v16 + 16);
    v18 = *(_QWORD *)(v17 + 64);
    v41 = v17 + 64;
    v19 = 1 << *(_BYTE *)(v17 + 32);
    v20 = -1;
    if (v19 < 64)
      v20 = ~(-1 << v19);
    v21 = v20 & v18;
    v42 = (unint64_t)(v19 + 63) >> 6;
    swift_bridgeObjectRetain_n();
    v22 = 0;
    while (1)
    {
      if (v21)
      {
        v23 = __clz(__rbit64(v21));
        v21 &= v21 - 1;
        v24 = v23 | (v22 << 6);
      }
      else
      {
        v31 = v22 + 1;
        if (__OFADD__(v22, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
        if (v31 >= v42)
          goto LABEL_25;
        v32 = *(_QWORD *)(v41 + 8 * v31);
        ++v22;
        if (!v32)
        {
          v22 = v31 + 1;
          if (v31 + 1 >= v42)
            goto LABEL_25;
          v32 = *(_QWORD *)(v41 + 8 * v22);
          if (!v32)
          {
            v22 = v31 + 2;
            if (v31 + 2 >= v42)
              goto LABEL_25;
            v32 = *(_QWORD *)(v41 + 8 * v22);
            if (!v32)
            {
              v22 = v31 + 3;
              if (v31 + 3 >= v42)
                goto LABEL_25;
              v32 = *(_QWORD *)(v41 + 8 * v22);
              if (!v32)
              {
                v33 = v31 + 4;
                if (v33 >= v42)
                {
LABEL_25:
                  swift_release();
                  swift_bridgeObjectRelease();
                  v34 = v39;
                  swift_retain();
                  sub_247E7F78C(&v44, v34);
                  swift_release();
                  swift_release();
                  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v40, v37);
                }
                v32 = *(_QWORD *)(v41 + 8 * v33);
                if (!v32)
                {
                  while (1)
                  {
                    v22 = v33 + 1;
                    if (__OFADD__(v33, 1))
                      goto LABEL_28;
                    if (v22 >= v42)
                      goto LABEL_25;
                    v32 = *(_QWORD *)(v41 + 8 * v22);
                    ++v33;
                    if (v32)
                      goto LABEL_24;
                  }
                }
                v22 = v33;
              }
            }
          }
        }
LABEL_24:
        v21 = (v32 - 1) & v32;
        v24 = __clz(__rbit64(v32)) + (v22 << 6);
      }
      v25 = *(_QWORD *)(v17 + 56);
      v26 = (uint64_t *)(*(_QWORD *)(v17 + 48) + 16 * v24);
      v28 = *v26;
      v27 = v26[1];
      v29 = v25 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for Feature() - 8) + 72) * v24;
      v30 = (uint64_t)v9 + *(int *)(v7 + 48);
      sub_247E8191C(v29, v30, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
      *v9 = v28;
      v9[1] = v27;
      swift_bridgeObjectRetain();
      sub_247E00384(v28, v27, v30, 0, v43);
      sub_247E81960((uint64_t)v9, &qword_25445AD50);
    }
  }
  return result;
}

uint64_t sub_247E7DD90@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  _QWORD *v48;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v50;
  char v51;
  unint64_t v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  char v58;
  char v59;
  unint64_t v60;
  uint64_t inited;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  BOOL v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v93;
  uint64_t v94;
  int v95;
  int v96;
  _QWORD *v97;
  char v98;
  unint64_t v99;
  uint64_t v100;
  _BOOL8 v101;
  uint64_t v102;
  char v103;
  unint64_t v104;
  char v105;
  _QWORD *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  _QWORD *v115;
  unint64_t v116;
  _QWORD *v117;
  unint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t *v134;
  int v135;
  _QWORD *v136;
  char v137;
  unint64_t v138;
  uint64_t v139;
  _BOOL8 v140;
  uint64_t v141;
  char v142;
  unint64_t v143;
  char v144;
  _QWORD *v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  size_t v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  _QWORD *v166;
  _QWORD *v167;
  id v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  _QWORD *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t result;
  id v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  _QWORD *v190;
  uint64_t *v191;
  uint64_t *v192;
  uint64_t v193;
  uint64_t v194;
  _QWORD *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t *v198;
  uint64_t v199;
  _QWORD *v200;
  uint64_t v201;
  _QWORD *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  __int128 v206;
  char *v207;
  uint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  int v211;
  uint64_t v212;
  int64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t *v219;
  uint64_t *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t *v223;
  _QWORD *v224;
  _QWORD *v225;
  unint64_t v226;
  _QWORD *v227;

  v196 = a3;
  v192 = a5;
  v190 = a4;
  v194 = *a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445A6E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v188 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v215 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0);
  v197 = *(_QWORD *)(v215 - 8);
  v10 = MEMORY[0x24BDAC7A8](v215);
  v222 = (uint64_t)&v188 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v221 = (uint64_t)&v188 - v12;
  v189 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec(0);
  v13 = MEMORY[0x24BDAC7A8](v189);
  v15 = (char *)&v188 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v191 = (uint64_t *)((char *)&v188 - v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD00);
  MEMORY[0x24BDAC7A8](v17);
  v214 = (uint64_t)&v188 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v218 = type metadata accessor for Feature();
  v19 = *(_QWORD *)(v218 - 8);
  v20 = MEMORY[0x24BDAC7A8](v218);
  v210 = (uint64_t)&v188 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v220 = (uint64_t *)((char *)&v188 - v23);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v188 - v24;
  v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445AD50);
  v26 = MEMORY[0x24BDAC7A8](v216);
  v209 = (uint64_t *)((char *)&v188 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v26);
  v223 = (uint64_t *)((char *)&v188 - v28);
  v29 = a1[2];
  v217 = v19;
  v195 = a1;
  v205 = v29;
  if (!v29)
  {
    v207 = v25;
    v188 = v15;
    v193 = a2;
    v202 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_23;
  }
  v31 = a1[4];
  v30 = a1[5];
  v32 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  if (!v32)
    goto LABEL_120;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v33 = sub_247DBB6D4(v31, v30);
  if ((v34 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_120:
    v167 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_121;
  }
  v207 = v25;
  v188 = v15;
  v202 = (_QWORD *)MEMORY[0x24BEE4B00];
  v35 = a1 + 7;
  v36 = v205;
  v193 = a2;
  while (1)
  {
    v37 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v33);
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v38 = swift_bridgeObjectRetain();
    v39 = v203;
    v40 = sub_247E811DC(v38, v31, v30);
    v203 = v39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v40 + 16))
    {
      v41 = v197;
      sub_247E8191C(v40 + ((*(unsigned __int8 *)(v197 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v197 + 80)), (uint64_t)v9, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
      v42 = 0;
    }
    else
    {
      v42 = 1;
      v41 = v197;
    }
    v43 = v215;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v9, v42, 1, v215);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v9, 1, v43) == 1)
    {
      swift_bridgeObjectRelease();
      sub_247E81960((uint64_t)v9, &qword_25445A6E0);
      if (qword_254458F78 != -1)
        swift_once();
      v184 = (id)qword_25445AD08;
      sub_247E82488();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
      v185 = swift_allocObject();
      *(_OWORD *)(v185 + 16) = xmmword_247E83230;
      *(_QWORD *)(v185 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v185 + 64) = sub_247DBCF64();
      *(_QWORD *)(v185 + 32) = v31;
      *(_QWORD *)(v185 + 40) = v30;
      sub_247E81FE4();

      swift_bridgeObjectRelease();
      v186 = sub_247DFF854(MEMORY[0x24BEE4AF8]);
      v187 = swift_allocObject();
      *(_QWORD *)(v187 + 16) = v186;
      swift_release();
      *v192 = v187;
      return swift_bridgeObjectRelease();
    }
    v219 = v35;
    v44 = v36;
    v45 = v31;
    v31 = v37;
    v46 = v9;
    v47 = v221;
    sub_247E8199C((uint64_t)v9, v221, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
    sub_247E8191C(v47, v222, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
    v48 = v202;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v225 = v48;
    v50 = v45;
    v52 = sub_247DBB6D4(v45, v30);
    v53 = v48[2];
    v54 = (v51 & 1) == 0;
    v55 = v53 + v54;
    if (__OFADD__(v53, v54))
      goto LABEL_147;
    v56 = v51;
    if (v48[3] >= v55)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_247E2D9EC();
    }
    else
    {
      sub_247E2C838(v55, isUniquelyReferenced_nonNull_native);
      v57 = sub_247DBB6D4(v50, v30);
      if ((v56 & 1) != (v58 & 1))
      {
LABEL_150:
        sub_247E82884();
        __break(1u);
LABEL_151:
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        __break(1u);
        return result;
      }
      v52 = v57;
    }
    v19 = v217;
    v202 = v225;
    if ((v56 & 1) != 0)
    {
      sub_247E81A1C(v222, v225[7] + *(_QWORD *)(v197 + 72) * v52, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
    }
    else
    {
      sub_247E75FE8(v52, v50, v30, v222, v225);
      swift_bridgeObjectRetain();
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_247E819E0(v221, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
    v36 = v44 - 1;
    if (v44 == 1)
      break;
    v31 = *(v219 - 1);
    v30 = *v219;
    a2 = v193;
    if (!*(_QWORD *)(v193 + 16))
    {
      swift_bridgeObjectRetain();
      goto LABEL_139;
    }
    v9 = v46;
    v35 = v219 + 2;
    swift_bridgeObjectRetain_n();
    v33 = sub_247DBB6D4(v31, v30);
    if ((v59 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_139:
      swift_bridgeObjectRelease();
      v167 = v202;
LABEL_121:
      v202 = v167;
      if (qword_254458F78 != -1)
        goto LABEL_149;
      goto LABEL_122;
    }
  }
  a1 = v195;
  swift_bridgeObjectRelease();
LABEL_23:
  v60 = sub_247DFF854(MEMORY[0x24BEE4AF8]);
  inited = swift_initStackObject();
  v201 = inited;
  *(_QWORD *)(inited + 16) = v60;
  v62 = (uint64_t *)(inited + 16);
  v219 = (uint64_t *)(inited + 16);
  if (!v205)
    goto LABEL_78;
  v200 = a1 + 4;
  swift_bridgeObjectRetain();
  v63 = 0;
  v31 = (uint64_t)type metadata accessor for Feature;
  v206 = xmmword_247E83520;
  v64 = v196;
  while (2)
  {
    if (!*(_QWORD *)(v64 + 16))
      goto LABEL_27;
    v204 = v63;
    v65 = &v200[2 * v63];
    v67 = *v65;
    v66 = v65[1];
    swift_bridgeObjectRetain();
    v68 = sub_247DBB6D4(v67, v66);
    if ((v69 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    v70 = *(_QWORD *)(*(_QWORD *)(v64 + 56) + 8 * v68);
    swift_beginAccess();
    v198 = (uint64_t *)&v188;
    v71 = *(_QWORD *)(v70 + 16);
    v72 = *(_QWORD *)(v71 + 64);
    v212 = v71 + 64;
    v73 = 1 << *(_BYTE *)(v71 + 32);
    if (v73 < 64)
      v74 = ~(-1 << v73);
    else
      v74 = -1;
    v30 = v74 & v72;
    v213 = (unint64_t)(v73 + 63) >> 6;
    swift_bridgeObjectRetain_n();
    v199 = v70;
    swift_retain();
    v75 = 0;
    v215 = v66;
    v208 = v71;
    while (2)
    {
      if (v30)
      {
        v221 = (v30 - 1) & v30;
        v222 = v75;
        v76 = __clz(__rbit64(v30)) | (v75 << 6);
        goto LABEL_52;
      }
      v77 = __OFADD__(v75, 1);
      v78 = v75 + 1;
      if (v77)
        goto LABEL_141;
      if (v78 < v213)
      {
        v79 = *(_QWORD *)(v212 + 8 * v78);
        if (!v79)
        {
          v80 = v78 + 1;
          if (v78 + 1 >= v213)
            break;
          v79 = *(_QWORD *)(v212 + 8 * v80);
          if (!v79)
          {
            v80 = v78 + 2;
            if (v78 + 2 >= v213)
              break;
            v79 = *(_QWORD *)(v212 + 8 * v80);
            if (!v79)
            {
              v80 = v78 + 3;
              if (v78 + 3 >= v213)
                break;
              v79 = *(_QWORD *)(v212 + 8 * v80);
              if (!v79)
              {
                v80 = v78 + 4;
                if (v78 + 4 >= v213)
                  break;
                v79 = *(_QWORD *)(v212 + 8 * v80);
                if (!v79)
                {
                  while (1)
                  {
                    v78 = v80 + 1;
                    if (__OFADD__(v80, 1))
                      goto LABEL_146;
                    if (v78 >= v213)
                      goto LABEL_76;
                    v79 = *(_QWORD *)(v212 + 8 * v78);
                    ++v80;
                    if (v79)
                      goto LABEL_51;
                  }
                }
              }
            }
          }
          v78 = v80;
        }
LABEL_51:
        v221 = (v79 - 1) & v79;
        v222 = v78;
        v76 = __clz(__rbit64(v79)) + (v78 << 6);
LABEL_52:
        v81 = (uint64_t *)(*(_QWORD *)(v71 + 48) + 16 * v76);
        v83 = *v81;
        v82 = v81[1];
        v30 = *(_QWORD *)(v19 + 72);
        v84 = v223;
        v85 = (uint64_t)v223 + *(int *)(v216 + 48);
        sub_247E8191C(*(_QWORD *)(v71 + 56) + v30 * v76, v85, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
        *v84 = v83;
        v84[1] = v82;
        swift_beginAccess();
        v86 = *v62;
        if (!*(_QWORD *)(*v62 + 16))
        {
          v90 = v214;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v214, 1, 1, v218);
          swift_bridgeObjectRetain();
          goto LABEL_58;
        }
        swift_bridgeObjectRetain_n();
        v87 = sub_247DBB6D4(v83, v82);
        if ((v88 & 1) != 0)
        {
          v89 = *(_QWORD *)(v86 + 56) + v87 * v30;
          v90 = v214;
          sub_247E8191C(v89, v214, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
          v91 = 0;
        }
        else
        {
          v91 = 1;
          v90 = v214;
        }
        v92 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
        v93 = v19;
        v94 = v218;
        v92(v90, v91, 1, v218);
        swift_bridgeObjectRelease();
        v95 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v90, 1, v94);
        v31 = (uint64_t)type metadata accessor for Feature;
        if (v95 == 1)
        {
LABEL_58:
          sub_247E81960(v90, &qword_25445AD00);
          swift_endAccess();
          swift_beginAccess();
          sub_247E8191C(v85, (uint64_t)v220, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
          swift_bridgeObjectRetain();
          v96 = swift_isUniquelyReferenced_nonNull_native();
          v224 = (_QWORD *)*v62;
          v97 = v224;
          *v62 = 0x8000000000000000;
          v99 = sub_247DBB6D4(v83, v82);
          v100 = v97[2];
          v101 = (v98 & 1) == 0;
          v102 = v100 + v101;
          if (__OFADD__(v100, v101))
          {
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
            goto LABEL_148;
          }
          v103 = v98;
          if (v97[3] >= v102)
          {
            if ((v96 & 1) != 0)
            {
              v106 = v224;
              if ((v98 & 1) == 0)
                goto LABEL_65;
            }
            else
            {
              sub_247E2CBC0();
              v106 = v224;
              if ((v103 & 1) == 0)
                goto LABEL_65;
            }
          }
          else
          {
            sub_247E2B82C(v102, v96);
            v104 = sub_247DBB6D4(v83, v82);
            if ((v103 & 1) != (v105 & 1))
              goto LABEL_150;
            v99 = v104;
            v106 = v224;
            if ((v103 & 1) == 0)
            {
LABEL_65:
              v106[(v99 >> 6) + 8] |= 1 << v99;
              v107 = (uint64_t *)(v106[6] + 16 * v99);
              *v107 = v83;
              v107[1] = v82;
              sub_247E8199C((uint64_t)v220, v106[7] + v99 * v30, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
              v108 = v106[2];
              v77 = __OFADD__(v108, 1);
              v109 = v108 + 1;
              if (v77)
                goto LABEL_142;
              v106[2] = v109;
              swift_bridgeObjectRetain();
LABEL_35:
              v62 = v219;
              *v219 = (uint64_t)v106;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_endAccess();
LABEL_36:
              v30 = v221;
              v75 = v222;
              sub_247E81960((uint64_t)v223, &qword_25445AD50);
              v19 = v217;
              continue;
            }
          }
          sub_247E81A1C((uint64_t)v220, v106[7] + v99 * v30, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
          goto LABEL_35;
        }
        v110 = (uint64_t)v207;
        sub_247E8199C(v90, (uint64_t)v207, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
        swift_endAccess();
        if (qword_254458F78 != -1)
          swift_once();
        v111 = (id)qword_25445AD08;
        v211 = sub_247E82488();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
        v112 = swift_allocObject();
        *(_OWORD *)(v112 + 16) = v206;
        v113 = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v112 + 56) = MEMORY[0x24BEE0D00];
        v114 = sub_247DBCF64();
        *(_QWORD *)(v112 + 64) = v114;
        *(_QWORD *)(v112 + 32) = v83;
        *(_QWORD *)(v112 + 40) = v82;
        v225 = 0;
        v226 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        sub_247E82710();
        v115 = v225;
        v116 = v226;
        *(_QWORD *)(v112 + 96) = v113;
        *(_QWORD *)(v112 + 104) = v114;
        *(_QWORD *)(v112 + 72) = v115;
        *(_QWORD *)(v112 + 80) = v116;
        v225 = 0;
        v226 = 0xE000000000000000;
        sub_247E82710();
        v117 = v225;
        v118 = v226;
        *(_QWORD *)(v112 + 136) = v113;
        *(_QWORD *)(v112 + 144) = v114;
        *(_QWORD *)(v112 + 112) = v117;
        *(_QWORD *)(v112 + 120) = v118;
        sub_247E81FE4();

        swift_bridgeObjectRelease();
        v31 = (uint64_t)type metadata accessor for Feature;
        sub_247E819E0(v110, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
        v62 = v219;
        v71 = v208;
        goto LABEL_36;
      }
      break;
    }
LABEL_76:
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    v64 = v196;
LABEL_26:
    v63 = v204;
LABEL_27:
    if (++v63 != v205)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
LABEL_78:
  v119 = v190;
  swift_beginAccess();
  v220 = (uint64_t *)&v188;
  v120 = v119[2];
  v121 = *(_QWORD *)(v120 + 64);
  v221 = v120 + 64;
  v122 = 1 << *(_BYTE *)(v120 + 32);
  v123 = -1;
  if (v122 < 64)
    v123 = ~(-1 << v122);
  v30 = v123 & v121;
  v222 = (unint64_t)(v122 + 63) >> 6;
  v223 = (uint64_t *)v120;
  swift_bridgeObjectRetain_n();
  v31 = 0;
  while (2)
  {
    if (v30)
    {
      v124 = __clz(__rbit64(v30));
      v30 &= v30 - 1;
      v125 = v124 | (v31 << 6);
      goto LABEL_98;
    }
    v77 = __OFADD__(v31++, 1);
    if (v77)
      goto LABEL_145;
    if (v31 >= v222)
    {
LABEL_113:
      swift_release();
      swift_bridgeObjectRelease();
      v149 = v191;
      _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0();
      swift_beginAccess();
      v150 = swift_bridgeObjectRetain();
      v151 = v203;
      v152 = sub_247E7CE8C(v150);
      v203 = v151;
      swift_bridgeObjectRelease();
      *v149 = v152;
      v153 = swift_bridgeObjectRetain();
      v154 = sub_247E2B714(v153);
      swift_bridgeObjectRelease();
      v149[1] = v154;
      v155 = (uint64_t)v188;
      sub_247E8191C((uint64_t)v149, (uint64_t)v188, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
      type metadata accessor for SubGraphComputation();
      v156 = swift_allocObject();
      v157 = (_QWORD *)(v156 + OBJC_IVAR____TtC4Tabi19SubGraphComputation_graph);
      v158 = v196;
      *v157 = v193;
      v157[1] = v158;
      sub_247E8191C(v155, v156 + OBJC_IVAR____TtC4Tabi19AbstractComputation_modelIOSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247E81CD8();
      sub_247E819E0(v155, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
      v159 = v156 + OBJC_IVAR____TtC4Tabi19AbstractComputation_modelIOSpec;
      v160 = *(_QWORD *)(v156 + OBJC_IVAR____TtC4Tabi19AbstractComputation_modelIOSpec);
      if ((sub_247DFE368(v160) & 1) != 0)
      {
        v161 = (_QWORD *)MEMORY[0x24BEE4B00];
        v227 = (_QWORD *)MEMORY[0x24BEE4B00];
        v162 = *(_QWORD *)(v160 + 16);
        if (v162)
        {
          v163 = v160 + ((*(unsigned __int8 *)(v197 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v197 + 80));
          v164 = *(_QWORD *)(v197 + 72);
          swift_retain();
          swift_bridgeObjectRetain();
          v165 = v203;
          while (1)
          {
            sub_247E1A648((uint64_t)&v227, v163, v201);
            if (v165)
              goto LABEL_151;
            v163 += v164;
            if (!--v162)
            {
              v203 = 0;
              swift_release();
              swift_bridgeObjectRelease();
              v166 = v227;
              goto LABEL_125;
            }
          }
        }
        v166 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_125:
        v174 = swift_allocObject();
        *(_QWORD *)(v174 + 16) = v166;
        sub_247E7D4E0(v174);
        swift_release();
        v175 = *(_QWORD *)(v159 + 8);
        v227 = v161;
        v176 = *(_QWORD *)(v175 + 16);
        if (v176)
        {
          v177 = v175 + ((*(unsigned __int8 *)(v197 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v197 + 80));
          v178 = *(_QWORD *)(v197 + 72);
          swift_retain();
          swift_bridgeObjectRetain();
          v179 = v203;
          while (1)
          {
            sub_247E1A648((uint64_t)&v227, v177, v174);
            if (v179)
              goto LABEL_151;
            v177 += v178;
            if (!--v176)
            {
              v203 = 0;
              swift_release_n();
              swift_bridgeObjectRelease();
              v180 = v227;
              goto LABEL_131;
            }
          }
        }
        swift_release();
        v180 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_131:
        v173 = swift_allocObject();
        *(_QWORD *)(v173 + 16) = v180;
      }
      else
      {
        v172 = sub_247DFF854(MEMORY[0x24BEE4AF8]);
        v173 = swift_allocObject();
        *(_QWORD *)(v173 + 16) = v172;
      }
      swift_release();
      swift_setDeallocating();
      v181 = v156 + OBJC_IVAR____TtC4Tabi19AbstractComputation_identifier;
      v182 = sub_247E81CE4();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v182 - 8) + 8))(v181, v182);
      sub_247E819E0(v156 + OBJC_IVAR____TtC4Tabi19AbstractComputation_modelIOSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_deallocClassInstance();
      *v192 = v173;
      sub_247E819E0((uint64_t)v191, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
      return swift_bridgeObjectRelease();
    }
    v126 = *(_QWORD *)(v221 + 8 * v31);
    if (v126)
    {
LABEL_97:
      v30 = (v126 - 1) & v126;
      v125 = __clz(__rbit64(v126)) + (v31 << 6);
LABEL_98:
      v128 = (uint64_t *)(v223[6] + 16 * v125);
      v130 = *v128;
      v129 = v128[1];
      v131 = *(_QWORD *)(v19 + 72);
      v132 = v209;
      v133 = (uint64_t)v209 + *(int *)(v216 + 48);
      sub_247E8191C(v223[7] + v131 * v125, v133, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
      *v132 = v130;
      v132[1] = v129;
      v134 = v219;
      swift_beginAccess();
      sub_247E8191C(v133, v210, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
      swift_bridgeObjectRetain_n();
      v135 = swift_isUniquelyReferenced_nonNull_native();
      v227 = (_QWORD *)*v134;
      v136 = v227;
      *v134 = 0x8000000000000000;
      v138 = sub_247DBB6D4(v130, v129);
      v139 = v136[2];
      v140 = (v137 & 1) == 0;
      v141 = v139 + v140;
      if (__OFADD__(v139, v140))
        goto LABEL_143;
      v142 = v137;
      if (v136[3] < v141)
      {
        sub_247E2B82C(v141, v135);
        v143 = sub_247DBB6D4(v130, v129);
        if ((v142 & 1) != (v144 & 1))
          goto LABEL_150;
        v138 = v143;
        v145 = v227;
        if ((v142 & 1) == 0)
          goto LABEL_105;
LABEL_81:
        sub_247E81A1C(v210, v145[7] + v138 * v131, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
LABEL_82:
        *v219 = (uint64_t)v145;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_247E81960((uint64_t)v209, &qword_25445AD50);
        v19 = v217;
        continue;
      }
      if ((v135 & 1) != 0)
      {
        v145 = v227;
        if ((v137 & 1) != 0)
          goto LABEL_81;
      }
      else
      {
        sub_247E2CBC0();
        v145 = v227;
        if ((v142 & 1) != 0)
          goto LABEL_81;
      }
LABEL_105:
      v145[(v138 >> 6) + 8] |= 1 << v138;
      v146 = (uint64_t *)(v145[6] + 16 * v138);
      *v146 = v130;
      v146[1] = v129;
      sub_247E8199C(v210, v145[7] + v138 * v131, (uint64_t (*)(_QWORD))type metadata accessor for Feature);
      v147 = v145[2];
      v77 = __OFADD__(v147, 1);
      v148 = v147 + 1;
      if (v77)
        goto LABEL_144;
      v145[2] = v148;
      swift_bridgeObjectRetain();
      goto LABEL_82;
    }
    break;
  }
  v127 = v31 + 1;
  if (v31 + 1 >= v222)
    goto LABEL_113;
  v126 = *(_QWORD *)(v221 + 8 * v127);
  if (v126)
    goto LABEL_96;
  v127 = v31 + 2;
  if (v31 + 2 >= v222)
    goto LABEL_113;
  v126 = *(_QWORD *)(v221 + 8 * v127);
  if (v126)
    goto LABEL_96;
  v127 = v31 + 3;
  if (v31 + 3 >= v222)
    goto LABEL_113;
  v126 = *(_QWORD *)(v221 + 8 * v127);
  if (v126)
    goto LABEL_96;
  v127 = v31 + 4;
  if (v31 + 4 >= v222)
    goto LABEL_113;
  v126 = *(_QWORD *)(v221 + 8 * v127);
  if (v126)
  {
LABEL_96:
    v31 = v127;
    goto LABEL_97;
  }
  while (1)
  {
    v31 = v127 + 1;
    if (__OFADD__(v127, 1))
      break;
    if (v31 >= v222)
      goto LABEL_113;
    v126 = *(_QWORD *)(v221 + 8 * v31);
    ++v127;
    if (v126)
      goto LABEL_97;
  }
LABEL_148:
  __break(1u);
LABEL_149:
  swift_once();
LABEL_122:
  v168 = (id)qword_25445AD08;
  sub_247E82494();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v169 = swift_allocObject();
  *(_OWORD *)(v169 + 16) = xmmword_247E83230;
  *(_QWORD *)(v169 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v169 + 64) = sub_247DBCF64();
  *(_QWORD *)(v169 + 32) = v31;
  *(_QWORD *)(v169 + 40) = v30;
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  v170 = sub_247DFF854(MEMORY[0x24BEE4AF8]);
  v171 = swift_allocObject();
  *(_QWORD *)(v171 + 16) = v170;
  *v192 = v171;
  return swift_bridgeObjectRelease();
}

void SubGraphComputation.__allocating_init(modelIOSpec:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void SubGraphComputation.init(modelIOSpec:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_247E7F4A4()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SubGraphComputation.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC4Tabi19AbstractComputation_identifier;
  v2 = sub_247E81CE4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_247E819E0(v0 + OBJC_IVAR____TtC4Tabi19AbstractComputation_modelIOSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SubGraphComputation.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC4Tabi19AbstractComputation_identifier;
  v2 = sub_247E81CE4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_247E819E0(v0 + OBJC_IVAR____TtC4Tabi19AbstractComputation_modelIOSpec, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIOSpec);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_247E7F5E0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_247E828E4();
  swift_bridgeObjectRetain();
  sub_247E82284();
  v8 = sub_247E828FC();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_247E82854() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_247E82854() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_247E803A0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_247E7F78C(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    swift_retain();
    v8 = sub_247E825F0();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for AbstractComputation();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v21;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_247E825E4();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v16 = sub_247E7FA98(v7, result + 1);
    v22 = v16;
    if (*(_QWORD *)(v16 + 24) <= *(_QWORD *)(v16 + 16))
    {
      swift_retain();
      sub_247E7FFB8();
      v17 = v22;
    }
    else
    {
      v17 = v16;
      swift_retain();
    }
    sub_247E802C4(a2, v17);
    *v3 = v17;
    swift_bridgeObjectRelease();
    *a1 = a2;
  }
  else
  {
    sub_247E828E4();
    sub_247E81CE4();
    sub_247E81A7C((unint64_t *)&qword_25445A648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    swift_bridgeObjectRetain();
    sub_247E821DC();
    v10 = sub_247E828FC();
    v11 = -1 << *(_BYTE *)(v6 + 32);
    v12 = v10 & ~v11;
    if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
    {
      swift_retain();
      v13 = sub_247E81CCC();
      swift_release();
      if ((v13 & 1) != 0)
      {
LABEL_12:
        swift_release();
        swift_bridgeObjectRelease();
        *a1 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v12);
        swift_retain();
        return 0;
      }
      v14 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v14;
        if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          break;
        swift_retain();
        v15 = sub_247E81CCC();
        swift_release();
        if ((v15 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v23 = *v2;
    *v2 = 0x8000000000000000;
    v19 = swift_retain();
    sub_247E80538(v19, v12, isUniquelyReferenced_nonNull_native);
    *v2 = v23;
    swift_bridgeObjectRelease();
    *a1 = a2;
  }
  return 1;
}

uint64_t sub_247E7FA98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445ADE8);
    v2 = sub_247E82638();
    v15 = v2;
    sub_247E825D8();
    if (sub_247E825FC())
    {
      type metadata accessor for AbstractComputation();
      v3 = MEMORY[0x24BDCEA88];
      do
      {
        swift_dynamicCast();
        v2 = v15;
        if (*(_QWORD *)(v15 + 24) <= *(_QWORD *)(v15 + 16))
        {
          sub_247E7FFB8();
          v2 = v15;
        }
        sub_247E828E4();
        sub_247E81CE4();
        sub_247E81A7C((unint64_t *)&qword_25445A648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], v3);
        sub_247E821DC();
        result = sub_247E828FC();
        v5 = v2 + 56;
        v6 = -1 << *(_BYTE *)(v2 + 32);
        v7 = result & ~v6;
        v8 = v7 >> 6;
        if (((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
        {
          v9 = __clz(__rbit64((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v10 = 0;
          v11 = (unint64_t)(63 - v6) >> 6;
          do
          {
            if (++v8 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v12 = v8 == v11;
            if (v8 == v11)
              v8 = 0;
            v10 |= v12;
            v13 = *(_QWORD *)(v5 + 8 * v8);
          }
          while (v13 == -1);
          v9 = __clz(__rbit64(~v13)) + (v8 << 6);
        }
        *(_QWORD *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v9) = v14;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_247E825FC());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_247E7FCDC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257707470);
  v3 = sub_247E8262C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_247E828E4();
      sub_247E82284();
      result = sub_247E828FC();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_247E7FFB8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445ADE8);
  v2 = sub_247E8262C();
  v3 = v2;
  if (*(_QWORD *)(v1 + 16))
  {
    v4 = 1 << *(_BYTE *)(v1 + 32);
    v26 = (_QWORD *)(v1 + 56);
    if (v4 < 64)
      v5 = ~(-1 << v4);
    else
      v5 = -1;
    v6 = v5 & *(_QWORD *)(v1 + 56);
    v7 = (unint64_t)(v4 + 63) >> 6;
    v8 = v2 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v6)
      {
        v12 = __clz(__rbit64(v6));
        v6 &= v6 - 1;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v7)
          goto LABEL_33;
        v15 = v26[v14];
        ++v10;
        if (!v15)
        {
          v10 = v14 + 1;
          if (v14 + 1 >= v7)
            goto LABEL_33;
          v15 = v26[v10];
          if (!v15)
          {
            v10 = v14 + 2;
            if (v14 + 2 >= v7)
              goto LABEL_33;
            v15 = v26[v10];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v7)
              {
LABEL_33:
                swift_release();
                v25 = 1 << *(_BYTE *)(v1 + 32);
                if (v25 > 63)
                  bzero(v26, ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v26 = -1 << v25;
                *(_QWORD *)(v1 + 16) = 0;
                break;
              }
              v15 = v26[v16];
              if (!v15)
              {
                while (1)
                {
                  v10 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_39;
                  if (v10 >= v7)
                    goto LABEL_33;
                  v15 = v26[v10];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v10 = v16;
            }
          }
        }
LABEL_23:
        v6 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v13);
      sub_247E828E4();
      sub_247E81CE4();
      sub_247E81A7C((unint64_t *)&qword_25445A648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_247E821DC();
      result = sub_247E828FC();
      v18 = -1 << *(_BYTE *)(v3 + 32);
      v19 = result & ~v18;
      v20 = v19 >> 6;
      if (((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v21 = 0;
        v22 = (unint64_t)(63 - v18) >> 6;
        do
        {
          if (++v20 == v22 && (v21 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v23 = v20 == v22;
          if (v20 == v22)
            v20 = 0;
          v21 |= v23;
          v24 = *(_QWORD *)(v8 + 8 * v20);
        }
        while (v24 == -1);
        v11 = __clz(__rbit64(~v24)) + (v20 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v17;
      ++*(_QWORD *)(v3 + 16);
    }
  }
  result = swift_release();
  *v0 = v3;
  return result;
}

unint64_t sub_247E802C4(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_247E828E4();
  sub_247E81CE4();
  sub_247E81A7C((unint64_t *)&qword_25445A648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_247E821DC();
  sub_247E828FC();
  result = sub_247E825CC();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_247E803A0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_247E7FCDC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_247E80728();
      goto LABEL_22;
    }
    sub_247E80A80();
  }
  v11 = *v4;
  sub_247E828E4();
  sub_247E82284();
  result = sub_247E828FC();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_247E82854(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_247E82878();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_247E82854();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_247E80538(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_247E7FFB8();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_247E808D8();
      goto LABEL_14;
    }
    sub_247E80D2C();
  }
  v9 = *v3;
  sub_247E828E4();
  sub_247E81CE4();
  sub_247E81A7C((unint64_t *)&qword_25445A648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_247E821DC();
  result = sub_247E828FC();
  v10 = -1 << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    type metadata accessor for AbstractComputation();
    swift_retain();
    v11 = sub_247E81CCC();
    result = swift_release();
    if ((v11 & 1) != 0)
    {
LABEL_13:
      result = sub_247E82878();
      __break(1u);
    }
    else
    {
      v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        swift_retain();
        v13 = sub_247E81CCC();
        result = swift_release();
        if ((v13 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v14 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v14 + 48) + 8 * a2) = v6;
  v15 = *(_QWORD *)(v14 + 16);
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    *(_QWORD *)(v14 + 16) = v17;
  return result;
}

void *sub_247E80728()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257707470);
  v2 = *v0;
  v3 = sub_247E82620();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_247E808D8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445ADE8);
  v2 = *v0;
  v3 = sub_247E82620();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = (void *)swift_retain();
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_247E80A80()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257707470);
  v3 = sub_247E8262C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_247E828E4();
    swift_bridgeObjectRetain();
    sub_247E82284();
    result = sub_247E828FC();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_247E80D2C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445ADE8);
  v3 = sub_247E8262C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v25 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v26 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v26)
      goto LABEL_33;
    v15 = *(_QWORD *)(v25 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v26)
        goto LABEL_33;
      v15 = *(_QWORD *)(v25 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v26)
          goto LABEL_33;
        v15 = *(_QWORD *)(v25 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
    sub_247E828E4();
    sub_247E81CE4();
    sub_247E81A7C((unint64_t *)&qword_25445A648, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    swift_retain();
    sub_247E821DC();
    result = sub_247E828FC();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v23 = v20 == v22;
        if (v20 == v22)
          v20 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
    ++*(_QWORD *)(v4 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v26)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v25 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v26)
      goto LABEL_33;
    v15 = *(_QWORD *)(v25 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_247E81028(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_247E810B0(unint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v7;
  uint64_t v9;
  uint64_t v11;

  if (a1 >> 62)
    goto LABEL_16;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v7)
    return swift_bridgeObjectRelease();
  while (1)
  {
    while (__OFSUB__(v7--, 1))
    {
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      swift_bridgeObjectRetain();
      v7 = sub_247E82734();
      if (!v7)
        return swift_bridgeObjectRelease();
    }
    if ((a1 & 0xC000000000000001) != 0)
    {
      v9 = MEMORY[0x249592908](v7, a1);
      goto LABEL_9;
    }
    if ((v7 & 0x8000000000000000) != 0)
      goto LABEL_14;
    if (v7 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_15;
    v9 = *(_QWORD *)(a1 + 32 + 8 * v7);
    swift_retain();
LABEL_9:
    v11 = v9;
    sub_247E7DA10(&v11, a2, a3);
    if (v3)
      break;
    swift_release();
    if (!v7)
      return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_247E811DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD v23[2];
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v7 = type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (_QWORD *)((char *)v23 - v12);
  result = MEMORY[0x24BEE4AF8];
  v26 = MEMORY[0x24BEE4AF8];
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v23[1] = v3;
    v16 = *(_QWORD *)(v11 + 72);
    v25 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v17 = a1 + v25;
    v18 = MEMORY[0x24BEE4AF8];
    v24 = a2;
    do
    {
      sub_247E8191C(v17, (uint64_t)v13, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
      v19 = *v13 == a2 && v13[1] == a3;
      if (v19 || (sub_247E82854() & 1) != 0)
      {
        v20 = a3;
        sub_247E8199C((uint64_t)v13, (uint64_t)v10, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_247DFC3F0(0, *(_QWORD *)(v18 + 16) + 1, 1);
        v18 = v26;
        v22 = *(_QWORD *)(v26 + 16);
        v21 = *(_QWORD *)(v26 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_247DFC3F0(v21 > 1, v22 + 1, 1);
          v18 = v26;
        }
        *(_QWORD *)(v18 + 16) = v22 + 1;
        sub_247E8199C((uint64_t)v10, v18 + v25 + v22 * v16, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
        a3 = v20;
        a2 = v24;
      }
      else
      {
        sub_247E819E0((uint64_t)v13, type metadata accessor for Com_Apple_News_Algorithms_Proto_Model_ModelIO);
      }
      v17 += v16;
      --v15;
    }
    while (v15);
    return v26;
  }
  return result;
}

uint64_t _s4Tabi19SubGraphComputationC12buildAndCall06globalC011boundInputs16requestedOutputsAA8FeaturesCAA06GlobalC0V_AISaySSGtFZ_0(uint64_t *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  char *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  os_signpost_type_t v35;
  os_signpost_id_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;

  v6 = sub_247E82008();
  v47 = *(_QWORD *)(v6 - 8);
  v48 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v42 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_247E8202C();
  v45 = *(_QWORD *)(v8 - 8);
  v46 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v43 = a1[1];
  v44 = v11;
  if (qword_254458F78 != -1)
    swift_once();
  v12 = (id)qword_25445AD08;
  sub_247E82014();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445B070);
  v13 = swift_allocObject();
  v40 = v10;
  v14 = (_QWORD *)v13;
  *(_OWORD *)(v13 + 16) = xmmword_247E83500;
  v15 = v12;
  v16 = MEMORY[0x24BEE0D00];
  v17 = MEMORY[0x2495925B4](a3, MEMORY[0x24BEE0D00]);
  v19 = v18;
  v14[7] = v16;
  v20 = sub_247DBCF64();
  v14[8] = v20;
  v14[4] = v17;
  v14[5] = v19;
  swift_beginAccess();
  type metadata accessor for Feature();
  swift_bridgeObjectRetain();
  v21 = sub_247E821B8();
  v22 = a2;
  v24 = v23;
  swift_bridgeObjectRelease();
  v14[12] = v16;
  v14[13] = v20;
  v14[9] = v21;
  v14[10] = v24;
  sub_247E824A0();
  sub_247E81FE4();

  swift_bridgeObjectRelease();
  sub_247E82020();
  v25 = v42;
  sub_247E81FF0();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v26 = (uint8_t *)swift_slowAlloc();
  v27 = swift_slowAlloc();
  v41 = v27;
  *(_DWORD *)v26 = 136446210;
  v49 = 0;
  v50 = 0xE000000000000000;
  v51 = v27;
  sub_247E82650();
  swift_bridgeObjectRelease();
  v49 = 0x3D737475706E69;
  v50 = 0xE700000000000000;
  v28 = (void *)objc_opt_self();
  v29 = swift_bridgeObjectRetain();
  sub_247E2B4C4(v29);
  swift_bridgeObjectRelease();
  v30 = (void *)sub_247E82308();
  swift_release();
  v31 = objc_msgSend(v28, sel_localizedStringByJoiningStrings_, v30);

  sub_247E82224();
  sub_247E8229C();
  swift_bridgeObjectRelease();
  sub_247E8229C();
  MEMORY[0x2495925B4](a3, v16);
  sub_247E8229C();
  swift_bridgeObjectRelease();
  v49 = sub_247E1FAE0(v49, v50, &v51);
  sub_247E8256C();
  swift_bridgeObjectRelease_n();
  swift_release_n();
  swift_bridgeObjectRelease();
  v32 = v40;
  v33 = sub_247E82020();
  LOBYTE(v30) = sub_247E82524();
  v34 = sub_247E81FFC();
  _os_signpost_emit_with_name_impl(&dword_247DB8000, v33, (os_signpost_type_t)v30, v34, "SubGraphComputation.buildAndCall", "%{public}s", v26, 0xCu);
  sub_247E7DD90(a3, v44, v43, v22, &v49);
  v35 = sub_247E82518();
  v36 = sub_247E81FFC();
  _os_signpost_emit_with_name_impl(&dword_247DB8000, v33, v35, v36, "SubGraphComputation.buildAndCall", "%{public}s", v26, 0xCu);

  v37 = v49;
  v38 = v41;
  swift_arrayDestroy();
  MEMORY[0x249593160](v38, -1, -1);
  MEMORY[0x249593160](v26, -1, -1);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v25, v48);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v46);
  return v37;
}

uint64_t sub_247E81884()
{
  return type metadata accessor for SubGraphComputation();
}

uint64_t type metadata accessor for SubGraphComputation()
{
  uint64_t result;

  result = qword_25445A938;
  if (!qword_25445A938)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247E818C8()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for SubGraphComputation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SubGraphComputation.__allocating_init(modelIOSpec:graph:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_247E8191C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247E81960(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247E8199C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_247E819E0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247E81A1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

void sub_247E81A60(uint64_t a1)
{
  uint64_t v1;

  sub_247E00B40(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_247E81A7C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495930AC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247E81ABC()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_247E81AC8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_247E81AD4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_247E81AE0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_247E81AEC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_247E81AF8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_247E81B04()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_247E81B10()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_247E81B1C()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_247E81B28()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_247E81B34()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_247E81B40()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_247E81B4C()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_247E81B58()
{
  return MEMORY[0x24BDCC710]();
}

uint64_t sub_247E81B64()
{
  return MEMORY[0x24BDCC738]();
}

uint64_t sub_247E81B70()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_247E81B7C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_247E81B88()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_247E81B94()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_247E81BA0()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_247E81BAC()
{
  return MEMORY[0x24BDCD830]();
}

uint64_t sub_247E81BB8()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_247E81BC4()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_247E81BD0()
{
  return MEMORY[0x24BDCD888]();
}

uint64_t sub_247E81BDC()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_247E81BE8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_247E81BF4()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_247E81C00()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_247E81C0C()
{
  return MEMORY[0x24BDCD948]();
}

uint64_t sub_247E81C18()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_247E81C24()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_247E81C30()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_247E81C3C()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_247E81C48()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_247E81C54()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_247E81C60()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_247E81C6C()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_247E81C78()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_247E81C84()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_247E81C90()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_247E81C9C()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_247E81CA8()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_247E81CB4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_247E81CC0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_247E81CCC()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_247E81CD8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_247E81CE4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_247E81CF0()
{
  return MEMORY[0x24BDC5A00]();
}

uint64_t sub_247E81CFC()
{
  return MEMORY[0x24BDC5BC0]();
}

uint64_t sub_247E81D08()
{
  return MEMORY[0x24BDC5BC8]();
}

uint64_t sub_247E81D14()
{
  return MEMORY[0x24BDC5E78]();
}

uint64_t sub_247E81D20()
{
  return MEMORY[0x24BDC5E80]();
}

uint64_t sub_247E81D2C()
{
  return MEMORY[0x24BDC5E88]();
}

uint64_t sub_247E81D38()
{
  return MEMORY[0x24BDC5E90]();
}

uint64_t sub_247E81D44()
{
  return MEMORY[0x24BDC5E98]();
}

uint64_t sub_247E81D50()
{
  return MEMORY[0x24BDC5EA0]();
}

uint64_t sub_247E81D5C()
{
  return MEMORY[0x24BDC5EB0]();
}

uint64_t sub_247E81D68()
{
  return MEMORY[0x24BDC5EF0]();
}

uint64_t sub_247E81D74()
{
  return MEMORY[0x24BDC5F00]();
}

uint64_t sub_247E81D80()
{
  return MEMORY[0x24BDC6010]();
}

uint64_t sub_247E81D8C()
{
  return MEMORY[0x24BE5BE78]();
}

uint64_t sub_247E81D98()
{
  return MEMORY[0x24BE5BEC0]();
}

uint64_t sub_247E81DA4()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t _s4Tabi62Com_Apple_News_Algorithms_Proto_Tokenizer_SplitterStrategyTypeVACycfC_0()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_247E81DBC()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_247E81DC8()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_247E81DD4()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_247E81DE0()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_247E81DEC()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_247E81DF8()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_247E81E04()
{
  return MEMORY[0x24BE5C028]();
}

uint64_t sub_247E81E10()
{
  return MEMORY[0x24BE5C030]();
}

uint64_t sub_247E81E1C()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_247E81E28()
{
  return MEMORY[0x24BE5C048]();
}

uint64_t sub_247E81E34()
{
  return MEMORY[0x24BE5C068]();
}

uint64_t sub_247E81E40()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_247E81E4C()
{
  return MEMORY[0x24BE5C088]();
}

uint64_t sub_247E81E58()
{
  return MEMORY[0x24BE5C090]();
}

uint64_t sub_247E81E64()
{
  return MEMORY[0x24BE5C0A8]();
}

uint64_t sub_247E81E70()
{
  return MEMORY[0x24BE5C0B8]();
}

uint64_t sub_247E81E7C()
{
  return MEMORY[0x24BE5C0C8]();
}

uint64_t sub_247E81E88()
{
  return MEMORY[0x24BE5C0D8]();
}

uint64_t sub_247E81E94()
{
  return MEMORY[0x24BE5C0E8]();
}

uint64_t sub_247E81EA0()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t sub_247E81EAC()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_247E81EB8()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_247E81EC4()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_247E81ED0()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_247E81EDC()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_247E81EE8()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_247E81EF4()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_247E81F00()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_247E81F0C()
{
  return MEMORY[0x24BE5C210]();
}

uint64_t sub_247E81F18()
{
  return MEMORY[0x24BE5C218]();
}

uint64_t sub_247E81F24()
{
  return MEMORY[0x24BE5C238]();
}

uint64_t sub_247E81F30()
{
  return MEMORY[0x24BE5C240]();
}

uint64_t sub_247E81F3C()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t sub_247E81F48()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_247E81F54()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t sub_247E81F60()
{
  return MEMORY[0x24BE5C2A0]();
}

uint64_t sub_247E81F6C()
{
  return MEMORY[0x24BE5C2A8]();
}

uint64_t sub_247E81F78()
{
  return MEMORY[0x24BE5C2B0]();
}

uint64_t sub_247E81F84()
{
  return MEMORY[0x24BE5C2C0]();
}

uint64_t sub_247E81F90()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_247E81F9C()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_247E81FA8()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_247E81FB4()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_247E81FC0()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_247E81FCC()
{
  return MEMORY[0x24BE5C348]();
}

uint64_t sub_247E81FD8()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_247E81FE4()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_247E81FF0()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_247E81FFC()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_247E82008()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_247E82014()
{
  return MEMORY[0x24BEE77B0]();
}

uint64_t sub_247E82020()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_247E8202C()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_247E82038()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_247E82044()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_247E82050()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_247E8205C()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_247E82068()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_247E82074()
{
  return MEMORY[0x24BDBFC08]();
}

uint64_t sub_247E82080()
{
  return MEMORY[0x24BDBFC20]();
}

uint64_t sub_247E8208C()
{
  return MEMORY[0x24BDBFC50]();
}

uint64_t sub_247E82098()
{
  return MEMORY[0x24BDBFC60]();
}

uint64_t sub_247E820A4()
{
  return MEMORY[0x24BDBFCC0]();
}

uint64_t sub_247E820B0()
{
  return MEMORY[0x24BDBFDA0]();
}

uint64_t sub_247E820BC()
{
  return MEMORY[0x24BDBFDB8]();
}

uint64_t sub_247E820C8()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_247E820D4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_247E820E0()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_247E820EC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_247E820F8()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_247E82104()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_247E82110()
{
  return MEMORY[0x24BEE5558]();
}

uint64_t sub_247E8211C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_247E82128()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_247E82134()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_247E82140()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_247E8214C()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_247E82158()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_247E82164()
{
  return MEMORY[0x24BDC6B60]();
}

uint64_t sub_247E82170()
{
  return MEMORY[0x24BDC6B78]();
}

uint64_t sub_247E8217C()
{
  return MEMORY[0x24BDC6B80]();
}

uint64_t sub_247E82188()
{
  return MEMORY[0x24BDC6BA8]();
}

uint64_t sub_247E82194()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_247E821A0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_247E821AC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_247E821B8()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_247E821C4()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_247E821D0()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t sub_247E821DC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_247E821E8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_247E821F4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_247E82200()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_247E8220C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_247E82218()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_247E82224()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_247E82230()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_247E8223C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_247E82248()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_247E82254()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_247E82260()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_247E8226C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_247E82278()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_247E82284()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247E82290()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_247E8229C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247E822A8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247E822B4()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_247E822C0()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_247E822CC()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_247E822D8()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_247E822E4()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_247E822F0()
{
  return MEMORY[0x24BEE0F18]();
}

uint64_t sub_247E822FC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_247E82308()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_247E82314()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_247E82320()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_247E8232C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_247E82338()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_247E82344()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_247E82350()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_247E8235C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_247E82368()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_247E82374()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_247E82380()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_247E8238C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_247E82398()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_247E823A4()
{
  return MEMORY[0x24BEE15A8]();
}

uint64_t sub_247E823B0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_247E823BC()
{
  return MEMORY[0x24BEE15F8]();
}

uint64_t sub_247E823C8()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_247E823D4()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_247E823E0()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_247E823EC()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_247E823F8()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_247E82404()
{
  return MEMORY[0x24BDCFD18]();
}

uint64_t sub_247E82410()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_247E8241C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_247E82428()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_247E82434()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_247E82440()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_247E8244C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_247E82458()
{
  return MEMORY[0x24BDBFE88]();
}

uint64_t sub_247E82464()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_247E82470()
{
  return MEMORY[0x24BDCFF40]();
}

uint64_t sub_247E8247C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_247E82488()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_247E82494()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_247E824A0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_247E824AC()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_247E824B8()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_247E824C4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_247E824D0()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_247E824DC()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_247E824E8()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_247E824F4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_247E82500()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_247E8250C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_247E82518()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_247E82524()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_247E82530()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_247E8253C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_247E82548()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_247E82554()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_247E82560()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_247E8256C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_247E82578()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_247E82584()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_247E82590()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_247E8259C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_247E825A8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_247E825B4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_247E825C0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_247E825CC()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_247E825D8()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_247E825E4()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_247E825F0()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_247E825FC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_247E82608()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_247E82614()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_247E82620()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_247E8262C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_247E82638()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_247E82644()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_247E82650()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_247E8265C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_247E82668()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_247E82674()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247E82680()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_247E8268C()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_247E82698()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_247E826A4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_247E826B0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_247E826BC()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_247E826C8()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_247E826D4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_247E826E0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_247E826EC()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_247E826F8()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_247E82704()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_247E82710()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_247E8271C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_247E82728()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_247E82734()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247E82740()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_247E8274C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_247E82758()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_247E82764()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_247E82770()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_247E8277C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_247E82788()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_247E82794()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_247E827A0()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_247E827AC()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_247E827B8()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_247E827C4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_247E827D0()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_247E827DC()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_247E827E8()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_247E827F4()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_247E82800()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_247E8280C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_247E82818()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_247E82824()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247E82830()
{
  return MEMORY[0x24BEE3910]();
}

uint64_t sub_247E8283C()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_247E82848()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_247E82854()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247E82860()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_247E8286C()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_247E82878()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_247E82884()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_247E82890()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_247E8289C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247E828A8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_247E828B4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_247E828C0()
{
  return MEMORY[0x24BDD0730]();
}

uint64_t sub_247E828CC()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_247E828D8()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_247E828E4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247E828F0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247E828FC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_247E82908()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_247E82914()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_247E82920()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_247E8292C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x24BE0FA58]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x24BE0FA68]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x24BE0FA70]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x24BE0FA80]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x24BE0FA90]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x24BE0FAA8]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x24BE0FAB0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D0](__A, __IA, __B, __IB, __C, __N);
}

