char *sub_2453645F0(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  int v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char *v55;
  int *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, char *, uint64_t);
  unsigned int (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;

  if (a1 != a2)
  {
    sub_2452B7B5C((uint64_t)a1, type metadata accessor for ReplicatorMessage);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v19 = sub_245387740();
      v20 = *(_QWORD *)(v19 - 8);
      v21 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
      v21(a1, a2, v19);
      v22 = *(int *)(type metadata accessor for ReplicatorMessage.Sync(0) + 20);
      v23 = &a1[v22];
      v24 = &a2[v22];
      v25 = *(_OWORD *)&a2[v22 + 16];
      *(_OWORD *)v23 = *(_OWORD *)&a2[v22];
      *((_OWORD *)v23 + 1) = v25;
      *((_OWORD *)v23 + 2) = *(_OWORD *)&a2[v22 + 32];
      v26 = type metadata accessor for Record.ID(0);
      v27 = *(int *)(v26 + 24);
      v28 = &v23[v27];
      v29 = &v24[v27];
      v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
      v69 = v20;
      v70 = v21;
      if (v71(&v24[v27], 1, v19))
      {
        v30 = type metadata accessor for Record.ID.Ownership(0);
        memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
      }
      else
      {
        v21(v28, v29, v19);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v28, 0, 1, v19);
      }
      *(_OWORD *)&v23[*(int *)(v26 + 28)] = *(_OWORD *)&v24[*(int *)(v26 + 28)];
      v72 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord(0);
      v31 = *(int *)(v72 + 20);
      v32 = &v23[v31];
      v33 = &v24[v31];
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
      v35 = *(_QWORD *)(v34 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
      {
        v36 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
        memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
        v37 = v72;
      }
      else
      {
        v67 = v34;
        v68 = v35;
        v38 = *((_OWORD *)v33 + 1);
        *(_OWORD *)v32 = *(_OWORD *)v33;
        *((_OWORD *)v32 + 1) = v38;
        *((_OWORD *)v32 + 2) = *((_OWORD *)v33 + 2);
        v39 = *(int *)(v26 + 24);
        v40 = &v32[v39];
        v41 = &v33[v39];
        if (v71(&v33[v39], 1, v19))
        {
          v42 = type metadata accessor for Record.ID.Ownership(0);
          memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
          v43 = v70;
        }
        else
        {
          v55 = v41;
          v43 = v70;
          v70(v40, v55, v19);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v69 + 56))(v40, 0, 1, v19);
        }
        *(_OWORD *)&v32[*(int *)(v26 + 28)] = *(_OWORD *)&v33[*(int *)(v26 + 28)];
        v56 = (int *)type metadata accessor for RecordMetadata();
        v43(&v32[v56[5]], &v33[v56[5]], v19);
        *(_QWORD *)&v32[v56[6]] = *(_QWORD *)&v33[v56[6]];
        v57 = v56[7];
        v58 = &v32[v57];
        v59 = &v33[v57];
        v60 = sub_2453876EC();
        v61 = *(_QWORD *)(v60 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48))(v59, 1, v60))
        {
          v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
          memcpy(v58, v59, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v58, v59, v60);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v58, 0, 1, v60);
        }
        v37 = v72;
        *(_OWORD *)&v32[*(int *)(v67 + 48)] = *(_OWORD *)&v33[*(int *)(v67 + 48)];
        (*(void (**)(char *, _QWORD, uint64_t))(v68 + 56))(v32, 0, 1);
      }
      v63 = *(int *)(v37 + 24);
      v64 = &v23[v63];
      v65 = &v24[v63];
      *(_QWORD *)v64 = *(_QWORD *)v65;
      v64[8] = v65[8];
      goto LABEL_25;
    }
    if (!EnumCaseMultiPayload)
    {
      type metadata accessor for ReplicatorMessage.Handshake(0);
      v7 = swift_getEnumCaseMultiPayload();
      if (v7 == 2)
      {
        v44 = sub_245387740();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 32))(a1, a2, v44);
        v45 = type metadata accessor for ReplicatorMessage.Handshake.Complete(0);
        *(_OWORD *)&a1[*(int *)(v45 + 20)] = *(_OWORD *)&a2[*(int *)(v45 + 20)];
        *(_QWORD *)&a1[*(int *)(v45 + 24)] = *(_QWORD *)&a2[*(int *)(v45 + 24)];
      }
      else
      {
        if (v7 == 1)
        {
          v8 = sub_245387740();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
          v9 = (int *)type metadata accessor for ReplicatorMessage.Handshake.Response(0);
          *(_OWORD *)&a1[v9[5]] = *(_OWORD *)&a2[v9[5]];
          v10 = v9[6];
          v11 = &a1[v10];
          v12 = &a2[v10];
          v13 = *((_OWORD *)v12 + 1);
          *(_OWORD *)v11 = *(_OWORD *)v12;
          *((_OWORD *)v11 + 1) = v13;
          v14 = *((_OWORD *)v12 + 5);
          *((_OWORD *)v11 + 4) = *((_OWORD *)v12 + 4);
          *((_OWORD *)v11 + 5) = v14;
          v15 = *((_OWORD *)v12 + 3);
          *((_OWORD *)v11 + 2) = *((_OWORD *)v12 + 2);
          *((_OWORD *)v11 + 3) = v15;
          v16 = *((_OWORD *)v12 + 9);
          *((_OWORD *)v11 + 8) = *((_OWORD *)v12 + 8);
          *((_OWORD *)v11 + 9) = v16;
          v17 = *((_OWORD *)v12 + 7);
          *((_OWORD *)v11 + 6) = *((_OWORD *)v12 + 6);
          *((_OWORD *)v11 + 7) = v17;
          *(_QWORD *)&a1[v9[7]] = *(_QWORD *)&a2[v9[7]];
          v18 = v9 + 8;
LABEL_18:
          *(_QWORD *)&a1[*v18] = *(_QWORD *)&a2[*v18];
          swift_storeEnumTagMultiPayload();
LABEL_25:
          swift_storeEnumTagMultiPayload();
          return a1;
        }
        v46 = sub_245387740();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v46 - 8) + 32))(a1, a2, v46);
        v45 = type metadata accessor for ReplicatorMessage.Handshake.Request(0);
        *(_OWORD *)&a1[*(int *)(v45 + 20)] = *(_OWORD *)&a2[*(int *)(v45 + 20)];
        v47 = *(int *)(v45 + 24);
        v48 = &a1[v47];
        v49 = &a2[v47];
        v50 = *((_OWORD *)v49 + 7);
        *((_OWORD *)v48 + 6) = *((_OWORD *)v49 + 6);
        *((_OWORD *)v48 + 7) = v50;
        v51 = *((_OWORD *)v49 + 9);
        *((_OWORD *)v48 + 8) = *((_OWORD *)v49 + 8);
        *((_OWORD *)v48 + 9) = v51;
        v52 = *((_OWORD *)v49 + 3);
        *((_OWORD *)v48 + 2) = *((_OWORD *)v49 + 2);
        *((_OWORD *)v48 + 3) = v52;
        v53 = *((_OWORD *)v49 + 5);
        *((_OWORD *)v48 + 4) = *((_OWORD *)v49 + 4);
        *((_OWORD *)v48 + 5) = v53;
        v54 = *((_OWORD *)v49 + 1);
        *(_OWORD *)v48 = *(_OWORD *)v49;
        *((_OWORD *)v48 + 1) = v54;
      }
      v18 = (int *)(v45 + 28);
      goto LABEL_18;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_245364AEC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for ReplicatorMessage.Handshake(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for ReplicatorMessage.Sync(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_245364B6C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, char *, uint64_t);
  char *v67;
  char *v68;
  int *__dst;
  char *__dsta;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245387740();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = *(int *)(a3 + 20);
    v11 = (uint64_t *)((char *)a1 + v10);
    v12 = (char *)a2 + v10;
    v13 = *(uint64_t *)((char *)a2 + v10 + 8);
    *v11 = *(uint64_t *)((char *)a2 + v10);
    v11[1] = v13;
    v14 = *(uint64_t *)((char *)a2 + v10 + 24);
    v11[2] = *(uint64_t *)((char *)a2 + v10 + 16);
    v11[3] = v14;
    v15 = *(uint64_t *)((char *)a2 + v10 + 40);
    v11[4] = *(uint64_t *)((char *)a2 + v10 + 32);
    v11[5] = v15;
    v68 = (char *)a1 + v10;
    __dst = (int *)type metadata accessor for Record.ID(0);
    v16 = __dst[6];
    v17 = (char *)v11 + v16;
    v67 = v12;
    v18 = &v12[v16];
    v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v19(v18, 1, v7))
    {
      v20 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v17, (uint64_t *)v18, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v17, 0, 1, v7);
    }
    v22 = __dst[7];
    v23 = &v68[v22];
    v24 = &v67[v22];
    v25 = *((_QWORD *)v24 + 1);
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *((_QWORD *)v23 + 1) = v25;
    v26 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord(0);
    v27 = *(int *)(v26 + 20);
    v28 = &v68[v27];
    v29 = &v67[v27];
    swift_bridgeObjectRetain();
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
    v31 = *(_QWORD *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
    {
      v32 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      v64 = v31;
      v65 = v26;
      v66 = (void (*)(char *, char *, uint64_t))v9;
      v63 = a1;
      v33 = *((_QWORD *)v29 + 1);
      *(_QWORD *)v28 = *(_QWORD *)v29;
      *((_QWORD *)v28 + 1) = v33;
      v34 = *((_QWORD *)v29 + 3);
      *((_QWORD *)v28 + 2) = *((_QWORD *)v29 + 2);
      *((_QWORD *)v28 + 3) = v34;
      v35 = *((_QWORD *)v29 + 5);
      *((_QWORD *)v28 + 4) = *((_QWORD *)v29 + 4);
      *((_QWORD *)v28 + 5) = v35;
      v36 = __dst[6];
      v37 = &v28[v36];
      v38 = &v29[v36];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v19(v38, 1, v7))
      {
        v39 = type metadata accessor for Record.ID.Ownership(0);
        memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      }
      else
      {
        v66(v37, v38, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v37, 0, 1, v7);
      }
      v40 = __dst[7];
      v41 = &v28[v40];
      v42 = &v29[v40];
      v43 = *((_QWORD *)v42 + 1);
      *(_QWORD *)v41 = *(_QWORD *)v42;
      *((_QWORD *)v41 + 1) = v43;
      v44 = (int *)type metadata accessor for RecordMetadata();
      v45 = v44[5];
      v46 = &v28[v45];
      v47 = &v29[v45];
      swift_bridgeObjectRetain();
      v66(v46, v47, v7);
      *(_QWORD *)&v28[v44[6]] = *(_QWORD *)&v29[v44[6]];
      v48 = v44[7];
      __dsta = &v28[v48];
      v49 = &v29[v48];
      v50 = sub_2453876EC();
      v51 = *(_QWORD *)(v50 - 8);
      v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
      swift_bridgeObjectRetain();
      if (v52(v49, 1, v50))
      {
        v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(__dsta, v49, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v51 + 16))(__dsta, v49, v50);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v51 + 56))(__dsta, 0, 1, v50);
      }
      a1 = v63;
      v54 = *(int *)(v30 + 48);
      v55 = (uint64_t *)&v28[v54];
      v56 = (uint64_t *)&v29[v54];
      v57 = *v56;
      v58 = v56[1];
      sub_245261C44(*v56, v58);
      *v55 = v57;
      v55[1] = v58;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v64 + 56))(v28, 0, 1, v30);
      v26 = v65;
    }
    v59 = *(int *)(v26 + 24);
    v60 = &v68[v59];
    v61 = &v67[v59];
    *(_QWORD *)v60 = *(_QWORD *)v61;
    v60[8] = v61[8];
  }
  return a1;
}

uint64_t sub_245364F50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = sub_245387740();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for Record.ID(0);
  v9 = v7 + *(int *)(v8 + 24);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v10(v9, 1, v4))
    v6(v9, v4);
  swift_bridgeObjectRelease();
  v11 = v7 + *(int *)(type metadata accessor for ReplicatorMessage.Sync.SyncRecord(0) + 20);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v11, 1, v12);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = v11 + *(int *)(v8 + 24);
    if (!v10(v14, 1, v4))
      v6(v14, v4);
    swift_bridgeObjectRelease();
    v15 = type metadata accessor for RecordMetadata();
    v6(v11 + *(int *)(v15 + 20), v4);
    swift_bridgeObjectRelease();
    v16 = v11 + *(int *)(v15 + 28);
    v17 = sub_2453876EC();
    v18 = *(_QWORD *)(v17 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    return sub_24525CB80(*(_QWORD *)(v11 + *(int *)(v12 + 48)), *(_QWORD *)(v11 + *(int *)(v12 + 48) + 8));
  }
  return result;
}

uint64_t sub_245365128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  const void *v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  int *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  int *__dst;
  char *__dsta;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v66 = a1;
  v10 = (_QWORD *)(a1 + v9);
  v11 = a2 + v9;
  v12 = *(_QWORD *)(a2 + v9 + 8);
  *v10 = *(_QWORD *)(a2 + v9);
  v10[1] = v12;
  v13 = *(_QWORD *)(a2 + v9 + 24);
  v10[2] = *(_QWORD *)(a2 + v9 + 16);
  v10[3] = v13;
  v14 = *(_QWORD *)(a2 + v9 + 40);
  v10[4] = *(_QWORD *)(a2 + v9 + 32);
  v10[5] = v14;
  __dst = (int *)type metadata accessor for Record.ID(0);
  v15 = __dst[6];
  v65 = v10;
  v16 = (char *)v10 + v15;
  v17 = (const void *)(v11 + v15);
  v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v64 = v7;
  if (v18(v17, 1, v6))
  {
    v19 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v16, (uint64_t)v17, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  }
  v20 = __dst[7];
  v21 = (_QWORD *)((char *)v65 + v20);
  v22 = (_QWORD *)(v11 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord(0);
  v25 = *(int *)(v24 + 20);
  v26 = (_QWORD *)((char *)v65 + v25);
  v27 = (_QWORD *)(v11 + v25);
  swift_bridgeObjectRetain();
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    v30 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    result = v66;
  }
  else
  {
    v61 = v29;
    v62 = v24;
    v63 = (void (*)(char *, char *, uint64_t))v8;
    v32 = v27[1];
    *v26 = *v27;
    v26[1] = v32;
    v33 = v27[3];
    v26[2] = v27[2];
    v26[3] = v33;
    v34 = v27[5];
    v26[4] = v27[4];
    v26[5] = v34;
    v35 = __dst[6];
    v36 = (char *)v26 + v35;
    v37 = (char *)v27 + v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v18(v37, 1, v6))
    {
      v38 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v63(v36, v37, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v64 + 56))(v36, 0, 1, v6);
    }
    v39 = __dst[7];
    v40 = (_QWORD *)((char *)v26 + v39);
    v41 = (_QWORD *)((char *)v27 + v39);
    v42 = v41[1];
    *v40 = *v41;
    v40[1] = v42;
    v43 = (int *)type metadata accessor for RecordMetadata();
    v44 = v43[5];
    v45 = (char *)v26 + v44;
    v46 = (char *)v27 + v44;
    swift_bridgeObjectRetain();
    v63(v45, v46, v6);
    *(_QWORD *)((char *)v26 + v43[6]) = *(_QWORD *)((char *)v27 + v43[6]);
    v47 = v43[7];
    __dsta = (char *)v26 + v47;
    v48 = (char *)v27 + v47;
    v49 = sub_2453876EC();
    v50 = *(_QWORD *)(v49 - 8);
    v51 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
    swift_bridgeObjectRetain();
    if (v51(v48, 1, v49))
    {
      v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(__dsta, v48, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v50 + 16))(__dsta, v48, v49);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(__dsta, 0, 1, v49);
    }
    v53 = *(int *)(v28 + 48);
    v54 = (_QWORD *)((char *)v26 + v53);
    v55 = (_QWORD *)((char *)v27 + v53);
    v56 = *v55;
    v57 = v55[1];
    sub_245261C44(*v55, v57);
    *v54 = v56;
    v54[1] = v57;
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v26, 0, 1, v28);
    result = v66;
    v24 = v62;
  }
  v58 = *(int *)(v24 + 24);
  v59 = (char *)v65 + v58;
  v60 = v11 + v58;
  *(_QWORD *)v59 = *(_QWORD *)v60;
  v59[8] = *(_BYTE *)(v60 + 8);
  return result;
}

uint64_t sub_2453654E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  int v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int v38;
  int v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  int *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  int *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(char *, uint64_t, uint64_t);
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = (char *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  *(_QWORD *)v10 = *(_QWORD *)(a2 + v9);
  *((_QWORD *)v10 + 1) = *(_QWORD *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v10 + 2) = v11[2];
  *((_QWORD *)v10 + 3) = v11[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v10 + 4) = v11[4];
  *((_QWORD *)v10 + 5) = v11[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v94 = type metadata accessor for Record.ID(0);
  v12 = *(int *)(v94 + 24);
  v13 = &v10[v12];
  v14 = (char *)v11 + v12;
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v16 = v15(&v10[v12], 1, v6);
  v17 = v15(v14, 1, v6);
  v91 = v7;
  v89 = v8;
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
LABEL_6:
    v18 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v13, (uint64_t)v14, v6);
LABEL_7:
  v19 = *(int *)(v94 + 28);
  v20 = &v10[v19];
  v21 = (_QWORD *)((char *)v11 + v19);
  *(_QWORD *)v20 = *v21;
  *((_QWORD *)v20 + 1) = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v93 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord(0);
  v22 = *(int *)(v93 + 20);
  v23 = &v10[v22];
  v24 = (char *)v11 + v22;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v90 = *(_QWORD *)(v25 - 8);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v90 + 48);
  v27 = v26(v23, 1, v25);
  v92 = v25;
  v28 = v26(v24, 1, v25);
  if (!v27)
  {
    if (v28)
    {
      sub_245263F80((uint64_t)v23, &qword_257452350);
      goto LABEL_13;
    }
    v88 = a1;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)v23 + 2) = *((_QWORD *)v24 + 2);
    *((_QWORD *)v23 + 3) = *((_QWORD *)v24 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)v23 + 4) = *((_QWORD *)v24 + 4);
    *((_QWORD *)v23 + 5) = *((_QWORD *)v24 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v35 = *(int *)(v94 + 24);
    v36 = &v23[v35];
    v37 = &v24[v35];
    v38 = v15(&v23[v35], 1, v6);
    v39 = v15(v37, 1, v6);
    if (v38)
    {
      v40 = (void (*)(char *, char *, uint64_t))v89;
      if (!v39)
      {
        (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v36, v37, v6);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v91 + 56))(v36, 0, 1, v6);
        goto LABEL_26;
      }
    }
    else
    {
      v40 = (void (*)(char *, char *, uint64_t))v89;
      if (!v39)
      {
        v89((uint64_t)v36, (uint64_t)v37, v6);
LABEL_26:
        v62 = *(int *)(v94 + 28);
        v63 = &v23[v62];
        v64 = &v24[v62];
        *(_QWORD *)v63 = *(_QWORD *)v64;
        *((_QWORD *)v63 + 1) = *((_QWORD *)v64 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v65 = (int *)type metadata accessor for RecordMetadata();
        v40(&v23[v65[5]], &v24[v65[5]], v6);
        *(_QWORD *)&v23[v65[6]] = *(_QWORD *)&v24[v65[6]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v66 = v65[7];
        v67 = &v23[v66];
        v68 = &v24[v66];
        v69 = sub_2453876EC();
        v70 = *(_QWORD *)(v69 - 8);
        v71 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 48);
        v72 = v71(v67, 1, v69);
        v73 = v71(v68, 1, v69);
        if (v72)
        {
          a1 = v88;
          if (!v73)
          {
            (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v67, v68, v69);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v70 + 56))(v67, 0, 1, v69);
LABEL_32:
            v75 = *(int *)(v92 + 48);
            v76 = (uint64_t *)&v23[v75];
            v77 = (uint64_t *)&v24[v75];
            v78 = *v77;
            v79 = v77[1];
            sub_245261C44(*v77, v79);
            v80 = *v76;
            v81 = v76[1];
            *v76 = v78;
            v76[1] = v79;
            sub_24525CB80(v80, v81);
            goto LABEL_33;
          }
        }
        else
        {
          a1 = v88;
          if (!v73)
          {
            (*(void (**)(char *, char *, uint64_t))(v70 + 24))(v67, v68, v69);
            goto LABEL_32;
          }
          (*(void (**)(char *, uint64_t))(v70 + 8))(v67, v69);
        }
        v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v67, v68, *(_QWORD *)(*(_QWORD *)(v74 - 8) + 64));
        goto LABEL_32;
      }
      (*(void (**)(char *, uint64_t))(v91 + 8))(v36, v6);
    }
    v61 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    goto LABEL_26;
  }
  if (v28)
  {
LABEL_13:
    v34 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    goto LABEL_33;
  }
  v87 = a1;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
  *((_QWORD *)v23 + 2) = *((_QWORD *)v24 + 2);
  *((_QWORD *)v23 + 3) = *((_QWORD *)v24 + 3);
  *((_QWORD *)v23 + 4) = *((_QWORD *)v24 + 4);
  *((_QWORD *)v23 + 5) = *((_QWORD *)v24 + 5);
  v29 = *(int *)(v94 + 24);
  v30 = &v23[v29];
  v31 = &v24[v29];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15(v31, 1, v6))
  {
    v32 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    v33 = v91;
  }
  else
  {
    v33 = v91;
    (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v30, v31, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v91 + 56))(v30, 0, 1, v6);
  }
  v41 = *(int *)(v94 + 28);
  v42 = &v23[v41];
  v43 = &v24[v41];
  *(_QWORD *)v42 = *(_QWORD *)v43;
  *((_QWORD *)v42 + 1) = *((_QWORD *)v43 + 1);
  v44 = (int *)type metadata accessor for RecordMetadata();
  v45 = v44[5];
  v46 = &v23[v45];
  v47 = &v24[v45];
  v48 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  swift_bridgeObjectRetain();
  v48(v46, v47, v6);
  *(_QWORD *)&v23[v44[6]] = *(_QWORD *)&v24[v44[6]];
  v49 = v44[7];
  v50 = &v23[v49];
  v51 = &v24[v49];
  v52 = sub_2453876EC();
  v53 = *(_QWORD *)(v52 - 8);
  v54 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48);
  swift_bridgeObjectRetain();
  if (v54(v51, 1, v52))
  {
    v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v50, v51, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v50, v51, v52);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v50, 0, 1, v52);
  }
  a1 = v87;
  v56 = *(int *)(v92 + 48);
  v57 = (uint64_t *)&v23[v56];
  v58 = (uint64_t *)&v24[v56];
  v59 = *v58;
  v60 = v58[1];
  sub_245261C44(*v58, v60);
  *v57 = v59;
  v57[1] = v60;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v90 + 56))(v23, 0, 1, v92);
LABEL_33:
  v82 = *(int *)(v93 + 24);
  v83 = &v10[v82];
  v84 = (char *)v11 + v82;
  v85 = *(_QWORD *)v84;
  v83[8] = v84[8];
  *(_QWORD *)v83 = v85;
  return a1;
}

uint64_t sub_245365BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(uint64_t, uint64_t, uint64_t);
  void (*v49)(uint64_t, uint64_t, uint64_t);

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = (_OWORD *)(a1 + v9);
  v11 = a2 + v9;
  v12 = *(_OWORD *)(a2 + v9 + 16);
  *v10 = *(_OWORD *)(a2 + v9);
  v10[1] = v12;
  v10[2] = *(_OWORD *)(a2 + v9 + 32);
  v13 = type metadata accessor for Record.ID(0);
  v14 = *(int *)(v13 + 24);
  v15 = (char *)v10 + v14;
  v16 = (const void *)(v11 + v14);
  v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v49 = v8;
  v47 = v7;
  if (v48(v11 + v14, 1, v6))
  {
    v17 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v15, (uint64_t)v16, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  *(_OWORD *)((char *)v10 + *(int *)(v13 + 28)) = *(_OWORD *)(v11 + *(int *)(v13 + 28));
  v18 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord(0);
  v19 = *(int *)(v18 + 20);
  v20 = (_OWORD *)((char *)v10 + v19);
  v21 = (_OWORD *)(v11 + v19);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v44 = v23;
    v45 = v18;
    v46 = a1;
    v25 = v21[1];
    *v20 = *v21;
    v20[1] = v25;
    v20[2] = v21[2];
    v26 = *(int *)(v13 + 24);
    v27 = (char *)v20 + v26;
    v28 = (char *)v21 + v26;
    if (v48((uint64_t)v21 + v26, 1, v6))
    {
      v29 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
      v30 = (void (*)(char *, char *, uint64_t))v49;
    }
    else
    {
      v31 = v28;
      v30 = (void (*)(char *, char *, uint64_t))v49;
      v49((uint64_t)v27, (uint64_t)v31, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v27, 0, 1, v6);
    }
    v32 = v22;
    *(_OWORD *)((char *)v20 + *(int *)(v13 + 28)) = *(_OWORD *)((char *)v21 + *(int *)(v13 + 28));
    v33 = (int *)type metadata accessor for RecordMetadata();
    v30((char *)v20 + v33[5], (char *)v21 + v33[5], v6);
    *(_QWORD *)((char *)v20 + v33[6]) = *(_QWORD *)((char *)v21 + v33[6]);
    v34 = v33[7];
    v35 = (char *)v20 + v34;
    v36 = (char *)v21 + v34;
    v37 = sub_2453876EC();
    v38 = *(_QWORD *)(v37 - 8);
    a1 = v46;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v35, v36, v37);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
    }
    *(_OWORD *)((char *)v20 + *(int *)(v32 + 48)) = *(_OWORD *)((char *)v21 + *(int *)(v32 + 48));
    v18 = v45;
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v20, 0, 1, v32);
  }
  v40 = *(int *)(v18 + 24);
  v41 = (char *)v10 + v40;
  v42 = v11 + v40;
  *(_QWORD *)v41 = *(_QWORD *)v42;
  v41[8] = *(_BYTE *)(v42 + 8);
  return a1;
}

uint64_t sub_245365F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(char *, uint64_t, uint64_t);
  int v33;
  int v34;
  __int128 v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  int v49;
  int v50;
  void (*v51)(char *, char *, uint64_t);
  int *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  int *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(char *, uint64_t, uint64_t);
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  void (*v82)(uint64_t, uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = (char *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  v12 = *(_QWORD *)(a2 + v9 + 8);
  *(_QWORD *)v10 = *(_QWORD *)(a2 + v9);
  *((_QWORD *)v10 + 1) = v12;
  swift_bridgeObjectRelease();
  v13 = v11[3];
  *((_QWORD *)v10 + 2) = v11[2];
  *((_QWORD *)v10 + 3) = v13;
  swift_bridgeObjectRelease();
  v14 = v11[5];
  *((_QWORD *)v10 + 4) = v11[4];
  *((_QWORD *)v10 + 5) = v14;
  swift_bridgeObjectRelease();
  v87 = type metadata accessor for Record.ID(0);
  v15 = *(int *)(v87 + 24);
  v16 = &v10[v15];
  v17 = (char *)v11 + v15;
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v19 = v18(&v10[v15], 1, v6);
  v20 = v18(v17, 1, v6);
  v85 = a1;
  v82 = v8;
  v83 = v7;
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
LABEL_6:
    v21 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v16, (uint64_t)v17, v6);
LABEL_7:
  v22 = *(int *)(v87 + 28);
  v23 = &v10[v22];
  v24 = (_QWORD *)((char *)v11 + v22);
  v26 = *v24;
  v25 = v24[1];
  *(_QWORD *)v23 = v26;
  *((_QWORD *)v23 + 1) = v25;
  swift_bridgeObjectRelease();
  v86 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord(0);
  v27 = *(int *)(v86 + 20);
  v28 = &v10[v27];
  v29 = (char *)v11 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
  v33 = v32(v28, 1, v30);
  v84 = v30;
  v34 = v32(v29, 1, v30);
  if (!v33)
  {
    if (v34)
    {
      sub_245263F80((uint64_t)v28, &qword_257452350);
      goto LABEL_13;
    }
    v43 = *((_QWORD *)v29 + 1);
    *(_QWORD *)v28 = *(_QWORD *)v29;
    *((_QWORD *)v28 + 1) = v43;
    swift_bridgeObjectRelease();
    v44 = *((_QWORD *)v29 + 3);
    *((_QWORD *)v28 + 2) = *((_QWORD *)v29 + 2);
    *((_QWORD *)v28 + 3) = v44;
    swift_bridgeObjectRelease();
    v45 = *((_QWORD *)v29 + 5);
    *((_QWORD *)v28 + 4) = *((_QWORD *)v29 + 4);
    *((_QWORD *)v28 + 5) = v45;
    swift_bridgeObjectRelease();
    v46 = *(int *)(v87 + 24);
    v47 = &v28[v46];
    v48 = &v29[v46];
    v49 = v18(&v28[v46], 1, v6);
    v50 = v18(v48, 1, v6);
    if (v49)
    {
      v51 = (void (*)(char *, char *, uint64_t))v82;
      if (!v50)
      {
        (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v47, v48, v6);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v83 + 56))(v47, 0, 1, v6);
        goto LABEL_26;
      }
    }
    else
    {
      v51 = (void (*)(char *, char *, uint64_t))v82;
      if (!v50)
      {
        v82((uint64_t)v47, (uint64_t)v48, v6);
LABEL_26:
        v60 = *(int *)(v87 + 28);
        v61 = &v28[v60];
        v62 = (uint64_t *)&v29[v60];
        v64 = *v62;
        v63 = v62[1];
        *(_QWORD *)v61 = v64;
        *((_QWORD *)v61 + 1) = v63;
        swift_bridgeObjectRelease();
        v65 = (int *)type metadata accessor for RecordMetadata();
        v51(&v28[v65[5]], &v29[v65[5]], v6);
        *(_QWORD *)&v28[v65[6]] = *(_QWORD *)&v29[v65[6]];
        swift_bridgeObjectRelease();
        v66 = v65[7];
        v67 = &v28[v66];
        v68 = &v29[v66];
        v69 = sub_2453876EC();
        v70 = *(_QWORD *)(v69 - 8);
        v71 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 48);
        v72 = v71(v67, 1, v69);
        v73 = v71(v68, 1, v69);
        if (v72)
        {
          if (!v73)
          {
            (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v67, v68, v69);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v70 + 56))(v67, 0, 1, v69);
LABEL_32:
            v42 = v85;
            v75 = *(int *)(v84 + 48);
            v76 = *(_QWORD *)&v28[v75];
            v77 = *(_QWORD *)&v28[v75 + 8];
            *(_OWORD *)&v28[v75] = *(_OWORD *)&v29[v75];
            sub_24525CB80(v76, v77);
            goto LABEL_33;
          }
        }
        else
        {
          if (!v73)
          {
            (*(void (**)(char *, char *, uint64_t))(v70 + 40))(v67, v68, v69);
            goto LABEL_32;
          }
          (*(void (**)(char *, uint64_t))(v70 + 8))(v67, v69);
        }
        v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v67, v68, *(_QWORD *)(*(_QWORD *)(v74 - 8) + 64));
        goto LABEL_32;
      }
      (*(void (**)(char *, uint64_t))(v83 + 8))(v47, v6);
    }
    v59 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
    goto LABEL_26;
  }
  if (v34)
  {
LABEL_13:
    v41 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    v42 = v85;
    goto LABEL_33;
  }
  v35 = *((_OWORD *)v29 + 1);
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *((_OWORD *)v28 + 1) = v35;
  *((_OWORD *)v28 + 2) = *((_OWORD *)v29 + 2);
  v36 = *(int *)(v87 + 24);
  v37 = &v28[v36];
  v38 = &v29[v36];
  if (v18(&v29[v36], 1, v6))
  {
    v39 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    v40 = v83;
  }
  else
  {
    v40 = v83;
    (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v37, v38, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v83 + 56))(v37, 0, 1, v6);
  }
  *(_OWORD *)&v28[*(int *)(v87 + 28)] = *(_OWORD *)&v29[*(int *)(v87 + 28)];
  v52 = (int *)type metadata accessor for RecordMetadata();
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(&v28[v52[5]], &v29[v52[5]], v6);
  *(_QWORD *)&v28[v52[6]] = *(_QWORD *)&v29[v52[6]];
  v53 = v52[7];
  v54 = &v28[v53];
  v55 = &v29[v53];
  v56 = sub_2453876EC();
  v57 = *(_QWORD *)(v56 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v55, 1, v56))
  {
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v54, v55, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v54, v55, v56);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v54, 0, 1, v56);
  }
  v42 = v85;
  *(_OWORD *)&v28[*(int *)(v84 + 48)] = *(_OWORD *)&v29[*(int *)(v84 + 48)];
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 56))(v28, 0, 1);
LABEL_33:
  v78 = *(int *)(v86 + 24);
  v79 = &v10[v78];
  v80 = (char *)v11 + v78;
  *(_QWORD *)v79 = *(_QWORD *)v80;
  v79[8] = v80[8];
  return v42;
}

uint64_t sub_2453664F0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2453664FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_5Tm_0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], type metadata accessor for ReplicatorMessage.Sync.SyncRecord);
}

uint64_t sub_245366510()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24536651C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_6Tm_0(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], type metadata accessor for ReplicatorMessage.Sync.SyncRecord);
}

uint64_t sub_245366530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245369214(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], type metadata accessor for ReplicatorMessage.Sync.SyncRecord);
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Versions()
{
  return &type metadata for ReplicatorMessage.Sync.SyncRecord.Versions;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Versions.V0.CodingKeys()
{
  return &type metadata for ReplicatorMessage.Sync.SyncRecord.Versions.V0.CodingKeys;
}

uint64_t *sub_245366568(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  char *__dst;
  uint64_t v44;
  uint64_t v45;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v45 = v8;
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      v12 = a2[5];
      a1[4] = a2[4];
      a1[5] = v12;
      v13 = type metadata accessor for Record.ID(0);
      v14 = *(int *)(v13 + 24);
      __dst = (char *)a1 + v14;
      v44 = v13;
      v15 = (char *)a2 + v14;
      v16 = sub_245387740();
      v17 = *(_QWORD *)(v16 - 8);
      v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v18(v15, 1, v16))
      {
        v19 = type metadata accessor for Record.ID.Ownership(0);
        memcpy(__dst, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v17 + 16))(__dst, v15, v16);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v16);
      }
      v20 = v17;
      v21 = *(int *)(v44 + 28);
      v22 = (uint64_t *)((char *)a1 + v21);
      v23 = (uint64_t *)((char *)a2 + v21);
      v24 = v23[1];
      *v22 = *v23;
      v22[1] = v24;
      v25 = (int *)type metadata accessor for RecordMetadata();
      v26 = v25[5];
      v27 = (char *)a1 + v26;
      v28 = (char *)a2 + v26;
      v29 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
      swift_bridgeObjectRetain();
      v29(v27, v28, v16);
      *(uint64_t *)((char *)a1 + v25[6]) = *(uint64_t *)((char *)a2 + v25[6]);
      v30 = v25[7];
      v31 = (char *)a1 + v30;
      v32 = (char *)a2 + v30;
      v33 = sub_2453876EC();
      v34 = *(_QWORD *)(v33 - 8);
      v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
      swift_bridgeObjectRetain();
      if (v35(v32, 1, v33))
      {
        v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      }
      v37 = *(int *)(v7 + 48);
      v38 = (uint64_t *)((char *)a1 + v37);
      v39 = (uint64_t *)((char *)a2 + v37);
      v40 = *v39;
      v41 = v39[1];
      sub_245261C44(*v39, v41);
      *v38 = v40;
      v38[1] = v41;
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v45 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_245366808(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4 = a1 + *(int *)(type metadata accessor for Record.ID(0) + 24);
    v5 = sub_245387740();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    swift_bridgeObjectRelease();
    v7 = type metadata accessor for RecordMetadata();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1 + *(int *)(v7 + 20), v5);
    swift_bridgeObjectRelease();
    v8 = a1 + *(int *)(v7 + 28);
    v9 = sub_2453876EC();
    v10 = *(_QWORD *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    return sub_24525CB80(*(_QWORD *)(a1 + *(int *)(v2 + 48)), *(_QWORD *)(a1 + *(int *)(v2 + 48) + 8));
  }
  return result;
}

_QWORD *sub_245366960(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
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
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  char *__dst;
  uint64_t v42;
  uint64_t v43;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v43 = v7;
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    v10 = a2[5];
    a1[4] = a2[4];
    a1[5] = v10;
    v11 = type metadata accessor for Record.ID(0);
    v12 = *(int *)(v11 + 24);
    __dst = (char *)a1 + v12;
    v42 = v11;
    v13 = (char *)a2 + v12;
    v14 = sub_245387740();
    v15 = *(_QWORD *)(v14 - 8);
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v13, 1, v14))
    {
      v17 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    v18 = v15;
    v19 = *(int *)(v42 + 28);
    v20 = (_QWORD *)((char *)a1 + v19);
    v21 = (_QWORD *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = (int *)type metadata accessor for RecordMetadata();
    v24 = v23[5];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    v27 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    swift_bridgeObjectRetain();
    v27(v25, v26, v14);
    *(_QWORD *)((char *)a1 + v23[6]) = *(_QWORD *)((char *)a2 + v23[6]);
    v28 = v23[7];
    v29 = (char *)a1 + v28;
    v30 = (char *)a2 + v28;
    v31 = sub_2453876EC();
    v32 = *(_QWORD *)(v31 - 8);
    v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
    swift_bridgeObjectRetain();
    if (v33(v30, 1, v31))
    {
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
    }
    v35 = *(int *)(v6 + 48);
    v36 = (_QWORD *)((char *)a1 + v35);
    v37 = (_QWORD *)((char *)a2 + v35);
    v38 = *v37;
    v39 = v37[1];
    sub_245261C44(*v37, v39);
    *v36 = v38;
    v36[1] = v39;
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v43 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

char *sub_245366BDC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t v27;
  char *v28;
  char *v29;
  int *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  int *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(char *, uint64_t, uint64_t);
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *__dst;
  uint64_t v70;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_245263F80((uint64_t)a1, &qword_257452350);
      goto LABEL_7;
    }
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
    *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v18 = type metadata accessor for Record.ID(0);
    v19 = *(int *)(v18 + 24);
    v20 = &a1[v19];
    v21 = &a2[v19];
    v22 = sub_245387740();
    v23 = *(_QWORD *)(v22 - 8);
    v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
    v25 = v24(v20, 1, v22);
    v26 = v24(v21, 1, v22);
    if (v25)
    {
      if (!v26)
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v26)
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v22);
LABEL_19:
        v48 = *(int *)(v18 + 28);
        v49 = &a1[v48];
        v50 = &a2[v48];
        *(_QWORD *)v49 = *(_QWORD *)v50;
        *((_QWORD *)v49 + 1) = *((_QWORD *)v50 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v51 = (int *)type metadata accessor for RecordMetadata();
        (*(void (**)(char *, char *, uint64_t))(v23 + 24))(&a1[v51[5]], &a2[v51[5]], v22);
        *(_QWORD *)&a1[v51[6]] = *(_QWORD *)&a2[v51[6]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v52 = v51[7];
        v53 = &a1[v52];
        v54 = &a2[v52];
        v55 = sub_2453876EC();
        v56 = *(_QWORD *)(v55 - 8);
        v57 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48);
        v58 = v57(v53, 1, v55);
        v59 = v57(v54, 1, v55);
        if (v58)
        {
          if (!v59)
          {
            (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v53, v54, v55);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v53, 0, 1, v55);
LABEL_25:
            v61 = *(int *)(v6 + 48);
            v62 = (uint64_t *)&a1[v61];
            v63 = (uint64_t *)&a2[v61];
            v64 = *v63;
            v65 = v63[1];
            sub_245261C44(*v63, v65);
            v66 = *v62;
            v67 = v62[1];
            *v62 = v64;
            v62[1] = v65;
            sub_24525CB80(v66, v67);
            return a1;
          }
        }
        else
        {
          if (!v59)
          {
            (*(void (**)(char *, char *, uint64_t))(v56 + 24))(v53, v54, v55);
            goto LABEL_25;
          }
          (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v55);
        }
        v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v53, v54, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    }
    v47 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
  v11 = type metadata accessor for Record.ID(0);
  v12 = *(int *)(v11 + 24);
  __dst = &a1[v12];
  v70 = v11;
  v13 = &a2[v12];
  v14 = sub_245387740();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    v17 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
  }
  v27 = *(int *)(v70 + 28);
  v28 = &a1[v27];
  v29 = &a2[v27];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
  v30 = (int *)type metadata accessor for RecordMetadata();
  v31 = v30[5];
  v32 = &a1[v31];
  v33 = &a2[v31];
  v34 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  swift_bridgeObjectRetain();
  v34(v32, v33, v14);
  *(_QWORD *)&a1[v30[6]] = *(_QWORD *)&a2[v30[6]];
  v35 = v30[7];
  v36 = &a1[v35];
  v37 = &a2[v35];
  v38 = sub_2453876EC();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  swift_bridgeObjectRetain();
  if (v40(v37, 1, v38))
  {
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
  }
  v42 = *(int *)(v6 + 48);
  v43 = (uint64_t *)&a1[v42];
  v44 = (uint64_t *)&a2[v42];
  v45 = *v44;
  v46 = v44[1];
  sub_245261C44(*v44, v46);
  *v43 = v45;
  v43[1] = v46;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

_OWORD *sub_245367134(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    v9 = type metadata accessor for Record.ID(0);
    v10 = *(int *)(v9 + 24);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_245387740();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    *(_OWORD *)((char *)a1 + *(int *)(v9 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v9 + 28));
    v16 = (int *)type metadata accessor for RecordMetadata();
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))((char *)a1 + v16[5], (char *)a2 + v16[5], v13);
    *(_QWORD *)((char *)a1 + v16[6]) = *(_QWORD *)((char *)a2 + v16[6]);
    v17 = v16[7];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_2453876EC();
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    *(_OWORD *)((char *)a1 + *(int *)(v6 + 48)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 48));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

char *sub_245367340(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  int v30;
  int *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(char *, uint64_t, uint64_t);
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_245263F80((uint64_t)a1, &qword_257452350);
      goto LABEL_7;
    }
    v19 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v19;
    swift_bridgeObjectRelease();
    v20 = *((_QWORD *)a2 + 3);
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    *((_QWORD *)a1 + 3) = v20;
    swift_bridgeObjectRelease();
    v21 = *((_QWORD *)a2 + 5);
    *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
    *((_QWORD *)a1 + 5) = v21;
    swift_bridgeObjectRelease();
    v22 = type metadata accessor for Record.ID(0);
    v23 = *(int *)(v22 + 24);
    v24 = &a1[v23];
    v25 = &a2[v23];
    v26 = sub_245387740();
    v27 = *(_QWORD *)(v26 - 8);
    v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
    v29 = v28(v24, 1, v26);
    v30 = v28(v25, 1, v26);
    if (v29)
    {
      if (!v30)
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v30)
      {
        (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v24, v25, v26);
LABEL_19:
        v39 = *(int *)(v22 + 28);
        v40 = &a1[v39];
        v41 = &a2[v39];
        v43 = *(_QWORD *)v41;
        v42 = *((_QWORD *)v41 + 1);
        *(_QWORD *)v40 = v43;
        *((_QWORD *)v40 + 1) = v42;
        swift_bridgeObjectRelease();
        v44 = (int *)type metadata accessor for RecordMetadata();
        (*(void (**)(char *, char *, uint64_t))(v27 + 40))(&a1[v44[5]], &a2[v44[5]], v26);
        *(_QWORD *)&a1[v44[6]] = *(_QWORD *)&a2[v44[6]];
        swift_bridgeObjectRelease();
        v45 = v44[7];
        v46 = &a1[v45];
        v47 = &a2[v45];
        v48 = sub_2453876EC();
        v49 = *(_QWORD *)(v48 - 8);
        v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
        v51 = v50(v46, 1, v48);
        v52 = v50(v47, 1, v48);
        if (v51)
        {
          if (!v52)
          {
            (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v46, v47, v48);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
LABEL_25:
            v54 = *(int *)(v6 + 48);
            v55 = *(_QWORD *)&a1[v54];
            v56 = *(_QWORD *)&a1[v54 + 8];
            *(_OWORD *)&a1[v54] = *(_OWORD *)&a2[v54];
            sub_24525CB80(v55, v56);
            return a1;
          }
        }
        else
        {
          if (!v52)
          {
            (*(void (**)(char *, char *, uint64_t))(v49 + 40))(v46, v47, v48);
            goto LABEL_25;
          }
          (*(void (**)(char *, uint64_t))(v49 + 8))(v46, v48);
        }
        v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
    }
    v38 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  v12 = type metadata accessor for Record.ID(0);
  v13 = *(int *)(v12 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_245387740();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  *(_OWORD *)&a1[*(int *)(v12 + 28)] = *(_OWORD *)&a2[*(int *)(v12 + 28)];
  v31 = (int *)type metadata accessor for RecordMetadata();
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&a1[v31[5]], &a2[v31[5]], v16);
  *(_QWORD *)&a1[v31[6]] = *(_QWORD *)&a2[v31[6]];
  v32 = v31[7];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v35 = sub_2453876EC();
  v36 = *(_QWORD *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
  {
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v34, v35);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
  }
  *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_2453677B0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2453677BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t sub_24536780C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245367818(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_24536786C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_2453678A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_2453678EC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for RecordMetadata();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_24536795C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  unsigned int (**v27)(_QWORD *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  unsigned int (*v59)(char *, uint64_t, uint64_t);
  char *__dst;
  void *__dsta;
  uint64_t v62;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = type metadata accessor for Record.ID(0);
    v11 = *(int *)(v10 + 24);
    __dst = (char *)v4 + v11;
    v62 = v10;
    v12 = (char *)a2 + v11;
    v13 = sub_245387740();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v59 = v15;
    if (v15(v12, 1, v13))
    {
      v16 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(__dst, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(__dst, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
    }
    v18 = v13;
    v19 = *(int *)(v62 + 28);
    v20 = (uint64_t *)((char *)v4 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = *(int *)(a3 + 20);
    v24 = (uint64_t *)((char *)v4 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    swift_bridgeObjectRetain();
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
    v27 = *(unsigned int (***)(_QWORD *, uint64_t, uint64_t))(v26 - 8);
    if (v27[6](v25, 1, v26))
    {
      v28 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      __dsta = v27;
      v29 = v25[1];
      *v24 = *v25;
      v24[1] = v29;
      v30 = v25[3];
      v24[2] = v25[2];
      v24[3] = v30;
      v31 = v25[5];
      v24[4] = v25[4];
      v24[5] = v31;
      v32 = *(int *)(v62 + 24);
      v33 = (char *)v24 + v32;
      v34 = (char *)v25 + v32;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v59(v34, 1, v18))
      {
        v35 = type metadata accessor for Record.ID.Ownership(0);
        memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
        v36 = v14;
      }
      else
      {
        v36 = v14;
        (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v33, v34, v18);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v33, 0, 1, v18);
      }
      v37 = *(int *)(v62 + 28);
      v38 = (_QWORD *)((char *)v24 + v37);
      v39 = (_QWORD *)((char *)v25 + v37);
      v40 = v39[1];
      *v38 = *v39;
      v38[1] = v40;
      v41 = (int *)type metadata accessor for RecordMetadata();
      v42 = v41[5];
      v43 = (char *)v24 + v42;
      v44 = (char *)v25 + v42;
      v45 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
      swift_bridgeObjectRetain();
      v45(v43, v44, v18);
      *(_QWORD *)((char *)v24 + v41[6]) = *(_QWORD *)((char *)v25 + v41[6]);
      v46 = v41[7];
      v47 = (char *)v24 + v46;
      v48 = (char *)v25 + v46;
      v49 = sub_2453876EC();
      v50 = *(_QWORD *)(v49 - 8);
      v51 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
      swift_bridgeObjectRetain();
      if (v51(v48, 1, v49))
      {
        v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v47, v48, v49);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
      }
      v53 = *(int *)(v26 + 48);
      v54 = (_QWORD *)((char *)v24 + v53);
      v55 = (_QWORD *)((char *)v25 + v53);
      v56 = *v55;
      v57 = v55[1];
      sub_245261C44(*v55, v57);
      *v54 = v56;
      v54[1] = v57;
      (*((void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))__dsta + 7))(v24, 0, 1, v26);
    }
  }
  return v4;
}

uint64_t sub_245367CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = type metadata accessor for Record.ID(0);
  v5 = a1 + *(int *)(v4 + 24);
  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v9 = a1 + *(int *)(a2 + 20);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = v9 + *(int *)(v4 + 24);
    if (!v8(v12, 1, v6))
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v12, v6);
    swift_bridgeObjectRelease();
    v13 = type metadata accessor for RecordMetadata();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9 + *(int *)(v13 + 20), v6);
    swift_bridgeObjectRelease();
    v14 = v9 + *(int *)(v13 + 28);
    v15 = sub_2453876EC();
    v16 = *(_QWORD *)(v15 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    return sub_24525CB80(*(_QWORD *)(v9 + *(int *)(v10 + 48)), *(_QWORD *)(v9 + *(int *)(v10 + 48) + 8));
  }
  return result;
}

_QWORD *sub_245367EA0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
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
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v59 = type metadata accessor for Record.ID(0);
  v8 = *(int *)(v59 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_245387740();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = v12;
  v16 = *(int *)(v59 + 28);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = *(int *)(a3 + 20);
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  swift_bridgeObjectRetain();
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    v56 = v15;
    v58 = v24;
    v26 = v22[1];
    *v21 = *v22;
    v21[1] = v26;
    v27 = v22[3];
    v21[2] = v22[2];
    v21[3] = v27;
    v28 = v22[5];
    v21[4] = v22[4];
    v21[5] = v28;
    v29 = *(int *)(v59 + 24);
    v30 = (char *)v21 + v29;
    v31 = (char *)v22 + v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v31, 1, v11))
    {
      v32 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
      v33 = v56;
    }
    else
    {
      v33 = v56;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v30, v31, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v30, 0, 1, v11);
    }
    v34 = *(int *)(v59 + 28);
    v35 = (_QWORD *)((char *)v21 + v34);
    v36 = (_QWORD *)((char *)v22 + v34);
    v37 = v36[1];
    *v35 = *v36;
    v35[1] = v37;
    v38 = (int *)type metadata accessor for RecordMetadata();
    v39 = v38[5];
    v40 = (char *)v21 + v39;
    v41 = (char *)v22 + v39;
    v42 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
    swift_bridgeObjectRetain();
    v42(v40, v41, v11);
    *(_QWORD *)((char *)v21 + v38[6]) = *(_QWORD *)((char *)v22 + v38[6]);
    v43 = v38[7];
    v44 = (char *)v21 + v43;
    v45 = (char *)v22 + v43;
    v46 = sub_2453876EC();
    v47 = *(_QWORD *)(v46 - 8);
    v48 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48);
    swift_bridgeObjectRetain();
    if (v48(v45, 1, v46))
    {
      v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v44, v45, v46);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
    }
    v50 = *(int *)(v23 + 48);
    v51 = (_QWORD *)((char *)v21 + v50);
    v52 = (_QWORD *)((char *)v22 + v50);
    v53 = *v52;
    v54 = v52[1];
    sub_245261C44(*v52, v54);
    *v51 = v53;
    v51[1] = v54;
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

_QWORD *sub_2453681F4(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  int v37;
  int v38;
  uint64_t v39;
  char *v40;
  char *v41;
  int *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  int *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(char *, uint64_t, uint64_t);
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v81;
  uint64_t v82;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for Record.ID(0);
  v7 = *(int *)(v6 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_245387740();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v82 = v6;
  v16 = *(int *)(v6 + 28);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = *(int *)(a3 + 20);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (v26)
    {
      sub_245263F80((uint64_t)v20, &qword_257452350);
      goto LABEL_13;
    }
    v33 = v11;
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
    *((_QWORD *)v20 + 3) = *((_QWORD *)v21 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)v20 + 4) = *((_QWORD *)v21 + 4);
    *((_QWORD *)v20 + 5) = *((_QWORD *)v21 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v34 = *(int *)(v82 + 24);
    v35 = &v20[v34];
    v36 = &v21[v34];
    v37 = v12(&v20[v34], 1, v10);
    v38 = v12(v36, 1, v10);
    if (v37)
    {
      if (!v38)
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v35, v36, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v35, 0, 1, v10);
        goto LABEL_26;
      }
    }
    else
    {
      if (!v38)
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v35, v36, v10);
LABEL_26:
        v60 = *(int *)(v82 + 28);
        v61 = &v20[v60];
        v62 = &v21[v60];
        *(_QWORD *)v61 = *(_QWORD *)v62;
        *((_QWORD *)v61 + 1) = *((_QWORD *)v62 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v63 = (int *)type metadata accessor for RecordMetadata();
        (*(void (**)(char *, char *, uint64_t))(v33 + 24))(&v20[v63[5]], &v21[v63[5]], v10);
        *(_QWORD *)&v20[v63[6]] = *(_QWORD *)&v21[v63[6]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v64 = v63[7];
        v65 = &v20[v64];
        v66 = &v21[v64];
        v67 = sub_2453876EC();
        v68 = *(_QWORD *)(v67 - 8);
        v69 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v68 + 48);
        v70 = v69(v65, 1, v67);
        v71 = v69(v66, 1, v67);
        if (v70)
        {
          if (!v71)
          {
            (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v65, v66, v67);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v68 + 56))(v65, 0, 1, v67);
LABEL_32:
            v73 = *(int *)(v22 + 48);
            v74 = (uint64_t *)&v20[v73];
            v75 = (uint64_t *)&v21[v73];
            v76 = *v75;
            v77 = v75[1];
            sub_245261C44(*v75, v77);
            v78 = *v74;
            v79 = v74[1];
            *v74 = v76;
            v74[1] = v77;
            sub_24525CB80(v78, v79);
            return a1;
          }
        }
        else
        {
          if (!v71)
          {
            (*(void (**)(char *, char *, uint64_t))(v68 + 24))(v65, v66, v67);
            goto LABEL_32;
          }
          (*(void (**)(char *, uint64_t))(v68 + 8))(v65, v67);
        }
        v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v65, v66, *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64));
        goto LABEL_32;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v10);
    }
    v59 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
    goto LABEL_26;
  }
  if (v26)
  {
LABEL_13:
    v32 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    return a1;
  }
  v81 = v22;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
  *((_QWORD *)v20 + 3) = *((_QWORD *)v21 + 3);
  *((_QWORD *)v20 + 4) = *((_QWORD *)v21 + 4);
  *((_QWORD *)v20 + 5) = *((_QWORD *)v21 + 5);
  v27 = *(int *)(v82 + 24);
  v28 = &v20[v27];
  v29 = &v21[v27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v29, 1, v10))
  {
    v30 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    v31 = v11;
  }
  else
  {
    v31 = v11;
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v28, v29, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
  }
  v39 = *(int *)(v82 + 28);
  v40 = &v20[v39];
  v41 = &v21[v39];
  *(_QWORD *)v40 = *(_QWORD *)v41;
  *((_QWORD *)v40 + 1) = *((_QWORD *)v41 + 1);
  v42 = (int *)type metadata accessor for RecordMetadata();
  v43 = v42[5];
  v44 = &v20[v43];
  v45 = &v21[v43];
  v46 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  swift_bridgeObjectRetain();
  v46(v44, v45, v10);
  *(_QWORD *)&v20[v42[6]] = *(_QWORD *)&v21[v42[6]];
  v47 = v42[7];
  v48 = &v20[v47];
  v49 = &v21[v47];
  v50 = sub_2453876EC();
  v51 = *(_QWORD *)(v50 - 8);
  v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
  swift_bridgeObjectRetain();
  if (v52(v49, 1, v50))
  {
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v48, v49, v50);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v51 + 56))(v48, 0, 1, v50);
  }
  v54 = *(int *)(v81 + 48);
  v55 = (uint64_t *)&v20[v54];
  v56 = (uint64_t *)&v21[v54];
  v57 = *v56;
  v58 = v56[1];
  sub_245261C44(*v56, v58);
  *v55 = v57;
  v55[1] = v58;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v81);
  return a1;
}

_OWORD *sub_24536888C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = type metadata accessor for Record.ID(0);
  v8 = *(int *)(v7 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_245387740();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    v14 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)((char *)a1 + *(int *)(v7 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 28));
  v15 = *(int *)(a3 + 20);
  v16 = (_OWORD *)((char *)a1 + v15);
  v17 = (_OWORD *)((char *)a2 + v15);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v34 = v19;
    v21 = v17[1];
    *v16 = *v17;
    v16[1] = v21;
    v16[2] = v17[2];
    v22 = *(int *)(v7 + 24);
    v23 = (char *)v16 + v22;
    v24 = (char *)v17 + v22;
    if (v13((char *)v17 + v22, 1, v11))
    {
      v25 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v23, v24, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v23, 0, 1, v11);
    }
    *(_OWORD *)((char *)v16 + *(int *)(v7 + 28)) = *(_OWORD *)((char *)v17 + *(int *)(v7 + 28));
    v26 = (int *)type metadata accessor for RecordMetadata();
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v16 + v26[5], (char *)v17 + v26[5], v11);
    *(_QWORD *)((char *)v16 + v26[6]) = *(_QWORD *)((char *)v17 + v26[6]);
    v27 = v26[7];
    v28 = (char *)v16 + v27;
    v29 = (char *)v17 + v27;
    v30 = sub_2453876EC();
    v31 = *(_QWORD *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v28, v29, v30);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
    *(_OWORD *)((char *)v16 + *(int *)(v18 + 48)) = *(_OWORD *)((char *)v17 + *(int *)(v18 + 48));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

_QWORD *sub_245368B44(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  __int128 v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  int v45;
  int v46;
  uint64_t v47;
  int *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  int *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(char *, uint64_t, uint64_t);
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v75;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for Record.ID(0);
  v10 = *(int *)(v9 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_245387740();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  v75 = v14;
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    v18 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
LABEL_7:
  v19 = *(int *)(v9 + 28);
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  v23 = *v21;
  v22 = v21[1];
  *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  v24 = *(int *)(a3 + 20);
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (!v30)
  {
    if (v31)
    {
      sub_245263F80((uint64_t)v25, &qword_257452350);
      goto LABEL_13;
    }
    v39 = *((_QWORD *)v26 + 1);
    *(_QWORD *)v25 = *(_QWORD *)v26;
    *((_QWORD *)v25 + 1) = v39;
    swift_bridgeObjectRelease();
    v40 = *((_QWORD *)v26 + 3);
    *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
    *((_QWORD *)v25 + 3) = v40;
    swift_bridgeObjectRelease();
    v41 = *((_QWORD *)v26 + 5);
    *((_QWORD *)v25 + 4) = *((_QWORD *)v26 + 4);
    *((_QWORD *)v25 + 5) = v41;
    swift_bridgeObjectRelease();
    v42 = *(int *)(v9 + 24);
    v43 = &v25[v42];
    v44 = &v26[v42];
    v45 = v15(&v25[v42], 1, v13);
    v46 = v15(v44, 1, v13);
    if (v45)
    {
      v47 = v75;
      if (!v46)
      {
        (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v43, v44, v13);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v75 + 56))(v43, 0, 1, v13);
        goto LABEL_26;
      }
    }
    else
    {
      v47 = v75;
      if (!v46)
      {
        (*(void (**)(char *, char *, uint64_t))(v75 + 40))(v43, v44, v13);
LABEL_26:
        v56 = *(int *)(v9 + 28);
        v57 = &v25[v56];
        v58 = &v26[v56];
        v60 = *(_QWORD *)v58;
        v59 = *((_QWORD *)v58 + 1);
        *(_QWORD *)v57 = v60;
        *((_QWORD *)v57 + 1) = v59;
        swift_bridgeObjectRelease();
        v61 = (int *)type metadata accessor for RecordMetadata();
        (*(void (**)(char *, char *, uint64_t))(v47 + 40))(&v25[v61[5]], &v26[v61[5]], v13);
        *(_QWORD *)&v25[v61[6]] = *(_QWORD *)&v26[v61[6]];
        swift_bridgeObjectRelease();
        v62 = v61[7];
        v63 = &v25[v62];
        v64 = &v26[v62];
        v65 = sub_2453876EC();
        v66 = *(_QWORD *)(v65 - 8);
        v67 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 48);
        v68 = v67(v63, 1, v65);
        v69 = v67(v64, 1, v65);
        if (v68)
        {
          if (!v69)
          {
            (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v63, v64, v65);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v66 + 56))(v63, 0, 1, v65);
LABEL_32:
            v71 = *(int *)(v27 + 48);
            v72 = *(_QWORD *)&v25[v71];
            v73 = *(_QWORD *)&v25[v71 + 8];
            *(_OWORD *)&v25[v71] = *(_OWORD *)&v26[v71];
            sub_24525CB80(v72, v73);
            return a1;
          }
        }
        else
        {
          if (!v69)
          {
            (*(void (**)(char *, char *, uint64_t))(v66 + 40))(v63, v64, v65);
            goto LABEL_32;
          }
          (*(void (**)(char *, uint64_t))(v66 + 8))(v63, v65);
        }
        v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v63, v64, *(_QWORD *)(*(_QWORD *)(v70 - 8) + 64));
        goto LABEL_32;
      }
      (*(void (**)(char *, uint64_t))(v75 + 8))(v43, v13);
    }
    v55 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
    goto LABEL_26;
  }
  if (v31)
  {
LABEL_13:
    v38 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    return a1;
  }
  v32 = *((_OWORD *)v26 + 1);
  *(_OWORD *)v25 = *(_OWORD *)v26;
  *((_OWORD *)v25 + 1) = v32;
  *((_OWORD *)v25 + 2) = *((_OWORD *)v26 + 2);
  v33 = *(int *)(v9 + 24);
  v34 = &v25[v33];
  v35 = &v26[v33];
  if (v15(&v26[v33], 1, v13))
  {
    v36 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    v37 = v75;
  }
  else
  {
    v37 = v75;
    (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v34, v35, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v75 + 56))(v34, 0, 1, v13);
  }
  *(_OWORD *)&v25[*(int *)(v9 + 28)] = *(_OWORD *)&v26[*(int *)(v9 + 28)];
  v48 = (int *)type metadata accessor for RecordMetadata();
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(&v25[v48[5]], &v26[v48[5]], v13);
  *(_QWORD *)&v25[v48[6]] = *(_QWORD *)&v26[v48[6]];
  v49 = v48[7];
  v50 = &v25[v49];
  v51 = &v26[v49];
  v52 = sub_2453876EC();
  v53 = *(_QWORD *)(v52 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52))
  {
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v50, v51, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v50, v51, v52);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v50, 0, 1, v52);
  }
  *(_OWORD *)&v25[*(int *)(v27 + 48)] = *(_OWORD *)&v26[*(int *)(v27 + 48)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  return a1;
}

uint64_t sub_2453690C0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2453690CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_5Tm_0(a1, a2, a3, type metadata accessor for Record.ID, type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value);
}

uint64_t __swift_get_extra_inhabitant_index_5Tm_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(_QWORD))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  v9 = a4(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v13 = a1;
  }
  else
  {
    v11 = a5(0);
    v13 = a1 + *(int *)(a3 + 20);
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48);
  }
  return v12(v13, a2, v11);
}

uint64_t sub_245369158()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245369164(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_6Tm_0(a1, a2, a3, a4, type metadata accessor for Record.ID, type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value);
}

uint64_t __swift_store_extra_inhabitant_index_6Tm_0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t (*a6)(_QWORD))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;

  v11 = a5(0);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a3)
  {
    v13 = v11;
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v15 = a1;
  }
  else
  {
    v13 = a6(0);
    v15 = a1 + *(int *)(a4 + 20);
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  }
  return v14(v15, a2, a2, v13);
}

uint64_t sub_245369200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245369214(a1, a2, a3, type metadata accessor for Record.ID, type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value);
}

uint64_t sub_245369214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = a4(319);
  if (v7 <= 0x3F)
  {
    result = a5(319);
    if (v8 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2453692B4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2453692C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_5Tm_0(a1, a2, a3, type metadata accessor for Record.ID, type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value);
}

uint64_t sub_2453692D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2453692E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_6Tm_0(a1, a2, a3, a4, type metadata accessor for Record.ID, type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value);
}

uint64_t *sub_2453692F8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v63;
  uint64_t v64;
  unsigned int (*v65)(char *, uint64_t, uint64_t);
  char *__dst;
  int *__dsta;
  uint64_t v68;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a3;
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = type metadata accessor for Record.ID(0);
    v11 = *(int *)(v10 + 24);
    __dst = (char *)v4 + v11;
    v68 = v10;
    v12 = (char *)a2 + v11;
    v13 = sub_245387740();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v65 = v15;
    if (v15(v12, 1, v13))
    {
      v16 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(__dst, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(__dst, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
    }
    v18 = v13;
    v19 = *(int *)(v68 + 28);
    v20 = (uint64_t *)((char *)v4 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = v6[5];
    v24 = (uint64_t *)((char *)v4 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    swift_bridgeObjectRetain();
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
    v27 = *(_QWORD *)(v26 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      v28 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      v63 = v27;
      v64 = v26;
      __dsta = v6;
      v29 = v25[1];
      *v24 = *v25;
      v24[1] = v29;
      v30 = v25[3];
      v24[2] = v25[2];
      v24[3] = v30;
      v31 = v25[5];
      v24[4] = v25[4];
      v24[5] = v31;
      v32 = *(int *)(v68 + 24);
      v33 = (char *)v24 + v32;
      v34 = (char *)v25 + v32;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v65(v34, 1, v18))
      {
        v35 = type metadata accessor for Record.ID.Ownership(0);
        memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
        v36 = v14;
      }
      else
      {
        v37 = v33;
        v36 = v14;
        (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v37, v34, v18);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v37, 0, 1, v18);
      }
      v38 = *(int *)(v68 + 28);
      v39 = (_QWORD *)((char *)v24 + v38);
      v40 = (_QWORD *)((char *)v25 + v38);
      v41 = v40[1];
      *v39 = *v40;
      v39[1] = v41;
      v42 = (int *)type metadata accessor for RecordMetadata();
      v43 = v42[5];
      v44 = (char *)v24 + v43;
      v45 = (char *)v25 + v43;
      v46 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
      swift_bridgeObjectRetain();
      v46(v44, v45, v18);
      *(_QWORD *)((char *)v24 + v42[6]) = *(_QWORD *)((char *)v25 + v42[6]);
      v47 = v42[7];
      v48 = (char *)v24 + v47;
      v49 = (char *)v25 + v47;
      v50 = sub_2453876EC();
      v51 = *(_QWORD *)(v50 - 8);
      v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
      swift_bridgeObjectRetain();
      if (v52(v49, 1, v50))
      {
        v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v48, v49, v50);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v51 + 56))(v48, 0, 1, v50);
      }
      v54 = *(int *)(v64 + 48);
      v55 = (_QWORD *)((char *)v24 + v54);
      v56 = (_QWORD *)((char *)v25 + v54);
      v57 = *v56;
      v58 = v56[1];
      sub_245261C44(*v56, v58);
      *v55 = v57;
      v55[1] = v58;
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v63 + 56))(v24, 0, 1, v64);
      v6 = __dsta;
    }
    v59 = v6[6];
    v60 = (char *)v4 + v59;
    v61 = (char *)a2 + v59;
    *(_QWORD *)v60 = *(_QWORD *)v61;
    v60[8] = v61[8];
  }
  return v4;
}

_QWORD *sub_2453696A4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v61;
  uint64_t v62;
  unsigned int (*v63)(char *, uint64_t, uint64_t);
  uint64_t v64;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v64 = type metadata accessor for Record.ID(0);
  v8 = *(int *)(v64 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_245387740();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v63 = v13;
  if (v13(v10, 1, v11))
  {
    v14 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = v11;
  v16 = a3;
  v17 = *(int *)(v64 + 28);
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = *(int *)(a3 + 20);
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  swift_bridgeObjectRetain();
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v61 = v25;
    v62 = v24;
    v27 = v23[1];
    *v22 = *v23;
    v22[1] = v27;
    v28 = v23[3];
    v22[2] = v23[2];
    v22[3] = v28;
    v29 = v23[5];
    v22[4] = v23[4];
    v22[5] = v29;
    v30 = *(int *)(v64 + 24);
    v31 = (char *)v22 + v30;
    v32 = (char *)v23 + v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v63(v32, 1, v15))
    {
      v33 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      v34 = v12;
    }
    else
    {
      v35 = v31;
      v34 = v12;
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v35, v32, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v35, 0, 1, v15);
    }
    v36 = *(int *)(v64 + 28);
    v37 = (_QWORD *)((char *)v22 + v36);
    v38 = (_QWORD *)((char *)v23 + v36);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    v40 = (int *)type metadata accessor for RecordMetadata();
    v41 = v40[5];
    v42 = (char *)v22 + v41;
    v43 = (char *)v23 + v41;
    v44 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
    swift_bridgeObjectRetain();
    v44(v42, v43, v15);
    *(_QWORD *)((char *)v22 + v40[6]) = *(_QWORD *)((char *)v23 + v40[6]);
    v45 = v40[7];
    v46 = (char *)v22 + v45;
    v47 = (char *)v23 + v45;
    v48 = sub_2453876EC();
    v49 = *(_QWORD *)(v48 - 8);
    v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
    swift_bridgeObjectRetain();
    if (v50(v47, 1, v48))
    {
      v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v46, v47, v48);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
    }
    v52 = *(int *)(v62 + 48);
    v53 = (_QWORD *)((char *)v22 + v52);
    v54 = (_QWORD *)((char *)v23 + v52);
    v55 = *v54;
    v56 = v54[1];
    sub_245261C44(*v54, v56);
    *v53 = v55;
    v53[1] = v56;
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v22, 0, 1, v62);
    v16 = a3;
  }
  v57 = *(int *)(v16 + 24);
  v58 = (char *)a1 + v57;
  v59 = (char *)a2 + v57;
  *(_QWORD *)v58 = *(_QWORD *)v59;
  v58[8] = v59[8];
  return a1;
}

_QWORD *sub_245369A1C(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  int *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  int *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(char *, uint64_t, uint64_t);
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *__dst;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for Record.ID(0);
  v7 = *(int *)(v6 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_245387740();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  v89 = v11;
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v90 = v6;
  v16 = *(int *)(v6 + 28);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = *(int *)(a3 + 20);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v88 = *(_QWORD *)(v22 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 48);
  v24 = v23(v20, 1, v22);
  v25 = v23(v21, 1, v22);
  if (!v24)
  {
    if (v25)
    {
      sub_245263F80((uint64_t)v20, &qword_257452350);
      goto LABEL_13;
    }
    v87 = a3;
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
    *((_QWORD *)v20 + 3) = *((_QWORD *)v21 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)v20 + 4) = *((_QWORD *)v21 + 4);
    *((_QWORD *)v20 + 5) = *((_QWORD *)v21 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v31 = *(int *)(v90 + 24);
    v32 = &v20[v31];
    v33 = &v21[v31];
    v34 = v12(&v20[v31], 1, v10);
    v35 = v12(v33, 1, v10);
    v85 = v22;
    if (v34)
    {
      if (v35)
      {
        v36 = type metadata accessor for Record.ID.Ownership(0);
        memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
        v37 = v89;
      }
      else
      {
        v37 = v89;
        (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v32, v33, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v89 + 56))(v32, 0, 1, v10);
      }
    }
    else
    {
      v37 = v89;
      if (v35)
      {
        (*(void (**)(char *, uint64_t))(v89 + 8))(v32, v10);
        v58 = type metadata accessor for Record.ID.Ownership(0);
        memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v89 + 24))(v32, v33, v10);
      }
    }
    v59 = *(int *)(v90 + 28);
    v60 = &v20[v59];
    v61 = &v21[v59];
    *(_QWORD *)v60 = *(_QWORD *)v61;
    *((_QWORD *)v60 + 1) = *((_QWORD *)v61 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v62 = (int *)type metadata accessor for RecordMetadata();
    (*(void (**)(char *, char *, uint64_t))(v37 + 24))(&v20[v62[5]], &v21[v62[5]], v10);
    *(_QWORD *)&v20[v62[6]] = *(_QWORD *)&v21[v62[6]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v63 = v62[7];
    v64 = &v20[v63];
    v65 = &v21[v63];
    v66 = sub_2453876EC();
    v67 = *(_QWORD *)(v66 - 8);
    v68 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v67 + 48);
    LODWORD(v62) = v68(v64, 1, v66);
    v69 = v68(v65, 1, v66);
    if ((_DWORD)v62)
    {
      a3 = v87;
      if (!v69)
      {
        (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v64, v65, v66);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v67 + 56))(v64, 0, 1, v66);
LABEL_33:
        v71 = *(int *)(v85 + 48);
        v72 = (uint64_t *)&v20[v71];
        v73 = (uint64_t *)&v21[v71];
        v74 = *v73;
        v75 = v73[1];
        sub_245261C44(*v73, v75);
        v76 = *v72;
        v77 = v72[1];
        *v72 = v74;
        v72[1] = v75;
        sub_24525CB80(v76, v77);
        goto LABEL_34;
      }
    }
    else
    {
      a3 = v87;
      if (!v69)
      {
        (*(void (**)(char *, char *, uint64_t))(v67 + 24))(v64, v65, v66);
        goto LABEL_33;
      }
      (*(void (**)(char *, uint64_t))(v67 + 8))(v64, v66);
    }
    v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v64, v65, *(_QWORD *)(*(_QWORD *)(v70 - 8) + 64));
    goto LABEL_33;
  }
  if (v25)
  {
LABEL_13:
    v30 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_34;
  }
  v86 = a3;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
  *((_QWORD *)v20 + 3) = *((_QWORD *)v21 + 3);
  *((_QWORD *)v20 + 4) = *((_QWORD *)v21 + 4);
  *((_QWORD *)v20 + 5) = *((_QWORD *)v21 + 5);
  v26 = *(int *)(v90 + 24);
  __dst = &v20[v26];
  v27 = &v21[v26];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v84 = v22;
  if (v12(v27, 1, v10))
  {
    v28 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(__dst, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    v29 = v89;
  }
  else
  {
    v29 = v89;
    (*(void (**)(char *, char *, uint64_t))(v89 + 16))(__dst, v27, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v89 + 56))(__dst, 0, 1, v10);
  }
  v38 = *(int *)(v90 + 28);
  v39 = &v20[v38];
  v40 = &v21[v38];
  *(_QWORD *)v39 = *(_QWORD *)v40;
  *((_QWORD *)v39 + 1) = *((_QWORD *)v40 + 1);
  v41 = (int *)type metadata accessor for RecordMetadata();
  v42 = v41[5];
  v43 = &v20[v42];
  v44 = &v21[v42];
  v45 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  swift_bridgeObjectRetain();
  v45(v43, v44, v10);
  *(_QWORD *)&v20[v41[6]] = *(_QWORD *)&v21[v41[6]];
  v46 = v41[7];
  v47 = &v20[v46];
  v48 = &v21[v46];
  v49 = sub_2453876EC();
  v50 = *(_QWORD *)(v49 - 8);
  v51 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
  swift_bridgeObjectRetain();
  if (v51(v48, 1, v49))
  {
    v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v47, v48, v49);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
  }
  a3 = v86;
  v53 = *(int *)(v84 + 48);
  v54 = (uint64_t *)&v20[v53];
  v55 = (uint64_t *)&v21[v53];
  v56 = *v55;
  v57 = v55[1];
  sub_245261C44(*v55, v57);
  *v54 = v56;
  v54[1] = v57;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v88 + 56))(v20, 0, 1, v84);
LABEL_34:
  v78 = *(int *)(a3 + 24);
  v79 = (char *)a1 + v78;
  v80 = (char *)a2 + v78;
  v81 = *(_QWORD *)v80;
  v79[8] = v80[8];
  *(_QWORD *)v79 = v81;
  return a1;
}

_OWORD *sub_24536A128(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  int *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = type metadata accessor for Record.ID(0);
  v8 = *(int *)(v7 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_245387740();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v43 = v12;
  if (v13(v10, 1, v11))
  {
    v14 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)((char *)a1 + *(int *)(v7 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 28));
  v15 = *(int *)(a3 + 20);
  v16 = (_OWORD *)((char *)a1 + v15);
  v17 = (_OWORD *)((char *)a2 + v15);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v19 = a3;
  v20 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v20 + 48))(v17, 1, v18))
  {
    v21 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    v22 = v19;
  }
  else
  {
    v41 = v20;
    v42 = v19;
    v23 = v17[1];
    *v16 = *v17;
    v16[1] = v23;
    v16[2] = v17[2];
    v24 = *(int *)(v7 + 24);
    v25 = (char *)v16 + v24;
    v26 = (char *)v17 + v24;
    if (v13((char *)v17 + v24, 1, v11))
    {
      v27 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
      v28 = v43;
    }
    else
    {
      v29 = v25;
      v28 = v43;
      (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v29, v26, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v29, 0, 1, v11);
    }
    *(_OWORD *)((char *)v16 + *(int *)(v7 + 28)) = *(_OWORD *)((char *)v17 + *(int *)(v7 + 28));
    v30 = (int *)type metadata accessor for RecordMetadata();
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))((char *)v16 + v30[5], (char *)v17 + v30[5], v11);
    *(_QWORD *)((char *)v16 + v30[6]) = *(_QWORD *)((char *)v17 + v30[6]);
    v31 = v30[7];
    v32 = (char *)v16 + v31;
    v33 = (char *)v17 + v31;
    v34 = sub_2453876EC();
    v35 = *(_QWORD *)(v34 - 8);
    v22 = v42;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    *(_OWORD *)((char *)v16 + *(int *)(v18 + 48)) = *(_OWORD *)((char *)v17 + *(int *)(v18 + 48));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v16, 0, 1, v18);
  }
  v37 = *(int *)(v22 + 24);
  v38 = (char *)a1 + v37;
  v39 = (char *)a2 + v37;
  *(_QWORD *)v38 = *(_QWORD *)v39;
  v38[8] = v39[8];
  return a1;
}

_QWORD *sub_24536A418(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  __int128 v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  int v46;
  int v47;
  uint64_t v48;
  int *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v72)(char *, uint64_t, uint64_t);
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for Record.ID(0);
  v10 = *(int *)(v9 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_245387740();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  v79 = v14;
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    v18 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
LABEL_7:
  v80 = v9;
  v19 = *(int *)(v9 + 28);
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  v23 = *v21;
  v22 = v21[1];
  *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  v81 = a3;
  v24 = *(int *)(a3 + 20);
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257452350);
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v78 = v27;
  v31 = v29(v26, 1, v27);
  if (!v30)
  {
    if (v31)
    {
      sub_245263F80((uint64_t)v25, &qword_257452350);
      goto LABEL_13;
    }
    v40 = *((_QWORD *)v26 + 1);
    *(_QWORD *)v25 = *(_QWORD *)v26;
    *((_QWORD *)v25 + 1) = v40;
    swift_bridgeObjectRelease();
    v41 = *((_QWORD *)v26 + 3);
    *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
    *((_QWORD *)v25 + 3) = v41;
    swift_bridgeObjectRelease();
    v42 = *((_QWORD *)v26 + 5);
    *((_QWORD *)v25 + 4) = *((_QWORD *)v26 + 4);
    *((_QWORD *)v25 + 5) = v42;
    swift_bridgeObjectRelease();
    v43 = *(int *)(v80 + 24);
    v44 = &v25[v43];
    v45 = &v26[v43];
    v46 = v15(&v25[v43], 1, v13);
    v47 = v15(v45, 1, v13);
    if (v46)
    {
      v48 = v79;
      if (!v47)
      {
        (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v44, v45, v13);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v79 + 56))(v44, 0, 1, v13);
        goto LABEL_28;
      }
    }
    else
    {
      v48 = v79;
      if (!v47)
      {
        (*(void (**)(char *, char *, uint64_t))(v79 + 40))(v44, v45, v13);
LABEL_28:
        v61 = *(int *)(v80 + 28);
        v62 = &v25[v61];
        v63 = &v26[v61];
        v65 = *(_QWORD *)v63;
        v64 = *((_QWORD *)v63 + 1);
        *(_QWORD *)v62 = v65;
        *((_QWORD *)v62 + 1) = v64;
        swift_bridgeObjectRelease();
        v66 = (int *)type metadata accessor for RecordMetadata();
        (*(void (**)(char *, char *, uint64_t))(v48 + 40))(&v25[v66[5]], &v26[v66[5]], v13);
        *(_QWORD *)&v25[v66[6]] = *(_QWORD *)&v26[v66[6]];
        swift_bridgeObjectRelease();
        v67 = v66[7];
        v68 = &v25[v67];
        v69 = &v26[v67];
        v70 = sub_2453876EC();
        v71 = *(_QWORD *)(v70 - 8);
        v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
        LODWORD(v66) = v72(v68, 1, v70);
        v73 = v72(v69, 1, v70);
        if ((_DWORD)v66)
        {
          if (!v73)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v68, v69, v70);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v70);
LABEL_34:
            v75 = *(int *)(v78 + 48);
            v76 = *(_QWORD *)&v25[v75];
            v77 = *(_QWORD *)&v25[v75 + 8];
            *(_OWORD *)&v25[v75] = *(_OWORD *)&v26[v75];
            sub_24525CB80(v76, v77);
            goto LABEL_14;
          }
        }
        else
        {
          if (!v73)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 40))(v68, v69, v70);
            goto LABEL_34;
          }
          (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v70);
        }
        v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
        memcpy(v68, v69, *(_QWORD *)(*(_QWORD *)(v74 - 8) + 64));
        goto LABEL_34;
      }
      (*(void (**)(char *, uint64_t))(v79 + 8))(v44, v13);
    }
    v60 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
    goto LABEL_28;
  }
  if (v31)
  {
LABEL_13:
    v38 = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(0);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
LABEL_14:
    v39 = v81;
    goto LABEL_24;
  }
  v32 = *((_OWORD *)v26 + 1);
  *(_OWORD *)v25 = *(_OWORD *)v26;
  *((_OWORD *)v25 + 1) = v32;
  *((_OWORD *)v25 + 2) = *((_OWORD *)v26 + 2);
  v33 = *(int *)(v80 + 24);
  v34 = &v25[v33];
  v35 = &v26[v33];
  if (v15(&v26[v33], 1, v13))
  {
    v36 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    v37 = v79;
  }
  else
  {
    v37 = v79;
    (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v34, v35, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v79 + 56))(v34, 0, 1, v13);
  }
  *(_OWORD *)&v25[*(int *)(v80 + 28)] = *(_OWORD *)&v26[*(int *)(v80 + 28)];
  v49 = (int *)type metadata accessor for RecordMetadata();
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(&v25[v49[5]], &v26[v49[5]], v13);
  *(_QWORD *)&v25[v49[6]] = *(_QWORD *)&v26[v49[6]];
  v50 = v49[7];
  v51 = &v25[v50];
  v52 = &v26[v50];
  v53 = sub_2453876EC();
  v54 = *(_QWORD *)(v53 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53))
  {
    v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v51, v52, v53);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
  }
  v39 = v81;
  *(_OWORD *)&v25[*(int *)(v78 + 48)] = *(_OWORD *)&v26[*(int *)(v78 + 48)];
  (*(void (**)(char *, _QWORD, uint64_t))(v28 + 56))(v25, 0, 1);
LABEL_24:
  v56 = *(int *)(v39 + 24);
  v57 = (char *)a1 + v56;
  v58 = (char *)a2 + v56;
  *(_QWORD *)v57 = *(_QWORD *)v58;
  v57[8] = v58[8];
  return a1;
}

uint64_t sub_24536A9D8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24536A9E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_5Tm_0(a1, a2, a3, type metadata accessor for Record.ID, type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value);
}

uint64_t sub_24536A9F8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24536AA04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_6Tm_0(a1, a2, a3, a4, type metadata accessor for Record.ID, type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value);
}

uint64_t sub_24536AA18()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for Record.ID(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_24536AAA8()
{
  unint64_t result;

  result = qword_257453228;
  if (!qword_257453228)
  {
    result = MEMORY[0x2495330B0](&unk_24538FBB4, &type metadata for ReplicatorMessage.Sync.SyncRecord.Versions.V0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453228);
  }
  return result;
}

unint64_t sub_24536AAF0()
{
  unint64_t result;

  result = qword_257453230;
  if (!qword_257453230)
  {
    result = MEMORY[0x2495330B0](&unk_24538FCBC, &type metadata for ReplicatorMessage.Sync.SyncRecord.Versions.V8.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453230);
  }
  return result;
}

unint64_t sub_24536AB38()
{
  unint64_t result;

  result = qword_257453238;
  if (!qword_257453238)
  {
    result = MEMORY[0x2495330B0](&unk_24538FE8C, &type metadata for ReplicatorMessage.AckCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453238);
  }
  return result;
}

unint64_t sub_24536AB80()
{
  unint64_t result;

  result = qword_257453240;
  if (!qword_257453240)
  {
    result = MEMORY[0x2495330B0](&unk_24538FF44, &type metadata for ReplicatorMessage.SyncCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453240);
  }
  return result;
}

unint64_t sub_24536ABC8()
{
  unint64_t result;

  result = qword_257453248;
  if (!qword_257453248)
  {
    result = MEMORY[0x2495330B0](&unk_24538FFFC, &type metadata for ReplicatorMessage.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453248);
  }
  return result;
}

unint64_t sub_24536AC10()
{
  unint64_t result;

  result = qword_257453250;
  if (!qword_257453250)
  {
    result = MEMORY[0x2495330B0](&unk_2453900B4, &type metadata for ReplicatorMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453250);
  }
  return result;
}

unint64_t sub_24536AC58()
{
  unint64_t result;

  result = qword_257453258;
  if (!qword_257453258)
  {
    result = MEMORY[0x2495330B0](&unk_24538FF6C, &type metadata for ReplicatorMessage.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453258);
  }
  return result;
}

unint64_t sub_24536ACA0()
{
  unint64_t result;

  result = qword_257453260;
  if (!qword_257453260)
  {
    result = MEMORY[0x2495330B0](&unk_24538FF94, &type metadata for ReplicatorMessage.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453260);
  }
  return result;
}

unint64_t sub_24536ACE8()
{
  unint64_t result;

  result = qword_257453268;
  if (!qword_257453268)
  {
    result = MEMORY[0x2495330B0](&unk_24538FEB4, &type metadata for ReplicatorMessage.SyncCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453268);
  }
  return result;
}

unint64_t sub_24536AD30()
{
  unint64_t result;

  result = qword_257453270;
  if (!qword_257453270)
  {
    result = MEMORY[0x2495330B0](&unk_24538FEDC, &type metadata for ReplicatorMessage.SyncCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453270);
  }
  return result;
}

unint64_t sub_24536AD78()
{
  unint64_t result;

  result = qword_257453278;
  if (!qword_257453278)
  {
    result = MEMORY[0x2495330B0](&unk_24538FDFC, &type metadata for ReplicatorMessage.AckCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453278);
  }
  return result;
}

unint64_t sub_24536ADC0()
{
  unint64_t result;

  result = qword_257453280;
  if (!qword_257453280)
  {
    result = MEMORY[0x2495330B0](&unk_24538FE24, &type metadata for ReplicatorMessage.AckCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453280);
  }
  return result;
}

unint64_t sub_24536AE08()
{
  unint64_t result;

  result = qword_257453288;
  if (!qword_257453288)
  {
    result = MEMORY[0x2495330B0](&unk_245390024, &type metadata for ReplicatorMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453288);
  }
  return result;
}

unint64_t sub_24536AE50()
{
  unint64_t result;

  result = qword_257453290;
  if (!qword_257453290)
  {
    result = MEMORY[0x2495330B0](&unk_24539004C, &type metadata for ReplicatorMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453290);
  }
  return result;
}

unint64_t sub_24536AE98()
{
  unint64_t result;

  result = qword_257453298;
  if (!qword_257453298)
  {
    result = MEMORY[0x2495330B0](&unk_24538FC2C, &type metadata for ReplicatorMessage.Sync.SyncRecord.Versions.V8.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453298);
  }
  return result;
}

unint64_t sub_24536AEE0()
{
  unint64_t result;

  result = qword_2574532A0;
  if (!qword_2574532A0)
  {
    result = MEMORY[0x2495330B0](&unk_24538FC54, &type metadata for ReplicatorMessage.Sync.SyncRecord.Versions.V8.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574532A0);
  }
  return result;
}

unint64_t sub_24536AF28()
{
  unint64_t result;

  result = qword_2574532A8;
  if (!qword_2574532A8)
  {
    result = MEMORY[0x2495330B0](&unk_24538FB24, &type metadata for ReplicatorMessage.Sync.SyncRecord.Versions.V0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574532A8);
  }
  return result;
}

unint64_t sub_24536AF70()
{
  unint64_t result;

  result = qword_2574532B0;
  if (!qword_2574532B0)
  {
    result = MEMORY[0x2495330B0](&unk_24538FB4C, &type metadata for ReplicatorMessage.Sync.SyncRecord.Versions.V0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574532B0);
  }
  return result;
}

_QWORD *sub_24536AFB4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574535B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24536D198();
  sub_245388490();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574535C8);
    sub_24536D1DC();
    sub_245388034();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_24536B0E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6B616873646E6168 && a2 == 0xE900000000000065;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1668184435 && a2 == 0xE400000000000000 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7037793 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_24536B220(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1635017060 && a2 == 0xE400000000000000;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701736302 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24536B2F0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24536B3B0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_24536B480()
{
  unint64_t result;

  result = qword_2574532D0;
  if (!qword_2574532D0)
  {
    result = MEMORY[0x2495330B0](&unk_245391010, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574532D0);
  }
  return result;
}

unint64_t sub_24536B4C4()
{
  unint64_t result;

  result = qword_2574532D8;
  if (!qword_2574532D8)
  {
    result = MEMORY[0x2495330B0](&unk_245390FC0, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574532D8);
  }
  return result;
}

unint64_t sub_24536B508()
{
  unint64_t result;

  result = qword_2574532E0;
  if (!qword_2574532E0)
  {
    result = MEMORY[0x2495330B0](&unk_245390F70, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574532E0);
  }
  return result;
}

uint64_t sub_24536B54C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6F636F746F7270 && a2 == 0xEF6E6F6973726556)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

unint64_t sub_24536B6A4()
{
  unint64_t result;

  result = qword_257453328;
  if (!qword_257453328)
  {
    result = MEMORY[0x2495330B0](&unk_2453900DC, &type metadata for ReplicatorMessage.Ack);
    atomic_store(result, (unint64_t *)&qword_257453328);
  }
  return result;
}

unint64_t sub_24536B6E8()
{
  unint64_t result;

  result = qword_257453348;
  if (!qword_257453348)
  {
    result = MEMORY[0x2495330B0](&unk_245390F20, &type metadata for ReplicatorMessage.Sync.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453348);
  }
  return result;
}

unint64_t sub_24536B72C()
{
  unint64_t result;

  result = qword_257453378;
  if (!qword_257453378)
  {
    result = MEMORY[0x2495330B0](&unk_245390ED0, &type metadata for ReplicatorMessage.Handshake.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453378);
  }
  return result;
}

unint64_t sub_24536B770()
{
  unint64_t result;

  result = qword_257453380;
  if (!qword_257453380)
  {
    result = MEMORY[0x2495330B0](&unk_245390E80, &type metadata for ReplicatorMessage.Handshake.CompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453380);
  }
  return result;
}

unint64_t sub_24536B7B4()
{
  unint64_t result;

  result = qword_257453390;
  if (!qword_257453390)
  {
    result = MEMORY[0x2495330B0](&unk_245390E30, &type metadata for ReplicatorMessage.Handshake.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453390);
  }
  return result;
}

unint64_t sub_24536B7F8()
{
  unint64_t result;

  result = qword_2574533A0;
  if (!qword_2574533A0)
  {
    result = MEMORY[0x2495330B0](&unk_245390DE0, &type metadata for ReplicatorMessage.Handshake.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574533A0);
  }
  return result;
}

unint64_t sub_24536B83C()
{
  unint64_t result;

  result = qword_2574533B8;
  if (!qword_2574533B8)
  {
    result = MEMORY[0x2495330B0](&unk_245390D90, &type metadata for ReplicatorMessage.Ack.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574533B8);
  }
  return result;
}

unint64_t sub_24536B880()
{
  unint64_t result;

  result = qword_257453400;
  if (!qword_257453400)
  {
    result = MEMORY[0x2495330B0](&unk_245390D40, &type metadata for ReplicatorMessage.Handshake.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453400);
  }
  return result;
}

unint64_t sub_24536B8C4()
{
  unint64_t result;

  result = qword_257453408;
  if (!qword_257453408)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for PairingRelationship.State, &type metadata for PairingRelationship.State);
    atomic_store(result, (unint64_t *)&qword_257453408);
  }
  return result;
}

unint64_t sub_24536B908()
{
  unint64_t result;

  result = qword_257453410;
  if (!qword_257453410)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for DeviceDescriptor, &type metadata for DeviceDescriptor);
    atomic_store(result, (unint64_t *)&qword_257453410);
  }
  return result;
}

unint64_t sub_24536B94C()
{
  unint64_t result;

  result = qword_257453420;
  if (!qword_257453420)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for PairingRelationship.State, &type metadata for PairingRelationship.State);
    atomic_store(result, (unint64_t *)&qword_257453420);
  }
  return result;
}

unint64_t sub_24536B990()
{
  unint64_t result;

  result = qword_257453428;
  if (!qword_257453428)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for DeviceDescriptor, &type metadata for DeviceDescriptor);
    atomic_store(result, (unint64_t *)&qword_257453428);
  }
  return result;
}

unint64_t sub_24536B9D4()
{
  unint64_t result;

  result = qword_257453438;
  if (!qword_257453438)
  {
    result = MEMORY[0x2495330B0](&unk_245390CF0, &type metadata for ReplicatorMessage.Handshake.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453438);
  }
  return result;
}

unint64_t sub_24536BA18()
{
  unint64_t result;

  result = qword_257453440;
  if (!qword_257453440)
  {
    result = MEMORY[0x2495330B0](&unk_245390CC8, &type metadata for ReplicatorMessage.RecordManifest);
    atomic_store(result, (unint64_t *)&qword_257453440);
  }
  return result;
}

unint64_t sub_24536BA5C()
{
  unint64_t result;

  result = qword_257453450;
  if (!qword_257453450)
  {
    result = MEMORY[0x2495330B0](&unk_245390CA0, &type metadata for ReplicatorMessage.RecordManifest);
    atomic_store(result, (unint64_t *)&qword_257453450);
  }
  return result;
}

unint64_t sub_24536BAA0()
{
  unint64_t result;

  result = qword_257453460;
  if (!qword_257453460)
  {
    result = MEMORY[0x2495330B0](&unk_245390C50, &type metadata for ReplicatorMessage.Handshake.Complete.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453460);
  }
  return result;
}

uint64_t sub_24536BAE4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257450000);
    v8 = a2;
    result = MEMORY[0x2495330B0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Handshake.Complete.CodingKeys()
{
  return &type metadata for ReplicatorMessage.Handshake.Complete.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PairedDevice.PairedDeviceClass(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ReplicatorMessage.Handshake.Response.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24536BC38 + 4 * byte_24538F922[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24536BC6C + 4 * byte_24538F91D[v4]))();
}

uint64_t sub_24536BC6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536BC74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24536BC7CLL);
  return result;
}

uint64_t sub_24536BC88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24536BC90);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24536BC94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536BC9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Handshake.Response.CodingKeys()
{
  return &type metadata for ReplicatorMessage.Handshake.Response.CodingKeys;
}

uint64_t _s16ReplicatorEngine17ReplicatorMessageO9HandshakeO8CompleteV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24536BD04 + 4 * byte_24538F92C[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24536BD38 + 4 * byte_24538F927[v4]))();
}

uint64_t sub_24536BD38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536BD40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24536BD48);
  return result;
}

uint64_t sub_24536BD54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24536BD5CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24536BD60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536BD68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Handshake.Request.CodingKeys()
{
  return &type metadata for ReplicatorMessage.Handshake.Request.CodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Ack.CodingKeys()
{
  return &type metadata for ReplicatorMessage.Ack.CodingKeys;
}

uint64_t _s16ReplicatorEngine17ReplicatorMessageO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24536BDE0 + 4 * byte_24538F936[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24536BE14 + 4 * byte_24538F931[v4]))();
}

uint64_t sub_24536BE14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536BE1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24536BE24);
  return result;
}

uint64_t sub_24536BE30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24536BE38);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24536BE3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536BE44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Handshake.CodingKeys()
{
  return &type metadata for ReplicatorMessage.Handshake.CodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Handshake.RequestCodingKeys()
{
  return &type metadata for ReplicatorMessage.Handshake.RequestCodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Handshake.ResponseCodingKeys()
{
  return &type metadata for ReplicatorMessage.Handshake.ResponseCodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Handshake.CompleteCodingKeys()
{
  return &type metadata for ReplicatorMessage.Handshake.CompleteCodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Sync.CodingKeys()
{
  return &type metadata for ReplicatorMessage.Sync.CodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value.CodingKeys()
{
  return &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.CodingKeys;
}

uint64_t _s16ReplicatorEngine17ReplicatorMessageO4SyncV10SyncRecordV8VersionsO2V0V10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24536BEFC + 4 * byte_24538F940[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24536BF30 + 4 * byte_24538F93B[v4]))();
}

uint64_t sub_24536BF30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536BF38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24536BF40);
  return result;
}

uint64_t sub_24536BF4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24536BF54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24536BF58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536BF60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value.DataCodingKeys()
{
  return &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.DataCodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.Sync.SyncRecord.Value.NoneCodingKeys()
{
  return &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.NoneCodingKeys;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.RecordManifest()
{
  return &type metadata for ReplicatorMessage.RecordManifest;
}

unint64_t sub_24536BFA0()
{
  unint64_t result;

  result = qword_2574534A8;
  if (!qword_2574534A8)
  {
    result = MEMORY[0x2495330B0](&unk_245390560, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534A8);
  }
  return result;
}

unint64_t sub_24536BFE8()
{
  unint64_t result;

  result = qword_2574534B0;
  if (!qword_2574534B0)
  {
    result = MEMORY[0x2495330B0](&unk_245390618, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534B0);
  }
  return result;
}

unint64_t sub_24536C030()
{
  unint64_t result;

  result = qword_2574534B8;
  if (!qword_2574534B8)
  {
    result = MEMORY[0x2495330B0](&unk_2453906D0, &type metadata for ReplicatorMessage.Sync.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534B8);
  }
  return result;
}

unint64_t sub_24536C078()
{
  unint64_t result;

  result = qword_2574534C0;
  if (!qword_2574534C0)
  {
    result = MEMORY[0x2495330B0](&unk_245390788, &type metadata for ReplicatorMessage.Handshake.CompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534C0);
  }
  return result;
}

unint64_t sub_24536C0C0()
{
  unint64_t result;

  result = qword_2574534C8;
  if (!qword_2574534C8)
  {
    result = MEMORY[0x2495330B0](&unk_245390840, &type metadata for ReplicatorMessage.Handshake.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534C8);
  }
  return result;
}

unint64_t sub_24536C108()
{
  unint64_t result;

  result = qword_2574534D0;
  if (!qword_2574534D0)
  {
    result = MEMORY[0x2495330B0](&unk_2453908F8, &type metadata for ReplicatorMessage.Handshake.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534D0);
  }
  return result;
}

unint64_t sub_24536C150()
{
  unint64_t result;

  result = qword_2574534D8;
  if (!qword_2574534D8)
  {
    result = MEMORY[0x2495330B0](&unk_2453909B0, &type metadata for ReplicatorMessage.Handshake.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534D8);
  }
  return result;
}

unint64_t sub_24536C198()
{
  unint64_t result;

  result = qword_2574534E0;
  if (!qword_2574534E0)
  {
    result = MEMORY[0x2495330B0](&unk_245390AB8, &type metadata for ReplicatorMessage.Handshake.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534E0);
  }
  return result;
}

unint64_t sub_24536C1E0()
{
  unint64_t result;

  result = qword_2574534E8;
  if (!qword_2574534E8)
  {
    result = MEMORY[0x2495330B0](&unk_245390B70, &type metadata for ReplicatorMessage.Handshake.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534E8);
  }
  return result;
}

unint64_t sub_24536C228()
{
  unint64_t result;

  result = qword_2574534F0;
  if (!qword_2574534F0)
  {
    result = MEMORY[0x2495330B0](&unk_245390C28, &type metadata for ReplicatorMessage.Handshake.Complete.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534F0);
  }
  return result;
}

unint64_t sub_24536C270()
{
  unint64_t result;

  result = qword_2574534F8;
  if (!qword_2574534F8)
  {
    result = MEMORY[0x2495330B0](&unk_245390B98, &type metadata for ReplicatorMessage.Handshake.Complete.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574534F8);
  }
  return result;
}

unint64_t sub_24536C2B8()
{
  unint64_t result;

  result = qword_257453500;
  if (!qword_257453500)
  {
    result = MEMORY[0x2495330B0](&unk_245390BC0, &type metadata for ReplicatorMessage.Handshake.Complete.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453500);
  }
  return result;
}

unint64_t sub_24536C300()
{
  unint64_t result;

  result = qword_257453508;
  if (!qword_257453508)
  {
    result = MEMORY[0x2495330B0](&unk_245390AE0, &type metadata for ReplicatorMessage.Handshake.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453508);
  }
  return result;
}

unint64_t sub_24536C348()
{
  unint64_t result;

  result = qword_257453510;
  if (!qword_257453510)
  {
    result = MEMORY[0x2495330B0](&unk_245390B08, &type metadata for ReplicatorMessage.Handshake.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453510);
  }
  return result;
}

unint64_t sub_24536C390()
{
  unint64_t result;

  result = qword_257453518;
  if (!qword_257453518)
  {
    result = MEMORY[0x2495330B0](&unk_245390A28, &type metadata for ReplicatorMessage.Handshake.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453518);
  }
  return result;
}

unint64_t sub_24536C3D8()
{
  unint64_t result;

  result = qword_257453520;
  if (!qword_257453520)
  {
    result = MEMORY[0x2495330B0](&unk_245390A50, &type metadata for ReplicatorMessage.Handshake.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453520);
  }
  return result;
}

unint64_t sub_24536C420()
{
  unint64_t result;

  result = qword_257453528;
  if (!qword_257453528)
  {
    result = MEMORY[0x2495330B0](&unk_2453909D8, &type metadata for ReplicatorMessage.Ack.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453528);
  }
  return result;
}

unint64_t sub_24536C468()
{
  unint64_t result;

  result = qword_257453530;
  if (!qword_257453530)
  {
    result = MEMORY[0x2495330B0](&unk_245390A00, &type metadata for ReplicatorMessage.Ack.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453530);
  }
  return result;
}

unint64_t sub_24536C4B0()
{
  unint64_t result;

  result = qword_257453538;
  if (!qword_257453538)
  {
    result = MEMORY[0x2495330B0](&unk_245390868, &type metadata for ReplicatorMessage.Handshake.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453538);
  }
  return result;
}

unint64_t sub_24536C4F8()
{
  unint64_t result;

  result = qword_257453540;
  if (!qword_257453540)
  {
    result = MEMORY[0x2495330B0](&unk_245390890, &type metadata for ReplicatorMessage.Handshake.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453540);
  }
  return result;
}

unint64_t sub_24536C540()
{
  unint64_t result;

  result = qword_257453548;
  if (!qword_257453548)
  {
    result = MEMORY[0x2495330B0](&unk_2453907B0, &type metadata for ReplicatorMessage.Handshake.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453548);
  }
  return result;
}

unint64_t sub_24536C588()
{
  unint64_t result;

  result = qword_257453550;
  if (!qword_257453550)
  {
    result = MEMORY[0x2495330B0](&unk_2453907D8, &type metadata for ReplicatorMessage.Handshake.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453550);
  }
  return result;
}

unint64_t sub_24536C5D0()
{
  unint64_t result;

  result = qword_257453558;
  if (!qword_257453558)
  {
    result = MEMORY[0x2495330B0](&unk_2453906F8, &type metadata for ReplicatorMessage.Handshake.CompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453558);
  }
  return result;
}

unint64_t sub_24536C618()
{
  unint64_t result;

  result = qword_257453560;
  if (!qword_257453560)
  {
    result = MEMORY[0x2495330B0](&unk_245390720, &type metadata for ReplicatorMessage.Handshake.CompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453560);
  }
  return result;
}

unint64_t sub_24536C660()
{
  unint64_t result;

  result = qword_257453568;
  if (!qword_257453568)
  {
    result = MEMORY[0x2495330B0](&unk_245390920, &type metadata for ReplicatorMessage.Handshake.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453568);
  }
  return result;
}

unint64_t sub_24536C6A8()
{
  unint64_t result;

  result = qword_257453570;
  if (!qword_257453570)
  {
    result = MEMORY[0x2495330B0](&unk_245390948, &type metadata for ReplicatorMessage.Handshake.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453570);
  }
  return result;
}

unint64_t sub_24536C6F0()
{
  unint64_t result;

  result = qword_257453578;
  if (!qword_257453578)
  {
    result = MEMORY[0x2495330B0](&unk_245390640, &type metadata for ReplicatorMessage.Sync.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453578);
  }
  return result;
}

unint64_t sub_24536C738()
{
  unint64_t result;

  result = qword_257453580;
  if (!qword_257453580)
  {
    result = MEMORY[0x2495330B0](&unk_245390668, &type metadata for ReplicatorMessage.Sync.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453580);
  }
  return result;
}

unint64_t sub_24536C780()
{
  unint64_t result;

  result = qword_257453588;
  if (!qword_257453588)
  {
    result = MEMORY[0x2495330B0](&unk_2453904D0, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453588);
  }
  return result;
}

unint64_t sub_24536C7C8()
{
  unint64_t result;

  result = qword_257453590;
  if (!qword_257453590)
  {
    result = MEMORY[0x2495330B0](&unk_2453904F8, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453590);
  }
  return result;
}

unint64_t sub_24536C810()
{
  unint64_t result;

  result = qword_257453598;
  if (!qword_257453598)
  {
    result = MEMORY[0x2495330B0](&unk_245390480, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453598);
  }
  return result;
}

unint64_t sub_24536C858()
{
  unint64_t result;

  result = qword_2574535A0;
  if (!qword_2574535A0)
  {
    result = MEMORY[0x2495330B0](&unk_2453904A8, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574535A0);
  }
  return result;
}

unint64_t sub_24536C8A0()
{
  unint64_t result;

  result = qword_2574535A8;
  if (!qword_2574535A8)
  {
    result = MEMORY[0x2495330B0](&unk_245390588, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574535A8);
  }
  return result;
}

unint64_t sub_24536C8E8()
{
  unint64_t result;

  result = qword_2574535B0;
  if (!qword_2574535B0)
  {
    result = MEMORY[0x2495330B0](&unk_2453905B0, &type metadata for ReplicatorMessage.Sync.SyncRecord.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574535B0);
  }
  return result;
}

uint64_t sub_24536C92C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000044;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64726F636572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24536CA20(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x74736575716572 && a2 == 0xE700000000000000;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_24536CB74(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000044;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000245395110 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656369766564 && a2 == 0xE600000000000000 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73726556656E6F7ALL && a2 == 0xEC000000736E6F69)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_24536CD40(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000044;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000245395110 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x686374616D73696DLL && a2 == 0xEF73656E6F5A6465 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x614D64726F636572 && a2 == 0xEE0074736566696ELL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_24536CF44(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000044;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000245395110 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656369766564 && a2 == 0xE600000000000000 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73726556656E6F7ALL && a2 == 0xEC000000736E6F69 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x614D64726F636572 && a2 == 0xEE0074736566696ELL)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

unint64_t sub_24536D198()
{
  unint64_t result;

  result = qword_2574535C0;
  if (!qword_2574535C0)
  {
    result = MEMORY[0x2495330B0](&unk_245391118, &type metadata for ReplicatorMessage.RecordManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574535C0);
  }
  return result;
}

unint64_t sub_24536D1DC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2574535D0;
  if (!qword_2574535D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574535C8);
    v2[0] = sub_24525C6C4(&qword_257453100, type metadata accessor for Record.ID, (uint64_t)&protocol conformance descriptor for Record.ID);
    v2[1] = sub_24525C6C4(&qword_25744F6D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    result = MEMORY[0x2495330B0](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2574535D0);
  }
  return result;
}

unint64_t sub_24536D278()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2574535E0;
  if (!qword_2574535E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574535C8);
    v2[0] = sub_24525C6C4(&qword_2574532F0, type metadata accessor for Record.ID, (uint64_t)&protocol conformance descriptor for Record.ID);
    v2[1] = sub_24525C6C4(&qword_25744F6C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    result = MEMORY[0x2495330B0](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2574535E0);
  }
  return result;
}

uint64_t _s16ReplicatorEngine17ReplicatorMessageO19HandshakeCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24536D354 + 4 * byte_24538F945[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24536D374 + 4 * byte_24538F94A[v4]))();
}

_BYTE *sub_24536D354(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24536D374(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24536D37C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24536D384(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24536D38C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24536D394(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorMessage.RecordManifest.CodingKeys()
{
  return &type metadata for ReplicatorMessage.RecordManifest.CodingKeys;
}

unint64_t sub_24536D3B4()
{
  unint64_t result;

  result = qword_2574535E8;
  if (!qword_2574535E8)
  {
    result = MEMORY[0x2495330B0](&unk_2453910F0, &type metadata for ReplicatorMessage.RecordManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574535E8);
  }
  return result;
}

unint64_t sub_24536D3FC()
{
  unint64_t result;

  result = qword_2574535F0;
  if (!qword_2574535F0)
  {
    result = MEMORY[0x2495330B0](&unk_245391060, &type metadata for ReplicatorMessage.RecordManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574535F0);
  }
  return result;
}

unint64_t sub_24536D444()
{
  unint64_t result;

  result = qword_2574535F8;
  if (!qword_2574535F8)
  {
    result = MEMORY[0x2495330B0](&unk_245391088, &type metadata for ReplicatorMessage.RecordManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574535F8);
  }
  return result;
}

uint64_t Message.init(id:responseToID:messageType:senderDeviceID:protocolVersion:encodedBody:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;

  v16 = (int *)type metadata accessor for Message();
  v17 = a9 + v16[5];
  v18 = sub_245387740();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(a9, a1, v18);
  result = sub_245263DDC(a2, v17);
  v21 = (_QWORD *)(a9 + v16[6]);
  *v21 = a3;
  v21[1] = a4;
  v22 = (_QWORD *)(a9 + v16[7]);
  *v22 = a5;
  v22[1] = a6;
  *(_QWORD *)(a9 + v16[8]) = a7;
  v23 = (_QWORD *)(a9 + v16[9]);
  *v23 = a8;
  v23[1] = a10;
  return result;
}

uint64_t type metadata accessor for Message()
{
  uint64_t result;

  result = qword_25744FD80;
  if (!qword_25744FD80)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24536D5D0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_24536D608(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24536D6CC + 4 * byte_245391176[a2]))(0x65736E6F70736572);
}

uint64_t sub_24536D6CC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x65736E6F70736572 && v1 == 0xEC00000044496F54)
    v2 = 1;
  else
    v2 = sub_245388274();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_24536D7D8(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEA00000000007265;
  v3 = 0x696669746E656469;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x6E656449656E6F7ALL;
    else
      v5 = 0x69687372656E776FLL;
    if (v4 == 1)
      v6 = 0xEE00726569666974;
    else
      v6 = 0xE900000000000070;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x696669746E656469;
  v6 = 0xEA00000000007265;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0x6E656449656E6F7ALL;
    else
      v3 = 0x69687372656E776FLL;
    if (v7 == 1)
      v2 = 0xEE00726569666974;
    else
      v2 = 0xE900000000000070;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_245388274();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24536D910(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEA00000000007265;
  v3 = 0x696669746E656469;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 1701736314;
    else
      v5 = 0x69687372656E776FLL;
    if (v4 == 1)
      v6 = 0xE400000000000000;
    else
      v6 = 0xE900000000000070;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x696669746E656469;
  v6 = 0xEA00000000007265;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 1701736314;
    else
      v3 = 0x69687372656E776FLL;
    if (v7 == 1)
      v2 = 0xE400000000000000;
    else
      v2 = 0xE900000000000070;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_245388274();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_24536DA20(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_24536DA58(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24536DB98 + 4 * byte_245391187[a2]))(1701667182);
}

uint64_t sub_24536DB98(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1701667182 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_245388274();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_24536DD4C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x73726556656E6F7ALL;
  else
    v3 = 0x654465746F6D6572;
  if (v2)
    v4 = 0xEC00000065636976;
  else
    v4 = 0xEC000000736E6F69;
  if ((a2 & 1) != 0)
    v5 = 0x73726556656E6F7ALL;
  else
    v5 = 0x654465746F6D6572;
  if ((a2 & 1) != 0)
    v6 = 0xEC000000736E6F69;
  else
    v6 = 0xEC00000065636976;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_245388274();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_24536DE00(char a1)
{
  sub_24538843C();
  __asm { BR              X10 }
}

uint64_t sub_24536DE44()
{
  sub_245387B6C();
  swift_bridgeObjectRelease();
  return sub_245388478();
}

void sub_24536DF14(uint64_t a1, char a2)
{
  sub_24538843C();
  __asm { BR              X10 }
}

uint64_t sub_24536DF54()
{
  sub_245387B6C();
  swift_bridgeObjectRelease();
  return sub_245388478();
}

void sub_24536E024(char *a1)
{
  sub_24536D5D0(*a1);
}

void sub_24536E030()
{
  char *v0;

  sub_24536DE00(*v0);
}

void sub_24536E038()
{
  __asm { BR              X10 }
}

uint64_t sub_24536E068()
{
  sub_245387B6C();
  return swift_bridgeObjectRelease();
}

void sub_24536E124(uint64_t a1)
{
  char *v1;

  sub_24536DF14(a1, *v1);
}

uint64_t sub_24536E12C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24536FC58();
  *a1 = result;
  return result;
}

uint64_t sub_24536E158()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_24536E17C + 4 * byte_2453911A4[*v0]))();
}

void sub_24536E17C(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "responseToID");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_24536E1A0(_QWORD *a1@<X8>)
{
  *a1 = 0x546567617373656DLL;
  a1[1] = 0xEB00000000657079;
}

void sub_24536E1C4(char *a1@<X8>)
{
  strcpy(a1, "senderDeviceID");
  a1[15] = -18;
}

void sub_24536E1EC(_QWORD *a1@<X8>)
{
  *a1 = 0x6C6F636F746F7270;
  a1[1] = 0xEF6E6F6973726556;
}

void sub_24536E214(_QWORD *a1@<X8>)
{
  *a1 = 0x426465646F636E65;
  a1[1] = 0xEB0000000079646FLL;
}

uint64_t sub_24536E238()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24536E25C + 4 * byte_2453911AA[*v0]))(25705, 0xE200000000000000);
}

uint64_t sub_24536E25C()
{
  return 0x65736E6F70736572;
}

uint64_t sub_24536E27C()
{
  return 0x546567617373656DLL;
}

uint64_t sub_24536E29C()
{
  return 0x65447265646E6573;
}

uint64_t sub_24536E2C0()
{
  return 0x6C6F636F746F7270;
}

uint64_t sub_24536E2E4()
{
  return 0x426465646F636E65;
}

uint64_t sub_24536E304@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24536FC58();
  *a1 = result;
  return result;
}

uint64_t sub_24536E328()
{
  sub_24536EDB4();
  return sub_2453884D8();
}

uint64_t sub_24536E350()
{
  sub_24536EDB4();
  return sub_2453884E4();
}

uint64_t Message.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245387740();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Message.id.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245387740();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*Message.id.modify())()
{
  return nullsub_1;
}

uint64_t Message.responseToID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for Message() + 20);
  return sub_24536E428(v3, a1);
}

uint64_t sub_24536E428(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Message.responseToID.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for Message() + 20);
  return sub_245263DDC(a1, v3);
}

uint64_t (*Message.responseToID.modify())(_QWORD)
{
  type metadata accessor for Message();
  return nullsub_1;
}

uint64_t Message.messageType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Message() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Message.messageType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for Message() + 24));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Message.messageType.modify())(_QWORD)
{
  type metadata accessor for Message();
  return nullsub_1;
}

uint64_t Message.senderDeviceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Message() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Message.senderDeviceID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for Message() + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Message.senderDeviceID.modify())(_QWORD)
{
  type metadata accessor for Message();
  return nullsub_1;
}

uint64_t Message.protocolVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for Message() + 32));
}

uint64_t Message.protocolVersion.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Message();
  *(_QWORD *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*Message.protocolVersion.modify())(_QWORD)
{
  type metadata accessor for Message();
  return nullsub_1;
}

uint64_t Message.encodedBody.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for Message() + 36);
  v2 = *(_QWORD *)v1;
  sub_245261C44(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t Message.encodedBody.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + *(int *)(type metadata accessor for Message() + 36);
  result = sub_24525CB80(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  return result;
}

uint64_t (*Message.encodedBody.modify())(_QWORD)
{
  type metadata accessor for Message();
  return nullsub_1;
}

uint64_t Message.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v6[2];
  uint64_t v7;
  unint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = 0;
  v8 = 0xE000000000000000;
  sub_245387EA8();
  sub_245387B90();
  sub_245387740();
  sub_24526B308(&qword_25744F6E0, MEMORY[0x24BDCEAB8]);
  sub_2453880F4();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  v4 = type metadata accessor for Message();
  sub_24536E428(v0 + *(int *)(v4 + 20), (uint64_t)v3);
  sub_245387B48();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  swift_bridgeObjectRetain();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  swift_bridgeObjectRetain();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  v6[1] = *(_QWORD *)(v0 + *(int *)(v4 + 32));
  sub_2453880F4();
  sub_245387B90();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t Message.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  __int128 v38;
  char v39;

  v30 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
  MEMORY[0x24BDAC7A8](v3);
  v32 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245387740();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v33 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_257453600);
  v31 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)type metadata accessor for Message();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t)&v13[*(int *)(v11 + 20)];
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v34 = v5;
  v15(v14, 1, 1, v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24536EDB4();
  v35 = v9;
  v16 = (uint64_t)v37;
  sub_245388490();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_24535A1AC(v14);
  }
  else
  {
    v17 = (uint64_t)v32;
    v37 = a1;
    LOBYTE(v38) = 0;
    sub_24526B308(&qword_25744F6D8, MEMORY[0x24BDCEAA8]);
    sub_245388034();
    v29[1] = v6;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v13, v33, v34);
    LOBYTE(v38) = 1;
    sub_245388004();
    sub_245263DDC(v17, v14);
    LOBYTE(v38) = 2;
    v19 = sub_24538801C();
    v20 = (uint64_t *)&v13[v10[6]];
    *v20 = v19;
    v20[1] = v21;
    LOBYTE(v38) = 3;
    v22 = sub_24538801C();
    v23 = (uint64_t *)&v13[v10[7]];
    *v23 = v22;
    v23[1] = v24;
    v39 = 5;
    sub_2452CC5D0();
    sub_245388034();
    *(_OWORD *)&v13[v10[9]] = v38;
    LOBYTE(v38) = 4;
    v25 = sub_245388010();
    v27 = v26;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v35, v36);
    v28 = 7;
    if ((v27 & 1) == 0)
      v28 = v25;
    *(_QWORD *)&v13[v10[8]] = v28;
    sub_245263EF4((uint64_t)v13, v30);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    return sub_245263E80((uint64_t)v13);
  }
}

unint64_t sub_24536EDB4()
{
  unint64_t result;

  result = qword_257453608;
  if (!qword_257453608)
  {
    result = MEMORY[0x2495330B0](&unk_2453913DC, &type metadata for Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453608);
  }
  return result;
}

uint64_t Message.encode(to:)(_QWORD *a1)
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
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257453610);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24536EDB4();
  sub_24538849C();
  LOBYTE(v12) = 0;
  sub_245387740();
  sub_24526B308(&qword_25744F6C8, MEMORY[0x24BDCEA70]);
  sub_2453880B8();
  if (!v2)
  {
    v9 = type metadata accessor for Message();
    LOBYTE(v12) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    sub_24536F034();
    sub_2453880B8();
    LOBYTE(v12) = 2;
    sub_2453880A0();
    LOBYTE(v12) = 3;
    sub_2453880A0();
    LOBYTE(v12) = 4;
    sub_2453880D0();
    v12 = *(_OWORD *)(v3 + *(int *)(v9 + 36));
    v11[15] = 5;
    sub_2452CC1A4();
    sub_2453880B8();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24536F034()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257453618;
  if (!qword_257453618)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25440C700);
    v2 = sub_24526B308(&qword_25744F6C8, MEMORY[0x24BDCEA70]);
    result = MEMORY[0x2495330B0](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257453618);
  }
  return result;
}

uint64_t sub_24536F0A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Message.init(from:)(a1, a2);
}

uint64_t sub_24536F0BC(_QWORD *a1)
{
  return Message.encode(to:)(a1);
}

uint64_t sub_24536F0D0()
{
  return sub_24526B308(&qword_25744F6D0, MEMORY[0x24BDCEA88]);
}

char *initializeBufferWithCopyOfBuffer for Message(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245387740();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = a3[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v10], 1, v7))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v9(v11, v12, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
    v15 = a3[6];
    v16 = a3[7];
    v17 = &a1[v15];
    v18 = &a2[v15];
    v19 = *((_QWORD *)v18 + 1);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *((_QWORD *)v17 + 1) = v19;
    v20 = &a1[v16];
    v21 = &a2[v16];
    v22 = *((_QWORD *)v21 + 1);
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *((_QWORD *)v20 + 1) = v22;
    v23 = a3[9];
    *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
    v24 = (uint64_t *)&a1[v23];
    v25 = &a2[v23];
    v26 = *(_QWORD *)&a2[v23];
    v27 = *((_QWORD *)v25 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245261C44(v26, v27);
    *v24 = v26;
    v24[1] = v27;
  }
  return a1;
}

uint64_t destroy for Message(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v4 = sub_245387740();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = a1 + *(int *)(a2 + 20);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4))
    v6(v7, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_24525CB80(*(_QWORD *)(a1 + *(int *)(a2 + 36)), *(_QWORD *)(a1 + *(int *)(a2 + 36) + 8));
}

uint64_t initializeWithCopy for Message(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a2 + v9, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v10, (uint64_t)v11, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v13);
  v16 = (_QWORD *)(a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = (_QWORD *)(a1 + v14);
  v19 = (_QWORD *)(a2 + v14);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v22 = (uint64_t *)(a1 + v21);
  v23 = a2 + v21;
  v24 = *(_QWORD *)(a2 + v21);
  v25 = *(_QWORD *)(v23 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_245261C44(v24, v25);
  *v22 = v24;
  v22[1] = v25;
  return a1;
}

char *assignWithCopy for Message(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  v22 = a3[9];
  v23 = (uint64_t *)&a1[v22];
  v24 = (uint64_t *)&a2[v22];
  v25 = *v24;
  v26 = v24[1];
  sub_245261C44(*v24, v26);
  v27 = *v23;
  v28 = v23[1];
  *v23 = v25;
  v23[1] = v26;
  sub_24525CB80(v27, v28);
  return a1;
}

char *initializeWithTake for Message(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v9], 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  v13 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  v14 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  return a1;
}

char *assignWithTake for Message(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = (uint64_t *)&a2[v16];
  v20 = *v18;
  v19 = v18[1];
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = (uint64_t *)&a2[v21];
  v25 = *v23;
  v24 = v23[1];
  *(_QWORD *)v22 = v25;
  *((_QWORD *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  v26 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  v27 = *(_QWORD *)&a1[v26];
  v28 = *(_QWORD *)&a1[v26 + 8];
  *(_OWORD *)&a1[v26] = *(_OWORD *)&a2[v26];
  sub_24525CB80(v27, v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for Message()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24536F850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for Message()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24536F90C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_245387740();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

void sub_24536F9B8()
{
  unint64_t v0;
  unint64_t v1;

  sub_245387740();
  if (v0 <= 0x3F)
  {
    sub_24536FA60();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_24536FA60()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25744F6E8)
  {
    sub_245387740();
    v0 = sub_245387E00();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25744F6E8);
  }
}

uint64_t storeEnumTagSinglePayload for Message.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_24536FB00 + 4 * byte_2453911B5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24536FB34 + 4 * byte_2453911B0[v4]))();
}

uint64_t sub_24536FB34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536FB3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24536FB44);
  return result;
}

uint64_t sub_24536FB50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24536FB58);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24536FB5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24536FB64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Message.CodingKeys()
{
  return &type metadata for Message.CodingKeys;
}

unint64_t sub_24536FB84()
{
  unint64_t result;

  result = qword_257453620;
  if (!qword_257453620)
  {
    result = MEMORY[0x2495330B0](&unk_2453913B4, &type metadata for Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453620);
  }
  return result;
}

unint64_t sub_24536FBCC()
{
  unint64_t result;

  result = qword_257453628;
  if (!qword_257453628)
  {
    result = MEMORY[0x2495330B0](&unk_2453912EC, &type metadata for Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453628);
  }
  return result;
}

unint64_t sub_24536FC14()
{
  unint64_t result;

  result = qword_257453630;
  if (!qword_257453630)
  {
    result = MEMORY[0x2495330B0](&unk_245391314, &type metadata for Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453630);
  }
  return result;
}

uint64_t sub_24536FC58()
{
  unint64_t v0;

  v0 = sub_245387FD4();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_24536FCA0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24536FCFC()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24536FD30(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24536FD74(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24536FDD0()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24536FE04(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24536FE48())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24536FE84(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24536FEE0()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24536FF28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24536FF78())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24536FFB4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_24536FFE4(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_245370020())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24537005C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t sub_24537008C(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 49) = a1;
  return result;
}

uint64_t (*sub_2453700C8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_245370104(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245370160()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_245370194(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2453701D8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t MetadataInMemoryStore.__allocating_init()()
{
  uint64_t result;
  uint64_t v1;

  result = swift_allocObject();
  v1 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(result + 24) = v1;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 56) = MEMORY[0x24BEE4B08];
  *(_WORD *)(result + 48) = 1;
  return result;
}

uint64_t MetadataInMemoryStore.init()()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = v0;
  v2 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v0 + 24) = v2;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE4B08];
  *(_WORD *)(v0 + 48) = 1;
  return result;
}

uint64_t MetadataInMemoryStore.__allocating_init(pairingRelationship:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  MetadataInMemoryStore.init(pairingRelationship:)(a1);
  return v2;
}

uint64_t MetadataInMemoryStore.init(pairingRelationship:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FAD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v2 + 24) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v2 + 16) = v7;
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE4B08];
  v8 = type metadata accessor for PairingRelationship();
  v9 = (uint64_t *)(a1 + *(int *)(v8 + 20));
  v10 = *v9;
  v11 = v9[1];
  sub_2452B792C(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 0, 1, v8);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24531BC10((uint64_t)v6, v10, v11);
  swift_endAccess();
  sub_2452B7B5C(a1, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
  *(_WORD *)(v2 + 48) = 1;
  return v2;
}

uint64_t MetadataInMemoryStore.__allocating_init(pairingRelationships:)(uint64_t a1)
{
  uint64_t v2;

  swift_allocObject();
  v2 = sub_245373C1C(a1);
  swift_bridgeObjectRelease();
  return v2;
}

{
  uint64_t v2;

  v2 = swift_allocObject();
  MetadataInMemoryStore.init(pairingRelationships:)(a1);
  return v2;
}

uint64_t MetadataInMemoryStore.init(pairingRelationships:)(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_245373C1C(a1);
  swift_bridgeObjectRelease();
  return v1;
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v43;
  char v44;
  unint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  char v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t result;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  uint64_t *v64;
  _QWORD *v65;
  int64_t v66;
  uint64_t v67;
  unint64_t v68;
  _QWORD *v69;
  _QWORD *v70;

  v3 = type metadata accessor for PairingRelationship();
  v67 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v58 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744FFA0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t *)((char *)&v58 - v13);
  v66 = 0;
  v15 = MEMORY[0x24BEE4B00];
  v60 = v1;
  *(_QWORD *)(v1 + 24) = MEMORY[0x24BEE4B00];
  v16 = (_QWORD *)(v1 + 24);
  *(v16 - 1) = v15;
  v16[1] = 0;
  v16[2] = 0;
  v69 = v16;
  v16[4] = MEMORY[0x24BEE4B08];
  v63 = a1;
  v19 = *(_QWORD *)(a1 + 64);
  v18 = a1 + 64;
  v17 = v19;
  v20 = 1 << *(_BYTE *)(v18 - 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v17;
  v61 = v18;
  v62 = (unint64_t)(v20 + 63) >> 6;
  v59 = v62 - 1;
  v64 = (uint64_t *)((char *)&v58 - v13);
  v65 = v12;
  while (1)
  {
    if (v22)
    {
      v23 = __clz(__rbit64(v22));
      v24 = (v22 - 1) & v22;
      v25 = v23 | (v66 << 6);
LABEL_8:
      v26 = *(_QWORD *)(v63 + 56);
      v27 = (_QWORD *)(*(_QWORD *)(v63 + 48) + 16 * v25);
      v28 = v27[1];
      *v12 = *v27;
      v12[1] = v28;
      v29 = v26 + *(_QWORD *)(v67 + 72) * v25;
      v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FF90);
      sub_2452B792C(v29, (uint64_t)v12 + *(int *)(v30 + 48), (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v12, 0, 1, v30);
      swift_bridgeObjectRetain();
      goto LABEL_27;
    }
    v31 = v66 + 1;
    if (__OFADD__(v66, 1))
      goto LABEL_42;
    if (v31 < v62)
    {
      v32 = *(_QWORD *)(v61 + 8 * v31);
      if (v32)
        goto LABEL_12;
      v33 = v66 + 2;
      ++v66;
      if (v31 + 1 < v62)
      {
        v32 = *(_QWORD *)(v61 + 8 * v33);
        if (v32)
          goto LABEL_15;
        v66 = v31 + 1;
        if (v31 + 2 < v62)
        {
          v32 = *(_QWORD *)(v61 + 8 * (v31 + 2));
          if (v32)
          {
            v31 += 2;
            goto LABEL_12;
          }
          v33 = v31 + 3;
          v66 = v31 + 2;
          if (v31 + 3 < v62)
            break;
        }
      }
    }
LABEL_26:
    v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FF90);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v12, 1, 1, v34);
    v24 = 0;
LABEL_27:
    sub_245373EE0((uint64_t)v12, (uint64_t)v14);
    v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FF90);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 48))(v14, 1, v35) == 1)
    {
      swift_release();
      result = v60;
      *(_WORD *)(v60 + 48) = 1;
      return result;
    }
    v68 = v24;
    v37 = *v14;
    v36 = v14[1];
    sub_2452B7AB8((uint64_t)v14 + *(int *)(v35 + 48), (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
    v38 = v69;
    swift_beginAccess();
    v39 = (uint64_t)v8;
    v40 = (uint64_t)v8;
    v41 = (uint64_t)v6;
    sub_2452B792C(v40, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v70 = (_QWORD *)*v38;
    v43 = v70;
    *v38 = 0x8000000000000000;
    v45 = sub_2452C1D98(v37, v36);
    v46 = v43[2];
    v47 = (v44 & 1) == 0;
    v48 = v46 + v47;
    if (__OFADD__(v46, v47))
    {
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    v49 = v44;
    if (v43[3] >= v48)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v52 = v70;
        if ((v44 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_2452C8404();
        v52 = v70;
        if ((v49 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_2452C4220(v48, isUniquelyReferenced_nonNull_native);
      v50 = sub_2452C1D98(v37, v36);
      if ((v49 & 1) != (v51 & 1))
        goto LABEL_44;
      v45 = v50;
      v52 = v70;
      if ((v49 & 1) != 0)
      {
LABEL_4:
        v6 = (char *)v41;
        sub_2452BC64C(v41, v52[7] + *(_QWORD *)(v67 + 72) * v45, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
        goto LABEL_5;
      }
    }
    v52[(v45 >> 6) + 8] |= 1 << v45;
    v53 = (uint64_t *)(v52[6] + 16 * v45);
    *v53 = v37;
    v53[1] = v36;
    v6 = (char *)v41;
    sub_2452B7AB8(v41, v52[7] + *(_QWORD *)(v67 + 72) * v45, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
    v54 = v52[2];
    v55 = __OFADD__(v54, 1);
    v56 = v54 + 1;
    if (v55)
      goto LABEL_41;
    v52[2] = v56;
    swift_bridgeObjectRetain();
LABEL_5:
    *v69 = v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    v8 = (char *)v39;
    sub_2452B7B5C(v39, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
    v14 = v64;
    v12 = v65;
    v22 = v68;
  }
  v32 = *(_QWORD *)(v61 + 8 * v33);
  if (v32)
  {
LABEL_15:
    v31 = v33;
LABEL_12:
    v24 = (v32 - 1) & v32;
    v25 = __clz(__rbit64(v32)) + (v31 << 6);
    v66 = v31;
    goto LABEL_8;
  }
  while (1)
  {
    v31 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v31 >= v62)
    {
      v66 = v59;
      goto LABEL_26;
    }
    v32 = *(_QWORD *)(v61 + 8 * v31);
    ++v33;
    if (v32)
      goto LABEL_12;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_2453883DC();
  __break(1u);
  return result;
}

uint64_t sub_2453709E4()
{
  uint64_t v0;

  swift_beginAccess();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t sub_245370A24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FAD0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PairingRelationship();
  v6 = (uint64_t *)(a1 + *(int *)(v5 + 20));
  v7 = *v6;
  v8 = v6[1];
  sub_2452B792C(a1, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 0, 1, v5);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24531BC10((uint64_t)v4, v7, v8);
  return swift_endAccess();
}

uint64_t sub_245370B10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FAD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PairingRelationship();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24531BC10((uint64_t)v6, a1, a2);
  return swift_endAccess();
}

uint64_t sub_245370BD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)();
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  char *v23;
  uint64_t (*v24)();
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v26;
  _QWORD *v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;

  v3 = type metadata accessor for Record.ID(0);
  v42 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (_QWORD *)((char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for RecordMetadata();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v7);
  v44 = (uint64_t)v41 - v12;
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v41[0] = v3;
    v41[1] = a1;
    v14 = (_QWORD *)(v1 + 16);
    v15 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v16 = *(_QWORD *)(v11 + 72);
    swift_bridgeObjectRetain();
    v17 = type metadata accessor for RecordMetadata;
    v18 = type metadata accessor for Record.ID;
    v43 = v14;
    while (1)
    {
      v45 = v13;
      v21 = v44;
      sub_2452B792C(v15, v44, (uint64_t (*)(_QWORD))v17);
      v22 = v18;
      sub_2452B792C(v21, (uint64_t)v5, v18);
      swift_beginAccess();
      v23 = v9;
      v24 = v17;
      sub_2452B7AB8(v21, (uint64_t)v9, (uint64_t (*)(_QWORD))v17);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v26 = v14;
      v27 = (_QWORD *)*v14;
      v46 = v27;
      *v26 = 0x8000000000000000;
      v29 = sub_2452C2000(v5);
      v30 = v27[2];
      v31 = (v28 & 1) == 0;
      v32 = v30 + v31;
      if (__OFADD__(v30, v31))
        break;
      v33 = v28;
      if (v27[3] >= v32)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_2452C816C();
      }
      else
      {
        sub_2452C3C4C(v32, isUniquelyReferenced_nonNull_native);
        v34 = sub_2452C2000(v5);
        if ((v33 & 1) != (v35 & 1))
          goto LABEL_18;
        v29 = v34;
      }
      v9 = v23;
      v36 = v46;
      v18 = v22;
      if ((v33 & 1) != 0)
      {
        v19 = v46[7] + v29 * v16;
        v17 = v24;
        sub_2452BC64C((uint64_t)v9, v19, (uint64_t (*)(_QWORD))v24);
      }
      else
      {
        v46[(v29 >> 6) + 8] |= 1 << v29;
        sub_2452B792C((uint64_t)v5, v36[6] + *(_QWORD *)(v42 + 72) * v29, v22);
        v37 = v36[7] + v29 * v16;
        v17 = v24;
        sub_2452B7AB8((uint64_t)v9, v37, (uint64_t (*)(_QWORD))v24);
        v38 = v36[2];
        v39 = __OFADD__(v38, 1);
        v40 = v38 + 1;
        if (v39)
          goto LABEL_17;
        v36[2] = v40;
      }
      v20 = v43;
      *v43 = v36;
      v14 = v20;
      swift_bridgeObjectRelease();
      sub_2452B7B5C((uint64_t)v5, v22);
      swift_endAccess();
      v15 += v16;
      v13 = v45 - 1;
      if (v45 == 1)
        return swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    result = sub_2453883DC();
    __break(1u);
  }
  return result;
}

uint64_t sub_245370EB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  char v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F848);
  result = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v8 = (uint64_t *)(v1 + 16);
    v9 = *(_QWORD *)(type metadata accessor for Record.ID(0) - 8);
    v10 = (_QWORD *)(a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)));
    v11 = *(_QWORD *)(v9 + 72);
    v21[1] = a1;
    swift_bridgeObjectRetain();
    do
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v13 = sub_2452C2000(v10);
      v15 = v14;
      swift_bridgeObjectRelease();
      if ((v15 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v17 = *v8;
        v22 = *v8;
        *v8 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2452C816C();
          v17 = v22;
        }
        sub_2452B7B5C(*(_QWORD *)(v17 + 48) + v13 * v11, type metadata accessor for Record.ID);
        v18 = *(_QWORD *)(v17 + 56);
        v19 = type metadata accessor for RecordMetadata();
        v20 = *(_QWORD *)(v19 - 8);
        sub_2452B7AB8(v18 + *(_QWORD *)(v20 + 72) * v13, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for RecordMetadata);
        sub_245371948(v13, v17);
        *v8 = v17;
        swift_bridgeObjectRelease();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v6, 0, 1, v19);
      }
      else
      {
        v12 = type metadata accessor for RecordMetadata();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v6, 1, 1, v12);
      }
      sub_245373F28((uint64_t)v6);
      swift_endAccess();
      v10 = (_QWORD *)((char *)v10 + v11);
      --v7;
    }
    while (v7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_245371090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_245332C7C(v2, v1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 56) = v3;
  return swift_bridgeObjectRelease();
}

uint64_t sub_245371104(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257450210);
  v4 = sub_245387740();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_245389A60;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v7 + v6, a1, v4);
  swift_bridgeObjectRetain();
  v8 = sub_245332C7C(v7, v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  *(_QWORD *)(v1 + 56) = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24537120C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD v5[5];

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 56);
  v5[2] = a1;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v1 + 56) = sub_245373838((uint64_t)sub_245373F68, (uint64_t)v5, v3);
  return swift_bridgeObjectRelease();
}

BOOL sub_245371284()
{
  sub_245387740();
  sub_24526B308(&qword_257452430, MEMORY[0x24BDCEA98]);
  return (sub_245387AE8() & 1) == 0;
}

uint64_t MetadataInMemoryStore.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MetadataInMemoryStore.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_245371364(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;

  v5 = *v2;
  swift_beginAccess();
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2453713B8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2453713F8(char a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 48) = a1;
  return result;
}

uint64_t (*sub_245371438())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_245371478(char a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 49) = a1;
  return result;
}

uint64_t (*sub_2453714B8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2453714F8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_beginAccess();
  *(_QWORD *)(v3 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_245371540())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_245371580()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t sub_2453715CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FAD0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PairingRelationship();
  v6 = (uint64_t *)(a1 + *(int *)(v5 + 20));
  v7 = *v6;
  v8 = v6[1];
  sub_2452B792C(a1, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 0, 1, v5);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24531BC10((uint64_t)v4, v7, v8);
  return swift_endAccess();
}

uint64_t sub_2453716BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FAD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PairingRelationship();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24531BC10((uint64_t)v6, a1, a2);
  return swift_endAccess();
}

uint64_t sub_245371784(uint64_t a1)
{
  return sub_245370BD4(a1);
}

uint64_t sub_2453717A4(uint64_t a1)
{
  return sub_245370EB8(a1);
}

uint64_t sub_2453717C4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_245371810()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 48);
}

uint64_t sub_24537184C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24537188C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2453718CC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 49);
}

uint64_t sub_245371908()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

unint64_t sub_245371948(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = sub_245387740();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Record.ID.Ownership(0);
  MEMORY[0x24BDAC7A8](v7);
  v40 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = type metadata accessor for Record.ID(0);
  result = MEMORY[0x24BDAC7A8](v42);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a2 + 64;
  v14 = -1 << *(_BYTE *)(a2 + 32);
  v15 = (a1 + 1) & ~v14;
  if (((1 << v15) & *(_QWORD *)(a2 + 64 + 8 * (v15 >> 6))) != 0)
  {
    v41 = v10;
    v16 = ~v14;
    result = sub_245387E48();
    if ((*(_QWORD *)(v13 + 8 * (v15 >> 6)) & (1 << v15)) != 0)
    {
      v36 = (result + 1) & v16;
      v17 = v16;
      v18 = *(_QWORD *)(v41 + 72);
      v38 = a2 + 64;
      v39 = a2;
      v37 = v17;
      v41 = v18;
      do
      {
        v19 = v18 * v15;
        sub_2452B792C(*(_QWORD *)(a2 + 48) + v18 * v15, (uint64_t)v12, type metadata accessor for Record.ID);
        sub_24538843C();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        sub_245387B6C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v20 = v40;
        sub_2452B792C((uint64_t)&v12[*(int *)(v42 + 24)], v40, type metadata accessor for Record.ID.Ownership);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v20, 1, v4) == 1)
        {
          sub_245388448();
        }
        else
        {
          v21 = v35;
          (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v35, v20, v4);
          sub_245388448();
          sub_24526B308(&qword_25744F6D0, MEMORY[0x24BDCEA88]);
          sub_245387AB8();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v21, v4);
        }
        swift_bridgeObjectRetain();
        sub_245387B6C();
        swift_bridgeObjectRelease();
        v22 = sub_245388478();
        result = sub_2452B7B5C((uint64_t)v12, type metadata accessor for Record.ID);
        v23 = v37;
        v24 = v22 & v37;
        v13 = v38;
        a2 = v39;
        if ((uint64_t)a1 >= (uint64_t)v36)
        {
          v18 = v41;
          if (v24 < v36)
            goto LABEL_5;
        }
        else
        {
          v18 = v41;
          if (v24 >= v36)
            goto LABEL_14;
        }
        if ((uint64_t)a1 >= (uint64_t)v24)
        {
LABEL_14:
          if ((uint64_t)(v18 * a1) < v19 || *(_QWORD *)(v39 + 48) + v18 * a1 >= *(_QWORD *)(v39 + 48) + v19 + v18)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v18 * a1 != v19)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v25 = *(_QWORD *)(a2 + 56);
          v26 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for RecordMetadata() - 8) + 72);
          v27 = v26 * a1;
          result = v25 + v26 * a1;
          if ((uint64_t)(v26 * a1) < (uint64_t)(v26 * v15) || result >= v25 + v26 * v15 + v26)
          {
            result = swift_arrayInitWithTakeFrontToBack();
            a1 = v15;
            v18 = v41;
          }
          else
          {
            a1 = v15;
            v18 = v41;
            if (v27 != v26 * v15)
            {
              result = swift_arrayInitWithTakeBackToFront();
              a1 = v15;
            }
          }
        }
LABEL_5:
        v15 = (v15 + 1) & v23;
      }
      while (((*(_QWORD *)(v13 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0);
    }
    v28 = (uint64_t *)(v13 + 8 * (a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v13 + 8 * (a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245371DBC(unint64_t a1, uint64_t a2)
{
  return sub_245372F60(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for PairingRelationship);
}

unint64_t sub_245371DC8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_245387E48();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_24538843C();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        v9 = sub_245388478();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245371F9C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_245387E48();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_24538843C();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        sub_245387B6C();
        v9 = sub_245388478();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 32 * v3);
          v13 = (_OWORD *)(v11 + 32 * v6);
          if (v3 != v6 || v12 >= v13 + 2)
          {
            v14 = v13[1];
            *v12 = *v13;
            v12[1] = v14;
          }
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_QWORD *)(v15 + 8 * v3);
          v17 = (_QWORD *)(v15 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
          {
            *v16 = *v17;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24537219C(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = sub_245387740();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Record.ID.Ownership(0);
  MEMORY[0x24BDAC7A8](v7);
  v41 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = type metadata accessor for Record.ID(0);
  result = MEMORY[0x24BDAC7A8](v42);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a2 + 64;
  v14 = -1 << *(_BYTE *)(a2 + 32);
  v15 = (a1 + 1) & ~v14;
  if (((1 << v15) & *(_QWORD *)(a2 + 64 + 8 * (v15 >> 6))) != 0)
  {
    v36 = v10;
    v16 = ~v14;
    result = sub_245387E48();
    if ((*(_QWORD *)(v13 + 8 * (v15 >> 6)) & (1 << v15)) != 0)
    {
      v37 = (result + 1) & v16;
      v17 = v16;
      v18 = *(_QWORD *)(v36 + 72);
      v39 = a2 + 64;
      v40 = a2;
      v38 = v17;
      v36 = v18;
      while (1)
      {
        v19 = v18 * v15;
        sub_2452B792C(*(_QWORD *)(a2 + 48) + v18 * v15, (uint64_t)v12, type metadata accessor for Record.ID);
        sub_24538843C();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        sub_245387B6C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v20 = v41;
        sub_2452B792C((uint64_t)&v12[*(int *)(v42 + 24)], v41, type metadata accessor for Record.ID.Ownership);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v20, 1, v4) == 1)
        {
          sub_245388448();
        }
        else
        {
          v21 = v35;
          (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v35, v20, v4);
          sub_245388448();
          sub_24526B308(&qword_25744F6D0, MEMORY[0x24BDCEA88]);
          sub_245387AB8();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v21, v4);
        }
        swift_bridgeObjectRetain();
        sub_245387B6C();
        swift_bridgeObjectRelease();
        v22 = sub_245388478();
        result = sub_2452B7B5C((uint64_t)v12, type metadata accessor for Record.ID);
        v23 = v38;
        v24 = v22 & v38;
        v13 = v39;
        a2 = v40;
        if ((uint64_t)a1 >= (uint64_t)v37)
          break;
        v18 = v36;
        if (v24 < v37)
          goto LABEL_14;
LABEL_15:
        if ((uint64_t)(v18 * a1) < v19 || *(_QWORD *)(v40 + 48) + v18 * a1 >= *(_QWORD *)(v40 + 48) + v19 + v18)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v18 * a1 != v19)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        v25 = *(_QWORD *)(a2 + 56);
        v26 = *(_QWORD *)(v5 + 72);
        v27 = v26 * a1;
        result = v25 + v26 * a1;
        if ((uint64_t)(v26 * a1) < (uint64_t)(v26 * v15) || result >= v25 + v26 * v15 + v26)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v15;
          if (v27 == v26 * v15)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        a1 = v15;
LABEL_6:
        v15 = (v15 + 1) & v23;
        if (((*(_QWORD *)(v13 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          goto LABEL_24;
      }
      v18 = v36;
      if (v24 < v37)
        goto LABEL_6;
LABEL_14:
      if ((uint64_t)a1 < (uint64_t)v24)
        goto LABEL_6;
      goto LABEL_15;
    }
LABEL_24:
    v28 = (uint64_t *)(v13 + 8 * (a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v13 + 8 * (a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2453725F8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_245387E48();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_24538843C();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        sub_245387B6C();
        v9 = sub_245388478();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 32 * v3);
        v13 = (_OWORD *)(v11 + 32 * v6);
        if (v3 != v6 || v12 >= v13 + 2)
        {
          v14 = v13[1];
          *v12 = *v13;
          v12[1] = v14;
        }
        v15 = *(_QWORD *)(a2 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for ZoneVersion() - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245372820(int64_t a1, uint64_t a2)
{
  return sub_245372AC4(a1, a2, type metadata accessor for Replicator.Session);
}

unint64_t sub_24537282C(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;

  v4 = sub_245387740();
  v34 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_245387E48();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v33 = (result + 1) & v11;
      v12 = *(_QWORD *)(v34 + 72);
      v32 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v32(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_24526B308(&qword_25744F6D0, MEMORY[0x24BDCEA88]);
        v17 = sub_245387AAC();
        result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v33)
        {
          if (v18 >= v33 && a1 >= (uint64_t)v18)
          {
LABEL_17:
            v21 = *(_QWORD *)(a2 + 48);
            result = v21 + v14 * a1;
            if (v14 * a1 < v15 || (v12 = v14, result >= v21 + v15 + v14))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_22:
              v13 = v16;
              v12 = v14;
            }
            else if (v14 * a1 != v15)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_22;
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = (_QWORD *)(v22 + 8 * a1);
            v24 = (_QWORD *)(v22 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v33 || a1 >= (uint64_t)v18)
        {
          goto LABEL_17;
        }
        v12 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v26 = *v25;
    v27 = (-1 << a1) - 1;
  }
  else
  {
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v25;
    v26 = (-1 << a1) - 1;
  }
  *v25 = v27 & v26;
  v28 = *(_QWORD *)(a2 + 16);
  v29 = __OFSUB__(v28, 1);
  v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245372AB8(int64_t a1, uint64_t a2)
{
  return sub_245372AC4(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for NetworkBrowser.Monitor);
}

unint64_t sub_245372AC4(int64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  unint64_t v27;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t (*v35)(_QWORD);
  void (*v36)(char *, unint64_t, uint64_t);
  unint64_t v37;
  uint64_t v38;

  v35 = a3;
  v5 = sub_245387740();
  v38 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a2 + 64;
  v10 = -1 << *(_BYTE *)(a2 + 32);
  v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(_QWORD *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    v12 = ~v10;
    result = sub_245387E48();
    if ((*(_QWORD *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      v37 = (result + 1) & v12;
      v13 = *(_QWORD *)(v38 + 72);
      v36 = *(void (**)(char *, unint64_t, uint64_t))(v38 + 16);
      v14 = v12;
      do
      {
        v15 = v9;
        v16 = v13;
        v17 = v13 * v11;
        v18 = v14;
        v36(v8, *(_QWORD *)(a2 + 48) + v13 * v11, v5);
        sub_24526B308(&qword_25744F6D0, MEMORY[0x24BDCEA88]);
        v19 = sub_245387AAC();
        result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v8, v5);
        v14 = v18;
        v20 = v19 & v18;
        if (a1 >= (uint64_t)v37)
        {
          if (v20 >= v37 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            v9 = v15;
            if (v16 * a1 < v17
              || *(_QWORD *)(a2 + 48) + v16 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v17 + v16))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v16 * a1 != v17)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = *(_QWORD *)(*(_QWORD *)(v35(0) - 8) + 72);
            v25 = v24 * a1;
            result = v23 + v24 * a1;
            v26 = v24 * v11;
            v27 = v23 + v24 * v11 + v24;
            if (v25 < v26 || result >= v27)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              v14 = v18;
            }
            else
            {
              a1 = v11;
              v14 = v18;
              if (v25 != v26)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v14 = v18;
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v37 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        v9 = v15;
LABEL_5:
        v11 = (v11 + 1) & v14;
        v13 = v16;
      }
      while (((*(_QWORD *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v29;
    v31 = (-1 << a1) - 1;
  }
  else
  {
    v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    v31 = *v29;
    v30 = (-1 << a1) - 1;
  }
  *v29 = v31 & v30;
  v32 = *(_QWORD *)(a2 + 16);
  v33 = __OFSUB__(v32, 1);
  v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245372D98(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_245387E48();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_245388430();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_QWORD *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for ConnectionDurationMonitor.ConnectionDescriptor() - 8)
                        + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245372F54(unint64_t a1, uint64_t a2)
{
  return sub_245372F60(a1, a2, type metadata accessor for NetworkMessenger.ExpiringConnection);
}

unint64_t sub_245372F60(unint64_t result, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v4 = result;
  v5 = a2 + 64;
  v6 = -1 << *(_BYTE *)(a2 + 32);
  v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(_QWORD *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    v9 = ~v6;
    result = sub_245387E48();
    if ((*(_QWORD *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      v10 = (result + 1) & v9;
      while (1)
      {
        sub_24538843C();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        v11 = sub_245388478();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v9;
        if (v4 >= (uint64_t)v10)
          break;
        if (v12 < v10)
          goto LABEL_11;
LABEL_12:
        v13 = *(_QWORD *)(a2 + 48);
        v14 = (_OWORD *)(v13 + 16 * v4);
        v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1)
          *v14 = *v15;
        v16 = *(_QWORD *)(a2 + 56);
        v17 = *(_QWORD *)(*(_QWORD *)(a3(0) - 8) + 72);
        v18 = v17 * v4;
        result = v16 + v17 * v4;
        v19 = v17 * v7;
        v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v4 = v7;
          if (v18 == v19)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v4 = v7;
LABEL_6:
        v7 = (v7 + 1) & v9;
        if (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          goto LABEL_21;
      }
      if (v12 < v10)
        goto LABEL_6;
LABEL_11:
      if (v4 < (uint64_t)v12)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    v23 = *v22;
    v24 = (-1 << v4) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245373168(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;

  v4 = sub_245387740();
  v34 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_245387E48();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v33 = (result + 1) & v11;
      v12 = *(_QWORD *)(v34 + 72);
      v32 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v32(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_24526B308(&qword_25744F6D0, MEMORY[0x24BDCEA88]);
        v17 = sub_245387AAC();
        result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v33)
        {
          if (v18 >= v33 && a1 >= (uint64_t)v18)
          {
LABEL_17:
            v21 = *(_QWORD *)(a2 + 48);
            result = v21 + v14 * a1;
            if (v14 * a1 < v15 || (v12 = v14, result >= v21 + v15 + v14))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_22:
              v13 = v16;
              v12 = v14;
            }
            else if (v14 * a1 != v15)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_22;
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = (_OWORD *)(v22 + 16 * a1);
            v24 = (_OWORD *)(v22 + 16 * v10);
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v33 || a1 >= (uint64_t)v18)
        {
          goto LABEL_17;
        }
        v12 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v26 = *v25;
    v27 = (-1 << a1) - 1;
  }
  else
  {
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v25;
    v26 = (-1 << a1) - 1;
  }
  *v25 = v27 & v26;
  v28 = *(_QWORD *)(a2 + 16);
  v29 = __OFSUB__(v28, 1);
  v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2453733F4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_245387E48();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_24538843C();
        sub_245388460();
        result = sub_245388478();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v9 < v8)
          goto LABEL_11;
LABEL_12:
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_BYTE *)(v10 + v3);
        v12 = (_BYTE *)(v10 + v6);
        if (v3 != v6 || v11 >= v12 + 1)
          *v11 = *v12;
        v13 = *(_QWORD *)(a2 + 56);
        v14 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for NetworkMessenger.PartialIncomingMessage(0) - 8) + 72);
        v15 = v14 * v3;
        result = v13 + v14 * v3;
        v16 = v14 * v6;
        v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v15 == v16)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v9 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v9)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2453735D4(unint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  __int128 *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;

  v2 = a2;
  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_245387E48();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      v29 = v4;
      do
      {
        v11 = v2;
        v12 = v8;
        sub_24538843C();
        swift_bridgeObjectRetain();
        sub_245387B6C();
        sub_24538846C();
        sub_24538846C();
        sub_24538846C();
        v13 = sub_245388478();
        result = swift_bridgeObjectRelease();
        v8 = v12;
        v14 = v13 & v7;
        if (v3 >= (uint64_t)v12)
        {
          if (v14 < v12)
          {
            v4 = v29;
            v2 = v11;
          }
          else
          {
            v4 = v29;
            v2 = v11;
            if (v3 >= (uint64_t)v14)
              goto LABEL_12;
          }
        }
        else
        {
          v4 = v29;
          v2 = v11;
          if (v14 >= v8 || v3 >= (uint64_t)v14)
          {
LABEL_12:
            v15 = *(_QWORD *)(v2 + 48);
            v16 = v15 + 40 * v3;
            v17 = (__int128 *)(v15 + 40 * v6);
            if (v3 != v6 || v16 >= (unint64_t)v17 + 40)
            {
              v18 = *v17;
              v19 = v17[1];
              *(_QWORD *)(v16 + 32) = *((_QWORD *)v17 + 4);
              *(_OWORD *)v16 = v18;
              *(_OWORD *)(v16 + 16) = v19;
            }
            v20 = *(_QWORD *)(v2 + 56);
            v21 = v20 + 40 * v3;
            v22 = (__int128 *)(v20 + 40 * v6);
            if (v3 != v6 || (v3 = v6, v21 >= (unint64_t)v22 + 40))
            {
              v9 = *v22;
              v10 = v22[1];
              *(_QWORD *)(v21 + 32) = *((_QWORD *)v22 + 4);
              *(_OWORD *)v21 = v9;
              *(_OWORD *)(v21 + 16) = v10;
              v3 = v6;
            }
          }
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v24 = *v23;
    v25 = (-1 << v3) - 1;
  }
  else
  {
    v23 = (uint64_t *)(v4 + 8 * (result >> 6));
    v25 = *v23;
    v24 = (-1 << result) - 1;
  }
  *v23 = v25 & v24;
  v26 = *(_QWORD *)(v2 + 16);
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = v28;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

uint64_t sub_245373838(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v5)(char *);
  char v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v5 = (uint64_t (*)(char *))isStackAllocationSafe;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_BYTE *)(a3 + 32);
  v7 = (unint64_t)((1 << v6) + 63) >> 6;
  v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    v9 = sub_2453739B4((_QWORD *)((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a3, v5);
    swift_release();
    if (v3)
      swift_willThrow();
  }
  else
  {
    v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    v9 = sub_2453739B4((unint64_t *)v10, v7, a3, v5);
    swift_release();
    MEMORY[0x24953317C](v10, -1, -1);
  }
  return v9;
}

uint64_t sub_2453739B4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *))
{
  uint64_t v4;
  uint64_t v6;
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
  BOOL v18;
  unint64_t v19;
  int64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t (*v31)(char *);
  uint64_t v32;

  v31 = a4;
  v26 = a2;
  v27 = a1;
  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  v32 = a3;
  v12 = *(_QWORD *)(a3 + 56);
  v28 = 0;
  v29 = a3 + 56;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v30 = (unint64_t)(v13 + 63) >> 6;
  while (v15)
  {
    v16 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v17 = v16 | (v11 << 6);
LABEL_17:
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v10, *(_QWORD *)(v32 + 48) + *(_QWORD *)(v7 + 72) * v17, v6);
    v21 = v31(v10);
    if (v4)
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v22 = v21;
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    if ((v22 & 1) != 0)
    {
      *(unint64_t *)((char *)v27 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = __OFADD__(v28++, 1);
      if (v18)
        goto LABEL_30;
    }
  }
  v18 = __OFADD__(v11++, 1);
  if (v18)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v30)
    goto LABEL_27;
  v19 = *(_QWORD *)(v29 + 8 * v11);
  if (v19)
  {
LABEL_16:
    v15 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v11 << 6);
    goto LABEL_17;
  }
  v20 = v11 + 1;
  if (v11 + 1 >= v30)
    goto LABEL_27;
  v19 = *(_QWORD *)(v29 + 8 * v20);
  if (v19)
    goto LABEL_15;
  v20 = v11 + 2;
  if (v11 + 2 >= v30)
    goto LABEL_27;
  v19 = *(_QWORD *)(v29 + 8 * v20);
  if (v19)
    goto LABEL_15;
  v20 = v11 + 3;
  if (v11 + 3 >= v30)
  {
LABEL_27:
    v23 = v26;
    v24 = v28;
    v25 = v32;
    swift_retain();
    return sub_24534A728(v27, v23, v24, v25);
  }
  v19 = *(_QWORD *)(v29 + 8 * v20);
  if (v19)
  {
LABEL_15:
    v11 = v20;
    goto LABEL_16;
  }
  while (1)
  {
    v11 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v11 >= v30)
      goto LABEL_27;
    v19 = *(_QWORD *)(v29 + 8 * v11);
    ++v20;
    if (v19)
      goto LABEL_16;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_245373C1C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)();
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)();
  char *v19;
  _QWORD *v20;
  uint64_t (*v21)();
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  _QWORD *v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;

  v42 = type metadata accessor for PairingRelationship();
  v3 = MEMORY[0x24BDAC7A8](v42);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v38 - v7;
  v9 = MEMORY[0x24BEE4B00];
  v39 = v1;
  v1[3] = MEMORY[0x24BEE4B00];
  v10 = v1 + 3;
  v1[2] = v9;
  v1[4] = 0;
  v1[5] = 0;
  v1[7] = MEMORY[0x24BEE4B08];
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v13 = *(_QWORD *)(v6 + 72);
    v14 = type metadata accessor for PairingRelationship;
    v40 = (char *)&v38 - v7;
    v41 = v1 + 3;
    while (1)
    {
      v43 = v11;
      sub_2452B792C(v12, (uint64_t)v8, (uint64_t (*)(_QWORD))v14);
      v15 = (uint64_t *)&v8[*(int *)(v42 + 20)];
      v17 = *v15;
      v16 = v15[1];
      swift_beginAccess();
      v18 = v14;
      v19 = v5;
      v20 = v10;
      v21 = v18;
      sub_2452B792C((uint64_t)v8, (uint64_t)v5, (uint64_t (*)(_QWORD))v18);
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v44 = (_QWORD *)*v20;
      v23 = v44;
      *v20 = 0x8000000000000000;
      v25 = sub_2452C1D98(v17, v16);
      v26 = v23[2];
      v27 = (v24 & 1) == 0;
      v28 = v26 + v27;
      if (__OFADD__(v26, v27))
        break;
      v29 = v24;
      if (v23[3] >= v28)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_2452C8404();
      }
      else
      {
        sub_2452C4220(v28, isUniquelyReferenced_nonNull_native);
        v30 = sub_2452C1D98(v17, v16);
        if ((v29 & 1) != (v31 & 1))
          goto LABEL_17;
        v25 = v30;
      }
      v5 = v19;
      v32 = v44;
      v14 = v21;
      if ((v29 & 1) != 0)
      {
        sub_2452BC64C((uint64_t)v5, v44[7] + v25 * v13, (uint64_t (*)(_QWORD))v21);
        v10 = v41;
      }
      else
      {
        v44[(v25 >> 6) + 8] |= 1 << v25;
        v33 = (uint64_t *)(v32[6] + 16 * v25);
        *v33 = v17;
        v33[1] = v16;
        sub_2452B7AB8((uint64_t)v5, v32[7] + v25 * v13, (uint64_t (*)(_QWORD))v21);
        v34 = v32[2];
        v35 = __OFADD__(v34, 1);
        v36 = v34 + 1;
        v10 = v41;
        if (v35)
          goto LABEL_16;
        v32[2] = v36;
        swift_bridgeObjectRetain();
      }
      *v10 = v32;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v8 = v40;
      sub_2452B7B5C((uint64_t)v40, (uint64_t (*)(_QWORD))v14);
      v12 += v13;
      v11 = v43 - 1;
      if (v43 == 1)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_2453883DC();
    __break(1u);
  }
  else
  {
LABEL_14:
    result = (uint64_t)v39;
    *((_WORD *)v39 + 24) = 1;
  }
  return result;
}

uint64_t sub_245373EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744FFA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_245373F28(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F848);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_245373F68()
{
  return sub_245371284();
}

uint64_t sub_245373F84@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_245373FD0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24537401C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 40);
  *a2 = *(_QWORD *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_245374068@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 48);
  return result;
}

uint64_t sub_2453740AC(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 48) = v2;
  return result;
}

uint64_t sub_2453740EC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 49);
  return result;
}

uint64_t sub_245374130(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 49) = v2;
  return result;
}

uint64_t sub_245374170@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 56);
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for MetadataInMemoryStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for MetadataInMemoryStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MetadataInMemoryStore.recordMetadata.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.recordMetadata.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.recordMetadata.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.pairingRelationships.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.pairingRelationships.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.pairingRelationships.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.localDeviceID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.localDeviceID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.localDeviceID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.isEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.isEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.isEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.allowListEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.allowListEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.allowListEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.allowList.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.allowList.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.allowList.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.__allocating_init(pairingRelationship:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.__allocating_init(pairingRelationships:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 288))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.removeAll()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.update(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.removePairingRelationship(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.remove(recordIDs:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.isAllowListEnabled()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.allowListIDs()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.enableAllowList(enabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.setAllowList(idsIDs:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.addIDToAllowList(idsID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of MetadataInMemoryStore.removeFromAllowList(idsID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

_QWORD *CustomizableRetryTimer.init()()
{
  _QWORD *v0;
  uint64_t v1;

  v0[5] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
  v1 = swift_allocObject();
  *(_DWORD *)(v1 + 16) = 0;
  v0[6] = v1;
  v0[2] = 3;
  v0[3] = 0x4030000000000000;
  v0[4] = 3;
  return v0;
}

uint64_t CustomizableRetryTimer.init(maxRetries:intervalUntilRetry:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v5;

  *(_QWORD *)(v2 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v2 + 48) = v5;
  *(_QWORD *)(v2 + 16) = a1;
  *(double *)(v2 + 24) = a2;
  *(_QWORD *)(v2 + 32) = a1;
  return v2;
}

uint64_t CustomizableRetryTimer.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_245374430()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = *(os_unfair_lock_s **)(v0 + 48);
  swift_retain();
  os_unfair_lock_lock(v1 + 4);
  sub_2452E6204(v2, (uint64_t (*)(void))sub_245374B40);
  os_unfair_lock_unlock(v1 + 4);
  return swift_release();
}

uint64_t sub_24537449C()
{
  return sub_2453744B4((uint64_t (*)(void))sub_245374E7C);
}

uint64_t sub_2453744A8()
{
  return sub_2453744B4(sub_245374E94);
}

uint64_t sub_2453744B4(uint64_t (*a1)(void))
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;

  v3 = *(os_unfair_lock_s **)(v1 + 48);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  sub_2452E6204(v4, a1);
  os_unfair_lock_unlock(v3 + 4);
  return swift_release();
}

void sub_24537451C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  const os_unfair_lock *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  os_unfair_lock_s *v26;
  uint64_t v27;
  NSObject *v28;

  v4 = (_QWORD *)v3;
  v7 = *(const os_unfair_lock **)(v3 + 48);
  swift_retain();
  os_unfair_lock_assert_owner(v7 + 4);
  v8 = swift_release();
  if ((uint64_t)v4[4] >= 1)
  {
    (*(void (**)(uint64_t))(*v4 + 232))(v8);
    v9 = v4[4];
    v10 = __OFSUB__(v9, 1);
    v11 = v9 - 1;
    if (v10)
    {
      __break(1u);
    }
    else
    {
      v4[4] = v11;
      if (qword_25744FD90 == -1)
      {
LABEL_4:
        v12 = sub_245387818();
        __swift_project_value_buffer(v12, (uint64_t)qword_257462FB0);
        v13 = sub_2453877F4();
        v14 = sub_245387D34();
        if (os_log_type_enabled(v13, v14))
        {
          v15 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v15 = 134349056;
          sub_245387E0C();
          _os_log_impl(&dword_245256000, v13, v14, "Retry timer will fire in %{public}fs", v15, 0xCu);
          MEMORY[0x24953317C](v15, -1, -1);
        }

        v16 = v4[5];
        if (v16)
        {
          v17 = *(os_unfair_lock_s **)(v16 + 24);
          swift_retain();
          swift_retain();
          os_unfair_lock_lock(v17 + 4);
          sub_2452E6204(v18, sub_24525C730);
          os_unfair_lock_unlock(v17 + 4);
          swift_release();
          swift_release();
        }
        type metadata accessor for BasicTimer();
        v22 = swift_allocObject();
        *(_QWORD *)(v22 + 16) = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
        v23 = swift_allocObject();
        *(_DWORD *)(v23 + 16) = 0;
        *(_QWORD *)(v22 + 24) = v23;
        v4[5] = v22;
        swift_release();
        v24 = v4[5];
        if (v24)
        {
          v25 = (_QWORD *)swift_allocObject();
          v25[2] = v4;
          v25[3] = a2;
          v25[4] = a3;
          v26 = *(os_unfair_lock_s **)(v24 + 24);
          MEMORY[0x24BDAC7A8](v25);
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          os_unfair_lock_lock(v26 + 4);
          sub_2452E6204(v27, (uint64_t (*)(void))sub_24525C890);
          os_unfair_lock_unlock(v26 + 4);
          swift_release();
          swift_release();
          swift_release();
        }
        return;
      }
    }
    swift_once();
    goto LABEL_4;
  }
  if (qword_25744FD90 != -1)
    swift_once();
  v19 = sub_245387818();
  __swift_project_value_buffer(v19, (uint64_t)qword_257462FB0);
  v28 = sub_2453877F4();
  v20 = sub_245387D1C();
  if (os_log_type_enabled(v28, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_245256000, v28, v20, "Exhausted retry attempts; will not try again", v21, 2u);
    MEMORY[0x24953317C](v21, -1, -1);
  }

}

uint64_t sub_2453748DC()
{
  uint64_t v0;
  uint64_t v1;
  const os_unfair_lock *v2;
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;

  v1 = v0;
  v2 = *(const os_unfair_lock **)(v0 + 48);
  swift_retain();
  os_unfair_lock_assert_owner(v2 + 4);
  result = swift_release();
  if (*(_QWORD *)(v1 + 40))
  {
    if (qword_25744FD90 != -1)
      swift_once();
    v4 = sub_245387818();
    __swift_project_value_buffer(v4, (uint64_t)qword_257462FB0);
    v5 = sub_2453877F4();
    v6 = sub_245387D34();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_245256000, v5, v6, "Cancelling retry timer", v7, 2u);
      MEMORY[0x24953317C](v7, -1, -1);
    }

    v8 = *(_QWORD *)(v1 + 40);
    if (v8)
    {
      v9 = *(os_unfair_lock_s **)(v8 + 24);
      swift_retain();
      swift_retain();
      os_unfair_lock_lock(v9 + 4);
      sub_2452E6204(v10, sub_24525C730);
      os_unfair_lock_unlock(v9 + 4);
      swift_release();
      swift_release();
    }
    *(_QWORD *)(v1 + 40) = 0;
    return swift_release();
  }
  return result;
}

uint64_t CustomizableRetryTimer.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
  v1 = swift_allocObject();
  *(_DWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 16) = 3;
  *(_QWORD *)(v0 + 24) = 0x4030000000000000;
  *(_OWORD *)(v0 + 32) = xmmword_24538C690;
  return v0;
}

uint64_t CustomizableRetryTimer.__allocating_init(maxRetries:intervalUntilRetry:)(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v4 + 48) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  *(double *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a1;
  return v4;
}

void sub_245374B40()
{
  uint64_t *v0;

  sub_24537451C(v0[3], v0[4], v0[5]);
}

void sub_245374B70(_QWORD *a1)
{
  const os_unfair_lock *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v2 = (const os_unfair_lock *)a1[6];
  swift_retain();
  os_unfair_lock_assert_owner(v2 + 4);
  swift_release();
  if (qword_25744FD90 != -1)
    swift_once();
  v3 = sub_245387818();
  __swift_project_value_buffer(v3, (uint64_t)qword_257462FB0);
  v4 = sub_2453877F4();
  v5 = sub_245387D34();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_245256000, v4, v5, "Resetting retry timer", v6, 2u);
    MEMORY[0x24953317C](v6, -1, -1);
  }

  a1[4] = a1[2];
}

uint64_t sub_245374C78(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  unsigned __int8 v6;

  v3 = *(os_unfair_lock_s **)(a1 + 48);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  sub_2452F95BC((_QWORD *(*)(uint64_t *__return_ptr))sub_245374F5C, &v6);
  os_unfair_lock_unlock(v3 + 4);
  v4 = v6;
  swift_release();
  return a2(v4);
}

uint64_t sub_245374D00@<X0>(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  if (__OFSUB__(*(_QWORD *)(a1 + 16), v3))
  {
    __break(1u);
  }
  else if (qword_25744FD90 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v4 = sub_245387818();
  __swift_project_value_buffer(v4, (uint64_t)qword_257462FB0);
  v5 = sub_2453877F4();
  v6 = sub_245387D34();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 134349056;
    sub_245387E0C();
    _os_log_impl(&dword_245256000, v5, v6, "Retry timer fired (attempt #%{public}ld)", v7, 0xCu);
    MEMORY[0x24953317C](v7, -1, -1);
  }

  result = sub_2453748DC();
  *a2 = v3 == 0;
  return result;
}

uint64_t CustomizableRetryTimer.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

void sub_245374E7C()
{
  _QWORD *v0;

  sub_245374B70(v0);
}

uint64_t sub_245374E94()
{
  return sub_2453748DC();
}

uint64_t type metadata accessor for CustomizableRetryTimer()
{
  return objc_opt_self();
}

uint64_t method lookup function for CustomizableRetryTimer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CustomizableRetryTimer.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.__allocating_init(maxRetries:intervalUntilRetry:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.start(queue:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.intervalUntilNextFireTime()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t sub_245374F24()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245374F50()
{
  uint64_t v0;

  return sub_245374C78(*(_QWORD *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

uint64_t sub_245374F5C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;

  return sub_245374D00(v1, a1);
}

uint64_t MessageType.description.getter()
{
  sub_245387EA8();
  sub_245387B90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_245387EA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  swift_bridgeObjectRetain();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_245387B90();
  sub_24533B4C8();
  return 0;
}

ReplicatorEngine::MessageType::ID __swiftcall MessageType.ID.init(id:clientID:)(Swift::String id, Swift::String clientID)
{
  Swift::String *v2;
  ReplicatorEngine::MessageType::ID result;

  *v2 = id;
  v2[1] = clientID;
  result.clientID = clientID;
  result.id = id;
  return result;
}

__n128 MessageType.init(id:protocolVersion:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  __n128 result;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_QWORD *)(a3 + 16) = v3;
  *(_QWORD *)(a3 + 24) = v4;
  result = *a2;
  *(__n128 *)(a3 + 32) = *a2;
  return result;
}

uint64_t MessageType.ID.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageType.ID.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MessageType.ID.id.modify())()
{
  return nullsub_1;
}

uint64_t MessageType.ID.clientID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageType.ID.clientID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*MessageType.ID.clientID.modify())()
{
  return nullsub_1;
}

uint64_t MessageType.ID.description.getter()
{
  sub_245387EA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  swift_bridgeObjectRetain();
  sub_245387B90();
  swift_bridgeObjectRelease();
  return 540697705;
}

uint64_t MessageType.ID.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_245387B6C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245387B6C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245375330()
{
  sub_245375CF0();
  return sub_2453884D8();
}

uint64_t sub_245375358()
{
  sub_245375CF0();
  return sub_2453884E4();
}

uint64_t MessageType.ID.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574501B8);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v9[1] = *(_QWORD *)(v1 + 24);
  v9[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245375CF0();
  sub_24538849C();
  v12 = 0;
  sub_2453880A0();
  if (!v2)
  {
    v11 = 1;
    sub_2453880A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t MessageType.ID.hashValue.getter()
{
  sub_24538843C();
  swift_bridgeObjectRetain();
  sub_245387B6C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245387B6C();
  swift_bridgeObjectRelease();
  return sub_245388478();
}

uint64_t MessageType.ID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v18;
  char v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257450160);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245375CF0();
  sub_245388490();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = 0;
  v9 = sub_24538801C();
  v11 = v10;
  v19 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_24538801C();
  v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16 = v12;
  v15(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v16;
  a2[3] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2453756D8()
{
  sub_24538843C();
  swift_bridgeObjectRetain();
  sub_245387B6C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245387B6C();
  swift_bridgeObjectRelease();
  return sub_245388478();
}

uint64_t sub_24537575C()
{
  swift_bridgeObjectRetain();
  sub_245387B6C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245387B6C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2453757CC()
{
  sub_24538843C();
  swift_bridgeObjectRetain();
  sub_245387B6C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245387B6C();
  swift_bridgeObjectRelease();
  return sub_245388478();
}

uint64_t sub_24537584C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return MessageType.ID.init(from:)(a1, a2);
}

uint64_t sub_245375860(_QWORD *a1)
{
  return MessageType.ID.encode(to:)(a1);
}

uint64_t MessageType.id.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 MessageType.id.setter(__n128 *a1)
{
  __n128 *v1;
  unint64_t v2;
  unint64_t v3;
  __n128 result;
  __n128 v5;

  v5 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = v5;
  *v1 = v5;
  v1[1].n128_u64[0] = v2;
  v1[1].n128_u64[1] = v3;
  return result;
}

uint64_t (*MessageType.id.modify())()
{
  return nullsub_1;
}

__n128 MessageType.protocolVersion.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = v1[2];
  *a1 = result;
  return result;
}

__n128 MessageType.protocolVersion.setter(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  result = *a1;
  v1[2] = *a1;
  return result;
}

uint64_t (*MessageType.protocolVersion.modify())()
{
  return nullsub_1;
}

uint64_t sub_245375938()
{
  sub_245375D34();
  return sub_2453884D8();
}

uint64_t sub_245375960()
{
  sub_245375D34();
  return sub_2453884E4();
}

uint64_t MessageType.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574501B0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *v1;
  v8 = *((_QWORD *)v1 + 2);
  v7 = *((_QWORD *)v1 + 3);
  v9 = *((_QWORD *)v1 + 4);
  v12 = *((_QWORD *)v1 + 5);
  v13 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245375D34();
  sub_24538849C();
  v16 = v14;
  v17 = v8;
  v18 = v7;
  v19 = 0;
  sub_2452CC11C();
  v10 = v15;
  sub_2453880B8();
  if (!v10)
  {
    *(_QWORD *)&v16 = v13;
    *((_QWORD *)&v16 + 1) = v12;
    v19 = 1;
    sub_2452CBF4C();
    sub_2453880B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MessageType.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257450158);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245375D34();
  sub_245388490();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v18 = 0;
  sub_2452CC504();
  sub_245388034();
  v9 = *((_QWORD *)&v15 + 1);
  v10 = v17;
  v13 = v16;
  v14 = v15;
  v18 = 1;
  sub_2452CC378();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_245388034();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = v15;
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 24) = v10;
  *(_OWORD *)(a2 + 32) = v11;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245375CC4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MessageType.init(from:)(a1, a2);
}

uint64_t sub_245375CD8(_QWORD *a1)
{
  return MessageType.encode(to:)(a1);
}

unint64_t sub_245375CF0()
{
  unint64_t result;

  result = qword_25744F798;
  if (!qword_25744F798)
  {
    result = MEMORY[0x2495330B0](&unk_24539190C, &type metadata for MessageType.ID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25744F798);
  }
  return result;
}

unint64_t sub_245375D34()
{
  unint64_t result;

  result = qword_25744F780;
  if (!qword_25744F780)
  {
    result = MEMORY[0x2495330B0](&unk_2453918BC, &type metadata for MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25744F780);
  }
  return result;
}

unint64_t sub_245375D7C()
{
  unint64_t result;

  result = qword_25744F7B8;
  if (!qword_25744F7B8)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for MessageType.ID, &type metadata for MessageType.ID);
    atomic_store(result, (unint64_t *)&qword_25744F7B8);
  }
  return result;
}

unint64_t sub_245375DC4()
{
  unint64_t result;

  result = qword_257453638;
  if (!qword_257453638)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for MessageType.ID, &type metadata for MessageType.ID);
    atomic_store(result, (unint64_t *)&qword_257453638);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

ValueMetadata *type metadata accessor for MessageType.ID()
{
  return &type metadata for MessageType.ID;
}

ValueMetadata *type metadata accessor for MessageType.CodingKeys()
{
  return &type metadata for MessageType.CodingKeys;
}

uint64_t _s16ReplicatorEngine11MessageTypeV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245375E88 + 4 * byte_245391525[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245375EBC + 4 * byte_245391520[v4]))();
}

uint64_t sub_245375EBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245375EC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245375ECCLL);
  return result;
}

uint64_t sub_245375ED8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245375EE0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245375EE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245375EEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessageType.ID.CodingKeys()
{
  return &type metadata for MessageType.ID.CodingKeys;
}

unint64_t sub_245375F0C()
{
  unint64_t result;

  result = qword_257453640;
  if (!qword_257453640)
  {
    result = MEMORY[0x2495330B0](&unk_2453917DC, &type metadata for MessageType.ID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453640);
  }
  return result;
}

unint64_t sub_245375F54()
{
  unint64_t result;

  result = qword_257453648;
  if (!qword_257453648)
  {
    result = MEMORY[0x2495330B0](&unk_245391894, &type metadata for MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453648);
  }
  return result;
}

unint64_t sub_245375F9C()
{
  unint64_t result;

  result = qword_25744F790;
  if (!qword_25744F790)
  {
    result = MEMORY[0x2495330B0](&unk_245391804, &type metadata for MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25744F790);
  }
  return result;
}

unint64_t sub_245375FE4()
{
  unint64_t result;

  result = qword_25744F788;
  if (!qword_25744F788)
  {
    result = MEMORY[0x2495330B0](&unk_24539182C, &type metadata for MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25744F788);
  }
  return result;
}

unint64_t sub_24537602C()
{
  unint64_t result;

  result = qword_25744F7A8;
  if (!qword_25744F7A8)
  {
    result = MEMORY[0x2495330B0](&unk_24539174C, &type metadata for MessageType.ID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25744F7A8);
  }
  return result;
}

unint64_t sub_245376074()
{
  unint64_t result;

  result = qword_25744F7A0;
  if (!qword_25744F7A0)
  {
    result = MEMORY[0x2495330B0](&unk_245391774, &type metadata for MessageType.ID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25744F7A0);
  }
  return result;
}

uint64_t RecordMetadata.init(id:version:destination:expiration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = *a3;
  v10 = (int *)type metadata accessor for RecordMetadata();
  v11 = a5 + v10[7];
  v12 = sub_2453876EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_2452D5610(a1, a5);
  v13 = a5 + v10[5];
  v14 = sub_245387740();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v13, a2, v14);
  *(_QWORD *)(a5 + v10[6]) = v9;
  return sub_2452D5654(a4, v11);
}

uint64_t type metadata accessor for RecordMetadata()
{
  uint64_t result;

  result = qword_25744F838;
  if (!qword_25744F838)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t RecordMetadata.isRelevantToZoneVersionCalculation(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _BYTE v17[16];

  v3 = sub_245387740();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Record.ID.Ownership(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for Record.ID(0);
  sub_2452B792C(v1 + *(int *)(v10 + 24), (uint64_t)v9, type metadata accessor for Record.ID.Ownership);
  v11 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3);
  if (v11 == 1)
  {
    v12 = 0;
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v6, v9, v3);
    v12 = sub_245387710();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  v13 = type metadata accessor for RecordMetadata();
  if (!*(_QWORD *)(v1 + *(int *)(v13 + 24)))
  {
    if (v11 != 1)
      return v12 & 1;
    goto LABEL_7;
  }
  MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)&v17[-16] = a1;
  v15 = sub_24531DE44((uint64_t (*)(char *))sub_245377AE8, (_BOOL8)&v17[-32], v14);
  if (v11 == 1 && v15)
LABEL_7:
    v12 = 1;
  return v12 & 1;
}

uint64_t RecordMetadata.matches(predicate:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  _BYTE v27[16];

  v3 = sub_245387740();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Record.ID.Ownership(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v27[-v11];
  if ((*(_BYTE *)a1 & 1) != 0
    && (v13 = type metadata accessor for Record.ID(0),
        sub_2452B792C((uint64_t)v1 + *(int *)(v13 + 24), (uint64_t)v12, type metadata accessor for Record.ID.Ownership),
        (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3) != 1))
  {
    sub_2452B7B5C((uint64_t)v12, type metadata accessor for Record.ID.Ownership);
  }
  else
  {
    if ((*(_BYTE *)(a1 + 1) & 1) != 0)
    {
      v14 = type metadata accessor for Record.ID(0);
      sub_2452B792C((uint64_t)v1 + *(int *)(v14 + 24), (uint64_t)v10, type metadata accessor for Record.ID.Ownership);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v10, 1, v3) == 1)
        return 0;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v6, v10, v3);
      type metadata accessor for MetadataRecordPredicate();
      v15 = sub_245387710();
      (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
      if ((v15 & 1) == 0)
        return 0;
    }
    v16 = *(unsigned __int8 *)(a1 + 2);
    if (v16 != 2)
    {
      v17 = *(_QWORD *)((char *)v1 + *(int *)(type metadata accessor for RecordMetadata() + 24));
      if (v17)
      {
        v18 = type metadata accessor for MetadataRecordPredicate();
        MEMORY[0x24BDAC7A8](v18);
        *(_QWORD *)&v27[-16] = v19;
        if (((v16 ^ sub_24531DE44((uint64_t (*)(char *))sub_245377AE8, (_BOOL8)&v27[-32], v17)) & 1) != 0)
          return 0;
      }
      else if ((v16 & 1) == 0)
      {
        return 0;
      }
    }
    v20 = *(_QWORD *)(a1 + 8);
    if (!v20)
      return 1;
    v21 = v1[2];
    v22 = v1[3];
    v24 = v1[4];
    v23 = v1[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25 = sub_24531D970(v21, v22, v24, v23, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      return 1;
  }
  return 0;
}

uint64_t RecordMetadata.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2452B792C(v1, a1, type metadata accessor for Record.ID);
}

uint64_t RecordMetadata.id.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_245377B74(a1, v1);
}

uint64_t (*RecordMetadata.id.modify())()
{
  return nullsub_1;
}

uint64_t RecordMetadata.version.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for RecordMetadata() + 20);
  v4 = sub_245387740();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t RecordMetadata.version.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for RecordMetadata() + 20);
  v4 = sub_245387740();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*RecordMetadata.version.modify())(_QWORD)
{
  type metadata accessor for RecordMetadata();
  return nullsub_1;
}

uint64_t RecordMetadata.destination.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for RecordMetadata() + 24));
  return swift_bridgeObjectRetain();
}

uint64_t RecordMetadata.destination.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *(int *)(type metadata accessor for RecordMetadata() + 24);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = v2;
  return result;
}

uint64_t (*RecordMetadata.destination.modify())(_QWORD)
{
  type metadata accessor for RecordMetadata();
  return nullsub_1;
}

uint64_t RecordMetadata.expiration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for RecordMetadata() + 28);
  return sub_2452F5CC0(v3, a1);
}

uint64_t RecordMetadata.expiration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for RecordMetadata() + 28);
  return sub_2452D5654(a1, v3);
}

uint64_t (*RecordMetadata.expiration.modify())(_QWORD)
{
  type metadata accessor for RecordMetadata();
  return nullsub_1;
}

uint64_t RecordMetadata.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  uint64_t v13;
  unint64_t v14;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2453876EC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = 0;
  v14 = 0xE000000000000000;
  sub_245387EA8();
  sub_245387B90();
  Record.ID.description.getter();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  v9 = type metadata accessor for RecordMetadata();
  sub_245387740();
  sub_24525C6C4(&qword_25744F6E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_2453880F4();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  v12[0] = *(_QWORD *)(v0 + *(int *)(v9 + 24));
  sub_245387F5C();
  sub_245387B90();
  v10 = v13;
  sub_2452F5CC0(v1 + *(int *)(v9 + 28), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_245263F80((uint64_t)v4, &qword_25744F6B0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    strcpy((char *)v12, "expiration: ");
    BYTE5(v12[1]) = 0;
    HIWORD(v12[1]) = -5120;
    sub_24525C6C4((unint64_t *)&qword_2574525E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    sub_2453880F4();
    sub_245387B90();
    swift_bridgeObjectRelease();
    sub_245387B90();
    sub_245387B90();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v13;
  }
  return v10;
}

uint64_t RecordMetadata.init(id:version:destination:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);

  v7 = *a3;
  v8 = (int *)type metadata accessor for RecordMetadata();
  v9 = a4 + v8[7];
  v10 = sub_2453876EC();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  v14(v9, 1, 1, v10);
  sub_2452D5610(a1, a4);
  v11 = a4 + v8[5];
  v12 = sub_245387740();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a2, v12);
  *(_QWORD *)(a4 + v8[6]) = v7;
  sub_245263F80(v9, &qword_25744F6B0);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v14)(v9, 1, 1, v10);
}

uint64_t RecordMetadata.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = sub_2453876EC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Record.ID.hash(into:)();
  v10 = type metadata accessor for RecordMetadata();
  sub_245387740();
  sub_24525C6C4(&qword_25744F6D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_245387AB8();
  v11 = *(_QWORD *)(v1 + *(int *)(v10 + 24));
  sub_245388448();
  if (v11)
  {
    swift_bridgeObjectRetain();
    sub_24526A948(a1, v11);
    swift_bridgeObjectRelease();
  }
  sub_2452F5CC0(v1 + *(int *)(v10 + 28), (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
    return sub_245388454();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v9, v3);
  sub_245388454();
  sub_24525C6C4(&qword_257453650, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_245387AB8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_245376D78()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_245376D9C + 4 * byte_245391960[*v0]))(25705, 0xE200000000000000);
}

uint64_t sub_245376D9C()
{
  return 0x6E6F6973726576;
}

uint64_t sub_245376DB4()
{
  return 0x74616E6974736564;
}

uint64_t sub_245376DD4()
{
  return 0x6974617269707865;
}

uint64_t sub_245376DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245378C7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_245376E14()
{
  sub_245377BB8();
  return sub_2453884D8();
}

uint64_t sub_245376E3C()
{
  sub_245377BB8();
  return sub_2453884E4();
}

uint64_t RecordMetadata.encode(to:)(_QWORD *a1)
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
  uint64_t v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257453658);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245377BB8();
  sub_24538849C();
  v14 = 0;
  type metadata accessor for Record.ID(0);
  sub_24525C6C4(&qword_2574532F0, type metadata accessor for Record.ID, (uint64_t)&protocol conformance descriptor for Record.ID);
  sub_2453880B8();
  if (!v2)
  {
    v9 = type metadata accessor for RecordMetadata();
    v13 = 1;
    sub_245387740();
    sub_24525C6C4(&qword_25744F6C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_2453880B8();
    v12 = *(_QWORD *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    sub_245377BFC();
    sub_2453880B8();
    v11[14] = 3;
    sub_2453876EC();
    sub_24525C6C4(&qword_257453670, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_245388088();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t RecordMetadata.hashValue.getter()
{
  _BYTE v1[72];

  sub_24538843C();
  RecordMetadata.hash(into:)((uint64_t)v1);
  return sub_245388478();
}

uint64_t RecordMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;

  v27 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
  MEMORY[0x24BDAC7A8](v3);
  v28 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245387740();
  v30 = *(_QWORD *)(v5 - 8);
  v31 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v29 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for Record.ID(0);
  MEMORY[0x24BDAC7A8](v32);
  v33 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_257453678);
  v8 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for RecordMetadata();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 28)];
  v16 = sub_2453876EC();
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v36 = v15;
  v17(v15, 1, 1, v16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245377BB8();
  v34 = v10;
  v18 = v37;
  sub_245388490();
  if (v18)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_245263F80(v36, &qword_25744F6B0);
  }
  else
  {
    v26[1] = v16;
    v37 = v8;
    v20 = v29;
    v19 = v30;
    v21 = v31;
    v42 = 0;
    sub_24525C6C4(&qword_257453100, type metadata accessor for Record.ID, (uint64_t)&protocol conformance descriptor for Record.ID);
    v22 = (uint64_t)v33;
    sub_245388034();
    sub_2452D5610(v22, (uint64_t)v14);
    v41 = 1;
    sub_24525C6C4(&qword_25744F6D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_245388034();
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(&v14[*(int *)(v11 + 20)], v20, v21);
    v40 = 2;
    sub_245377C40();
    sub_245388034();
    v23 = (uint64_t)v14;
    *(_QWORD *)&v14[*(int *)(v11 + 24)] = v38;
    v39 = 3;
    sub_24525C6C4(&qword_257453688, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v24 = (uint64_t)v28;
    sub_245388004();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v35);
    sub_2452D5654(v24, v36);
    sub_2452B792C(v23, v27, (uint64_t (*)(_QWORD))type metadata accessor for RecordMetadata);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_2452B7B5C(v23, (uint64_t (*)(_QWORD))type metadata accessor for RecordMetadata);
  }
}

uint64_t sub_245377534@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2452B792C(v1, a1, type metadata accessor for Record.ID);
}

uint64_t sub_245377558@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return RecordMetadata.init(from:)(a1, a2);
}

uint64_t sub_24537756C(_QWORD *a1)
{
  return RecordMetadata.encode(to:)(a1);
}

uint64_t sub_245377584()
{
  _BYTE v1[72];

  sub_24538843C();
  RecordMetadata.hash(into:)((uint64_t)v1);
  return sub_245388478();
}

uint64_t sub_2453775C4()
{
  _BYTE v1[72];

  sub_24538843C();
  RecordMetadata.hash(into:)((uint64_t)v1);
  return sub_245388478();
}

uint64_t sub_245377600()
{
  sub_245387740();
  sub_24525C6C4(&qword_257452430, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  return sub_245387AE8() & 1;
}

uint64_t _s16ReplicatorEngine14RecordMetadataV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  char *v41;
  char v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = sub_2453876EC();
  v45 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v44 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6C0);
  MEMORY[0x24BDAC7A8](v5);
  v46 = (uint64_t)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v44 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v44 - v14;
  if (*a1 == *a2 && a1[1] == a2[1] || (v16 = sub_245388274(), result = 0, (v16 & 1) != 0))
  {
    if ((v19 = a1[4], v18 = a1[5], v20 = a2[4], v21 = a2[5], a1[2] == a2[2]) && a1[3] == a2[3]
      || (v22 = sub_245388274(), result = 0, (v22 & 1) != 0))
    {
      if (v19 == v20 && v18 == v21 || (v23 = sub_245388274(), result = 0, (v23 & 1) != 0))
      {
        v24 = type metadata accessor for Record.ID(0);
        if ((_s16ReplicatorEngine6RecordV2IDV9OwnershipO2eeoiySbAG_AGtFZ_0((uint64_t)a1 + *(int *)(v24 + 24), (uint64_t)a2 + *(int *)(v24 + 24)) & 1) == 0)return 0;
        v25 = *(int *)(v24 + 28);
        v26 = *(_QWORD *)((char *)a1 + v25);
        v27 = *(_QWORD *)((char *)a1 + v25 + 8);
        v28 = (_QWORD *)((char *)a2 + v25);
        if (v26 == *v28 && v27 == v28[1] || (v29 = sub_245388274(), result = 0, (v29 & 1) != 0))
        {
          v30 = type metadata accessor for RecordMetadata();
          if ((sub_245387710() & 1) != 0)
          {
            v31 = *(int *)(v30 + 24);
            v32 = *(_QWORD *)((char *)a1 + v31);
            v33 = *(_QWORD *)((char *)a2 + v31);
            if (v32)
            {
              if (!v33)
                return 0;
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain_n();
              v34 = sub_245269CA8(v32, v33);
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
              if ((v34 & 1) == 0)
                return 0;
            }
            else
            {
              if (v33)
                return 0;
              swift_bridgeObjectRelease_n();
            }
            sub_2452F5CC0((uint64_t)a1 + *(int *)(v30 + 28), (uint64_t)v15);
            sub_2452F5CC0((uint64_t)a2 + *(int *)(v30 + 28), (uint64_t)v13);
            v35 = *(int *)(v5 + 48);
            v36 = v46;
            v37 = v46 + v35;
            sub_2452F5CC0((uint64_t)v15, v46);
            sub_2452F5CC0((uint64_t)v13, v37);
            v38 = v45;
            v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48);
            v40 = v47;
            if (v39(v36, 1, v47) == 1)
            {
              sub_245263F80((uint64_t)v13, &qword_25744F6B0);
              sub_245263F80((uint64_t)v15, &qword_25744F6B0);
              if (v39(v37, 1, v40) == 1)
              {
                sub_245263F80(v36, &qword_25744F6B0);
                return 1;
              }
              goto LABEL_26;
            }
            sub_2452F5CC0(v36, (uint64_t)v10);
            if (v39(v37, 1, v40) == 1)
            {
              sub_245263F80((uint64_t)v13, &qword_25744F6B0);
              sub_245263F80((uint64_t)v15, &qword_25744F6B0);
              (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v40);
LABEL_26:
              sub_245263F80(v36, &qword_25744F6C0);
              return 0;
            }
            v41 = v44;
            (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v44, v37, v40);
            sub_24525C6C4(&qword_257452358, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
            v42 = sub_245387AE8();
            v43 = *(void (**)(char *, uint64_t))(v38 + 8);
            v43(v41, v40);
            sub_245263F80((uint64_t)v13, &qword_25744F6B0);
            sub_245263F80((uint64_t)v15, &qword_25744F6B0);
            v43(v10, v40);
            sub_245263F80(v36, &qword_25744F6B0);
            if ((v42 & 1) != 0)
              return 1;
          }
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_245377AE8()
{
  return sub_245377B00() & 1;
}

uint64_t sub_245377B00()
{
  sub_245387740();
  sub_24525C6C4(&qword_257452430, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  return sub_245387AE8() & 1;
}

uint64_t sub_245377B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Record.ID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_245377BB8()
{
  unint64_t result;

  result = qword_257453660;
  if (!qword_257453660)
  {
    result = MEMORY[0x2495330B0](&unk_245391B9C, &type metadata for RecordMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453660);
  }
  return result;
}

unint64_t sub_245377BFC()
{
  unint64_t result;

  result = qword_257453668;
  if (!qword_257453668)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for RecordDestination, &type metadata for RecordDestination);
    atomic_store(result, (unint64_t *)&qword_257453668);
  }
  return result;
}

unint64_t sub_245377C40()
{
  unint64_t result;

  result = qword_257453680;
  if (!qword_257453680)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for RecordDestination, &type metadata for RecordDestination);
    atomic_store(result, (unint64_t *)&qword_257453680);
  }
  return result;
}

uint64_t sub_245377C84()
{
  return sub_24525C6C4((unint64_t *)&qword_257452340, type metadata accessor for Record.ID, (uint64_t)&protocol conformance descriptor for Record.ID);
}

uint64_t sub_245377CB0()
{
  return sub_24525C6C4(&qword_257453690, (uint64_t (*)(uint64_t))type metadata accessor for RecordMetadata, (uint64_t)&protocol conformance descriptor for RecordMetadata);
}

uint64_t *initializeBufferWithCopyOfBuffer for RecordMetadata(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  char *__dst;
  uint64_t v36;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = type metadata accessor for Record.ID(0);
    v11 = *(int *)(v10 + 24);
    __dst = (char *)v4 + v11;
    v36 = v10;
    v12 = (char *)a2 + v11;
    v13 = sub_245387740();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v15(v12, 1, v13))
    {
      v16 = type metadata accessor for Record.ID.Ownership(0);
      memcpy(__dst, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(__dst, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
    }
    v18 = v14;
    v19 = *(int *)(v36 + 28);
    v20 = (uint64_t *)((char *)v4 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = a3[5];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    v26 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    swift_bridgeObjectRetain();
    v26(v24, v25, v13);
    v27 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    v28 = (char *)v4 + v27;
    v29 = (char *)a2 + v27;
    v30 = sub_2453876EC();
    v31 = *(_QWORD *)(v30 - 8);
    v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
    swift_bridgeObjectRetain();
    if (v32(v29, 1, v30))
    {
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
  }
  return v4;
}

uint64_t destroy for RecordMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for Record.ID(0) + 24);
  v5 = sub_245387740();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1 + *(int *)(a2 + 20), v5);
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(a2 + 28);
  v8 = sub_2453876EC();
  v9 = *(_QWORD *)(v8 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  return result;
}

_QWORD *initializeWithCopy for RecordMetadata(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  char *__dst;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v8 = type metadata accessor for Record.ID(0);
  v9 = *(int *)(v8 + 24);
  __dst = (char *)a1 + v9;
  v10 = (char *)a2 + v9;
  v11 = sub_245387740();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  v15 = *(int *)(v8 + 28);
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = a3[5];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  swift_bridgeObjectRetain();
  v22(v20, v21, v11);
  v23 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = sub_2453876EC();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  swift_bridgeObjectRetain();
  if (v28(v25, 1, v26))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  return a1;
}

char *assignWithCopy for RecordMetadata(char *a1, char *a2, int *a3)
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
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t v27;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for Record.ID(0);
  v7 = *(int *)(v6 + 24);
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_245387740();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v16 = *(int *)(v6 + 28);
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v11 + 24))(&a1[a3[5]], &a2[a3[5]], v10);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = sub_2453876EC();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

char *initializeWithTake for RecordMetadata(char *a1, char *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  v7 = type metadata accessor for Record.ID(0);
  v8 = *(int *)(v7 + 24);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_245387740();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    v14 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  }
  else
  {
    v14 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v14(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)&a1[*(int *)(v7 + 28)] = *(_OWORD *)&a2[*(int *)(v7 + 28)];
  v14(&a1[a3[5]], &a2[a3[5]], v11);
  v15 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = sub_2453876EC();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

char *assignWithTake for RecordMetadata(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = *((_QWORD *)a2 + 5);
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for Record.ID(0);
  v10 = *(int *)(v9 + 24);
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = sub_245387740();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    v18 = type metadata accessor for Record.ID.Ownership(0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
LABEL_7:
  v19 = *(int *)(v9 + 28);
  v20 = &a1[v19];
  v21 = &a2[v19];
  v23 = *(_QWORD *)v21;
  v22 = *((_QWORD *)v21 + 1);
  *(_QWORD *)v20 = v23;
  *((_QWORD *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(&a1[a3[5]], &a2[a3[5]], v13);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  v24 = a3[7];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_2453876EC();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 40))(v25, v26, v27);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v27);
    goto LABEL_12;
  }
  if (v31)
  {
LABEL_12:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for RecordMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24537887C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  v6 = type metadata accessor for Record.ID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = sub_245387740();
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(_QWORD *)(a1 + a3[6]);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v14 = v13 - 1;
  if (v14 < 0)
    v14 = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for RecordMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245378964(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = type metadata accessor for Record.ID(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_245387740();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(_QWORD *)(a1 + a4[6]) = a2;
        return result;
      }
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[7];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_245378A30()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for Record.ID(319);
  if (v0 <= 0x3F)
  {
    sub_245387740();
    if (v1 <= 0x3F)
    {
      sub_2452D63C4();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t storeEnumTagSinglePayload for RecordMetadata.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245378B24 + 4 * byte_245391969[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_245378B58 + 4 * byte_245391964[v4]))();
}

uint64_t sub_245378B58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245378B60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245378B68);
  return result;
}

uint64_t sub_245378B74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245378B7CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_245378B80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245378B88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecordMetadata.CodingKeys()
{
  return &type metadata for RecordMetadata.CodingKeys;
}

unint64_t sub_245378BA8()
{
  unint64_t result;

  result = qword_257453698;
  if (!qword_257453698)
  {
    result = MEMORY[0x2495330B0](&unk_245391B74, &type metadata for RecordMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257453698);
  }
  return result;
}

unint64_t sub_245378BF0()
{
  unint64_t result;

  result = qword_2574536A0;
  if (!qword_2574536A0)
  {
    result = MEMORY[0x2495330B0](&unk_245391AE4, &type metadata for RecordMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574536A0);
  }
  return result;
}

unint64_t sub_245378C38()
{
  unint64_t result;

  result = qword_2574536A8;
  if (!qword_2574536A8)
  {
    result = MEMORY[0x2495330B0](&unk_245391B0C, &type metadata for RecordMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574536A8);
  }
  return result;
}

uint64_t sub_245378C7C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74616E6974736564 && a2 == 0xEB000000006E6F69 || (sub_245388274() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6974617269707865 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_245388274();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_245378E40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[16];
  __int128 v16;
  __int128 v17[2];
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C730);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  sub_24537A0F8(a1, (uint64_t)&v15[-v6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440C6E0);
  if (!swift_dynamicCast())
  {
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    sub_245263F80((uint64_t)v17, &qword_25440C6E8);
    v17[0] = xmmword_245391BF0;
    *(_QWORD *)((char *)&v16 + 7) = 0;
    *(_QWORD *)&v16 = 0;
    sub_24537A0F8(a1, (uint64_t)v5);
    v7 = sub_24532F8A0(&v19, &v16, 0);
    v8 = v19;
    if (v7)
    {
      if (v7 <= 0)
      {
        sub_245387614();
        goto LABEL_6;
      }
    }
    else
    {
      v10 = *((_QWORD *)&v19 + 1);
      *(_QWORD *)((char *)&v19 + 7) = 0;
      *(_QWORD *)&v19 = 0;
      if (!v20 || (v11 = *(_QWORD *)(v8 + 16), v10 == v11))
      {
LABEL_6:
        swift_bridgeObjectRelease();
        sub_245263F80(a1, &qword_25440C730);
        return *(_QWORD *)&v17[0];
      }
      if ((v10 & 0x8000000000000000) != 0)
LABEL_26:
        __break(1u);
      if (v10 < *(_QWORD *)(v8 + 16))
      {
        LOBYTE(v12) = 0;
        v13 = v20 - 1;
        v14 = v11 - 1;
        do
        {
          *((_BYTE *)&v19 + v12) = *(_BYTE *)(v8 + v10 + 32);
          v12 = v12 + 1;
          if ((v12 & 0x100) != 0)
            goto LABEL_24;
          if (v12 == 14)
          {
            *(_QWORD *)&v16 = v19;
            DWORD2(v16) = DWORD2(v19);
            WORD6(v16) = WORD6(v19);
            sub_245387620();
            if (!v13 || v14 == v10)
              goto LABEL_6;
            LOBYTE(v12) = 0;
          }
          else if (v14 == v10 || !v13)
          {
            *(_QWORD *)&v16 = v19;
            DWORD2(v16) = DWORD2(v19);
            WORD6(v16) = WORD6(v19);
            sub_245387620();
            goto LABEL_6;
          }
          ++v10;
          --v13;
        }
        while (v10 < *(_QWORD *)(v8 + 16));
      }
      __break(1u);
LABEL_24:
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
  sub_2452B7C5C(v17, (uint64_t)&v19);
  __swift_project_boxed_opaque_existential_1(&v19, v21);
  sub_24538750C();
  sub_245263F80(a1, &qword_25440C730);
  v17[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
  return *(_QWORD *)&v17[0];
}

uint64_t static UniformHasher.hash<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  _QWORD v23[2];

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C730);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for UniformHasher();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s16ReplicatorEngine13UniformHasherVACycfC_0();
  UniformHasher.combine<A>(_:)(a1, a2, a3);
  if (v4)
    return sub_245379A60((uint64_t)v17);
  sub_245387A28();
  *(_QWORD *)&v11[*(int *)(v9 + 36)] = 16;
  v18 = sub_245378E40((uint64_t)v11);
  sub_24525C9C8(v18, v19);
  v20 = sub_245387740();
  v21 = *(_QWORD *)(v20 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v14, 1, v20);
  if ((_DWORD)result != 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(a4, v14, v20);
    return sub_245379A60((uint64_t)v17);
  }
  __break(1u);
  return result;
}

void UniformHasher.combine<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;

  v7 = (void *)MEMORY[0x249532900]();
  sub_24537933C(a1, v3, a2, a3);
  objc_autoreleasePoolPop(v7);
}

uint64_t sub_24537933C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *boxed_opaque_existential_1;
  uint64_t inited;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[6];

  v13[5] = *MEMORY[0x24BDAC8D0];
  v13[3] = a3;
  v13[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  type metadata accessor for PropertyListTypeEncoder();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = 0;
  *(_BYTE *)(inited + 24) = 1;
  v9 = (void *)sub_24537B31C(v13);
  if (!v4)
  {
    sub_24537E224(v9);
    v11 = v10;
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    __asm { BR              X10 }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

void UniformHasher.combine<A>(_:)(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x249532900]();
  sub_245379658(a1);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_245379658(uint64_t a1)
{
  uint64_t v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v3 = objc_msgSend(objc_allocWithZone((Class)STRPPropertyListTypeEncoder), sel_init);
  v4 = objc_msgSend(v3, sel_encodeRootObject_, a1);

  sub_24537E224(v4);
  v6 = v5;
  result = swift_unknownObjectRelease();
  if (!v1)
    __asm { BR              X10 }
  return result;
}

uint64_t UniformHasher.finalize()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C730);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245387A28();
  *(_QWORD *)&v4[*(int *)(v2 + 36)] = 16;
  v8 = sub_245378E40((uint64_t)v4);
  sub_24525C9C8(v8, v9);
  v10 = sub_245387740();
  v11 = *(_QWORD *)(v10 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a1, v7, v10);
  __break(1u);
  return result;
}

uint64_t type metadata accessor for UniformHasher()
{
  uint64_t result;

  result = qword_25440C708;
  if (!qword_25440C708)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245379A60(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UniformHasher();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static UniformHasher.hash<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C730);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UniformHasher();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s16ReplicatorEngine13UniformHasherVACycfC_0();
  UniformHasher.combine<A>(_:)(a1);
  if (v2)
    return sub_245379A60((uint64_t)v13);
  sub_245387A28();
  *(_QWORD *)&v7[*(int *)(v5 + 36)] = 16;
  v14 = sub_245378E40((uint64_t)v7);
  sub_24525C9C8(v14, v15);
  v16 = sub_245387740();
  v17 = *(_QWORD *)(v16 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16);
  if ((_DWORD)result != 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a2, v10, v16);
    return sub_245379A60((uint64_t)v13);
  }
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for UniformHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245387A40();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for UniformHasher(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245387A40();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for UniformHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245387A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for UniformHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245387A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for UniformHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245387A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for UniformHasher(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245387A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for UniformHasher()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245379DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245387A40();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for UniformHasher()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245379DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245387A40();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_245379E30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245387A40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *sub_245379E98@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_2452F2F90(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_245379FB8((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_24537A030((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_245379F0C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_2453874AC();
  if (!result || (result = sub_2453874D0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_2453874C4();
      sub_245387A40();
      sub_24537A0B0();
      return sub_245387A04();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_245379FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2453874DC();
  swift_allocObject();
  result = sub_2453874A0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_245387608();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_24537A030(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2453874DC();
  swift_allocObject();
  result = sub_2453874A0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

unint64_t sub_24537A0B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25440C720;
  if (!qword_25440C720)
  {
    v1 = sub_245387A40();
    result = MEMORY[0x2495330B0](MEMORY[0x24BDC6AE8], v1);
    atomic_store(result, (unint64_t *)&qword_25440C720);
  }
  return result;
}

uint64_t sub_24537A0F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C730);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ReplicatorEngine::MessageSendOptions __swiftcall MessageSendOptions.init(timeout:retries:)(Swift::Double timeout, Swift::Int retries)
{
  uint64_t v2;
  ReplicatorEngine::MessageSendOptions result;

  *(Swift::Double *)v2 = timeout;
  *(_QWORD *)(v2 + 8) = retries;
  result.timeout = timeout;
  result.retries = retries;
  return result;
}

uint64_t IncomingSyncServiceMessage.init(message:url:deviceID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;

  v10 = type metadata accessor for IncomingSyncServiceMessage();
  v11 = a5 + *(int *)(v10 + 20);
  v12 = sub_2453875E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_245263E24(a1, a5);
  result = sub_2452DB304(a2, v11);
  v14 = (_QWORD *)(a5 + *(int *)(v10 + 24));
  *v14 = a3;
  v14[1] = a4;
  return result;
}

uint64_t type metadata accessor for IncomingSyncServiceMessage()
{
  uint64_t result;

  result = qword_2574536B0;
  if (!qword_2574536B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t IncomingSyncServiceMessage.message.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_245263EF4(v1, a1);
}

uint64_t IncomingSyncServiceMessage.message.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_24537A23C(a1, v1);
}

uint64_t sub_24537A23C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Message();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*IncomingSyncServiceMessage.message.modify())()
{
  return nullsub_1;
}

uint64_t IncomingSyncServiceMessage.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for IncomingSyncServiceMessage() + 20);
  return sub_245263F38(v3, a1);
}

uint64_t IncomingSyncServiceMessage.url.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for IncomingSyncServiceMessage() + 20);
  return sub_2452DB304(a1, v3);
}

uint64_t (*IncomingSyncServiceMessage.url.modify())(_QWORD)
{
  type metadata accessor for IncomingSyncServiceMessage();
  return nullsub_1;
}

uint64_t IncomingSyncServiceMessage.deviceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for IncomingSyncServiceMessage() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IncomingSyncServiceMessage.deviceID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for IncomingSyncServiceMessage() + 24));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*IncomingSyncServiceMessage.deviceID.modify())(_QWORD)
{
  type metadata accessor for IncomingSyncServiceMessage();
  return nullsub_1;
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:didReceiveMessage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:didReceiveMessage:url:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:shouldAcceptIncomingMessage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:availableDevicesDidChange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

char *initializeBufferWithCopyOfBuffer for IncomingSyncServiceMessage(char *a1, char *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245387740();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = (int *)type metadata accessor for Message();
    v11 = v10[5];
    v12 = &a1[v11];
    v13 = &a2[v11];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v11], 1, v7))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v9(v12, v13, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v12, 0, 1, v7);
    }
    v16 = v10[6];
    v17 = &a1[v16];
    v18 = &a2[v16];
    v19 = *((_QWORD *)v18 + 1);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *((_QWORD *)v17 + 1) = v19;
    v20 = v10[7];
    v21 = &a1[v20];
    v22 = &a2[v20];
    v23 = *((_QWORD *)v22 + 1);
    *(_QWORD *)v21 = *(_QWORD *)v22;
    *((_QWORD *)v21 + 1) = v23;
    *(_QWORD *)&a1[v10[8]] = *(_QWORD *)&a2[v10[8]];
    v24 = v10[9];
    v25 = (uint64_t *)&a1[v24];
    v26 = (uint64_t *)&a2[v24];
    v27 = *v26;
    v28 = v26[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245261C44(v27, v28);
    *v25 = v27;
    v25[1] = v28;
    v29 = *(int *)(a3 + 20);
    v30 = &a1[v29];
    v31 = &a2[v29];
    v32 = sub_2453875E4();
    v33 = *(_QWORD *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F610);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
    v35 = *(int *)(a3 + 24);
    v36 = &a1[v35];
    v37 = &a2[v35];
    v38 = *((_QWORD *)v37 + 1);
    *(_QWORD *)v36 = *(_QWORD *)v37;
    *((_QWORD *)v36 + 1) = v38;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for IncomingSyncServiceMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_245387740();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = type metadata accessor for Message();
  v8 = a1 + *(int *)(v7 + 20);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
    v6(v8, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24525CB80(*(_QWORD *)(a1 + *(int *)(v7 + 36)), *(_QWORD *)(a1 + *(int *)(v7 + 36) + 8));
  v9 = a1 + *(int *)(a2 + 20);
  v10 = sub_2453875E4();
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IncomingSyncServiceMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  int *v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for Message();
  v10 = v9[5];
  v11 = (void *)(a1 + v10);
  v12 = (const void *)(a2 + v10);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a2 + v10, 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v8((uint64_t)v11, (uint64_t)v12, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  v14 = v9[6];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = v9[7];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  *(_QWORD *)(a1 + v9[8]) = *(_QWORD *)(a2 + v9[8]);
  v22 = v9[9];
  v23 = (uint64_t *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v25 = *v24;
  v26 = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_245261C44(v25, v26);
  *v23 = v25;
  v23[1] = v26;
  v27 = *(int *)(a3 + 20);
  v28 = (void *)(a1 + v27);
  v29 = (const void *)(a2 + v27);
  v30 = sub_2453875E4();
  v31 = *(_QWORD *)(v30 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F610);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v31 + 16))(v28, v29, v30);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  v33 = *(int *)(a3 + 24);
  v34 = (_QWORD *)(a1 + v33);
  v35 = (_QWORD *)(a2 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IncomingSyncServiceMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(void *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;

  v5 = sub_245387740();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = (int *)type metadata accessor for Message();
  v9 = v8[5];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  v13 = v12(a1 + v9, 1, v5);
  v14 = v12((uint64_t)v11, 1, v5);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v10, v11, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v10, 0, 1, v5);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v10, v5);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v7((uint64_t)v10, (uint64_t)v11, v5);
LABEL_7:
  v16 = v8[6];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = v8[7];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + v8[8]) = *(_QWORD *)(a2 + v8[8]);
  v22 = v8[9];
  v23 = (uint64_t *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v25 = *v24;
  v26 = v24[1];
  sub_245261C44(*v24, v26);
  v27 = *v23;
  v28 = v23[1];
  *v23 = v25;
  v23[1] = v26;
  sub_24525CB80(v27, v28);
  v29 = *(int *)(a3 + 20);
  v30 = (void *)(a1 + v29);
  v31 = (void *)(a2 + v29);
  v32 = sub_2453875E4();
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v33 + 48);
  v35 = v34(v30, 1, v32);
  v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 24))(v30, v31, v32);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_12;
  }
  if (v36)
  {
LABEL_12:
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F610);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v33 + 16))(v30, v31, v32);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
LABEL_13:
  v38 = *(int *)(a3 + 24);
  v39 = (_QWORD *)(a1 + v38);
  v40 = (_QWORD *)(a2 + v38);
  *v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for IncomingSyncServiceMessage(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_245387740();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for Message();
  v10 = v9[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v10], 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
  *(_OWORD *)&a1[v9[7]] = *(_OWORD *)&a2[v9[7]];
  *(_QWORD *)&a1[v9[8]] = *(_QWORD *)&a2[v9[8]];
  *(_OWORD *)&a1[v9[9]] = *(_OWORD *)&a2[v9[9]];
  v14 = *(int *)(a3 + 20);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_2453875E4();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F610);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t assignWithTake for IncomingSyncServiceMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(void *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v5 = sub_245387740();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = (int *)type metadata accessor for Message();
  v9 = v8[5];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  v13 = v12(a1 + v9, 1, v5);
  v14 = v12((uint64_t)v11, 1, v5);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v10, v11, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v10, 0, 1, v5);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v10, v5);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C700);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v7((uint64_t)v10, (uint64_t)v11, v5);
LABEL_7:
  v16 = v8[6];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v8[7];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + v8[8]) = *(_QWORD *)(a2 + v8[8]);
  v26 = v8[9];
  v27 = *(_QWORD *)(a1 + v26);
  v28 = *(_QWORD *)(a1 + v26 + 8);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  sub_24525CB80(v27, v28);
  v29 = *(int *)(a3 + 20);
  v30 = (void *)(a1 + v29);
  v31 = (void *)(a2 + v29);
  v32 = sub_2453875E4();
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v33 + 48);
  v35 = v34(v30, 1, v32);
  v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 40))(v30, v31, v32);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_12;
  }
  if (v36)
  {
LABEL_12:
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F610);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v33 + 32))(v30, v31, v32);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
LABEL_13:
  v38 = *(int *)(a3 + 24);
  v39 = (_QWORD *)(a1 + v38);
  v40 = (uint64_t *)(a2 + v38);
  v42 = *v40;
  v41 = v40[1];
  *v39 = v42;
  v39[1] = v41;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingSyncServiceMessage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24537AFC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = type metadata accessor for Message();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F610);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingSyncServiceMessage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24537B080(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for Message();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F610);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

void sub_24537B12C()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Message();
  if (v0 <= 0x3F)
  {
    sub_2452DD4FC();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for MessageSendOptions()
{
  return &type metadata for MessageSendOptions;
}

uint64_t dispatch thunk of SyncServicing.localDeviceID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SyncServicing.deviceIDs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SyncServicing.add(delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of SyncServicing.resume()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SyncServicing.send(message:url:remoteDevice:priority:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 40))();
}

uint64_t dispatch thunk of SyncServicing.sendWithResponse(message:url:remoteDevice:priority:options:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 48))();
}

uint64_t dispatch thunk of SyncServicing.pairingRelationshipPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SyncServicing.pairingRelationshipPublisher.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of SyncServicing.pairingRelationshipPublisher.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of SyncServicing.fetchLocalDeviceID(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of MetadataPersisting.localDeviceID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MetadataPersisting.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MetadataPersisting.recordMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MetadataPersisting.pairingRelationships.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of MetadataPersisting.allowListEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of MetadataPersisting.allowList.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.localDeviceID.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.localDeviceID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.isEnabled.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.isEnabled.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.allowListEnabled.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.allowListEnabled.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.allowList.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.allowList.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.removeAll()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.update(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.removePairingRelationship(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of MutableMetadataPersisting.remove(recordIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t PropertyListTypeEncoder.version.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t PropertyListTypeEncoder.__allocating_init(version:)(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_BYTE *)(result + 24) = a2 & 1;
  return result;
}

uint64_t PropertyListTypeEncoder.init(version:)(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return v2;
}

uint64_t sub_24537B31C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[7];

  v4 = sub_245387EFC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24525E4F0((uint64_t)a1, (uint64_t)v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440C938);
  sub_24537B594();
  if (swift_dynamicCast())
    return v23[6];
  v22 = v4;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_BYTE *)(v1 + 24);
  v11 = type metadata accessor for PropertyListTypeEncoder.RootEncoder();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = v9;
  *(_BYTE *)(v12 + 32) = v10;
  v13 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v23[3] = v11;
  v23[4] = sub_24537BCDC(&qword_25440C930, (uint64_t)&unk_245391E28);
  v23[0] = v12;
  swift_retain();
  v8 = (uint64_t)v13;
  sub_245387AA0();
  if (v2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    v8 = *(_QWORD *)(v12 + 16);
    if (v8)
    {
      swift_unknownObjectRetain();
      swift_release();
    }
    else
    {
      sub_245387ECC();
      v8 = sub_245387F08();
      swift_allocError();
      v16 = v15;
      v17 = (char *)v15 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574536C0) + 48);
      v18 = a1[3];
      v19 = __swift_project_boxed_opaque_existential_1(a1, v18);
      v16[3] = v18;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
      (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(boxed_opaque_existential_1, v19, v18);
      v21 = v22;
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v17, v7, v22);
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v16, *MEMORY[0x24BEE2728], v8);
      swift_willThrow();
      swift_release();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v21);
    }
  }
  return v8;
}

unint64_t sub_24537B594()
{
  unint64_t result;

  result = qword_25440C990;
  if (!qword_25440C990)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25440C990);
  }
  return result;
}

uint64_t type metadata accessor for PropertyListTypeEncoder.RootEncoder()
{
  return objc_opt_self();
}

uint64_t PropertyListTypeEncoder.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PropertyListTypeEncoder.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PropertyListTypeEncoder()
{
  return objc_opt_self();
}

uint64_t method lookup function for PropertyListTypeEncoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PropertyListTypeEncoder.__allocating_init(version:)(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 88))(a1, a2 & 1);
}

uint64_t dispatch thunk of PropertyListTypeEncoder.encode(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t sub_24537B65C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), sel_init);
  *(_QWORD *)(v3 + 16) = v6;
  v6;
  swift_unknownObjectRelease();
  v8 = type metadata accessor for PropertyListTypeEncoder.KeyedEncoder(0, a2, a3, v7);
  MEMORY[0x2495330B0](&unk_245391EB8, v8);
  return sub_2453880DC();
}

uint64_t sub_24537B720(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v16[5];

  v4 = v2;
  v7 = *v4;
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v16[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_24537B594();
  if (swift_dynamicCast())
  {
    v4[2] = v16[0];
  }
  else
  {
    v10 = v4[3];
    v11 = *((_BYTE *)v4 + 32);
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = 0;
    *(_QWORD *)(v12 + 24) = v10;
    *(_BYTE *)(v12 + 32) = v11;
    v16[3] = v7;
    v16[4] = sub_24537BCDC(&qword_25440C930, (uint64_t)&unk_245391E28);
    v16[0] = v12;
    swift_retain();
    sub_245387AA0();
    if (v3)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v14 = *(_QWORD *)(v12 + 16);
    swift_unknownObjectRetain();
    swift_release();
    v4[2] = v14;
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_24537B894()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24537B8B8()
{
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_24537B8C4()
{
  return sub_24531B410(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_24537B8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537B65C(a1, a2, a3);
}

uint64_t sub_24537B8F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t result;

  v3 = *v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), sel_init);
  *(_QWORD *)(v3 + 16) = v4;
  v5 = v4;
  swift_unknownObjectRelease();
  v6 = *(_QWORD *)(v3 + 24);
  LOBYTE(v3) = *(_BYTE *)(v3 + 32);
  a1[3] = (uint64_t)&type metadata for PropertyListTypeEncoder.UnkeyedEncoder;
  a1[4] = sub_24537BD1C();
  result = swift_allocObject();
  *a1 = result;
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 24) = v5;
  *(_QWORD *)(result + 32) = v6;
  *(_BYTE *)(result + 40) = v3;
  return result;
}

uint64_t sub_24537B990@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  a2[3] = a1;
  a2[4] = sub_24537BCDC(&qword_25440C878, (uint64_t)&unk_245391D70);
  *a2 = v4;
  return swift_retain();
}

uint64_t sub_24537B9D4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  *(_QWORD *)(v1 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
  return swift_unknownObjectRelease();
}

uint64_t sub_24537BA20()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  *(_QWORD *)(v1 + 16) = sub_245387C44();
  return swift_unknownObjectRelease();
}

uint64_t sub_24537BA58()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  *(_QWORD *)(v1 + 16) = sub_245387AF4();
  return swift_unknownObjectRelease();
}

uint64_t sub_24537BA90()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  *(_QWORD *)(v1 + 16) = sub_245387C8C();
  return swift_unknownObjectRelease();
}

uint64_t sub_24537BAC8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  *(_QWORD *)(v1 + 16) = sub_245387CBC();
  return swift_unknownObjectRelease();
}

uint64_t sub_24537BB00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDCFD28]);
}

uint64_t sub_24537BB1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD06D0]);
}

uint64_t sub_24537BB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD0710]);
}

uint64_t sub_24537BB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD0730]);
}

uint64_t sub_24537BB70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD0758]);
}

uint64_t sub_24537BB8C()
{
  return sub_245388298();
}

uint64_t sub_24537BBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD0498]);
}

uint64_t sub_24537BBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD07A0]);
}

uint64_t sub_24537BBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 16) = a4();
  return swift_unknownObjectRelease();
}

uint64_t sub_24537BC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD07B8]);
}

uint64_t sub_24537BC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD07D0]);
}

uint64_t sub_24537BC48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537BBD8(a1, a2, a3, MEMORY[0x24BDD0810]);
}

uint64_t sub_24537BC64()
{
  return sub_2453882A4();
}

uint64_t sub_24537BC78(uint64_t a1, uint64_t a2)
{
  return sub_24537B720(a1, a2);
}

uint64_t sub_24537BC98()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 24);
}

uint64_t sub_24537BCA8(uint64_t a1)
{
  uint64_t result;

  result = sub_24537BCDC(&qword_25440C930, (uint64_t)&unk_245391E28);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24537BCDC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for PropertyListTypeEncoder.RootEncoder();
    result = MEMORY[0x2495330B0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24537BD1C()
{
  unint64_t result;

  result = qword_25440C880;
  if (!qword_25440C880)
  {
    result = MEMORY[0x2495330B0](&unk_245392030, &type metadata for PropertyListTypeEncoder.UnkeyedEncoder);
    atomic_store(result, (unint64_t *)&qword_25440C880);
  }
  return result;
}

uint64_t sub_24537BD60()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t type metadata accessor for PropertyListTypeEncoder.KeyedEncoder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PropertyListTypeEncoder.KeyedEncoder);
}

void _s16ReplicatorEngine23PropertyListTypeEncoderC14UnkeyedEncoderVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t _s16ReplicatorEngine23PropertyListTypeEncoderC14UnkeyedEncoderVwcp_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  v4 = v3;
  return a1;
}

uint64_t _s16ReplicatorEngine23PropertyListTypeEncoderC14UnkeyedEncoderVwca_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v7;
  return a1;
}

uint64_t _s16ReplicatorEngine23PropertyListTypeEncoderC14UnkeyedEncoderVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t _s16ReplicatorEngine23PropertyListTypeEncoderC14UnkeyedEncoderVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_24537BF10(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PropertyListTypeEncoder.UnkeyedEncoder()
{
  return &type metadata for PropertyListTypeEncoder.UnkeyedEncoder;
}

uint64_t sub_24537BF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(v3 + 8);
  v11 = sub_2453884C0();
  if ((v12 & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    v13 = sub_2453884A8();
    v19 = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v18 = v13;
    *((_QWORD *)&v18 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_245357B38((uint64_t)&v16);
  }
  else
  {
    *((_QWORD *)&v17 + 1) = MEMORY[0x24BEE1768];
    *(_QWORD *)&v16 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_2452CC368(&v16, &v18);
  }
  __swift_project_boxed_opaque_existential_1(&v18, v19);
  objc_msgSend(v10, sel___swift_setObject_forKeyedSubscript_, a1, sub_245388268());
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
}

void sub_24537C0CC(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
  sub_24537BF64((uint64_t)v4, a1, a2);

}

void sub_24537C128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)sub_245387C44();
  sub_24537BF64((uint64_t)v5, a2, a3);

}

void sub_24537C170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;

  v6 = (void *)sub_245387AF4();
  sub_24537BF64((uint64_t)v6, a3, a4);

}

void sub_24537C1B8(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)sub_245387C8C();
  sub_24537BF64((uint64_t)v4, a1, a2);

}

void sub_24537C200(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)sub_245387CBC();
  sub_24537BF64((uint64_t)v4, a1, a2);

}

void sub_24537C248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;

  v6 = (void *)a4();
  sub_24537BF64((uint64_t)v6, a2, a3);

}

uint64_t sub_24537C290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  char v21;
  uint64_t inited;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[5];
  uint64_t v29;

  v7 = v5;
  v26 = a5;
  v27 = a2;
  v29 = a3;
  v10 = *(_QWORD *)(a4 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v14((char *)&v25 - v15, a1, v16);
  sub_24537B594();
  v17 = swift_dynamicCast();
  v18 = v28[0];
  v14(v13, a1, a4);
  if (v17)
    v19 = v18 == 0;
  else
    v19 = 1;
  if (v19)
  {
    v20 = *(_QWORD *)(v7 + 16);
    v21 = *(_BYTE *)(v7 + 24);
    type metadata accessor for PropertyListTypeEncoder();
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 16) = v20;
    *(_BYTE *)(inited + 24) = v21;
    v28[3] = a4;
    v28[4] = v26;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v28);
    v14((char *)boxed_opaque_existential_1, (uint64_t)v13, a4);
    v18 = sub_24537B31C(v28);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a4);
    swift_release();
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    if (v6)
      return result;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a4);
  }
  sub_24537BF64(v18, v27, v29);
  return swift_unknownObjectRelease();
}

void sub_24537C434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), sel_init);
  sub_24537BF64((uint64_t)v9, a2, a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440C9A0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245389A60;
  v11 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(inited + 56) = v11;
  *(_QWORD *)(inited + 64) = *(_QWORD *)(a3 + 24);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2, v11);
  v13 = v9;
  swift_bridgeObjectRetain();
  sub_245356878(inited);
  v15 = type metadata accessor for PropertyListTypeEncoder.KeyedEncoder(0, a4, a5, v14);
  swift_bridgeObjectRetain();
  v16 = v13;
  MEMORY[0x2495330B0](&unk_245391EB8, v15);
  sub_2453880DC();
  swift_bridgeObjectRelease();

}

void sub_24537C5C8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  id v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = v3;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), sel_init);
  sub_24537BF64((uint64_t)v8, a1, a2);
  v9 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440C9A0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245389A60;
  v11 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(inited + 56) = v11;
  *(_QWORD *)(inited + 64) = *(_QWORD *)(a2 + 24);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a1, v11);
  v13 = v8;
  swift_bridgeObjectRetain();
  sub_245356878(inited);
  v14 = v9;
  v15 = v4[2];
  LOBYTE(v4) = *((_BYTE *)v4 + 24);
  a3[3] = (uint64_t)&type metadata for PropertyListTypeEncoder.UnkeyedEncoder;
  a3[4] = sub_24537BD1C();
  v16 = swift_allocObject();
  *a3 = v16;

  *(_QWORD *)(v16 + 16) = v14;
  *(_QWORD *)(v16 + 24) = v13;
  *(_QWORD *)(v16 + 32) = v15;
  *(_BYTE *)(v16 + 40) = (_BYTE)v4;
}

void sub_24537C724()
{
  sub_245387F80();
  __break(1u);
}

void sub_24537C784()
{
  sub_245387F80();
  __break(1u);
}

void sub_24537C7E4(uint64_t a1, uint64_t a2)
{
  sub_24537C0CC(a1, a2);
}

void sub_24537C7F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C128(a1, a2, a3);
}

void sub_24537C80C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24537C170(a1, a2, a3, a4);
}

void sub_24537C820(uint64_t a1, uint64_t a2)
{
  sub_24537C1B8(a1, a2);
}

void sub_24537C834(uint64_t a1, uint64_t a2)
{
  sub_24537C200(a1, a2);
}

void sub_24537C848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDCFD28]);
}

void sub_24537C864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD06D0]);
}

void sub_24537C880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD0710]);
}

void sub_24537C89C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD0730]);
}

void sub_24537C8B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD0758]);
}

uint64_t sub_24537C8D4()
{
  return sub_2453883AC();
}

void sub_24537C8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD0498]);
}

void sub_24537C904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD07A0]);
}

void sub_24537C920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD07B8]);
}

void sub_24537C93C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD07D0]);
}

void sub_24537C958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537C248(a1, a2, a3, MEMORY[0x24BDD0810]);
}

uint64_t sub_24537C974()
{
  return sub_2453883B8();
}

uint64_t sub_24537C988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24537C290(a1, a2, a5, a3, a4);
}

uint64_t sub_24537C9AC()
{
  return sub_2453883A0();
}

uint64_t sub_24537C9D4()
{
  return sub_245388334();
}

uint64_t sub_24537C9E8()
{
  return sub_245388328();
}

uint64_t sub_24537C9FC()
{
  return sub_245388340();
}

uint64_t sub_24537CA14(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24537CB78(a1, a2, a3, a4, MEMORY[0x24BEE3C98]);
}

uint64_t sub_24537CA30()
{
  return sub_24538834C();
}

uint64_t sub_24537CA48(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24537CB00(a1, a2, a3, a4, MEMORY[0x24BEE3CB8]);
}

uint64_t sub_24537CA64(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24537CB3C(a1, a2, a3, a4, MEMORY[0x24BEE3CC0]);
}

uint64_t sub_24537CA80(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24537CB78(a1, a2, a3, a4, MEMORY[0x24BEE3CC8]);
}

uint64_t sub_24537CA9C()
{
  return sub_245388370();
}

uint64_t sub_24537CAB4()
{
  return sub_24538837C();
}

uint64_t sub_24537CACC()
{
  return sub_245388358();
}

uint64_t sub_24537CAE4(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24537CB00(a1, a2, a3, a4, MEMORY[0x24BEE3CD8]);
}

uint64_t sub_24537CB00(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_24537CB20(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24537CB3C(a1, a2, a3, a4, MEMORY[0x24BEE3CE8]);
}

uint64_t sub_24537CB3C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_24537CB5C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24537CB78(a1, a2, a3, a4, MEMORY[0x24BEE3CF0]);
}

uint64_t sub_24537CB78(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_24537CBA0()
{
  return sub_245388388();
}

uint64_t sub_24537CBB8()
{
  return sub_245388394();
}

uint64_t sub_24537CBD0()
{
  return sub_245388364();
}

void sub_24537CBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24537C434(a1, a2, a5, a3, a4);
}

uint64_t sub_24537CC18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  char v18;
  uint64_t inited;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v23[5];
  uint64_t v24;

  v5 = v3;
  v24 = a3;
  v8 = *(_QWORD *)(a2 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v23[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v12((char *)&v23[-1] - v13, a1, a2);
  sub_24537B594();
  v14 = swift_dynamicCast();
  v15 = v23[0];
  v12(v11, a1, a2);
  if (v14)
    v16 = v15 == 0;
  else
    v16 = 1;
  if (v16)
  {
    v17 = *(_QWORD *)(v5 + 16);
    v18 = *(_BYTE *)(v5 + 24);
    type metadata accessor for PropertyListTypeEncoder();
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 16) = v17;
    *(_BYTE *)(inited + 24) = v18;
    v23[3] = a2;
    v23[4] = v24;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v23);
    v12((char *)boxed_opaque_existential_1, (uint64_t)v11, a2);
    v15 = sub_24537B31C(v23);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, a2);
    swift_release();
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    if (v4)
      return result;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, a2);
  }
  objc_msgSend(*(id *)(v5 + 8), sel_addObject_, v15);
  return swift_unknownObjectRelease();
}

uint64_t sub_24537CDB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(v3 + 8), sel_addObject_, objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), sel_init));
  v7 = type metadata accessor for PropertyListTypeEncoder.KeyedEncoder(0, a2, a3, v6);
  swift_bridgeObjectRetain();
  MEMORY[0x2495330B0](&unk_245391EB8, v7);
  return sub_2453880DC();
}

id sub_24537CE80()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 8), sel_count);
}

void sub_24537CE90()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
  objc_msgSend(*(id *)(v0 + 8), sel_addObject_, v1);

}

void sub_24537CEE4()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)sub_245387C44();
  objc_msgSend(*(id *)(v0 + 8), sel_addObject_, v1);

}

void sub_24537CF24()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)sub_245387AF4();
  objc_msgSend(*(id *)(v0 + 8), sel_addObject_, v1);

}

void sub_24537CF64()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)sub_245387C8C();
  objc_msgSend(*(id *)(v0 + 8), sel_addObject_, v1);

}

void sub_24537CFA4()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)sub_245387CBC();
  objc_msgSend(*(id *)(v0 + 8), sel_addObject_, v1);

}

void sub_24537CFE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDCFD28]);
}

void sub_24537D000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD06D0]);
}

void sub_24537D01C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD0710]);
}

void sub_24537D038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD0730]);
}

void sub_24537D054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD0758]);
}

uint64_t sub_24537D070()
{
  return sub_245388250();
}

void sub_24537D084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD0498]);
}

void sub_24537D0A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD07A0]);
}

void sub_24537D0BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  void *v5;

  v5 = (void *)a4();
  objc_msgSend(*(id *)(v4 + 8), sel_addObject_, v5);

}

void sub_24537D0FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD07B8]);
}

void sub_24537D118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD07D0]);
}

void sub_24537D134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24537D0BC(a1, a2, a3, MEMORY[0x24BDD0810]);
}

uint64_t sub_24537D150()
{
  return sub_24538825C();
}

uint64_t sub_24537D164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24537CC18(a1, a2, a3);
}

uint64_t sub_24537D178()
{
  return sub_245388178();
}

uint64_t sub_24537D1A0()
{
  return sub_24538819C();
}

uint64_t sub_24537D1C8()
{
  return sub_245388190();
}

uint64_t sub_24537D1F0()
{
  return sub_2453881A8();
}

uint64_t sub_24537D218()
{
  return sub_2453881B4();
}

uint64_t sub_24537D240()
{
  return sub_2453881C0();
}

uint64_t sub_24537D268()
{
  return sub_2453881D8();
}

uint64_t sub_24537D290()
{
  return sub_2453881E4();
}

uint64_t sub_24537D2B8()
{
  return sub_2453881F0();
}

uint64_t sub_24537D2E0()
{
  return sub_2453881FC();
}

uint64_t sub_24537D308()
{
  return sub_245388214();
}

uint64_t sub_24537D330()
{
  return sub_2453881CC();
}

uint64_t sub_24537D358()
{
  return sub_245388208();
}

uint64_t sub_24537D380()
{
  return sub_245388220();
}

uint64_t sub_24537D3A8()
{
  return sub_24538822C();
}

uint64_t sub_24537D3D0()
{
  return sub_245388238();
}

uint64_t sub_24537D3F8()
{
  return sub_245388244();
}

uint64_t sub_24537D420()
{
  return sub_245388184();
}

uint64_t sub_24537D454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), sel_init);
  objc_msgSend((id)v3[1], sel_addObject_, v7);
  v8 = *v3;
  v9 = v3[2];
  v10 = *((_BYTE *)v3 + 24);
  a3[3] = a1;
  a3[4] = a2;
  v11 = swift_allocObject();
  *a3 = v11;
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v7;
  *(_QWORD *)(v11 + 32) = v9;
  *(_BYTE *)(v11 + 40) = v10;
  return swift_bridgeObjectRetain();
}

void sub_24537D4F8()
{
  sub_245387F80();
  __break(1u);
}

void __swiftcall PairedDevice.init(identifier:name:deviceClass:)(ReplicatorEngine::PairedDevice *__return_ptr retstr, Swift::String identifier, Swift::String name, ReplicatorEngine::PairedDevice::PairedDeviceClass deviceClass)
{
  ReplicatorEngine::PairedDevice::PairedDeviceClass v4;

  v4 = *(_BYTE *)deviceClass;
  retstr->identifier = identifier;
  retstr->name = name;
  retstr->deviceClass = v4;
}

uint64_t PairedDevice.PairedDeviceClass.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24537D5A0 + 4 * byte_2453921A0[*v0]))(0x64696C61766E69, 0xE700000000000000);
}

uint64_t sub_24537D5A0()
{
  return 0x656E6F6870;
}

uint64_t sub_24537D5B4()
{
  return 6513005;
}

uint64_t sub_24537D5C4()
{
  return 0x6863746177;
}

uint64_t sub_24537D5D8()
{
  return 30324;
}

BOOL static PairedDevice.PairedDeviceClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PairedDevice.PairedDeviceClass.hash(into:)()
{
  return sub_245388448();
}

uint64_t PairedDevice.PairedDeviceClass.hashValue.getter()
{
  sub_24538843C();
  sub_245388448();
  return sub_245388478();
}

uint64_t sub_24537D664()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24537D694 + 4 * byte_2453921A5[*v0]))(0x64696C61766E69, 0xE700000000000000);
}

uint64_t sub_24537D694()
{
  return 0x656E6F6870;
}

uint64_t sub_24537D6A8()
{
  return 6513005;
}

uint64_t sub_24537D6B8()
{
  return 0x6863746177;
}

uint64_t sub_24537D6CC()
{
  return 30324;
}

uint64_t PairedDevice.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PairedDevice.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void PairedDevice.deviceClass.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

void PairedDevice.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_245387EA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  swift_bridgeObjectRetain();
  sub_245387B90();
  swift_bridgeObjectRelease();
  sub_245387B90();
  __asm { BR              X9 }
}

uint64_t sub_24537D85C()
{
  uint64_t v1;

  sub_245387B90();
  swift_bridgeObjectRelease();
  return v1;
}

BOOL _s16ReplicatorEngine12PairedDeviceV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  char v9;
  _BOOL8 result;
  char v12;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(unsigned __int8 *)(a2 + 32);
  v8 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v8 || (v9 = sub_245388274(), result = 0, (v9 & 1) != 0))
  {
    if (v2 == v5 && v3 == v6)
      return v4 == v7;
    v12 = sub_245388274();
    result = 0;
    if ((v12 & 1) != 0)
      return v4 == v7;
  }
  return result;
}

unint64_t sub_24537D980()
{
  unint64_t result;

  result = qword_2574536C8;
  if (!qword_2574536C8)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for PairedDevice.PairedDeviceClass, &type metadata for PairedDevice.PairedDeviceClass);
    atomic_store(result, (unint64_t *)&qword_2574536C8);
  }
  return result;
}

uint64_t initializeWithCopy for PairedDevice(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PairedDevice(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for PairedDevice(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PairedDevice(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairedDevice(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PairedDevice()
{
  return &type metadata for PairedDevice;
}

uint64_t storeEnumTagSinglePayload for PairedDevice.PairedDeviceClass(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24537DBB0 + 4 * byte_2453921B4[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24537DBE4 + 4 * byte_2453921AF[v4]))();
}

uint64_t sub_24537DBE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24537DBEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24537DBF4);
  return result;
}

uint64_t sub_24537DC00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24537DC08);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24537DC0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24537DC14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PairedDevice.PairedDeviceClass()
{
  return &type metadata for PairedDevice.PairedDeviceClass;
}

uint64_t static OPACKCoder.encode(_:version:)(_QWORD *a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t inited;
  uint64_t v8;
  void *v9;

  type metadata accessor for PropertyListTypeEncoder();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = a2;
  *(_BYTE *)(inited + 24) = a3 & 1;
  v8 = inited;
  v9 = (void *)sub_24537B31C(a1);
  if (!v3)
  {
    v8 = sub_24537E224(v9);
    swift_unknownObjectRelease();
  }
  return v8;
}

uint64_t static OPACKCoder.decode<A>(_:from:version:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t result;
  uint64_t inited;
  _OWORD v12[2];

  result = sub_24537DFE8(v12);
  if (!v6)
  {
    type metadata accessor for PropertyListTypeDecoder();
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 16) = a4;
    *(_BYTE *)(inited + 24) = a5 & 1;
    sub_245350194(a6, (uint64_t)v12);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  return result;
}

uint64_t static OPACKCoder.encodeNSSecureCoding(_:)(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;

  v2 = objc_msgSend(objc_allocWithZone((Class)STRPPropertyListTypeEncoder), sel_init);
  v3 = objc_msgSend(v2, sel_encodeRootObject_, a1);

  v4 = sub_24537E224(v3);
  swift_unknownObjectRelease();
  return v4;
}

id static OPACKCoder.decodeNSSecureCoding<A>(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, id a4)
{
  uint64_t v4;
  id v6;
  uint64_t ObjCClassFromMetadata;
  id v8;
  id v9;
  id v10;
  void *v12;
  id v13[4];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  sub_24537DFE8(&v14);
  if (!v4)
  {
    v6 = objc_msgSend(objc_allocWithZone((Class)STRPPropertyListTypeDecoder), sel_init);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    __swift_project_boxed_opaque_existential_1(&v14, v15);
    v13[0] = 0;
    v8 = objc_msgSend(v6, sel_decodeRootObjectOfClass_fromEncoded_error_, ObjCClassFromMetadata, sub_245388268(), v13);

    swift_unknownObjectRelease();
    if (v8)
    {
      v9 = v13[0];
      sub_245387E24();
      swift_unknownObjectRelease();
      if ((swift_dynamicCast() & 1) != 0)
      {
        a4 = v12;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
        return a4;
      }
      sub_245387B18();
      v10 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      a4 = (id)sub_245387AF4();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_initWithDomain_code_userInfo_, a4, 1, 0);
    }
    else
    {
      a4 = v13[0];
      sub_245387584();
    }

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  }
  return a4;
}

uint64_t sub_24537DFE8@<X0>(_OWORD *a1@<X8>)
{
  void *v2;
  id v3;
  int v4;
  id v5;
  void *v6;
  int v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8 = sub_245387854();
  v2 = (void *)sub_24538762C();
  v3 = OPACKDecodeNSDataTm(v2, (uint64_t)&v8, MEMORY[0x24BE29870]);

  if (v3)
  {
    sub_245387E24();
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  sub_24537E370((uint64_t)&v9, (uint64_t)v11);
  sub_24537E3B8((uint64_t)v11, (uint64_t)&v9);
  if (!*((_QWORD *)&v10 + 1))
  {
    sub_245357B38((uint64_t)&v9);
    goto LABEL_8;
  }
  sub_2452CC368(&v9, a1);
  v4 = v8;
  if (v4 != sub_245387854())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
LABEL_8:
    sub_245387B18();
    v5 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v6 = (void *)sub_245387AF4();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_initWithDomain_code_userInfo_, v6, 2, 0);

    swift_willThrow();
  }
  return sub_245357B38((uint64_t)v11);
}

id OPACKCoder.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id OPACKCoder.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OPACKCoder();
  return objc_msgSendSuper2(&v2, sel_init);
}

id OPACKCoder.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OPACKCoder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24537E224(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v1 = OPACKDecodeNSDataTm(a1, (uint64_t)&v9, MEMORY[0x24BE29880]);
  if (v1)
  {
    v2 = v1;
    v3 = sub_245387638();
    v5 = v4;

    LODWORD(v2) = v9;
    if ((_DWORD)v2 == sub_245387854())
      return v3;
  }
  else
  {
    v3 = 0;
    v5 = 0xF000000000000000;
  }
  sub_245387B18();
  v6 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v7 = (void *)sub_245387AF4();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_initWithDomain_code_userInfo_, v7, 2, 0);

  swift_willThrow();
  sub_24525FFF8(v3, v5);
  return v3;
}

uint64_t type metadata accessor for OPACKCoder()
{
  return objc_opt_self();
}

uint64_t sub_24537E370(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C9B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24537E3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440C9B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id OPACKDecodeNSDataTm(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4;
  id v5;

  v4 = a1;
  v5 = (id)a3();

  return v5;
}

uint64_t dispatch thunk of SuspensionPolicy.discardDate(for:hasRecordsFromRemoteDevice:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SuspensionPolicy.unpairDate(for:hasRecordsFromRemoteDevice:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_24537E460@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void (*v35)(uint64_t, uint64_t, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  char *v40;
  char *v41;
  void (*v42)(char *, char *, uint64_t);
  char v43;
  void (*v44)(char *, char *, uint64_t);
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  char *v48;
  char v49;
  char *v50;
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  char *v53;
  char v54;
  void (*v55)(char *, uint64_t);
  char v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  void (*v60)(char *, char *, uint64_t);
  int v61;
  unsigned int (*v62)(char *, uint64_t, uint64_t);
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  char *v71;
  char *v72;

  v72 = a4;
  v71 = a2;
  v68 = a6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744F6B0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v66 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v60 - v12;
  v14 = sub_2453876EC();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v67 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v63 = (char *)&v60 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v64 = (char *)&v60 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v65 = (char *)&v60 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v60 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v60 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v60 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v60 - v33;
  sub_24538765C();
  v35 = *(void (**)(uint64_t, uint64_t, char *, uint64_t))(a5 + 8);
  v70 = a1;
  v36 = a1;
  v37 = a5;
  v69 = a3;
  v35(v36, a3, v72, a5);
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v38(v13, 1, v14) == 1)
  {
    sub_2452F5D08((uint64_t)v13);
    v39 = (uint64_t)v66;
    v40 = v67;
    v41 = v71;
    goto LABEL_9;
  }
  v62 = v38;
  v42 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v42(v32, v13, v14);
  v43 = sub_24538768C();
  v44 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v44(v29, v32, v14);
  v44(v26, v71, v14);
  if ((v43 & 1) == 0)
  {
    v45 = *(void (**)(char *, uint64_t))(v15 + 8);
    v45(v26, v14);
    v45(v29, v14);
    v39 = (uint64_t)v66;
    v40 = v67;
    v38 = v62;
    goto LABEL_7;
  }
  v60 = v42;
  v61 = sub_245387680();
  v45 = *(void (**)(char *, uint64_t))(v15 + 8);
  v45(v26, v14);
  v45(v29, v14);
  v39 = (uint64_t)v66;
  v40 = v67;
  v38 = v62;
  if ((v61 & 1) == 0)
  {
LABEL_7:
    v45(v32, v14);
    goto LABEL_8;
  }
  v45(v34, v14);
  v60(v34, v32, v14);
LABEL_8:
  v41 = v71;
LABEL_9:
  (*(void (**)(uint64_t, _QWORD, char *, uint64_t))(v37 + 16))(v70, v69 & 1, v72, v37);
  if (v38((char *)v39, 1, v14) == 1)
  {
    sub_2452F5D08(v39);
    v46 = v68;
    goto LABEL_16;
  }
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 32);
  v48 = v65;
  v47(v65, v39, v14);
  v72 = v34;
  v49 = sub_24538768C();
  v50 = v41;
  v51 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v52 = v64;
  v51(v64, v48, v14);
  v53 = v63;
  v51(v63, v50, v14);
  if ((v49 & 1) != 0)
  {
    v54 = sub_245387680();
    v55 = *(void (**)(char *, uint64_t))(v15 + 8);
    v55(v53, v14);
    v55(v52, v14);
    v46 = v68;
    v34 = v72;
    if ((v54 & 1) != 0)
    {
      v55(v72, v14);
      v47(v34, (uint64_t)v48, v14);
      goto LABEL_16;
    }
  }
  else
  {
    v55 = *(void (**)(char *, uint64_t))(v15 + 8);
    v55(v53, v14);
    v55(v52, v14);
    v46 = v68;
    v34 = v72;
  }
  v55(v48, v14);
LABEL_16:
  sub_24538765C();
  v56 = sub_24538768C();
  v57 = *(void (**)(char *, uint64_t))(v15 + 8);
  v57(v40, v14);
  if ((v56 & 1) != 0)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v46, v34, v14);
    v58 = 0;
  }
  else
  {
    v57(v34, v14);
    v58 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v46, v58, 1, v14);
}

double sub_24537E908()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

uint64_t LinearRetryTimer.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
  v1 = swift_allocObject();
  *(_DWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 16) = 3;
  *(_QWORD *)(v0 + 24) = 0x4030000000000000;
  *(_OWORD *)(v0 + 32) = xmmword_24538C690;
  return v0;
}

_QWORD *LinearRetryTimer.init()()
{
  _QWORD *v0;
  uint64_t v1;

  v0[5] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
  v1 = swift_allocObject();
  *(_DWORD *)(v1 + 16) = 0;
  v0[6] = v1;
  v0[2] = 3;
  v0[3] = 0x4030000000000000;
  v0[4] = 3;
  return v0;
}

uint64_t LinearRetryTimer.__allocating_init(maxRetries:intervalUntilRetry:)(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v4 + 48) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  *(double *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a1;
  return v4;
}

uint64_t LinearRetryTimer.init(maxRetries:intervalUntilRetry:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v5;

  *(_QWORD *)(v2 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440BFA0);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v2 + 48) = v5;
  *(_QWORD *)(v2 + 16) = a1;
  *(double *)(v2 + 24) = a2;
  *(_QWORD *)(v2 + 32) = a1;
  return v2;
}

uint64_t LinearRetryTimer.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t LinearRetryTimer.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LinearRetryTimer()
{
  return objc_opt_self();
}

uint64_t DuetHandshakeTask.handshakeDescriptor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 40);
  return swift_bridgeObjectRetain();
}

void DuetHandshakeTask.schedule.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 64);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 56);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t DuetHandshakeTask.__allocating_init(handshakeDescriptor:schedule:handler:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  DuetHandshakeTask.init(handshakeDescriptor:schedule:handler:)(a1, a2, a3, a4);
  return v8;
}

uint64_t DuetHandshakeTask.init(handshakeDescriptor:schedule:handler:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  char *v45;
  _QWORD *v46;
  uint64_t v47;
  os_log_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(os_log_t, uint64_t);
  uint64_t v52;
  NSObject *v53;
  void (*v54)(char *, char *, uint64_t);
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  os_log_type_t v58;
  int v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  _QWORD *v76;
  uint64_t v77;
  void *v78;
  unint64_t v79;
  id v80;
  unsigned int v81;
  uint64_t v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  uint64_t v88;
  char *v89;
  _QWORD *v90;
  _QWORD *v91;
  char v92;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  double v100;
  id v101;
  void *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  char *v116;
  void (*v117)(char *, uint64_t);
  uint64_t v118;
  id v119;
  void (*v120)(char *, uint64_t);
  char *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  char *v126;
  NSObject *v127;
  os_log_type_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  void (*v135)(char *, uint64_t);
  char *v136;
  uint64_t v137;
  void (*v138)(char *, uint64_t);
  id v139;
  char *v140;
  char *v141;
  id v142;
  unsigned int v143;
  uint64_t v144;
  _QWORD *v145;
  char *v146;
  uint64_t v147;
  char *v148;
  char *v149;
  NSObject *v150;
  os_log_type_t v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  void (*v159)(char *, uint64_t);
  uint64_t v160;
  unint64_t v161;
  os_log_t v162;
  char *v163;
  _QWORD *v164;
  void *v165;
  uint64_t v166;
  char *v167;
  id v168;
  id v169;
  NSObject *v170;
  os_log_type_t v171;
  uint64_t v172;
  uint64_t v173;
  _QWORD *v174;
  uint64_t v175;
  unint64_t v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  char *v181;
  uint64_t v182;
  unint64_t v183;
  os_log_t v184;
  uint64_t v185;
  void *v186;
  char *v187;
  uint64_t v188;
  uint64_t v190;
  int v191;
  char *v192;
  char *v193;
  char *v194;
  char *v195;
  uint64_t v196;
  int v197;
  char *v198;
  char *v199;
  char *v200;
  char *v201;
  char *v202;
  uint64_t v203;
  NSObject *v204;
  uint64_t v205;
  char *v206;
  uint64_t v207;
  os_log_t v208;
  os_log_t v209;
  void (*v210)(char *, uint64_t);
  _QWORD *v211;
  NSObject *v212;
  _QWORD *v213;
  _QWORD *v214;
  uint64_t v215;
  uint64_t v216;
  char *v217;
  uint64_t v218;
  _QWORD *aBlock;
  unint64_t v220;
  void (*v221)(uint64_t, void *);
  void *v222;
  uint64_t (*v223)(void *);
  _QWORD *v224;
  uint64_t v225;

  v5 = v4;
  v215 = a4;
  v205 = a3;
  v225 = *MEMORY[0x24BDAC8D0];
  v209 = *(os_log_t *)v5;
  v216 = sub_2453876EC();
  v214 = *(_QWORD **)(v216 - 8);
  v8 = MEMORY[0x24BDAC7A8](v216);
  v199 = (char *)&v190 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v198 = (char *)&v190 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v200 = (char *)&v190 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v201 = (char *)&v190 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v193 = (char *)&v190 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v192 = (char *)&v190 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v195 = (char *)&v190 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v194 = (char *)&v190 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v212 = (char *)&v190 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v204 = (char *)&v190 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v208 = (os_log_t)((char *)&v190 - v29);
  MEMORY[0x24BDAC7A8](v28);
  v217 = (char *)&v190 - v30;
  v213 = (_QWORD *)sub_245387D70();
  v210 = (void (*)(char *, uint64_t))*(v213 - 1);
  MEMORY[0x24BDAC7A8](v213);
  v206 = (char *)&v190 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v203 = sub_245387D4C();
  MEMORY[0x24BDAC7A8](v203);
  v202 = (char *)&v190 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_245387950();
  MEMORY[0x24BDAC7A8](v33);
  v35 = *a1;
  v34 = a1[1];
  v36 = *((unsigned __int8 *)a1 + 16);
  v37 = a1[3];
  v38 = a1[4];
  v39 = *(_QWORD **)a2;
  v40 = *(_BYTE *)(a2 + 8);
  LODWORD(v211) = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574536D0);
  v41 = swift_allocObject();
  *(_DWORD *)(v41 + 20) = 0;
  *(_BYTE *)(v41 + 16) = 0;
  *(_QWORD *)(v5 + 72) = v41;
  *(_QWORD *)(v5 + 80) = 0;
  v42 = swift_allocObject();
  *(_DWORD *)(v42 + 20) = 0;
  *(_BYTE *)(v42 + 16) = 0;
  *(_QWORD *)(v5 + 88) = v42;
  *(_QWORD *)(v5 + 16) = v35;
  *(_QWORD *)(v5 + 24) = v34;
  v197 = v36;
  *(_BYTE *)(v5 + 32) = v36;
  *(_QWORD *)(v5 + 40) = v37;
  *(_QWORD *)(v5 + 48) = v38;
  *(_QWORD *)(v5 + 56) = v39;
  *(_BYTE *)(v5 + 64) = v40;
  aBlock = 0;
  v220 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_245387EA8();
  sub_245387B90();
  swift_bridgeObjectRetain();
  v196 = v35;
  sub_245387B90();
  v207 = v34;
  swift_bridgeObjectRelease();
  v44 = aBlock;
  v43 = (_QWORD *)v220;
  sub_24525C748();
  swift_bridgeObjectRetain();
  sub_24538792C();
  aBlock = (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_24525C6C4((unint64_t *)&unk_257450050, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257450020);
  sub_24525C7C4();
  v45 = v217;
  sub_245387E3C();
  (*((void (**)(char *, _QWORD, id))v210 + 13))(v206, *MEMORY[0x24BEE5758], v213);
  v213 = v44;
  v46 = v214;
  v47 = v216;
  *(_QWORD *)(v5 + 96) = sub_245387D94();
  v48 = v208;
  v49 = sub_2453876C8();
  v203 = (uint64_t)v39;
  aBlock = v39;
  LOBYTE(v220) = (_BYTE)v211;
  sub_24538039C(v49, v50);
  sub_245387674();
  v51 = (void (*)(os_log_t, uint64_t))v46[1];
  v51(v48, v47);
  if (qword_25744FD90 != -1)
    swift_once();
  v52 = sub_245387818();
  v53 = __swift_project_value_buffer(v52, (uint64_t)qword_257462FB0);
  v54 = (void (*)(char *, char *, uint64_t))v46[2];
  v55 = v204;
  v54(v204, v45, v47);
  v56 = v212;
  v206 = (char *)v54;
  v54(v212, v45, v47);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v208 = v53;
  v57 = sub_2453877F4();
  v58 = sub_245387D34();
  v59 = v58;
  v60 = os_log_type_enabled(v57, v58);
  v210 = (void (*)(char *, uint64_t))v51;
  if (v60)
  {
    v61 = swift_slowAlloc();
    v214 = v43;
    v62 = v61;
    v202 = (char *)swift_slowAlloc();
    aBlock = v202;
    *(_DWORD *)v62 = 136315906;
    v191 = v59;
    v218 = v5;
    swift_retain();
    v63 = sub_245387B48();
    v218 = sub_2453816D8(v63, v64, (uint64_t *)&aBlock);
    sub_245387E0C();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2082;
    sub_24525C6C4((unint64_t *)&qword_2574525E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v65 = sub_2453880F4();
    v218 = sub_2453816D8(v65, v66, (uint64_t *)&aBlock);
    sub_245387E0C();
    swift_bridgeObjectRelease();
    v51(v55, v47);
    *(_WORD *)(v62 + 22) = 2050;
    v67 = v212;
    sub_2453876A4();
    v218 = v68;
    sub_245387E0C();
    v51(v67, v47);
    *(_WORD *)(v62 + 32) = 2080;
    swift_bridgeObjectRetain();
    v69 = (uint64_t)v213;
    v218 = sub_2453816D8((uint64_t)v213, (unint64_t)v214, (uint64_t *)&aBlock);
    sub_245387E0C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_245256000, v57, (os_log_type_t)v191, "%s scheduling Duet handshake task at: %{public}s in %{public}fs: %s", (uint8_t *)v62, 0x2Au);
    v70 = v202;
    swift_arrayDestroy();
    MEMORY[0x24953317C](v70, -1, -1);
    v71 = v62;
    v43 = v214;
    MEMORY[0x24953317C](v71, -1, -1);

  }
  else
  {
    swift_release_n();
    v51(v55, v47);
    v51(v56, v47);

    swift_bridgeObjectRelease_n();
    v69 = (uint64_t)v213;
  }
  v214 = (_QWORD *)objc_opt_self();
  v72 = objc_msgSend(v214, sel_sharedScheduler);
  v73 = (void *)sub_245387AF4();
  v74 = v5;
  v75 = *(void **)(v5 + 96);
  v76 = (_QWORD *)swift_allocObject();
  v76[2] = v74;
  v76[3] = v69;
  v77 = v205;
  v76[4] = v43;
  v76[5] = v77;
  v76[6] = v215;
  v223 = sub_245380738;
  v224 = v76;
  aBlock = (_QWORD *)MEMORY[0x24BDAC760];
  v220 = 1107296256;
  v221 = sub_2452D4660;
  v222 = &block_descriptor_16;
  v78 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  v79 = (unint64_t)v43;
  v80 = v75;
  swift_retain();
  swift_release();
  v81 = objc_msgSend(v72, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v73, v80, v78);
  _Block_release(v78);

  v82 = *(_QWORD *)(v74 + 72);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v82 + 20));
  *(_BYTE *)(v82 + 16) = v81;
  os_unfair_lock_unlock((os_unfair_lock_t)(v82 + 20));
  swift_release();
  if (v81)
  {
    v83 = objc_allocWithZone(MEMORY[0x24BE0B710]);
    swift_bridgeObjectRetain();
    v84 = (void *)sub_245387AF4();
    swift_bridgeObjectRelease();
    v85 = objc_msgSend(v83, sel_initWithIdentifier_, v84);

    v86 = *(void **)(v74 + 80);
    *(_QWORD *)(v74 + 80) = v85;

    v87 = *(void **)(v74 + 80);
    v88 = v74;
    v89 = v217;
    v90 = (_QWORD *)v79;
    if (v87)
    {
      v91 = (_QWORD *)v203;
      v92 = (char)v211;
      if (v203 >= 2 || v211 >= 2)
        v94 = 1;
      else
        v94 = 2;
      v95 = v87;
      v96 = objc_msgSend(v95, sel_setPriority_, v94);
      aBlock = v91;
      LOBYTE(v220) = v92;
      sub_24538039C((uint64_t)v96, v97);
      v98 = objc_msgSend(v95, sel_setScheduleAfter_);
      aBlock = v91;
      LOBYTE(v220) = v92;
      sub_24538039C((uint64_t)v98, v99);
      aBlock = v91;
      LOBYTE(v220) = v92;
      objc_msgSend(v95, sel_setTrySchedulingBefore_, v100 + sub_245380A74());
      swift_bridgeObjectRetain();
      v101 = v95;
      v102 = (void *)sub_245387AF4();
      swift_bridgeObjectRelease();
      objc_msgSend(v101, sel_setRemoteDevice_, v102);
      swift_bridgeObjectRelease();

      if (v197 == 4)
      {
        objc_msgSend(v101, sel_setTargetDevice_, 1);
        objc_msgSend(v101, sel_setRequiresRemoteDeviceWake_, 1);
      }
      else
      {
        objc_msgSend(v101, sel_setTargetDevice_, 3);
      }
      v140 = v199;
      v141 = v198;
      objc_msgSend(v101, sel_setRequiresExternalPower_, 0);
      v142 = objc_msgSend(v214, sel_sharedScheduler);
      aBlock = 0;
      v143 = objc_msgSend(v142, sel_submitTaskRequest_error_, v101, &aBlock);

      if (v143)
      {
        v144 = *(_QWORD *)(v88 + 88);
        v145 = aBlock;
        swift_retain();
        os_unfair_lock_lock((os_unfair_lock_t)(v144 + 20));
        *(_BYTE *)(v144 + 16) = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(v144 + 20));
        swift_release();
        v146 = v192;
        v147 = v216;
        v148 = v206;
        ((void (*)(char *, char *, uint64_t))v206)(v192, v89, v216);
        v149 = v193;
        ((void (*)(char *, char *, uint64_t))v148)(v193, v89, v147);
        swift_retain_n();
        swift_bridgeObjectRetain();
        v150 = sub_2453877F4();
        v151 = sub_245387D04();
        v152 = v151;
        if (os_log_type_enabled(v150, v151))
        {
          v153 = swift_slowAlloc();
          v214 = v90;
          v154 = v153;
          v212 = (char *)swift_slowAlloc();
          aBlock = v212;
          *(_DWORD *)v154 = 136315906;
          LODWORD(v211) = v152;
          v218 = v88;
          swift_retain();
          v155 = sub_245387B48();
          v209 = v150;
          v218 = sub_2453816D8(v155, v156, (uint64_t *)&aBlock);
          sub_245387E0C();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v154 + 12) = 2082;
          sub_24525C6C4((unint64_t *)&qword_2574525E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
          v157 = sub_2453880F4();
          v218 = sub_2453816D8(v157, v158, (uint64_t *)&aBlock);
          sub_245387E0C();
          swift_bridgeObjectRelease();
          v159 = v210;
          v210(v146, v147);
          *(_WORD *)(v154 + 22) = 2050;
          sub_2453876A4();
          v218 = v160;
          sub_245387E0C();
          v159(v149, v147);
          *(_WORD *)(v154 + 32) = 2080;
          v161 = (unint64_t)v214;
          swift_bridgeObjectRetain();
          v218 = sub_2453816D8((uint64_t)v213, v161, (uint64_t *)&aBlock);
          sub_245387E0C();
          swift_bridgeObjectRelease_n();
          v162 = v209;
          _os_log_impl(&dword_245256000, v209, (os_log_type_t)v211, "%s successful submitTaskRequest: %{public}s in %{public}fs: %s", (uint8_t *)v154, 0x2Au);
          v163 = v212;
          swift_arrayDestroy();
          MEMORY[0x24953317C](v163, -1, -1);
          MEMORY[0x24953317C](v154, -1, -1);

          swift_release();
          v159(v217, v147);
          return v88;
        }
        swift_bridgeObjectRelease_n();

        swift_release();
        v120 = v210;
        v210(v149, v147);
        v120(v146, v147);

        swift_release_n();
        v121 = v89;
        v122 = v147;
LABEL_30:
        v120(v121, v122);
        return v88;
      }
      v164 = aBlock;
      v165 = (void *)sub_245387584();

      swift_willThrow();
      v166 = v216;
      v167 = v206;
      ((void (*)(char *, char *, uint64_t))v206)(v141, v89, v216);
      ((void (*)(char *, char *, uint64_t))v167)(v140, v89, v166);
      swift_retain();
      v168 = v165;
      swift_bridgeObjectRetain();
      swift_retain();
      v169 = v165;
      v170 = sub_2453877F4();
      v171 = sub_245387D1C();
      LODWORD(v212) = v171;
      if (os_log_type_enabled(v170, v171))
      {
        v172 = swift_slowAlloc();
        v173 = swift_slowAlloc();
        v214 = v90;
        v174 = (_QWORD *)v173;
        v207 = v173;
        v211 = (_QWORD *)swift_slowAlloc();
        aBlock = v211;
        *(_DWORD *)v172 = 136316162;
        v208 = v170;
        v218 = v88;
        swift_retain();
        v175 = sub_245387B48();
        v218 = sub_2453816D8(v175, v176, (uint64_t *)&aBlock);
        v89 = v217;
        sub_245387E0C();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v172 + 12) = 2112;
        v177 = v165;
        v178 = _swift_stdlib_bridgeErrorToNSError();
        v218 = v178;
        sub_245387E0C();
        *v174 = v178;

        *(_WORD *)(v172 + 22) = 2082;
        sub_24525C6C4((unint64_t *)&qword_2574525E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
        v179 = sub_2453880F4();
        v218 = sub_2453816D8(v179, v180, (uint64_t *)&aBlock);
        sub_245387E0C();
        swift_bridgeObjectRelease();
        v138 = v210;
        v210(v141, v216);
        *(_WORD *)(v172 + 32) = 2050;
        v181 = v199;
        sub_2453876A4();
        v218 = v182;
        sub_245387E0C();
        v138(v181, v216);
        *(_WORD *)(v172 + 42) = 2080;
        v183 = (unint64_t)v214;
        swift_bridgeObjectRetain();
        v218 = sub_2453816D8((uint64_t)v213, v183, (uint64_t *)&aBlock);
        sub_245387E0C();
        swift_bridgeObjectRelease_n();
        v184 = v208;
        _os_log_impl(&dword_245256000, v208, (os_log_type_t)v212, "%s could not submitTaskRequest: %@ %{public}s in %{public}fs: %s", (uint8_t *)v172, 0x34u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257452970);
        v185 = v207;
        swift_arrayDestroy();
        MEMORY[0x24953317C](v185, -1, -1);
        v186 = v211;
        swift_arrayDestroy();
        MEMORY[0x24953317C](v186, -1, -1);
        v166 = v216;
        MEMORY[0x24953317C](v172, -1, -1);

      }
      else
      {
        swift_release_n();

        v138 = v210;
        v210(v141, v166);
        v138(v140, v166);

        swift_bridgeObjectRelease_n();
      }
      DuetHandshakeTask.cancel()();
      swift_release();

      v187 = v89;
      v188 = v166;
    }
    else
    {
      swift_bridgeObjectRelease();
      v123 = v194;
      v124 = v216;
      v125 = v206;
      ((void (*)(char *, char *, uint64_t))v206)(v194, v89, v216);
      v126 = v195;
      ((void (*)(char *, char *, uint64_t))v125)(v195, v89, v124);
      swift_retain_n();
      swift_bridgeObjectRetain();
      v127 = sub_2453877F4();
      v128 = sub_245387D1C();
      v129 = v128;
      if (os_log_type_enabled(v127, v128))
      {
        v130 = swift_slowAlloc();
        v214 = (_QWORD *)swift_slowAlloc();
        aBlock = v214;
        *(_DWORD *)v130 = 136315906;
        LODWORD(v212) = v129;
        v218 = v74;
        swift_retain();
        v131 = sub_245387B48();
        v218 = sub_2453816D8(v131, v132, (uint64_t *)&aBlock);
        sub_245387E0C();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v130 + 12) = 2082;
        sub_24525C6C4((unint64_t *)&qword_2574525E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
        v133 = sub_2453880F4();
        v218 = sub_2453816D8(v133, v134, (uint64_t *)&aBlock);
        sub_245387E0C();
        swift_bridgeObjectRelease();
        v135 = v210;
        v210(v123, v124);
        *(_WORD *)(v130 + 22) = 2050;
        v136 = v195;
        sub_2453876A4();
        v218 = v137;
        sub_245387E0C();
        v135(v136, v124);
        *(_WORD *)(v130 + 32) = 2080;
        swift_bridgeObjectRetain();
        v218 = sub_2453816D8((uint64_t)v213, (unint64_t)v90, (uint64_t *)&aBlock);
        v89 = v217;
        sub_245387E0C();
        swift_bridgeObjectRelease_n();
        v138 = v135;
        _os_log_impl(&dword_245256000, v127, (os_log_type_t)v212, "%s could not create bgTaskRequest: %{public}s in %{public}fs: %s", (uint8_t *)v130, 0x2Au);
        v139 = v214;
        swift_arrayDestroy();
        MEMORY[0x24953317C](v139, -1, -1);
        MEMORY[0x24953317C](v130, -1, -1);

      }
      else
      {
        swift_release_n();
        v138 = v210;
        v210(v123, v124);
        v138(v126, v124);

        swift_bridgeObjectRelease_n();
      }
      DuetHandshakeTask.cancel()();
      swift_release();
      v187 = v89;
      v188 = v124;
    }
    v138(v187, v188);
    return v88;
  }
  swift_bridgeObjectRelease();
  v103 = v201;
  v105 = v216;
  v104 = v217;
  v106 = v206;
  ((void (*)(char *, char *, uint64_t))v206)(v201, v217, v216);
  v107 = v200;
  ((void (*)(char *, char *, uint64_t))v106)(v200, v104, v105);
  swift_retain_n();
  swift_bridgeObjectRetain();
  v108 = sub_2453877F4();
  v109 = sub_245387D1C();
  v88 = v74;
  if (!os_log_type_enabled(v108, v109))
  {
    swift_bridgeObjectRelease_n();

    swift_release();
    v120 = v210;
    v210(v107, v105);
    v120(v103, v105);
    swift_release_n();
    v121 = v104;
    v122 = v105;
    goto LABEL_30;
  }
  v110 = swift_slowAlloc();
  v214 = (_QWORD *)swift_slowAlloc();
  aBlock = v214;
  *(_DWORD *)v110 = 136315906;
  v218 = v74;
  swift_retain();
  v111 = sub_245387B48();
  v218 = sub_2453816D8(v111, v112, (uint64_t *)&aBlock);
  v190 = v74;
  sub_245387E0C();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v110 + 12) = 2082;
  sub_24525C6C4((unint64_t *)&qword_2574525E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
  v113 = v201;
  v114 = sub_2453880F4();
  v218 = sub_2453816D8(v114, v115, (uint64_t *)&aBlock);
  sub_245387E0C();
  swift_bridgeObjectRelease();
  v116 = v113;
  v117 = v210;
  v210(v116, v105);
  *(_WORD *)(v110 + 22) = 2050;
  sub_2453876A4();
  v218 = v118;
  sub_245387E0C();
  v117(v107, v105);
  *(_WORD *)(v110 + 32) = 2080;
  swift_bridgeObjectRetain();
  v218 = sub_2453816D8((uint64_t)v213, v79, (uint64_t *)&aBlock);
  sub_245387E0C();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_245256000, v108, v109, "%s could not registerForTask: %{public}s in %{public}fs: %s", (uint8_t *)v110, 0x2Au);
  v119 = v214;
  swift_arrayDestroy();
  MEMORY[0x24953317C](v119, -1, -1);
  MEMORY[0x24953317C](v110, -1, -1);

  swift_release();
  v117(v217, v105);
  return v190;
}

uint64_t sub_24538039C(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (*(unsigned __int8 *)(v2 + 8) <= 1u && *(_QWORD *)v2 > 1uLL)
    return sub_24538039C(result, a2);
  return result;
}

uint64_t sub_24538040C(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257450038);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25744FD90 != -1)
    swift_once();
  v15 = sub_245387818();
  __swift_project_value_buffer(v15, (uint64_t)qword_257462FB0);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v16 = sub_2453877F4();
  v17 = sub_245387D04();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v28 = a1;
    v30 = a2;
    v31 = v27;
    *(_DWORD *)v18 = 136315394;
    type metadata accessor for DuetHandshakeTask();
    v26 = a3;
    swift_retain();
    v29 = a6;
    v19 = sub_245387B48();
    v30 = sub_2453816D8(v19, v20, &v31);
    sub_245387E0C();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    v30 = sub_2453816D8(v26, a4, &v31);
    a6 = v29;
    sub_245387E0C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_245256000, v16, v17, "%s calling handler for %s", (uint8_t *)v18, 0x16u);
    v21 = v27;
    swift_arrayDestroy();
    a1 = v28;
    MEMORY[0x24953317C](v21, -1, -1);
    MEMORY[0x24953317C](v18, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  v22 = sub_245387C74();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v14, 1, 1, v22);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = a1;
  v23[5] = a2;
  v23[6] = a5;
  v23[7] = a6;
  swift_retain();
  v24 = a1;
  swift_retain();
  sub_2452635C4((uint64_t)v14, (uint64_t)&unk_2574536E0, (uint64_t)v23);
  return swift_release();
}

uint64_t sub_245380704()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245380738(void *a1)
{
  uint64_t v1;

  return sub_24538040C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_245380748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return swift_task_switch();
}

uint64_t sub_245380764()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t))(v0 + 32);
  v2 = *(_QWORD *)(v0 + 24);
  objc_msgSend(*(id *)(v0 + 16), sel_setTaskCompleted);
  v3 = *(_QWORD *)(v2 + 88);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 20));
  *(_BYTE *)(v3 + 16) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 20));
  v4 = swift_release();
  v1(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

Swift::Void __swiftcall DuetHandshakeTask.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = *(void **)(v0 + 80);
  if (v2)
  {
    v3 = objc_msgSend(v2, sel_identifier);
    v4 = sub_245387B18();
    v6 = v5;

    v7 = *(_QWORD *)(v1 + 88);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 20));
    sub_245380CDC((_BYTE *)(v7 + 16), v4, v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 20));
    swift_release();
    v8 = *(_QWORD *)(v1 + 72);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 20));
    sub_245381284((_BYTE *)(v8 + 16), v4, v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 20));
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_25744FD90 != -1)
      swift_once();
    v9 = sub_245387818();
    __swift_project_value_buffer(v9, (uint64_t)qword_257462FB0);
    swift_retain_n();
    v10 = sub_2453877F4();
    v11 = sub_245387D1C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_retain();
      v14 = sub_245387B48();
      sub_2453816D8(v14, v15, &v16);
      sub_245387E0C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245256000, v10, v11, "%s no bgTaskRequest identifier, cannot cancel", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24953317C](v13, -1, -1);
      MEMORY[0x24953317C](v12, -1, -1);

    }
    else
    {

      swift_release_n();
    }
  }
}

double sub_245380A74()
{
  uint64_t v0;
  double result;

  if (*(unsigned __int8 *)(v0 + 8) > 1u)
    return 1800.0;
  result = 0.0;
  if (*(uint64_t *)v0 >= 2)
    sub_245380A74(0.0);
  return result;
}

uint64_t DuetHandshakeTask.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v1 = v0;
  if (qword_25744FD90 != -1)
    swift_once();
  v2 = sub_245387818();
  __swift_project_value_buffer(v2, (uint64_t)qword_257462FB0);
  swift_retain_n();
  v3 = sub_2453877F4();
  v4 = sub_245387D04();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10 = v6;
    *(_DWORD *)v5 = 136315138;
    swift_retain();
    v7 = sub_245387B48();
    sub_2453816D8(v7, v8, &v10);
    sub_245387E0C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245256000, v3, v4, "%s deinit, canceling", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24953317C](v6, -1, -1);
    MEMORY[0x24953317C](v5, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  DuetHandshakeTask.cancel()();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return v1;
}

uint64_t DuetHandshakeTask.__deallocating_deinit()
{
  DuetHandshakeTask.deinit();
  return swift_deallocClassInstance();
}

void sub_245380CDC(_BYTE *a1, uint64_t a2, unint64_t a3)
{
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  id v32[2];

  v32[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (*a1 == 1)
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_sharedScheduler);
    v7 = (void *)sub_245387AF4();
    v32[0] = 0;
    v8 = objc_msgSend(v6, sel_cancelTaskRequestWithIdentifier_error_, v7, v32);

    if (v8)
    {
      v9 = qword_25744FD90;
      v10 = v32[0];
      if (v9 != -1)
        swift_once();
      v11 = sub_245387818();
      __swift_project_value_buffer(v11, (uint64_t)qword_257462FB0);
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      v12 = sub_2453877F4();
      v13 = sub_245387D04();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = swift_slowAlloc();
        v28 = (void *)swift_slowAlloc();
        v32[0] = v28;
        *(_DWORD *)v14 = 136315394;
        swift_retain();
        v15 = sub_245387B48();
        sub_2453816D8(v15, v16, (uint64_t *)v32);
        sub_245387E0C();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_2453816D8(a2, a3, (uint64_t *)v32);
        sub_245387E0C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_245256000, v12, v13, "%s successful cancelTaskRequest %s", (uint8_t *)v14, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24953317C](v28, -1, -1);
        MEMORY[0x24953317C](v14, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release_n();
      }
    }
    else
    {
      v17 = v32[0];
      v18 = (void *)sub_245387584();

      swift_willThrow();
      if (qword_25744FD90 != -1)
        swift_once();
      v19 = sub_245387818();
      __swift_project_value_buffer(v19, (uint64_t)qword_257462FB0);
      swift_retain();
      swift_bridgeObjectRetain();
      v20 = v18;
      swift_retain();
      swift_bridgeObjectRetain();
      v21 = v18;
      v22 = sub_2453877F4();
      v23 = sub_245387D1C();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = swift_slowAlloc();
        v29 = (_QWORD *)swift_slowAlloc();
        v30 = (void *)swift_slowAlloc();
        v32[0] = v30;
        *(_DWORD *)v24 = 136315650;
        swift_retain();
        v25 = sub_245387B48();
        sub_2453816D8(v25, v26, (uint64_t *)v32);
        sub_245387E0C();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_2453816D8(a2, a3, (uint64_t *)v32);
        sub_245387E0C();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v24 + 22) = 2112;
        v27 = v18;
        v31 = _swift_stdlib_bridgeErrorToNSError();
        sub_245387E0C();
        *v29 = v31;

        _os_log_impl(&dword_245256000, v22, v23, "%s could not cancelTaskRequest %s: %@", (uint8_t *)v24, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257452970);
        swift_arrayDestroy();
        MEMORY[0x24953317C](v29, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x24953317C](v30, -1, -1);
        MEMORY[0x24953317C](v24, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release_n();

      }
    }
    *a1 = 0;
  }
}

void sub_245381284(_BYTE *a1, uint64_t a2, unint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;

  if (*a1 == 1)
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_sharedScheduler);
    v7 = (void *)sub_245387AF4();
    v18 = objc_msgSend(v6, sel_deregisterTaskWithIdentifier_, v7);

    if (qword_25744FD90 != -1)
      swift_once();
    v8 = sub_245387818();
    __swift_project_value_buffer(v8, (uint64_t)qword_257462FB0);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    v9 = sub_2453877F4();
    v10 = sub_245387D04();
    if (os_log_type_enabled(v9, v10))
    {
      v16 = a2;
      v11 = swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19 = v17;
      *(_DWORD *)v11 = 136315650;
      swift_retain();
      v12 = sub_245387B48();
      sub_2453816D8(v12, v13, &v19);
      sub_245387E0C();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      if (v18)
        v14 = 0x6673736563637573;
      else
        v14 = 0x6F6E20646C756F63;
      if (v18)
        v15 = 0xEA00000000006C75;
      else
        v15 = 0xE900000000000074;
      sub_2453816D8(v14, v15, &v19);
      sub_245387E0C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 22) = 2080;
      swift_bridgeObjectRetain();
      sub_2453816D8(v16, a3, &v19);
      sub_245387E0C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245256000, v9, v10, "%s %s deregisterTask  %s", (uint8_t *)v11, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24953317C](v17, -1, -1);
      MEMORY[0x24953317C](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    *a1 = 0;
  }
}

uint64_t sub_245381598@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char v13;

  v9 = *((_BYTE *)a2 + 8);
  v12 = *a2;
  v13 = v9;
  v10 = swift_allocObject();
  result = DuetHandshakeTask.init(handshakeDescriptor:schedule:handler:)(a1, (uint64_t)&v12, a3, a4);
  *a5 = v10;
  return result;
}

void sub_245381614()
{
  DuetHandshakeTask.cancel()();
}

uint64_t sub_245381634(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_245381668(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2453816D8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_245387E0C();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2453816D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2453817A8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245263FBC((uint64_t)v12, *a3);
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
      sub_245263FBC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2453817A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_245387E18();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245381960(a5, a6);
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
  v8 = sub_245387F14();
  if (!v8)
  {
    sub_245387F74();
    __break(1u);
LABEL_17:
    result = sub_245387FBC();
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

uint64_t sub_245381960(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2453819F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245381BCC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245381BCC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2453819F4(uint64_t a1, unint64_t a2)
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
      v3 = sub_245381B68(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245387EB4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245387F74();
      __break(1u);
LABEL_10:
      v2 = sub_245387BA8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245387FBC();
    __break(1u);
LABEL_14:
    result = sub_245387F74();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245381B68(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574502A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245381BCC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574502A0);
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
  result = sub_245387FBC();
  __break(1u);
  return result;
}

_BYTE **sub_245381D18(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for DuetHandshakeTask()
{
  return objc_opt_self();
}

uint64_t method lookup function for DuetHandshakeTask()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DuetHandshakeTask.__allocating_init(handshakeDescriptor:schedule:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_245381D5C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245381D98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  v4 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_2452639C4;
  *(_OWORD *)(v2 + 16) = v3;
  *(_OWORD *)(v2 + 32) = v4;
  return swift_task_switch();
}

uint64_t sub_245381DF8()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_245381E28(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_245381E64())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_245381EA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 24))
  {
    v1 = *(_QWORD *)(v0 + 24);
  }
  else
  {
    v2 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744FED0);
    sub_245381F2C();
    v1 = sub_24538789C();
    *(_QWORD *)(v2 + 24) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

unint64_t sub_245381F2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25744FEC8;
  if (!qword_25744FEC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25744FED0);
    result = MEMORY[0x2495330B0](MEMORY[0x24BDB9CB0], v1);
    atomic_store(result, (unint64_t *)&qword_25744FEC8);
  }
  return result;
}

uint64_t (*sub_245381F78(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_245381EA0();
  return sub_2452ED0A0;
}

uint64_t sub_245381FAC@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 40);
  v5 = *(_QWORD *)(v3 + 48);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_24525C56C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_245317690(v4);
}

uint64_t sub_245382034(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_24525C56C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  swift_beginAccess();
  v8 = *(_QWORD *)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;
  *(_QWORD *)(v7 + 48) = v5;
  sub_245317690(v3);
  return sub_2453175F8(v8);
}

uint64_t sub_2453820E0()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 40);
  sub_245317690(v1);
  return v1;
}

uint64_t sub_24538212C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return sub_2453175F8(v5);
}

uint64_t (*sub_24538217C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CallbackZoneAdvertiser.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744FED0);
  swift_allocObject();
  v1 = sub_245387884();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 32) = v1;
  return v0;
}

uint64_t CallbackZoneAdvertiser.init()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744FED0);
  swift_allocObject();
  v1 = sub_245387884();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 32) = v1;
  return v0;
}

uint64_t CallbackZoneAdvertiser.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  sub_2453175F8(*(_QWORD *)(v0 + 40));
  return v0;
}

uint64_t CallbackZoneAdvertiser.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  sub_2453175F8(*(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance();
}

uint64_t sub_2453822C8()
{
  return sub_245381EA0();
}

uint64_t sub_2453822E8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 16);
}

uint64_t sub_245382324(char a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 16) = a1;
  return result;
}

uint64_t (*sub_245382364())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2453823A4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;
  void (*v3)(uint64_t);
  uint64_t v4;

  v1 = *v0;
  result = swift_beginAccess();
  if (*(_BYTE *)(v1 + 16) == 1)
  {
    result = swift_beginAccess();
    v3 = *(void (**)(uint64_t))(v1 + 40);
    if (v3)
    {
      v4 = swift_retain();
      v3(v4);
      return sub_2453175F8((uint64_t)v3);
    }
  }
  return result;
}

uint64_t CallbackZoneAdvertiser.advertise(_:)()
{
  uint64_t v0;
  uint64_t result;
  void (*v2)(uint64_t);
  uint64_t v3;

  result = swift_beginAccess();
  if (*(_BYTE *)(v0 + 16) == 1)
  {
    result = swift_beginAccess();
    v2 = *(void (**)(uint64_t))(v0 + 40);
    if (v2)
    {
      v3 = swift_retain();
      v2(v3);
      return sub_2453175F8((uint64_t)v2);
    }
  }
  return result;
}

uint64_t sub_24538249C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_2453824E0(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_245382520@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_245381EA0();
  *a1 = result;
  return result;
}

uint64_t sub_245382548(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 24) = *a1;
  swift_retain();
  return swift_release();
}

uint64_t type metadata accessor for CallbackZoneAdvertiser()
{
  return objc_opt_self();
}

uint64_t method lookup function for CallbackZoneAdvertiser()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.isEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.isEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.isEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.zoneVersionPublisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.zoneVersionPublisher.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.zoneVersionPublisher.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.callback.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.callback.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.callback.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of CallbackZoneAdvertiser.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t sub_245382620()
{
  swift_release();
  return swift_deallocObject();
}

void URL.extendedAttributeNames()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  ssize_t v7;
  char *v8;
  uint64_t v9;
  ssize_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  uint64_t (*v21)(uint64_t);
  _QWORD *v22;
  uint64_t v23;
  int v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  int v27;
  int v28;

  v1 = v0;
  v2 = sub_245387B3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453875CC();
  v6 = sub_245387B54();
  swift_bridgeObjectRelease();
  v7 = listxattr((const char *)(v6 + 32), 0, 0, 0);
  swift_release();
  if (v7 == -1)
  {
    type metadata accessor for URL.ExtendedAttributeError();
    sub_24525C6C4(&qword_2574536E8, (uint64_t (*)(uint64_t))type metadata accessor for URL.ExtendedAttributeError, (uint64_t)&protocol conformance descriptor for URL.ExtendedAttributeError);
    v1 = (void *)swift_allocError();
    *v18 = 0;
    v18[1] = 0xE000000000000000;
    v18[2] = -1;
    MEMORY[0x249531BA4]();
    v19 = sub_245387830();
    if ((v19 & 0x100000000) == 0)
    {
      v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0);
      sub_245387440();
      v21 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0];
      v27 = v20;
      sub_245383868(MEMORY[0x24BEE4AF8]);
      sub_24525C6C4(&qword_2574536F8, v21, MEMORY[0x24BDCAFD8]);
      sub_245387578();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      return;
    }
    goto LABEL_16;
  }
  v8 = (char *)swift_slowAlloc();
  sub_2453875CC();
  v9 = sub_245387B54();
  swift_bridgeObjectRelease();
  v10 = listxattr((const char *)(v9 + 32), v8, v7, 0);
  swift_release();
  if (v10 == -1)
  {
    type metadata accessor for URL.ExtendedAttributeError();
    sub_24525C6C4(&qword_2574536E8, (uint64_t (*)(uint64_t))type metadata accessor for URL.ExtendedAttributeError, (uint64_t)&protocol conformance descriptor for URL.ExtendedAttributeError);
    v1 = (void *)swift_allocError();
    *v22 = 0;
    v22[1] = 0xE000000000000000;
    v22[2] = -1;
    MEMORY[0x249531BA4]();
    v23 = sub_245387830();
    if ((v23 & 0x100000000) == 0)
    {
      v24 = v23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0);
      sub_245387440();
      v25 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0];
      v28 = v24;
      sub_245383868(MEMORY[0x24BEE4AF8]);
      sub_24525C6C4(&qword_2574536F8, v25, MEMORY[0x24BDCAFD8]);
      sub_245387578();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      MEMORY[0x24953317C](v8, -1, -1);
      return;
    }
    goto LABEL_17;
  }
  sub_245387B24();
  v11 = sub_245387B30();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), sel_initWithBytes_length_encoding_, v8, v7, v11);
  if (!v12)
  {
LABEL_12:
    MEMORY[0x24953317C](v8, -1, -1);
    return;
  }
  v13 = v12;
  v14 = (void *)sub_245387AF4();
  v15 = objc_msgSend(v13, sel_componentsSeparatedByString_, v14);

  v16 = (_QWORD *)sub_245387C20();
  if (v16[2])
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      v17 = v16[2];
      if (v17)
      {
LABEL_7:
        v16[2] = v17 - 1;
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
      goto LABEL_15;
    }
  }
  else
  {
    __break(1u);
  }
  v16 = sub_245383EB8(v16);
  v17 = v16[2];
  if (v17)
    goto LABEL_7;
LABEL_15:
  __break(1u);
LABEL_16:

  __break(1u);
LABEL_17:

  __break(1u);
}

uint64_t URL.extendedAttributeData(named:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_2453875A8();
  if (!v0)
    return v2;
  return result;
}

uint64_t URL.setExtendedAttributeData(named:value:)()
{
  return sub_2453875A8();
}

unint64_t URL.ExtendedAttributeError.errorDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD v13[2];
  unint64_t v14;
  unint64_t v15;

  v1 = v0;
  v2 = sub_245387440();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL.ExtendedAttributeError();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245383F08(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = *((_QWORD *)v8 + 2);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, &v8[*(int *)(v10 + 64)], v2);
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_245387EA8();
    sub_245387B90();
    sub_245387B90();
    swift_bridgeObjectRelease();
    sub_245387B90();
    v13[1] = v9;
    sub_2453880F4();
    sub_245387B90();
    swift_bridgeObjectRelease();
    sub_245387B90();
    sub_245387F5C();
    v11 = v14;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_245387EA8();
    swift_bridgeObjectRelease();
    v14 = 0xD000000000000019;
    v15 = 0x8000000245395720;
    sub_245387B90();
    swift_bridgeObjectRelease();
    sub_245387B90();
    return v14;
  }
  return v11;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> URL.removeExtendedAttribute(named:)(Swift::String named)
{
  sub_2453875A8();
}

uint64_t sub_245382D94(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t result;
  int v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t (*v12)(uint64_t);

  v6 = sub_245387B54();
  v7 = removexattr(a1, (const char *)(v6 + 32), 0);
  result = swift_release();
  if (v7 < 0)
  {
    MEMORY[0x249531BA4](result);
    result = sub_245387830();
    if ((result & 0x100000000) != 0)
    {
      __break(1u);
    }
    else
    {
      sub_245387434();
      v9 = sub_24538783C();
      result = sub_24538783C();
      if (v9 != (_DWORD)result)
      {
        type metadata accessor for URL.ExtendedAttributeError();
        sub_24525C6C4(&qword_2574536E8, (uint64_t (*)(uint64_t))type metadata accessor for URL.ExtendedAttributeError, (uint64_t)&protocol conformance descriptor for URL.ExtendedAttributeError);
        swift_allocError();
        v11 = v10;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0);
        *v11 = a2;
        v11[1] = a3;
        v11[2] = v7;
        sub_245387440();
        v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0];
        swift_bridgeObjectRetain();
        sub_245383868(MEMORY[0x24BEE4AF8]);
        sub_24525C6C4(&qword_2574536F8, v12, MEMORY[0x24BDCAFD8]);
        sub_245387578();
        swift_storeEnumTagMultiPayload();
        return swift_willThrow();
      }
    }
  }
  return result;
}

void sub_245382F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }
}

uint64_t sub_245382F8C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t value, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t result;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t (*v39)(uint64_t);
  int v40;
  char v41;
  char v42;
  char v43;
  char v44;
  __int16 v45;
  char v46;
  char v47;
  char v48;
  char v49;

  LOWORD(v40) = v29;
  BYTE2(v40) = BYTE2(v29);
  HIBYTE(v40) = BYTE3(v29);
  v41 = BYTE4(v29);
  v42 = BYTE5(v29);
  v43 = BYTE6(v29);
  v44 = HIBYTE(v29);
  v45 = v30;
  v46 = BYTE2(v30);
  v47 = BYTE3(v30);
  v48 = BYTE4(v30);
  v49 = BYTE5(v30);
  v31 = sub_245387B54();
  v32 = setxattr(v28, (const char *)(v31 + 32), &v40, BYTE6(v30), 0, 0);
  result = swift_release();
  if (v32 < 0)
  {
    type metadata accessor for URL.ExtendedAttributeError();
    sub_24525C6C4(&qword_2574536E8, (uint64_t (*)(uint64_t))type metadata accessor for URL.ExtendedAttributeError, (uint64_t)&protocol conformance descriptor for URL.ExtendedAttributeError);
    v34 = (void *)swift_allocError();
    *v35 = v27;
    v35[1] = v26;
    v35[2] = v32;
    v36 = swift_bridgeObjectRetain();
    MEMORY[0x249531BA4](v36);
    v37 = sub_245387830();
    if ((v37 & 0x100000000) != 0)
    {

      __break(1u);
      JUMPOUT(0x24538331CLL);
    }
    v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0);
    sub_245387440();
    v39 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0];
    v40 = v38;
    sub_245383868(MEMORY[0x24BEE4AF8]);
    sub_24525C6C4(&qword_2574536F8, v39, MEMORY[0x24BDCAFD8]);
    sub_245387578();
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  return result;
}

uint64_t URL.setExtendedAttribute<A>(named:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v13[2];

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7, v8);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v10 = v13[0];
    v11 = v13[1];
  }
  else
  {
    sub_245387560();
    swift_allocObject();
    sub_245387554();
    sub_24538753C();
    v10 = sub_245387548();
    v11 = v12;
    result = swift_release();
    if (v2)
      return result;
  }
  MEMORY[0x24BDAC7A8](result);
  v13[-4] = v10;
  v13[-3] = v11;
  v13[-2] = a1;
  v13[-1] = a2;
  sub_2453875A8();
  return sub_24525CB80(v10, v11);
}

uint64_t sub_24538349C@<X0>(const char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  ssize_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;

  v9 = sub_245387B54();
  v10 = getxattr(a1, (const char *)(v9 + 32), 0, 0, 0, 0);
  swift_release();
  if (v10 < 1)
  {
    type metadata accessor for URL.ExtendedAttributeError();
    sub_24525C6C4(&qword_2574536E8, (uint64_t (*)(uint64_t))type metadata accessor for URL.ExtendedAttributeError, (uint64_t)&protocol conformance descriptor for URL.ExtendedAttributeError);
    swift_allocError();
    *v14 = a2;
    v14[1] = a3;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  else
  {
    v15 = sub_245318E50(v10);
    v16 = v11;
    swift_bridgeObjectRetain();
    sub_245383B38((uint64_t)&v15);
    result = v15;
    v13 = v16;
    if (v4)
    {
      return sub_24525CB80(v15, v16);
    }
    else
    {
      *a4 = v15;
      a4[1] = v13;
    }
  }
  return result;
}

void sub_2453835DC(void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, size_t a6)
{
  uint64_t v11;
  ssize_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);

  v11 = sub_245387B54();
  v12 = getxattr(a3, (const char *)(v11 + 32), a1, a6, 0, 0);
  swift_release();
  if (v12 < 1)
  {
    type metadata accessor for URL.ExtendedAttributeError();
    sub_24525C6C4(&qword_2574536E8, (uint64_t (*)(uint64_t))type metadata accessor for URL.ExtendedAttributeError, (uint64_t)&protocol conformance descriptor for URL.ExtendedAttributeError);
    v13 = (void *)swift_allocError();
    *v14 = a4;
    v14[1] = a5;
    v14[2] = v12;
    v15 = swift_bridgeObjectRetain();
    MEMORY[0x249531BA4](v15);
    if ((sub_245387830() & 0x100000000) != 0)
    {

      __break(1u);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0);
      sub_245387440();
      v16 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0];
      sub_245383868(MEMORY[0x24BEE4AF8]);
      sub_24525C6C4(&qword_2574536F8, v16, MEMORY[0x24BDCAFD8]);
      sub_245387578();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
    }
  }
}

uint64_t URL.extendedAttribute<A>(named:of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;

  v5 = MEMORY[0x24BDCDDE8];
  result = sub_2453875A8();
  if (!v3)
  {
    if (a3 == v5)
    {
      return swift_dynamicCast();
    }
    else
    {
      sub_245387530();
      swift_allocObject();
      sub_245387524();
      sub_245387518();
      swift_release();
      return sub_24525CB80(v7, v8);
    }
  }
  return result;
}

unint64_t sub_245383868(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257450150);
  v2 = sub_245387FB0();
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
    sub_24538484C(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_245383990(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2452CC368(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_245383990(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24538843C();
  sub_245387B6C();
  v4 = sub_245388478();
  return sub_2453839F4(a1, a2, v4);
}

unint64_t sub_2453839F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_245388274() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_245388274() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_245388274() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

void sub_245383B38(uint64_t a1)
{
  __asm { BR              X12 }
}

uint64_t sub_245383BA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  size_t v3;
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unsigned int v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;

  v13 = v1;
  LOWORD(v14) = a1;
  BYTE2(v14) = BYTE2(a1);
  HIBYTE(v14) = BYTE3(a1);
  v15 = BYTE4(a1);
  v16 = BYTE5(a1);
  v17 = BYTE6(a1);
  sub_2453835DC(&v13, (uint64_t)&v13 + BYTE6(a1), v6, v5, v2, v3);
  v7 = v13;
  v8 = v14;
  v9 = v15;
  v10 = v16;
  v11 = v17;
  result = swift_bridgeObjectRelease();
  *v4 = v7;
  v4[1] = v8 | (v9 << 32) | (v10 << 40) | (v11 << 48);
  return result;
}

uint64_t sub_245383DD4(int *a1, const char *a2, uint64_t a3, uint64_t a4, size_t a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  result = sub_2453875FC();
  v12 = *a1;
  v11 = a1[1];
  if ((int)v11 < (int)v12)
  {
    __break(1u);
    goto LABEL_9;
  }
  v18 = a4;
  v19 = a2;
  result = sub_2453874AC();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v13 = result;
  result = sub_2453874D0();
  v14 = v12 - result;
  if (__OFSUB__(v12, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v15 = v11 - v12;
  v16 = sub_2453874C4();
  if (v16 >= v15)
    v17 = v15;
  else
    v17 = v16;
  sub_2453835DC((void *)(v13 + v14), v13 + v14 + v17, v19, a3, v18, a5);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_245383EB8(_QWORD *a1)
{
  return sub_245323DF8(0, a1[2], 0, a1);
}

uint64_t type metadata accessor for URL.ExtendedAttributeError()
{
  uint64_t result;

  result = qword_257453700;
  if (!qword_257453700)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245383F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL.ExtendedAttributeError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t _s10Foundation3URLV16ReplicatorEngineE22ExtendedAttributeErrorO2eeoiySbAF_AFtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  char v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v39;
  char v40;
  void (*v41)(char *, uint64_t);
  void (*v42)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v49 = a2;
  v3 = sub_245387440();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v44 - v8;
  v10 = type metadata accessor for URL.ExtendedAttributeError();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v44 - v14);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257453710);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = &v19[*(int *)(v17 + 48)];
  sub_245383F08(a1, (uint64_t)v19);
  sub_245383F08(v49, (uint64_t)v20);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_245383F08((uint64_t)v19, (uint64_t)v15);
    v36 = *v15;
    v37 = v15[1];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      if (v36 == *(_QWORD *)v20 && v37 == *((_QWORD *)v20 + 1))
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v39 = sub_245388274();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v39 & 1) == 0)
        {
LABEL_22:
          sub_2453845C8((uint64_t)v19);
          goto LABEL_23;
        }
      }
      sub_2453845C8((uint64_t)v19);
      v40 = 1;
      return v40 & 1;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    sub_24538480C((uint64_t)v19);
LABEL_23:
    v40 = 0;
    return v40 & 1;
  }
  v48 = v3;
  v49 = v4;
  v47 = v9;
  sub_245383F08((uint64_t)v19, (uint64_t)v13);
  v21 = *(_QWORD *)v13;
  v22 = *((_QWORD *)v13 + 1);
  v23 = *((_QWORD *)v13 + 2);
  v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0) + 64);
  v25 = &v13[v24];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v49 + 8))(&v13[v24], v48);
    goto LABEL_17;
  }
  v27 = *(_QWORD *)v20;
  v26 = *((_QWORD *)v20 + 1);
  v45 = *((_QWORD *)v20 + 2);
  v46 = v23;
  v28 = &v20[v24];
  v29 = v48;
  v30 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
  v30(v47, v25, v48);
  v31 = v7;
  v30(v7, v28, v29);
  if (v21 == v27 && v22 == v26)
  {
    swift_bridgeObjectRelease_n();
    v34 = v47;
    v35 = v49;
  }
  else
  {
    v33 = sub_245388274();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v34 = v47;
    v35 = v49;
    if ((v33 & 1) == 0)
      goto LABEL_21;
  }
  if (v46 != v45)
  {
LABEL_21:
    v42 = *(void (**)(char *, uint64_t))(v35 + 8);
    v42(v31, v29);
    v42(v34, v29);
    goto LABEL_22;
  }
  sub_24525C6C4(&qword_2574536F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
  v40 = sub_24538756C();
  v41 = *(void (**)(char *, uint64_t))(v35 + 8);
  v41(v31, v29);
  v41(v34, v29);
  sub_2453845C8((uint64_t)v19);
  return v40 & 1;
}

uint64_t sub_2453842BC(const char *a1)
{
  uint64_t v1;

  return sub_245382D94(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2453842D4()
{
  return sub_24525C6C4(&qword_2574536E8, (uint64_t (*)(uint64_t))type metadata accessor for URL.ExtendedAttributeError, (uint64_t)&protocol conformance descriptor for URL.ExtendedAttributeError);
}

uint64_t *_s22ExtendedAttributeErrorOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    if (EnumCaseMultiPayload == 1)
    {
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0) + 64);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_245387440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t _s22ExtendedAttributeErrorOwxx(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  result = swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload == 1)
  {
    v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0) + 64);
    v5 = sub_245387440();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return result;
}

_QWORD *_s22ExtendedAttributeErrorOwcp(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  if (EnumCaseMultiPayload == 1)
  {
    a1[2] = a2[2];
    swift_bridgeObjectRetain();
    v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0) + 64);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_245387440();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *_s22ExtendedAttributeErrorOwca(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_2453845C8((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    a1[1] = a2[1];
    if (EnumCaseMultiPayload == 1)
    {
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0) + 64);
      v6 = (char *)a1 + v5;
      v7 = (char *)a2 + v5;
      v8 = sub_245387440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2453845C8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for URL.ExtendedAttributeError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *_s22ExtendedAttributeErrorOwtk(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0) + 64);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_245387440();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *_s22ExtendedAttributeErrorOwta(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_2453845C8((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = a2[2];
      v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574536F0) + 64);
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = sub_245387440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24538477C()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  v2[4] = &unk_245392518;
  result = sub_245387440();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24538480C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257453710);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24538484C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744FFA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_245384894(uint64_t a1)
{
  sub_245319460(a1);
}

uint64_t sub_2453848A8@<X0>(const char *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2453176A0(a1, a2);
}

BOOL static ReplicatorError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ReplicatorError.hash(into:)()
{
  return sub_245388448();
}

uint64_t ReplicatorError.hashValue.getter()
{
  sub_24538843C();
  sub_245388448();
  return sub_245388478();
}

unint64_t sub_245384940()
{
  unint64_t result;

  result = qword_257453718;
  if (!qword_257453718)
  {
    result = MEMORY[0x2495330B0](&protocol conformance descriptor for ReplicatorError, &type metadata for ReplicatorError);
    atomic_store(result, (unint64_t *)&qword_257453718);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ReplicatorError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2453849D0 + 4 * byte_245392545[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_245384A04 + 4 * byte_245392540[v4]))();
}

uint64_t sub_245384A04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245384A0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245384A14);
  return result;
}

uint64_t sub_245384A20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245384A28);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_245384A2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245384A34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorError()
{
  return &type metadata for ReplicatorError;
}

uint64_t sub_245384A50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 16))
  {
    v1 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    v2 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744FEC0);
    sub_24526381C(&qword_25744FEB8, &qword_25744FEC0, MEMORY[0x24BDB9CB0]);
    v1 = sub_24538789C();
    *(_QWORD *)(v2 + 16) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_245384AF4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*sub_245384B04(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_245384A50();
  return sub_245384B38;
}

uint64_t sub_245384B38(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 16) = *a1;
  return swift_release();
}

uint64_t HandshakeScheduler.__allocating_init(firstLockStateProvider:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  HandshakeScheduler.init(firstLockStateProvider:)(a1);
  return v2;
}

_QWORD *HandshakeScheduler.init(firstLockStateProvider:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  v2 = v1;
  v29 = (_QWORD *)a1;
  v33 = *v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257450060);
  MEMORY[0x24BDAC7A8](v3);
  v30 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FE18);
  v34 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v31 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_245387D70();
  v6 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245387D4C();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v9);
  v11 = sub_245387950();
  MEMORY[0x24BDAC7A8](v11);
  v1[2] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744FEC0);
  swift_allocObject();
  v1[3] = sub_245387884();
  sub_24525C748();
  sub_245387944();
  v35 = MEMORY[0x24BEE4AF8];
  sub_24525C6C4((unint64_t *)&unk_257450050, v10, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257450020);
  sub_24526381C((unint64_t *)&qword_257450030, (uint64_t *)&unk_257450020, MEMORY[0x24BEE12C8]);
  sub_245387E3C();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5758], v28);
  v12 = sub_245387D94();
  v13 = MEMORY[0x24BEE4B00];
  v1[4] = v12;
  v1[5] = v13;
  v1[6] = v13;
  v1[12] = MEMORY[0x24BEE4B08];
  v14 = v29;
  sub_24525E4F0((uint64_t)v29, (uint64_t)(v1 + 7));
  v15 = v14[3];
  v16 = v14[4];
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
  v17 = (void *)v1[4];
  v36 = v17;
  v18 = sub_245387D64();
  v19 = (uint64_t)v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v30, 1, 1, v18);
  v20 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744FE90);
  sub_24526381C(&qword_25744FE88, &qword_25744FE90, MEMORY[0x24BDB9AF8]);
  sub_24525C6C4((unint64_t *)&unk_257450070, (uint64_t (*)(uint64_t))sub_24525C748, MEMORY[0x24BEE5670]);
  v21 = v31;
  sub_2453878B4();
  sub_245263F80(v19, (uint64_t *)&unk_257450060);

  swift_release();
  v22 = swift_allocObject();
  swift_weakInit();
  v23 = swift_allocObject();
  v24 = v33;
  *(_OWORD *)(v23 + 16) = *(_OWORD *)(v33 + 80);
  *(_QWORD *)(v23 + 32) = *(_QWORD *)(v24 + 96);
  *(_OWORD *)(v23 + 40) = *(_OWORD *)(v24 + 104);
  *(_QWORD *)(v23 + 56) = *(_QWORD *)(v24 + 120);
  *(_QWORD *)(v23 + 64) = v22;
  sub_24526381C(&qword_25744FE10, (uint64_t *)&unk_25744FE18, MEMORY[0x24BDB9A08]);
  v25 = v32;
  sub_2453878C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v25);
  swift_beginAccess();
  sub_245387860();
  swift_endAccess();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v2;
}

uint64_t sub_245385010()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245385034(unsigned __int8 *a1)
{
  int v1;
  uint64_t result;

  v1 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (v1)
      sub_2453850D0();
    return swift_release();
  }
  return result;
}

uint64_t sub_245385098()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2453850BC(unsigned __int8 *a1)
{
  return sub_245385034(a1);
}

uint64_t sub_2453850D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v30;
  char v31;
  _QWORD v32[2];
  char v33;
  __int128 v34;

  v1 = v0;
  v2 = sub_2453879D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)(v1 + 32);
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5610], v2);
  v7 = v6;
  LOBYTE(v6) = sub_2453879F8();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (qword_25744FD90 != -1)
LABEL_29:
    swift_once();
  v8 = sub_245387818();
  __swift_project_value_buffer(v8, (uint64_t)qword_257462FB0);
  v9 = sub_2453877F4();
  v10 = sub_245387D34();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_245256000, v9, v10, "Processing pended handshakes", v11, 2u);
    MEMORY[0x24953317C](v11, -1, -1);
  }

  swift_beginAccess();
  v12 = *(_QWORD *)(v1 + 48);
  v13 = v12 + 64;
  v14 = 1 << *(_BYTE *)(v12 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v12 + 64);
  v17 = (unint64_t)(v14 + 63) >> 6;
  swift_bridgeObjectRetain();
  v18 = 0;
  while (1)
  {
    if (v16)
    {
      v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v20 = v19 | (v18 << 6);
      goto LABEL_9;
    }
    v26 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v17)
      goto LABEL_25;
    v27 = *(_QWORD *)(v13 + 8 * v26);
    ++v18;
    if (!v27)
    {
      v18 = v26 + 1;
      if (v26 + 1 >= v17)
        goto LABEL_25;
      v27 = *(_QWORD *)(v13 + 8 * v18);
      if (!v27)
      {
        v18 = v26 + 2;
        if (v26 + 2 >= v17)
          goto LABEL_25;
        v27 = *(_QWORD *)(v13 + 8 * v18);
        if (!v27)
          break;
      }
    }
LABEL_24:
    v16 = (v27 - 1) & v27;
    v20 = __clz(__rbit64(v27)) + (v18 << 6);
LABEL_9:
    v21 = *(_QWORD *)(v12 + 48) + 40 * v20;
    v22 = *(_QWORD *)(v21 + 8);
    v23 = *(_BYTE *)(v21 + 16);
    v24 = *(_QWORD *)(v12 + 56) + 16 * v20;
    v25 = *(_QWORD *)v24;
    LOBYTE(v24) = *(_BYTE *)(v24 + 8);
    v32[0] = *(_QWORD *)v21;
    v32[1] = v22;
    v33 = v23;
    v34 = *(_OWORD *)(v21 + 24);
    v30 = v25;
    v31 = v24;
    swift_bridgeObjectRetain();
    sub_245385C34((uint64_t)v32, (uint64_t)&v30);
    swift_bridgeObjectRelease();
  }
  v28 = v26 + 3;
  if (v28 < v17)
  {
    v27 = *(_QWORD *)(v13 + 8 * v28);
    if (!v27)
    {
      while (1)
      {
        v18 = v28 + 1;
        if (__OFADD__(v28, 1))
          goto LABEL_27;
        if (v18 >= v17)
          goto LABEL_25;
        v27 = *(_QWORD *)(v13 + 8 * v18);
        ++v28;
        if (v27)
          goto LABEL_24;
      }
    }
    v18 = v28;
    goto LABEL_24;
  }
LABEL_25:
  swift_release();
  swift_beginAccess();
  *(_QWORD *)(v1 + 48) = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t HandshakeScheduler.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HandshakeScheduler.__deallocating_deinit()
{
  HandshakeScheduler.deinit();
  return swift_deallocClassInstance();
}

uint64_t HandshakeScheduler.scheduleHandshake(with:schedule:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  _QWORD v20[2];
  _QWORD aBlock[6];
  _OWORD v22[2];
  uint64_t v23;

  v3 = v2;
  v6 = sub_245387920();
  v20[0] = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245387950();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_OWORD *)(a1 + 16);
  v22[0] = *(_OWORD *)a1;
  v22[1] = v13;
  v23 = *(_QWORD *)(a1 + 32);
  v14 = *a2;
  v15 = *((_BYTE *)a2 + 8);
  v16 = swift_allocObject();
  v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v16 + 24) = *(_OWORD *)a1;
  *(_QWORD *)(v16 + 16) = v3;
  *(_OWORD *)(v16 + 40) = v17;
  *(_QWORD *)(v16 + 56) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v16 + 64) = v14;
  *(_BYTE *)(v16 + 72) = v15;
  aBlock[4] = sub_245385740;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24525DD34;
  aBlock[3] = &block_descriptor_17;
  v18 = _Block_copy(aBlock);
  swift_retain();
  sub_2452B7D58((uint64_t)v22);
  sub_245387938();
  v20[1] = MEMORY[0x24BEE4AF8];
  sub_24525C6C4((unint64_t *)&unk_25744FF00, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FFE0);
  sub_24526381C((unint64_t *)&qword_25744FFF0, (uint64_t *)&unk_25744FFE0, MEMORY[0x24BEE12C8]);
  sub_245387E3C();
  MEMORY[0x2495320E4](0, v12, v8, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v20[0] + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

void sub_245385674(_QWORD *a1, __int128 *a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v7 = a1[10];
  v8 = a1[11];
  __swift_project_boxed_opaque_existential_1(a1 + 7, v7);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8) & 1) != 0)
  {
    v9 = a2[1];
    v13 = *a2;
    v14 = v9;
    v15 = *((_QWORD *)a2 + 4);
    v11 = a3;
    v12 = a4;
    sub_245385C34((uint64_t)&v13, (uint64_t)&v11);
  }
  else
  {
    v10 = a2[1];
    v13 = *a2;
    v14 = v10;
    v15 = *((_QWORD *)a2 + 4);
    v11 = a3;
    v12 = a4;
    sub_24538576C((uint64_t)&v13, (uint64_t)&v11);
  }
}

uint64_t sub_245385738()
{
  return objectdestroy_5Tm();
}

void sub_245385740()
{
  uint64_t v0;

  sub_245385674(*(_QWORD **)(v0 + 16), (__int128 *)(v0 + 24), *(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

void sub_24538576C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  char v44;
  _OWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  char v48;

  v3 = v2;
  v6 = sub_2453879D4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (_QWORD *)((char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *(_OWORD *)(a1 + 16);
  v45[0] = *(_OWORD *)a1;
  v45[1] = v10;
  v46 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)a2;
  v12 = *(unsigned __int8 *)(a2 + 8);
  v13 = *(void **)(v3 + 32);
  *v9 = v13;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5610], v6);
  v14 = v13;
  LOBYTE(a2) = sub_2453879F8();
  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  if ((a2 & 1) != 0)
  {
    if (qword_25744FD90 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v15 = sub_245387818();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_257462FB0);
  sub_2452B7D58((uint64_t)v45);
  sub_2452B7D58((uint64_t)v45);
  v17 = sub_2453877F4();
  v18 = sub_245387D34();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v43 = v20;
    *(_DWORD *)v19 = 136446466;
    v21 = v12;
    v22 = v11;
    v41[1] = v16;
    v23 = *((_QWORD *)&v45[0] + 1);
    v24 = *(_QWORD *)&v45[0];
    sub_2452B7D58((uint64_t)v45);
    v47 = sub_2453816D8(v24, v23, &v43);
    sub_245387E0C();
    sub_2452B7D94((uint64_t)v45);
    sub_2452B7D94((uint64_t)v45);
    sub_2452B7D94((uint64_t)v45);
    *(_WORD *)(v19 + 12) = 2082;
    v47 = v22;
    v48 = v21;
    v25 = ReplicationSchedule.description.getter();
    v47 = sub_2453816D8(v25, v26, &v43);
    v11 = v22;
    v12 = v21;
    sub_245387E0C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245256000, v17, v18, "Pending handshake for %{public}s with schedule %{public}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24953317C](v20, -1, -1);
    MEMORY[0x24953317C](v19, -1, -1);
  }
  else
  {
    sub_2452B7D94((uint64_t)v45);
    sub_2452B7D94((uint64_t)v45);
  }

  v27 = (uint64_t *)(v3 + 48);
  swift_beginAccess();
  v28 = *(_QWORD *)(v3 + 48);
  if (!*(_QWORD *)(v28 + 16))
    goto LABEL_14;
  sub_2452B7D58((uint64_t)v45);
  swift_bridgeObjectRetain();
  v29 = sub_2452C225C((uint64_t *)v45);
  if ((v30 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_2452B7D94((uint64_t)v45);
    goto LABEL_14;
  }
  v31 = *(_QWORD *)(v28 + 56) + 16 * v29;
  v32 = *(_QWORD *)v31;
  v33 = *(unsigned __int8 *)(v31 + 8);
  swift_bridgeObjectRelease();
  sub_2452B7D94((uint64_t)v45);
  if (v33)
  {
    if (v33 == 1)
    {
      if (!v12)
        goto LABEL_14;
      if (v12 != 1)
        goto LABEL_19;
LABEL_16:
      if (v11 >= v32)
        goto LABEL_19;
LABEL_14:
      swift_beginAccess();
      sub_2452B7D58((uint64_t)v45);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v42 = *v27;
      *v27 = 0x8000000000000000;
      sub_245329754(v11, v12, (uint64_t)v45, isUniquelyReferenced_nonNull_native);
      *v27 = v42;
      swift_bridgeObjectRelease();
      sub_2452B7D94((uint64_t)v45);
      swift_endAccess();
      return;
    }
    if (v12 < 2)
      goto LABEL_14;
  }
  else if (!v12)
  {
    goto LABEL_16;
  }
LABEL_19:
  v35 = sub_2453877F4();
  v36 = sub_245387D34();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v42 = v38;
    v43 = v32;
    *(_DWORD *)v37 = 136446210;
    v44 = v33;
    v39 = ReplicationSchedule.description.getter();
    v43 = sub_2453816D8(v39, v40, &v42);
    sub_245387E0C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245256000, v35, v36, "Not replacing existing pended handshake with schedule %{public}s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24953317C](v38, -1, -1);
    MEMORY[0x24953317C](v37, -1, -1);
  }

}

uint64_t sub_245385C34(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v11;
  unsigned int v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _DWORD *v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  void (*v60)(__int128 *, uint64_t *, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  void (*v61)(__int128 *, uint64_t *, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  void (*v62)(__int128 *, uint64_t *, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  _QWORD *v84;

  v3 = v2;
  v6 = *v3;
  v7 = sub_2453879D4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(_OWORD *)(a1 + 16);
  v81 = *(_OWORD *)a1;
  v82 = v11;
  v83 = *(_QWORD *)(a1 + 32);
  v69 = *(_QWORD *)a2;
  v12 = *(unsigned __int8 *)(a2 + 8);
  v13 = (void *)v3[4];
  *v10 = v13;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5610], v7);
  v14 = v13;
  LOBYTE(v13) = sub_2453879F8();
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
  if ((v13 & 1) != 0)
  {
    if (qword_25744FD90 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v15 = sub_245387818();
  __swift_project_value_buffer(v15, (uint64_t)qword_257462FB0);
  swift_retain();
  sub_2452B7D58((uint64_t)&v81);
  swift_retain();
  sub_2452B7D58((uint64_t)&v81);
  v16 = sub_2453877F4();
  v17 = sub_245387D34();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (_DWORD *)swift_slowAlloc();
    v65 = swift_slowAlloc();
    *(_QWORD *)&v78 = v65;
    *v18 = 136315650;
    v84 = v3;
    swift_retain();
    v19 = *(_OWORD *)(v6 + 96);
    v70 = *(_OWORD *)(v6 + 80);
    v71 = v19;
    v72 = *(_OWORD *)(v6 + 112);
    LODWORD(v67) = v12;
    type metadata accessor for HandshakeScheduler();
  }
  swift_release_n();
  sub_2452B7D94((uint64_t)&v81);
  sub_2452B7D94((uint64_t)&v81);

  swift_beginAccess();
  v20 = v3[5];
  if (*(_QWORD *)(v20 + 16))
  {
    sub_2452B7D58((uint64_t)&v81);
    swift_bridgeObjectRetain();
    v21 = sub_2452C225C((uint64_t *)&v81);
    if ((v22 & 1) != 0)
    {
      sub_24525E4F0(*(_QWORD *)(v20 + 56) + 40 * v21, (uint64_t)&v78);
    }
    else
    {
      v80 = 0;
      v78 = 0u;
      v79 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_2452B7D94((uint64_t)&v81);
    if (*((_QWORD *)&v79 + 1))
    {
      sub_2452B7C5C(&v78, (uint64_t)&v70);
      v23 = *((_QWORD *)&v71 + 1);
      v24 = v72;
      __swift_project_boxed_opaque_existential_1(&v70, *((uint64_t *)&v71 + 1));
      (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v24 + 16))(&v78, v23, v24);
      if (BYTE8(v78))
      {
        if (BYTE8(v78) != 1)
        {
          if (v12 >= 2)
          {
LABEL_23:
            sub_24525E4F0((uint64_t)&v70, (uint64_t)&v78);
            v39 = sub_2453877F4();
            v40 = sub_245387D34();
            if (os_log_type_enabled(v39, v40))
            {
              v41 = swift_slowAlloc();
              v42 = swift_slowAlloc();
              v75 = v42;
              *(_DWORD *)v41 = 136446466;
              v43 = *((_QWORD *)&v79 + 1);
              v44 = v80;
              __swift_project_boxed_opaque_existential_1(&v78, *((uint64_t *)&v79 + 1));
              (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v44 + 16))(&v76, v43, v44);
              v73 = v76;
              v74 = v77;
              v45 = ReplicationSchedule.description.getter();
              v76 = sub_2453816D8(v45, v46, &v75);
              sub_245387E0C();
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
              *(_WORD *)(v41 + 12) = 2082;
              v76 = v69;
              v77 = v12;
              v47 = ReplicationSchedule.description.getter();
              v76 = sub_2453816D8(v47, v48, &v75);
              sub_245387E0C();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_245256000, v39, v40, "Not replacing existing scheduled handshake (%{public}s) with schedule %{public}s", (uint8_t *)v41, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x24953317C](v42, -1, -1);
              MEMORY[0x24953317C](v41, -1, -1);
            }
            else
            {
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
            }

            return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
          }
          goto LABEL_20;
        }
        if (!v12)
        {
LABEL_20:
          sub_24525E4F0((uint64_t)&v70, (uint64_t)&v78);
          v25 = sub_2453877F4();
          v26 = sub_245387D34();
          v27 = v26;
          if (os_log_type_enabled(v25, v26))
          {
            v28 = swift_slowAlloc();
            v67 = swift_slowAlloc();
            v75 = v67;
            *(_DWORD *)v28 = 136446466;
            v68 = v6;
            v29 = v12;
            v30 = *((_QWORD *)&v79 + 1);
            v31 = v80;
            __swift_project_boxed_opaque_existential_1(&v78, *((uint64_t *)&v79 + 1));
            v32 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v31 + 16);
            v66 = v27;
            v33 = v69;
            v32(&v76, v30, v31);
            v73 = v76;
            v74 = v77;
            v34 = ReplicationSchedule.description.getter();
            v76 = sub_2453816D8(v34, v35, &v75);
            sub_245387E0C();
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
            *(_WORD *)(v28 + 12) = 2082;
            v76 = v33;
            v12 = v29;
            v77 = v29;
            v36 = ReplicationSchedule.description.getter();
            v76 = sub_2453816D8(v36, v37, &v75);
            v6 = v68;
            sub_245387E0C();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_245256000, v25, (os_log_type_t)v66, "Canceling and replacing existing scheduled handshake (%{public}s) with schedule %{public}s", (uint8_t *)v28, 0x16u);
            v38 = v67;
            swift_arrayDestroy();
            MEMORY[0x24953317C](v38, -1, -1);
            MEMORY[0x24953317C](v28, -1, -1);
          }
          else
          {
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v78);
          }

          v49 = *((_QWORD *)&v71 + 1);
          v50 = v72;
          __swift_project_boxed_opaque_existential_1(&v70, *((uint64_t *)&v71 + 1));
          (*(void (**)(uint64_t, uint64_t))(v50 + 32))(v49, v50);
          v80 = 0;
          v78 = 0u;
          v79 = 0u;
          swift_beginAccess();
          sub_2452B7D58((uint64_t)&v81);
          sub_24531C95C((uint64_t)&v78, (uint64_t *)&v81);
          swift_endAccess();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
          goto LABEL_29;
        }
        if (v12 != 1)
          goto LABEL_23;
      }
      else if (v12)
      {
        goto LABEL_23;
      }
      if (v69 >= (uint64_t)v78)
        goto LABEL_23;
      goto LABEL_20;
    }
  }
  else
  {
    v80 = 0;
    v78 = 0u;
    v79 = 0u;
  }
  sub_245263F80((uint64_t)&v78, &qword_257452E40);
LABEL_29:
  v51 = swift_allocObject();
  swift_weakInit();
  v52 = swift_allocObject();
  v53 = *(_QWORD *)(v6 + 80);
  *(_QWORD *)(v52 + 16) = v53;
  v54 = *(_QWORD *)(v6 + 88);
  *(_QWORD *)(v52 + 24) = v54;
  v55 = *(_QWORD *)(v6 + 96);
  *(_QWORD *)(v52 + 32) = v55;
  v56 = *(_QWORD *)(v6 + 104);
  *(_QWORD *)(v52 + 40) = v56;
  v57 = *(_QWORD *)(v6 + 112);
  *(_QWORD *)(v52 + 48) = v57;
  v58 = *(_QWORD *)(v6 + 120);
  v59 = v82;
  *(_OWORD *)(v52 + 72) = v81;
  *(_QWORD *)(v52 + 56) = v58;
  *(_QWORD *)(v52 + 64) = v51;
  *(_OWORD *)(v52 + 88) = v59;
  *(_QWORD *)(v52 + 104) = v83;
  if (v12)
  {
    v78 = v81;
    v79 = v82;
    v80 = v83;
    v76 = v69;
    if (v12 == 1)
    {
      v77 = 1;
      v60 = *(void (**)(__int128 *, uint64_t *, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v57 + 24);
      *((_QWORD *)&v71 + 1) = v54;
      *(_QWORD *)&v72 = v57;
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v70);
      sub_2452B7D58((uint64_t)&v81);
      sub_2452B7D58((uint64_t)&v81);
      swift_retain();
      v60(&v78, &v76, sub_24538719C, v52, v54, v57);
    }
    else
    {
      v77 = 2;
      v62 = *(void (**)(__int128 *, uint64_t *, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v58 + 24);
      *((_QWORD *)&v71 + 1) = v55;
      *(_QWORD *)&v72 = v58;
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v70);
      sub_2452B7D58((uint64_t)&v81);
      sub_2452B7D58((uint64_t)&v81);
      swift_retain();
      v62(&v78, &v76, sub_24538719C, v52, v55, v58);
    }
  }
  else
  {
    v78 = v81;
    v79 = v82;
    v80 = v83;
    v76 = v69;
    v77 = 0;
    v61 = *(void (**)(__int128 *, uint64_t *, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v56 + 24);
    *((_QWORD *)&v71 + 1) = v53;
    *(_QWORD *)&v72 = v56;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v70);
    sub_2452B7D58((uint64_t)&v81);
    sub_2452B7D58((uint64_t)&v81);
    swift_retain();
    v61(&v78, &v76, sub_24538719C, v52, v53, v56);
  }
  sub_24525E4F0((uint64_t)&v70, (uint64_t)&v78);
  swift_beginAccess();
  sub_2452B7D58((uint64_t)&v81);
  sub_24531C95C((uint64_t)&v78, (uint64_t *)&v81);
  swift_endAccess();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
}

uint64_t sub_245386758()
{
  return sub_245384A50();
}

uint64_t sub_245386778(uint64_t a1, uint64_t *a2)
{
  return HandshakeScheduler.scheduleHandshake(with:schedule:)(a1, a2);
}

uint64_t sub_245386798@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_245384A50();
  *a1 = result;
  return result;
}

uint64_t sub_2453867C0()
{
  uint64_t v0;

  v0 = swift_retain();
  return sub_245384AF4(v0);
}

uint64_t sub_2453867E8()
{
  return 48;
}

__n128 sub_2453867F4(uint64_t a1, uint64_t a2)
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

uint64_t sub_245386808()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for HandshakeScheduler()
{
  JUMPOUT(0x249533038);
}

uint64_t method lookup function for HandshakeScheduler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HandshakeScheduler.handshakePublisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of HandshakeScheduler.handshakePublisher.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of HandshakeScheduler.handshakePublisher.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of HandshakeScheduler.__allocating_init(firstLockStateProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t sub_2453868C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  const void *v16;
  _QWORD v17[3];
  _QWORD aBlock[6];

  v3 = sub_245387920();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_245387950();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v12 = result;
    v17[1] = *(_QWORD *)(result + 32);
    v13 = swift_allocObject();
    v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v13 + 24) = *(_OWORD *)a2;
    *(_QWORD *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 40) = v14;
    *(_QWORD *)(v13 + 56) = *(_QWORD *)(a2 + 32);
    aBlock[4] = sub_2453871F4;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24525DD34;
    aBlock[3] = &block_descriptor_16;
    v15 = _Block_copy(aBlock);
    v17[0] = v4;
    v16 = v15;
    swift_retain();
    sub_2452B7D58(a2);
    sub_245387938();
    v17[2] = MEMORY[0x24BEE4AF8];
    sub_24525C6C4((unint64_t *)&unk_25744FF00, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744FFE0);
    sub_24526381C((unint64_t *)&qword_25744FFF0, (uint64_t *)&unk_25744FFE0, MEMORY[0x24BEE12C8]);
    sub_245387E3C();
    MEMORY[0x2495320E4](0, v10, v6, v16);
    _Block_release(v16);
    (*(void (**)(char *, uint64_t))(v17[0] + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_245386B04(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(__int128 *__return_ptr, uint64_t, uint64_t);
  uint64_t v34;
  char v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char v64;
  _QWORD v65[3];
  uint64_t v66;
  uint64_t v67;
  _OWORD v68[2];
  uint64_t v69;

  v2 = v1;
  v4 = sub_2453879D4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (_QWORD *)((char *)v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *((_OWORD *)a1 + 1);
  v68[0] = *(_OWORD *)a1;
  v68[1] = v8;
  v10 = a1[3];
  v9 = a1[4];
  v69 = v9;
  v12 = *a1;
  v11 = a1[1];
  v13 = *((unsigned __int8 *)a1 + 16);
  v14 = *(void **)(v2 + 32);
  *v7 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5610], v4);
  v15 = v14;
  LOBYTE(v14) = sub_2453879F8();
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v14 & 1) == 0)
  {
    __break(1u);
LABEL_19:
    swift_once();
    goto LABEL_10;
  }
  v4 = v2 + 40;
  swift_beginAccess();
  v16 = *(_QWORD *)(v2 + 40);
  if (*(_QWORD *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    sub_2452B7D58((uint64_t)v68);
    v17 = sub_2452C225C((uint64_t *)v68);
    if ((v18 & 1) != 0)
    {
      sub_24525E4F0(*(_QWORD *)(v16 + 56) + 40 * v17, (uint64_t)&v58);
    }
    else
    {
      v60 = 0;
      v59 = 0u;
      v58 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_2452B7D94((uint64_t)v68);
  }
  else
  {
    v60 = 0;
    v59 = 0u;
    v58 = 0u;
  }
  if (!*((_QWORD *)&v59 + 1))
    return sub_245263F80((uint64_t)&v58, &qword_257452E40);
  v53 = v10;
  v54 = v9;
  sub_2452B7C5C(&v58, (uint64_t)v65);
  if (qword_25744FD90 != -1)
    goto LABEL_19;
LABEL_10:
  v19 = sub_245387818();
  __swift_project_value_buffer(v19, (uint64_t)qword_257462FB0);
  sub_24525E4F0((uint64_t)v65, (uint64_t)&v58);
  sub_2452B7D58((uint64_t)v68);
  sub_2452B7D58((uint64_t)v68);
  v20 = sub_2453877F4();
  v21 = sub_245387D34();
  v22 = os_log_type_enabled(v20, v21);
  v52 = v13;
  v51 = v11;
  v50 = v12;
  v49[1] = v4;
  if (v22)
  {
    v23 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v57 = v24;
    *(_DWORD *)v23 = 136446466;
    v25 = v68[0];
    sub_2452B7D58((uint64_t)v68);
    v63 = sub_2453816D8(v25, *((unint64_t *)&v25 + 1), &v57);
    sub_245387E0C();
    sub_2452B7D94((uint64_t)v68);
    sub_2452B7D94((uint64_t)v68);
    sub_2452B7D94((uint64_t)v68);
    *(_WORD *)(v23 + 12) = 2082;
    v26 = *((_QWORD *)&v59 + 1);
    v27 = v60;
    __swift_project_boxed_opaque_existential_1(&v58, *((uint64_t *)&v59 + 1));
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v27 + 16))(&v63, v26, v27);
    v55 = v63;
    v56 = v64;
    v28 = ReplicationSchedule.description.getter();
    v63 = sub_2453816D8(v28, v29, &v57);
    sub_245387E0C();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v58);
    _os_log_impl(&dword_245256000, v20, v21, "Scheduled handshake task fired for %{public}s; schedule: %{public}s",
      (uint8_t *)v23,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x24953317C](v24, -1, -1);
    MEMORY[0x24953317C](v23, -1, -1);
  }
  else
  {
    sub_2452B7D94((uint64_t)v68);
    sub_2452B7D94((uint64_t)v68);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v58);
  }

  v31 = v66;
  v32 = v67;
  __swift_project_boxed_opaque_existential_1(v65, v66);
  v33 = *(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v32 + 16);
  sub_2452B7D58((uint64_t)v68);
  v33(&v58, v31, v32);
  v34 = v58;
  v35 = BYTE8(v58);
  sub_2452B7D58((uint64_t)v68);
  sub_2452B7D58((uint64_t)v68);
  v36 = sub_2453877F4();
  v37 = sub_245387D34();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    *(_QWORD *)&v58 = v39;
    *(_DWORD *)v38 = 136446210;
    v49[0] = v38 + 4;
    v40 = v34;
    v42 = *((_QWORD *)&v68[0] + 1);
    v41 = *(_QWORD *)&v68[0];
    sub_2452B7D58((uint64_t)v68);
    v43 = v42;
    v34 = v40;
    v63 = sub_2453816D8(v41, v43, (uint64_t *)&v58);
    sub_245387E0C();
    sub_2452B7D94((uint64_t)v68);
    sub_2452B7D94((uint64_t)v68);
    sub_2452B7D94((uint64_t)v68);
    _os_log_impl(&dword_245256000, v36, v37, "Scheduled handshake task fired for %{public}s; canceling", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24953317C](v39, -1, -1);
    MEMORY[0x24953317C](v38, -1, -1);
  }
  else
  {
    sub_2452B7D94((uint64_t)v68);
    sub_2452B7D94((uint64_t)v68);
  }

  v44 = v53;
  v45 = v52;
  v46 = v51;
  v47 = v66;
  v48 = v67;
  __swift_project_boxed_opaque_existential_1(v65, v66);
  (*(void (**)(uint64_t, uint64_t))(v48 + 32))(v47, v48);
  v60 = 0;
  v59 = 0u;
  v58 = 0u;
  swift_beginAccess();
  sub_2452B7D58((uint64_t)v68);
  sub_24531C95C((uint64_t)&v58, (uint64_t *)v68);
  swift_endAccess();
  *(_QWORD *)&v58 = v50;
  *((_QWORD *)&v58 + 1) = v46;
  LOBYTE(v59) = v45;
  *((_QWORD *)&v59 + 1) = v44;
  v60 = v54;
  v61 = v34;
  v62 = v35;
  sub_245387878();
  sub_2452B7D94((uint64_t)v68);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
}

uint64_t sub_245387170()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24538719C()
{
  uint64_t v0;

  return sub_2453868C4(*(_QWORD *)(v0 + 64), v0 + 72);
}

uint64_t sub_2453871B4()
{
  return objectdestroy_5Tm();
}

uint64_t objectdestroy_5Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2453871F4()
{
  uint64_t v0;
  __int128 v1;
  _OWORD v3[2];
  uint64_t v4;

  v1 = *(_OWORD *)(v0 + 40);
  v3[0] = *(_OWORD *)(v0 + 24);
  v3[1] = v1;
  v4 = *(_QWORD *)(v0 + 56);
  return sub_245386B04((uint64_t *)v3);
}

uint64_t sub_245387434()
{
  return MEMORY[0x24BDCAFA0]();
}

uint64_t sub_245387440()
{
  return MEMORY[0x24BDCAFE0]();
}

uint64_t sub_24538744C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_245387458()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_245387464()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_245387470()
{
  return MEMORY[0x24BDCB7E0]();
}

uint64_t sub_24538747C()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_245387488()
{
  return MEMORY[0x24BDCB900]();
}

uint64_t sub_245387494()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_2453874A0()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2453874AC()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2453874B8()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2453874C4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2453874D0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2453874DC()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2453874E8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2453874F4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_245387500()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_24538750C()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_245387518()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_245387524()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_245387530()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_24538753C()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_245387548()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_245387554()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_245387560()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_24538756C()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_245387578()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_245387584()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_245387590()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_24538759C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2453875A8()
{
  return MEMORY[0x24BDCD9A0]();
}

uint64_t sub_2453875B4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2453875C0()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_2453875CC()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2453875D8()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_2453875E4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2453875F0()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_2453875FC()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_245387608()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_245387614()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_245387620()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_24538762C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_245387638()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_245387644()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_245387650()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_24538765C()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_245387668()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_245387674()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_245387680()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_24538768C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_245387698()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_2453876A4()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_2453876B0()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_2453876BC()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_2453876C8()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2453876D4()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_2453876E0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2453876EC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2453876F8()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_245387704()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_245387710()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_24538771C()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_245387728()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_245387734()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_245387740()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24538774C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_245387758()
{
  return MEMORY[0x24BE60928]();
}

uint64_t sub_245387764()
{
  return MEMORY[0x24BE60958]();
}

uint64_t sub_245387770()
{
  return MEMORY[0x24BE60968]();
}

uint64_t sub_24538777C()
{
  return MEMORY[0x24BE60978]();
}

uint64_t sub_245387788()
{
  return MEMORY[0x24BE60980]();
}

uint64_t sub_245387794()
{
  return MEMORY[0x24BE609E0]();
}

uint64_t sub_2453877A0()
{
  return MEMORY[0x24BE60A00]();
}

uint64_t sub_2453877AC()
{
  return MEMORY[0x24BE60A08]();
}

uint64_t sub_2453877B8()
{
  return MEMORY[0x24BE60A10]();
}

uint64_t sub_2453877C4()
{
  return MEMORY[0x24BE60AE8]();
}

uint64_t sub_2453877D0()
{
  return MEMORY[0x24BE60B10]();
}

uint64_t sub_2453877DC()
{
  return MEMORY[0x24BE60B20]();
}

uint64_t sub_2453877E8()
{
  return MEMORY[0x24BE60B80]();
}

uint64_t sub_2453877F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245387800()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24538780C()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t sub_245387818()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245387824()
{
  return MEMORY[0x24BEE6498]();
}

uint64_t sub_245387830()
{
  return MEMORY[0x24BEE7698]();
}

uint64_t sub_24538783C()
{
  return MEMORY[0x24BEE76A0]();
}

uint64_t sub_245387848()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_245387854()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t sub_245387860()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_24538786C()
{
  return MEMORY[0x24BDB9B48]();
}

uint64_t sub_245387878()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_245387884()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_245387890()
{
  return MEMORY[0x24BDB9E70]();
}

uint64_t sub_24538789C()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_2453878A8()
{
  return MEMORY[0x24BDB9FE0]();
}

uint64_t sub_2453878B4()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_2453878C0()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2453878CC()
{
  return MEMORY[0x24BDE0190]();
}

uint64_t sub_2453878D8()
{
  return MEMORY[0x24BDE01B8]();
}

uint64_t sub_2453878E4()
{
  return MEMORY[0x24BDE0370]();
}

uint64_t sub_2453878F0()
{
  return MEMORY[0x24BDE0378]();
}

uint64_t sub_2453878FC()
{
  return MEMORY[0x24BDE0388]();
}

uint64_t sub_245387908()
{
  return MEMORY[0x24BDE0688]();
}

uint64_t sub_245387914()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_245387920()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24538792C()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_245387938()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_245387944()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_245387950()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24538795C()
{
  return MEMORY[0x24BEE5518]();
}

uint64_t sub_245387968()
{
  return MEMORY[0x24BEE5520]();
}

uint64_t sub_245387974()
{
  return MEMORY[0x24BEE5528]();
}

uint64_t sub_245387980()
{
  return MEMORY[0x24BEE5530]();
}

uint64_t sub_24538798C()
{
  return MEMORY[0x24BEE5538]();
}

uint64_t sub_245387998()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2453879A4()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_2453879B0()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2453879BC()
{
  return MEMORY[0x24BEE55A8]();
}

uint64_t sub_2453879C8()
{
  return MEMORY[0x24BEE55B0]();
}

uint64_t sub_2453879D4()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_2453879E0()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_2453879EC()
{
  return MEMORY[0x24BEE5630]();
}

uint64_t sub_2453879F8()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_245387A04()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_245387A10()
{
  return MEMORY[0x24BDC62E0]();
}

uint64_t sub_245387A1C()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_245387A28()
{
  return MEMORY[0x24BDC6AD8]();
}

uint64_t _s16ReplicatorEngine13UniformHasherVACycfC_0()
{
  return MEMORY[0x24BDC6AF0]();
}

uint64_t sub_245387A40()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_245387A4C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_245387A58()
{
  return MEMORY[0x24BDCF818]();
}

uint64_t sub_245387A64()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_245387A70()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_245387A7C()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_245387A88()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_245387A94()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_245387AA0()
{
  return MEMORY[0x24BEE0500]();
}

uint64_t sub_245387AAC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_245387AB8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_245387AC4()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_245387AD0()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_245387ADC()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_245387AE8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_245387AF4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245387B00()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_245387B0C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_245387B18()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245387B24()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_245387B30()
{
  return MEMORY[0x24BDCFAE8]();
}

uint64_t sub_245387B3C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_245387B48()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_245387B54()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_245387B60()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_245387B6C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245387B78()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_245387B84()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_245387B90()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_245387B9C()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_245387BA8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245387BB4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_245387BC0()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_245387BCC()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_245387BD8()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_245387BE4()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_245387BF0()
{
  return MEMORY[0x24BEE1040]();
}

uint64_t sub_245387BFC()
{
  return MEMORY[0x24BEE1058]();
}

uint64_t sub_245387C08()
{
  return MEMORY[0x24BEE10C0]();
}

uint64_t sub_245387C14()
{
  return MEMORY[0x24BEE10D8]();
}

uint64_t sub_245387C20()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_245387C2C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_245387C38()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_245387C44()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_245387C50()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245387C5C()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_245387C68()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245387C74()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245387C80()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_245387C8C()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_245387C98()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_245387CA4()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_245387CB0()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t sub_245387CBC()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_245387CC8()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_245387CD4()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_245387CE0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_245387CEC()
{
  return MEMORY[0x24BEE7618]();
}

uint64_t sub_245387CF8()
{
  return MEMORY[0x24BDCFE78]();
}

uint64_t sub_245387D04()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_245387D10()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_245387D1C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245387D28()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_245387D34()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_245387D40()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_245387D4C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_245387D58()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_245387D64()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_245387D70()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_245387D7C()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_245387D88()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_245387D94()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_245387DA0()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_245387DAC()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_245387DB8()
{
  return MEMORY[0x24BEE5830]();
}

uint64_t sub_245387DC4()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_245387DD0()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_245387DDC()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_245387DE8()
{
  return MEMORY[0x24BEE5950]();
}

uint64_t sub_245387DF4()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_245387E00()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_245387E0C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245387E18()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245387E24()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_245387E30()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_245387E3C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_245387E48()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_245387E54()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_245387E60()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_245387E6C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_245387E78()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_245387E84()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_245387E90()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_245387E9C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_245387EA8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_245387EB4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245387EC0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_245387ECC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_245387ED8()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_245387EE4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_245387EF0()
{
  return MEMORY[0x24BEE2730]();
}

uint64_t sub_245387EFC()
{
  return MEMORY[0x24BEE2740]();
}

uint64_t sub_245387F08()
{
  return MEMORY[0x24BEE2750]();
}

uint64_t sub_245387F14()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245387F20()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_245387F2C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_245387F38()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_245387F44()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_245387F50()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_245387F5C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_245387F68()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_245387F74()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245387F80()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_245387F8C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_245387F98()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_245387FA4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_245387FB0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245387FBC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245387FC8()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_245387FD4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_245387FE0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_245387FEC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_245387FF8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_245388004()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_245388010()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_24538801C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_245388028()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_245388034()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_245388040()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_24538804C()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_245388058()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_245388064()
{
  return MEMORY[0x24BEE33F0]();
}

uint64_t sub_245388070()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_24538807C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_245388088()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_245388094()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_2453880A0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2453880AC()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2453880B8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2453880C4()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_2453880D0()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_2453880DC()
{
  return MEMORY[0x24BEE3530]();
}

uint64_t sub_2453880E8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2453880F4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_245388100()
{
  return MEMORY[0x24BEE3678]();
}

uint64_t sub_24538810C()
{
  return MEMORY[0x24BEE3680]();
}

uint64_t sub_245388118()
{
  return MEMORY[0x24BEE3688]();
}

uint64_t sub_245388124()
{
  return MEMORY[0x24BEE3698]();
}

uint64_t sub_245388130()
{
  return MEMORY[0x24BEE36A0]();
}

uint64_t sub_24538813C()
{
  return MEMORY[0x24BEE36A8]();
}

uint64_t sub_245388148()
{
  return MEMORY[0x24BEE36C8]();
}

uint64_t sub_245388154()
{
  return MEMORY[0x24BEE36F0]();
}

uint64_t sub_245388160()
{
  return MEMORY[0x24BEE3700]();
}

uint64_t sub_24538816C()
{
  return MEMORY[0x24BEE3708]();
}

uint64_t sub_245388178()
{
  return MEMORY[0x24BEE37D8]();
}

uint64_t sub_245388184()
{
  return MEMORY[0x24BEE37E0]();
}

uint64_t sub_245388190()
{
  return MEMORY[0x24BEE37E8]();
}

uint64_t sub_24538819C()
{
  return MEMORY[0x24BEE37F0]();
}

uint64_t sub_2453881A8()
{
  return MEMORY[0x24BEE37F8]();
}

uint64_t sub_2453881B4()
{
  return MEMORY[0x24BEE3800]();
}

uint64_t sub_2453881C0()
{
  return MEMORY[0x24BEE3808]();
}

uint64_t sub_2453881CC()
{
  return MEMORY[0x24BEE3810]();
}

uint64_t sub_2453881D8()
{
  return MEMORY[0x24BEE3818]();
}

uint64_t sub_2453881E4()
{
  return MEMORY[0x24BEE3820]();
}

uint64_t sub_2453881F0()
{
  return MEMORY[0x24BEE3828]();
}

uint64_t sub_2453881FC()
{
  return MEMORY[0x24BEE3830]();
}

uint64_t sub_245388208()
{
  return MEMORY[0x24BEE3838]();
}

uint64_t sub_245388214()
{
  return MEMORY[0x24BEE3840]();
}

uint64_t sub_245388220()
{
  return MEMORY[0x24BEE3848]();
}

uint64_t sub_24538822C()
{
  return MEMORY[0x24BEE3850]();
}

uint64_t sub_245388238()
{
  return MEMORY[0x24BEE3858]();
}

uint64_t sub_245388244()
{
  return MEMORY[0x24BEE3860]();
}

uint64_t sub_245388250()
{
  return MEMORY[0x24BEE3868]();
}

uint64_t sub_24538825C()
{
  return MEMORY[0x24BEE3870]();
}

uint64_t sub_245388268()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_245388274()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245388280()
{
  return MEMORY[0x24BEE3AD0]();
}

uint64_t sub_24538828C()
{
  return MEMORY[0x24BEE3AD8]();
}

uint64_t sub_245388298()
{
  return MEMORY[0x24BEE3B70]();
}

uint64_t sub_2453882A4()
{
  return MEMORY[0x24BEE3B78]();
}

uint64_t sub_2453882B0()
{
  return MEMORY[0x24BEE3BE8]();
}

uint64_t sub_2453882BC()
{
  return MEMORY[0x24BEE3BF0]();
}

uint64_t sub_2453882C8()
{
  return MEMORY[0x24BEE3BF8]();
}

uint64_t sub_2453882D4()
{
  return MEMORY[0x24BEE3C08]();
}

uint64_t sub_2453882E0()
{
  return MEMORY[0x24BEE3C10]();
}

uint64_t sub_2453882EC()
{
  return MEMORY[0x24BEE3C18]();
}

uint64_t sub_2453882F8()
{
  return MEMORY[0x24BEE3C38]();
}

uint64_t sub_245388304()
{
  return MEMORY[0x24BEE3C60]();
}

uint64_t sub_245388310()
{
  return MEMORY[0x24BEE3C70]();
}

uint64_t sub_24538831C()
{
  return MEMORY[0x24BEE3C78]();
}

uint64_t sub_245388328()
{
  return MEMORY[0x24BEE3C80]();
}

uint64_t sub_245388334()
{
  return MEMORY[0x24BEE3C88]();
}

uint64_t sub_245388340()
{
  return MEMORY[0x24BEE3C90]();
}

uint64_t sub_24538834C()
{
  return MEMORY[0x24BEE3CA0]();
}

uint64_t sub_245388358()
{
  return MEMORY[0x24BEE3CA8]();
}

uint64_t sub_245388364()
{
  return MEMORY[0x24BEE3CB0]();
}

uint64_t sub_245388370()
{
  return MEMORY[0x24BEE3CD0]();
}

uint64_t sub_24538837C()
{
  return MEMORY[0x24BEE3CE0]();
}

uint64_t sub_245388388()
{
  return MEMORY[0x24BEE3CF8]();
}

uint64_t sub_245388394()
{
  return MEMORY[0x24BEE3D00]();
}

uint64_t sub_2453883A0()
{
  return MEMORY[0x24BEE3D08]();
}

uint64_t sub_2453883AC()
{
  return MEMORY[0x24BEE3D10]();
}

uint64_t sub_2453883B8()
{
  return MEMORY[0x24BEE3D18]();
}

uint64_t sub_2453883C4()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2453883D0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2453883DC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2453883E8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2453883F4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_245388400()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24538840C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_245388418()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_245388424()
{
  return MEMORY[0x24BDD0780]();
}

uint64_t sub_245388430()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_24538843C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245388448()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245388454()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_245388460()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_24538846C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_245388478()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_245388484()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_245388490()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24538849C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2453884A8()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_2453884B4()
{
  return MEMORY[0x24BEE49F0]();
}

uint64_t sub_2453884C0()
{
  return MEMORY[0x24BEE49F8]();
}

uint64_t sub_2453884CC()
{
  return MEMORY[0x24BEE4A00]();
}

uint64_t sub_2453884D8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2453884E4()
{
  return MEMORY[0x24BEE4A10]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x24BE4F978]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x24BE4F9A8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x24BED8480]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x24BE29870]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x24BE29880]();
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

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x24BDAEA80](path, namebuff, size, *(_QWORD *)&options);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_application_service(const char *application_service_name)
{
  return (nw_advertise_descriptor_t)MEMORY[0x24BDE09F8](application_service_name);
}

nw_browse_descriptor_t nw_browse_descriptor_create_application_service(const char *application_service_name)
{
  return (nw_browse_descriptor_t)MEMORY[0x24BDE0A60](application_service_name);
}

uint64_t nw_browse_descriptor_set_browse_scope()
{
  return MEMORY[0x24BDE0A70]();
}

uint64_t nw_browse_descriptor_set_device_types()
{
  return MEMORY[0x24BDE0A78]();
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0A88](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x24BDE0AA0](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
  MEMORY[0x24BDE0AB0](browser);
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x24BDE0AB8](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
  MEMORY[0x24BDE0AC0](browser, handler);
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0AC8](browser, queue);
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
  MEMORY[0x24BDE0AD0](browser, state_changed_handler);
}

void nw_browser_start(nw_browser_t browser)
{
  MEMORY[0x24BDE0AD8](browser);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0B40](connection);
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x24BDE0B50](connection, definition);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x24BDE0BB8]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

uint64_t nw_endpoint_create_application_service()
{
  return MEMORY[0x24BDE0E70]();
}

uint64_t nw_endpoint_get_device_id()
{
  return MEMORY[0x24BDE0F00]();
}

uint64_t nw_endpoint_get_device_name()
{
  return MEMORY[0x24BDE0F10]();
}

uint64_t nw_endpoint_set_agent_identifier()
{
  return MEMORY[0x24BDE0F88]();
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x24BDE1448](parameters);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
  MEMORY[0x24BDE1468](listener, advertise_descriptor);
}

uint64_t nw_listener_set_event_handler()
{
  return MEMORY[0x24BDE1480]();
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x24BDE1488](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1498](listener, queue);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x24BDE14A8](listener);
}

nw_parameters_t nw_parameters_create_application_service(void)
{
  return (nw_parameters_t)MEMORY[0x24BDE1560]();
}

uint64_t nw_parameters_create_application_service_quic()
{
  return MEMORY[0x24BDE1568]();
}

uint64_t nw_parameters_set_attach_protocol_listener()
{
  return MEMORY[0x24BDE1638]();
}

uint64_t nw_parameters_set_include_ble()
{
  return MEMORY[0x24BDE1688]();
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
  MEMORY[0x24BDE1690](parameters, include_peer_to_peer);
}

uint64_t nw_parameters_set_include_screen_off_devices()
{
  return MEMORY[0x24BDE1698]();
}

void nw_parameters_set_local_only(nw_parameters_t parameters, BOOL local_only)
{
  MEMORY[0x24BDE16D0](parameters, local_only);
}

void nw_parameters_set_multipath_service(nw_parameters_t parameters, nw_multipath_service_t multipath_service)
{
  MEMORY[0x24BDE16E0](parameters, *(_QWORD *)&multipath_service);
}

uint64_t nw_parameters_set_preferred_interface_subtypes()
{
  return MEMORY[0x24BDE1710]();
}

uint64_t nw_parameters_set_preferred_netagent_classes()
{
  return MEMORY[0x24BDE1718]();
}

void nw_parameters_set_prohibit_constrained(nw_parameters_t parameters, BOOL prohibit_constrained)
{
  MEMORY[0x24BDE1720](parameters, prohibit_constrained);
}

void nw_parameters_set_prohibit_expensive(nw_parameters_t parameters, BOOL prohibit_expensive)
{
  MEMORY[0x24BDE1728](parameters, prohibit_expensive);
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x24BDE1750]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x24BDE1790]();
}

nw_protocol_definition_t nw_protocol_copy_quic_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE1B68]();
}

BOOL nw_protocol_metadata_is_quic(nw_protocol_metadata_t metadata)
{
  return MEMORY[0x24BDE1F50](metadata);
}

uint64_t nw_quic_set_keepalive()
{
  return MEMORY[0x24BDE2310]();
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x24BDAFB68](path, name, *(_QWORD *)&options);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x24BDB06C8](xarray, index, value);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x24BDB0970]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

