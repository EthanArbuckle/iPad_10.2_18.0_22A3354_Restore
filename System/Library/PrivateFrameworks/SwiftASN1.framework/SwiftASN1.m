uint64_t sub_247BCC374()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = v0[5];
  v2 = v0[6];
  v3 = v0[7];
  v4 = v0[8];
  v5 = v0[10];
  v16 = v0[9];
  v6 = v0[11];
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA64();
  v7 = v3 >> 1;
  result = (v3 >> 1) - v2;
  if (__OFSUB__(v3 >> 1, v2))
  {
    __break(1u);
    goto LABEL_16;
  }
  result = sub_247BECA58();
  v9 = __OFSUB__(v7, v2);
  v10 = v7 - v2;
  if (v10)
  {
    if ((v10 < 0) ^ v9 | (v10 == 0))
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    v11 = v1 + v2;
    do
    {
      ++v11;
      sub_247BECA64();
      --v10;
    }
    while (v10);
  }
  if (!v4)
    return sub_247BECA64();
  sub_247BECA64();
  v12 = v6 >> 1;
  result = (v6 >> 1) - v5;
  if (__OFSUB__(v6 >> 1, v5))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  result = sub_247BECA58();
  v13 = __OFSUB__(v12, v5);
  v14 = v12 - v5;
  if (!v14)
    return result;
  if ((v14 < 0) ^ v13 | (v14 == 0))
  {
LABEL_18:
    __break(1u);
    return result;
  }
  v15 = v16 + v5;
  do
  {
    ++v15;
    result = sub_247BECA64();
    --v14;
  }
  while (v14);
  return result;
}

uint64_t sub_247BCC488()
{
  sub_247BECA4C();
  sub_247BCC374();
  return sub_247BECA7C();
}

uint64_t sub_247BCC500()
{
  sub_247BECA4C();
  sub_247BCC374();
  return sub_247BECA7C();
}

uint64_t sub_247BCC574()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = v0[8];
  v2 = v0[10];
  v3 = v0[11];
  sub_247BEC95C();
  sub_247BEC794();
  ASN1Identifier.description.getter();
  sub_247BEC794();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  sub_247BEC9EC();
  sub_247BEC794();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  if (v1 && __OFSUB__(v3 >> 1, v2))
    __break(1u);
  sub_247BEC9EC();
  sub_247BEC794();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  return 0;
}

uint64_t static DER.sequence<A>(_:identifier:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(_QWORD *)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v5;
  BOOL v7;
  uint64_t *v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19[7];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];

  v7 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v7 && (*(_BYTE *)(a1 + 56) & 1) == 0)
  {
    v13 = *(_QWORD *)(a1 + 16);
    v12 = *(_QWORD *)(a1 + 24);
    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v22[0] = v13;
    v22[1] = v12;
    v22[2] = v15;
    v22[3] = v14;
    v22[4] = v16;
    swift_unknownObjectRetain_n();
    a3(v22);
    if (v5
      || (ASN1NodeCollection.Iterator.next()((uint64_t)v19),
          v17 = v21,
          sub_247BD3D8C(v19[0], v19[1], v19[2], v19[3], v19[4], v19[5], v19[6], v20, v21),
          !v17))
    {
      swift_unknownObjectRelease();
      return j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0);
    }
    else
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000019, 0x8000000247BEEAB0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 92, v18);
      swift_willThrow();
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 8))(a5, a4);
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 84, v8);
    return swift_willThrow();
  }
}

uint64_t ASN1NodeCollection.makeIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = v2;
  return swift_unknownObjectRetain();
}

void ASN1NodeCollection.Iterator.next()(uint64_t a1@<X8>)
{
  uint64_t *v1;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[2];
  _BYTE v42[40];

  v3 = v1[2];
  v4 = v1[3];
  if (v3 == v4 >> 1)
  {
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return;
  }
  if (v3 >= (uint64_t)(v4 >> 1))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v5 = *v1;
  v6 = v1[1];
  v7 = (__int128 *)(v6 + 96 * v3);
  v8 = v7[1];
  v37 = *v7;
  v38 = v8;
  v9 = v7[2];
  v10 = v7[3];
  v11 = v7[5];
  v41[0] = v7[4];
  v41[1] = v11;
  v39 = v9;
  v40 = v10;
  v12 = v3 + 1;
  v1[2] = v3 + 1;
  if ((BYTE8(v38) & 1) != 0)
  {
    sub_247BD5538(v5, v6, v12, v4, (uint64_t)&v37);
    v21 = v20;
    if (!__OFSUB__(v19 >> 1, v18))
    {
      v22 = v17;
      v23 = v18;
      v24 = v19;
      *v1 = sub_247BCFD1C((v19 >> 1) - v18, v5, v6, v12, v4);
      v1[1] = v25;
      v1[2] = v26;
      v1[3] = v27;
      v28 = v37;
      v29 = BYTE8(v37);
      sub_247BD00DC(v21, v22, v23, v24, v38, &v34);
      v30 = v36;
      v32 = v34;
      v31 = v35;
      *(_QWORD *)a1 = v28;
      *(_QWORD *)(a1 + 8) = v29;
      *(_OWORD *)(a1 + 16) = v32;
      *(_OWORD *)(a1 + 32) = v31;
      *(_QWORD *)(a1 + 48) = v30;
      *(_QWORD *)(a1 + 56) = 0;
      v33 = v40;
      *(_OWORD *)(a1 + 64) = v39;
      *(_OWORD *)(a1 + 80) = v33;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      return;
    }
    goto LABEL_11;
  }
  sub_247BD3DDC((uint64_t)v41, (uint64_t)v42);
  sub_247BD3DDC((uint64_t)v42, (uint64_t)&v34);
  v13 = v34;
  if (!(_QWORD)v34)
  {
LABEL_12:
    __break(1u);
    return;
  }
  v14 = *((_QWORD *)&v34 + 1);
  v15 = BYTE8(v37);
  *(_QWORD *)a1 = v37;
  *(_QWORD *)(a1 + 8) = v15;
  *(_QWORD *)(a1 + 16) = v13;
  *(_QWORD *)(a1 + 24) = v14;
  *(_OWORD *)(a1 + 32) = v35;
  *(_OWORD *)(a1 + 48) = xmmword_247BECC60;
  v16 = v40;
  *(_OWORD *)(a1 + 64) = v39;
  *(_OWORD *)(a1 + 80) = v16;
  sub_247BD3E64((uint64_t)v42);
  swift_unknownObjectRetain();
}

uint64_t static DER.sequence<A>(of:identifier:rootNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v17[4];
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = *(_QWORD *)a3 == *(_QWORD *)a2 && *(unsigned __int8 *)(a3 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v5 && (*(_BYTE *)(a3 + 56) & 1) == 0)
  {
    v20 = &v18;
    v9 = *(_QWORD *)(a3 + 16);
    v19 = *(_QWORD *)(a3 + 24);
    v10 = *(_QWORD *)(a3 + 32);
    v11 = *(_QWORD *)(a3 + 40);
    v12 = *(_QWORD *)(a3 + 48);
    v21 = v9;
    v22 = v19;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    MEMORY[0x24BDAC7A8](a1);
    v17[2] = v13;
    v17[3] = v14;
    swift_unknownObjectRetain();
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9848);
    v16 = sub_247BD4550();
    v4 = sub_247BCCC88((void (*)(char *, char *))sub_247BD7D70, (uint64_t)v17, (uint64_t)&type metadata for ASN1NodeCollection, a4, v15, v16, MEMORY[0x24BEE3F20], (uint64_t)&v26);
    j__swift_unknownObjectRelease(v9, v19, v10, v11, v12, 0);
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 109, v6);
    swift_willThrow();
  }
  return v4;
}

uint64_t sub_247BCCC88(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(char *, char *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t result;
  char *v34;
  char *v35;
  char *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v40 = a8;
  v41 = a5;
  v9 = v8;
  v53 = a4;
  v54 = a1;
  v55 = a2;
  v39 = *(_QWORD *)(a5 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = sub_247BEC8A8();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x24BDAC7A8](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = sub_247BEC7B8();
  v57 = sub_247BEC998();
  v53 = sub_247BEC9A4();
  sub_247BEC980();
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = sub_247BEC7AC();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_247BEC8B4();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      sub_247BEC98C();
      if (!--v31)
      {
        v34 = v49;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v34 = v49;
LABEL_9:
  sub_247BEC8B4();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1, AssociatedTypeWitness) == 1)
  {
    v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }
  else
  {
    v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v36 = v38;
    v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      sub_247BEC98C();
      sub_247BEC8B4();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

uint64_t static DER.sequence<A>(of:identifier:nodes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_247BCD280(a1, a2, a3, a4, a5, (uint64_t (*)(void))static DER.sequence<A>(of:identifier:rootNode:), 0xD00000000000002FLL, 0x8000000247BEEAD0, 127);
}

uint64_t static DER.set<A>(_:identifier:_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(_QWORD *)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  __int128 v10;
  __int128 v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;

  v5 = *((_BYTE *)a1 + 8);
  v6 = a1[6];
  v7 = *((_BYTE *)a1 + 56);
  v8 = *a2;
  v9 = *((_BYTE *)a2 + 8);
  v15 = *a1;
  v16 = v5;
  v10 = *((_OWORD *)a1 + 2);
  v17 = *((_OWORD *)a1 + 1);
  v18 = v10;
  v19 = v6;
  v20 = v7;
  v11 = *((_OWORD *)a1 + 5);
  v21 = *((_OWORD *)a1 + 4);
  v22 = v11;
  v13 = v8;
  v14 = v9;
  return static DER.sequence<A>(_:identifier:_:)((uint64_t)&v15, (uint64_t)&v13, a3, a4, a5);
}

uint64_t static DER.set<A>(of:identifier:nodes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_247BCD280(a1, a2, a3, a4, a5, (uint64_t (*)(void))static DER.set<A>(of:identifier:rootNode:), 0xD000000000000029, 0x8000000247BEEB00, 158);
}

uint64_t sub_247BCD280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void), uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a4;
  ASN1NodeCollection.Iterator.next()((uint64_t)v25);
  v12 = v27;
  if (v27)
  {
    v23 = v25[5];
    v24 = v25[6];
    v22 = v25[4];
    v20 = v26;
    v21 = v25[3];
    v13 = a6;
    v15 = v25[1];
    v14 = v25[2];
    v16 = v25[0];
    LOBYTE(v26) = v26 & 1;
    v17 = v13();
    sub_247BD3D8C(v16, v15, v14, v21, v22, v23, v24, v20, v12);
  }
  else
  {
    v17 = a9;
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(a7, a8, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, a9, v18);
    swift_willThrow();
  }
  return v17;
}

uint64_t static DER.set<A>(of:identifier:rootNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t *v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  _QWORD v21[4];
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v7 = *(_QWORD *)a3 == *(_QWORD *)a2 && *(unsigned __int8 *)(a3 + 8) == *(unsigned __int8 *)(a2 + 8);
  if (v7 && (*(_BYTE *)(a3 + 56) & 1) == 0)
  {
    v6 = v5;
    v13 = *(_QWORD *)(a3 + 16);
    v12 = *(_QWORD *)(a3 + 24);
    v15 = *(_QWORD *)(a3 + 32);
    v14 = *(_QWORD *)(a3 + 40);
    v16 = *(_QWORD *)(a3 + 48);
    v24 = v13;
    v25 = v12;
    v26 = v15;
    v27 = v14;
    v28 = v16;
    swift_unknownObjectRetain();
    v17 = sub_247BCD628();
    if ((v17 & 1) != 0)
    {
      v22[1] = v22;
      v24 = v13;
      v25 = v12;
      v26 = v15;
      v27 = v14;
      v28 = v16;
      MEMORY[0x24BDAC7A8](v17);
      v23 = v16;
      v21[2] = a4;
      v21[3] = a5;
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9848);
      v19 = sub_247BD4550();
      v6 = sub_247BCCC88((void (*)(char *, char *))sub_247BD4594, (uint64_t)v21, (uint64_t)&type metadata for ASN1NodeCollection, a4, v18, v19, MEMORY[0x24BEE3F20], (uint64_t)&v29);
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v23, 0);
    }
    else
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000002FLL, 0x8000000247BEEB30, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 179, v20);
      swift_willThrow();
      j__swift_unknownObjectRelease(v13, v12, v15, v14, v16, 0);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 175, v8);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_247BCD628()
{
  __int128 *v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  int64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  int64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int64_t v81;
  unint64_t v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;

  v1 = *((_QWORD *)v0 + 4);
  v2 = v0[1];
  v83 = *v0;
  v84 = v2;
  v85 = v1;
  ASN1NodeCollection.Iterator.next()((uint64_t)v75);
  v3 = v79;
  if (!v79)
  {
    swift_unknownObjectRetain();
LABEL_41:
    swift_unknownObjectRelease();
    return 1;
  }
  v4 = v75[4];
  v58 = v75[3];
  v59 = v75[2];
  v5 = v76;
  v57 = v77;
  v6 = v78;
  v7 = v78 & 1;
  v9 = *((_QWORD *)&v84 + 1);
  v8 = v84;
  v10 = *((_QWORD *)&v84 + 1) >> 1;
  if ((_QWORD)v84 == *((_QWORD *)&v84 + 1) >> 1)
  {
    swift_unknownObjectRetain();
    v11 = v57;
LABEL_40:
    j__swift_unknownObjectRelease(v59, v58, v4, v5, v11, v7);
    swift_unknownObjectRelease();
    goto LABEL_41;
  }
  v74 = v78 & 1;
  v53 = v75[1];
  v54 = v75[0];
  v55 = v80;
  v56 = v76;
  v51 = v82;
  v52 = v81;
  v12 = v83;
  swift_unknownObjectRetain();
  v48 = v6;
  sub_247BD7BAC(v54, v53, v59, v58, v4, v5, v57, v6, v3);
  v61 = v9 & 0xFFFFFFFFFFFFFFFELL;
  v60 = *((_QWORD *)&v12 + 1) + 112;
  v49 = v3;
  v50 = v4;
  v13 = v3;
  result = v55;
  v15 = v5;
  v17 = v51;
  v16 = v52;
  v18 = v59;
  v19 = v58;
  v20 = v4;
  v21 = v57;
  while (v8 < (uint64_t)(v9 >> 1))
  {
    if (v10 <= v8)
      goto LABEL_47;
    if (v9 >> 1 < v10)
      goto LABEL_48;
    v22 = *((_QWORD *)&v12 + 1) + 96 * v8;
    v23 = *(unsigned __int8 *)(v22 + 24);
    v25 = *(_QWORD *)(v22 + 32);
    v24 = *(_QWORD *)(v22 + 40);
    v26 = *(_QWORD *)(v22 + 48);
    v27 = *(_QWORD *)(v22 + 56);
    v28 = v8 + 1;
    v29 = v9 & 1;
    v72 = v15;
    v73 = v20;
    v70 = v19;
    v71 = v21;
    v69 = v18;
    v63 = v29;
    v68 = v16;
    if (*(_BYTE *)(v22 + 24))
    {
      v30 = *(_QWORD *)(v22 + 16);
      v31 = v10;
      if (v28 != v10)
      {
        v32 = (uint64_t *)(v60 + 96 * v8);
        v31 = v8 + 1;
        do
        {
          if (v31 >= v10)
          {
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
            goto LABEL_46;
          }
          if (v30 >= *v32)
            goto LABEL_17;
          v33 = v31 + 1;
          if (__OFADD__(v31, 1))
            goto LABEL_45;
          ++v31;
          v32 += 12;
        }
        while (v33 != v10);
        v31 = v10;
LABEL_17:
        if (v31 <= v8)
          goto LABEL_49;
        if (v31 < 0)
          goto LABEL_50;
      }
      v34 = v31 - v28;
      if (__OFSUB__(v31, v28))
        goto LABEL_51;
      if (v34 < 0)
        goto LABEL_52;
      v35 = v10 - v28;
      if (__OFSUB__(v10, v28))
        goto LABEL_53;
      if (!v34 || v35 < 0 || (v36 = v10, v35 >= v34))
      {
        v36 = v31;
        if (__OFADD__(v28, v34))
          goto LABEL_56;
        if (v10 < v31)
          goto LABEL_54;
      }
      if (v36 <= v8)
        goto LABEL_55;
      if (v28 != v31)
      {
        if (v28 >= v31)
          goto LABEL_57;
        v37 = (uint64_t *)(v60 + 96 * v8);
        do
        {
          v38 = *v37;
          v37 += 12;
          if (v30 >= v38)
          {
            __break(1u);
            goto LABEL_44;
          }
          --v34;
        }
        while (v34);
        if (*(_QWORD *)(*((_QWORD *)&v12 + 1) + 96 * v28 + 16) != v30 + 1)
          goto LABEL_58;
      }
      v62 = v36;
      v39 = v26;
      v40 = v13;
      v41 = result;
      v67 = v29 | (2 * v31);
      v65 = *((_QWORD *)&v12 + 1);
      v66 = swift_unknownObjectRetain();
      v64 = v28;
    }
    else
    {
      v41 = result;
      result = *(_QWORD *)(v22 + 64);
      if (!result)
        goto LABEL_59;
      v39 = *(_QWORD *)(v22 + 48);
      v40 = v13;
      v64 = *(_QWORD *)(v22 + 80);
      v65 = *(_QWORD *)(v22 + 72);
      v66 = *(_QWORD *)(v22 + 64);
      v67 = *(_QWORD *)(v22 + 88);
      swift_unknownObjectRetain();
      v30 = 0;
      v62 = v28;
    }
    v42 = v23 ^ 1u;
    swift_unknownObjectRetain();
    v43 = swift_unknownObjectRetain();
    v44 = v39;
    sub_247BD1858(v43, v24, v39, v27, v40, v41, v68, v17);
    v46 = v45;
    j__swift_unknownObjectRelease(v69, v70, v73, v72, v71, v74 & 1);
    swift_unknownObjectRelease_n();
    if ((v46 & 1) != 0)
    {
      swift_unknownObjectRelease();
      sub_247BD3D8C(v54, v53, v59, v58, v50, v56, v57, v48, v49);
      j__swift_unknownObjectRelease(v66, v65, v64, v67, v30, v42);
      swift_unknownObjectRelease();
      return 0;
    }
    v9 = v63 | v61;
    v13 = v25;
    result = v24;
    v16 = v44;
    v17 = v27;
    v8 = v62;
    v18 = v66;
    v19 = v65;
    v4 = v64;
    v20 = v64;
    v15 = v67;
    v21 = v30;
    v74 = v42;
    if (v62 == v10)
    {
      sub_247BD3D8C(v54, v53, v59, v58, v50, v56, v57, v48, v49);
      v47 = v42;
      v58 = v65;
      v59 = v66;
      v5 = v67;
      v11 = v30;
      v7 = v47;
      goto LABEL_40;
    }
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_247BCDACC(uint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t (*v16)(uint64_t *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;

  v8 = *((_BYTE *)a1 + 8);
  v10 = a1[2];
  v9 = a1[3];
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  v14 = *((unsigned __int8 *)a1 + 56);
  v18 = *a1;
  v19 = v8;
  v20 = v10;
  v21 = v9;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v15 = *((_OWORD *)a1 + 5);
  v26 = *((_OWORD *)a1 + 4);
  v27 = v15;
  v16 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8);
  j__swift_unknownObjectRetain(v10, v9, v11, v12, v13, v14);
  swift_unknownObjectRetain();
  result = v16(&v18, a2, a3);
  if (v4)
    *a4 = v4;
  return result;
}

void static DER.optionalExplicitlyTagged<A>(_:tagNumber:tagClass:_:)(__int128 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, void (*a4)(uint64_t *)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  int v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;

  v11 = *a3;
  v12 = *((_QWORD *)a1 + 4);
  v13 = a1[1];
  v68 = *a1;
  v69 = v13;
  v70 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  v14 = v64;
  if (!v64)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(a6, 1, 1, a5);
    return;
  }
  v52 = a6;
  v51 = a5;
  v15 = v56;
  v16 = v58;
  v17 = v59;
  v18 = a2;
  v20 = v60;
  v19 = v61;
  v22 = v62;
  v21 = v63;
  v50 = v18;
  v71 = v63;
  if (v56 != v18 || v11 != v57)
  {
    v54 = v62;
    v55 = v61;
    v28 = v57;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    sub_247BD3D8C(v15, v28, v16, v17, v20, v55, v54, v71, v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v52, 1, 1);
    return;
  }
  v49 = v57;
  v23 = v70;
  v24 = v69;
  *a1 = v68;
  a1[1] = v24;
  *((_QWORD *)a1 + 4) = v23;
  if ((v21 & 1) != 0)
  {
    __break(1u);
    return;
  }
  v25 = v22;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  if (!v64)
  {
    j__swift_unknownObjectRetain(v16, v17, v20, v19, v25, 0);
    j__swift_unknownObjectRetain(v16, v17, v20, v19, v25, 0);
    swift_unknownObjectRetain();
    goto LABEL_11;
  }
  v44 = v64;
  v40 = v56;
  v41 = v58;
  v42 = v57;
  v43 = v59;
  v45 = v60;
  v46 = v61;
  v47 = v62;
  v48 = v63;
  v38 = v66;
  v39 = v65;
  v37 = v67;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v56);
  v26 = v56;
  v35 = v58;
  v36 = v57;
  v33 = v60;
  v34 = v59;
  v31 = v62;
  v32 = v61;
  v27 = v64;
  v30 = v63;
  j__swift_unknownObjectRetain(v16, v17, v20, v19, v25, 0);
  j__swift_unknownObjectRetain(v16, v17, v20, v19, v25, 0);
  swift_unknownObjectRetain();
  sub_247BD3D8C(v26, v36, v35, v34, v33, v32, v31, v30, v27);
  if (v27)
  {
    sub_247BD3D8C(v40, v42, v41, v43, v45, v46, v47, v48, v44);
LABEL_11:
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000041, 0x8000000247BEEB60, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 222, v29);
    swift_willThrow();
    j__swift_unknownObjectRelease(v16, v17, v20, v19, v25, 0);
    sub_247BD3D8C(v50, v49, v16, v17, v20, v19, v25, v71, v14);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return;
  }
  v56 = v40;
  LOBYTE(v57) = v42;
  v58 = v41;
  v59 = v43;
  v60 = v45;
  v61 = v46;
  v62 = v47;
  LOBYTE(v63) = v48 & 1;
  v64 = v44;
  v65 = v39;
  v66 = v38;
  v67 = v37;
  a4(&v56);
  j__swift_unknownObjectRelease(v16, v17, v20, v19, v25, 0);
  sub_247BD3D8C(v50, v49, v16, v17, v20, v19, v25, v71, v14);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_247BD3D8C(v40, v42, v41, v43, v45, v46, v47, v48, v44);
  if (!v6)
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v52, 0, 1, v51);
}

uint64_t static DER.optionalImplicitlyTagged<A>(_:tag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  char v19;
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
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v10 = *(_QWORD *)a2;
  v11 = *(unsigned __int8 *)(a2 + 8);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 16);
  v34 = *(_OWORD *)a1;
  v35 = v13;
  v36 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v25);
  v14 = v33;
  if (v33)
  {
    v37 = a5;
    v16 = v25;
    v15 = v26;
    v23 = v28;
    v24 = v27;
    v21 = v30;
    v22 = v29;
    v19 = v32;
    v20 = v31;
    if (v25 == v10 && v11 == v26)
    {
      v25 = v10;
      LOBYTE(v26) = v11;
      swift_unknownObjectRetain();
      a5 = v37;
      DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(a1, &v25, a3, a4);
      swift_unknownObjectRelease();
      result = sub_247BD3D8C(v10, v15, v24, v23, v22, v21, v20, v19, v14);
      if (v5)
        return result;
      v18 = 0;
    }
    else
    {
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_247BD3D8C(v16, v15, v24, v23, v22, v21, v20, v19, v14);
      v18 = 1;
      a5 = v37;
    }
  }
  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v18 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, v18, 1, a3);
}

uint64_t DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  ASN1NodeCollection.Iterator.next()((uint64_t)&v12);
  if (v14)
  {
    LOBYTE(v13) = v13 & 1;
    v10 = v6;
    v11 = v7;
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a4 + 32))(&v12, &v10, a3, a4);
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000002ALL, 0x8000000247BEEBB0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1107, v9);
    return swift_willThrow();
  }
}

{
  uint64_t v4;
  uint64_t v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;

  v7 = *a2;
  v8 = *((_BYTE *)a2 + 8);
  static DER.parse(_:)(a1, a1 + 32, 0, (2 * *(_QWORD *)(a1 + 16)) | 1, (uint64_t)&v20);
  result = swift_bridgeObjectRelease();
  if (!v4)
  {
    v12 = v20;
    v13 = v21;
    v14 = v22;
    v15 = v23;
    v16 = v24;
    v17 = v25;
    v18 = v26;
    v19 = v27;
    v10 = v7;
    v11 = v8;
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a4 + 32))(&v12, &v10, a3, a4);
  }
  return result;
}

uint64_t static DER.optionalImplicitlyTagged<A>(_:tagNumber:tagClass:_:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, void (*a4)(uint64_t *)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  int v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
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
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;

  v12 = *a3;
  v13 = *((_QWORD *)a1 + 4);
  v14 = a1[1];
  v55 = *a1;
  v56 = v14;
  v57 = v13;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v43);
  v15 = v51;
  if (v51)
  {
    v37 = a4;
    v58 = a6;
    v38 = a5;
    v17 = v43;
    v16 = v44;
    v19 = v45;
    v18 = v46;
    v21 = v47;
    v20 = v48;
    v23 = v49;
    v22 = v50;
    v25 = v52;
    v24 = v53;
    v26 = v54;
    v40 = v49;
    v41 = v50;
    v39 = v48;
    if (v43 == a2 && v12 == v44)
    {
      v27 = v57;
      v28 = v56;
      *a1 = v55;
      a1[1] = v28;
      *((_QWORD *)a1 + 4) = v27;
      v43 = a2;
      LOBYTE(v44) = v12;
      v45 = v19;
      v46 = v18;
      v47 = v21;
      v48 = v20;
      v49 = v23;
      LOBYTE(v50) = v22 & 1;
      v51 = v15;
      v52 = v25;
      v53 = v24;
      v54 = v26;
      v42 = v21;
      v35 = v19;
      v36 = v18;
      v29 = v16;
      swift_unknownObjectRetain();
      v37(&v43);
      swift_unknownObjectRelease();
      result = sub_247BD3D8C(a2, v29, v35, v36, v42, v39, v40, v41, v15);
      if (v6)
        return result;
      v31 = 0;
    }
    else
    {
      v32 = v47;
      v33 = v46;
      v34 = v44;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_247BD3D8C(v17, v34, v19, v33, v32, v39, v40, v41, v15);
      v31 = 1;
    }
    a5 = v38;
    a6 = v58;
  }
  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v31 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(a6, v31, 1, a5);
}

uint64_t static DER.decodeDefault<A>(_:identifier:defaultValue:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void (*a3)(uint64_t *)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t *);
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
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
  void (*v56)(uint64_t *);
  char *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
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
  void (*v71)(_QWORD);
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;

  v53 = a6;
  v55 = a4;
  v56 = a3;
  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v57 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)v14;
  v16 = *(unsigned __int8 *)(v14 + 8);
  v17 = *(_QWORD *)(v12 + 32);
  v18 = *(_OWORD *)(v12 + 16);
  v60 = *(_OWORD *)v12;
  v73 = v60;
  v74 = v18;
  v75 = v17;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v61);
  v19 = v69;
  if (v69)
  {
    v51 = a2;
    v52 = a5;
    v50 = v11;
    v49 = a7;
    v20 = v61;
    v21 = v62;
    v22 = v65;
    v58 = v63;
    v59 = v64;
    v24 = v66;
    v23 = v67;
    v25 = v68;
    v27 = v70;
    v26 = v71;
    v28 = v72;
    v54 = v67;
    if (v61 == v15 && v16 == v62)
    {
      v46 = v62;
      v29 = v75;
      v30 = v74;
      *(_OWORD *)a1 = v73;
      *(_OWORD *)(a1 + 16) = v30;
      *(_QWORD *)(a1 + 32) = v29;
      v61 = v15;
      LOBYTE(v62) = v16;
      v63 = v58;
      v64 = v59;
      v65 = v22;
      v66 = v24;
      v67 = v23;
      LOBYTE(v68) = v25 & 1;
      v69 = v19;
      v70 = v27;
      v71 = v26;
      v72 = v28;
      v31 = v15;
      *(_QWORD *)&v60 = v25;
      v48 = v24;
      v47 = v22;
      v32 = v27;
      v33 = (void (*)(uint64_t *))v26;
      v34 = v28;
      swift_unknownObjectRetain();
      v35 = v57;
      v36 = v76;
      v56(&v61);
      if (v36)
      {
        swift_unknownObjectRelease();
        return sub_247BD3D8C(v31, v46, v58, v59, v47, v48, v54, v60, v19);
      }
      else
      {
        v45 = v31;
        v55 = v34;
        v56 = v33;
        v76 = v32;
        v41 = v60;
        v42 = v52;
        if ((sub_247BEC770() & 1) != 0)
        {
          sub_247BD3D44();
          swift_allocError();
          static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000047, 0x8000000247BEEBE0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 323, v43);
          swift_willThrow();
          sub_247BD3D8C(v45, v46, v58, v59, v47, v48, v54, v41, v19);
          (*(void (**)(char *, uint64_t))(v50 + 8))(v35, v42);
          return swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
          sub_247BD3D8C(v45, v46, v58, v59, v47, v48, v54, v41, v19);
          return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v50 + 32))(v49, v35, v42);
        }
      }
    }
    else
    {
      v38 = v68;
      v39 = v66;
      v40 = v65;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      sub_247BD3D8C(v20, v21, v58, v59, v40, v39, v54, v38, v19);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v49, v51, v52);
    }
  }
  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a7, a2, a5);
  }
}

uint64_t static DER.decodeDefault<A>(_:identifier:defaultValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v7;
  _QWORD v9[7];
  char v10;

  v7 = *(_BYTE *)(a2 + 8);
  v9[6] = *(_QWORD *)a2;
  v10 = v7;
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = a6;
  return static DER.decodeDefault<A>(_:identifier:defaultValue:_:)(a1, a3, (void (*)(uint64_t *))sub_247BD45B4, (uint64_t)v9, a4, a5, a7);
}

uint64_t static DER.decodeDefault<A>(_:defaultValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v14;
  char v15;
  _BYTE v16[16];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 24))(&v14, a3, a5);
  v12 = *(_QWORD *)(a5 + 8);
  v20 = v14;
  v21 = v15;
  v17 = a3;
  v18 = a4;
  v19 = v12;
  return static DER.decodeDefault<A>(_:identifier:defaultValue:_:)(a1, a2, (void (*)(uint64_t *))sub_247BD45B4, (uint64_t)v16, a3, a4, a6);
}

void static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:_:)(__int128 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t *)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;

  v31 = a6;
  v27 = a8;
  v28 = a9;
  v29 = a4;
  v14 = sub_247BEC8A8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v27 - v17;
  v30 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = *a3;
  v21 = v32;
  static DER.optionalExplicitlyTagged<A>(_:tagNumber:tagClass:_:)(a1, a2, &v33, a5, a7, (uint64_t)v18);
  if (!v21)
  {
    v23 = v28;
    v22 = v29;
    v24 = v30;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v18, 1, a7) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v23, v22, a7);
    }
    else
    {
      v25 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
      v25(v20, v18, a7);
      if ((sub_247BEC770() & 1) != 0)
      {
        sub_247BD3D44();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000051, 0x8000000247BEEC30, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 377, v26);
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v20, a7);
      }
      else
      {
        v25(v23, v20, a7);
      }
    }
  }
}

void static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:)(__int128 *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  _BYTE v8[16];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v12 = *a3;
  v9 = a5;
  v10 = a6;
  v11 = a7;
  static DER.decodeDefaultExplicitlyTagged<A>(_:tagNumber:tagClass:defaultValue:_:)(a1, a2, &v12, a4, (void (*)(uint64_t *))sub_247BD7D98, (uint64_t)v8, a5, a6, a8);
}

uint64_t sub_247BCED58(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t (*v14)(uint64_t *, uint64_t, uint64_t);
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;

  v6 = *((_BYTE *)a1 + 8);
  v8 = a1[2];
  v7 = a1[3];
  v9 = a1[4];
  v10 = a1[5];
  v11 = a1[6];
  v12 = *((unsigned __int8 *)a1 + 56);
  v16 = *a1;
  v17 = v6;
  v18 = v8;
  v19 = v7;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v13 = *((_OWORD *)a1 + 5);
  v24 = *((_OWORD *)a1 + 4);
  v25 = v13;
  v14 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  j__swift_unknownObjectRetain(v8, v7, v9, v10, v11, v12);
  swift_unknownObjectRetain();
  return v14(&v16, a2, a4);
}

uint64_t static DER.explicitlyTagged<A>(_:tagNumber:tagClass:_:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void (*a4)(uint64_t *))
{
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;

  v6 = *a3;
  ASN1NodeCollection.Iterator.next()((uint64_t)v20);
  v7 = v22;
  if (v22)
  {
    v18 = v20[5];
    v19 = v20[6];
    v16 = v21;
    v17 = v20[4];
    v9 = v20[2];
    v8 = v20[3];
    v10 = a4;
    v11 = a2;
    v13 = v20[0];
    v12 = v20[1];
    LOBYTE(v21) = v21 & 1;
    v23 = v6;
    static DER.explicitlyTagged<A>(_:tagNumber:tagClass:_:)((uint64_t)v20, v11, &v23, v10);
    return sub_247BD3D8C(v13, v12, v9, v8, v17, v18, v19, v16, v7);
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000040, 0x8000000247BEEC90, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 423, v15);
    return swift_willThrow();
  }
}

{
  uint64_t *v5;
  uint64_t *v6;
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
  uint64_t *v21;
  uint64_t v22;
  char v23;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
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
  uint64_t v58;
  uint64_t v59;

  if (*(_QWORD *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != *a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 442, v5);
    return swift_willThrow();
  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001DLL, 0x8000000247BEECE0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 447, v6);
    return swift_willThrow();
  }
  v9 = *(_QWORD *)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v59 = *(_QWORD *)(a1 + 16);
  v54 = v59;
  v55 = v9;
  v56 = v11;
  v57 = v10;
  v58 = v12;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v42);
  if (!v50)
  {
    v20 = v59;
    j__swift_unknownObjectRetain(v59, v9, v11, v10, v12, 0);
    j__swift_unknownObjectRetain(v20, v9, v11, v10, v12, 0);
    v14 = v10;
    goto LABEL_13;
  }
  v37 = v50;
  v33 = v42;
  v34 = v44;
  v35 = v43;
  v36 = v45;
  v38 = v46;
  v39 = v47;
  v40 = v48;
  v41 = v49;
  v31 = v52;
  v32 = v51;
  v22 = v53;
  ASN1NodeCollection.Iterator.next()((uint64_t)&v42);
  v29 = v43;
  v30 = v42;
  v27 = v45;
  v28 = v44;
  v25 = v47;
  v26 = v46;
  v13 = v50;
  v23 = v49;
  v24 = v48;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  v17 = v9;
  v18 = v59;
  j__swift_unknownObjectRetain(v59, v17, v16, v14, v15, 0);
  v19 = v18;
  v9 = v17;
  v11 = v16;
  v12 = v15;
  j__swift_unknownObjectRetain(v19, v9, v11, v14, v15, 0);
  sub_247BD3D8C(v30, v29, v28, v27, v26, v25, v24, v23, v13);
  if (v13)
  {
    sub_247BD3D8C(v33, v35, v34, v36, v38, v39, v40, v41, v37);
    v20 = v59;
LABEL_13:
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000033, 0x8000000247BEED00, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 452, v21);
    swift_willThrow();
    j__swift_unknownObjectRelease(v20, v9, v11, v14, v12, 0);
    return swift_unknownObjectRelease();
  }
  v42 = v33;
  LOBYTE(v43) = v35;
  v44 = v34;
  v45 = v36;
  v46 = v38;
  v47 = v39;
  v48 = v40;
  LOBYTE(v49) = v41 & 1;
  v50 = v37;
  v51 = v32;
  v52 = v31;
  v53 = v22;
  a4(&v42);
  swift_unknownObjectRelease();
  j__swift_unknownObjectRelease(v59, v9, v11, v14, v15, 0);
  return sub_247BD3D8C(v33, v35, v34, v36, v38, v39, v40, v41, v37);
}

uint64_t sub_247BCF384(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t *v7;
  char *v8;
  uint64_t v9[2];
  uint64_t v10;
  unint64_t v11;

  v9[0] = a1;
  v9[1] = a2;
  v10 = a3;
  v11 = a4;
  swift_unknownObjectRetain();
  v8 = sub_247BD4080(0, 16, 0, MEMORY[0x24BEE4AF8]);
  result = sub_247BCF4AC(v9, 1, &v8);
  if (v4)
    goto LABEL_6;
  if (!__OFSUB__(v11 >> 1, v10))
  {
    if (v11 >> 1 == v10)
    {
      v5 = v8;
      swift_unknownObjectRelease();
      return (uint64_t)v5;
    }
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000021, 0x8000000247BEEDA0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 479, v7);
    swift_willThrow();
LABEL_6:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_247BCF4AC(uint64_t *a1, uint64_t a2, char **a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int16 v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t result;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  int64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;

  if (a2 > 50)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000021, 0x8000000247BEEE20, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 490, v4);
    return swift_willThrow();
  }
  v7 = a1;
  v8 = *a1;
  v9 = a1[1];
  v10 = a1[2];
  v11 = a1[3];
  v12 = sub_247BE8330();
  if ((v12 & 0x100) != 0)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 496, v21);
    return swift_willThrow();
  }
  v64 = v9;
  v13 = v12;
  v14 = v12 & 0x1F;
  if ((_DWORD)v14 == 31)
  {
    swift_unknownObjectRetain();
    sub_247BE26E0();
    if (v3)
      return swift_unknownObjectRelease();
    v14 = v15;
    if (v15 <= 0x1E)
    {
      sub_247BD3D44();
      swift_allocError();
      v16 = 0xD00000000000002BLL;
      v18 = v17;
      v19 = 0x8000000247BEEDF0;
      v20 = 510;
LABEL_26:
      static ASN1Error.invalidASN1Object(reason:file:line:)(v16, v19, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, v20, v18);
      goto LABEL_27;
    }
  }
  else
  {
    swift_unknownObjectRetain();
  }
  sub_247BCFA20();
  if (v3)
    return swift_unknownObjectRelease();
  if ((v24 & 1) != 0)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 518, v39);
LABEL_27:
    swift_willThrow();
    return swift_unknownObjectRelease();
  }
  if (v23 < 0)
  {
    sub_247BD3D44();
    swift_allocError();
    v18 = v40;
    v16 = 0xD000000000000018;
    v19 = 0x8000000247BEEDD0;
    v20 = 523;
    goto LABEL_26;
  }
  v60 = *v7;
  v54 = v7[2];
  v55 = v7[1];
  v52 = v10;
  v53 = v7[3];
  v25 = v23;
  v26 = sub_247BCFCA0(v23, *v7, v55, v54, v53);
  v58 = v28;
  v59 = v27;
  v56 = v26;
  v57 = v25;
  v61[0] = v26;
  v61[1] = v29;
  v51 = v29;
  v62 = v27;
  v63 = v28;
  *v7 = sub_247BCFD1C(v25, v60, v55, v54, v53);
  v7[1] = v30;
  v7[2] = v31;
  v7[3] = v32;
  v33 = v58 >> 1;
  if (__OFSUB__(v58 >> 1, v59))
    goto LABEL_41;
  v25 = v52;
  if ((v58 >> 1) - v59 != v57)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.truncatedASN1Field(file:line:)((uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 530, v41);
    swift_unknownObjectRetain();
    swift_willThrow();
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  if (v33 < v52)
    goto LABEL_42;
  if ((uint64_t)(v11 >> 1) < v52)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v11 >> 1 < v33)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v55 = v58 & 0xFFFFFFFFFFFFFFFELL | v11 & 1;
  if ((v13 & 0x20) != 0)
  {
    v42 = *a3;
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v42 = sub_247BD4080(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
    v44 = *((_QWORD *)v42 + 2);
    v43 = *((_QWORD *)v42 + 3);
    v45 = v44 + 1;
    v46 = v57;
    if (v44 >= v43 >> 1)
    {
      v50 = sub_247BD4080((char *)(v43 > 1), v44 + 1, 1, v42);
      v45 = v44 + 1;
      v42 = v50;
      v46 = v57;
    }
    *((_QWORD *)v42 + 2) = v45;
    v47 = &v42[96 * v44];
    *((_QWORD *)v47 + 4) = v14;
    v47[40] = v13 >> 6;
    *((_QWORD *)v47 + 6) = a2;
    v47[56] = 1;
    v48 = v64;
    *((_QWORD *)v47 + 8) = v8;
    *((_QWORD *)v47 + 9) = v48;
    *((_QWORD *)v47 + 10) = v52;
    *((_QWORD *)v47 + 11) = v55;
    *((_OWORD *)v47 + 6) = 0u;
    *((_OWORD *)v47 + 7) = 0u;
    *a3 = v42;
    if (!v46)
    {
      swift_unknownObjectRelease_n();
      return swift_unknownObjectRelease();
    }
    v7 = (uint64_t *)(a2 + 1);
    while (1)
    {
      sub_247BCF4AC(v61, a2 + 1, a3);
      if (__OFSUB__(v63 >> 1, v62))
        break;
      if ((uint64_t)((v63 >> 1) - v62) <= 0)
      {
        swift_unknownObjectRelease_n();
        return swift_unknownObjectRelease();
      }
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v7 = (uint64_t *)*a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_45:
    v7 = (uint64_t *)sub_247BD4080(0, v7[2] + 1, 1, (char *)v7);
  v35 = v7[2];
  v34 = v7[3];
  v36 = v35 + 1;
  if (v35 >= v34 >> 1)
  {
    v49 = sub_247BD4080((char *)(v34 > 1), v35 + 1, 1, (char *)v7);
    v36 = v35 + 1;
    v7 = (uint64_t *)v49;
  }
  v7[2] = v36;
  v37 = &v7[12 * v35];
  v37[4] = v14;
  *((_BYTE *)v37 + 40) = v13 >> 6;
  v37[6] = a2;
  *((_BYTE *)v37 + 56) = 0;
  v38 = v64;
  v37[8] = v8;
  v37[9] = v38;
  v37[10] = v25;
  v37[11] = v55;
  v37[12] = v56;
  v37[13] = v51;
  v37[14] = v59;
  v37[15] = v58;
  swift_unknownObjectRelease();
  result = swift_unknownObjectRelease();
  *a3 = (char *)v7;
  return result;
}

void sub_247BCFA20()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int64_t v8;
  uint64_t *v9;
  BOOL v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v3 >> 1;
  if (v2 == v3 >> 1)
    return;
  if (v2 >= v4)
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = *v0;
  v6 = v0[1];
  v7 = *(unsigned __int8 *)(v6 + v2);
  v8 = v2 + 1;
  v0[2] = v2 + 1;
  if (v7 == 128)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unsupportedFieldLength(reason:file:line:)(0xD000000000000035, 0x8000000247BEEEE0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1149, v9);
    swift_willThrow();
    return;
  }
  if ((v7 & 0x80) != 0)
  {
    v10 = __OFSUB__(v4, v8);
    v11 = v4 - v8;
    if (!v10)
    {
      v12 = v7 & 0x7F;
      if (v11 < (uint64_t)v12)
        return;
      sub_247BCFCA0(v7 & 0x7F, v5, v6, v2 + 1, v3);
      v29 = v13;
      v15 = v14;
      v28 = v16;
      *v0 = sub_247BCFD1C(v12, v5, v6, v8, v3);
      v0[1] = v17;
      v0[2] = v18;
      v0[3] = v19;
      swift_unknownObjectRetain();
      v20 = swift_unknownObjectRetain();
      sub_247BD7DB0(v20, v29, v15, v28);
      if (!v1)
      {
        if (v21 <= 0x7F)
        {
          sub_247BD3D44();
          swift_allocError();
          v24 = 0xD00000000000004FLL;
          v23 = v27;
          v25 = 0x8000000247BEEE50;
          v26 = 1168;
        }
        else
        {
          if (v12 <= (71 - __clz(v21)) >> 3)
            goto LABEL_15;
          sub_247BD3D44();
          swift_allocError();
          v23 = v22;
          v24 = 0xD000000000000031;
          v25 = 0x8000000247BEEEA0;
          v26 = 1173;
        }
        static ASN1Error.unsupportedFieldLength(reason:file:line:)(v24, v25, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, v26, v23);
        swift_willThrow();
      }
LABEL_15:
      swift_unknownObjectRelease();
      return;
    }
LABEL_18:
    __break(1u);
  }
}

uint64_t sub_247BCFCA0(uint64_t result, uint64_t a2, uint64_t a3, int64_t a4, unint64_t a5)
{
  int64_t v5;
  uint64_t v6;
  int64_t v7;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  v5 = a5 >> 1;
  v6 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!result || v6 < 0 || (v7 = a5 >> 1, v6 >= result))
  {
    v7 = a4 + result;
    if (__OFADD__(a4, result))
      goto LABEL_18;
  }
  if (v7 < a4)
    goto LABEL_14;
  if (v5 < a4)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v5 >= v7)
  {
    if ((v7 & 0x8000000000000000) == 0)
      return a2;
    goto LABEL_17;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_247BCFD1C(uint64_t result, uint64_t a2, uint64_t a3, int64_t a4, unint64_t a5)
{
  int64_t v5;
  uint64_t v6;
  int64_t v7;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  v5 = a5 >> 1;
  v6 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (result)
  {
    if ((v6 & 0x8000000000000000) == 0)
    {
      v7 = a5 >> 1;
      if (v6 < result)
      {
LABEL_8:
        if (v7 >= a4)
        {
          if (v5 >= a4)
            return a2;
          goto LABEL_15;
        }
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
  }
  v7 = a4 + result;
  if (!__OFADD__(a4, result))
  {
    if (v5 >= v7)
      goto LABEL_8;
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_247BCFD8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE v5[72];

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  sub_247BD53D0((uint64_t)v5, v1, v2, v3);
  return sub_247BECA7C();
}

uint64_t sub_247BCFDE4(uint64_t a1)
{
  uint64_t v1;

  return sub_247BD53D0(a1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_247BCFDF0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE v5[72];

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  sub_247BD53D0((uint64_t)v5, v1, v2, v3);
  return sub_247BECA7C();
}

uint64_t sub_247BCFE44(uint64_t a1, uint64_t a2)
{
  return sub_247BD45D0(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t static DER.parse(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1 + 32;
  v4 = (2 * *(_QWORD *)(a1 + 16)) | 1;
  v5 = swift_bridgeObjectRetain();
  static DER.parse(_:)(v5, v3, 0, v4, a2);
  return swift_bridgeObjectRelease();
}

uint64_t static DER.parse(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  char v35;
  BOOL v36;
  unint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  _QWORD v42[3];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[2];
  _BYTE v49[32];
  _QWORD v50[5];
  int v51;

  result = sub_247BCF384(a1, a2, a3, a4);
  if (!v5)
  {
    v11 = v10;
    v12 = v10 >> 1;
    if (v9 == v10 >> 1)
    {
      __break(1u);
    }
    else if (v9 < (uint64_t)(v10 >> 1))
    {
      v13 = result;
      v14 = v8;
      v15 = (__int128 *)(v8 + 96 * v9);
      v16 = v15[1];
      v44 = *v15;
      v45 = v16;
      v17 = v15[2];
      v18 = v15[3];
      v19 = v15[5];
      v48[0] = v15[4];
      v48[1] = v19;
      v46 = v17;
      v47 = v18;
      v20 = v9 + 1;
      v51 = BYTE8(v45);
      if ((BYTE8(v45) & 1) != 0)
      {
        sub_247BD5538(result, v8, v9 + 1, v10, (uint64_t)&v44);
        v41 = v29;
        result = (v28 >> 1) - v27;
        if (__OFSUB__(v28 >> 1, v27))
        {
LABEL_17:
          __break(1u);
          goto LABEL_18;
        }
        v30 = v26;
        v31 = v27;
        v32 = v28;
        sub_247BCFD1C(result, v13, v14, v20, v11);
        v37 = v33;
        v20 = v34;
        sub_247BD00DC(v41, v30, v31, v32, v45, v42);
        v21 = v42[0];
        v39 = v42[1];
        v22 = v42[2];
        v38 = v43;
        v40 = v46;
        v24 = *((_QWORD *)&v47 + 1);
        v25 = v47;
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        result = swift_unknownObjectRelease();
        v12 = v37 >> 1;
      }
      else
      {
        sub_247BD3DDC((uint64_t)v48, (uint64_t)v49);
        result = sub_247BD3DDC((uint64_t)v49, (uint64_t)v50);
        v21 = v50[0];
        if (!v50[0])
        {
LABEL_18:
          __break(1u);
          return result;
        }
        v22 = v50[2];
        v39 = v50[1];
        *((_QWORD *)&v23 + 1) = *((_QWORD *)&v46 + 1);
        v40 = v46;
        v24 = *((_QWORD *)&v47 + 1);
        v25 = v47;
        *(_QWORD *)&v23 = v50[3];
        v38 = v23;
        sub_247BD3E64((uint64_t)v49);
        swift_unknownObjectRetain();
        result = swift_unknownObjectRelease();
      }
      if (!__OFSUB__(v12, v20))
      {
        if (v12 == v20)
        {
          v35 = BYTE8(v44);
          v36 = (v51 & 1) == 0;
          *(_QWORD *)a5 = v44;
          *(_BYTE *)(a5 + 8) = v35;
          *(_QWORD *)(a5 + 16) = v21;
          *(_QWORD *)(a5 + 24) = v39;
          *(_QWORD *)(a5 + 32) = v22;
          *(_OWORD *)(a5 + 40) = v38;
          *(_BYTE *)(a5 + 56) = v36;
          *(_OWORD *)(a5 + 64) = v40;
          *(_QWORD *)(a5 + 80) = v25;
          *(_QWORD *)(a5 + 88) = v24;
          return result;
        }
        goto LABEL_16;
      }
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    __break(1u);
    goto LABEL_15;
  }
  return result;
}

uint64_t sub_247BD00DC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  int64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v6 = a4 >> 1;
  if (a4 >> 1 == a3)
  {
LABEL_7:
    *a6 = result;
    a6[1] = a2;
    a6[2] = a3;
    a6[3] = a4;
    a6[4] = a5;
  }
  else
  {
    v7 = (_QWORD *)(a2 + 96 * a3 + 16);
    v8 = a3;
    do
    {
      if (v8 >= v6)
      {
        __break(1u);
LABEL_9:
        __break(1u);
        goto LABEL_10;
      }
      if (*v7 <= a5)
        goto LABEL_9;
      ++v8;
      v7 += 12;
    }
    while (v6 != v8);
    if (*(_QWORD *)(a2 + 96 * a3 + 16) == a5 + 1)
      goto LABEL_7;
LABEL_10:
    __break(1u);
  }
  return result;
}

uint64_t ASN1NodeCollection.hash(into:)(uint64_t a1)
{
  uint64_t v1;

  sub_247BD53D0(a1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
  return sub_247BECA58();
}

uint64_t static ASN1NodeCollection.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a2[4];
  return sub_247BD45D0(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1NodeCollection.hashValue.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE v5[72];

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  sub_247BD53D0((uint64_t)v5, v1, v2, v3);
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BD0230()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE v5[72];

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  sub_247BD53D0((uint64_t)v5, v1, v2, v3);
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BD029C(uint64_t a1)
{
  uint64_t v1;

  sub_247BD53D0(a1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
  return sub_247BECA58();
}

uint64_t sub_247BD02D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE v5[72];

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  sub_247BD53D0((uint64_t)v5, v1, v2, v3);
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BD0338(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a2[4];
  return sub_247BD45D0(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

__n128 sub_247BD037C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = *(_QWORD *)(v1 + 32);
  result = *(__n128 *)v1;
  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v2;
  return result;
}

uint64_t sub_247BD0390()
{
  return 0;
}

uint64_t sub_247BD0398()
{
  return 2;
}

char *sub_247BD03A0()
{
  uint64_t v0;
  __int128 v1;
  char *v2;
  _OWORD v4[2];
  uint64_t v5;

  v1 = *(_OWORD *)(v0 + 16);
  v4[0] = *(_OWORD *)v0;
  v4[1] = v1;
  v5 = *(_QWORD *)(v0 + 32);
  v2 = sub_247BDDFB0((char *)v4);
  sub_247BD79DC((uint64_t)v4);
  return v2;
}

uint64_t sub_247BD03E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247BE150C(a1, a2, a3);
}

uint64_t sub_247BD0420()
{
  return sub_247BEC7D0();
}

void ASN1Node.identifier.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t ASN1Node.identifier.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = v2;
  return result;
}

uint64_t (*ASN1Node.identifier.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 48);
  v6 = *(_BYTE *)(v1 + 56);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  return j__swift_unknownObjectRetain();
}

__n128 ASN1Node.content.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  __n128 result;
  __n128 v5;
  __int128 v6;

  v5 = (__n128)a1[1];
  v6 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_BYTE *)a1 + 40);
  j__swift_unknownObjectRelease(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(unsigned __int8 *)(v1 + 56));
  result = v5;
  *(_OWORD *)(v1 + 16) = v6;
  *(__n128 *)(v1 + 32) = v5;
  *(_QWORD *)(v1 + 48) = v2;
  *(_BYTE *)(v1 + 56) = v3;
  return result;
}

uint64_t (*ASN1Node.content.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.encodedBytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t ASN1Node.encodedBytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t result;

  result = swift_unknownObjectRelease();
  v4[8] = a1;
  v4[9] = a2;
  v4[10] = a3;
  v4[11] = a4;
  return result;
}

uint64_t (*ASN1Node.encodedBytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1Node.hash(into:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v3 = v1[9];
  v4 = v1[10];
  v5 = v1[11];
  sub_247BECA58();
  sub_247BECA58();
  ASN1Node.Content.hash(into:)(a1);
  v6 = v5 >> 1;
  result = (v5 >> 1) - v4;
  if (__OFSUB__(v5 >> 1, v4))
  {
    __break(1u);
    goto LABEL_8;
  }
  result = sub_247BECA58();
  v8 = __OFSUB__(v6, v4);
  v9 = v6 - v4;
  if (!v9)
    return result;
  if ((v9 < 0) ^ v8 | (v9 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v10 = v3 + v4;
  do
  {
    ++v10;
    result = sub_247BECA64();
    --v9;
  }
  while (v9);
  return result;
}

uint64_t ASN1Node.hashValue.getter()
{
  uint64_t *v0;
  char v1;
  uint64_t v2;
  char v3;
  __int128 v4;
  __int128 v5;
  _BYTE v7[72];
  uint64_t v8;
  char v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;

  v1 = *((_BYTE *)v0 + 8);
  v2 = v0[6];
  v3 = *((_BYTE *)v0 + 56);
  v8 = *v0;
  v9 = v1;
  v4 = *((_OWORD *)v0 + 2);
  v10 = *((_OWORD *)v0 + 1);
  v11 = v4;
  v12 = v2;
  v13 = v3;
  v5 = *((_OWORD *)v0 + 5);
  v14 = *((_OWORD *)v0 + 4);
  v15 = v5;
  sub_247BECA4C();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_247BECA7C();
}

uint64_t sub_247BD06F0()
{
  uint64_t *v0;
  char v1;
  uint64_t v2;
  char v3;
  __int128 v4;
  __int128 v5;
  _BYTE v7[72];
  uint64_t v8;
  char v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;

  v1 = *((_BYTE *)v0 + 8);
  v2 = v0[6];
  v3 = *((_BYTE *)v0 + 56);
  v8 = *v0;
  v9 = v1;
  v4 = *((_OWORD *)v0 + 2);
  v10 = *((_OWORD *)v0 + 1);
  v11 = v4;
  v12 = v2;
  v13 = v3;
  v5 = *((_OWORD *)v0 + 5);
  v14 = *((_OWORD *)v0 + 4);
  v15 = v5;
  sub_247BECA4C();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_247BECA7C();
}

uint64_t sub_247BD0768()
{
  uint64_t *v0;
  char v1;
  uint64_t v2;
  char v3;
  __int128 v4;
  __int128 v5;
  _BYTE v7[72];
  uint64_t v8;
  char v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;

  v1 = *((_BYTE *)v0 + 8);
  v2 = v0[6];
  v3 = *((_BYTE *)v0 + 56);
  v8 = *v0;
  v9 = v1;
  v4 = *((_OWORD *)v0 + 2);
  v10 = *((_OWORD *)v0 + 1);
  v11 = v4;
  v12 = v2;
  v13 = v3;
  v5 = *((_OWORD *)v0 + 5);
  v14 = *((_OWORD *)v0 + 4);
  v15 = v5;
  sub_247BECA4C();
  ASN1Node.hash(into:)((uint64_t)v7);
  return sub_247BECA7C();
}

uint64_t ASN1Node.Content.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 8);
  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  if ((*(_BYTE *)(v2 + 40) & 1) == 0)
  {
    sub_247BECA58();
    sub_247BD53D0(a1, v4, v5, v6);
    return sub_247BECA58();
  }
  sub_247BECA58();
  v7 = v6 >> 1;
  result = v7 - v5;
  if (__OFSUB__(v7, v5))
  {
    __break(1u);
    goto LABEL_11;
  }
  result = sub_247BECA58();
  v9 = __OFSUB__(v7, v5);
  v10 = v7 - v5;
  if (!v10)
    return result;
  if ((v10 < 0) ^ v9 | (v10 == 0))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v11 = v4 + v5;
  do
  {
    ++v11;
    result = sub_247BECA64();
    --v10;
  }
  while (v10);
  return result;
}

uint64_t ASN1Node.Content.hashValue.getter()
{
  __int128 *v0;
  uint64_t v1;
  char v2;
  __int128 v3;
  _BYTE v5[72];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  v1 = *((_QWORD *)v0 + 4);
  v2 = *((_BYTE *)v0 + 40);
  v3 = v0[1];
  v6 = *v0;
  v7 = v3;
  v8 = v1;
  v9 = v2;
  sub_247BECA4C();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_247BECA7C();
}

uint64_t sub_247BD08E0()
{
  __int128 *v0;
  uint64_t v1;
  char v2;
  __int128 v3;
  _BYTE v5[72];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  v1 = *((_QWORD *)v0 + 4);
  v2 = *((_BYTE *)v0 + 40);
  v3 = v0[1];
  v6 = *v0;
  v7 = v3;
  v8 = v1;
  v9 = v2;
  sub_247BECA4C();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_247BECA7C();
}

uint64_t sub_247BD093C()
{
  __int128 *v0;
  uint64_t v1;
  char v2;
  __int128 v3;
  _BYTE v5[72];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  v1 = *((_QWORD *)v0 + 4);
  v2 = *((_BYTE *)v0 + 40);
  v3 = v0[1];
  v6 = *v0;
  v7 = v3;
  v8 = v1;
  v9 = v2;
  sub_247BECA4C();
  ASN1Node.Content.hash(into:)((uint64_t)v5);
  return sub_247BECA7C();
}

uint64_t DER.Serializer.serializedBytes.getter()
{
  return swift_bridgeObjectRetain();
}

char *DER.Serializer.init()@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_247BD3F98(0, 1024, 0, MEMORY[0x24BEE4AF8]);
  *a1 = result;
  return result;
}

uint64_t DER.Serializer.appendPrimitiveNode(identifier:_:)(uint64_t a1, uint64_t (*a2)(char **))
{
  char **v2;
  char v3;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a1 + 8);
  v5 = *(_QWORD *)a1;
  v6 = v3;
  return sub_247BD55F8(&v5, 0, v2, a2);
}

uint64_t sub_247BD0A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BD5108();
  return sub_247BD6C58(a4);
}

uint64_t sub_247BD0A44(uint64_t *a1, char a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v6 = *((_BYTE *)a1 + 8);
  v15 = *a1;
  v16 = v6;
  sub_247BEBE7C((uint64_t)&v15, a2);
  v7 = *a3;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_29;
  while (1)
  {
    v10 = *(_QWORD *)(v7 + 16);
    v9 = *(_QWORD *)(v7 + 24);
    v11 = v10 + 1;
    if (v10 >= v9 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v9 > 1), v10 + 1, 1, (char *)v7);
      v7 = result;
    }
    *(_QWORD *)(v7 + 16) = v11;
    *(_BYTE *)(v7 + 32 + v10) = 0;
    *a3 = v7;
    v12 = *(_QWORD *)(v7 + 16);
    v13 = v12 - v11;
    if ((uint64_t)(v12 - v11) < 128)
      break;
    if (v12 <= v10)
    {
      __break(1u);
    }
    else
    {
      v4 = 71 - __clz(v13);
      v3 = v4 >> 3;
      sub_247BD1F84(v4 >> 3, v10 + 1, v12);
      v7 = *a3;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0)
        goto LABEL_7;
    }
    result = (uint64_t)sub_247BDE604(v7);
    v7 = result;
LABEL_7:
    if (v10 >= *(_QWORD *)(v7 + 16))
    {
      __break(1u);
      goto LABEL_33;
    }
    v14 = v7 + 32;
    *(_BYTE *)(v7 + 32 + v10) = (v4 >> 3) | 0x80;
    *a3 = v7;
    if (v10 + 1 < *(_QWORD *)(v7 + 16))
    {
      *(_BYTE *)(v14 + v10 + 1) = v13 >> (8 * ((v3 - 1) & 7));
      if (v3 == 1)
        goto LABEL_27;
      if (v10 + 2 < *(_QWORD *)(v7 + 16))
      {
        *(_BYTE *)(v14 + v10 + 2) = v13 >> (8 * ((v3 - 2) & 7));
        if (v3 == 2)
          goto LABEL_27;
        if (v10 + 3 < *(_QWORD *)(v7 + 16))
        {
          *(_BYTE *)(v14 + v10 + 3) = v13 >> (8 * ((v3 - 3) & 7));
          if (v3 == 3)
            goto LABEL_27;
          if (v10 + 4 < *(_QWORD *)(v7 + 16))
          {
            *(_BYTE *)(v14 + v10 + 4) = v13 >> (8 * ((v3 - 4) & 7));
            if (v3 == 4)
              goto LABEL_27;
            if (v10 + 5 < *(_QWORD *)(v7 + 16))
            {
              *(_BYTE *)(v14 + v10 + 5) = v13 >> (8 * ((v3 - 5) & 7));
              if (v3 == 5)
                goto LABEL_27;
              if (v10 + 6 < *(_QWORD *)(v7 + 16))
              {
                *(_BYTE *)(v14 + v10 + 6) = v13 >> (8 * ((v3 - 6) & 7));
                if (v3 == 6)
                  goto LABEL_27;
                if (v10 + 7 < *(_QWORD *)(v7 + 16))
                {
                  *(_BYTE *)(v14 + v10 + 7) = v13 >> (8 * ((v3 - 7) & 7));
                  if (v3 == 7)
                    goto LABEL_27;
                  if (v10 + 8 < *(_QWORD *)(v7 + 16))
                  {
                    *(_BYTE *)(v14 + v10 + 8) = v13 >> (v4 & 0x38);
LABEL_27:
                    *a3 = v7;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
LABEL_29:
    result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v7 + 16) + 1, 1, (char *)v7);
    v7 = result;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v10 < v12)
  {
    *(_BYTE *)(v7 + 32 + v10) = v13;
    goto LABEL_27;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_247BD0CC8(uint64_t *a1, char a2, uint64_t (*a3)(char **))
{
  char **v3;
  uint64_t v4;
  unint64_t v5;
  char **v6;
  char v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;

  v6 = v3;
  v8 = *((_BYTE *)a1 + 8);
  v17 = *a1;
  v18 = v8;
  sub_247BEBE7C((uint64_t)&v17, a2);
  v9 = *v3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_32;
  while (1)
  {
    v11 = *((_QWORD *)v9 + 2);
    v10 = *((_QWORD *)v9 + 3);
    v12 = v11 + 1;
    if (v11 >= v10 >> 1)
      v9 = sub_247BD3F98((char *)(v10 > 1), v11 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *v6 = v9;
    result = a3(v6);
    if (v4)
      return result;
    v9 = *v6;
    v14 = *((_QWORD *)*v6 + 2);
    v15 = v14 - v12;
    if ((uint64_t)(v14 - v12) <= 127)
      break;
    if (v14 <= v11)
    {
      __break(1u);
    }
    else
    {
      v5 = 71 - __clz(v15);
      a3 = (uint64_t (*)(char **))(v5 >> 3);
      sub_247BD1F84(v5 >> 3, v11 + 1, v14);
      v9 = *v6;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0)
        goto LABEL_8;
    }
    result = (uint64_t)sub_247BDE604((uint64_t)v9);
    v9 = (char *)result;
LABEL_8:
    if (v11 >= *((_QWORD *)v9 + 2))
    {
      __break(1u);
      goto LABEL_36;
    }
    v16 = v9 + 32;
    v9[v11 + 32] = (v5 >> 3) | 0x80;
    *v6 = v9;
    if (v11 + 1 < *((_QWORD *)v9 + 2))
    {
      v16[v11 + 1] = v15 >> (8 * (((_BYTE)a3 - 1) & 7u));
      if (a3 == (uint64_t (*)(char **))1)
        goto LABEL_29;
      if (v11 + 2 < *((_QWORD *)v9 + 2))
      {
        v16[v11 + 2] = v15 >> (8 * (((_BYTE)a3 - 2) & 7u));
        if (a3 == (uint64_t (*)(char **))2)
          goto LABEL_29;
        if (v11 + 3 < *((_QWORD *)v9 + 2))
        {
          v16[v11 + 3] = v15 >> (8 * (((_BYTE)a3 - 3) & 7u));
          if (a3 == (uint64_t (*)(char **))3)
            goto LABEL_29;
          if (v11 + 4 < *((_QWORD *)v9 + 2))
          {
            v16[v11 + 4] = v15 >> (8 * (((_BYTE)a3 - 4) & 7u));
            if (a3 == (uint64_t (*)(char **))4)
              goto LABEL_29;
            if (v11 + 5 < *((_QWORD *)v9 + 2))
            {
              v16[v11 + 5] = v15 >> (8 * (((_BYTE)a3 - 5) & 7u));
              if (a3 == (uint64_t (*)(char **))5)
                goto LABEL_29;
              if (v11 + 6 < *((_QWORD *)v9 + 2))
              {
                v16[v11 + 6] = v15 >> (8 * (((_BYTE)a3 - 6) & 7u));
                if (a3 == (uint64_t (*)(char **))6)
                  goto LABEL_29;
                if (v11 + 7 < *((_QWORD *)v9 + 2))
                {
                  v16[v11 + 7] = v15 >> (8 * (((_BYTE)a3 - 7) & 7u));
                  if (a3 == (uint64_t (*)(char **))7)
                    goto LABEL_29;
                  if (v11 + 8 < *((_QWORD *)v9 + 2))
                  {
                    v16[v11 + 8] = v15 >> (v5 & 0x38);
LABEL_29:
                    *v6 = v9;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
LABEL_32:
    v9 = sub_247BD3F98(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
    goto LABEL_27;
LABEL_37:
  result = (uint64_t)sub_247BDE604((uint64_t)v9);
  v9 = (char *)result;
LABEL_27:
  if (v11 < *((_QWORD *)v9 + 2))
  {
    v9[v11 + 32] = v15;
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t DER.Serializer.appendConstructedNode(identifier:_:)(uint64_t a1, uint64_t (*a2)(char **))
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a1 + 8);
  v4 = *(_QWORD *)a1;
  v5 = v2;
  return sub_247BD0CC8(&v4, 1, a2);
}

uint64_t DER.Serializer.serialize<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(a3 + 8))(v3);
}

uint64_t DER.Serializer.serialize<A>(_:explicitlyTaggedWithTagNumber:tagClass:)(uint64_t a1, uint64_t a2, char *a3)
{
  char v3;
  uint64_t v5;
  char v6;

  v3 = *a3;
  v5 = a2;
  v6 = v3;
  return sub_247BD0CC8(&v5, 1, (uint64_t (*)(char **))sub_247BD55D0);
}

uint64_t DER.Serializer.serialize<A>(_:explicitlyTaggedWithIdentifier:)(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD0CC8(&v4, 1, (uint64_t (*)(char **))sub_247BD55D0);
}

uint64_t DER.Serializer.serializeOptionalImplicitlyTagged<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[2];

  v6 = sub_247BEC8A8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v15 - v9;
  v11 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a2) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a2);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(a3 + 8))(v15[1], a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a2);
}

uint64_t DER.Serializer.serializeOptionalImplicitlyTagged<A>(_:withIdentifier:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v19 = a4;
  v7 = sub_247BEC8A8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - v10;
  v12 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a2;
  v16 = *((_BYTE *)a2 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a3) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a3);
  v20 = v15;
  v21 = v16;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(v19 + 40))(v18, &v20, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a3);
}

uint64_t DER.Serializer.serialize(explicitlyTaggedWithTagNumber:tagClass:_:)(uint64_t a1, char *a2, uint64_t (*a3)(char **))
{
  char **v3;
  char v4;
  uint64_t v6;
  char v7;

  v4 = *a2;
  v6 = a1;
  v7 = v4;
  return sub_247BD55F8(&v6, 1, v3, a3);
}

uint64_t DER.Serializer.serializeSequenceOf<A>(_:identifier:)(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD0CC8(&v4, 1, (uint64_t (*)(char **))sub_247BD58CC);
}

uint64_t sub_247BD13A0(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t AssociatedConformanceWitness;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v27 = a1;
  v28 = a5;
  v32 = a2;
  v31 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v33 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v27 - v8;
  v10 = sub_247BEC8A8();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - v12;
  v14 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v29 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v27 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v32, a3);
  sub_247BEC7AC();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v31 = v19;
  v32 = v17;
  sub_247BEC8B4();
  v21 = v33;
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
  if (v22(v13, 1, AssociatedTypeWitness) != 1)
  {
    v30 = AssociatedConformanceWitness;
    v23 = v27;
    v24 = v28;
    v25 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
    while (1)
    {
      v25(v9, v13, AssociatedTypeWitness);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 8))(v23, AssociatedTypeWitness, v24);
      if (v5)
        break;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v9, AssociatedTypeWitness);
      sub_247BEC8B4();
      if (v22(v13, 1, AssociatedTypeWitness) == 1)
        return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v31, v32);
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v9, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v31, v32);
}

uint64_t DER.Serializer.serializeSetOf<A>(_:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char **v5;
  uint64_t v6;
  char **v7;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v17;
  uint64_t *v18;
  _QWORD v19[7];
  char *v20;
  char v21;
  char *v22;

  v7 = v5;
  v11 = *(char **)a2;
  v12 = *(_BYTE *)(a2 + 8);
  v22 = sub_247BD3F98(0, 1024, 0, MEMORY[0x24BEE4AF8]);
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = &v22;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9858);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9848);
  v15 = (char *)sub_247BCCC88((void (*)(char *, char *))sub_247BD58E8, (uint64_t)v19, a3, v13, v14, a4, MEMORY[0x24BEE3F20], (uint64_t)&v20);
  if (v6)
    return swift_bridgeObjectRelease();
  v17 = (unint64_t)v22;
  v20 = v15;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_247BD6B60(&v20, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18 = (uint64_t *)v20;
  v20 = v11;
  v21 = v12;
  sub_247BD5908((uint64_t *)&v20, 1, v7, v18, v17);
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_247BD17A8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X4>, _QWORD *a3@<X5>, unint64_t *a4@<X8>)
{
  uint64_t v4;
  unint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t result;
  unint64_t v12;

  v9 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 8))(a1, AssociatedTypeWitness, a2);
  if (v4)
  {
    *a3 = v4;
  }
  else
  {
    v12 = *(_QWORD *)(*(_QWORD *)a1 + 16);
    if (v12 < v9)
    {
      __break(1u);
    }
    else
    {
      *a4 = v9;
      a4[1] = v12;
    }
  }
  return result;
}

void sub_247BD1858(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, int64_t a7, unint64_t a8)
{
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;
  int64_t v18;
  int v19;
  int v20;

  v8 = a4 >> 1;
  if (a4 >> 1 == a3)
    goto LABEL_4;
  if ((uint64_t)(a4 >> 1) <= a3)
    goto LABEL_34;
  v9 = a8 >> 1;
  if (a8 >> 1 == a7)
  {
LABEL_4:
    if (!__OFSUB__(v8, a3))
    {
      sub_247BCFD1C(v8 - a3, a5, a6, a7, a8);
      v13 = v12 >> 1;
      if (v11 == v12 >> 1)
      {
LABEL_20:
        swift_unknownObjectRetain();
        swift_unknownObjectRelease();
        return;
      }
      if (v11 >= (uint64_t)(v12 >> 1))
        goto LABEL_35;
      if (*(_BYTE *)(v10 + v11) || v11 + 1 == v13)
        goto LABEL_20;
      while (v11 + 1 < v13)
      {
        if (*(_BYTE *)(v10 + 1 + v11))
          v16 = 1;
        else
          v16 = v13 - 2 == v11;
        ++v11;
        if (v16)
          goto LABEL_20;
      }
      __break(1u);
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if ((uint64_t)(a8 >> 1) <= a7)
  {
LABEL_36:
    __break(1u);
    return;
  }
  v14 = *(unsigned __int8 *)(a2 + a3);
  v15 = *(unsigned __int8 *)(a6 + a7);
  if (v14 >= v15 && v15 >= v14)
  {
    v17 = 0;
    v18 = a7 + 1;
    while (~a3 + v8 != v17)
    {
      if (a3 + 1 + v17 >= v8)
        goto LABEL_32;
      if (~a7 + v9 == v17)
        break;
      if (v18 + v17 < a7 || v18 + v17 >= v9)
        goto LABEL_33;
      v19 = *(unsigned __int8 *)(a2 + a3 + 1 + v17);
      v20 = *(unsigned __int8 *)(a6 + a7 + 1 + v17++);
      if (v20 != v19)
        return;
    }
    goto LABEL_4;
  }
}

uint64_t DER.Serializer.serializeRawBytes<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9860);
  return sub_247BEC7E8();
}

uint64_t DER.Serializer.serialize(_:)(__int128 *a1)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  char v6;
  uint64_t v8;
  char v9;
  __int128 v10;
  __int128 v11[5];
  __int128 v12[3];
  __int128 v13;
  char v14;

  v2 = a1[3];
  v3 = a1[4];
  v4 = a1[1];
  v11[1] = a1[2];
  v11[2] = v2;
  v5 = a1[5];
  v11[3] = v3;
  v11[4] = v5;
  v10 = *a1;
  v11[0] = v4;
  v8 = *(_QWORD *)a1;
  v9 = *((_BYTE *)a1 + 8);
  sub_247BD6C00(v11, v12);
  sub_247BD6C00(v12, &v13);
  v6 = v14;
  sub_247BD6C18((uint64_t)&v10);
  sub_247BD5108(&v8, (v6 & 1) == 0, v1, (uint64_t)&v10);
  return sub_247BD6C58((uint64_t)&v10);
}

uint64_t sub_247BD1B3C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  unint64_t v41;
  __int128 v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v5 = v3;
  v7 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(unsigned __int8 *)(a2 + 56);
  v38 = v6;
  if ((v11 & 1) != 0)
  {
    j__swift_unknownObjectRetain(v7, v6, v8, v9, v10, 1);
    sub_247BE2594(v7, v6, v8, v9);
    return j__swift_unknownObjectRelease(v7, v6, v8, v9, v10, v11);
  }
  else
  {
    v33 = *(unsigned __int8 *)(a2 + 56);
    v12 = v9 >> 1;
    if (v8 != v9 >> 1)
    {
      v37 = result;
      v55 = v3;
      v30 = v10;
      j__swift_unknownObjectRetain(v7, v6, v8, v9, v10, 0);
      v35 = v7;
      v36 = v9 & 0xFFFFFFFFFFFFFFFELL;
      swift_unknownObjectRetain();
      v34 = v6 + 112;
      v31 = v9;
      v32 = v8;
      v13 = v8;
      v14 = v9;
      while (v13 < (uint64_t)(v14 >> 1))
      {
        if (v12 <= v13)
          goto LABEL_46;
        if (v14 >> 1 < v12)
          goto LABEL_47;
        v15 = v6 + 96 * v13;
        v16 = *(_QWORD *)v15;
        v17 = *(_BYTE *)(v15 + 8);
        v18 = *(unsigned __int8 *)(v15 + 24);
        v42 = *(_OWORD *)(v15 + 32);
        v8 = v13 + 1;
        v19 = v14 & 1;
        v41 = v19;
        v40 = *(_OWORD *)(v15 + 48);
        if (*(_BYTE *)(v15 + 24))
        {
          v4 = *(_QWORD *)(v15 + 16);
          if (v8 == v12)
          {
            v20 = v12;
          }
          else
          {
            v22 = (_QWORD *)(v34 + 96 * v13);
            v20 = v13 + 1;
            do
            {
              if (v20 >= v12)
              {
LABEL_43:
                __break(1u);
LABEL_44:
                __break(1u);
                goto LABEL_45;
              }
              if (v4 >= *v22)
                goto LABEL_19;
              v23 = v20 + 1;
              if (__OFADD__(v20, 1))
                goto LABEL_44;
              ++v20;
              v22 += 12;
            }
            while (v23 != v12);
            v20 = v12;
LABEL_19:
            if (v20 <= v13)
              goto LABEL_48;
            if (v20 < 0)
              goto LABEL_49;
          }
          v24 = v20 - v8;
          if (__OFSUB__(v20, v8))
            goto LABEL_50;
          if (v24 < 0)
            goto LABEL_51;
          v25 = v12 - v8;
          if (__OFSUB__(v12, v8))
            goto LABEL_52;
          if (!v24 || v25 < 0 || (v26 = v12, v25 >= v24))
          {
            v26 = v20;
            if (__OFADD__(v8, v24))
              goto LABEL_55;
            if (v12 < v20)
              goto LABEL_53;
          }
          if (v26 <= v13)
            goto LABEL_54;
          if (v8 != v20)
          {
            if (v8 >= v20)
              goto LABEL_56;
            v27 = (uint64_t *)(v34 + 96 * v13);
            do
            {
              v28 = *v27;
              v27 += 12;
              if (v4 >= v28)
              {
                __break(1u);
                goto LABEL_43;
              }
              --v24;
            }
            while (v24);
            if (*(_QWORD *)(v6 + 96 * v8 + 16) != v4 + 1)
              goto LABEL_57;
          }
          v39 = v26;
          v21 = v18;
          v7 = v19 | (2 * v20);
          v5 = v35;
          swift_unknownObjectRetain();
          v2 = v8;
        }
        else
        {
          v5 = *(_QWORD *)(v15 + 64);
          if (!v5)
            goto LABEL_58;
          v21 = *(unsigned __int8 *)(v15 + 24);
          v6 = *(_QWORD *)(v15 + 72);
          v2 = *(_QWORD *)(v15 + 80);
          v7 = *(_QWORD *)(v15 + 88);
          swift_unknownObjectRetain();
          v4 = 0;
          v39 = v8;
        }
        v8 = v21 ^ 1;
        v45 = v16;
        v46 = v17;
        v47 = v5;
        v48 = v6;
        v49 = v2;
        v50 = v7;
        v51 = v4;
        v52 = v21 ^ 1;
        v53 = v42;
        v54 = v40;
        v43 = v16;
        v44 = v17;
        j__swift_unknownObjectRetain(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRetain();
        j__swift_unknownObjectRetain(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRetain_n();
        v29 = v55;
        sub_247BD0A14((uint64_t)&v43, v21, v37, (uint64_t)&v45);
        v55 = v29;
        if (v29)
          goto LABEL_59;
        v14 = v41 | v36;
        j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRelease();
        j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
        swift_unknownObjectRelease();
        v6 = v38;
        v13 = v39;
        if (v39 == v12)
        {
          v7 = v35;
          swift_unknownObjectRelease();
          v9 = v31;
          v8 = v32;
          v10 = v30;
          v11 = v33;
          return j__swift_unknownObjectRelease(v7, v6, v8, v9, v10, v11);
        }
      }
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      j__swift_unknownObjectRelease(v5, v6, v2, v7, v4, v8);
      swift_unknownObjectRelease();
      result = swift_unexpectedError();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_247BD1F84(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  if (result < 1)
    goto LABEL_28;
  v6 = a3;
  v7 = *v4;
  v8 = *(_QWORD *)(*v4 + 16);
  v9 = v8 - a3;
  if (__OFSUB__(v8, a3))
    goto LABEL_29;
  v3 = a2;
  v5 = result;
  if (v9 >= result)
    goto LABEL_13;
  v10 = result - v9;
  if (__OFSUB__(result, v9))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v10 < 0)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    result = (uint64_t)sub_247BD3F98(0, v8 + 1, 1, (char *)v7);
    v7 = result;
LABEL_8:
    v11 = *(_QWORD *)(v7 + 16);
    do
    {
      v12 = *(_QWORD *)(v7 + 24);
      if (v11 >= v12 >> 1)
      {
        result = (uint64_t)sub_247BD3F98((char *)(v12 > 1), v11 + 1, 1, (char *)v7);
        v7 = result;
      }
      *(_QWORD *)(v7 + 16) = v11 + 1;
      *(_BYTE *)(v7 + v11++ + 32) = 0;
      --v10;
    }
    while (v10);
    *v4 = v7;
    goto LABEL_13;
  }
  if (v10)
  {
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_13:
  if (v6 == v3)
    return result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_30;
  do
  {
    while (1)
    {
      if (v6 <= v3)
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      v13 = v6 - 1 + v5;
      if (__OFADD__(v6 - 1, v5))
        goto LABEL_24;
      v14 = v6 - 1;
      if (v6 < 1)
        goto LABEL_25;
      v15 = *(_QWORD *)(v7 + 16);
      if (v14 >= v15)
        goto LABEL_26;
      if (v13 < v15)
        break;
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      result = (uint64_t)sub_247BDE604(v7);
      v7 = result;
    }
    *(_BYTE *)(v7 + 32 + v13) = *(_BYTE *)(v7 + v6-- + 31);
  }
  while (v14 != v3);
  *v4 = v7;
  return result;
}

uint64_t DERParseable.init(derEncoded:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  ASN1NodeCollection.Iterator.next()((uint64_t)&v7);
  if (v9)
  {
    LOBYTE(v8) = v8 & 1;
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8))(&v7, a2, a3);
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000002ALL, 0x8000000247BEEBB0, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1026, v6);
    return swift_willThrow();
  }
}

{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;

  static DER.parse(_:)(a1, a1 + 32, 0, (2 * *(_QWORD *)(a1 + 16)) | 1, (uint64_t)&v15);
  result = swift_bridgeObjectRelease();
  if (!v3)
  {
    v7 = v15;
    v8 = v16;
    v9 = v17;
    v10 = v18;
    v11 = v19;
    v12 = v20;
    v13 = v21;
    v14 = v22;
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8))(&v7, a2, a3);
  }
  return result;
}

uint64_t DERParseable.init(derEncoded:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;

  static DER.parse(_:)(a1, a2, a3, a4, (uint64_t)&v18);
  if (!v6)
  {
    v10 = v18;
    v11 = v19;
    v12 = v20;
    v13 = v21;
    v14 = v22;
    v15 = v23;
    v16 = v24;
    v17 = v25;
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(a6 + 8))(&v10, a5, a6);
  }
  return swift_unknownObjectRelease();
}

uint64_t DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v10;
  char v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;

  v10 = *a5;
  v11 = *((_BYTE *)a5 + 8);
  static DER.parse(_:)(a1, a2, a3, a4, (uint64_t)&v23);
  if (!v7)
  {
    v15 = v23;
    v16 = v24;
    v17 = v25;
    v18 = v26;
    v19 = v27;
    v20 = v28;
    v21 = v29;
    v22 = v30;
    v13 = v10;
    v14 = v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a7 + 32))(&v15, &v13, a6, a7);
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_247BD2530@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v2 = result;
  if (*(_QWORD *)result == 12 && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      v7 = *(_QWORD *)(result + 32);
      v6 = *(_QWORD *)(result + 40);
      v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      result = sub_247BD6C58(v2);
      *(_OWORD *)a2 = v8;
      *(_QWORD *)(a2 + 16) = v7;
      *(_QWORD *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_247BD6C58(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_247BD2614@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v2 = result;
  if (*(_QWORD *)result == 4 && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      v7 = *(_QWORD *)(result + 32);
      v6 = *(_QWORD *)(result + 40);
      v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      result = sub_247BD6C58(v2);
      *(_OWORD *)a2 = v8;
      *(_QWORD *)(a2 + 16) = v7;
      *(_QWORD *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_247BD6C58(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_247BD26F8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v2 = result;
  if (*(_QWORD *)result == 20 && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      v7 = *(_QWORD *)(result + 32);
      v6 = *(_QWORD *)(result + 40);
      v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      result = sub_247BD6C58(v2);
      *(_OWORD *)a2 = v8;
      *(_QWORD *)(a2 + 16) = v7;
      *(_QWORD *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_247BD6C58(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_247BD27DC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v2 = result;
  if (*(_QWORD *)result == 28 && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      v7 = *(_QWORD *)(result + 32);
      v6 = *(_QWORD *)(result + 40);
      v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      result = sub_247BD6C58(v2);
      *(_OWORD *)a2 = v8;
      *(_QWORD *)(a2 + 16) = v7;
      *(_QWORD *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_247BD6C58(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_247BD28C0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v2 = result;
  if (*(_QWORD *)result == 30 && *(_BYTE *)(result + 8) == 0)
  {
    if (*(_BYTE *)(result + 56) == 1)
    {
      v7 = *(_QWORD *)(result + 32);
      v6 = *(_QWORD *)(result + 40);
      v8 = *(_OWORD *)(result + 16);
      swift_unknownObjectRetain();
      result = sub_247BD6C58(v2);
      *(_OWORD *)a2 = v8;
      *(_QWORD *)(a2 + 16) = v7;
      *(_QWORD *)(a2 + 24) = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v5);
    sub_247BD6C58(v2);
    return swift_willThrow();
  }
  return result;
}

uint64_t DERImplicitlyTaggable.init(derEncoded:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  __int128 v9;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;

  v5 = *((_BYTE *)a1 + 8);
  v6 = a1[6];
  v7 = *((_BYTE *)a1 + 56);
  v15 = *a1;
  v16 = v5;
  v8 = *((_OWORD *)a1 + 2);
  v17 = *((_OWORD *)a1 + 1);
  v18 = v8;
  v19 = v6;
  v20 = v7;
  v9 = *((_OWORD *)a1 + 5);
  v21 = *((_OWORD *)a1 + 4);
  v22 = v9;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v13, a2, a3);
  v11 = v13;
  v12 = v14;
  return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(a3 + 32))(&v15, &v11, a2, a3);
}

uint64_t DERImplicitlyTaggable.serialize(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;

  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v9, a2, a3);
  v7 = v9;
  v8 = v10;
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(a3 + 40))(a1, &v7, a2, a3);
}

uint64_t sub_247BD2AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(_QWORD *, _QWORD);
  char *v24;
  char v25;
  void (*v26)(char *, uint64_t);
  _QWORD v27[2];
  uint64_t v28;
  char *v29;
  uint64_t AssociatedTypeWitness;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD v37[4];
  uint64_t v38;

  v8 = a1;
  v34 = a5;
  v32 = *(_QWORD *)(a2 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v33 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v29 = (char *)v27 - v11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v28 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v35 = (char *)v27 - v12;
  v27[1] = *(_QWORD *)(a4 + 8);
  v13 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v13);
  v31 = sub_247BEC830();
  if (v31 <= sub_247BEC9C8() / 8)
  {
    swift_getAssociatedConformanceWitness();
    sub_247BECA10();
    sub_247BEC9F8();
    result = sub_247BEC830();
    if ((unint64_t)(result - 0x1000000000000000) >> 61 == 7)
    {
      v16 = sub_247BD873C(0, 8 * result, 8);
      sub_247BEC824();
      v17 = a3;
      v31 = v16;
      v18 = *(_QWORD *)(v16 + 16);
      v19 = v29;
      if (v18)
      {
        v20 = (uint64_t *)(v31 + 32);
        v38 = v8;
        v36 = v17;
        v21 = v33;
        do
        {
          v22 = *v20++;
          v23 = (void (*)(_QWORD *, _QWORD))sub_247BEC890();
          v25 = *v24;
          v23(v37, 0);
          LOBYTE(v37[0]) = v25;
          sub_247BD7A04();
          sub_247BEC8D8();
          v37[0] = v22;
          sub_247BD7A48();
          sub_247BEC8FC();
          v26 = *(void (**)(char *, uint64_t))(v32 + 8);
          v26(v21, a2);
          sub_247BEC908();
          v26(v19, a2);
          sub_247BEC83C();
          v8 = v38;
          v17 = v36;
          --v18;
        }
        while (v18);
      }
      (*(void (**)(uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v8);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v35, AssociatedTypeWitness);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x8000000247BEED80, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v14);
    swift_willThrow();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(v8, a3);
  }
  return result;
}

uint64_t sub_247BD2EE4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v0 = sub_247BEC920();
  result = sub_247BEC9D4();
  v2 = v0 - result;
  if (__OFSUB__(v0, result))
  {
    __break(1u);
  }
  else
  {
    v3 = __OFADD__(v2, 7);
    v4 = v2 + 7;
    if (!v3)
      return v4 / 8;
  }
  __break(1u);
  return result;
}

uint64_t sub_247BD2F4C@<X0>(_OWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_247BD2FD4(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD8ACC, a2);
}

uint64_t sub_247BD2F68(char **a1)
{
  char *v1;
  uint64_t v3;
  char v4;
  char v5;

  v5 = *v1;
  v3 = 2;
  v4 = 0;
  return sub_247BD55F8(&v3, 0, a1, (uint64_t (*)(char **))sub_247BD79BC);
}

uint64_t sub_247BD2FB8@<X0>(_OWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_247BD2FD4(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD942C, a2);
}

uint64_t sub_247BD2FD4@<X0>(_OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t result;
  _OWORD v9[6];

  v5 = a1[3];
  v9[2] = a1[2];
  v9[3] = v5;
  v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  result = a2(v9, 2, 0);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_247BD3028(char **a1)
{
  char *v1;
  uint64_t v3;
  char v4;
  char v5;

  v5 = *v1;
  v3 = 2;
  v4 = 0;
  return sub_247BD55F8(&v3, 0, a1, sub_247BD799C);
}

uint64_t sub_247BD3078@<X0>(_OWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return sub_247BD3100(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD8D24, a2);
}

uint64_t sub_247BD3094(char **a1)
{
  __int16 *v1;
  uint64_t v3;
  char v4;
  __int16 v5;

  v5 = *v1;
  v3 = 2;
  v4 = 0;
  return sub_247BD55F8(&v3, 0, a1, (uint64_t (*)(char **))sub_247BD797C);
}

uint64_t sub_247BD30E4@<X0>(_OWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return sub_247BD3100(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD96D0, a2);
}

uint64_t sub_247BD3100@<X0>(_OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, _QWORD)@<X3>, _WORD *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t result;
  _OWORD v9[6];

  v5 = a1[3];
  v9[2] = a1[2];
  v9[3] = v5;
  v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  result = a2(v9, 2, 0);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_247BD3154(char **a1)
{
  __int16 *v1;
  uint64_t v3;
  char v4;
  __int16 v5;

  v5 = *v1;
  v3 = 2;
  v4 = 0;
  return sub_247BD55F8(&v3, 0, a1, sub_247BD795C);
}

uint64_t sub_247BD31A4@<X0>(_OWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_247BD322C(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD8F7C, a2);
}

uint64_t sub_247BD31C0(char **a1)
{
  int *v1;
  uint64_t v3;
  char v4;
  int v5;

  v5 = *v1;
  v3 = 2;
  v4 = 0;
  return sub_247BD55F8(&v3, 0, a1, (uint64_t (*)(char **))sub_247BD793C);
}

uint64_t sub_247BD3210@<X0>(_OWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_247BD322C(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD9974, a2);
}

uint64_t sub_247BD322C@<X0>(_OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, _QWORD)@<X3>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t result;
  _OWORD v9[6];

  v5 = a1[3];
  v9[2] = a1[2];
  v9[3] = v5;
  v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  result = a2(v9, 2, 0);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_247BD3280(char **a1)
{
  int *v1;
  uint64_t v3;
  char v4;
  int v5;

  v5 = *v1;
  v3 = 2;
  v4 = 0;
  return sub_247BD55F8(&v3, 0, a1, sub_247BD791C);
}

uint64_t sub_247BD32D0@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247BD33C4(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD8808, a2);
}

uint64_t sub_247BD32EC(char **a1)
{
  uint64_t *v1;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v5 = *v1;
  v3 = 2;
  v4 = 0;
  return sub_247BD55F8(&v3, 0, a1, (uint64_t (*)(char **))sub_247BD78FC);
}

uint64_t sub_247BD333C@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247BD33C4(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD9C18, a2);
}

uint64_t sub_247BD3358(char **a1)
{
  uint64_t *v1;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v5 = *v1;
  v3 = 2;
  v4 = 0;
  return sub_247BD55F8(&v3, 0, a1, sub_247BD78D8);
}

uint64_t sub_247BD33A8@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247BD33C4(a1, (uint64_t (*)(_OWORD *, uint64_t, _QWORD))sub_247BD881C, a2);
}

uint64_t sub_247BD33C4@<X0>(_OWORD *a1@<X0>, uint64_t (*a2)(_OWORD *, uint64_t, _QWORD)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t result;
  _OWORD v9[6];

  v5 = a1[3];
  v9[2] = a1[2];
  v9[3] = v5;
  v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  result = a2(v9, 2, 0);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_247BD3418@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  char *v20;

  v4 = *((_BYTE *)a1 + 8);
  v5 = a1[6];
  v6 = *((_BYTE *)a1 + 56);
  v12 = *a1;
  v13 = v4;
  v7 = *((_OWORD *)a1 + 2);
  v14 = *((_OWORD *)a1 + 1);
  v15 = v7;
  v16 = v5;
  v17 = v6;
  v8 = *((_OWORD *)a1 + 5);
  v18 = *((_OWORD *)a1 + 4);
  v19 = v8;
  v10 = 6;
  v11 = 0;
  result = ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)((uint64_t)&v12, (uint64_t)&v10, &v20);
  if (!v2)
    *a2 = v20;
  return result;
}

uint64_t sub_247BD3494(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 6;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD78C0);
}

uint64_t sub_247BD34DC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;

  v4 = *((_BYTE *)a1 + 8);
  v5 = a1[6];
  v6 = *((_BYTE *)a1 + 56);
  v12 = *a1;
  v13 = v4;
  v7 = *((_OWORD *)a1 + 2);
  v14 = *((_OWORD *)a1 + 1);
  v15 = v7;
  v16 = v5;
  v17 = v6;
  v8 = *((_OWORD *)a1 + 5);
  v18 = *((_OWORD *)a1 + 4);
  v19 = v8;
  v10 = 1;
  v11 = 0;
  result = sub_247BE482C((uint64_t)&v12, (uint64_t)&v10);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_247BD3554(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 1;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD78A8);
}

uint64_t sub_247BD359C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[6];

  v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_247BD2530((uint64_t)v6, a2);
}

uint64_t sub_247BD35D4(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 12;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t sub_247BD361C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[6];

  v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_247BD26F8((uint64_t)v6, a2);
}

uint64_t sub_247BD3654(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 20;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

double sub_247BD369C@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_247BD3824(a1, 19, (void (*)(_OWORD *__return_ptr, uint64_t *, uint64_t *))ASN1PrintableString.init(derEncoded:withIdentifier:), a2);
}

uint64_t sub_247BD36BC(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 19;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t sub_247BD3704@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[6];

  v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_247BD27DC((uint64_t)v6, a2);
}

uint64_t sub_247BD373C(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 28;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t sub_247BD3784@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[6];

  v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_247BD28C0((uint64_t)v6, a2);
}

uint64_t sub_247BD37BC(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 30;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

double sub_247BD3804@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_247BD3824(a1, 22, (void (*)(_OWORD *__return_ptr, uint64_t *, uint64_t *))ASN1IA5String.init(derEncoded:withIdentifier:), a2);
}

double sub_247BD3824@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, void (*a3)(_OWORD *__return_ptr, uint64_t *, uint64_t *)@<X4>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  char v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  double result;
  __int128 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];

  v6 = *((_BYTE *)a1 + 8);
  v7 = a1[6];
  v8 = *((_BYTE *)a1 + 56);
  v15 = *a1;
  v16 = v6;
  v9 = *((_OWORD *)a1 + 2);
  v17 = *((_OWORD *)a1 + 1);
  v18 = v9;
  v19 = v7;
  v20 = v8;
  v10 = *((_OWORD *)a1 + 5);
  v21 = *((_OWORD *)a1 + 4);
  v22 = v10;
  v13 = a2;
  v14 = 0;
  a3(v23, &v15, &v13);
  if (!v4)
  {
    result = *(double *)v23;
    v12 = v23[1];
    *a4 = v23[0];
    a4[1] = v12;
  }
  return result;
}

uint64_t sub_247BD389C(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 22;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t sub_247BD38E4@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[6];

  v2 = a1[3];
  v6[2] = a1[2];
  v6[3] = v2;
  v3 = a1[5];
  v6[4] = a1[4];
  v6[5] = v3;
  v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  return sub_247BD2614((uint64_t)v6, a2);
}

uint64_t sub_247BD391C(char **a1)
{
  uint64_t v2;
  char v3;

  v2 = 4;
  v3 = 0;
  return sub_247BD55F8(&v2, 0, a1, (uint64_t (*)(char **))sub_247BD788C);
}

double sub_247BD3964@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  __int128 v22;

  v4 = *((_BYTE *)a1 + 8);
  v5 = a1[6];
  v6 = *((_BYTE *)a1 + 56);
  v13 = *a1;
  v14 = v4;
  v7 = *((_OWORD *)a1 + 2);
  v15 = *((_OWORD *)a1 + 1);
  v16 = v7;
  v17 = v5;
  v18 = v6;
  v8 = *((_OWORD *)a1 + 5);
  v19 = *((_OWORD *)a1 + 4);
  v20 = v8;
  v11 = 23;
  v12 = 0;
  UTCTime.init(derEncoded:withIdentifier:)((uint64_t)&v13, (uint64_t)&v11, v21);
  if (!v2)
  {
    v10 = v21[1];
    *a2 = v21[0];
    a2[1] = v10;
    result = *(double *)&v22;
    a2[2] = v22;
  }
  return result;
}

uint64_t sub_247BD39E8(char **a1)
{
  __int128 *v1;
  __int128 v2;
  uint64_t v4;
  char v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v2 = v1[1];
  v6 = *v1;
  v7 = v2;
  v8 = v1[2];
  v4 = 23;
  v5 = 0;
  return sub_247BD55F8(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD7874);
}

uint64_t sub_247BD3A40(char **a1)
{
  __int128 *v1;
  __int128 v2;
  uint64_t v4;
  char v5;
  __int128 v6;
  __int128 v7;

  v2 = v1[1];
  v6 = *v1;
  v7 = v2;
  v4 = 2;
  v5 = 0;
  return sub_247BD55F8(&v4, 0, a1, sub_247BD785C);
}

uint64_t sub_247BD3A90@<X0>(_OWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[6];

  v4 = a1[3];
  v11[2] = a1[2];
  v11[3] = v4;
  v5 = a1[5];
  v11[4] = a1[4];
  v11[5] = v5;
  v6 = a1[1];
  v11[0] = *a1;
  v11[1] = v6;
  result = sub_247BD8838((uint64_t)v11, 2, 0);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v8;
    a2[2] = v9;
    a2[3] = v10;
  }
  return result;
}

double sub_247BD3AE8@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  __int128 v8;
  double result;
  __int128 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[3];
  double v22;

  v4 = *((_BYTE *)a1 + 8);
  v5 = a1[6];
  v6 = *((_BYTE *)a1 + 56);
  v13 = *a1;
  v14 = v4;
  v7 = *((_OWORD *)a1 + 2);
  v15 = *((_OWORD *)a1 + 1);
  v16 = v7;
  v17 = v5;
  v18 = v6;
  v8 = *((_OWORD *)a1 + 5);
  v19 = *((_OWORD *)a1 + 4);
  v20 = v8;
  v11 = 24;
  v12 = 0;
  GeneralizedTime.init(derEncoded:withIdentifier:)((uint64_t)&v13, (uint64_t)&v11, (uint64_t)v21);
  if (!v2)
  {
    result = v22;
    v10 = v21[1];
    *(_OWORD *)a2 = v21[0];
    *(_OWORD *)(a2 + 16) = v10;
    *(_OWORD *)(a2 + 32) = v21[2];
    *(double *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_247BD3B74(char **a1)
{
  __int128 *v1;
  __int128 v2;
  uint64_t v4;
  char v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v2 = v1[1];
  v6 = *v1;
  v7 = v2;
  v8 = v1[2];
  v9 = *((_QWORD *)v1 + 6);
  v4 = 24;
  v5 = 0;
  return sub_247BD55F8(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD7844);
}

uint64_t sub_247BD3BD4(uint64_t *a1)
{
  char v1;
  uint64_t v2;
  char v3;
  __int128 v4;
  __int128 v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;

  v1 = *((_BYTE *)a1 + 8);
  v2 = a1[6];
  v3 = *((_BYTE *)a1 + 56);
  v9 = *a1;
  v10 = v1;
  v4 = *((_OWORD *)a1 + 2);
  v11 = *((_OWORD *)a1 + 1);
  v12 = v4;
  v13 = v2;
  v14 = v3;
  v5 = *((_OWORD *)a1 + 5);
  v15 = *((_OWORD *)a1 + 4);
  v16 = v5;
  v7 = 5;
  v8 = 0;
  return ASN1Null.init(derEncoded:withIdentifier:)((uint64_t)&v9, (uint64_t)&v7);
}

uint64_t sub_247BD3C34(uint64_t *a1)
{
  uint64_t v2;
  char v3;

  v2 = 5;
  v3 = 0;
  return sub_247BD0A44(&v2, 0, a1);
}

double sub_247BD3C68@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  __int128 v8;
  double result;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  uint64_t v23;

  v4 = *((_BYTE *)a1 + 8);
  v5 = a1[6];
  v6 = *((_BYTE *)a1 + 56);
  v14 = *a1;
  v15 = v4;
  v7 = *((_OWORD *)a1 + 2);
  v16 = *((_OWORD *)a1 + 1);
  v17 = v7;
  v18 = v5;
  v19 = v6;
  v8 = *((_OWORD *)a1 + 5);
  v20 = *((_OWORD *)a1 + 4);
  v21 = v8;
  v12 = 3;
  v13 = 0;
  ASN1BitString.init(derEncoded:withIdentifier:)((uint64_t)&v14, (uint64_t)&v12, v22);
  if (!v2)
  {
    v10 = v23;
    result = *(double *)v22;
    v11 = v22[1];
    *(_OWORD *)a2 = v22[0];
    *(_OWORD *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 32) = v10;
  }
  return result;
}

uint64_t sub_247BD3CEC(char **a1)
{
  __int128 *v1;
  __int128 v2;
  uint64_t v4;
  char v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v2 = v1[1];
  v6 = *v1;
  v7 = v2;
  v8 = *((_QWORD *)v1 + 4);
  v4 = 3;
  v5 = 0;
  return sub_247BD55F8(&v4, 0, a1, sub_247BD782C);
}

unint64_t sub_247BD3D44()
{
  unint64_t result;

  result = qword_2576E9838;
  if (!qword_2576E9838)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Error, &type metadata for ASN1Error);
    atomic_store(result, (unint64_t *)&qword_2576E9838);
  }
  return result;
}

uint64_t sub_247BD3D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t result;

  if (a9)
  {
    j__swift_unknownObjectRelease(a3, a4, a5, a6, a7, a8 & 1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_247BD3DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24958E0A0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_247BD3E64(uint64_t a1)
{
  swift_unknownObjectRetain();
  return a1;
}

char *sub_247BD3E8C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_247BD3EA4(a1, a2, a3, a4, &qword_2576E9898);
}

char *sub_247BD3E98(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_247BD3EA4(a1, a2, a3, a4, &qword_2576E98A0);
}

char *sub_247BD3EA4(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_247BD3F98(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576E98C0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_247BD4080(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576E98C8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8])
      memmove(v12, v13, 96 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_247BD4198(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576E98B8);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_247BD4290(uint64_t a1)
{
  return sub_247BD4198(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247BD42A4(uint64_t *a1, int64_t *a2)
{
  return sub_247BDA294(*a2, a1);
}

uint64_t sub_247BD42C4(char **a1, unint64_t *a2)
{
  return sub_247BDA2C0(*a2, a1);
}

uint64_t sub_247BD42E4(uint64_t *a1, unsigned __int8 *a2)
{
  return sub_247BDA4B0(*a2, a1);
}

uint64_t sub_247BD4304(uint64_t *a1, unsigned __int16 *a2)
{
  return sub_247BDA594(*a2, a1);
}

uint64_t sub_247BD4324(uint64_t *a1, unsigned int *a2)
{
  return sub_247BDA668(*a2, a1);
}

uint64_t sub_247BD4344(char **a1, unsigned __int8 *a2)
{
  return sub_247BDA814(*a2, a1);
}

uint64_t sub_247BD4364(char **a1, unsigned __int16 *a2)
{
  return sub_247BDA998(*a2, a1);
}

uint64_t sub_247BD4384(char **a1, unsigned int *a2)
{
  return sub_247BDAB28(*a2, a1);
}

uint64_t sub_247BD43A4(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v6 = a3 >> 1;
  v7 = (a3 >> 1) - a2;
  if (!__OFSUB__(a3 >> 1, a2))
  {
    v8 = a6 >> 1;
    if (__OFSUB__(a6 >> 1, a5))
      goto LABEL_20;
    if (v7 != (a6 >> 1) - a5)
      return 0;
    if (!v7 || result + a2 == a4 + a5 || v6 == a2)
      return 1;
    if (v6 <= a2)
      goto LABEL_22;
    v9 = a2 + 1;
    v10 = *(unsigned __int8 *)(result + a2);
    if (v6 == a2)
      return 1;
    v11 = a5;
    if (v8 == a5)
      return 0;
    while (v11 >= a5 && v11 < v8)
    {
      if (v10 != *(unsigned __int8 *)(a4 + v11))
        return 0;
      if (v6 == v9)
        return 1;
      if (v9 >= v6)
        goto LABEL_21;
      v10 = *(unsigned __int8 *)(result + v9++);
      if (v8 == ++v11)
        return 0;
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_247BD4478(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = 0;
  if (*(_QWORD *)a1 == *(_QWORD *)a2
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8)
    && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16)
    && ((*(unsigned __int8 *)(a1 + 24) ^ *(unsigned __int8 *)(a2 + 24)) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 80);
    v6 = *(_QWORD *)(a1 + 88);
    v7 = *(_QWORD *)(a2 + 72);
    v8 = *(_QWORD *)(a2 + 80);
    v9 = *(_QWORD *)(a2 + 88);
    v10 = *(_QWORD *)(a2 + 64);
    v11 = *(_QWORD *)(a1 + 64);
    if ((sub_247BD43A4(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 48), *(_QWORD *)(a2 + 56)) & 1) != 0)
    {
      if (v11)
      {
        if (v10 && (sub_247BD43A4(v4, v5, v6, v7, v8, v9) & 1) != 0)
          return 1;
      }
      else if (!v10)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

unint64_t sub_247BD4550()
{
  unint64_t result;

  result = qword_2576E9850;
  if (!qword_2576E9850)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1NodeCollection, &type metadata for ASN1NodeCollection);
    atomic_store(result, (unint64_t *)&qword_2576E9850);
  }
  return result;
}

uint64_t sub_247BD4594(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_247BCDACC(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_247BD45B4(uint64_t *a1)
{
  uint64_t *v1;

  return sub_247BCED58(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_247BD45D0(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
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
  uint64_t v47;
  int64_t v48;
  char v49;
  unint64_t v50;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70[25];

  v6 = a3 >> 1;
  v7 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    return result;
  }
  v8 = a5;
  v9 = a6 >> 1;
  if (__OFSUB__(a6 >> 1, a5))
    goto LABEL_44;
  if (v7 != (a6 >> 1) - a5)
    return 0;
  if (!v7)
    return 1;
  v10 = a4;
  v11 = result + 96 * a2;
  if (v11 == a4 + 96 * a5)
    return 1;
  v50 = a6 >> 1;
  if (v6 != a2)
  {
    v18 = a5;
    if (v6 > a2)
      goto LABEL_9;
    goto LABEL_46;
  }
  v47 = a2;
  v48 = a3 >> 1;
  v45 = result;
  v64 = 0;
  v67 = 0;
  v68 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v69 = 0;
  v66 = 0;
  v56 = 0;
  v57 = 0;
  v16 = 0;
  v17 = a5;
  v18 = a5;
LABEL_10:
  v21 = (unint64_t *)(v10 + 96 * v17 + 88);
  v52 = v17;
  while (1)
  {
    if (!v14)
      return 1;
    v65 = v13 & 1;
    if (v9 == v18)
    {
      v22 = v12;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v27 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v25 = 0;
      v38 = 0;
      v26 = 0;
LABEL_33:
      v70[0] = v64;
      v70[1] = v68;
      v70[2] = v22;
      v70[3] = v65;
      v70[4] = v14;
      v70[5] = v15;
      v70[6] = v67;
      v70[7] = v69;
      v70[8] = v66;
      v70[9] = v57;
      v70[10] = v56;
      v70[11] = v16;
      v70[12] = v26;
      v70[13] = v38;
      v70[14] = v25;
      v70[15] = v37;
      v70[16] = 0;
      v70[17] = v36;
      v70[18] = v35;
      v70[19] = v34;
      v70[20] = v27;
      v70[21] = v33;
      v70[22] = v32;
      v70[23] = v31;
      sub_247BD7A8C(v70);
      return 0;
    }
    if (v17 < v8 || v18 >= v9)
      goto LABEL_45;
    v53 = v18;
    v22 = v12;
    v23 = *(v21 - 7);
    v62 = *((unsigned __int8 *)v21 - 64);
    v63 = *((unsigned __int8 *)v21 - 80);
    v54 = *v21;
    v55 = *(v21 - 1);
    v24 = *(v21 - 3);
    v60 = *(v21 - 6);
    v61 = *(v21 - 4);
    v58 = *(v21 - 2);
    v59 = *(v21 - 5);
    v25 = *(v21 - 9);
    v26 = *(v21 - 11);
    swift_unknownObjectRetain();
    v27 = v24;
    swift_unknownObjectRetain();
    if (!v23)
    {
      v38 = v63;
      v36 = v60;
      v34 = v61;
      v33 = v58;
      v35 = v59;
      v37 = v62;
      v31 = v54;
      v32 = v55;
      goto LABEL_33;
    }
    if (v64 != v26)
    {
      v29 = v22;
      v39 = v22;
      v30 = v64;
      sub_247BD7B7C(v64, v68, v39, v65, v14);
      v40 = v23;
      v41 = v26;
      v28 = v65;
      v42 = v63;
      v43 = v25;
LABEL_38:
      v44 = v62;
      goto LABEL_39;
    }
    if (v63 != v68)
    {
      sub_247BD7B7C(v64, v68, v22, v65, v14);
      v40 = v23;
      v29 = v22;
      v41 = v64;
      v30 = v64;
      v42 = v63;
      v43 = v25;
      v28 = v65;
      goto LABEL_38;
    }
    v28 = v65;
    if (v22 != v25)
    {
      sub_247BD7B7C(v64, v68, v22, v65, v14);
      v40 = v23;
      v29 = v22;
      v30 = v64;
      v41 = v64;
      v42 = v63;
      v43 = v25;
      v28 = v65;
      goto LABEL_38;
    }
    if ((_DWORD)v62 != (_DWORD)v65 || (sub_247BD43A4(v15, v67, v69, v60, v59, v61) & 1) == 0)
    {
      sub_247BD7B7C(v64, v68, v22, v65, v14);
      v40 = v23;
      v29 = v22;
      v28 = v65;
      v30 = v64;
      v41 = v64;
      v42 = v63;
      v43 = v29;
      goto LABEL_38;
    }
    if (v66)
    {
      if (!v24)
        break;
      v49 = sub_247BD43A4(v57, v56, v16, v58, v55, v54);
      sub_247BD7B7C(v64, v68, v22, v65, v14);
      v28 = v65;
      v29 = v22;
      v30 = v64;
      sub_247BD7B4C(v64, v63, v29, v62, v23);
      if ((v49 & 1) == 0)
        goto LABEL_40;
      goto LABEL_27;
    }
    if (v24)
      break;
    v29 = v22;
    sub_247BD7B7C(v64, v68, v22, v65, v14);
    v30 = v64;
    sub_247BD7B4C(v64, v63, v29, v62, v23);
LABEL_27:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    result = sub_247BD7B4C(v30, v68, v29, v28, v14);
    v64 = 0;
    v67 = 0;
    v68 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v69 = 0;
    v66 = 0;
    v56 = 0;
    v57 = 0;
    v16 = 0;
    v21 += 12;
    v18 = v53 + 1;
    v9 = v50;
    v8 = a5;
    v17 = v52;
    if (v47 != v48)
    {
      if (v47 >= v48)
        goto LABEL_47;
      result = v45;
      v10 = a4;
      a2 = v47;
      v6 = v48;
      v11 = v45 + 96 * v47;
LABEL_9:
      v48 = v6;
      v45 = result;
      v19 = result + 96 * a2;
      v14 = *(_QWORD *)(v19 + 32);
      v15 = *(_QWORD *)(v19 + 40);
      v20 = a2 + 1;
      v13 = *(_BYTE *)(v19 + 24);
      v68 = *(unsigned __int8 *)(v11 + 8);
      v16 = *(_QWORD *)(v19 + 88);
      v56 = *(_QWORD *)(v19 + 80);
      v57 = *(_QWORD *)(v19 + 72);
      v69 = *(_QWORD *)(v19 + 56);
      v66 = *(_QWORD *)(v19 + 64);
      v67 = *(_QWORD *)(v19 + 48);
      v12 = *(_QWORD *)(v19 + 16);
      v64 = *(_QWORD *)v11;
      swift_unknownObjectRetain();
      result = swift_unknownObjectRetain();
      v17 = v18;
      v47 = v20;
      goto LABEL_10;
    }
  }
  sub_247BD7B7C(v64, v68, v22, v65, v14);
  v28 = v65;
  v29 = v22;
  v30 = v64;
  v41 = v64;
  v44 = v62;
  v42 = v63;
  v43 = v29;
  v40 = v23;
LABEL_39:
  sub_247BD7B4C(v41, v42, v43, v44, v40);
LABEL_40:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_247BD7B4C(v30, v68, v29, v28, v14);
  return 0;
}

uint64_t _s9SwiftASN10B4NodeV7ContentO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;

  v2 = a1[1];
  v4 = a1[2];
  v3 = a1[3];
  v5 = a1[4];
  v6 = *((unsigned __int8 *)a1 + 40);
  v8 = *a2;
  v7 = a2[1];
  v10 = a2[2];
  v9 = a2[3];
  v11 = a2[4];
  v12 = *((unsigned __int8 *)a2 + 40);
  if ((v6 & 1) != 0)
  {
    if ((v12 & 1) != 0)
    {
      v26 = *a2;
      v13 = a2[1];
      v14 = a2[4];
      v15 = *a1;
      v23 = sub_247BD43A4(v2, v4, v3, v7, v10, v9);
      j__swift_unknownObjectRetain(v15, v2, v4, v3, v5, 1);
      j__swift_unknownObjectRetain(v26, v13, v10, v9, v14, 1);
      j__swift_unknownObjectRelease(v15, v2, v4, v3, v5, 1);
      j__swift_unknownObjectRelease(v26, v13, v10, v9, v14, 1);
      return v23 & 1;
    }
    goto LABEL_5;
  }
  if ((v12 & 1) != 0)
  {
LABEL_5:
    v22 = a1[4];
    v24 = a1[3];
    v17 = a2[1];
    v18 = *a1;
    j__swift_unknownObjectRetain(*a1, v2, v4, v24, v22, v6);
    j__swift_unknownObjectRetain(v8, v17, v10, v9, v11, v12);
    j__swift_unknownObjectRelease(v18, v2, v4, v24, v22, v6);
    j__swift_unknownObjectRelease(v8, v17, v10, v9, v11, v12);
    return 0;
  }
  v27 = *a2;
  v19 = a2[1];
  v20 = a2[4];
  v21 = *a1;
  j__swift_unknownObjectRetain(v8, v7, v10, v9, v20, 0);
  j__swift_unknownObjectRetain(v21, v2, v4, v3, v5, 0);
  j__swift_unknownObjectRetain(v21, v2, v4, v3, v5, 0);
  j__swift_unknownObjectRetain(v27, v19, v10, v9, v20, 0);
  v25 = sub_247BD45D0(v2, v4, v3, v19, v10, v9);
  j__swift_unknownObjectRelease(v21, v2, v4, v3, v5, 0);
  j__swift_unknownObjectRelease(v27, v19, v10, v9, v20, 0);
  j__swift_unknownObjectRelease(v27, v19, v10, v9, v20, 0);
  j__swift_unknownObjectRelease(v21, v2, v4, v3, v5, 0);
  return v25 & (v5 == v20);
}

uint64_t _s9SwiftASN10B4NodeV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  _OWORD v16[2];
  uint64_t v17;
  char v18;
  _OWORD v19[2];
  uint64_t v20;
  char v21;

  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8))
    return 0;
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 80);
  v8 = *(_QWORD *)(a2 + 88);
  v9 = *(_BYTE *)(a2 + 56);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_BYTE *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 32);
  v19[0] = *(_OWORD *)(a1 + 16);
  v19[1] = v13;
  v20 = v12;
  v21 = v11;
  v14 = *(_OWORD *)(a2 + 32);
  v16[0] = *(_OWORD *)(a2 + 16);
  v16[1] = v14;
  v17 = v10;
  v18 = v9;
  if ((_s9SwiftASN10B4NodeV7ContentO2eeoiySbAE_AEtFZ_0((uint64_t *)v19, (uint64_t *)v16) & 1) != 0)
    return sub_247BD43A4(v3, v4, v5, v6, v7, v8);
  else
    return 0;
}

uint64_t sub_247BD5108(uint64_t *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  char v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v8 = *((_BYTE *)a1 + 8);
  v17 = *a1;
  v18 = v8;
  sub_247BEBE7C((uint64_t)&v17, a2);
  v9 = *(char **)a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_32;
  while (1)
  {
    v11 = *((_QWORD *)v9 + 2);
    v10 = *((_QWORD *)v9 + 3);
    v12 = v11 + 1;
    if (v11 >= v10 >> 1)
      v9 = sub_247BD3F98((char *)(v10 > 1), v11 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *(_QWORD *)a3 = v9;
    result = sub_247BD1B3C(a3, a4);
    if (v4)
      return result;
    a4 = *(_QWORD *)a3;
    v14 = *(_QWORD *)(*(_QWORD *)a3 + 16);
    v15 = v14 - v12;
    if ((uint64_t)(v14 - v12) <= 127)
      break;
    if (v14 <= v11)
    {
      __break(1u);
    }
    else
    {
      v5 = 71 - __clz(v15);
      v9 = (char *)(v5 >> 3);
      sub_247BD1F84(v5 >> 3, v11 + 1, v14);
      a4 = *(_QWORD *)a3;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0)
        goto LABEL_8;
    }
    result = (uint64_t)sub_247BDE604(a4);
    a4 = result;
LABEL_8:
    if (v11 >= *(_QWORD *)(a4 + 16))
    {
      __break(1u);
      goto LABEL_36;
    }
    v16 = a4 + 32;
    *(_BYTE *)(a4 + 32 + v11) = (v5 >> 3) | 0x80;
    *(_QWORD *)a3 = a4;
    if (v11 + 1 < *(_QWORD *)(a4 + 16))
    {
      *(_BYTE *)(v16 + v11 + 1) = v15 >> (8 * (((_BYTE)v9 - 1) & 7u));
      if (v9 == (char *)1)
        goto LABEL_29;
      if (v11 + 2 < *(_QWORD *)(a4 + 16))
      {
        *(_BYTE *)(v16 + v11 + 2) = v15 >> (8 * (((_BYTE)v9 - 2) & 7u));
        if (v9 == (char *)2)
          goto LABEL_29;
        if (v11 + 3 < *(_QWORD *)(a4 + 16))
        {
          *(_BYTE *)(v16 + v11 + 3) = v15 >> (8 * (((_BYTE)v9 - 3) & 7u));
          if (v9 == (char *)3)
            goto LABEL_29;
          if (v11 + 4 < *(_QWORD *)(a4 + 16))
          {
            *(_BYTE *)(v16 + v11 + 4) = v15 >> (8 * (((_BYTE)v9 - 4) & 7u));
            if (v9 == (char *)4)
              goto LABEL_29;
            if (v11 + 5 < *(_QWORD *)(a4 + 16))
            {
              *(_BYTE *)(v16 + v11 + 5) = v15 >> (8 * (((_BYTE)v9 - 5) & 7u));
              if (v9 == (char *)5)
                goto LABEL_29;
              if (v11 + 6 < *(_QWORD *)(a4 + 16))
              {
                *(_BYTE *)(v16 + v11 + 6) = v15 >> (8 * (((_BYTE)v9 - 6) & 7u));
                if (v9 == (char *)6)
                  goto LABEL_29;
                if (v11 + 7 < *(_QWORD *)(a4 + 16))
                {
                  *(_BYTE *)(v16 + v11 + 7) = v15 >> (8 * (((_BYTE)v9 - 7) & 7u));
                  if (v9 == (char *)7)
                    goto LABEL_29;
                  if (v11 + 8 < *(_QWORD *)(a4 + 16))
                  {
                    *(_BYTE *)(v16 + v11 + 8) = v15 >> (v5 & 0x38);
LABEL_29:
                    *(_QWORD *)a3 = a4;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
LABEL_32:
    v9 = sub_247BD3F98(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
    goto LABEL_27;
LABEL_37:
  result = (uint64_t)sub_247BDE604(a4);
  a4 = result;
LABEL_27:
  if (v11 < *(_QWORD *)(a4 + 16))
  {
    *(_BYTE *)(a4 + v11 + 32) = v15;
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_247BD53D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  unint64_t v24;

  v4 = a4 >> 1;
  result = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_25:
    __break(1u);
    return result;
  }
  v6 = a3;
  result = sub_247BECA58();
  if (v4 != v6)
  {
    v21 = v4;
    while (v6 < v4)
    {
      v7 = (_QWORD *)(a2 + 96 * v6);
      v8 = v7[5];
      v9 = v7[6];
      v10 = v7[10];
      v23 = v7[9];
      v24 = v7[11];
      v12 = v7[7];
      v11 = v7[8];
      sub_247BECA58();
      sub_247BECA58();
      sub_247BECA58();
      sub_247BECA64();
      v13 = v12 >> 1;
      result = (v12 >> 1) - v9;
      if (__OFSUB__(v12 >> 1, v9))
        goto LABEL_21;
      result = sub_247BECA58();
      v14 = __OFSUB__(v13, v9);
      v15 = v13 - v9;
      if (v15)
      {
        if ((v15 < 0) ^ v14 | (v15 == 0))
          goto LABEL_23;
        v16 = v8 + v9;
        do
        {
          ++v16;
          sub_247BECA64();
          --v15;
        }
        while (v15);
      }
      if (v11)
      {
        sub_247BECA64();
        v17 = v24 >> 1;
        result = (v24 >> 1) - v10;
        if (__OFSUB__(v24 >> 1, v10))
          goto LABEL_22;
        result = sub_247BECA58();
        v18 = __OFSUB__(v17, v10);
        v19 = v17 - v10;
        if (v19)
        {
          if ((v19 < 0) ^ v18 | (v19 == 0))
            goto LABEL_24;
          v20 = v23 + v10;
          do
          {
            ++v20;
            result = sub_247BECA64();
            --v19;
          }
          while (v19);
        }
      }
      else
      {
        result = sub_247BECA64();
      }
      ++v6;
      v4 = v21;
      if (v6 == v21)
        return result;
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  return result;
}

void sub_247BD5538(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  int64_t v5;
  int64_t v6;
  _QWORD *v7;

  v5 = a4 >> 1;
  v6 = a3;
  if (a4 >> 1 != a3)
  {
    v7 = (_QWORD *)(a2 + 96 * a3 + 16);
    v6 = a3;
    while (1)
    {
      if (v6 >= v5)
      {
        __break(1u);
        goto LABEL_13;
      }
      if (*(_QWORD *)(a5 + 16) >= *v7)
        break;
      ++v6;
      v7 += 12;
      if (v5 == v6)
      {
        v6 = a4 >> 1;
        break;
      }
    }
    if (v6 >= a3)
      goto LABEL_8;
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_8:
  if (v5 < a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v5 < v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v6 < 0)
LABEL_16:
    __break(1u);
}

uint64_t sub_247BD55BC(uint64_t *a1, char a2, char **a3, uint64_t (*a4)(char **))
{
  return sub_247BD55F8(a1, a2, a3, a4);
}

uint64_t sub_247BD55D0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 + 24) + 8))(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_247BD55F8(uint64_t *a1, char a2, char **a3, uint64_t (*a4)(char **))
{
  uint64_t v4;
  unint64_t v5;
  char v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;

  v8 = *((_BYTE *)a1 + 8);
  v17 = *a1;
  v18 = v8;
  sub_247BEBE7C((uint64_t)&v17, a2);
  v9 = *a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_32;
  while (1)
  {
    v11 = *((_QWORD *)v9 + 2);
    v10 = *((_QWORD *)v9 + 3);
    v12 = v11 + 1;
    if (v11 >= v10 >> 1)
      v9 = sub_247BD3F98((char *)(v10 > 1), v11 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v12;
    v9[v11 + 32] = 0;
    *a3 = v9;
    result = a4(a3);
    if (v4)
      return result;
    v9 = *a3;
    v14 = *((_QWORD *)*a3 + 2);
    v15 = v14 - v12;
    if ((uint64_t)(v14 - v12) <= 127)
      break;
    if (v14 <= v11)
    {
      __break(1u);
    }
    else
    {
      v5 = 71 - __clz(v15);
      a4 = (uint64_t (*)(char **))(v5 >> 3);
      sub_247BD1F84(v5 >> 3, v11 + 1, v14);
      v9 = *a3;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0)
        goto LABEL_8;
    }
    result = (uint64_t)sub_247BDE604((uint64_t)v9);
    v9 = (char *)result;
LABEL_8:
    if (v11 >= *((_QWORD *)v9 + 2))
    {
      __break(1u);
      goto LABEL_36;
    }
    v16 = v9 + 32;
    v9[v11 + 32] = (v5 >> 3) | 0x80;
    *a3 = v9;
    if (v11 + 1 < *((_QWORD *)v9 + 2))
    {
      v16[v11 + 1] = v15 >> (8 * (((_BYTE)a4 - 1) & 7u));
      if (a4 == (uint64_t (*)(char **))1)
        goto LABEL_29;
      if (v11 + 2 < *((_QWORD *)v9 + 2))
      {
        v16[v11 + 2] = v15 >> (8 * (((_BYTE)a4 - 2) & 7u));
        if (a4 == (uint64_t (*)(char **))2)
          goto LABEL_29;
        if (v11 + 3 < *((_QWORD *)v9 + 2))
        {
          v16[v11 + 3] = v15 >> (8 * (((_BYTE)a4 - 3) & 7u));
          if (a4 == (uint64_t (*)(char **))3)
            goto LABEL_29;
          if (v11 + 4 < *((_QWORD *)v9 + 2))
          {
            v16[v11 + 4] = v15 >> (8 * (((_BYTE)a4 - 4) & 7u));
            if (a4 == (uint64_t (*)(char **))4)
              goto LABEL_29;
            if (v11 + 5 < *((_QWORD *)v9 + 2))
            {
              v16[v11 + 5] = v15 >> (8 * (((_BYTE)a4 - 5) & 7u));
              if (a4 == (uint64_t (*)(char **))5)
                goto LABEL_29;
              if (v11 + 6 < *((_QWORD *)v9 + 2))
              {
                v16[v11 + 6] = v15 >> (8 * (((_BYTE)a4 - 6) & 7u));
                if (a4 == (uint64_t (*)(char **))6)
                  goto LABEL_29;
                if (v11 + 7 < *((_QWORD *)v9 + 2))
                {
                  v16[v11 + 7] = v15 >> (8 * (((_BYTE)a4 - 7) & 7u));
                  if (a4 == (uint64_t (*)(char **))7)
                    goto LABEL_29;
                  if (v11 + 8 < *((_QWORD *)v9 + 2))
                  {
                    v16[v11 + 8] = v15 >> (v5 & 0x38);
LABEL_29:
                    *a3 = v9;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
    __break(1u);
LABEL_32:
    v9 = sub_247BD3F98(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
    goto LABEL_27;
LABEL_37:
  result = (uint64_t)sub_247BDE604((uint64_t)v9);
  v9 = (char *)result;
LABEL_27:
  if (v11 < *((_QWORD *)v9 + 2))
  {
    v9[v11 + 32] = v15;
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_247BD58CC(uint64_t a1)
{
  uint64_t v1;

  return sub_247BD13A0(a1, *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16), *(char **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_247BD58E8@<X0>(_QWORD *a1@<X1>, unint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_247BD17A8(*(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 32), a1, a2);
}

uint64_t sub_247BD5908(uint64_t *a1, char a2, char **a3, uint64_t *a4, unint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t result;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v7 = v5;
  v11 = *((_BYTE *)a1 + 8);
  v24 = *a1;
  v25 = v11;
  sub_247BEBE7C((uint64_t)&v24, a2);
  v12 = *a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_43;
  while (1)
  {
    v14 = *((_QWORD *)v12 + 2);
    v13 = *((_QWORD *)v12 + 3);
    v15 = v14 + 1;
    if (v14 >= v13 >> 1)
      v12 = sub_247BD3F98((char *)(v13 > 1), v14 + 1, 1, v12);
    *((_QWORD *)v12 + 2) = v15;
    v12[v14 + 32] = 0;
    *a3 = v12;
    v16 = a4[2];
    if (v16)
    {
      v26 = v7;
      v12 = (char *)(a5 + 32);
      v7 = *(_QWORD *)(a5 + 16);
      swift_bridgeObjectRetain();
      a4 += 5;
      while (1)
      {
        v17 = *(a4 - 1);
        if (v17 < 0)
          break;
        v18 = *a4;
        if (v7 < v17 || v7 < v18)
          goto LABEL_40;
        if (v18 < 0)
          goto LABEL_41;
        a4 += 2;
        v6 = (2 * v18) | 1;
        v20 = swift_bridgeObjectRetain();
        sub_247BE2594(v20, a5 + 32, v17, v6);
        swift_bridgeObjectRelease();
        if (!--v16)
        {
          swift_bridgeObjectRelease();
          v12 = *a3;
          v7 = v26;
          v15 = v14 + 1;
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
LABEL_14:
    v21 = *((_QWORD *)v12 + 2);
    a5 = v21 - v15;
    if ((uint64_t)(v21 - v15) <= 127)
      break;
    if (v21 <= v14)
    {
      __break(1u);
      goto LABEL_45;
    }
    v6 = 71 - __clz(a5);
    a4 = (uint64_t *)(v6 >> 3);
    sub_247BD1F84(v6 >> 3, v15, v21);
    v12 = *a3;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
      goto LABEL_46;
LABEL_17:
    if (v14 >= *((_QWORD *)v12 + 2))
    {
      __break(1u);
      goto LABEL_48;
    }
    v23 = v12 + 32;
    v12[v14 + 32] = (v6 >> 3) | 0x80;
    *a3 = v12;
    if (v14 + 1 < *((_QWORD *)v12 + 2))
    {
      v23[v14 + 1] = a5 >> (8 * (((_BYTE)a4 - 1) & 7u));
      if (a4 == (uint64_t *)1)
        goto LABEL_38;
      if (v14 + 2 < *((_QWORD *)v12 + 2))
      {
        v23[v14 + 2] = a5 >> (8 * (((_BYTE)a4 - 2) & 7u));
        if (a4 == (uint64_t *)2)
          goto LABEL_38;
        if (v14 + 3 < *((_QWORD *)v12 + 2))
        {
          v23[v14 + 3] = a5 >> (8 * (((_BYTE)a4 - 3) & 7u));
          if (a4 == (uint64_t *)3)
            goto LABEL_38;
          if (v14 + 4 < *((_QWORD *)v12 + 2))
          {
            v23[v14 + 4] = a5 >> (8 * (((_BYTE)a4 - 4) & 7u));
            if (a4 == (uint64_t *)4)
              goto LABEL_38;
            if (v14 + 5 < *((_QWORD *)v12 + 2))
            {
              v23[v14 + 5] = a5 >> (8 * (((_BYTE)a4 - 5) & 7u));
              if (a4 == (uint64_t *)5)
                goto LABEL_38;
              if (v14 + 6 < *((_QWORD *)v12 + 2))
              {
                v23[v14 + 6] = a5 >> (8 * (((_BYTE)a4 - 6) & 7u));
                if (a4 == (uint64_t *)6)
                  goto LABEL_38;
                if (v14 + 7 < *((_QWORD *)v12 + 2))
                {
                  v23[v14 + 7] = a5 >> (8 * (((_BYTE)a4 - 7) & 7u));
                  if (a4 == (uint64_t *)7)
                    goto LABEL_38;
                  if (v14 + 8 < *((_QWORD *)v12 + 2))
                  {
                    v23[v14 + 8] = a5 >> (v6 & 0x38);
LABEL_38:
                    *a3 = v12;
                    return result;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_42:
    __break(1u);
LABEL_43:
    v12 = sub_247BD3F98(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
  }
  if ((a5 & 0x8000000000000000) != 0)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    result = (uint64_t)sub_247BDE604((uint64_t)v12);
    v12 = (char *)result;
    goto LABEL_17;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
    goto LABEL_36;
LABEL_48:
  result = (uint64_t)sub_247BDE604((uint64_t)v12);
  v12 = (char *)result;
LABEL_36:
  if (v14 < *((_QWORD *)v12 + 2))
  {
    v12[v14 + 32] = a5;
    goto LABEL_38;
  }
  __break(1u);
  return result;
}

uint64_t sub_247BD5C58(uint64_t __src, uint64_t *__dst, unint64_t a3, char *a4, uint64_t a5)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t *v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  int64_t *v30;
  BOOL v31;
  uint64_t *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  uint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  BOOL v48;
  uint64_t *v49;
  int64_t *v50;
  uint64_t v51;
  uint64_t *v53;

  v6 = __dst;
  v7 = (uint64_t *)__src;
  v8 = (uint64_t)__dst - __src;
  v9 = (uint64_t)__dst - __src + 15;
  if ((uint64_t)__dst - __src >= 0)
    v9 = (uint64_t)__dst - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)__dst;
  v12 = a3 - (_QWORD)__dst + 15;
  if ((uint64_t)(a3 - (_QWORD)__dst) >= 0)
    v12 = a3 - (_QWORD)__dst;
  v13 = v12 >> 4;
  if (v10 < v12 >> 4)
  {
    v14 = (int64_t *)a4;
    if (a4 != (char *)__src || __src + 16 * v10 <= (unint64_t)a4)
      __src = (uint64_t)memmove(a4, (const void *)__src, 16 * v10);
    v15 = &a4[16 * v10];
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      v16 = *(_QWORD *)(a5 + 16);
      while (1)
      {
        v17 = *v6;
        if (*v6 < 0)
        {
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
        v18 = v6[1];
        if (v18 < 0)
          goto LABEL_75;
        v19 = *v14;
        if (*v14 < 0)
          goto LABEL_76;
        v20 = v14[1];
        if (v16 < v17 || v16 < v18 || v16 < v19 || v16 < v20)
          goto LABEL_77;
        if (v20 < 0)
          goto LABEL_78;
        v24 = v6;
        v25 = v15;
        v26 = (2 * v18) | 1;
        v27 = (2 * v20) | 1;
        v28 = swift_bridgeObjectRetain();
        sub_247BD1858(v28, a5 + 32, v17, v26, a5, a5 + 32, v19, v27);
        LOBYTE(v27) = v29;
        __src = swift_bridgeObjectRelease();
        if ((v27 & 1) == 0)
          break;
        v30 = v24;
        v6 = v24 + 2;
        v15 = v25;
        if (v7 != v24)
          goto LABEL_30;
LABEL_31:
        v7 += 2;
        if (v14 >= (int64_t *)v15 || (unint64_t)v6 >= a3)
        {
          v6 = v7;
          goto LABEL_70;
        }
      }
      v30 = v14;
      v31 = v7 == v14;
      v14 += 2;
      v6 = v24;
      v15 = v25;
      if (v31)
        goto LABEL_31;
LABEL_30:
      *(_OWORD *)v7 = *(_OWORD *)v30;
      goto LABEL_31;
    }
    v6 = v7;
LABEL_70:
    if (v6 != v14
      || v6 >= (int64_t *)((char *)v14
                                + ((v15 - (char *)v14 + (v15 - (char *)v14 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0)))
    {
      memmove(v6, v14, 16 * ((v15 - (char *)v14) / 16));
    }
    return 1;
  }
  if (a4 != (char *)__dst || &__dst[2 * v13] <= (uint64_t *)a4)
    __src = (uint64_t)memmove(a4, __dst, 16 * v13);
  v15 = &a4[16 * v13];
  v14 = (int64_t *)a4;
  if (v7 >= v6 || v11 < 16)
    goto LABEL_70;
  v50 = (int64_t *)a4;
  v51 = *(_QWORD *)(a5 + 16);
  v32 = (uint64_t *)(a3 - 16);
  v49 = v7;
  while (1)
  {
    v34 = v15 - 16;
    v33 = *((_QWORD *)v15 - 2);
    if (v33 < 0)
      goto LABEL_79;
    v35 = *((_QWORD *)v15 - 1);
    if (v35 < 0)
      break;
    v36 = v6 - 2;
    v37 = *(v6 - 2);
    if (v37 < 0)
      goto LABEL_81;
    v38 = *(v6 - 1);
    if (v51 < v33 || v51 < v35 || v51 < v37 || v51 < v38)
      goto LABEL_82;
    if (v38 < 0)
      goto LABEL_83;
    v53 = (uint64_t *)v15;
    v42 = v32 + 2;
    v43 = (2 * v35) | 1;
    v44 = (2 * v38) | 1;
    v45 = swift_bridgeObjectRetain();
    sub_247BD1858(v45, a5 + 32, v33, v43, a5, a5 + 32, v37, v44);
    LOBYTE(v43) = v46;
    __src = swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
    {
      v47 = (unint64_t)v49;
      v36 = (uint64_t *)v34;
      if (v42 == v53)
      {
        v15 = v34;
        v14 = v50;
        if (v32 < v53)
          goto LABEL_66;
        goto LABEL_65;
      }
      v15 = v34;
LABEL_64:
      v14 = v50;
LABEL_65:
      *(_OWORD *)v32 = *(_OWORD *)v36;
      goto LABEL_66;
    }
    v47 = (unint64_t)v49;
    v15 = (char *)v53;
    if (v42 != v6)
    {
      v6 -= 2;
      goto LABEL_64;
    }
    v48 = v32 >= v6;
    v6 -= 2;
    v14 = v50;
    if (v48)
      goto LABEL_65;
LABEL_66:
    if ((unint64_t)v6 > v47)
    {
      v32 -= 2;
      if (v15 > (char *)v14)
        continue;
    }
    goto LABEL_70;
  }
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
  return __src;
}

uint64_t sub_247BD5FF0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  BOOL v23;
  BOOL v24;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int64_t *v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  int v42;
  __int128 *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 *v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v60;
  uint64_t v61;
  __int128 *v62;
  unsigned int v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  unsigned int v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  BOOL v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  char v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  unint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  __int128 v130;
  uint64_t v131;
  int64_t v132;
  uint64_t v133;
  BOOL v134;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  char v139;
  char v140;
  _OWORD *v141;
  __int128 v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  unint64_t v150;
  char *v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167[2];
  unint64_t v168;
  int v169[2];
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;

  v5 = a1[1];
  swift_bridgeObjectRetain_n();
  v6 = sub_247BEC9E0();
  v174 = a2;
  v162 = v5;
  if (v6 < v5)
  {
    if (v5 >= 0)
      v7 = v5;
    else
      v7 = v5 + 1;
    if (v5 < -1)
    {
LABEL_258:
      __break(1u);
      goto LABEL_259;
    }
    v157 = v6;
    v170 = v2;
    v154 = a1;
    if (v5 <= 1)
    {
      v11 = MEMORY[0x24BEE4AF8];
      v161 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if (v5 != 1)
      {
        v71 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
        v14 = (char *)MEMORY[0x24BEE4AF8];
        goto LABEL_191;
      }
      v156 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v8 = v7 >> 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9858);
      v9 = sub_247BEC7DC();
      *(_QWORD *)(v9 + 16) = v8;
      v156 = v9;
      v161 = (char *)(v9 + 32);
    }
    v12 = 0;
    v13 = *a1;
    v165 = a2 + 32;
    v155 = *a1 + 40;
    v153 = *a1 - 16;
    v158 = a2 + 33;
    v14 = (char *)MEMORY[0x24BEE4AF8];
    v171 = *a1;
LABEL_15:
    while (2)
    {
      v15 = v12++;
      v160 = v14;
      *(_QWORD *)v167 = v15;
      if (v12 >= v5)
        goto LABEL_59;
      v16 = (uint64_t *)(v13 + 16 * v12);
      v17 = *v16;
      if (*v16 < 0)
        goto LABEL_252;
      v18 = v16[1];
      if (v18 < 0)
        goto LABEL_253;
      v19 = (unint64_t *)(v13 + 16 * v15);
      v20 = *v19;
      if ((*v19 & 0x8000000000000000) != 0)
        goto LABEL_254;
      v21 = v19[1];
      v22 = *(_QWORD *)(a2 + 16);
      v23 = v22 >= v21 && v22 >= v20;
      v24 = !v23 || v22 < v17;
      if (v24 || v22 < v18)
        goto LABEL_255;
      if (v21 < 0)
        goto LABEL_256;
      v26 = (2 * v18) | 1;
      v27 = (2 * v21) | 1;
      v28 = swift_bridgeObjectRetain();
      sub_247BD1858(v28, v165, v17, v26, a2, v165, v20, v27);
      v30 = v29;
      swift_bridgeObjectRelease();
      v12 = *(_QWORD *)v167 + 2;
      if (*(_QWORD *)v167 + 2 >= v5)
      {
LABEL_51:
        v13 = v171;
        v15 = *(_QWORD *)v167;
        if ((v30 & 1) == 0)
          goto LABEL_59;
      }
      else
      {
        v31 = (int64_t *)(v155 + 16 * *(_QWORD *)v167);
        do
        {
          v32 = *(v31 - 1);
          if (v32 < 0)
            goto LABEL_230;
          v33 = *v31;
          if (*v31 < 0)
            goto LABEL_231;
          v34 = *(v31 - 3);
          if (v34 < 0)
            goto LABEL_232;
          v35 = *(v31 - 2);
          if (v22 < v32 || v22 < v33 || v22 < v34 || v22 < v35)
            goto LABEL_233;
          if (v35 < 0)
            goto LABEL_234;
          v39 = (2 * v33) | 1;
          v40 = (2 * v35) | 1;
          v41 = swift_bridgeObjectRetain();
          sub_247BD1858(v41, v165, v32, v39, v174, v165, v34, v40);
          LODWORD(v40) = v42;
          swift_bridgeObjectRelease();
          if (((v30 ^ v40) & 1) != 0)
          {
            a2 = v174;
            v14 = v160;
            goto LABEL_51;
          }
          v31 += 2;
          ++v12;
          v14 = v160;
          v13 = v171;
        }
        while (v5 != v12);
        v12 = v5;
        a2 = v174;
        v15 = *(_QWORD *)v167;
        if ((v30 & 1) == 0)
          goto LABEL_59;
      }
      if (v12 < v15)
        goto LABEL_262;
      if (v15 < v12)
      {
        v43 = (__int128 *)(v153 + 16 * v12);
        v44 = v12;
        v45 = v15;
        v46 = (__int128 *)(v13 + 16 * v15);
        do
        {
          if (v45 != --v44)
          {
            if (!v13)
              goto LABEL_266;
            v47 = *v46;
            *v46 = *v43;
            *v43 = v47;
          }
          ++v45;
          --v43;
          ++v46;
        }
        while (v45 < v44);
      }
LABEL_59:
      if (v12 < v5)
      {
        if (__OFSUB__(v12, v15))
          goto LABEL_257;
        if (v12 - v15 < v157)
        {
          v48 = v15 + v157;
          if (__OFADD__(v15, v157))
            goto LABEL_260;
          if (v48 >= v5)
            v48 = v5;
          if (v48 < v15)
            goto LABEL_261;
          if (v12 != v48)
          {
            v49 = *(_QWORD *)(a2 + 16);
            v159 = v48;
LABEL_70:
            v50 = *(_OWORD *)(v13 + 16 * v12);
            v163 = v12;
            v51 = v12;
            while (1)
            {
              v52 = v50;
              if ((v50 & 0x8000000000000000) != 0)
                goto LABEL_212;
              v53 = *((_QWORD *)&v50 + 1);
              if ((*((_QWORD *)&v50 + 1) & 0x8000000000000000) != 0)
                goto LABEL_213;
              v54 = v51 - 1;
              v55 = (uint64_t *)(v13 + 16 * (v51 - 1));
              v56 = *v55;
              if (*v55 < 0)
                goto LABEL_214;
              if (v49 < (uint64_t)v50)
                goto LABEL_215;
              v57 = v55[1];
              v58 = v49 < *((uint64_t *)&v50 + 1) || v49 < v56;
              if (v58 || v49 < v57)
                goto LABEL_215;
              if (v57 < 0)
                goto LABEL_216;
              v60 = *((_QWORD *)&v50 + 1) - v50;
              if (*((_QWORD *)&v50 + 1) != (_QWORD)v50)
              {
                if (*((_QWORD *)&v50 + 1) <= (unint64_t)v50)
                  goto LABEL_229;
                if (v57 != v56)
                {
                  if (v57 <= (unint64_t)v56)
                    goto LABEL_245;
                  v63 = *(unsigned __int8 *)(v165 + v50);
                  v64 = *(unsigned __int8 *)(v165 + v56);
                  if (v63 < v64)
                    goto LABEL_98;
                  if (v64 < v63)
                    goto LABEL_69;
                  v65 = 0;
                  while (~(_QWORD)v50 + *((_QWORD *)&v50 + 1) != v65)
                  {
                    if ((uint64_t)v50 + v65 + 1 >= *((uint64_t *)&v50 + 1))
                      goto LABEL_217;
                    if (~v56 + v57 == v65)
                      break;
                    v66 = v56 + v65 + 1;
                    if (v66 < v56 || v66 >= v57)
                      goto LABEL_218;
                    v67 = *(unsigned __int8 *)(v158 + v50 + v65);
                    v68 = *(unsigned __int8 *)(v158 + v56 + v65);
                    if (v67 < v68)
                      goto LABEL_98;
                    ++v65;
                    if (v68 < v67)
                      goto LABEL_69;
                  }
                }
              }
              swift_unknownObjectRetain();
              if (v60 < 0)
                goto LABEL_224;
              if (v53 == v52 || v57 - v56 < 0 || (v61 = v57, v57 - v56 >= v60))
              {
                v61 = v56 + v60;
                if (__OFADD__(v56, v60))
                  goto LABEL_228;
                if (v57 < v61)
                  goto LABEL_220;
              }
              if (v61 < v56)
                goto LABEL_225;
              if (v57 < v56)
                goto LABEL_226;
              if (v61 == v57)
                goto LABEL_68;
              if (v61 >= v57)
                goto LABEL_227;
              if (!*(_BYTE *)(v165 + v61))
              {
                if (v61 + 1 != v57)
                {
                  while (v61 + 1 < v57)
                  {
                    if (*(_BYTE *)(a2 + v61 + 33))
                      goto LABEL_97;
                    if (v57 - 1 == ++v61)
                      goto LABEL_68;
                  }
                  __break(1u);
                  goto LABEL_207;
                }
LABEL_68:
                swift_bridgeObjectRelease();
                v13 = v171;
LABEL_69:
                v12 = v163 + 1;
                if (v163 + 1 != v159)
                  goto LABEL_70;
                v12 = v159;
                v5 = v162;
                v14 = v160;
                v15 = *(_QWORD *)v167;
                break;
              }
LABEL_97:
              swift_bridgeObjectRelease();
              v13 = v171;
LABEL_98:
              if (!v13)
                goto LABEL_265;
              v62 = (__int128 *)(v13 + 16 * v51);
              v50 = *v62;
              *v62 = *(_OWORD *)v55;
              *(_OWORD *)v55 = v50;
              --v51;
              if (v54 == *(_QWORD *)v167)
                goto LABEL_69;
            }
          }
        }
      }
      if (v12 < v15)
        goto LABEL_251;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v14 = sub_247BD4198(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
      v70 = *((_QWORD *)v14 + 2);
      v69 = *((_QWORD *)v14 + 3);
      v71 = v70 + 1;
      v13 = v171;
      if (v70 >= v69 >> 1)
      {
        v122 = sub_247BD4198((char *)(v69 > 1), v70 + 1, 1, v14);
        v13 = v171;
        v14 = v122;
      }
      *((_QWORD *)v14 + 2) = v71;
      v72 = v14 + 32;
      v73 = &v14[16 * v70 + 32];
      *(_QWORD *)v73 = *(_QWORD *)v167;
      *((_QWORD *)v73 + 1) = v12;
      if (v70)
      {
        v164 = v12;
        while (1)
        {
          v74 = v71 - 1;
          if (v71 >= 4)
          {
            v79 = &v72[16 * v71];
            v80 = *((_QWORD *)v79 - 8);
            v81 = *((_QWORD *)v79 - 7);
            v85 = __OFSUB__(v81, v80);
            v82 = v81 - v80;
            if (v85)
              goto LABEL_235;
            v84 = *((_QWORD *)v79 - 6);
            v83 = *((_QWORD *)v79 - 5);
            v85 = __OFSUB__(v83, v84);
            v77 = v83 - v84;
            v78 = v85;
            if (v85)
              goto LABEL_236;
            v86 = v71 - 2;
            v87 = &v72[16 * v71 - 32];
            v89 = *(_QWORD *)v87;
            v88 = *((_QWORD *)v87 + 1);
            v85 = __OFSUB__(v88, v89);
            v90 = v88 - v89;
            if (v85)
              goto LABEL_237;
            v85 = __OFADD__(v77, v90);
            v91 = v77 + v90;
            if (v85)
              goto LABEL_239;
            if (v91 >= v82)
            {
              v109 = &v72[16 * v74];
              v111 = *(_QWORD *)v109;
              v110 = *((_QWORD *)v109 + 1);
              v85 = __OFSUB__(v110, v111);
              v112 = v110 - v111;
              if (v85)
                goto LABEL_246;
              v102 = v77 < v112;
              goto LABEL_157;
            }
          }
          else
          {
            if (v71 != 3)
            {
              v103 = *((_QWORD *)v14 + 4);
              v104 = *((_QWORD *)v14 + 5);
              v85 = __OFSUB__(v104, v103);
              v96 = v104 - v103;
              v97 = v85;
LABEL_151:
              if ((v97 & 1) != 0)
                goto LABEL_241;
              v105 = &v72[16 * v74];
              v107 = *(_QWORD *)v105;
              v106 = *((_QWORD *)v105 + 1);
              v85 = __OFSUB__(v106, v107);
              v108 = v106 - v107;
              if (v85)
                goto LABEL_243;
              if (v108 < v96)
                goto LABEL_14;
              goto LABEL_159;
            }
            v76 = *((_QWORD *)v14 + 4);
            v75 = *((_QWORD *)v14 + 5);
            v85 = __OFSUB__(v75, v76);
            v77 = v75 - v76;
            v78 = v85;
          }
          if ((v78 & 1) != 0)
            goto LABEL_238;
          v86 = v71 - 2;
          v92 = &v72[16 * v71 - 32];
          v94 = *(_QWORD *)v92;
          v93 = *((_QWORD *)v92 + 1);
          v95 = __OFSUB__(v93, v94);
          v96 = v93 - v94;
          v97 = v95;
          if (v95)
            goto LABEL_240;
          v98 = &v72[16 * v74];
          v100 = *(_QWORD *)v98;
          v99 = *((_QWORD *)v98 + 1);
          v85 = __OFSUB__(v99, v100);
          v101 = v99 - v100;
          if (v85)
            goto LABEL_242;
          if (__OFADD__(v96, v101))
            goto LABEL_244;
          if (v96 + v101 < v77)
            goto LABEL_151;
          v102 = v77 < v101;
LABEL_157:
          if (v102)
            v74 = v86;
LABEL_159:
          v113 = v74 - 1;
          if (v74 - 1 >= v71)
            goto LABEL_219;
          if (!v13)
            goto LABEL_264;
          v114 = &v72[16 * v113];
          v115 = *(_QWORD *)v114;
          v116 = v74;
          v117 = &v72[16 * v74];
          v118 = *((_QWORD *)v117 + 1);
          v119 = v13 + 16 * *(_QWORD *)v114;
          v120 = (uint64_t *)(v13 + 16 * *(_QWORD *)v117);
          v168 = v13 + 16 * v118;
          swift_bridgeObjectRetain();
          sub_247BD5C58(v119, v120, v168, v161, v174);
          if (v170)
          {
LABEL_169:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            *(_QWORD *)(v156 + 16) = 0;
            swift_bridgeObjectRelease_n();
            return swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          if (v118 < v115)
            goto LABEL_221;
          if (v116 > *((_QWORD *)v14 + 2))
            goto LABEL_222;
          *(_QWORD *)v114 = v115;
          v72 = v14 + 32;
          *(_QWORD *)&v14[16 * v113 + 40] = v118;
          v121 = *((_QWORD *)v14 + 2);
          if (v116 >= v121)
            goto LABEL_223;
          v170 = 0;
          v71 = v121 - 1;
          memmove(v117, v117 + 16, 16 * (v121 - 1 - v116));
          *((_QWORD *)v14 + 2) = v121 - 1;
          v24 = v121 > 2;
          a2 = v174;
          v5 = v162;
          v12 = v164;
          v13 = v171;
          if (!v24)
          {
LABEL_14:
            if (v12 >= v5)
              goto LABEL_205;
            goto LABEL_15;
          }
        }
      }
      v71 = 1;
      if (v12 < v5)
        continue;
      break;
    }
LABEL_205:
    v11 = v156;
LABEL_191:
    v156 = v11;
    if (v71 < 2)
    {
LABEL_202:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v156 + 16) = 0;
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    v143 = *v154;
    v173 = *v154;
    while (1)
    {
      v144 = v71 - 2;
      if (v71 < 2)
        break;
      if (!v143)
        goto LABEL_267;
      v145 = (uint64_t)v14;
      v146 = *(_QWORD *)&v14[16 * v144 + 32];
      v147 = *(_QWORD *)&v14[16 * v71 + 24];
      v148 = v143 + 16 * v146;
      v149 = (uint64_t *)(v143 + 16 * *(_QWORD *)&v14[16 * v71 + 16]);
      v150 = v143 + 16 * v147;
      swift_bridgeObjectRetain();
      sub_247BD5C58(v148, v149, v150, v161, v174);
      if (v170)
        goto LABEL_169;
      swift_bridgeObjectRelease();
      if (v147 < v146)
        goto LABEL_248;
      v14 = (char *)v145;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v14 = sub_247BD4290(v145);
      if (v144 >= *((_QWORD *)v14 + 2))
        goto LABEL_249;
      v151 = &v14[16 * v144 + 32];
      *(_QWORD *)v151 = v146;
      *((_QWORD *)v151 + 1) = v147;
      v152 = *((_QWORD *)v14 + 2);
      if (v71 > v152)
        goto LABEL_250;
      memmove(&v14[16 * v71 + 16], &v14[16 * v71 + 32], 16 * (v152 - v71));
      *((_QWORD *)v14 + 2) = v152 - 1;
      v71 = v152 - 1;
      v143 = v173;
      if (v152 <= 2)
        goto LABEL_202;
    }
LABEL_247:
    __break(1u);
LABEL_248:
    __break(1u);
LABEL_249:
    __break(1u);
LABEL_250:
    __break(1u);
LABEL_251:
    __break(1u);
LABEL_252:
    __break(1u);
LABEL_253:
    __break(1u);
LABEL_254:
    __break(1u);
LABEL_255:
    __break(1u);
LABEL_256:
    __break(1u);
LABEL_257:
    __break(1u);
    goto LABEL_258;
  }
  if ((v5 & 0x8000000000000000) == 0)
  {
    if ((unint64_t)v5 <= 1)
      return swift_bridgeObjectRelease_n();
    v123 = *a1;
    v124 = a2 + 32;
    v125 = *(_QWORD *)(a2 + 16);
    swift_bridgeObjectRetain();
    v126 = -1;
    v127 = v123;
    v128 = v123;
    v129 = 1;
LABEL_172:
    v166 = v129;
    v130 = *(_OWORD *)(v127 + 16 * v129);
    v172 = v126;
    *(_QWORD *)v169 = v128;
    while (1)
    {
      v131 = v130;
      if ((v130 & 0x8000000000000000) != 0)
        break;
      if ((*((_QWORD *)&v130 + 1) & 0x8000000000000000) != 0)
        goto LABEL_208;
      v132 = *(_QWORD *)v128;
      if ((*(_QWORD *)v128 & 0x8000000000000000) != 0)
        goto LABEL_209;
      if (v125 < (uint64_t)v130)
        goto LABEL_210;
      v133 = *(_QWORD *)(v128 + 8);
      v134 = v125 < *((uint64_t *)&v130 + 1) || v125 < v132;
      if (v134 || v125 < v133)
        goto LABEL_210;
      if (v133 < 0)
        goto LABEL_211;
      v136 = (2 * *((_QWORD *)&v130 + 1)) | 1;
      v137 = (2 * v133) | 1;
      v138 = swift_bridgeObjectRetain();
      sub_247BD1858(v138, v124, v131, v136, v174, v124, v132, v137);
      v140 = v139;
      swift_bridgeObjectRelease();
      if ((v140 & 1) != 0)
      {
        if (!v127)
          goto LABEL_263;
        v141 = (_OWORD *)(v128 + 16);
        v142 = *(_OWORD *)v128;
        v130 = *(_OWORD *)(v128 + 16);
        *(_OWORD *)v128 = v130;
        v128 -= 16;
        *v141 = v142;
        v23 = __CFADD__(v126++, 1);
        if (!v23)
          continue;
      }
      v129 = v166 + 1;
      v128 = *(_QWORD *)v169 + 16;
      v126 = v172 - 1;
      if (v166 + 1 == v162)
        return swift_bridgeObjectRelease_n();
      goto LABEL_172;
    }
LABEL_207:
    __break(1u);
LABEL_208:
    __break(1u);
LABEL_209:
    __break(1u);
LABEL_210:
    __break(1u);
LABEL_211:
    __break(1u);
LABEL_212:
    __break(1u);
LABEL_213:
    __break(1u);
LABEL_214:
    __break(1u);
LABEL_215:
    __break(1u);
LABEL_216:
    __break(1u);
LABEL_217:
    __break(1u);
LABEL_218:
    __break(1u);
LABEL_219:
    __break(1u);
LABEL_220:
    __break(1u);
LABEL_221:
    __break(1u);
LABEL_222:
    __break(1u);
LABEL_223:
    __break(1u);
LABEL_224:
    __break(1u);
LABEL_225:
    __break(1u);
LABEL_226:
    __break(1u);
LABEL_227:
    __break(1u);
LABEL_228:
    __break(1u);
LABEL_229:
    __break(1u);
LABEL_230:
    __break(1u);
LABEL_231:
    __break(1u);
LABEL_232:
    __break(1u);
LABEL_233:
    __break(1u);
LABEL_234:
    __break(1u);
LABEL_235:
    __break(1u);
LABEL_236:
    __break(1u);
LABEL_237:
    __break(1u);
LABEL_238:
    __break(1u);
LABEL_239:
    __break(1u);
LABEL_240:
    __break(1u);
LABEL_241:
    __break(1u);
LABEL_242:
    __break(1u);
LABEL_243:
    __break(1u);
LABEL_244:
    __break(1u);
LABEL_245:
    __break(1u);
LABEL_246:
    __break(1u);
    goto LABEL_247;
  }
LABEL_259:
  __break(1u);
LABEL_260:
  __break(1u);
LABEL_261:
  __break(1u);
LABEL_262:
  __break(1u);
LABEL_263:
  __break(1u);
LABEL_264:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_265:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_266:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_267:
  result = swift_bridgeObjectRelease_n();
  __break(1u);
  return result;
}

uint64_t sub_247BD6B60(char **a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v7[2];

  v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_247BE97D8((uint64_t)v4);
  v5 = *((_QWORD *)v4 + 2);
  v7[0] = (uint64_t)(v4 + 32);
  v7[1] = v5;
  swift_bridgeObjectRetain();
  sub_247BD5FF0(v7, a2);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

_OWORD *sub_247BD6C00(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_247BD6C18(uint64_t a1)
{
  j__swift_unknownObjectRetain(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_247BD6C58(uint64_t a1)
{
  j__swift_unknownObjectRelease(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  swift_unknownObjectRelease();
  return a1;
}

unint64_t sub_247BD6C9C()
{
  unint64_t result;

  result = qword_2576E9868;
  if (!qword_2576E9868)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1NodeCollection, &type metadata for ASN1NodeCollection);
    atomic_store(result, (unint64_t *)&qword_2576E9868);
  }
  return result;
}

unint64_t sub_247BD6CE4()
{
  unint64_t result;

  result = qword_2576E9870;
  if (!qword_2576E9870)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1NodeCollection.Iterator, &type metadata for ASN1NodeCollection.Iterator);
    atomic_store(result, (unint64_t *)&qword_2576E9870);
  }
  return result;
}

unint64_t sub_247BD6D2C()
{
  unint64_t result;

  result = qword_2576E9878;
  if (!qword_2576E9878)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Node, &type metadata for ASN1Node);
    atomic_store(result, (unint64_t *)&qword_2576E9878);
  }
  return result;
}

unint64_t sub_247BD6D74()
{
  unint64_t result;

  result = qword_2576E9880;
  if (!qword_2576E9880)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Node.Content, &type metadata for ASN1Node.Content);
    atomic_store(result, (unint64_t *)&qword_2576E9880);
  }
  return result;
}

ValueMetadata *type metadata accessor for DER()
{
  return &type metadata for DER;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ASN1NodeCollection()
{
  return &type metadata for ASN1NodeCollection;
}

uint64_t initializeBufferWithCopyOfBuffer for ASN1NodeCollection.Iterator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ASN1NodeCollection.Iterator()
{
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for ASN1BitString(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_unknownObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ASN1BitString(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  return a1;
}

uint64_t assignWithTake for ASN1BitString(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  swift_unknownObjectRelease();
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1BitString(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1BitString(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1NodeCollection.Iterator()
{
  return &type metadata for ASN1NodeCollection.Iterator;
}

uint64_t destroy for ASN1Node(uint64_t a1)
{
  j__swift_unknownObjectRelease(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for ASN1Node(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(unsigned __int8 *)(a2 + 56);
  j__swift_unknownObjectRetain(v4, v5, v6, v7, v8, v9);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ASN1Node(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(unsigned __int8 *)(a2 + 56);
  j__swift_unknownObjectRetain(v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(unsigned __int8 *)(a1 + 56);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = v9;
  j__swift_unknownObjectRelease(v10, v11, v12, v13, v14, v15);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for ASN1Node(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 48);
  v5 = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(unsigned __int8 *)(a1 + 56);
  v12 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 56) = v5;
  j__swift_unknownObjectRelease(v6, v7, v8, v9, v10, v11);
  swift_unknownObjectRelease();
  v13 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v13;
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1Node(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Node(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 64) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Node()
{
  return &type metadata for ASN1Node;
}

uint64_t destroy for ASN1Node.Content(uint64_t a1)
{
  return j__swift_unknownObjectRelease(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t initializeWithCopy for ASN1Node.Content(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = *((unsigned __int8 *)a2 + 40);
  j__swift_unknownObjectRetain(*a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t *assignWithCopy for ASN1Node.Content(uint64_t *a1, uint64_t *a2)
{
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

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = *((unsigned __int8 *)a2 + 40);
  j__swift_unknownObjectRetain(*a2, v4, v5, v6, v7, v8);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[4];
  v14 = *((unsigned __int8 *)a1 + 40);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  *((_BYTE *)a1 + 40) = v8;
  j__swift_unknownObjectRelease(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for ASN1Node.Content(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *a1;
  v7 = a1[1];
  v6 = a1[2];
  v8 = a1[3];
  v9 = a1[4];
  v10 = *((unsigned __int8 *)a1 + 40);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  a1[4] = v3;
  *((_BYTE *)a1 + 40) = v4;
  j__swift_unknownObjectRelease(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASN1Node.Content(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Node.Content(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_247BD74A4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_247BD74AC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Node.Content()
{
  return &type metadata for ASN1Node.Content;
}

ValueMetadata *type metadata accessor for DER.Serializer()
{
  return &type metadata for DER.Serializer;
}

uint64_t dispatch thunk of DERParseable.init(derEncoded:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DERSerializable.serialize(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static DERImplicitlyTaggable.defaultIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of DERImplicitlyTaggable.serialize(into:withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t destroy for DER.ParserNode()
{
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v3 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v3;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

uint64_t assignWithTake for DER.ParserNode(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_unknownObjectRelease();
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  swift_unknownObjectRelease();
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for DER.ParserNode(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DER.ParserNode(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DER.ParserNode()
{
  return &type metadata for DER.ParserNode;
}

unint64_t sub_247BD77A0()
{
  unint64_t result;

  result = qword_2576E9888;
  if (!qword_2576E9888)
  {
    result = MEMORY[0x24958E0B8](&unk_247BECEE4, &type metadata for DER.ParseResult);
    atomic_store(result, (unint64_t *)&qword_2576E9888);
  }
  return result;
}

unint64_t sub_247BD77E8()
{
  unint64_t result;

  result = qword_2576E9890;
  if (!qword_2576E9890)
  {
    result = MEMORY[0x24958E0B8](&unk_247BECF74, &type metadata for DER.ParserNode);
    atomic_store(result, (unint64_t *)&qword_2576E9890);
  }
  return result;
}

uint64_t sub_247BD782C(char **a1)
{
  uint64_t v1;

  return sub_247BEB9BC(a1, *(uint64_t **)(v1 + 16));
}

uint64_t sub_247BD7844(uint64_t a1)
{
  uint64_t v1;

  return sub_247BEA984(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_247BD785C(char **a1)
{
  uint64_t v1;

  return sub_247BDE668(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_247BD7874(uint64_t a1)
{
  uint64_t v1;

  return sub_247BE7CB4(a1, *(_OWORD **)(v1 + 16));
}

uint64_t sub_247BD788C(uint64_t a1)
{
  uint64_t v1;

  return sub_247BE6BC8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_247BD78A8(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BE4694(a1, *(_BYTE *)(v1 + 16));
}

uint64_t sub_247BD78C0(uint64_t a1)
{
  uint64_t v1;

  return sub_247BE2C8C(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_247BD78D8(char **a1)
{
  uint64_t v1;

  return sub_247BDA2C0(**(_QWORD **)(v1 + 16), a1);
}

uint64_t sub_247BD78FC(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BDA294(**(_QWORD **)(v1 + 16), a1);
}

uint64_t sub_247BD791C(char **a1)
{
  uint64_t v1;

  return sub_247BDAB28(**(unsigned int **)(v1 + 16), a1);
}

uint64_t sub_247BD793C(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BDA668(**(unsigned int **)(v1 + 16), a1);
}

uint64_t sub_247BD795C(char **a1)
{
  uint64_t v1;

  return sub_247BDA998(**(unsigned __int16 **)(v1 + 16), a1);
}

uint64_t sub_247BD797C(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BDA594(**(unsigned __int16 **)(v1 + 16), a1);
}

uint64_t sub_247BD799C(char **a1)
{
  uint64_t v1;

  return sub_247BDA814(**(unsigned __int8 **)(v1 + 16), a1);
}

uint64_t sub_247BD79BC(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BDA4B0(**(unsigned __int8 **)(v1 + 16), a1);
}

uint64_t sub_247BD79DC(uint64_t a1)
{
  swift_unknownObjectRelease();
  return a1;
}

unint64_t sub_247BD7A04()
{
  unint64_t result;

  result = qword_2576E98A8;
  if (!qword_2576E98A8)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE4298], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_2576E98A8);
  }
  return result;
}

unint64_t sub_247BD7A48()
{
  unint64_t result;

  result = qword_2576E98B0;
  if (!qword_2576E98B0)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2576E98B0);
  }
  return result;
}

uint64_t *sub_247BD7A8C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = a1[13];
  v7 = a1[12];
  v3 = a1[14];
  v4 = a1[15];
  v5 = a1[16];
  sub_247BD7B4C(*a1, a1[1], a1[2], a1[3], a1[4]);
  sub_247BD7B4C(v7, v2, v3, v4, v5);
  return a1;
}

uint64_t sub_247BD7B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_247BD7B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    swift_unknownObjectRetain();
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_247BD7BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t result;

  if (a9)
  {
    j__swift_unknownObjectRetain(a3, a4, a5, a6, a7, a8 & 1);
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t initializeWithCopy for DER.ParseResult(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_unknownObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DER.ParseResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
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

_OWORD *assignWithTake for DER.ParseResult(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  swift_unknownObjectRelease();
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for DER.ParseResult(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DER.ParseResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DER.ParseResult()
{
  return &type metadata for DER.ParseResult;
}

uint64_t sub_247BD7D70(uint64_t *a1, _QWORD *a2)
{
  return sub_247BD4594(a1, a2);
}

uint64_t sub_247BD7D84(uint64_t a1)
{
  return sub_247BD788C(a1);
}

uint64_t sub_247BD7D98(uint64_t *a1)
{
  return sub_247BD45B4(a1);
}

void sub_247BD7DB0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 8)
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x8000000247BEED80, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_24;
    v9 = sub_247BD873C(0, 8 * v5, 8);
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    v11 = 0;
    v12 = 0;
    if (a3 <= v4)
      v13 = v4;
    else
      v13 = a3;
    v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      v16 = *(_QWORD *)(v9 + 8 * v11 + 32);
      if (v16 - 65 < 0xFFFFFFFFFFFFFF7FLL)
      {
        v15 = 0;
      }
      else
      {
        v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFC0)
            v15 = 0;
          else
            v15 = v19;
        }
        else
        {
          v18 = v17 << v16;
          if (v16 >= 0x40)
            v15 = 0;
          else
            v15 = v18;
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11)
        goto LABEL_21;
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_247BD7F44(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  int v19;
  int v20;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 1)
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x8000000247BEED80, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_26;
    v9 = sub_247BD873C(0, 8 * v5, 8);
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
    {
LABEL_23:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    v11 = 0;
    v12 = 0;
    if (a3 <= v4)
      v13 = v4;
    else
      v13 = a3;
    v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      v16 = *(_QWORD *)(v9 + 8 * v11 + 32);
      v17 = *(unsigned __int8 *)(a2 + a3 + v11);
      if (v16 <= -9)
      {
        v15 = (char)v17 >> 7;
      }
      else if (v16 < 9)
      {
        if (v16 < 0)
        {
          v19 = (char)v17 >> -(char)v16;
          v20 = (char)v17 >> 7;
          if ((unint64_t)v16 <= 0xFFFFFFFFFFFFFFF8)
            v15 = v20;
          else
            v15 = v19;
        }
        else
        {
          v18 = (unint64_t)v16 >= 8;
          v15 = v17 << v16;
          if (v18)
            v15 = 0;
        }
      }
      else
      {
        v15 = 0;
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11)
        goto LABEL_23;
    }
    __break(1u);
  }
  __break(1u);
LABEL_26:
  __break(1u);
}

void sub_247BD80EC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  unsigned int v17;
  BOOL v18;
  unsigned int v19;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 2)
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x8000000247BEED80, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_24;
    v9 = sub_247BD873C(0, 8 * v5, 8);
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    v11 = 0;
    v12 = 0;
    if (a3 <= v4)
      v13 = v4;
    else
      v13 = a3;
    v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      v16 = *(_QWORD *)(v9 + 8 * v11 + 32);
      if (v16 - 17 <= 0xFFFFFFFFFFFFFFDELL)
      {
        v15 = 0;
      }
      else
      {
        v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFF0)
            v15 = 0;
          else
            v15 = v19;
        }
        else
        {
          v18 = v16 >= 0x10;
          v15 = v17 << v16;
          if (v18)
            v15 = 0;
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11)
        goto LABEL_21;
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_247BD8280(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  unsigned int v17;
  BOOL v18;
  unsigned int v19;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 4)
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x8000000247BEED80, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_24;
    v9 = sub_247BD873C(0, 8 * v5, 8);
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    v11 = 0;
    v12 = 0;
    if (a3 <= v4)
      v13 = v4;
    else
      v13 = a3;
    v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      v16 = *(_QWORD *)(v9 + 8 * v11 + 32);
      if (v16 - 33 <= 0xFFFFFFFFFFFFFFBELL)
      {
        v15 = 0;
      }
      else
      {
        v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFE0)
            v15 = 0;
          else
            v15 = v19;
        }
        else
        {
          v18 = v16 >= 0x20;
          v15 = v17 << v16;
          if (v18)
            v15 = 0;
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11)
        goto LABEL_21;
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_247BD8414(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 8)
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x8000000247BEED80, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_24;
    v9 = sub_247BD873C(0, 8 * v5, 8);
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    v11 = 0;
    v12 = 0;
    if (a3 <= v4)
      v13 = v4;
    else
      v13 = a3;
    v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      v16 = *(_QWORD *)(v9 + 8 * v11 + 32);
      if (v16 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      {
        v15 = 0;
      }
      else
      {
        v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFC0)
            v15 = 0;
          else
            v15 = v19;
        }
        else
        {
          v18 = v17 << v16;
          if (v16 >= 0x40)
            v15 = 0;
          else
            v15 = v18;
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11)
        goto LABEL_21;
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

void sub_247BD85A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  unsigned int v17;
  BOOL v18;
  unsigned int v19;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (v5 > 1)
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001ALL, 0x8000000247BEED80, (uint64_t)"SwiftASN1/ASN1.swift", 20, 2, 1191, v6);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    if ((unint64_t)(v5 - 0x1000000000000000) >> 61 != 7)
      goto LABEL_24;
    v9 = sub_247BD873C(0, 8 * v5, 8);
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    v11 = 0;
    v12 = 0;
    if (a3 <= v4)
      v13 = v4;
    else
      v13 = a3;
    v14 = v13 - a3;
    while (v14 > v10 - 1)
    {
      v16 = *(_QWORD *)(v9 + 8 * v11 + 32);
      if (v16 - 9 <= 0xFFFFFFFFFFFFFFEELL)
      {
        v15 = 0;
      }
      else
      {
        v17 = *(unsigned __int8 *)(a2 + a3 + v11);
        if ((v16 & 0x8000000000000000) != 0)
        {
          v19 = v17 >> -(char)v16;
          if (v16 <= 0xFFFFFFFFFFFFFFF8)
            v15 = 0;
          else
            v15 = v19;
        }
        else
        {
          v18 = v16 >= 8;
          v15 = v17 << v16;
          if (v18)
            v15 = 0;
        }
      }
      ++v11;
      v12 |= v15;
      if (v10 == v11)
        goto LABEL_21;
    }
    __break(1u);
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

uint64_t sub_247BD873C(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t i;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_247BDE370(a1, a2, a3);
  v4 = result;
  v5 = *(_QWORD *)(result + 16);
  if (v5 < 2)
    return v4;
  v6 = 0;
  v7 = v5 >> 1;
  for (i = v5 + 3; ; --i)
  {
    if (v6 == i - 4)
      goto LABEL_5;
    v9 = *(_QWORD *)(v4 + 16);
    if (v6 >= v9)
      break;
    if (i - 4 >= v9)
      goto LABEL_12;
    v10 = *(_QWORD *)(v4 + 8 * v6 + 32);
    v11 = *(_QWORD *)(v4 + 8 * i);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BDE5F0(v4);
      v4 = result;
    }
    *(_QWORD *)(v4 + 8 * v6 + 32) = v11;
    *(_QWORD *)(v4 + 8 * i) = v10;
LABEL_5:
    if (v7 == ++v6)
      return v4;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void static ASN1IntegerRepresentable.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 2;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BD8808(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_247BD91D4(a1, a2, a3);
}

uint64_t sub_247BD881C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_247BD9C34(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_247BD7DB0);
}

uint64_t sub_247BD8838(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t *v18;
  uint64_t *v19;

  v4 = result;
  if (*(_QWORD *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v11);
    sub_247BD6C58(v4);
    swift_willThrow();
    return v3;
  }
  if (*(_BYTE *)(result + 56) == 1)
  {
    v3 = *(_QWORD *)(result + 16);
    v5 = *(_QWORD *)(result + 24);
    v7 = *(_QWORD *)(result + 32);
    v6 = *(_QWORD *)(result + 40);
    v8 = *(_QWORD *)(result + 48);
    swift_unknownObjectRetain();
    result = sub_247BD6C58(v4);
    v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
      goto LABEL_25;
    }
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_247BD3D44();
      swift_allocError();
      v13 = v12;
      v14 = 0xD00000000000001FLL;
      v15 = 0x8000000247BEEF40;
      v16 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v14, v15, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v16, v13);
      swift_willThrow();
      j__swift_unknownObjectRelease(v3, v5, v7, v6, v8, 1);
      return v3;
    }
    if (v7 != v9)
    {
      if (v7 < v9)
      {
        v10 = *(unsigned __int8 *)(v5 + v7);
        if (v7 + 1 == v9)
        {
          if (!*(_BYTE *)(v5 + v7))
            return v3;
LABEL_19:
          if ((v10 & 0x80) == 0)
            return v3;
          goto LABEL_21;
        }
        if (v7 + 1 < v9)
        {
          v17 = *(char *)(v5 + v7 + 1);
          if (*(_BYTE *)(v5 + v7))
          {
            if (v10 != 255)
              goto LABEL_19;
            if ((v17 & 0x80000000) == 0)
            {
LABEL_21:
              sub_247BD3D44();
              swift_allocError();
              v14 = 0xD000000000000021;
              v13 = v18;
              v15 = 0x8000000247BEEF60;
              v16 = 77;
              goto LABEL_13;
            }
          }
          else if (v17 < 0)
          {
            return v3;
          }
          sub_247BD3D44();
          swift_allocError();
          v14 = 0xD00000000000002ELL;
          v13 = v19;
          v15 = 0x8000000247BEEF90;
          v16 = 67;
          goto LABEL_13;
        }
        goto LABEL_26;
      }
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    return v3;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_247BD8ACC(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;

  v3 = result;
  if (*(_QWORD *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_247BD6C58(v3);
    swift_willThrow();
    return v3;
  }
  if (*(_BYTE *)(result + 56) == 1)
  {
    v5 = *(_QWORD *)(result + 16);
    v4 = *(_QWORD *)(result + 24);
    v7 = *(_QWORD *)(result + 32);
    v6 = *(_QWORD *)(result + 40);
    v8 = *(_QWORD *)(result + 48);
    swift_unknownObjectRetain();
    result = sub_247BD6C58(v3);
    v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }
    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_247BD3D44();
        swift_allocError();
        v14 = v13;
        v15 = 0xD00000000000001FLL;
        v16 = 0x8000000247BEEF40;
        v17 = 55;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
        return v3;
      }
      if (v7 == v9)
        goto LABEL_13;
      if (v7 < v9)
      {
        if (v7 + 1 == v9)
          goto LABEL_13;
        if (v7 + 1 < v9)
        {
          v10 = *(char *)(v4 + v7 + 1);
          if (*(_BYTE *)(v4 + v7))
          {
            if (*(unsigned __int8 *)(v4 + v7) != 255 || (v10 & 0x80000000) == 0)
              goto LABEL_13;
            goto LABEL_19;
          }
          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_247BD3D44();
            swift_allocError();
            v15 = 0xD00000000000002ELL;
            v14 = v18;
            v16 = 0x8000000247BEEF90;
            v17 = 67;
            goto LABEL_16;
          }
LABEL_13:
          sub_247BDE838(v5, v4, v7, v6);
          v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return v3;
        }
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247BD8D24(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;

  v3 = result;
  if (*(_QWORD *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_247BD6C58(v3);
    swift_willThrow();
    return v3;
  }
  if (*(_BYTE *)(result + 56) == 1)
  {
    v5 = *(_QWORD *)(result + 16);
    v4 = *(_QWORD *)(result + 24);
    v7 = *(_QWORD *)(result + 32);
    v6 = *(_QWORD *)(result + 40);
    v8 = *(_QWORD *)(result + 48);
    swift_unknownObjectRetain();
    result = sub_247BD6C58(v3);
    v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }
    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_247BD3D44();
        swift_allocError();
        v14 = v13;
        v15 = 0xD00000000000001FLL;
        v16 = 0x8000000247BEEF40;
        v17 = 55;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
        return v3;
      }
      if (v7 == v9)
        goto LABEL_13;
      if (v7 < v9)
      {
        if (v7 + 1 == v9)
          goto LABEL_13;
        if (v7 + 1 < v9)
        {
          v10 = *(char *)(v4 + v7 + 1);
          if (*(_BYTE *)(v4 + v7))
          {
            if (*(unsigned __int8 *)(v4 + v7) != 255 || (v10 & 0x80000000) == 0)
              goto LABEL_13;
            goto LABEL_19;
          }
          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_247BD3D44();
            swift_allocError();
            v15 = 0xD00000000000002ELL;
            v14 = v18;
            v16 = 0x8000000247BEEF90;
            v17 = 67;
            goto LABEL_16;
          }
LABEL_13:
          sub_247BDE88C(v5, v4, v7, v6);
          v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return v3;
        }
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247BD8F7C(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;

  v3 = result;
  if (*(_QWORD *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_247BD6C58(v3);
    swift_willThrow();
    return v3;
  }
  if (*(_BYTE *)(result + 56) == 1)
  {
    v5 = *(_QWORD *)(result + 16);
    v4 = *(_QWORD *)(result + 24);
    v7 = *(_QWORD *)(result + 32);
    v6 = *(_QWORD *)(result + 40);
    v8 = *(_QWORD *)(result + 48);
    swift_unknownObjectRetain();
    result = sub_247BD6C58(v3);
    v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }
    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_247BD3D44();
        swift_allocError();
        v14 = v13;
        v15 = 0xD00000000000001FLL;
        v16 = 0x8000000247BEEF40;
        v17 = 55;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
        return v3;
      }
      if (v7 == v9)
        goto LABEL_13;
      if (v7 < v9)
      {
        if (v7 + 1 == v9)
          goto LABEL_13;
        if (v7 + 1 < v9)
        {
          v10 = *(char *)(v4 + v7 + 1);
          if (*(_BYTE *)(v4 + v7))
          {
            if (*(unsigned __int8 *)(v4 + v7) != 255 || (v10 & 0x80000000) == 0)
              goto LABEL_13;
            goto LABEL_19;
          }
          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_247BD3D44();
            swift_allocError();
            v15 = 0xD00000000000002ELL;
            v14 = v18;
            v16 = 0x8000000247BEEF90;
            v17 = 67;
            goto LABEL_16;
          }
LABEL_13:
          sub_247BDE9B4(v5, v4, v7, v6);
          v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return v3;
        }
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247BD91D4(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;

  v3 = result;
  if (*(_QWORD *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_247BD6C58(v3);
    swift_willThrow();
    return v3;
  }
  if (*(_BYTE *)(result + 56) == 1)
  {
    v5 = *(_QWORD *)(result + 16);
    v4 = *(_QWORD *)(result + 24);
    v7 = *(_QWORD *)(result + 32);
    v6 = *(_QWORD *)(result + 40);
    v8 = *(_QWORD *)(result + 48);
    swift_unknownObjectRetain();
    result = sub_247BD6C58(v3);
    v9 = v6 >> 1;
    if (__OFSUB__(v6 >> 1, v7))
    {
      __break(1u);
    }
    else
    {
      if ((uint64_t)((v6 >> 1) - v7) < 1)
      {
        sub_247BD3D44();
        swift_allocError();
        v14 = v13;
        v15 = 0xD00000000000001FLL;
        v16 = 0x8000000247BEEF40;
        v17 = 55;
LABEL_16:
        static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
        swift_willThrow();
        j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
        return v3;
      }
      if (v7 == v9)
        goto LABEL_13;
      if (v7 < v9)
      {
        if (v7 + 1 == v9)
          goto LABEL_13;
        if (v7 + 1 < v9)
        {
          v10 = *(char *)(v4 + v7 + 1);
          if (*(_BYTE *)(v4 + v7))
          {
            if (*(unsigned __int8 *)(v4 + v7) != 255 || (v10 & 0x80000000) == 0)
              goto LABEL_13;
            goto LABEL_19;
          }
          if ((v10 & 0x80000000) == 0)
          {
LABEL_19:
            sub_247BD3D44();
            swift_allocError();
            v15 = 0xD00000000000002ELL;
            v14 = v18;
            v16 = 0x8000000247BEEF90;
            v17 = 67;
            goto LABEL_16;
          }
LABEL_13:
          sub_247BDEAE4(v5, v4, v7, v6);
          v3 = v11;
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return v3;
        }
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_247BD942C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;

  if (*(_QWORD *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_247BD6C58(a1);
    swift_willThrow();
    return;
  }
  if (*(_BYTE *)(a1 + 56) != 1)
    goto LABEL_28;
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_247BD6C58(a1);
  v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_247BD3D44();
      swift_allocError();
      v14 = v13;
      v15 = 0xD00000000000001FLL;
      v16 = 0x8000000247BEEF40;
      v17 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
      return;
    }
    if (v7 == v9)
    {
LABEL_20:
      v11 = v7;
      goto LABEL_21;
    }
    if (v7 < v9)
    {
      v10 = *(unsigned __int8 *)(v4 + v7);
      v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(_BYTE *)(v4 + v7))
        {
          v11 = v6 >> 1;
LABEL_21:
          sub_247BD85A8(v5, v4, v11, v6);
          return;
        }
LABEL_19:
        if ((v10 & 0x80) == 0)
          goto LABEL_20;
        goto LABEL_22;
      }
      if (v7 + 1 < v9)
      {
        v18 = *(char *)(v4 + v11);
        if (*(_BYTE *)(v4 + v7))
        {
          if (v10 != 255)
            goto LABEL_19;
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_247BD3D44();
            swift_allocError();
            v15 = 0xD000000000000021;
            v14 = v19;
            v16 = 0x8000000247BEEF60;
            v17 = 77;
            goto LABEL_13;
          }
        }
        else if (v18 < 0)
        {
          goto LABEL_21;
        }
        sub_247BD3D44();
        swift_allocError();
        v15 = 0xD00000000000002ELL;
        v14 = v20;
        v16 = 0x8000000247BEEF90;
        v17 = 67;
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

void sub_247BD96D0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;

  if (*(_QWORD *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_247BD6C58(a1);
    swift_willThrow();
    return;
  }
  if (*(_BYTE *)(a1 + 56) != 1)
    goto LABEL_28;
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_247BD6C58(a1);
  v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_247BD3D44();
      swift_allocError();
      v14 = v13;
      v15 = 0xD00000000000001FLL;
      v16 = 0x8000000247BEEF40;
      v17 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
      return;
    }
    if (v7 == v9)
    {
LABEL_20:
      v11 = v7;
      goto LABEL_21;
    }
    if (v7 < v9)
    {
      v10 = *(unsigned __int8 *)(v4 + v7);
      v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(_BYTE *)(v4 + v7))
        {
          v11 = v6 >> 1;
LABEL_21:
          sub_247BD80EC(v5, v4, v11, v6);
          return;
        }
LABEL_19:
        if ((v10 & 0x80) == 0)
          goto LABEL_20;
        goto LABEL_22;
      }
      if (v7 + 1 < v9)
      {
        v18 = *(char *)(v4 + v11);
        if (*(_BYTE *)(v4 + v7))
        {
          if (v10 != 255)
            goto LABEL_19;
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_247BD3D44();
            swift_allocError();
            v15 = 0xD000000000000021;
            v14 = v19;
            v16 = 0x8000000247BEEF60;
            v17 = 77;
            goto LABEL_13;
          }
        }
        else if (v18 < 0)
        {
          goto LABEL_21;
        }
        sub_247BD3D44();
        swift_allocError();
        v15 = 0xD00000000000002ELL;
        v14 = v20;
        v16 = 0x8000000247BEEF90;
        v17 = 67;
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

void sub_247BD9974(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;

  if (*(_QWORD *)a1 != a2 || *(unsigned __int8 *)(a1 + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v12);
    sub_247BD6C58(a1);
    swift_willThrow();
    return;
  }
  if (*(_BYTE *)(a1 + 56) != 1)
    goto LABEL_28;
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  swift_unknownObjectRetain();
  sub_247BD6C58(a1);
  v9 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v7) < 1)
    {
      sub_247BD3D44();
      swift_allocError();
      v14 = v13;
      v15 = 0xD00000000000001FLL;
      v16 = 0x8000000247BEEF40;
      v17 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v15, v16, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v17, v14);
      swift_willThrow();
      j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
      return;
    }
    if (v7 == v9)
    {
LABEL_20:
      v11 = v7;
      goto LABEL_21;
    }
    if (v7 < v9)
    {
      v10 = *(unsigned __int8 *)(v4 + v7);
      v11 = v7 + 1;
      if (v7 + 1 == v9)
      {
        if (!*(_BYTE *)(v4 + v7))
        {
          v11 = v6 >> 1;
LABEL_21:
          sub_247BD8280(v5, v4, v11, v6);
          return;
        }
LABEL_19:
        if ((v10 & 0x80) == 0)
          goto LABEL_20;
        goto LABEL_22;
      }
      if (v7 + 1 < v9)
      {
        v18 = *(char *)(v4 + v11);
        if (*(_BYTE *)(v4 + v7))
        {
          if (v10 != 255)
            goto LABEL_19;
          if ((v18 & 0x80000000) == 0)
          {
LABEL_22:
            sub_247BD3D44();
            swift_allocError();
            v15 = 0xD000000000000021;
            v14 = v19;
            v16 = 0x8000000247BEEF60;
            v17 = 77;
            goto LABEL_13;
          }
        }
        else if (v18 < 0)
        {
          goto LABEL_21;
        }
        sub_247BD3D44();
        swift_allocError();
        v15 = 0xD00000000000002ELL;
        v14 = v20;
        v16 = 0x8000000247BEEF90;
        v17 = 67;
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t sub_247BD9C18(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_247BD9C34(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_247BD8414);
}

uint64_t sub_247BD9C34(uint64_t result, uint64_t a2, unsigned __int8 a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, unint64_t))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t *v21;
  uint64_t *v22;

  v4 = result;
  if (*(_QWORD *)result != a2 || *(unsigned __int8 *)(result + 8) != a3)
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v14);
    sub_247BD6C58(v4);
    return swift_willThrow();
  }
  if (*(_BYTE *)(result + 56) != 1)
    goto LABEL_28;
  v7 = *(_QWORD *)(result + 16);
  v6 = *(_QWORD *)(result + 24);
  v9 = *(_QWORD *)(result + 32);
  v8 = *(_QWORD *)(result + 40);
  v10 = *(_QWORD *)(result + 48);
  swift_unknownObjectRetain();
  result = sub_247BD6C58(v4);
  v11 = v8 >> 1;
  if (__OFSUB__(v8 >> 1, v9))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v8 >> 1) - v9) < 1)
    {
      sub_247BD3D44();
      swift_allocError();
      v16 = v15;
      v17 = 0xD00000000000001FLL;
      v18 = 0x8000000247BEEF40;
      v19 = 55;
LABEL_13:
      static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v17, v18, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v19, v16);
      swift_willThrow();
      return j__swift_unknownObjectRelease(v7, v6, v9, v8, v10, 1);
    }
    if (v9 == v11)
    {
LABEL_20:
      v13 = v9;
      return a4(v7, v6, v13, v8);
    }
    if (v9 < v11)
    {
      v12 = *(unsigned __int8 *)(v6 + v9);
      v13 = v9 + 1;
      if (v9 + 1 == v11)
      {
        if (!*(_BYTE *)(v6 + v9))
        {
          v13 = v8 >> 1;
          return a4(v7, v6, v13, v8);
        }
LABEL_19:
        if ((v12 & 0x80) == 0)
          goto LABEL_20;
        goto LABEL_22;
      }
      if (v9 + 1 < v11)
      {
        v20 = *(char *)(v6 + v13);
        if (*(_BYTE *)(v6 + v9))
        {
          if (v12 != 255)
            goto LABEL_19;
          if ((v20 & 0x80000000) == 0)
          {
LABEL_22:
            sub_247BD3D44();
            swift_allocError();
            v17 = 0xD000000000000021;
            v16 = v21;
            v18 = 0x8000000247BEEF60;
            v19 = 77;
            goto LABEL_13;
          }
        }
        else if (v20 < 0)
        {
          return a4(v7, v6, v13, v8);
        }
        sub_247BD3D44();
        swift_allocError();
        v17 = 0xD00000000000002ELL;
        v16 = v22;
        v18 = 0x8000000247BEEF90;
        v19 = 67;
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t ASN1IntegerRepresentable.init(derEncoded:withIdentifier:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  int64_t v13;
  int v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t *v23;
  uint64_t *v24;

  v5 = *(_QWORD *)(result + 16);
  v4 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v6 = *(_QWORD *)(result + 40);
  v8 = *(_QWORD *)(result + 48);
  v9 = *(unsigned __int8 *)(result + 56);
  if (*(_QWORD *)result != *(_QWORD *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, 46, v16);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  if (!*(_BYTE *)(result + 56))
    goto LABEL_31;
  v12 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v12, v4, v7, v6, v8, 1);
  result = swift_unknownObjectRelease();
  v13 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v7))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if ((uint64_t)((v6 >> 1) - v7) < 1)
  {
    sub_247BD3D44();
    swift_allocError();
    v18 = v17;
    v19 = 0xD00000000000001FLL;
    v20 = 0x8000000247BEEF40;
    v21 = 55;
    goto LABEL_19;
  }
  if (v7 == v13)
    goto LABEL_13;
  if (v7 >= v13)
    goto LABEL_28;
  if (v7 + 1 == v13)
    goto LABEL_13;
  if (v7 + 1 < v13)
  {
    v14 = *(char *)(v4 + v7 + 1);
    if (*(_BYTE *)(v4 + v7))
    {
      if (*(unsigned __int8 *)(v4 + v7) != 255 || (v14 & 0x80000000) == 0)
      {
LABEL_13:
        v15 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 32);
        swift_unknownObjectRetain();
        result = v15(a3, a4);
        if ((result & 1) != 0 || v7 == v13)
        {
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))(v5, v4, v7, v6, a3, a4);
        }
        if (v7 < v13)
        {
          v22 = *(char *)(v4 + v7);
          j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
          if (!v22)
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))(v5, v4, ++v7, v6, a3, a4);
          if ((v22 & 0x80000000) == 0)
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 40))(v5, v4, v7, v6, a3, a4);
          sub_247BD3D44();
          swift_allocError();
          v19 = 0xD000000000000021;
          v18 = v23;
          v20 = 0x8000000247BEEF60;
          v21 = 77;
          goto LABEL_19;
        }
        goto LABEL_30;
      }
    }
    else if (v14 < 0)
    {
      goto LABEL_13;
    }
    sub_247BD3D44();
    swift_allocError();
    v19 = 0xD00000000000002ELL;
    v18 = v24;
    v20 = 0x8000000247BEEF90;
    v21 = 67;
LABEL_19:
    static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)(v19, v20, (uint64_t)"SwiftASN1/ASN1Integer.swift", 27, 2, v21, v18);
    swift_willThrow();
    return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t ASN1IntegerRepresentable.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BDE618);
}

uint64_t sub_247BDA294(int64_t a1, uint64_t *a2)
{
  return sub_247BDA738(a1, a2, (uint64_t (*)(unint64_t, unint64_t, _QWORD, int64_t))sub_247BE2304, (uint64_t (*)(unint64_t, _QWORD, unint64_t))sub_247BE0D20, (uint64_t (*)(unint64_t, unint64_t, unint64_t))sub_247BDFB90);
}

uint64_t sub_247BDA2C0(unint64_t a1, char **a2)
{
  return sub_247BDACB0(a1, a2, (uint64_t (*)(unint64_t, unint64_t, _QWORD, int64_t))sub_247BE2308, (uint64_t (*)(unint64_t, _QWORD, unint64_t))sub_247BE0D20, (uint64_t (*)(unint64_t, unint64_t, unint64_t))sub_247BDFBA4, (uint64_t (*)(unint64_t))sub_247BDFE0C);
}

uint64_t sub_247BDA2F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char **a5)
{
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  unint64_t v25;

  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_16;
  }
  v5 = a5;
  if (a4 >> 1 != a3)
  {
    if ((uint64_t)(a4 >> 1) <= a3)
    {
      __break(1u);
    }
    else
    {
      v6 = a4;
      v7 = a2;
      if ((*(char *)(a2 + a3) & 0x80000000) == 0)
      {
        v13 = sub_247BDB164(a1, a2, a3, a4);
        sub_247BE2594(v13, v14, v15, v16);
        return swift_unknownObjectRelease();
      }
      v8 = *a5;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v5 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_11:
        v18 = *((_QWORD *)v8 + 2);
        v19 = *((_QWORD *)v8 + 3);
        v20 = v18 + 1;
        if (v18 >= v19 >> 1)
        {
          v25 = v18 + 1;
          v22 = v8;
          v23 = *((_QWORD *)v8 + 2);
          v24 = sub_247BD3F98((char *)(v19 > 1), v18 + 1, 1, v22);
          v18 = v23;
          v20 = v25;
          v8 = v24;
        }
        *((_QWORD *)v8 + 2) = v20;
        v8[v18 + 32] = 0;
        *v5 = v8;
        v21 = swift_unknownObjectRetain();
        sub_247BE2594(v21, v7, a3, v6);
        return swift_unknownObjectRelease();
      }
    }
    v8 = sub_247BD3F98(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
    *v5 = v8;
    goto LABEL_11;
  }
  v6 = (unint64_t)*a5;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v5 = v6;
  if ((result & 1) == 0)
  {
LABEL_16:
    result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v6 + 16) + 1, 1, (char *)v6);
    v6 = result;
    *v5 = result;
  }
  v11 = *(_QWORD *)(v6 + 16);
  v10 = *(_QWORD *)(v6 + 24);
  if (v11 >= v10 >> 1)
  {
    result = (uint64_t)sub_247BD3F98((char *)(v10 > 1), v11 + 1, 1, (char *)v6);
    v6 = result;
  }
  *(_QWORD *)(v6 + 16) = v11 + 1;
  *(_BYTE *)(v6 + v11 + 32) = 0;
  *v5 = v6;
  return result;
}

uint64_t sub_247BDA4B0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7[2];
  unsigned __int8 v8;

  if ((_BYTE)a1)
  {
    sub_247BDB5E0(a1, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_247BE230C, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_247BE0D24, (uint64_t)v7);
    return sub_247BDFE18(v7[0], v7[1], v8);
  }
  else
  {
    v4 = *a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v4 + 16) + 1, 1, (char *)v4);
      v4 = result;
      *a2 = result;
    }
    v6 = *(_QWORD *)(v4 + 16);
    v5 = *(_QWORD *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      v4 = result;
    }
    *(_QWORD *)(v4 + 16) = v6 + 1;
    *(_BYTE *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_247BDA594(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7[2];
  unsigned __int16 v8;

  if ((_WORD)a1)
  {
    sub_247BDB26C(a1, (uint64_t)v7);
    return sub_247BDFE2C(v7[0], v7[1], v8);
  }
  else
  {
    v4 = *a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v4 + 16) + 1, 1, (char *)v4);
      v4 = result;
      *a2 = result;
    }
    v6 = *(_QWORD *)(v4 + 16);
    v5 = *(_QWORD *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      v4 = result;
    }
    *(_QWORD *)(v4 + 16) = v6 + 1;
    *(_BYTE *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_247BDA668(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7[2];
  unsigned int v8;

  if ((_DWORD)a1)
  {
    sub_247BDB36C(a1, (uint64_t)v7);
    return sub_247BDFE40(v7[0], v7[1], v8);
  }
  else
  {
    v4 = *a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v4;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v4 + 16) + 1, 1, (char *)v4);
      v4 = result;
      *a2 = result;
    }
    v6 = *(_QWORD *)(v4 + 16);
    v5 = *(_QWORD *)(v4 + 24);
    if (v6 >= v5 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v6 + 1, 1, (char *)v4);
      v4 = result;
    }
    *(_QWORD *)(v4 + 16) = v6 + 1;
    *(_BYTE *)(v4 + v6 + 32) = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_247BDA738(int64_t a1, uint64_t *a2, uint64_t (*a3)(unint64_t, unint64_t, _QWORD, int64_t), uint64_t (*a4)(unint64_t, _QWORD, unint64_t), uint64_t (*a5)(unint64_t, unint64_t, unint64_t))
{
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11[3];

  if (a1)
  {
    sub_247BDB4B0(a1, a3, a4, v11);
    return a5(v11[0], v11[1], v11[2]);
  }
  else
  {
    v8 = *a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v8;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v8 + 16) + 1, 1, (char *)v8);
      v8 = result;
      *a2 = result;
    }
    v10 = *(_QWORD *)(v8 + 16);
    v9 = *(_QWORD *)(v8 + 24);
    if (v10 >= v9 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v9 > 1), v10 + 1, 1, (char *)v8);
      v8 = result;
    }
    *(_QWORD *)(v8 + 16) = v10 + 1;
    *(_BYTE *)(v8 + v10 + 32) = 0;
    *a2 = v8;
  }
  return result;
}

uint64_t sub_247BDA814(uint64_t a1, char **a2)
{
  unsigned int v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  char *v15;
  uint64_t v16[2];
  unsigned __int8 v17;
  unint64_t v18;

  if ((_BYTE)a1)
  {
    v3 = a1;
    if ((a1 & 0x80) != 0)
    {
      v8 = *a2;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v8 = sub_247BD3F98(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
        *a2 = v8;
      }
      v10 = *((_QWORD *)v8 + 2);
      v11 = *((_QWORD *)v8 + 3);
      v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        v18 = v10 + 1;
        v13 = v8;
        v14 = v10;
        v15 = sub_247BD3F98((char *)(v11 > 1), v10 + 1, 1, v13);
        v10 = v14;
        v12 = v18;
        v8 = v15;
      }
      *((_QWORD *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_247BE00D0(v3);
    }
    else
    {
      sub_247BDB5E0(a1, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_247BE23FC, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_247BE0D24, (uint64_t)v16);
      return sub_247BDFE54(v16[0], v16[1], v17);
    }
  }
  else
  {
    v5 = (uint64_t)*a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
      v5 = result;
      *a2 = (char *)result;
    }
    v7 = *(_QWORD *)(v5 + 16);
    v6 = *(_QWORD *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      v5 = result;
    }
    *(_QWORD *)(v5 + 16) = v7 + 1;
    *(_BYTE *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }
  return result;
}

uint64_t sub_247BDA998(uint64_t a1, char **a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  char *v15;
  uint64_t v16[2];
  unsigned __int16 v17;
  unint64_t v18;

  if ((_WORD)a1)
  {
    if ((sub_247BDC48C((unsigned __int16)(39 - __clz((unsigned __int16)a1)) >> 3, a1) & 0x80) != 0)
    {
      v8 = *a2;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v8 = sub_247BD3F98(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
        *a2 = v8;
      }
      v10 = *((_QWORD *)v8 + 2);
      v11 = *((_QWORD *)v8 + 3);
      v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        v18 = v10 + 1;
        v13 = v8;
        v14 = v10;
        v15 = sub_247BD3F98((char *)(v11 > 1), v10 + 1, 1, v13);
        v10 = v14;
        v12 = v18;
        v8 = v15;
      }
      *((_QWORD *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_247BE04E0(a1);
    }
    else
    {
      sub_247BDB684(a1, (uint64_t)v16);
      return sub_247BE0244(v16[0], v16[1], v17);
    }
  }
  else
  {
    v5 = (uint64_t)*a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
      v5 = result;
      *a2 = (char *)result;
    }
    v7 = *(_QWORD *)(v5 + 16);
    v6 = *(_QWORD *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      v5 = result;
    }
    *(_QWORD *)(v5 + 16) = v7 + 1;
    *(_BYTE *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }
  return result;
}

uint64_t sub_247BDAB28(uint64_t a1, char **a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  char *v15;
  uint64_t v16[2];
  unsigned int v17;
  unint64_t v18;

  if ((_DWORD)a1)
  {
    if ((sub_247BDC4E0((39 - __clz(a1)) >> 3, a1) & 0x80) != 0)
    {
      v8 = *a2;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v8;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v8 = sub_247BD3F98(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
        *a2 = v8;
      }
      v10 = *((_QWORD *)v8 + 2);
      v11 = *((_QWORD *)v8 + 3);
      v12 = v10 + 1;
      if (v10 >= v11 >> 1)
      {
        v18 = v10 + 1;
        v13 = v8;
        v14 = v10;
        v15 = sub_247BD3F98((char *)(v11 > 1), v10 + 1, 1, v13);
        v10 = v14;
        v12 = v18;
        v8 = v15;
      }
      *((_QWORD *)v8 + 2) = v12;
      v8[v10 + 32] = 0;
      *a2 = v8;
      return sub_247BE095C(a1);
    }
    else
    {
      sub_247BDB75C(a1, (uint64_t)v16);
      return sub_247BE06CC(v16[0], v16[1], v17);
    }
  }
  else
  {
    v5 = (uint64_t)*a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v5;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v5 + 16) + 1, 1, (char *)v5);
      v5 = result;
      *a2 = (char *)result;
    }
    v7 = *(_QWORD *)(v5 + 16);
    v6 = *(_QWORD *)(v5 + 24);
    if (v7 >= v6 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v6 > 1), v7 + 1, 1, (char *)v5);
      v5 = result;
    }
    *(_QWORD *)(v5 + 16) = v7 + 1;
    *(_BYTE *)(v5 + v7 + 32) = 0;
    *a2 = (char *)v5;
  }
  return result;
}

uint64_t sub_247BDACB0(unint64_t a1, char **a2, uint64_t (*a3)(unint64_t, unint64_t, _QWORD, int64_t), uint64_t (*a4)(unint64_t, _QWORD, unint64_t), uint64_t (*a5)(unint64_t, unint64_t, unint64_t), uint64_t (*a6)(unint64_t))
{
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20[3];

  if (a1)
  {
    if ((sub_247BDC530((71 - __clz(a1)) >> 3, a1) & 0x80) != 0)
    {
      v16 = *a2;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v16 = sub_247BD3F98(0, *((_QWORD *)v16 + 2) + 1, 1, v16);
        *a2 = v16;
      }
      v19 = *((_QWORD *)v16 + 2);
      v18 = *((_QWORD *)v16 + 3);
      if (v19 >= v18 >> 1)
        v16 = sub_247BD3F98((char *)(v18 > 1), v19 + 1, 1, v16);
      *((_QWORD *)v16 + 2) = v19 + 1;
      v16[v19 + 32] = 0;
      *a2 = v16;
      return a6(a1);
    }
    else
    {
      sub_247BDB93C(a1, a3, a4, v20);
      return a5(v20[0], v20[1], v20[2]);
    }
  }
  else
  {
    v13 = (uint64_t)*a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v13;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v13 + 16) + 1, 1, (char *)v13);
      v13 = result;
      *a2 = (char *)result;
    }
    v15 = *(_QWORD *)(v13 + 16);
    v14 = *(_QWORD *)(v13 + 24);
    if (v15 >= v14 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v14 > 1), v15 + 1, 1, (char *)v13);
      v13 = result;
    }
    *(_QWORD *)(v13 + 16) = v15 + 1;
    *(_BYTE *)(v13 + v15 + 32) = 0;
    *a2 = (char *)v13;
  }
  return result;
}

uint64_t sub_247BDAE48(uint64_t a1, char **a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char isUniquelyReferenced_nonNull_native;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t AssociatedConformanceWitness;
  uint64_t v27;
  char v28;
  char v29;

  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v23 - v9;
  v11 = swift_checkMetadataState();
  v24 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v25 = (char *)&v23 - v12;
  v27 = a1;
  if (sub_247BEC830())
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4) & 1) != 0
      || (sub_247BEC854(), v29 == 1)
      || (v28 & 0x80000000) == 0)
    {
      sub_247BDBA44((uint64_t)v10);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9860);
      swift_getAssociatedConformanceWitness();
      return sub_247BEC7E8();
    }
    else
    {
      v17 = *a2;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v17;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v17 = sub_247BD3F98(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
        *a2 = v17;
      }
      v20 = v24;
      v19 = v25;
      v22 = *((_QWORD *)v17 + 2);
      v21 = *((_QWORD *)v17 + 3);
      if (v22 >= v21 >> 1)
        v17 = sub_247BD3F98((char *)(v21 > 1), v22 + 1, 1, v17);
      *((_QWORD *)v17 + 2) = v22 + 1;
      v17[v22 + 32] = 0;
      *a2 = v17;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v19, v27, v11);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9860);
      return sub_247BEC7E8();
    }
  }
  else
  {
    v14 = (uint64_t)*a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (char *)v14;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v14 + 16) + 1, 1, (char *)v14);
      v14 = result;
      *a2 = (char *)result;
    }
    v16 = *(_QWORD *)(v14 + 16);
    v15 = *(_QWORD *)(v14 + 24);
    if (v16 >= v15 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v15 > 1), v16 + 1, 1, (char *)v14);
      v14 = result;
    }
    *(_QWORD *)(v14 + 16) = v16 + 1;
    *(_BYTE *)(v14 + v16 + 32) = 0;
    *a2 = (char *)v14;
  }
  return result;
}

uint64_t sub_247BDB164(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  int v6;
  unint64_t v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t result;

  v4 = a4 >> 1;
  if ((uint64_t)(a4 >> 1) < a3)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v5 = a3;
  if (a4 >> 1 == a3)
    return swift_unknownObjectRetain();
  if (v4 <= a3)
    goto LABEL_31;
  v6 = *(unsigned __int8 *)(a2 + a3);
  if (v6 != 255 && v6 != 0)
    return swift_unknownObjectRetain();
  if (!__OFSUB__(v4, a3))
  {
    if (v4 - a3 >= 2)
    {
      if (a3 <= v4)
        v8 = a4 >> 1;
      else
        v8 = a3;
      v9 = *(unsigned __int8 *)(a2 + a3);
      while (v4 != v5)
      {
        if (v8 == v5)
        {
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        if (v9 != v6)
          return swift_unknownObjectRetain();
        if (__OFSUB__(v4, v5))
          goto LABEL_26;
        if (v4 - 1 == v5)
          goto LABEL_27;
        v10 = v5 + 1;
        if (v5 + 1 >= v4)
          goto LABEL_28;
        v9 = *(unsigned __int8 *)(a2 + 1 + v5);
        if (((v9 ^ v6) & 0x80) != 0)
          return swift_unknownObjectRetain();
        v11 = __OFSUB__(v4, v10);
        v12 = v4 - v10;
        if (v11)
          goto LABEL_29;
        ++v5;
        if (v12 <= 1)
          return swift_unknownObjectRetain();
      }
    }
    return swift_unknownObjectRetain();
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_247BDB26C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v3;
  unint64_t v4;
  unint64_t v5;
  unsigned __int8 v6;
  int v7;

  if ((_WORD)result)
  {
    v3 = result;
    v4 = (unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7;
    v5 = v4 >> 3;
    result = sub_247BDC300(v4 >> 3, result);
    v6 = result;
    if ((_BYTE)result && result != 255
      || (result = sub_247BE0D28(v5, 0, v3), result < 2)
      || v6 != ((unsigned __int16)v3 >> (8 * ((v5 - 1) & 1))))
    {
LABEL_12:
      *(_QWORD *)a2 = v5;
      *(_QWORD *)(a2 + 8) = 0;
      *(_WORD *)(a2 + 16) = v3;
      return result;
    }
    if (v5 == 1)
    {
      __break(1u);
    }
    else if ((unsigned __int16)v3 >= 0x100u)
    {
      v7 = (unsigned __int16)v3 >> (v4 & 8);
      if ((unsigned __int16)v4 < 0x10u)
        LOBYTE(v7) = v3 << (-(v4 & 8) & 8);
      if (((v7 ^ v6) & 0x80u) == 0)
        --v5;
      goto LABEL_12;
    }
    __break(1u);
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_WORD *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t sub_247BDB36C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned __int8 v12;
  unsigned int v13;

  if ((_DWORD)result)
  {
    v3 = result;
    v4 = 32 - __clz(result) + 7;
    v5 = v4 >> 3;
    result = sub_247BDC3A0(v4 >> 3, result);
    v6 = result;
    if ((_BYTE)result && result != 255 || (result = sub_247BE0D2C(v5, 0, v3), result < 2))
    {
LABEL_20:
      *(_QWORD *)a2 = v5;
      *(_QWORD *)(a2 + 8) = 0;
      *(_DWORD *)(a2 + 16) = v3;
    }
    else
    {
      v7 = 0;
      v8 = 8 * v5;
      v9 = 8 * v5 - 8;
      v10 = -16;
      v11 = -8;
      while (1)
      {
        if (v8 == v7)
        {
          v5 = 0;
          goto LABEL_20;
        }
        if ((int)v8 + v11 >= 0)
          v12 = v3 >> ((v8 + v11) & 0x18);
        else
          v12 = v3 << ((v7 - (v4 & 0xF8) + 8) & 0x18);
        if (v6 != v12)
          goto LABEL_20;
        if (v9 == v7)
          break;
        if ((int)v8 + v10 >= 0)
          v13 = v3 >> ((v8 + v10) & 0x18);
        else
          v13 = v3 << ((v7 - (v4 & 0xF8) + 16) & 0x18);
        if (((v6 ^ v13) & 0x80) != 0)
          goto LABEL_20;
        --v5;
        v7 += 8;
        v10 -= 8;
        v11 -= 8;
        if (v5 <= 1)
        {
          v5 = 1;
          goto LABEL_20;
        }
      }
      __break(1u);
    }
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = 0;
  }
  return result;
}

int64_t sub_247BDB4B0@<X0>(int64_t result@<X0>, uint64_t (*a2)(unint64_t, unint64_t, _QWORD, int64_t)@<X1>, uint64_t (*a3)(unint64_t, _QWORD, unint64_t)@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;

  if (result)
  {
    v6 = result;
    v7 = (71 - __clz(result)) >> 3;
    result = a2(v7, v7, 0, result);
    v8 = result;
    if ((_BYTE)result && result != 255 || (result = a3(v7, 0, v6), result < 2))
    {
LABEL_19:
      *a4 = v7;
      a4[1] = 0;
      a4[2] = v6;
    }
    else
    {
      v9 = 8 * v7;
      v10 = 16 - 8 * v7;
      while (1)
      {
        if (!v9)
        {
          v7 = 0;
          goto LABEL_19;
        }
        if (v9 - 8 < 0)
          v11 = v6 << ((v10 - 8) & 0x38);
        else
          v11 = v6 >> ((v9 - 8) & 0x38);
        if (v8 != v11)
          goto LABEL_19;
        v12 = v9 - 8;
        if (v9 == 8)
          break;
        v13 = v9 < 16;
        v14 = v6 >> ((v9 + 48) & 0x38);
        if (v13)
          v14 = v6 << (v10 & 0x38);
        if (((v8 ^ v14) & 0x80) != 0)
          goto LABEL_19;
        --v7;
        v10 += 8;
        v9 = v12;
        if (v7 <= 1)
        {
          v7 = 1;
          goto LABEL_19;
        }
      }
      __break(1u);
    }
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
  return result;
}

uint64_t sub_247BDB5E0@<X0>(uint64_t result@<X0>, uint64_t (*a2)(uint64_t, uint64_t, _QWORD, uint64_t)@<X1>, uint64_t (*a3)(uint64_t, _QWORD, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  unsigned __int8 v7;

  if ((_BYTE)result)
  {
    v6 = result;
    result = a2(1, 1, 0, result);
    v7 = result;
    if ((!(_BYTE)result || result == 255)
      && (result = a3(1, 0, v6), v7 == v6)
      && result > 1)
    {
      __break(1u);
    }
    else
    {
      *(_OWORD *)a4 = xmmword_247BECFF0;
      *(_BYTE *)(a4 + 16) = v6;
    }
  }
  else
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_BYTE *)(a4 + 16) = 0;
  }
  return result;
}

uint64_t sub_247BDB684@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned __int16 v3;
  unint64_t v4;
  unsigned __int8 v5;

  if ((_WORD)result)
  {
    v3 = result;
    v4 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7) >> 3;
    result = sub_247BDC48C(v4, result);
    v5 = result;
    if ((_BYTE)result && result != 255)
      goto LABEL_10;
    result = sub_247BE0D28(v4, 0, v3);
    if (result < 2 || v5 != (v3 >> (8 * ((v4 - 1) & 1))))
      goto LABEL_10;
    if (v4 == 1)
    {
      __break(1u);
    }
    else if (v3 >= 0x100u)
    {
      if (((v5 ^ v3) & 0x80u) == 0)
        --v4;
LABEL_10:
      *(_QWORD *)a2 = v4;
      *(_QWORD *)(a2 + 8) = 0;
      *(_WORD *)(a2 + 16) = v3;
      return result;
    }
    __break(1u);
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_WORD *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t sub_247BDB75C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (!(_DWORD)result)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = 0;
    return result;
  }
  v3 = result;
  v4 = 32 - __clz(result);
  v5 = (unint64_t)(v4 + 7) >> 3;
  result = sub_247BDC4E0(v5, result);
  v6 = result;
  if ((_BYTE)result && result != 255)
  {
    *(_QWORD *)a2 = v5;
    goto LABEL_30;
  }
  result = sub_247BE0D2C((unint64_t)(v4 + 7) >> 3, 0, v3);
  if (result < 2 || (v7 = v5 - 1, v6 != (v3 >> (8 * ((v5 - 1) & 3)))))
  {
    v8 = (unint64_t)(v4 + 7) >> 3;
    goto LABEL_28;
  }
  if (v5 == 1)
    goto LABEL_34;
  if (v3 < 0x100)
    goto LABEL_35;
  v8 = (unint64_t)(v4 + 7) >> 3;
  if (((v6 ^ (v3 >> ((v4 + 23) & 0x18))) & 0x80) != 0)
  {
LABEL_28:
    *(_QWORD *)a2 = v8;
LABEL_30:
    *(_QWORD *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = v3;
    return result;
  }
  if (v7 < 2)
  {
LABEL_31:
    v8 = 1;
    goto LABEL_28;
  }
  v9 = v5 - 2;
  if (v6 != (v3 >> (8 * ((v5 - 2) & 3))))
  {
LABEL_32:
    v8 = v7;
    goto LABEL_28;
  }
  if (v5 == 2)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v3 < 0x10000)
    goto LABEL_35;
  v8 = v5 - 1;
  if (((v6 ^ (v3 >> ((8 * v7 + 16) & 0x18))) & 0x80) != 0)
    goto LABEL_28;
  if (v9 < 2)
    goto LABEL_31;
  v7 = v5 - 3;
  if (v6 != (v3 >> (8 * ((v5 - 3) & 3))))
  {
    v8 = v5 - 2;
    goto LABEL_28;
  }
  if (v5 == 3)
    goto LABEL_34;
  if (!HIBYTE(v3))
    goto LABEL_35;
  v8 = v5 - 2;
  if (((v6 ^ (v3 >> ((8 * v9 + 16) & 0x18))) & 0x80) != 0)
    goto LABEL_28;
  if (v7 < 2)
    goto LABEL_31;
  if (v6 != (v3 >> ((v4 + 7) & 0x18)))
    goto LABEL_32;
  if (v5 == 4)
    goto LABEL_34;
  if (v4 >= 0x21)
  {
    if (((v6 ^ (v3 >> ((8 * v7 + 16) & 0x18))) & 0x80u) == 0)
      v8 = 1;
    else
      v8 = v5 - 3;
    goto LABEL_28;
  }
LABEL_35:
  __break(1u);
  return result;
}

int64_t sub_247BDB93C@<X0>(int64_t result@<X0>, uint64_t (*a2)(unint64_t, unint64_t, _QWORD, int64_t)@<X1>, uint64_t (*a3)(unint64_t, _QWORD, unint64_t)@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;

  if (result)
  {
    v6 = result;
    v7 = (71 - __clz(result)) >> 3;
    result = a2(v7, v7, 0, result);
    v8 = result;
    if ((_BYTE)result && result != 255 || (result = a3(v7, 0, v6), result < 2))
    {
LABEL_15:
      *a4 = v7;
      a4[1] = 0;
      a4[2] = v6;
    }
    else
    {
      v9 = 8 * v7;
      while (1)
      {
        if (!v9)
        {
          v7 = 0;
          goto LABEL_15;
        }
        if (v8 != (v6 >> ((v9 - 8) & 0x38)))
          goto LABEL_15;
        if (v9 == 8)
          break;
        if (v9 < 16)
          goto LABEL_17;
        if (((v8 ^ (v6 >> ((v9 + 48) & 0x38))) & 0x80) != 0)
          goto LABEL_15;
        --v7;
        v9 -= 8;
        if (v7 <= 1)
        {
          v7 = 1;
          goto LABEL_15;
        }
      }
      __break(1u);
LABEL_17:
      __break(1u);
    }
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
  return result;
}

uint64_t sub_247BDBA44@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  int v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t (*v16)(char *, uint64_t);
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unsigned __int8 v21;
  char v22;
  unsigned __int8 v23;
  char v24;
  unsigned __int8 v25;
  char v26;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v20 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v18 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - v12;
  sub_247BEC878();
  swift_getAssociatedConformanceWitness();
  sub_247BEC854();
  if ((v26 & 1) != 0)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v13, AssociatedTypeWitness);
  v14 = v25;
  if (v25)
  {
    if (v25 != 255)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v13, AssociatedTypeWitness);
  }
  v19 = a1;
  if (sub_247BEC830() >= 2)
  {
    while (1)
    {
      sub_247BEC854();
      if ((v24 & 1) != 0 || v23 != v14)
        break;
      v15 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
      v15(v8, v13, AssociatedTypeWitness);
      sub_247BEC86C();
      sub_247BEC854();
      v16 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
      result = v16(v11, AssociatedTypeWitness);
      if ((v22 & 1) != 0)
      {
        __break(1u);
        return result;
      }
      if (((v21 ^ v14) & 0x80) == 0)
      {
        v15(v20, v13, AssociatedTypeWitness);
        sub_247BEC86C();
        v16(v13, AssociatedTypeWitness);
        (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v13, v8, AssociatedTypeWitness);
        if (sub_247BEC830() > 1)
          continue;
      }
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(v19, v13, AssociatedTypeWitness);
    }
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(v19, v13, AssociatedTypeWitness);
}

uint64_t ASN1IntegerRepresentable<>.init(derIntegerBytes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  char *v37;
  _QWORD v38[3];
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t AssociatedTypeWitness;
  uint64_t v43;
  uint64_t AssociatedConformanceWitness;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  char *v51;

  v43 = a7;
  v49 = a8;
  v47 = *(_QWORD *)(a6 + 8);
  v46 = *(_QWORD *)(*(_QWORD *)(v47 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v45 = (char *)v38 - v15;
  v48 = *(_QWORD *)(a5 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)v38 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v38 - v22;
  v50[0] = a1;
  v50[1] = a2;
  v40 = a2;
  v41 = a4;
  AssociatedConformanceWitness = a3;
  v50[2] = a3;
  v50[3] = a4;
  swift_unknownObjectRetain();
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576E98D0);
  sub_247BDF1F0(&qword_2576E98D8, &qword_2576E98D0, MEMORY[0x24BEE2190]);
  v25 = v51;
  sub_247BD2AF0((uint64_t)v50, a5, v24, a6, (uint64_t)v23);
  if (v25)
    return swift_unknownObjectRelease();
  v38[1] = 0;
  v38[2] = a1;
  v39 = v21;
  v51 = v18;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v49, v23, a5);
  result = (*(uint64_t (**)(uint64_t))(v43 + 32))(a5);
  if ((result & 1) == 0 || v41 >> 1 == AssociatedConformanceWitness)
    return swift_unknownObjectRelease();
  if ((uint64_t)(v41 >> 1) <= AssociatedConformanceWitness)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (*(char *)(v40 + AssociatedConformanceWitness) < 0)
  {
    v27 = sub_247BEC920();
    result = sub_247BEC9D4();
    v28 = __OFSUB__(v27, result);
    v29 = v27 - result;
    if (!v28)
    {
      v30 = sub_247BEC920();
      if (v29 < v30)
      {
        v31 = v30;
        AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        v32 = v51;
        do
        {
          if (__OFADD__(v29, 8))
            v33 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v33 = v29 + 8;
          sub_247BECA10();
          sub_247BEC9F8();
          v50[0] = v29;
          sub_247BD7A48();
          v34 = v31;
          v35 = v39;
          sub_247BEC8FC();
          v36 = *(void (**)(char *, uint64_t))(v48 + 8);
          v36(v32, a5);
          sub_247BEC908();
          v37 = v35;
          v31 = v34;
          v36(v37, a5);
          v29 = v33;
        }
        while (v33 < v34);
      }
      return swift_unknownObjectRelease();
    }
LABEL_17:
    __break(1u);
    return result;
  }
  return swift_unknownObjectRelease();
}

uint64_t ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;
  void (*v17)(char *);

  v17 = a1;
  v5 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for IntegerBytesCollection(0, v8, v10, v9);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v16 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, a3);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v14, v7, a3);
  v17(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t IntegerBytesCollection.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t IntegerBytesCollection.hash(into:)()
{
  return sub_247BEC728();
}

uint64_t static IntegerBytesCollection.== infix(_:_:)()
{
  return sub_247BEC770() & 1;
}

uint64_t IntegerBytesCollection.hashValue.getter()
{
  sub_247BECA4C();
  sub_247BEC728();
  return sub_247BECA7C();
}

uint64_t sub_247BDC1E8()
{
  sub_247BECA4C();
  IntegerBytesCollection.hash(into:)();
  return sub_247BECA7C();
}

uint64_t sub_247BDC228()
{
  return static IntegerBytesCollection.== infix(_:_:)();
}

uint64_t sub_247BDC234()
{
  _QWORD *v0;
  uint64_t result;

  if (__OFSUB__(*v0, 1))
  {
    __break(1u);
  }
  else if ((unint64_t)(*v0 - 0x1000000000000001) >> 61 == 7)
  {
    sub_247BD7A48();
    return sub_247BEC938();
  }
  __break(1u);
  return result;
}

uint64_t IntegerBytesCollection.startIndex.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_247BD2EE4();
  *a1 = result;
  return result;
}

void IntegerBytesCollection.endIndex.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t IntegerBytesCollection.count.getter()
{
  return sub_247BD2EE4();
}

uint64_t sub_247BDC300(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;

  v2 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_16;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v3 = 8 * v2;
  if (8 * v2 < -32768)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v3 >= 0x8000)
  {
LABEL_18:
    __break(1u);
    return result;
  }
  v4 = v2 << 51;
  if ((unint64_t)(v4 - 0x10000000000001) < 0xFFDFFFFFFFFFFFFFLL)
    return 0;
  v5 = (unsigned __int16)a2 >> (v3 & 8);
  if ((unint64_t)v4 >> 52)
    v5 = 0;
  if ((unint64_t)v4 <= 0xFFF0000000000000)
    v6 = 0;
  else
    v6 = a2 << (-BYTE6(v4) & 8);
  if (v4 < 0)
    return v6;
  else
    return v5;
}

uint64_t sub_247BDC3A0(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 - 1;
  if (__OFSUB__(a1, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  if ((unint64_t)(a1 - 0x1000000000000001) >> 61 != 7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v3 = 8 * v2;
  if (8 * v2 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    if ((unint64_t)v2 <= 0xFFFFFFE000000000)
      return 0;
    else
      return a2 << (-BYTE4(v2) & 0x18);
  }
  v2 <<= 35;
  if (v2 < (uint64_t)0xFFFFFFE000000000 || v2 > 0x2000000000)
    return 0;
  if (v2 < 0)
    goto LABEL_15;
  if ((unint64_t)v2 >> 37)
    return 0;
  return a2 >> (v3 & 0x18);
}

uint64_t sub_247BDC444(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((unint64_t)(8 * v2) > 0xFF)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if ((v2 & 0x1F) != 0)
    return 0;
  else
    return a2;
}

uint64_t sub_247BDC48C(uint64_t result, unsigned __int16 a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;

  v2 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = 8 * v2;
  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v3 >> 16)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v4 = a2 >> (v3 & 8);
  if ((v2 & 0x1FFE) != 0)
    return 0;
  else
    return v4;
}

uint64_t sub_247BDC4E0(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;

  v2 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = 8 * v2;
  if (8 * v2 < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v3))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v4 = a2 >> (v3 & 0x18);
  if ((v2 & 0x1FFFFFFC) != 0)
    return 0;
  else
    return v4;
}

uint64_t sub_247BDC530(uint64_t result, unint64_t a2)
{
  unint64_t v2;

  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_8;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v2 = 8 * (result - 1);
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  if (v2 >= 0x40)
    return 0;
  else
    return (a2 >> (v2 & 0x38));
}

uint64_t IntegerBytesCollection.subscript.getter(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(char *, char *, uint64_t);
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t AssociatedConformanceWitness;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  char *v29;
  char *v30;
  char *v31;
  void (*v32)(char *, char *, uint64_t);
  char v33;
  uint64_t result;
  char v35;
  uint64_t v36;
  char *v37;
  char v38;
  unsigned int v39;
  unsigned __int8 v40;
  char *v41;
  char v42;
  char *v43;
  unsigned __int8 v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[3];
  char *v48;
  void (**v49)(char *, char *, uint64_t);
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t AssociatedTypeWitness;
  uint64_t v55;
  char *v56;
  unsigned __int8 v57;
  uint64_t v58;

  v3 = *(_QWORD *)(a2 + 16);
  v53 = *(_QWORD *)(a2 + 24);
  v47[1] = *(_QWORD *)(*(_QWORD *)(v53 + 8) + 24);
  swift_getAssociatedTypeWitness();
  v52 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v51 = (char *)v47 - v5;
  v49 = *(void (***)(char *, char *, uint64_t))(v3 - 8);
  v6 = v49;
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_checkMetadataState();
  v55 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v47[0] = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v48 = (char *)v47 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v56 = (char *)v47 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (void (**)(char *, char *, uint64_t))((char *)v47 - v17);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)v47 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v47 - v22;
  v24 = *a1;
  v6[2](v8, v50, v3);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_247BEC8D8();
  v58 = v24;
  type metadata accessor for IntegerBytesCollection.Index(0, v3, v53, v26);
  sub_247BDC234();
  sub_247BEC8F0();
  v27 = v49[1];
  v47[2] = v3;
  ((void (*)(char *))v27)(v8);
  v28 = *(void (**)(char *, uint64_t))(v55 + 8);
  v28(v21, v9);
  swift_getAssociatedConformanceWitness();
  v29 = v51;
  sub_247BECA10();
  sub_247BEC9F8();
  v50 = v23;
  v30 = v29;
  v31 = v21;
  sub_247BEC8E4();
  v28(v21, v9);
  v32 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  v49 = v18;
  v32(v56, (char *)v18, v9);
  v53 = AssociatedConformanceWitness;
  if ((sub_247BEC92C() & 1) == 0
    || (sub_247BECA10(),
        sub_247BEC9F8(),
        swift_getAssociatedConformanceWitness(),
        v33 = sub_247BEC758(),
        result = ((uint64_t (*)(char *, uint64_t))v28)(v31, v9),
        (v33 & 1) != 0))
  {
    if (sub_247BEC920() < 8)
      goto LABEL_15;
    v32(v48, v56, v9);
    v57 = -1;
    v35 = sub_247BEC92C();
    v36 = sub_247BEC920();
    if ((v35 & 1) != 0)
    {
      if (v36 <= 8)
      {
        sub_247BECA10();
        sub_247BEC9F8();
        swift_getAssociatedConformanceWitness();
        v37 = v48;
        v38 = sub_247BEC740();
        v28(v31, v9);
        v39 = v57;
        v30 = (char *)v47[0];
        (*(void (**)(_QWORD, char *, uint64_t))(v55 + 32))(v47[0], v37, v9);
        if ((v38 & 1) == 0)
        {
LABEL_14:
          v28(v30, v9);
          goto LABEL_15;
        }
        v40 = sub_247BEC914();
        v28(v30, v9);
        if (v39 < v40)
        {
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_15:
        v45 = v56;
        v46 = sub_247BEC914();
        v28(v45, v9);
        v28((char *)v49, v9);
        v28(v50, v9);
        return v46;
      }
    }
    else if (v36 < 9)
    {
      v43 = v48;
      v44 = sub_247BEC914();
      v28(v43, v9);
      if (v57 < v44)
        goto LABEL_13;
      goto LABEL_15;
    }
    sub_247BD7A04();
    sub_247BEC8D8();
    swift_getAssociatedConformanceWitness();
    v41 = v48;
    v42 = sub_247BEC74C();
    v28(v31, v9);
    v28(v41, v9);
    if ((v42 & 1) != 0)
      goto LABEL_13;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_247BDCBDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for IntegerBytesCollection.Index(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v4);
  return sub_247BEC800();
}

uint64_t sub_247BDCC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for IntegerBytesCollection.Index(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), a4);
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v4);
  return sub_247BEC818();
}

uint64_t sub_247BDCCB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247BDCFE0(a1, a2, a3, MEMORY[0x24BEE1880]);
}

_QWORD *sub_247BDCCC4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_247BDD070(a1, a2, a3, MEMORY[0x24BEE1880]);
}

uint64_t sub_247BDCCD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>, a4);
  return sub_247BEC7F4();
}

void sub_247BDCD40(_QWORD *a1@<X8>)
{
  IntegerBytesCollection.endIndex.getter(a1);
}

void (*sub_247BDCD54(_QWORD *a1, uint64_t *a2, uint64_t a3))(_QWORD *a1)
{
  _BYTE *v6;
  uint64_t (*v7)();
  char v8;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v7 = sub_247BDCDE4((uint64_t)v6, a2, a3);
  v6[40] = v8;
  *((_QWORD *)v6 + 4) = v7;
  return sub_247BDCDB8;
}

void sub_247BDCDB8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_247BDCDE4(uint64_t a1, uint64_t *a2, uint64_t a3))()
{
  IntegerBytesCollection.subscript.getter(a2, a3);
  return nullsub_1;
}

uint64_t sub_247BDCE10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>, a1);
  v3 = type metadata accessor for IntegerBytesCollection.Index(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v2);
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v3);
  return sub_247BEC80C();
}

void sub_247BDCE80(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_247BDCE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>, a3);
  v5 = type metadata accessor for IntegerBytesCollection.Index(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v4);
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v5);
  return sub_247BEC800();
}

uint64_t sub_247BDCF10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>, a3);
  v5 = type metadata accessor for IntegerBytesCollection.Index(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v4);
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v5);
  return sub_247BEC818();
}

uint64_t sub_247BDCF88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247BDE68C(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BEE1B68], (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE07E0]);
}

uint64_t sub_247BDCFAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247BDE68C(a1, a2, a3, a4, MEMORY[0x24BEE08B8], (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE07F0]);
}

uint64_t sub_247BDCFD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247BDCFE0(a1, a2, a3, MEMORY[0x24BEE1878]);
}

uint64_t sub_247BDCFE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>);
  v8 = type metadata accessor for IntegerBytesCollection.Index(255, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), v7);
  v9 = MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v8);
  return a4(a1, a2, v6, v9);
}

_QWORD *sub_247BDD064(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_247BDD070(a1, a2, a3, MEMORY[0x24BEE1878]);
}

_QWORD *sub_247BDD070(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;

  v7 = MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>);
  v9 = type metadata accessor for IntegerBytesCollection.Index(255, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), v8);
  v10 = MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, v9);
  result = a4(&v12, a1, a2, v7, v10);
  *a1 = v12;
  return result;
}

uint64_t sub_247BDD0F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = *(_QWORD *)(a1 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, v2, a1);
  IntegerBytesCollection.startIndex.getter(&v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, a1);
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>, a1);
  result = sub_247BEC9BC();
  *(_QWORD *)(a2 + *(int *)(result + 36)) = v7;
  return result;
}

uint64_t sub_247BDD188(uint64_t a1)
{
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>, a1);
  return sub_247BEC848();
}

uint64_t sub_247BDD1BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>, a1);
  v4 = sub_247BDFA58(v1, a1, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
  return v4;
}

uint64_t IntegerBytesCollection.Index.hash(into:)()
{
  return sub_247BECA58();
}

uint64_t IntegerBytesCollection.Index.hashValue.getter()
{
  sub_247BECA4C();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BDD294()
{
  sub_247BECA4C();
  IntegerBytesCollection.Index.hash(into:)();
  return sub_247BECA7C();
}

uint64_t sub_247BDD2CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, a3);
  return sub_247BEC8C0();
}

BOOL static IntegerBytesCollection.Index.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

BOOL static IntegerBytesCollection.Index.> infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL static IntegerBytesCollection.Index.<= infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL static IntegerBytesCollection.Index.>= infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

uint64_t IntegerBytesCollection.Index.advanced(by:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  if (__OFSUB__(*v2, result))
    __break(1u);
  else
    *a2 = *v2 - result;
  return result;
}

uint64_t IntegerBytesCollection.Index.distance(to:)(_QWORD *a1)
{
  _QWORD *v1;
  BOOL v2;
  uint64_t result;

  v2 = __OFSUB__(*v1, *a1);
  result = *v1 - *a1;
  if (v2)
    __break(1u);
  return result;
}

uint64_t sub_247BDD3A8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = IntegerBytesCollection.Index.distance(to:)(a1);
  *a2 = result;
  return result;
}

uint64_t sub_247BDD3CC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return IntegerBytesCollection.Index.advanced(by:)(*a1, a2);
}

uint64_t sub_247BDD3D4()
{
  return sub_247BEC8CC();
}

uint64_t sub_247BDD3F0()
{
  return 1;
}

uint64_t sub_247BDD3F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  uint64_t v5;
  char v7;
  char v8;
  uint64_t result;

  sub_247BDE838(a1, a2, a3, a4);
  v8 = v7;
  result = swift_unknownObjectRelease();
  if (!v5)
    *a5 = v8;
  return result;
}

uint64_t sub_247BDD440(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDFA14();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDD49C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_247BDD5B4(a1, a2, (uint64_t (*)(_OWORD *, _QWORD, _QWORD))sub_247BD8ACC, a3);
}

uint64_t sub_247BDD4B8(char **a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  char v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v8 = *v2;
  v6 = v3;
  v7 = v4;
  return sub_247BD55BC(&v6, 0, a1, (uint64_t (*)(char **))sub_247BDF9FC);
}

uint64_t sub_247BDD50C()
{
  return 0;
}

void sub_247BDD514(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  uint64_t v5;
  char v7;

  sub_247BD85A8(a1, a2, a3, a4);
  if (!v5)
    *a5 = v7;
}

uint64_t sub_247BDD53C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF9B8();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDD598@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_247BDD5B4(a1, a2, (uint64_t (*)(_OWORD *, _QWORD, _QWORD))sub_247BD942C, a3);
}

uint64_t sub_247BDD5B4@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, _QWORD, _QWORD)@<X4>, _BYTE *a4@<X8>)
{
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  _OWORD v10[6];

  v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  result = a3(v10, *(_QWORD *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t sub_247BDD60C(char **a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  char v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v8 = *v2;
  v6 = v3;
  v7 = v4;
  return sub_247BD55BC(&v6, 0, a1, sub_247BDF9A0);
}

uint64_t sub_247BDD660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _WORD *a5@<X8>)
{
  uint64_t v5;
  __int16 v7;
  __int16 v8;
  uint64_t result;

  sub_247BDE88C(a1, a2, a3, a4);
  v8 = v7;
  result = swift_unknownObjectRelease();
  if (!v5)
    *a5 = v8;
  return result;
}

uint64_t sub_247BDD6A8(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF95C();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDD704@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  return sub_247BDD814(a1, a2, (uint64_t (*)(_OWORD *, _QWORD, _QWORD))sub_247BD8D24, a3);
}

uint64_t sub_247BDD720(char **a1, uint64_t a2)
{
  __int16 *v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  char v7;
  __int16 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v8 = *v2;
  v6 = v3;
  v7 = v4;
  return sub_247BD55BC(&v6, 0, a1, (uint64_t (*)(char **))sub_247BDF944);
}

void sub_247BDD774(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _WORD *a5@<X8>)
{
  uint64_t v5;
  __int16 v7;

  sub_247BD80EC(a1, a2, a3, a4);
  if (!v5)
    *a5 = v7;
}

uint64_t sub_247BDD79C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF900();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDD7F8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  return sub_247BDD814(a1, a2, (uint64_t (*)(_OWORD *, _QWORD, _QWORD))sub_247BD96D0, a3);
}

uint64_t sub_247BDD814@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, _QWORD, _QWORD)@<X4>, _WORD *a4@<X8>)
{
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  _OWORD v10[6];

  v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  result = a3(v10, *(_QWORD *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t sub_247BDD86C(char **a1, uint64_t a2)
{
  __int16 *v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  char v7;
  __int16 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v8 = *v2;
  v6 = v3;
  v7 = v4;
  return sub_247BD55BC(&v6, 0, a1, sub_247BDF8E8);
}

uint64_t sub_247BDD8C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _DWORD *a5@<X8>)
{
  uint64_t v5;
  int v7;
  int v8;
  uint64_t result;

  sub_247BDE9B4(a1, a2, a3, a4);
  v8 = v7;
  result = swift_unknownObjectRelease();
  if (!v5)
    *a5 = v8;
  return result;
}

uint64_t sub_247BDD908(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF8A4();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDD964@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_247BDDA74(a1, a2, (uint64_t (*)(_OWORD *, _QWORD, _QWORD))sub_247BD8F7C, a3);
}

uint64_t sub_247BDD980(char **a1, uint64_t a2)
{
  int *v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  char v7;
  int v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v8 = *v2;
  v6 = v3;
  v7 = v4;
  return sub_247BD55BC(&v6, 0, a1, (uint64_t (*)(char **))sub_247BDF88C);
}

void sub_247BDD9D4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _DWORD *a5@<X8>)
{
  uint64_t v5;
  int v7;

  sub_247BD8280(a1, a2, a3, a4);
  if (!v5)
    *a5 = v7;
}

uint64_t sub_247BDD9FC(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF848();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDDA58@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_247BDDA74(a1, a2, (uint64_t (*)(_OWORD *, _QWORD, _QWORD))sub_247BD9974, a3);
}

uint64_t sub_247BDDA74@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_OWORD *, _QWORD, _QWORD)@<X4>, _DWORD *a4@<X8>)
{
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  _OWORD v10[6];

  v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  result = a3(v10, *(_QWORD *)a2, *(unsigned __int8 *)(a2 + 8));
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t sub_247BDDACC(char **a1, uint64_t a2)
{
  int *v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  char v7;
  int v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v8 = *v2;
  v6 = v3;
  v7 = v4;
  return sub_247BD55BC(&v6, 0, a1, sub_247BDF830);
}

uint64_t sub_247BDDB20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  return sub_247BDDD34(a1, a2, a3, a4, a5);
}

uint64_t sub_247BDDB34(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF7EC();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDDB90@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_247BDDDE8(a1, a2, a3);
}

uint64_t sub_247BDDBA4(char **a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v8 = *v2;
  v6 = v3;
  v7 = v4;
  return sub_247BD55BC(&v6, 0, a1, (uint64_t (*)(char **))sub_247BDF74C);
}

uint64_t sub_247BDDBF4@<X0>(uint64_t *a1@<X8>)
{
  return sub_247BDDE5C((uint64_t (*)(void))sub_247BD8414, a1);
}

uint64_t sub_247BDDC10(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF7A8();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDDC6C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_247BDDC88(a1, a2, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_247BD8414, a3);
}

uint64_t sub_247BDDC88@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, unint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  _OWORD v10[6];

  v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  v7 = a1[5];
  v10[4] = a1[4];
  v10[5] = v7;
  v8 = a1[1];
  v10[0] = *a1;
  v10[1] = v8;
  result = sub_247BD9C34((uint64_t)v10, *(_QWORD *)a2, *(_BYTE *)(a2 + 8), a3);
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t sub_247BDDCE4(char **a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  char v4;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v8 = *v2;
  v6 = v3;
  v7 = v4;
  return sub_247BD55BC(&v6, 0, a1, sub_247BDF6F0);
}

uint64_t sub_247BDDD34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  sub_247BDEAE4(a1, a2, a3, a4);
  v8 = v7;
  result = swift_unknownObjectRelease();
  if (!v5)
    *a5 = v8;
  return result;
}

uint64_t sub_247BDDD7C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF764();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

void sub_247BDDDD8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 2;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BDDDE8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t result;
  _OWORD v9[6];

  v5 = a1[3];
  v9[2] = a1[2];
  v9[3] = v5;
  v6 = a1[5];
  v9[4] = a1[4];
  v9[5] = v6;
  v7 = a1[1];
  v9[0] = *a1;
  v9[1] = v7;
  result = sub_247BD91D4((uint64_t)v9, *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_247BDDE40@<X0>(uint64_t *a1@<X8>)
{
  return sub_247BDDE5C((uint64_t (*)(void))sub_247BD7DB0, a1);
}

uint64_t sub_247BDDE5C@<X0>(uint64_t (*a1)(void)@<X6>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = a1();
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_247BDDE84(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_247BDF708();
  return ASN1IntegerRepresentable<>.withBigEndianIntegerBytes<A>(_:)(a1, a2, a4);
}

uint64_t sub_247BDDEE0@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_247BDDC88(a1, a2, (uint64_t (*)(uint64_t, uint64_t, unint64_t, unint64_t))sub_247BD7DB0, a3);
}

uint64_t sub_247BDDF00@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[6];

  v5 = a1[3];
  v12[2] = a1[2];
  v12[3] = v5;
  v6 = a1[5];
  v12[4] = a1[4];
  v12[5] = v6;
  v7 = a1[1];
  v12[0] = *a1;
  v12[1] = v7;
  result = sub_247BD8838((uint64_t)v12, *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
  if (!v3)
  {
    *a3 = result;
    a3[1] = v9;
    a3[2] = v10;
    a3[3] = v11;
  }
  return result;
}

uint64_t sub_247BDDF5C(char **a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = v2[1];
  v9 = *v2;
  v10 = v5;
  v7 = v3;
  v8 = v4;
  return sub_247BD55BC(&v7, 0, a1, sub_247BDF6CC);
}

char *sub_247BDDFB0(char *result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  BOOL v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;

  v3 = *((_QWORD *)result + 2);
  v2 = *((_QWORD *)result + 3);
  v4 = v2 >> 1;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  if (v3 != v2 >> 1)
  {
    v36 = *(_QWORD *)result;
    v38 = *((_QWORD *)result + 1);
    result = (char *)sub_247BD3E64((uint64_t)result);
    if (v3 >= v4)
    {
LABEL_50:
      __break(1u);
LABEL_51:
      result = (char *)swift_unknownObjectRelease();
      goto LABEL_52;
    }
    v1 = 0;
    v34 = v2 & 1;
    v35 = v38 + 112;
    v6 = (uint64_t)(v5 + 32);
    while (1)
    {
      if (v4 <= v3)
      {
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
        return result;
      }
      v7 = (uint64_t *)(v38 + 96 * v3);
      v8 = *v7;
      v9 = *((_BYTE *)v7 + 24);
      v10 = v3 + 1;
      v43 = *((_OWORD *)v7 + 3);
      v44 = *((_OWORD *)v7 + 2);
      v42 = *((_BYTE *)v7 + 8);
      if (v9)
      {
        v11 = v7[2];
        v12 = v4;
        if (v10 != v4)
        {
          v13 = (_QWORD *)(v35 + 96 * v3);
          v12 = v3 + 1;
          do
          {
            if (v12 >= v4)
            {
LABEL_57:
              __break(1u);
LABEL_58:
              __break(1u);
              goto LABEL_59;
            }
            if (v11 >= *v13)
              goto LABEL_14;
            v14 = v12 + 1;
            if (__OFADD__(v12, 1))
              goto LABEL_58;
            ++v12;
            v13 += 12;
          }
          while (v14 != v4);
          v12 = v4;
LABEL_14:
          if (v12 <= v3)
            goto LABEL_61;
          if (v12 < 0)
            goto LABEL_62;
        }
        v15 = v12 - v10;
        if (__OFSUB__(v12, v10))
          goto LABEL_63;
        if (v15 < 0)
          goto LABEL_64;
        v16 = v4 - v10;
        if (__OFSUB__(v4, v10))
          goto LABEL_65;
        v37 = v5;
        if (!v15 || v16 < 0 || (v17 = v4, v16 >= v15))
        {
          v17 = v12;
          if (__OFADD__(v10, v15))
            goto LABEL_69;
          if (v4 < v12)
            goto LABEL_66;
        }
        if (v17 <= v3)
          goto LABEL_67;
        if (v10 != v12)
        {
          if (v10 >= v12)
            goto LABEL_70;
          v18 = (uint64_t *)(v35 + 96 * v3);
          do
          {
            v19 = *v18;
            v18 += 12;
            if (v11 >= v19)
            {
              __break(1u);
              goto LABEL_57;
            }
            --v15;
          }
          while (v15);
          if (*(_QWORD *)(v38 + 96 * v10 + 16) != v11 + 1)
            goto LABEL_71;
        }
        v41 = v34 | (2 * v12);
        v20 = v36;
        result = (char *)swift_unknownObjectRetain();
        v39 = v3 + 1;
        v40 = v38;
        v3 = v17;
        v5 = v37;
        if (v1)
        {
LABEL_43:
          result = (char *)swift_unknownObjectRetain();
          v30 = __OFSUB__(v1--, 1);
          if (v30)
            goto LABEL_60;
          goto LABEL_48;
        }
      }
      else
      {
        v20 = v7[8];
        if (!v20)
          goto LABEL_73;
        v39 = v7[10];
        v40 = v7[9];
        v41 = v7[11];
        result = (char *)swift_unknownObjectRetain();
        v11 = 0;
        ++v3;
        if (v1)
          goto LABEL_43;
      }
      v21 = *((_QWORD *)v5 + 3);
      if ((uint64_t)((v21 >> 1) + 0x4000000000000000) < 0)
        goto LABEL_68;
      v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
      if (v22 <= 1)
        v23 = 1;
      else
        v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9D08);
      v24 = (char *)swift_allocObject();
      v25 = (uint64_t)(_swift_stdlib_malloc_size(v24) - 32) / 96;
      *((_QWORD *)v24 + 2) = v23;
      *((_QWORD *)v24 + 3) = 2 * v25;
      v26 = v24 + 32;
      v27 = *((_QWORD *)v5 + 3) >> 1;
      v6 = (uint64_t)&v24[96 * v27 + 32];
      v28 = (v25 & 0x7FFFFFFFFFFFFFFFLL) - v27;
      if (*((_QWORD *)v5 + 2))
      {
        v29 = v5 + 32;
        if (v24 != v5 || v26 >= &v29[96 * v27])
          memmove(v26, v29, 96 * v27);
        swift_unknownObjectRetain();
        *((_QWORD *)v5 + 2) = 0;
      }
      else
      {
        swift_unknownObjectRetain();
      }
      result = (char *)swift_release();
      v5 = v24;
      v30 = __OFSUB__(v28, 1);
      v1 = v28 - 1;
      if (v30)
        goto LABEL_60;
LABEL_48:
      *(_QWORD *)v6 = v8;
      *(_BYTE *)(v6 + 8) = v42;
      *(_QWORD *)(v6 + 16) = v20;
      *(_QWORD *)(v6 + 24) = v40;
      *(_QWORD *)(v6 + 32) = v39;
      *(_QWORD *)(v6 + 40) = v41;
      *(_QWORD *)(v6 + 48) = v11;
      *(_BYTE *)(v6 + 56) = v9 ^ 1;
      *(_OWORD *)(v6 + 64) = v44;
      *(_OWORD *)(v6 + 80) = v43;
      if (v3 == v4)
        goto LABEL_51;
      v6 += 96;
      if (v3 >= v4)
        goto LABEL_50;
    }
  }
  v1 = 0;
LABEL_52:
  v31 = *((_QWORD *)v5 + 3);
  if (v31 >= 2)
  {
    v32 = v31 >> 1;
    v30 = __OFSUB__(v32, v1);
    v33 = v32 - v1;
    if (v30)
      goto LABEL_72;
    *((_QWORD *)v5 + 2) = v33;
  }
  return v5;
}

uint64_t sub_247BDE370(uint64_t result, int64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  _BOOL4 v9;
  BOOL v10;
  int64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t *v14;
  uint64_t v15;
  BOOL v16;
  int64_t v17;
  BOOL v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  int64_t *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  v5 = result;
  v6 = 0;
  v7 = 32;
  v8 = result;
  while (1)
  {
    v9 = v8 <= a2;
    if (a3 > 0)
      v9 = v8 >= a2;
    if (v9)
      break;
    v10 = __OFADD__(v8, a3);
    v8 += a3;
    if (v10)
      v8 = (v8 >> 63) ^ 0x8000000000000000;
    v7 += 8;
    v10 = __OFADD__(v6++, 1);
    if (v10)
    {
      __break(1u);
      break;
    }
  }
  if (v6 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9898);
    v11 = (int64_t *)swift_allocObject();
    result = _swift_stdlib_malloc_size(v11);
    v12 = result - 32;
    if (result < 32)
      v12 = result - 25;
    v13 = v12 >> 3;
    v11[2] = v6;
    v11[3] = 2 * v13;
    v14 = v11 + 4;
    v15 = v13 & 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
    v15 -= v6;
    while (1)
    {
      v16 = v5 <= a2;
      if (a3 > 0)
        v16 = v5 >= a2;
      if (v16)
        break;
      if (__OFADD__(v5, a3))
        v17 = ((v5 + a3) >> 63) ^ 0x8000000000000000;
      else
        v17 = v5 + a3;
      *v14++ = v5;
      v5 = v17;
      if (!--v6)
        goto LABEL_23;
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v11 = (int64_t *)MEMORY[0x24BEE4AF8];
  v14 = (int64_t *)(MEMORY[0x24BEE4AF8] + 32);
  v15 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 24) >> 1;
  if (v6)
    goto LABEL_15;
  v17 = result;
LABEL_23:
  v18 = v17 <= a2;
  if (a3 > 0)
    v18 = v17 >= a2;
  if (!v18)
  {
    v19 = (a3 >> 63) ^ 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v20 = v17 + a3;
      if (__OFADD__(v17, a3))
      {
        v20 = v19;
        if (!v15)
          goto LABEL_32;
        v20 = v19;
      }
      else if (!v15)
      {
LABEL_32:
        v21 = v11[3];
        if ((uint64_t)((v21 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_58;
        v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
        if (v22 <= 1)
          v23 = 1;
        else
          v23 = v22;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9898);
        v24 = (int64_t *)swift_allocObject();
        v25 = _swift_stdlib_malloc_size(v24);
        v26 = v25 - 32;
        if (v25 < 32)
          v26 = v25 - 25;
        v27 = v26 >> 3;
        v24[2] = v23;
        v24[3] = 2 * (v26 >> 3);
        v28 = (unint64_t)(v24 + 4);
        v29 = (unint64_t)v11[3] >> 1;
        if (v11[2])
        {
          if (v24 != v11 || v28 >= (unint64_t)&v11[v29 + 4])
            memmove(v24 + 4, v11 + 4, 8 * v29);
          v11[2] = 0;
        }
        v14 = (int64_t *)(v28 + 8 * v29);
        v15 = (v27 & 0x7FFFFFFFFFFFFFFFLL) - v29;
        result = swift_release();
        v11 = v24;
        v19 = (a3 >> 63) ^ 0x7FFFFFFFFFFFFFFFLL;
      }
      v10 = __OFSUB__(v15--, 1);
      if (v10)
        goto LABEL_57;
      *v14++ = v17;
      v31 = v20 <= a2;
      if (a3 > 0)
        v31 = v20 >= a2;
      v17 = v20;
    }
    while (!v31);
  }
  v32 = v11[3];
  if (v32 < 2)
    return (uint64_t)v11;
  v33 = v32 >> 1;
  v10 = __OFSUB__(v33, v15);
  v34 = v33 - v15;
  if (!v10)
  {
    v11[2] = v34;
    return (uint64_t)v11;
  }
LABEL_59:
  __break(1u);
  return result;
}

char *sub_247BDE5F0(uint64_t a1)
{
  return sub_247BD3E8C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_247BDE604(uint64_t a1)
{
  return sub_247BD3F98(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247BDE618(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[6];

  v2 = *(_QWORD *)(v1 + 24);
  v4[2] = *(_QWORD *)(v1 + 16);
  v4[3] = v2;
  v4[4] = a1;
  return (*(uint64_t (**)(uint64_t (*)(uint64_t), _QWORD *, uint64_t))(v2 + 48))(sub_247BDFA5C, v4, MEMORY[0x24BEE4AE0] + 8);
}

uint64_t sub_247BDE668(char **a1, uint64_t a2)
{
  return sub_247BDA2F4(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a1);
}

uint64_t sub_247BDE68C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  char v20;
  uint64_t result;
  uint64_t v22;
  uint64_t (*v23)(char *, char *, uint64_t, uint64_t);

  v23 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v22 - v14;
  v16 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v22 - v17;
  v19 = sub_247BEC764();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

void sub_247BDE838(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;

  v8 = swift_unknownObjectRetain();
  sub_247BD7F44(v8, a2, a3, a4);
  if (!v4 && (uint64_t)(a4 >> 1) < a3)
    __break(1u);
}

void sub_247BDE88C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;

  v8 = swift_unknownObjectRetain();
  sub_247BD80EC(v8, a2, a3, a4);
  if (!v4 && a4 >> 1 != a3 && (uint64_t)(a4 >> 1) <= a3)
    __break(1u);
}

void sub_247BDE9B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;

  v8 = swift_unknownObjectRetain();
  sub_247BD8280(v8, a2, a3, a4);
  if (!v4 && a4 >> 1 != a3 && (uint64_t)(a4 >> 1) <= a3)
    __break(1u);
}

void sub_247BDEAE4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;

  v8 = swift_unknownObjectRetain();
  sub_247BD8414(v8, a2, a3, a4);
  if (!v4 && a4 >> 1 != a3 && (uint64_t)(a4 >> 1) <= a3)
    __break(1u);
}

uint64_t sub_247BDEC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t result;
  void (*v16)(char *, uint64_t);
  uint64_t v17;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = sub_247BEC89C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  v11 = sub_247BEC764();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, a1, v4);
  v12(v8, a2, v4);
  if ((v11 & 1) == 0)
  {
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    result = ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
    goto LABEL_5;
  }
  v13 = sub_247BEC764();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  result = ((uint64_t (*)(char *, uint64_t))v14)(v10, v4);
  if ((v13 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24958E0AC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for IntegerBytesCollection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IntegerBytesCollection);
}

uint64_t type metadata accessor for IntegerBytesCollection.Index(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IntegerBytesCollection.Index);
}

void sub_247BDEE4C()
{
  JUMPOUT(0x24958E0B8);
}

void sub_247BDEE5C()
{
  JUMPOUT(0x24958E0B8);
}

uint64_t sub_247BDEE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247BDEF94(a1, a2, a3, MEMORY[0x24BEE1BD0]);
}

unint64_t sub_247BDEE78()
{
  unint64_t result;

  result = qword_2576E98E0;
  if (!qword_2576E98E0)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2576E98E0);
  }
  return result;
}

uint64_t sub_247BDEEBC(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>);
  return MEMORY[0x24958E0B8](MEMORY[0x24BEE4230], a1, &v3);
}

void sub_247BDEF04()
{
  JUMPOUT(0x24958E0B8);
}

uint64_t sub_247BDEF14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247BDEF94(a1, a2, a3, MEMORY[0x24BEE1BA8]);
}

uint64_t sub_247BDEF20(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>);
  return MEMORY[0x24958E0B8](MEMORY[0x24BEE4218], a1, &v3);
}

void sub_247BDEF68()
{
  JUMPOUT(0x24958E0B8);
}

void sub_247BDEF78()
{
  JUMPOUT(0x24958E0B8);
}

uint64_t sub_247BDEF88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247BDEF94(a1, a2, a3, MEMORY[0x24BEE1BD8]);
}

uint64_t sub_247BDEF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v7[2];

  v7[0] = MEMORY[0x24958E0B8](&protocol conformance descriptor for IntegerBytesCollection<A>.Index, *(_QWORD *)(a1 + 16));
  v7[1] = sub_247BDEE78();
  return MEMORY[0x24958E0B8](a4, a1, v7);
}

void sub_247BDEFF0()
{
  JUMPOUT(0x24958E0B8);
}

void sub_247BDF000()
{
  JUMPOUT(0x24958E0B8);
}

void sub_247BDF010()
{
  JUMPOUT(0x24958E0B8);
}

uint64_t sub_247BDF020()
{
  return MEMORY[0x24BEE1780];
}

uint64_t sub_247BDF02C()
{
  return MEMORY[0x24BEE17C0];
}

uint64_t sub_247BDF038()
{
  return sub_247BDF1F0(&qword_2576E98E8, &qword_2576E98F0, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF064()
{
  return sub_247BDF1F0(&qword_2576E9930, &qword_2576E9938, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF090()
{
  return sub_247BDF1F0(&qword_2576E9978, &qword_2576E9980, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF0BC()
{
  return sub_247BDF1F0(&qword_2576E99C0, &qword_2576E99C8, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF0E8()
{
  return sub_247BDF1F0(&qword_2576E9A08, &qword_2576E9A10, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF114()
{
  return sub_247BDF1F0(&qword_2576E9A50, &qword_2576E9A58, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF140()
{
  return sub_247BDF1F0(&qword_2576E9A98, &qword_2576E9AA0, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF16C()
{
  return sub_247BDF1F0(&qword_2576E9AE0, &qword_2576E9AE8, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF198()
{
  return sub_247BDF1F0(&qword_2576E9B28, &qword_2576E9B30, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF1C4()
{
  return sub_247BDF1F0(&qword_2576E9B70, &qword_2576E9B78, (uint64_t)&protocol conformance descriptor for IntegerBytesCollection<A>);
}

uint64_t sub_247BDF1F0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24958E0B8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of static ASN1IntegerRepresentable.isSigned.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ASN1IntegerRepresentable.init(derIntegerBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of ASN1IntegerRepresentable.withBigEndianIntegerBytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t sub_247BDF268()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_247BDF270()
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

uint64_t *sub_247BDF2DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_247BDF34C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_247BDF35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_247BDF38C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_247BDF3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_247BDF3EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_247BDF41C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_247BDF4CC + 4 * byte_247BED0A0[(v7 - 1)]))();
}

void sub_247BDF51C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_247BDF6CC(char **a1)
{
  uint64_t v1;

  return sub_247BDA2F4(**(_QWORD **)(v1 + 16), *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8), *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16), *(_QWORD *)(*(_QWORD *)(v1 + 16) + 24), a1);
}

uint64_t sub_247BDF6F0(char **a1)
{
  uint64_t v1;

  return sub_247BD42C4(a1, *(unint64_t **)(v1 + 16));
}

unint64_t sub_247BDF708()
{
  unint64_t result;

  result = qword_2576E9CB8;
  if (!qword_2576E9CB8)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(result, (unint64_t *)&qword_2576E9CB8);
  }
  return result;
}

uint64_t sub_247BDF74C(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BD42A4(a1, *(int64_t **)(v1 + 16));
}

unint64_t sub_247BDF764()
{
  unint64_t result;

  result = qword_2576E9CC0;
  if (!qword_2576E9CC0)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2576E9CC0);
  }
  return result;
}

unint64_t sub_247BDF7A8()
{
  unint64_t result;

  result = qword_2576E9CC8;
  if (!qword_2576E9CC8)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_2576E9CC8);
  }
  return result;
}

unint64_t sub_247BDF7EC()
{
  unint64_t result;

  result = qword_2576E9CD0;
  if (!qword_2576E9CD0)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE4048], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_2576E9CD0);
  }
  return result;
}

uint64_t sub_247BDF830(char **a1)
{
  uint64_t v1;

  return sub_247BD4384(a1, *(unsigned int **)(v1 + 16));
}

unint64_t sub_247BDF848()
{
  unint64_t result;

  result = qword_2576E9CD8;
  if (!qword_2576E9CD8)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_2576E9CD8);
  }
  return result;
}

uint64_t sub_247BDF88C(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BD4324(a1, *(unsigned int **)(v1 + 16));
}

unint64_t sub_247BDF8A4()
{
  unint64_t result;

  result = qword_2576E9CE0;
  if (!qword_2576E9CE0)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE3FD8], MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_2576E9CE0);
  }
  return result;
}

uint64_t sub_247BDF8E8(char **a1)
{
  uint64_t v1;

  return sub_247BD4364(a1, *(unsigned __int16 **)(v1 + 16));
}

unint64_t sub_247BDF900()
{
  unint64_t result;

  result = qword_2576E9CE8;
  if (!qword_2576E9CE8)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE44C0], MEMORY[0x24BEE4478]);
    atomic_store(result, (unint64_t *)&qword_2576E9CE8);
  }
  return result;
}

uint64_t sub_247BDF944(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BD4304(a1, *(unsigned __int16 **)(v1 + 16));
}

unint64_t sub_247BDF95C()
{
  unint64_t result;

  result = qword_2576E9CF0;
  if (!qword_2576E9CF0)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE3F60], MEMORY[0x24BEE3F30]);
    atomic_store(result, (unint64_t *)&qword_2576E9CF0);
  }
  return result;
}

uint64_t sub_247BDF9A0(char **a1)
{
  uint64_t v1;

  return sub_247BD4344(a1, *(unsigned __int8 **)(v1 + 16));
}

unint64_t sub_247BDF9B8()
{
  unint64_t result;

  result = qword_2576E9CF8;
  if (!qword_2576E9CF8)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE42A0], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_2576E9CF8);
  }
  return result;
}

uint64_t sub_247BDF9FC(uint64_t *a1)
{
  uint64_t v1;

  return sub_247BD42E4(a1, *(unsigned __int8 **)(v1 + 16));
}

unint64_t sub_247BDFA14()
{
  unint64_t result;

  result = qword_2576E9D00;
  if (!qword_2576E9D00)
  {
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE3E80], MEMORY[0x24BEE3E50]);
    atomic_store(result, (unint64_t *)&qword_2576E9D00);
  }
  return result;
}

uint64_t sub_247BDFA5C(uint64_t a1)
{
  uint64_t v1;

  return sub_247BDAE48(a1, *(char ***)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24958E094](a1, v6, a5);
}

uint64_t sub_247BDFAB0(uint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = (uint64_t)sub_247BD3F98((char *)result, v11, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (uint64_t)memcpy((void *)(v3 + v7 + 32), (const void *)(v6 + 32), v2);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v8 = *(_QWORD *)(v3 + 16);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *(_QWORD *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_247BDFB90(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return sub_247BDFBB8(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t))sub_247BE1DB8, (uint64_t (*)(uint64_t))sub_247BE2374);
}

uint64_t sub_247BDFBA4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return sub_247BDFBB8(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t))sub_247BE2214, (uint64_t (*)(uint64_t))sub_247BE2450);
}

uint64_t sub_247BDFBB8(uint64_t result, unint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, unint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t (*v5)(uint64_t);
  char **v6;
  char *v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v8 = (71 - __clz(a3)) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v10 = result;
  v11 = result - a2;
  v7 = *v6;
  v12 = *((_QWORD *)*v6 + 2);
  v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v5 = a5;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v17 = *((_QWORD *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13)
      v18 = v13;
    else
      v18 = v12;
    v7 = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    v17 = *((_QWORD *)v7 + 3) >> 1;
  }
  v19 = *((_QWORD *)v7 + 2);
  v20 = v17 - v19;
  result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11)
    goto LABEL_19;
  if (result >= 1)
  {
    v21 = *((_QWORD *)v7 + 2);
    v22 = __OFADD__(v21, result);
    v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_38:
      *((_QWORD *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }
    *((_QWORD *)v7 + 2) = v23;
  }
  if (result != v20)
  {
LABEL_15:
    *v6 = v7;
    return result;
  }
LABEL_20:
  v24 = v38;
  v25 = v36;
  if (!__OFSUB__(v38, v36))
  {
    if (v38 == v36)
      goto LABEL_15;
    v20 = *((_QWORD *)v7 + 2);
    v26 = v37;
    v34 = v35;
    result = v5(v38);
    v27 = v24 - 1;
    if (v24 >= 1)
    {
      v33 = (71 - __clz(v26)) >> 3;
      if (v33 >= v24)
        goto LABEL_26;
    }
    __break(1u);
    do
    {
LABEL_25:
      while (1)
      {
        *((_QWORD *)v7 + 2) = v20;
LABEL_26:
        v28 = *((_QWORD *)v7 + 3);
        v29 = v28 >> 1;
        if ((uint64_t)(v28 >> 1) < v20 + 1)
          break;
        if (v20 < v29)
          goto LABEL_28;
      }
      v32 = result;
      v7 = sub_247BD3F98((char *)(v28 > 1), v20 + 1, 1, v7);
      result = v32;
      v29 = *((_QWORD *)v7 + 3) >> 1;
    }
    while (v20 >= v29);
LABEL_28:
    v30 = v27;
    while (1)
    {
      v7[v20 + 32] = result;
      if (__OFSUB__(v30, v25))
        break;
      if (v25 == v30)
        goto LABEL_38;
      result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))v5)(v30, v34, v25, v26);
      if (v27 > v33)
        goto LABEL_40;
      if (v30-- < 1)
        goto LABEL_40;
      if (v29 == ++v20)
      {
        v20 = v29;
        v27 = v30;
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
  }
  __break(1u);
  return result;
}

int64_t sub_247BDFE0C(int64_t a1)
{
  return sub_247BE0B3C(a1, sub_247BDC2FC);
}

uint64_t sub_247BDFE18(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_247BDFE68(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_247BE1974, (uint64_t (*)(uint64_t))sub_247BE230C);
}

uint64_t sub_247BDFE2C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_247BE0258(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_247BE1A98, (uint64_t (*)(uint64_t, uint64_t))sub_247BDC300);
}

uint64_t sub_247BDFE40(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_247BE06E0(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_247BE1C28, (uint64_t (*)(uint64_t, uint64_t))sub_247BDC3A0);
}

uint64_t sub_247BDFE54(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_247BDFE68(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_247BE1F00, (uint64_t (*)(uint64_t))sub_247BE23FC);
}

uint64_t sub_247BDFE68(uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t (*v5)(uint64_t);
  char **v6;
  char *v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 v37;
  uint64_t v38;

  v8 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v10 = result;
  v11 = result - a2;
  v7 = *v6;
  v12 = *((_QWORD *)*v6 + 2);
  v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v5 = a5;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v17 = *((_QWORD *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13)
      v18 = v13;
    else
      v18 = v12;
    v7 = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    v17 = *((_QWORD *)v7 + 3) >> 1;
  }
  v19 = *((_QWORD *)v7 + 2);
  v20 = v17 - v19;
  result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11)
    goto LABEL_19;
  if (result >= 1)
  {
    v21 = *((_QWORD *)v7 + 2);
    v22 = __OFADD__(v21, result);
    v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_38:
      *((_QWORD *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }
    *((_QWORD *)v7 + 2) = v23;
  }
  if (result != v20)
  {
LABEL_15:
    *v6 = v7;
    return result;
  }
LABEL_20:
  v24 = v38;
  v25 = v36;
  if (!__OFSUB__(v38, v36))
  {
    if (v38 == v36)
      goto LABEL_15;
    v20 = *((_QWORD *)v7 + 2);
    v26 = v37;
    v34 = v35;
    result = v5(v38);
    v27 = v24 - 1;
    if (v24 >= 1)
    {
      v33 = ((unint64_t)(32 - __clz(v26)) + 7) >> 3;
      if (v33 >= v24)
        goto LABEL_26;
    }
    __break(1u);
    do
    {
LABEL_25:
      while (1)
      {
        *((_QWORD *)v7 + 2) = v20;
LABEL_26:
        v28 = *((_QWORD *)v7 + 3);
        v29 = v28 >> 1;
        if ((uint64_t)(v28 >> 1) < v20 + 1)
          break;
        if (v20 < v29)
          goto LABEL_28;
      }
      v32 = result;
      v7 = sub_247BD3F98((char *)(v28 > 1), v20 + 1, 1, v7);
      result = v32;
      v29 = *((_QWORD *)v7 + 3) >> 1;
    }
    while (v20 >= v29);
LABEL_28:
    v30 = v27;
    while (1)
    {
      v7[v20 + 32] = result;
      if (__OFSUB__(v30, v25))
        break;
      if (v25 == v30)
        goto LABEL_38;
      result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v5)(v30, v34, v25, v26);
      if (v27 > v33)
        goto LABEL_40;
      if (v30-- < 1)
        goto LABEL_40;
      if (v29 == ++v20)
      {
        v20 = v29;
        v27 = v30;
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247BE00D0(unsigned int a1)
{
  char **v1;
  unint64_t v3;
  char *v4;
  unint64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  char v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;

  v3 = ((unint64_t)(32 - __clz(a1)) + 7) >> 3;
  v4 = *v1;
  v5 = *((_QWORD *)*v1 + 2) + v3;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v7 = *((_QWORD *)v4 + 3) >> 1, v7 < v5))
  {
    v4 = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v5, 1, v4);
    v7 = *((_QWORD *)v4 + 3) >> 1;
  }
  v8 = *((_QWORD *)v4 + 2);
  result = v3;
  v10 = v7 - v8;
  if (v7 != v8)
  {
    if ((v10 & 0x8000000000000000) != 0)
    {
      __break(1u);
      return result;
    }
    if (!(_BYTE)a1)
      goto LABEL_17;
    result = 0;
    v4[v8 + 32] = a1;
    if (v10 != 1)
      goto LABEL_11;
  }
  if (v10 < v3)
  {
    __break(1u);
LABEL_19:
    result = sub_247BDC444(result, a1);
    v13 = result;
    v14 = v8 + 1;
    while (1)
    {
      v15 = *((_QWORD *)v4 + 3);
      if ((uint64_t)(v15 >> 1) < v14)
      {
        v16 = v8;
        v17 = v14;
        result = (uint64_t)sub_247BD3F98((char *)(v15 > 1), v14, 1, v4);
        v14 = v17;
        v8 = v16;
        v4 = (char *)result;
        if (v16 < *(_QWORD *)(result + 24) >> 1)
        {
LABEL_24:
          v4[v8 + 32] = v13;
          *((_QWORD *)v4 + 2) = v14;
          goto LABEL_17;
        }
      }
      else if (v8 < (uint64_t)(v15 >> 1))
      {
        goto LABEL_24;
      }
      *((_QWORD *)v4 + 2) = v8;
    }
  }
  if (v7 == v8)
  {
    v11 = 0;
  }
  else
  {
LABEL_11:
    *((_QWORD *)v4 + 2) = ++v8;
    v11 = 1;
  }
  if (v11 == v10 && result != 0)
    goto LABEL_19;
LABEL_17:
  *v1 = v4;
  return result;
}

uint64_t sub_247BE0244(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_247BE0258(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_247BE2000, (uint64_t (*)(uint64_t, uint64_t))sub_247BDC48C);
}

uint64_t sub_247BE0258(uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char **v6;
  char *v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int16 v37;
  uint64_t v38;

  v8 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v10 = result;
  v11 = result - a2;
  v7 = *v6;
  v12 = *((_QWORD *)*v6 + 2);
  v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v5 = a5;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v17 = *((_QWORD *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13)
      v18 = v13;
    else
      v18 = v12;
    v7 = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    v17 = *((_QWORD *)v7 + 3) >> 1;
  }
  v19 = *((_QWORD *)v7 + 2);
  v20 = v17 - v19;
  result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11)
    goto LABEL_19;
  if (result >= 1)
  {
    v21 = *((_QWORD *)v7 + 2);
    v22 = __OFADD__(v21, result);
    v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_42:
      *((_QWORD *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }
    *((_QWORD *)v7 + 2) = v23;
  }
  if (result != v20)
  {
LABEL_15:
    *v6 = v7;
    return result;
  }
LABEL_20:
  v24 = v38;
  v25 = v36;
  if (__OFSUB__(v38, v36))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v38 == v36)
    goto LABEL_15;
  if (v36 < v38)
  {
    v34 = v35;
    if (v35 >= v38)
    {
      v20 = *((_QWORD *)v7 + 2);
      v26 = v37;
      result = v5(v38, v37);
      v27 = v24 - 1;
      if (v24 >= 1)
      {
        v33 = ((unint64_t)(unsigned __int16)(32 - __clz(v26)) + 7) >> 3;
        if (v33 >= v24)
          goto LABEL_28;
      }
      __break(1u);
      do
      {
LABEL_27:
        while (1)
        {
          *((_QWORD *)v7 + 2) = v20;
LABEL_28:
          v28 = *((_QWORD *)v7 + 3);
          v29 = v28 >> 1;
          if ((uint64_t)(v28 >> 1) < v20 + 1)
            break;
          if (v20 < v29)
            goto LABEL_30;
        }
        v32 = result;
        v7 = sub_247BD3F98((char *)(v28 > 1), v20 + 1, 1, v7);
        result = v32;
        v29 = *((_QWORD *)v7 + 3) >> 1;
      }
      while (v20 >= v29);
LABEL_30:
      v30 = v27;
      while (1)
      {
        v7[v20 + 32] = result;
        if (__OFSUB__(v30, v25))
          break;
        if (v25 == v30)
          goto LABEL_42;
        if (v27 > v34 || v25 >= v30)
          goto LABEL_44;
        result = v5(v30, v26);
        if (v27 > v33)
          goto LABEL_45;
        if (v30-- < 1)
          goto LABEL_45;
        if (v29 == ++v20)
        {
          v20 = v29;
          v27 = v30;
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_247BE04E0(uint64_t result)
{
  char **v1;
  int64_t v2;
  int64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  unsigned __int16 v7;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  unsigned __int16 v24;
  uint64_t v25;

  v3 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)result)) + 7) >> 3;
  v4 = *v1;
  v5 = *((_QWORD *)*v1 + 2);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = result;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = *((_QWORD *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    v9 = *((_QWORD *)v4 + 3) >> 1;
  }
  v11 = *((_QWORD *)v4 + 2);
  v12 = v9 - v11;
  result = sub_247BE17C8((unint64_t)&v24, (uint64_t)&v4[v11 + 32], v9 - v11, v7);
  if (result < v3)
    goto LABEL_15;
  if (result >= 1)
  {
    v13 = *((_QWORD *)v4 + 2);
    v14 = __OFADD__(v13, result);
    v15 = v13 + result;
    if (v14)
    {
      __break(1u);
      goto LABEL_32;
    }
    *((_QWORD *)v4 + 2) = v15;
  }
  if (result == v12)
  {
LABEL_16:
    v16 = v25;
    if (!v25)
      goto LABEL_13;
    v3 = *((_QWORD *)v4 + 2);
    v17 = v24;
    result = sub_247BDC48C(v25, v24);
    v18 = v16 - 1;
    if (v16 >= 1)
    {
      v2 = ((unint64_t)(unsigned __int16)(32 - __clz(v17)) + 7) >> 3;
      if (v2 >= v16)
        goto LABEL_21;
    }
    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((_QWORD *)v4 + 2) = v3;
LABEL_21:
        v19 = *((_QWORD *)v4 + 3);
        v20 = v19 >> 1;
        if ((uint64_t)(v19 >> 1) < v3 + 1)
          break;
        if (v3 < v20)
          goto LABEL_23;
      }
      v23 = result;
      v4 = sub_247BD3F98((char *)(v19 > 1), v3 + 1, 1, v4);
      result = v23;
      v20 = *((_QWORD *)v4 + 3) >> 1;
    }
    while (v3 >= v20);
LABEL_23:
    v21 = v18;
    while (1)
    {
      v4[v3++ + 32] = result;
      if (!v21)
        break;
      result = sub_247BDC48C(v21, v17);
      if (v18 > v2 || (v22 = v21 < 1, --v21, v22))
      {
        __break(1u);
        return result;
      }
      if (v20 == v3)
      {
        v3 = v20;
        v18 = v21;
        goto LABEL_20;
      }
    }
LABEL_32:
    *((_QWORD *)v4 + 2) = v3;
  }
LABEL_13:
  *v1 = v4;
  return result;
}

uint64_t sub_247BE06CC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_247BE06E0(a1, a2, a3, (uint64_t (*)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t))sub_247BE2110, (uint64_t (*)(uint64_t, uint64_t))sub_247BDC4E0);
}

uint64_t sub_247BE06E0(uint64_t result, unint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, char *, int64_t, uint64_t, unint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char **v6;
  char *v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;

  v8 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v8 < result)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 < a2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v10 = result;
  v11 = result - a2;
  v7 = *v6;
  v12 = *((_QWORD *)*v6 + 2);
  v13 = v12 + result - a2;
  if (__OFADD__(v12, result - a2))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v5 = a5;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v17 = *((_QWORD *)v7 + 3) >> 1, v17 < v13))
  {
    if (v12 <= v13)
      v18 = v13;
    else
      v18 = v12;
    v7 = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v18, 1, v7);
    v17 = *((_QWORD *)v7 + 3) >> 1;
  }
  v19 = *((_QWORD *)v7 + 2);
  v20 = v17 - v19;
  result = a4(&v35, &v7[v19 + 32], v17 - v19, v10, a2, a3);
  if (result < v11)
    goto LABEL_19;
  if (result >= 1)
  {
    v21 = *((_QWORD *)v7 + 2);
    v22 = __OFADD__(v21, result);
    v23 = v21 + result;
    if (v22)
    {
      __break(1u);
LABEL_42:
      *((_QWORD *)v7 + 2) = v20 + 1;
      goto LABEL_15;
    }
    *((_QWORD *)v7 + 2) = v23;
  }
  if (result != v20)
  {
LABEL_15:
    *v6 = v7;
    return result;
  }
LABEL_20:
  v24 = v38;
  v25 = v36;
  if (__OFSUB__(v38, v36))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v38 == v36)
    goto LABEL_15;
  if (v36 < v38)
  {
    v34 = v35;
    if (v35 >= v38)
    {
      v20 = *((_QWORD *)v7 + 2);
      v26 = v37;
      result = v5(v38, v37);
      v27 = v24 - 1;
      if (v24 >= 1)
      {
        v33 = ((unint64_t)(32 - __clz(v26)) + 7) >> 3;
        if (v33 >= v24)
          goto LABEL_28;
      }
      __break(1u);
      do
      {
LABEL_27:
        while (1)
        {
          *((_QWORD *)v7 + 2) = v20;
LABEL_28:
          v28 = *((_QWORD *)v7 + 3);
          v29 = v28 >> 1;
          if ((uint64_t)(v28 >> 1) < v20 + 1)
            break;
          if (v20 < v29)
            goto LABEL_30;
        }
        v32 = result;
        v7 = sub_247BD3F98((char *)(v28 > 1), v20 + 1, 1, v7);
        result = v32;
        v29 = *((_QWORD *)v7 + 3) >> 1;
      }
      while (v20 >= v29);
LABEL_30:
      v30 = v27;
      while (1)
      {
        v7[v20 + 32] = result;
        if (__OFSUB__(v30, v25))
          break;
        if (v25 == v30)
          goto LABEL_42;
        if (v27 > v34 || v25 >= v30)
          goto LABEL_44;
        result = v5(v30, v26);
        if (v27 > v33)
          goto LABEL_45;
        if (v30-- < 1)
          goto LABEL_45;
        if (v29 == ++v20)
        {
          v20 = v29;
          v27 = v30;
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_247BE095C(uint64_t result)
{
  char **v1;
  int64_t v2;
  int64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  unsigned int v7;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;

  v3 = ((unint64_t)(32 - __clz(result)) + 7) >> 3;
  v4 = *v1;
  v5 = *((_QWORD *)*v1 + 2);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = result;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = *((_QWORD *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    v9 = *((_QWORD *)v4 + 3) >> 1;
  }
  v11 = *((_QWORD *)v4 + 2);
  v12 = v9 - v11;
  result = sub_247BE185C((unint64_t)&v24, (uint64_t)&v4[v11 + 32], v9 - v11, v7);
  if (result < v3)
    goto LABEL_15;
  if (result >= 1)
  {
    v13 = *((_QWORD *)v4 + 2);
    v14 = __OFADD__(v13, result);
    v15 = v13 + result;
    if (v14)
    {
      __break(1u);
      goto LABEL_32;
    }
    *((_QWORD *)v4 + 2) = v15;
  }
  if (result == v12)
  {
LABEL_16:
    v16 = v25;
    if (!v25)
      goto LABEL_13;
    v3 = *((_QWORD *)v4 + 2);
    v17 = v24;
    result = sub_247BDC4E0(v25, v24);
    v18 = v16 - 1;
    if (v16 >= 1)
    {
      v2 = ((unint64_t)(32 - __clz(v17)) + 7) >> 3;
      if (v2 >= v16)
        goto LABEL_21;
    }
    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((_QWORD *)v4 + 2) = v3;
LABEL_21:
        v19 = *((_QWORD *)v4 + 3);
        v20 = v19 >> 1;
        if ((uint64_t)(v19 >> 1) < v3 + 1)
          break;
        if (v3 < v20)
          goto LABEL_23;
      }
      v23 = result;
      v4 = sub_247BD3F98((char *)(v19 > 1), v3 + 1, 1, v4);
      result = v23;
      v20 = *((_QWORD *)v4 + 3) >> 1;
    }
    while (v3 >= v20);
LABEL_23:
    v21 = v18;
    while (1)
    {
      v4[v3++ + 32] = result;
      if (!v21)
        break;
      result = sub_247BDC4E0(v21, v17);
      if (v18 > v2 || (v22 = v21 < 1, --v21, v22))
      {
        __break(1u);
        return result;
      }
      if (v20 == v3)
      {
        v3 = v20;
        v18 = v21;
        goto LABEL_20;
      }
    }
LABEL_32:
    *((_QWORD *)v4 + 2) = v3;
  }
LABEL_13:
  *v1 = v4;
  return result;
}

int64_t sub_247BE0B3C(int64_t result, uint64_t (*a2)(uint64_t, unint64_t))
{
  uint64_t (*v2)(uint64_t, unint64_t);
  char **v3;
  int64_t v4;
  int64_t v5;
  char *v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  BOOL v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;

  v5 = (71 - __clz(result)) >> 3;
  v6 = *v3;
  v7 = *((_QWORD *)*v3 + 2);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v2 = a2;
  v9 = result;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v11 = *((_QWORD *)v6 + 3) >> 1, v11 < v8))
  {
    if (v7 <= v8)
      v12 = v7 + v5;
    else
      v12 = v7;
    v6 = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v12, 1, v6);
    v11 = *((_QWORD *)v6 + 3) >> 1;
  }
  v13 = *((_QWORD *)v6 + 2);
  v14 = v11 - v13;
  result = (int64_t)sub_247BE18EC(&v26, (uint64_t)&v6[v13 + 32], v11 - v13, v9);
  if (result < v5)
    goto LABEL_15;
  if (result >= 1)
  {
    v15 = *((_QWORD *)v6 + 2);
    v16 = __OFADD__(v15, result);
    v17 = v15 + result;
    if (v16)
    {
      __break(1u);
      goto LABEL_32;
    }
    *((_QWORD *)v6 + 2) = v17;
  }
  if (result == v14)
  {
LABEL_16:
    v18 = v27;
    if (!v27)
      goto LABEL_13;
    v5 = *((_QWORD *)v6 + 2);
    v19 = v26;
    result = v2(v27, v26);
    v20 = v18 - 1;
    if (v18 >= 1)
    {
      v4 = (71 - __clz(v19)) >> 3;
      if (v4 >= v18)
        goto LABEL_21;
    }
    __break(1u);
    do
    {
LABEL_20:
      while (1)
      {
        *((_QWORD *)v6 + 2) = v5;
LABEL_21:
        v21 = *((_QWORD *)v6 + 3);
        v22 = v21 >> 1;
        if ((uint64_t)(v21 >> 1) < v5 + 1)
          break;
        if (v5 < v22)
          goto LABEL_23;
      }
      v25 = result;
      v6 = sub_247BD3F98((char *)(v21 > 1), v5 + 1, 1, v6);
      result = v25;
      v22 = *((_QWORD *)v6 + 3) >> 1;
    }
    while (v5 >= v22);
LABEL_23:
    v23 = v20;
    while (1)
    {
      v6[v5++ + 32] = result;
      if (!v23)
        break;
      result = v2(v23, v19);
      if (v20 > v4 || (v24 = v23 < 1, --v23, v24))
      {
        __break(1u);
        return result;
      }
      if (v22 == v5)
      {
        v5 = v22;
        v20 = v23;
        goto LABEL_20;
      }
    }
LABEL_32:
    *((_QWORD *)v6 + 2) = v5;
  }
LABEL_13:
  *v3 = v6;
  return result;
}

unint64_t sub_247BE0D30(unint64_t result, unint64_t a2, unsigned __int8 a3)
{
  unint64_t v3;

  v3 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }
  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_247BE0D6C(unint64_t result, unint64_t a2, unsigned __int16 a3)
{
  unint64_t v3;

  v3 = ((unint64_t)(unsigned __int16)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }
  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_247BE0DA8(unint64_t result, unint64_t a2, unsigned int a3)
{
  unint64_t v3;

  v3 = ((unint64_t)(32 - __clz(a3)) + 7) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }
  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_247BE0DDC(unint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v3;

  v3 = (71 - __clz(a3)) >> 3;
  if (v3 < result)
  {
    __break(1u);
  }
  else if (v3 >= a2)
  {
    result -= a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t ASN1Any.init<A>(erasing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;

  v13 = sub_247BD3F98(0, 1024, 0, MEMORY[0x24BEE4AF8]);
  (*(void (**)(char **, uint64_t, uint64_t))(a3 + 8))(&v13, a2, a3);
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v10 = v13;
    v11 = v13 + 32;
    v12 = (2 * *((_QWORD *)v13 + 2)) | 1;
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
    *a4 = v10;
    a4[1] = v11;
    a4[2] = 0;
    a4[3] = (char *)v12;
  }
  return result;
}

uint64_t ASN1Any.init<A>(erasing:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char **a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  char v11;
  uint64_t result;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char *v18;

  v10 = *a2;
  v11 = *((_BYTE *)a2 + 8);
  v18 = sub_247BD3F98(0, 1024, 0, MEMORY[0x24BEE4AF8]);
  v16 = v10;
  v17 = v11;
  (*(void (**)(char **, uint64_t *, uint64_t, uint64_t))(a4 + 40))(&v18, &v16, a3, a4);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v13 = v18;
    v14 = v18 + 32;
    v15 = (2 * *((_QWORD *)v18 + 2)) | 1;
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
    *a5 = v13;
    a5[1] = v14;
    a5[2] = 0;
    a5[3] = (char *)v15;
  }
  return result;
}

uint64_t ASN1Any.init(derEncoded:)@<X0>(_OWORD *a1@<X0>, char **a2@<X8>)
{
  _OWORD *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t result;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char *v12;
  __int128 v13;
  __int128 v14[5];
  __int128 v15[3];
  __int128 v16;
  char v17;

  v2 = a1;
  v4 = a1[3];
  v14[1] = a1[2];
  v14[2] = v4;
  v5 = a1[5];
  v14[3] = a1[4];
  v14[4] = v5;
  v6 = a1[1];
  v13 = *a1;
  v14[0] = v6;
  v12 = sub_247BD3F98(0, 1024, 0, MEMORY[0x24BEE4AF8]);
  v10 = *(_QWORD *)v2;
  v11 = *((_BYTE *)v2 + 8);
  sub_247BD6C00(v14, v15);
  sub_247BD6C00(v15, &v16);
  LOBYTE(v2) = v17;
  sub_247BD6C18((uint64_t)&v13);
  sub_247BD5108(&v10, (v2 & 1) == 0, (uint64_t)&v12, (uint64_t)&v13);
  sub_247BD6C58((uint64_t)&v13);
  result = sub_247BD6C58((uint64_t)&v13);
  v8 = v12 + 32;
  v9 = (2 * *((_QWORD *)v12 + 2)) | 1;
  *a2 = v12;
  a2[1] = v8;
  a2[2] = 0;
  a2[3] = (char *)v9;
  return result;
}

uint64_t ASN1Any.serialize(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[1];
  v3 = v0[2];
  v2 = v0[3];
  v4 = swift_unknownObjectRetain();
  sub_247BE2594(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

uint64_t ASN1Any.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0[2];
  v2 = v0[3] >> 1;
  result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = v0[1];
  result = sub_247BECA58();
  v5 = __OFSUB__(v2, v1);
  v6 = v2 - v1;
  if (!v6)
    return result;
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v7 = v4 + v1;
  do
  {
    ++v7;
    result = sub_247BECA64();
    --v6;
  }
  while (v6);
  return result;
}

uint64_t static ASN1Any.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_247BD43A4(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t ASN1Any.hashValue.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  v4 = v3 >> 1;
  result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    result = sub_247BECA58();
    v6 = __OFSUB__(v4, v2);
    v7 = v4 - v2;
    if (!v7)
      return sub_247BECA7C();
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      v8 = v1 + v2;
      do
      {
        ++v8;
        sub_247BECA64();
        --v7;
      }
      while (v7);
      return sub_247BECA7C();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247BE1244@<X0>(_OWORD *a1@<X0>, char **a2@<X8>)
{
  return ASN1Any.init(derEncoded:)(a1, a2);
}

uint64_t sub_247BE1268()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[1];
  v3 = v0[2];
  v2 = v0[3];
  v4 = swift_unknownObjectRetain();
  sub_247BE2594(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

uint64_t sub_247BE12D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  v4 = v3 >> 1;
  result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    result = sub_247BECA58();
    v6 = __OFSUB__(v4, v2);
    v7 = v4 - v2;
    if (!v7)
      return sub_247BECA7C();
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      v8 = v1 + v2;
      do
      {
        ++v8;
        sub_247BECA64();
        --v7;
      }
      while (v7);
      return sub_247BECA7C();
    }
  }
  __break(1u);
  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  return sub_247BD43A4(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t ASN1Any.description.getter()
{
  swift_unknownObjectRetain();
  sub_247BEC944();
  sub_247BEC794();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  return 0x28796E41314E5341;
}

uint64_t sub_247BE1404()
{
  swift_unknownObjectRetain();
  sub_247BEC944();
  sub_247BEC794();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  return 0x28796E41314E5341;
}

uint64_t DERParseable.init(asn1Any:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return DERParseable.init(derEncoded:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2, a3);
}

uint64_t DERImplicitlyTaggable.init(asn1Any:withIdentifier:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v12;
  char v13;

  v6 = *a1;
  v7 = a1[1];
  v8 = a1[2];
  v9 = a1[3];
  v10 = *(_BYTE *)(a2 + 8);
  v12 = *(_QWORD *)a2;
  v13 = v10;
  return DERImplicitlyTaggable.init(derEncoded:withIdentifier:)(v6, v7, v8, v9, &v12, a3, a4);
}

uint64_t sub_247BE150C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  char v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  _QWORD *v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;

  v5 = *v3;
  v6 = v3[1];
  v7 = v3[2];
  v29 = *(_OWORD *)(v3 + 3);
  if (!a2)
    goto LABEL_5;
  v8 = a3;
  if (!a3)
  {
LABEL_44:
    *(_QWORD *)result = v5;
    *(_QWORD *)(result + 8) = v6;
    *(_QWORD *)(result + 16) = v7;
    *(_OWORD *)(result + 24) = v29;
    return v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v9 = (unint64_t)v29 >> 1;
    if (v7 == (unint64_t)v29 >> 1)
    {
LABEL_5:
      v8 = 0;
      goto LABEL_44;
    }
    v28 = v5;
    v26 = result;
    if (v7 >= (uint64_t)((unint64_t)v29 >> 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      v6 = v31;
LABEL_43:
      swift_unknownObjectRetain();
      v7 = v4;
      result = v26;
      v5 = v28;
      goto LABEL_44;
    }
    v10 = a2;
    v27 = v6 + 112;
    v11 = 1;
    v31 = v6;
    while (v9 > v7)
    {
      v12 = (uint64_t *)(v6 + 96 * v7);
      v13 = *v12;
      v14 = *((_BYTE *)v12 + 8);
      v15 = *((_BYTE *)v12 + 24);
      v16 = v7 + 1;
      v33 = *((_OWORD *)v12 + 3);
      v34 = *((_OWORD *)v12 + 2);
      if (v15)
      {
        v17 = v12[2];
        v18 = (unint64_t)v29 >> 1;
        if (v16 != v9)
        {
          v19 = (_QWORD *)(v27 + 96 * v7);
          v18 = v7 + 1;
          do
          {
            if (v18 >= v9)
            {
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
              goto LABEL_48;
            }
            if (v17 >= *v19)
              goto LABEL_17;
            v20 = v18 + 1;
            if (__OFADD__(v18, 1))
              goto LABEL_47;
            ++v18;
            v19 += 12;
          }
          while (v20 != v9);
          v18 = (unint64_t)v29 >> 1;
LABEL_17:
          if (v18 <= v7)
            goto LABEL_49;
          if (v18 < 0)
            goto LABEL_50;
        }
        v21 = v18 - v16;
        if (__OFSUB__(v18, v16))
          goto LABEL_51;
        if (v21 < 0)
          goto LABEL_52;
        v22 = v9 - v16;
        if (__OFSUB__(v9, v16))
          goto LABEL_53;
        if (!v21 || v22 < 0 || (v4 = (unint64_t)v29 >> 1, v22 >= v21))
        {
          v4 = v18;
          if (__OFADD__(v16, v21))
            goto LABEL_56;
          if (v9 < v18)
            goto LABEL_54;
        }
        if (v4 <= v7)
          goto LABEL_55;
        if (v16 != v18)
        {
          if (v16 >= v18)
            goto LABEL_57;
          v23 = (uint64_t *)(v27 + 96 * v7);
          do
          {
            v24 = *v23;
            v23 += 12;
            if (v17 >= v24)
            {
              __break(1u);
              goto LABEL_46;
            }
            --v21;
          }
          while (v21);
          if (*(_QWORD *)(v6 + 96 * v16 + 16) != v17 + 1)
            goto LABEL_58;
        }
        v32 = v29 & 1 | (2 * v18);
        v25 = swift_unknownObjectRetain();
      }
      else
      {
        result = v12[8];
        if (!result)
          goto LABEL_60;
        v4 = v7 + 1;
        v6 = v12[9];
        v16 = v12[10];
        v32 = v12[11];
        v25 = swift_unknownObjectRetain();
        v17 = 0;
      }
      *(_QWORD *)v10 = v13;
      *(_BYTE *)(v10 + 8) = v14;
      *(_QWORD *)(v10 + 16) = v25;
      *(_QWORD *)(v10 + 24) = v6;
      *(_QWORD *)(v10 + 32) = v16;
      *(_QWORD *)(v10 + 40) = v32;
      *(_QWORD *)(v10 + 48) = v17;
      *(_BYTE *)(v10 + 56) = v15 ^ 1;
      *(_OWORD *)(v10 + 64) = v34;
      *(_OWORD *)(v10 + 80) = v33;
      v8 = a3;
      if (v11 == a3)
        goto LABEL_41;
      v6 = v31;
      if (v4 == v9)
      {
        v4 = (unint64_t)v29 >> 1;
        v8 = v11;
        goto LABEL_43;
      }
      ++v11;
      v10 += 96;
      result = swift_unknownObjectRetain();
      v7 = v4;
      if (v4 >= v9)
        goto LABEL_40;
    }
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
  }
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

unint64_t sub_247BE17C8(unint64_t result, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = ((unint64_t)(unsigned __int16)(32 - __clz(a4)) + 7) >> 3;
  if (!a2)
  {
    v6 = v4;
    v4 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    v6 = v4;
LABEL_11:
    v4 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4)
    {
      v5 = 0;
      v6 = v4 - 1;
      do
      {
        *(_BYTE *)(a2 + v5) = a4 >> (8 * (v6 & 1));
        if (a3 - 1 == v5)
          goto LABEL_11;
        ++v5;
      }
      while (--v6 != -1);
    }
    v6 = 0;
LABEL_12:
    *(_WORD *)result = a4;
    *(_QWORD *)(result + 8) = v6;
    return v4;
  }
  __break(1u);
  return result;
}

unint64_t sub_247BE185C(unint64_t result, uint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v4 = 32 - __clz(a4) + 7;
  v5 = v4 >> 3;
  if (!a2)
  {
    v7 = v4 >> 3;
    v5 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    v7 = v4 >> 3;
LABEL_11:
    v5 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4)
    {
      v6 = 0;
      v7 = v5 - 1;
      v8 = (v4 & 0xF8) - 8;
      do
      {
        *(_BYTE *)(a2 + v6) = a4 >> (v8 & 0x18);
        if (a3 - 1 == v6)
          goto LABEL_11;
        ++v6;
        --v7;
        v8 -= 8;
      }
      while (v7 != -1);
    }
    v7 = 0;
LABEL_12:
    *(_DWORD *)result = a4;
    *(_QWORD *)(result + 8) = v7;
    return v5;
  }
  __break(1u);
  return result;
}

unint64_t *sub_247BE18EC(unint64_t *result, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v4 = (71 - __clz(a4)) >> 3;
  if (!a2)
  {
    v6 = v4;
    v4 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    v6 = v4;
LABEL_11:
    v4 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4)
    {
      v5 = 0;
      v6 = v4 - 1;
      v7 = 8 * v4 - 8;
      do
      {
        *(_BYTE *)(a2 + v5) = a4 >> (v7 & 0x38);
        if (a3 - 1 == v5)
          goto LABEL_11;
        ++v5;
        --v6;
        v7 -= 8;
      }
      while (v6 != -1);
    }
    v6 = 0;
LABEL_12:
    *result = a4;
    result[1] = v6;
    return (unint64_t *)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_247BE1974(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  BOOL v13;
  unsigned __int8 v14;
  BOOL v15;
  int64_t v16;

  if (!a2)
  {
    a3 = 0;
LABEL_24:
    v16 = a4;
LABEL_26:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_BYTE *)(result + 16) = a6;
    *(_QWORD *)(result + 24) = v16;
    return a3;
  }
  if (!a3)
    goto LABEL_24;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4)
      v8 = a4;
    else
      v8 = a5;
    v9 = 8 * a4;
    v10 = (a4 << 59) - 0x800000000000000;
    v11 = a4;
    while (!__OFSUB__(v11, a5))
    {
      if (v11 == a5)
      {
        v16 = a5;
        a3 = a4 - a5;
        goto LABEL_26;
      }
      v12 = v11;
      if (v8 == v11)
        goto LABEL_28;
      if ((unint64_t)(v11 - 0x1000000000000001) >> 61 != 7)
        goto LABEL_29;
      v9 -= 8;
      if (v9 < -128)
        goto LABEL_30;
      if (v9 > 127)
        goto LABEL_31;
      if (v7 < a4)
        goto LABEL_32;
      v13 = __OFSUB__(v11--, 1);
      if (v12 - 1 < 0 != v13)
        goto LABEL_32;
      if (v10)
        v14 = 0;
      else
        v14 = a6;
      v15 = v10 > 0x800000000000000;
      v10 -= 0x800000000000000;
      if (v15)
        v14 = 0;
      *(_BYTE *)(a2 + v6++) = v14;
      if (a3 == v6)
      {
        v16 = v12 - 1;
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247BE1A98(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, int a6)
{
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  int v14;
  BOOL v15;
  int64_t v16;

  if (!a2)
  {
LABEL_26:
    a3 = 0;
LABEL_27:
    v16 = a4;
LABEL_29:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_WORD *)(result + 16) = a6;
    *(_QWORD *)(result + 24) = v16;
    return a3;
  }
  if (!a3)
    goto LABEL_27;
  if (a3 < 0)
    goto LABEL_35;
  v6 = 0;
  v7 = ((unint64_t)(unsigned __int16)(32 - __clz((unsigned __int16)a6)) + 7) >> 3;
  if (a5 >= a4)
    v8 = a4;
  else
    v8 = a5;
  v9 = 8 * a4 - 8;
  v10 = (a4 << 51) - 0x18000000000001;
  v11 = (a4 << 51) - 0x8000000000000;
  v12 = a4;
  while (!__OFSUB__(v12, a5))
  {
    if (v12 == a5)
    {
      v16 = a5;
      a3 = a4 - a5;
      goto LABEL_29;
    }
    v13 = v12;
    if (v8 == v12)
      goto LABEL_31;
    if ((unint64_t)(v12 - 0x1000000000000001) >> 61 != 7)
      goto LABEL_32;
    if (v9 < -32768)
      goto LABEL_33;
    if (v9 >= 0x8000)
      goto LABEL_34;
    if (v10 <= 0xFFDFFFFFFFFFFFFELL)
    {
LABEL_15:
      LOBYTE(v14) = 0;
      if (v7 < a4)
        goto LABEL_25;
      goto LABEL_20;
    }
    if ((v11 & 0x8000000000000000) != 0)
    {
      if (v11 <= 0xFFF0000000000000)
        goto LABEL_15;
      v14 = a6 << (-BYTE6(v11) & 8);
      if (v7 < a4)
      {
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
    }
    else
    {
      if (v11 >> 52)
        goto LABEL_15;
      v14 = (unsigned __int16)a6 >> (v9 & 8);
      if (v7 < a4)
        goto LABEL_25;
    }
LABEL_20:
    v15 = __OFSUB__(v12--, 1);
    if (v13 - 1 < 0 != v15)
      goto LABEL_25;
    *(_BYTE *)(a2 + v6) = v14;
    v9 -= 8;
    v10 -= 0x8000000000000;
    v11 -= 0x8000000000000;
    if (a3 == ++v6)
    {
      v16 = v13 - 1;
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_247BE1C28(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned int a6)
{
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  unsigned int v13;
  BOOL v14;
  int64_t v15;

  if (!a2)
  {
    a3 = 0;
LABEL_30:
    v15 = a4;
LABEL_32:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_DWORD *)(result + 16) = a6;
    *(_QWORD *)(result + 24) = v15;
    return a3;
  }
  if (!a3)
    goto LABEL_30;
  if (a3 < 0)
    goto LABEL_39;
  v6 = 0;
  v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
  if (a5 >= a4)
    v8 = a4;
  else
    v8 = a5;
  v9 = 8 * a4 - 8;
  v10 = a4;
  v11 = (a4 << 35) - 0x800000000;
  while (!__OFSUB__(v10, a5))
  {
    if (v10 == a5)
    {
      v15 = a5;
      a3 = a4 - a5;
      goto LABEL_32;
    }
    v12 = v10;
    if (v8 == v10)
      goto LABEL_34;
    if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7)
      goto LABEL_35;
    if (v9 < (uint64_t)0xFFFFFFFF80000000)
      goto LABEL_36;
    if (v9 > 0x7FFFFFFF)
      goto LABEL_37;
    if (v11 < (uint64_t)0xFFFFFFE000000000)
    {
LABEL_15:
      LOBYTE(v13) = 0;
      if (v7 < a4)
        goto LABEL_38;
      goto LABEL_24;
    }
    if (v11 > 0x2000000000)
    {
LABEL_18:
      LOBYTE(v13) = 0;
      if (v7 < a4)
        goto LABEL_38;
      goto LABEL_24;
    }
    if (v11 < 0)
    {
      if ((unint64_t)v11 <= 0xFFFFFFE000000000)
        goto LABEL_15;
      v13 = a6 << (-BYTE4(v11) & 0x18);
    }
    else
    {
      if ((unint64_t)v11 >> 37)
        goto LABEL_18;
      v13 = a6 >> (v9 & 0x18);
    }
    if (v7 < a4)
      goto LABEL_38;
LABEL_24:
    v14 = __OFSUB__(v10--, 1);
    if (v12 - 1 < 0 != v14)
      goto LABEL_38;
    *(_BYTE *)(a2 + v6) = v13;
    v9 -= 8;
    v11 -= 0x800000000;
    if (a3 == ++v6)
    {
      v15 = v12 - 1;
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

int64_t *sub_247BE1DB8(int64_t *result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unint64_t a6)
{
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  char v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  BOOL v14;
  int64_t v15;

  if (!a2)
  {
    a3 = 0;
LABEL_28:
    v15 = a4;
LABEL_30:
    *result = a4;
    result[1] = a5;
    result[2] = a6;
    result[3] = v15;
    return (int64_t *)a3;
  }
  if (!a3)
    goto LABEL_28;
  if (a3 < 0)
    goto LABEL_35;
  v6 = 0;
  v7 = (71 - __clz(a6)) >> 3;
  if (a5 >= a4)
    v8 = a4;
  else
    v8 = a5;
  v9 = 8 - 8 * a4;
  v10 = 8 * a4 - 8;
  v11 = a4;
  while (!__OFSUB__(v11, a5))
  {
    if (v11 == a5)
    {
      v15 = a5;
      a3 = a4 - a5;
      goto LABEL_30;
    }
    v12 = v11;
    if (v8 == v11)
      goto LABEL_32;
    if ((unint64_t)(v11 - 0x1000000000000001) >> 61 != 7)
      goto LABEL_33;
    if (v10 < -64)
    {
LABEL_13:
      LOBYTE(v13) = 0;
      if (v7 < a4)
        goto LABEL_34;
      goto LABEL_22;
    }
    if (v10 > 64)
    {
LABEL_16:
      LOBYTE(v13) = 0;
      if (v7 < a4)
        goto LABEL_34;
      goto LABEL_22;
    }
    if (v10 < 0)
    {
      if ((unint64_t)v10 <= 0xFFFFFFFFFFFFFFC0)
        goto LABEL_13;
      v13 = a6 << (v9 & 0x38);
    }
    else
    {
      if ((unint64_t)v10 >= 0x40)
        goto LABEL_16;
      v13 = a6 >> (v10 & 0x38);
    }
    if (v7 < a4)
      goto LABEL_34;
LABEL_22:
    v14 = __OFSUB__(v11--, 1);
    if (v12 - 1 < 0 != v14)
      goto LABEL_34;
    *(_BYTE *)(a2 + v6) = v13;
    v9 += 8;
    v10 -= 8;
    if (a3 == ++v6)
    {
      v15 = v12 - 1;
      goto LABEL_30;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_247BE1F00(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int8 a6)
{
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;

  if (!a2)
  {
    a3 = 0;
LABEL_22:
    v12 = a4;
LABEL_24:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_BYTE *)(result + 16) = a6;
    *(_QWORD *)(result + 24) = v12;
    return a3;
  }
  if (!a3)
    goto LABEL_22;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4)
      v8 = a4;
    else
      v8 = a5;
    v9 = 8 * a4;
    v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        v12 = a5;
        a3 = a4 - a5;
        goto LABEL_24;
      }
      if (v8 == v10)
        goto LABEL_26;
      if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7)
        goto LABEL_27;
      v9 -= 8;
      if ((v9 & 0x8000000000000000) != 0)
        goto LABEL_28;
      if (v9 > 0xFF)
        goto LABEL_29;
      if (v7 < a4)
        goto LABEL_30;
      v11 = v10 - 1;
      if (v10 < 1)
        goto LABEL_30;
      v12 = v10 - 1;
      if (((v10 - 1) & 0x1F) != 0)
        v13 = 0;
      else
        v13 = a6;
      *(_BYTE *)(a2 + v6) = v13;
      v10 = v11;
      if (a3 == ++v6)
        goto LABEL_24;
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247BE2000(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned __int16 a6)
{
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (!a2)
  {
    a3 = 0;
LABEL_21:
    v12 = a4;
LABEL_23:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_WORD *)(result + 16) = a6;
    *(_QWORD *)(result + 24) = v12;
    return a3;
  }
  if (!a3)
    goto LABEL_21;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = ((unint64_t)(unsigned __int16)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4)
      v8 = a4;
    else
      v8 = a5;
    v9 = 8 * a4 - 8;
    v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        v12 = a5;
        a3 = a4 - a5;
        goto LABEL_23;
      }
      if (v8 == v10)
        goto LABEL_25;
      if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7)
        goto LABEL_26;
      if ((v9 & 0x8000000000000000) != 0)
        goto LABEL_27;
      if (v9 >> 16)
        goto LABEL_28;
      if (v7 < a4)
        goto LABEL_29;
      v11 = v10 - 1;
      if (v10 < 1)
        goto LABEL_29;
      v12 = v10 - 1;
      v13 = a6 >> (v9 & 8);
      if ((v12 & 0x1FFE) != 0)
        LOBYTE(v13) = 0;
      *(_BYTE *)(a2 + v6) = v13;
      v9 -= 8;
      v10 = v11;
      if (a3 == ++v6)
        goto LABEL_23;
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
  }
  __break(1u);
  return result;
}

uint64_t sub_247BE2110(uint64_t result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unsigned int a6)
{
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  if (!a2)
  {
    a3 = 0;
LABEL_21:
    v12 = a4;
LABEL_23:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_DWORD *)(result + 16) = a6;
    *(_QWORD *)(result + 24) = v12;
    return a3;
  }
  if (!a3)
    goto LABEL_21;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = ((unint64_t)(32 - __clz(a6)) + 7) >> 3;
    if (a5 >= a4)
      v8 = a4;
    else
      v8 = a5;
    v9 = 8 * a4 - 8;
    v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        v12 = a5;
        a3 = a4 - a5;
        goto LABEL_23;
      }
      if (v8 == v10)
        goto LABEL_25;
      if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7)
        goto LABEL_26;
      if ((v9 & 0x8000000000000000) != 0)
        goto LABEL_27;
      if (HIDWORD(v9))
        goto LABEL_28;
      if (v7 < a4)
        goto LABEL_29;
      v11 = v10 - 1;
      if (v10 < 1)
        goto LABEL_29;
      v12 = v10 - 1;
      v13 = a6 >> (v9 & 0x18);
      if ((v12 & 0x1FFFFFFC) != 0)
        LOBYTE(v13) = 0;
      *(_BYTE *)(a2 + v6) = v13;
      v9 -= 8;
      v10 = v11;
      if (a3 == ++v6)
        goto LABEL_23;
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
  }
  __break(1u);
  return result;
}

int64_t *sub_247BE2214(int64_t *result, uint64_t a2, int64_t a3, int64_t a4, int64_t a5, unint64_t a6)
{
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  BOOL v12;
  unint64_t v13;
  int64_t v14;

  if (!a2)
  {
    a3 = 0;
LABEL_20:
    v14 = a4;
LABEL_22:
    *result = a4;
    result[1] = a5;
    result[2] = a6;
    result[3] = v14;
    return (int64_t *)a3;
  }
  if (!a3)
    goto LABEL_20;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = (71 - __clz(a6)) >> 3;
    if (a5 >= a4)
      v8 = a4;
    else
      v8 = a5;
    v9 = 8 * a4 - 8;
    v10 = a4;
    while (!__OFSUB__(v10, a5))
    {
      if (v10 == a5)
      {
        v14 = a5;
        a3 = a4 - a5;
        goto LABEL_22;
      }
      v11 = v10;
      if (v8 == v10)
        goto LABEL_24;
      if ((unint64_t)(v10 - 0x1000000000000001) >> 61 != 7)
        goto LABEL_25;
      if ((v9 & 0x8000000000000000) != 0)
        goto LABEL_26;
      if (v7 < a4)
        goto LABEL_27;
      v12 = __OFSUB__(v10--, 1);
      if (v11 - 1 < 0 != v12)
        goto LABEL_27;
      v13 = a6 >> (v9 & 0x38);
      if (v9 >= 0x40)
        LOBYTE(v13) = 0;
      *(_BYTE *)(a2 + v6) = v13;
      v9 -= 8;
      if (a3 == ++v6)
      {
        v14 = v11 - 1;
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247BE230C(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  unint64_t v5;

  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_13;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v4 = 8 * (result - 1);
  if (v4 < -128)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v4 > 127)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v5 = (result - 1) << 59;
  if (v5)
    a4 = 0;
  if (v5 <= 0x800000000000000)
    return a4;
  else
    return 0;
}

unint64_t sub_247BE2374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int64_t a5@<X8>)
{
  char v5;
  uint64_t v7;

  if (a2 < a1 || a3 >= a1)
  {
    __break(1u);
    goto LABEL_12;
  }
  a5 = (unint64_t)(a1 - 0x1000000000000001) >> 61;
  if (a5 != 7)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    v7 = a4 << ((8 - v5) & 0x38);
    if ((unint64_t)a5 <= 0xFFFFFFFFFFFFFFC0)
      return 0;
    else
      return v7;
  }
  v5 = 8 * a1;
  a5 = 8 * a1 - 8;
  if (a5 < -64)
    return 0;
  if (a5 > 64)
    return 0;
  if (a5 < 0)
    goto LABEL_13;
  if ((unint64_t)a5 >= 0x40)
    return 0;
  return a4 >> (a5 & 0x38);
}

uint64_t sub_247BE23FC(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4;

  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_10;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v4 = 8 * result - 8;
  if ((v4 & 0x8000000000000000) != 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v4 > 0xFF)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if ((v4 & 0xF8) != 0)
    return 0;
  else
    return a4;
}

uint64_t sub_247BE2450(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;

  if (a2 < result || a3 >= result)
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)(result - 0x1000000000000001) >> 61 != 7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v4 = 8 * result - 8;
  if ((v4 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (v4 >= 0x40)
    return 0;
  else
    return (a4 >> (v4 & 0x38));
}

void sub_247BE24A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  char **v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_18;
  }
  v7 = *v4;
  v8 = *((_QWORD *)*v4 + 2);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((_QWORD *)v7 + 3) >> 1)
    goto LABEL_8;
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9)
        v13 = v8 + v6;
      else
        v13 = v8;
      isUniquelyReferenced_nonNull_native = sub_247BD3E98(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      v7 = isUniquelyReferenced_nonNull_native;
      if (v5 != a3)
        goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v14 = *((_QWORD *)v7 + 2);
  if ((*((_QWORD *)v7 + 3) >> 1) - v14 < v6)
    goto LABEL_19;
  memcpy(&v7[8 * v14 + 32], (const void *)(a2 + 8 * a3), 8 * v6);
  if (v6 <= 0)
  {
LABEL_16:
    *v4 = v7;
    return;
  }
  v15 = *((_QWORD *)v7 + 2);
  v16 = __OFADD__(v15, v6);
  v17 = v15 + v6;
  if (!v16)
  {
    *((_QWORD *)v7 + 2) = v17;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
}

void sub_247BE2594(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  char **v4;
  unint64_t v5;
  int64_t v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_18;
  }
  v7 = *v4;
  v8 = *((_QWORD *)*v4 + 2);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((_QWORD *)v7 + 3) >> 1)
    goto LABEL_8;
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9)
        v13 = v8 + v6;
      else
        v13 = v8;
      isUniquelyReferenced_nonNull_native = sub_247BD3F98(isUniquelyReferenced_nonNull_native, v13, 1, v7);
      v7 = isUniquelyReferenced_nonNull_native;
      if (v5 != a3)
        goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  v14 = *((_QWORD *)v7 + 2);
  if ((*((_QWORD *)v7 + 3) >> 1) - v14 < v6)
    goto LABEL_19;
  memcpy(&v7[v14 + 32], (const void *)(a2 + a3), v6);
  if (v6 <= 0)
  {
LABEL_16:
    *v4 = v7;
    return;
  }
  v15 = *((_QWORD *)v7 + 2);
  v16 = __OFADD__(v15, v6);
  v17 = v15 + v6;
  if (!v16)
  {
    *((_QWORD *)v7 + 2) = v17;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
}

unint64_t sub_247BE268C()
{
  unint64_t result;

  result = qword_2576E9D10;
  if (!qword_2576E9D10)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Any, &type metadata for ASN1Any);
    atomic_store(result, (unint64_t *)&qword_2576E9D10);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Any()
{
  return &type metadata for ASN1Any;
}

void sub_247BE26E0()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v2 >> 1;
  if (v1 == v2 >> 1)
    goto LABEL_2;
  if (v1 >= (uint64_t)(v2 >> 1))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v9 = v0[1];
  v10 = *(char *)(v9 + v1);
  v11 = v0[2];
  if (v10 < 0)
  {
    v11 = v1 + 1;
    if (v1 + 1 == v3)
    {
LABEL_2:
      sub_247BD3D44();
      swift_allocError();
      v5 = v4;
      v6 = 0xD000000000000026;
      v7 = 0x8000000247BEF010;
      v8 = 275;
LABEL_17:
      static ASN1Error.invalidASN1Object(reason:file:line:)(v6, v7, (uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32, 2, v8, v5);
      swift_willThrow();
      return;
    }
    while (v11 < v3)
    {
      if ((*(char *)(v9 + v11) & 0x80000000) == 0)
        goto LABEL_5;
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_19;
      ++v11;
      if (v15 == v3)
        goto LABEL_2;
    }
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
LABEL_5:
  v12 = v11 + 1;
  if (v11 + 1 < v1)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v11 >= -1)
  {
    if (v10 != -128 && v1 != v12)
    {
      v13 = v0[3] & 1 | (2 * v12);
      v0[2] = v12;
      v14 = swift_unknownObjectRetain();
      sub_247BE3844(v14, v9, v1, v13);
      return;
    }
    sub_247BD3D44();
    swift_allocError();
    v6 = 0xD00000000000002DLL;
    v5 = v16;
    v7 = 0x8000000247BEF040;
    v8 = 283;
    goto LABEL_17;
  }
LABEL_22:
  __break(1u);
}

void static ASN1ObjectIdentifier.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 6;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  char *v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  char *v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int64_t v28;
  unint64_t v29;

  v4 = *(_QWORD *)(result + 16);
  v5 = *(_QWORD *)(result + 24);
  v6 = *(_QWORD *)(result + 32);
  v7 = *(_QWORD *)(result + 40);
  v8 = *(_QWORD *)(result + 48);
  v9 = *(unsigned __int8 *)(result + 56);
  v10 = *(_QWORD *)(result + 64);
  if (*(_QWORD *)result != *(_QWORD *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32, 2, 38, v18);
    j__swift_unknownObjectRelease(v4, v5, v6, v7, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  if (!*(_BYTE *)(result + 56))
  {
    __break(1u);
    return result;
  }
  v11 = v3;
  v12 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v12, v5, v6, v7, v8, 1);
  swift_unknownObjectRelease();
  v28 = v6;
  v29 = v7;
  v13 = (v7 >> 1) - v6;
  if (!__OFSUB__(v7 >> 1, v6))
  {
    v7 = MEMORY[0x24BEE4AF8];
    if (v13 < 1)
    {
      v6 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_17:
      v19 = sub_247BD3E98(0, v6 + 1, 0, MEMORY[0x24BEE4AF8]);
      v3 = v19;
      v20 = *(_QWORD *)(v7 + 16);
      if (!v20)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_247BD3D44();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000016, 0x8000000247BEEFF0, (uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32, 2, 79, v23);
        swift_willThrow();
        swift_unknownObjectRelease();
        return swift_bridgeObjectRelease_n();
      }
      v8 = *(_QWORD *)(v7 + 32);
      v25 = (2 * v20) | 1;
      v26 = v7 + 32;
      v9 = v8 / 0x28;
      v10 = 40;
      v5 = *((_QWORD *)v19 + 2);
      v24 = *((_QWORD *)v19 + 3);
      v21 = v24 >> 1;
      v6 = v5 + 1;
      swift_bridgeObjectRetain();
      if (v24 >> 1 > v5)
        goto LABEL_19;
      goto LABEL_25;
    }
    while (1)
    {
      v3 = v11;
      sub_247BE26E0();
      if (v11)
      {
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      v15 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = (unint64_t)sub_247BD3E98(0, *(_QWORD *)(v7 + 16) + 1, 1, (char *)v7);
      v17 = *(_QWORD *)(v7 + 16);
      v16 = *(_QWORD *)(v7 + 24);
      v6 = v17 + 1;
      if (v17 >= v16 >> 1)
        v7 = (unint64_t)sub_247BD3E98((char *)(v16 > 1), v17 + 1, 1, (char *)v7);
      *(_QWORD *)(v7 + 16) = v6;
      *(_QWORD *)(v7 + 8 * v17 + 32) = v15;
      if (__OFSUB__(v29 >> 1, v28))
        break;
      if ((uint64_t)((v29 >> 1) - v28) <= 0)
        goto LABEL_17;
    }
    __break(1u);
  }
  __break(1u);
LABEL_25:
  v3 = sub_247BD3E98((char *)(v24 > 1), v6, 1, v3);
  v24 = *((_QWORD *)v3 + 3);
  v21 = v24 >> 1;
LABEL_19:
  v22 = v8 - v9 * v10;
  *((_QWORD *)v3 + 2) = v6;
  *(_QWORD *)&v3[8 * v5 + 32] = v9;
  if (v21 < (uint64_t)(v5 + 2))
    v3 = sub_247BD3E98((char *)(v24 > 1), v5 + 2, 1, v3);
  *((_QWORD *)v3 + 2) = v5 + 2;
  *(_QWORD *)&v3[8 * v6 + 32] = v22;
  sub_247BE24A0(v7, v26, 1, v25);
  swift_unknownObjectRelease();
  result = swift_bridgeObjectRelease_n();
  *a3 = v3;
  return result;
}

uint64_t ASN1ObjectIdentifier.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD78C0);
}

uint64_t sub_247BE2C8C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v2 = a2[2];
  if (!v2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v2 == 1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v4 = a2[4];
  if (!is_mul_ok(v4, 0x28uLL))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v5 = 40 * v4;
  v6 = a2[5];
  v7 = v5 + v6;
  if (!__CFADD__(v5, v6))
  {
    swift_bridgeObjectRetain();
    result = sub_247BE2D60(v7);
    v9 = v2 - 2;
    if (!v9)
      return swift_bridgeObjectRelease();
    v10 = 0;
    while (v9 != v10)
    {
      result = sub_247BE2D60(a2[v10++ + 6]);
      if (v9 == v10)
        return swift_unknownObjectRelease();
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_247BE2D60(unint64_t a1)
{
  char **v1;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;

  if (a1)
  {
    v3 = __clz(a1);
    v4 = *v1;
    if (v3 - 57 >= 7)
    {
      v5 = (((37 * (70 - v3)) >> 8)
          + (((70 - v3 - ((unsigned __int16)(37 * (70 - v3)) >> 8)) & 0xFE) >> 1)) >> 2;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_247BD3F98(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v6 = 7 * v5 - 7;
      v7 = v5;
      while (v7 <= v5)
      {
        v9 = *((_QWORD *)v4 + 2);
        v8 = *((_QWORD *)v4 + 3);
        if (v9 >= v8 >> 1)
          v4 = sub_247BD3F98((char *)(v8 > 1), v9 + 1, 1, v4);
        --v7;
        *((_QWORD *)v4 + 2) = v9 + 1;
        v4[v9 + 32] = (a1 >> v6) | 0x80;
        v6 -= 7;
        if (v7 == 1)
          goto LABEL_17;
      }
      __break(1u);
LABEL_17:
      *v1 = v4;
    }
    v14 = a1 & 0x7F;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v4 = (char *)result;
    }
    v12 = *((_QWORD *)v4 + 2);
    v15 = *((_QWORD *)v4 + 3);
    v13 = v12 + 1;
    if (v12 >= v15 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v15 > 1), v12 + 1, 1, v4);
      v4 = (char *)result;
    }
  }
  else
  {
    v4 = *v1;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v4 = (char *)result;
    }
    v12 = *((_QWORD *)v4 + 2);
    v11 = *((_QWORD *)v4 + 3);
    v13 = v12 + 1;
    if (v12 >= v11 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v11 > 1), v12 + 1, 1, v4);
      v4 = (char *)result;
    }
    v14 = 0;
  }
  *((_QWORD *)v4 + 2) = v13;
  v4[v12 + 32] = v14;
  *v1 = v4;
  return result;
}

void sub_247BE2F50(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 6;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE2F60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  char v3;
  uint64_t v5;
  char v6;

  v3 = *((_BYTE *)a2 + 8);
  v5 = *a2;
  v6 = v3;
  return ASN1ObjectIdentifier.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_247BE2F90(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BE3B04);
}

uint64_t ASN1ObjectIdentifier.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  result = sub_247BECA58();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = v1 + 32;
    do
    {
      v4 += 8;
      result = sub_247BECA58();
      --v3;
    }
    while (v3);
  }
  return result;
}

BOOL static ASN1ObjectIdentifier.== infix(_:_:)(_QWORD **a1, _QWORD **a2)
{
  return sub_247BE3038(*a1, *a2);
}

BOOL sub_247BE3038(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = a1 + 5;
  v6 = a2 + 5;
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t ASN1ObjectIdentifier.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_247BECA4C();
  sub_247BECA58();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v1 + 32;
    do
    {
      v3 += 8;
      sub_247BECA58();
      --v2;
    }
    while (v2);
  }
  return sub_247BECA7C();
}

uint64_t sub_247BE3120()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_247BECA4C();
  v2 = *(_QWORD *)(v1 + 16);
  sub_247BECA58();
  if (v2)
  {
    v3 = v1 + 32;
    do
    {
      v3 += 8;
      sub_247BECA58();
      --v2;
    }
    while (v2);
  }
  return sub_247BECA7C();
}

BOOL sub_247BE3188(_QWORD **a1, _QWORD **a2)
{
  return sub_247BE3038(*a1, *a2);
}

uint64_t ASN1ObjectIdentifier.init(arrayLiteral:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_247BE319C@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ASN1ObjectIdentifier.description.getter()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_247BE39E8(0, v1, 0);
    v2 = 0;
    do
    {
      v3 = sub_247BEC9EC();
      v5 = v4;
      v7 = *(_QWORD *)(v11 + 16);
      v6 = *(_QWORD *)(v11 + 24);
      if (v7 >= v6 >> 1)
        sub_247BE39E8((char *)(v6 > 1), v7 + 1, 1);
      ++v2;
      *(_QWORD *)(v11 + 16) = v7 + 1;
      v8 = v11 + 16 * v7;
      *(_QWORD *)(v8 + 32) = v3;
      *(_QWORD *)(v8 + 40) = v5;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9DF0);
  sub_247BE3A20();
  v9 = sub_247BEC734();
  swift_bridgeObjectRelease();
  return v9;
}

void sub_247BE32F4()
{
  qword_2576E9D18 = (uint64_t)&unk_251931378;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp256r1.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9760, &qword_2576E9D18, a1);
}

void sub_247BE3324()
{
  qword_2576E9D20 = (uint64_t)&unk_2519313D0;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp384r1.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9768, &qword_2576E9D20, a1);
}

void sub_247BE3354()
{
  qword_2576E9D28 = (uint64_t)&unk_251931418;
}

uint64_t static ASN1ObjectIdentifier.NamedCurves.secp521r1.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9770, &qword_2576E9D28, a1);
}

void sub_247BE3384()
{
  qword_2576E9D30 = (uint64_t)&unk_251931460;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.idEcPublicKey.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9778, &qword_2576E9D30, a1);
}

void sub_247BE33B4()
{
  qword_2576E9D38 = (uint64_t)&unk_2519314B0;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha256WithRSAEncryption.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9780, &qword_2576E9D38, a1);
}

void sub_247BE33E4()
{
  qword_2576E9D40 = (uint64_t)&unk_251931508;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha384WithRSAEncryption.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9788, &qword_2576E9D40, a1);
}

void sub_247BE3414()
{
  qword_2576E9D48 = (uint64_t)&unk_251931560;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.sha512WithRSAEncryption.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9790, &qword_2576E9D48, a1);
}

void sub_247BE3444()
{
  qword_2576E9D50 = (uint64_t)&unk_2519315B8;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.rsaPSS.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9798, &qword_2576E9D50, a1);
}

void sub_247BE3474()
{
  qword_2576E9D58 = (uint64_t)&unk_251931610;
}

uint64_t static ASN1ObjectIdentifier.AlgorithmIdentifier.rsaEncryption.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97A0, &qword_2576E9D58, a1);
}

void sub_247BE34A4()
{
  qword_2576E9D60 = (uint64_t)&unk_251931668;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.name.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97A8, &qword_2576E9D60, a1);
}

void sub_247BE34D4()
{
  qword_2576E9D68 = (uint64_t)&unk_2519316A8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.surname.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97B0, &qword_2576E9D68, a1);
}

void sub_247BE3504()
{
  qword_2576E9D70 = (uint64_t)&unk_2519316E8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.givenName.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97B8, &qword_2576E9D70, a1);
}

void sub_247BE3534()
{
  qword_2576E9D78 = (uint64_t)&unk_251931728;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.initials.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97C0, &qword_2576E9D78, a1);
}

void sub_247BE3564()
{
  qword_2576E9D80 = (uint64_t)&unk_251931768;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.generationQualifier.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97C8, &qword_2576E9D80, a1);
}

void sub_247BE3594()
{
  qword_2576E9D88 = (uint64_t)&unk_2519317A8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.commonName.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97D0, &qword_2576E9D88, a1);
}

void sub_247BE35C4()
{
  qword_2576E9D90 = (uint64_t)&unk_2519317E8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.localityName.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97D8, &qword_2576E9D90, a1);
}

void sub_247BE35F4()
{
  qword_2576E9D98 = (uint64_t)&unk_251931828;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.stateOrProvinceName.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97E0, &qword_2576E9D98, a1);
}

void sub_247BE3624()
{
  qword_2576E9DA0 = (uint64_t)&unk_251931868;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.organizationName.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97E8, &qword_2576E9DA0, a1);
}

void sub_247BE3654()
{
  qword_2576E9DA8 = (uint64_t)&unk_2519318A8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.organizationalUnitName.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97F0, &qword_2576E9DA8, a1);
}

void sub_247BE3684()
{
  qword_2576E9DB0 = (uint64_t)&unk_2519318E8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.title.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E97F8, &qword_2576E9DB0, a1);
}

void sub_247BE36B4()
{
  qword_2576E9DB8 = (uint64_t)&unk_251931928;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.dnQualifier.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9800, &qword_2576E9DB8, a1);
}

void sub_247BE36E4()
{
  qword_2576E9DC0 = (uint64_t)&unk_251931968;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.countryName.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9808, &qword_2576E9DC0, a1);
}

void sub_247BE3714()
{
  qword_2576E9DC8 = (uint64_t)&unk_2519319A8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.serialNumber.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9810, &qword_2576E9DC8, a1);
}

void sub_247BE3744()
{
  qword_2576E9DD0 = (uint64_t)&unk_2519319E8;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.pseudonym.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9818, &qword_2576E9DD0, a1);
}

void sub_247BE3774()
{
  qword_2576E9DD8 = (uint64_t)&unk_251931A28;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.domainComponent.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9820, &qword_2576E9DD8, a1);
}

void sub_247BE37A4()
{
  qword_2576E9DE0 = (uint64_t)&unk_251931A80;
}

uint64_t static ASN1ObjectIdentifier.NameAttributes.emailAddress.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9828, &qword_2576E9DE0, a1);
}

void sub_247BE37D4()
{
  qword_2576E9DE8 = (uint64_t)&unk_251931AD8;
}

uint64_t static ASN1ObjectIdentifier.OCSP.basicResponse.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_247BE3804(&qword_2576E9830, &qword_2576E9DE8, a1);
}

uint64_t sub_247BE3804@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*a1 != -1)
    swift_once();
  *a3 = *a2;
  return swift_bridgeObjectRetain();
}

void sub_247BE3844(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  int64_t v7;
  uint64_t *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v7 = 7 * v5;
  if ((unsigned __int128)(v5 * (__int128)7) >> 64 != (7 * v5) >> 63)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!__OFADD__(v7, 7))
  {
    if (v7 + 7 > 71)
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000021, 0x8000000247BEF070, (uint64_t)"SwiftASN1/ObjectIdentifier.swift", 32, 2, 298, v8);
      swift_willThrow();
      swift_unknownObjectRelease();
      return;
    }
    v10 = sub_247BD873C(0, v7, 7);
    v11 = *(_QWORD *)(v10 + 16);
    if (!v11)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    v12 = 0;
    v13 = 0;
    if (a3 <= v4)
      v14 = v4;
    else
      v14 = a3;
    v15 = v14 - a3;
    while (v15 > v11 - 1)
    {
      v17 = *(_QWORD *)(v10 + 8 * v13 + 32);
      if (v17 - 65 <= 0xFFFFFFFFFFFFFF7ELL)
      {
        v16 = 0;
      }
      else
      {
        v18 = *(_BYTE *)(a2 + a3 + v13) & 0x7F;
        if ((v17 & 0x8000000000000000) != 0)
        {
          v20 = v18 >> -(char)v17;
          if (v17 <= 0xFFFFFFFFFFFFFFC0)
            v16 = 0;
          else
            v16 = v20;
        }
        else
        {
          v19 = v18 << v17;
          if (v17 >= 0x40)
            v16 = 0;
          else
            v16 = v19;
        }
      }
      ++v13;
      v12 |= v16;
      if (v11 == v13)
        goto LABEL_22;
    }
    __break(1u);
    goto LABEL_24;
  }
LABEL_26:
  __break(1u);
}

char *sub_247BE39E8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_247BE94F8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_247BE3A04(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_247BE96F0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

unint64_t sub_247BE3A20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576E9DF8;
  if (!qword_2576E9DF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576E9DF0);
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2576E9DF8);
  }
  return result;
}

unint64_t sub_247BE3A70()
{
  unint64_t result;

  result = qword_2576E9E00;
  if (!qword_2576E9E00)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1ObjectIdentifier, &type metadata for ASN1ObjectIdentifier);
    atomic_store(result, (unint64_t *)&qword_2576E9E00);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier()
{
  return &type metadata for ASN1ObjectIdentifier;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.NamedCurves()
{
  return &type metadata for ASN1ObjectIdentifier.NamedCurves;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.AlgorithmIdentifier()
{
  return &type metadata for ASN1ObjectIdentifier.AlgorithmIdentifier;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.NameAttributes()
{
  return &type metadata for ASN1ObjectIdentifier.NameAttributes;
}

ValueMetadata *type metadata accessor for ASN1ObjectIdentifier.OCSP()
{
  return &type metadata for ASN1ObjectIdentifier.OCSP;
}

uint64_t sub_247BE3B04(uint64_t a1)
{
  return sub_247BD78C0(a1);
}

uint64_t static ASN1Error.unexpectedFieldType(_:file:line:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t result;

  type metadata accessor for ASN1Error.Backing();
  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0xD000000000000013;
  *(_QWORD *)(result + 32) = 0x8000000247BEF0A0;
  *(_QWORD *)(result + 40) = a1;
  *(_QWORD *)(result + 48) = a2;
  *(_BYTE *)(result + 56) = a3;
  *(_QWORD *)(result + 64) = a4;
  *a5 = result;
  return result;
}

uint64_t type metadata accessor for ASN1Error.Backing()
{
  return objc_opt_self();
}

uint64_t static ASN1Error.invalidASN1Object(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14;

  type metadata accessor for ASN1Error.Backing();
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 1;
  *(_QWORD *)(v14 + 24) = a1;
  *(_QWORD *)(v14 + 32) = a2;
  *(_QWORD *)(v14 + 40) = a3;
  *(_QWORD *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(_QWORD *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.truncatedASN1Field(file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result;

  type metadata accessor for ASN1Error.Backing();
  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 3;
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = 0xE000000000000000;
  *(_QWORD *)(result + 40) = a1;
  *(_QWORD *)(result + 48) = a2;
  *(_BYTE *)(result + 56) = a3;
  *(_QWORD *)(result + 64) = a4;
  *a5 = result;
  return result;
}

uint64_t static ASN1Error.unsupportedFieldLength(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14;

  type metadata accessor for ASN1Error.Backing();
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 4;
  *(_QWORD *)(v14 + 24) = a1;
  *(_QWORD *)(v14 + 32) = a2;
  *(_QWORD *)(v14 + 40) = a3;
  *(_QWORD *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(_QWORD *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.invalidASN1IntegerEncoding(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14;

  type metadata accessor for ASN1Error.Backing();
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 2;
  *(_QWORD *)(v14 + 24) = a1;
  *(_QWORD *)(v14 + 32) = a2;
  *(_QWORD *)(v14 + 40) = a3;
  *(_QWORD *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(_QWORD *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

void ASN1Error.code.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(*(_QWORD *)v1 + 16);
}

uint64_t static ASN1Error.invalidPEMDocument(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14;

  type metadata accessor for ASN1Error.Backing();
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 5;
  *(_QWORD *)(v14 + 24) = a1;
  *(_QWORD *)(v14 + 32) = a2;
  *(_QWORD *)(v14 + 40) = a3;
  *(_QWORD *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(_QWORD *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

uint64_t static ASN1Error.invalidStringRepresentation(reason:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14;

  type metadata accessor for ASN1Error.Backing();
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 6;
  *(_QWORD *)(v14 + 24) = a1;
  *(_QWORD *)(v14 + 32) = a2;
  *(_QWORD *)(v14 + 40) = a3;
  *(_QWORD *)(v14 + 48) = a4;
  *(_BYTE *)(v14 + 56) = a5;
  *(_QWORD *)(v14 + 64) = a6;
  *a7 = v14;
  return swift_bridgeObjectRetain();
}

uint64_t ASN1Error.hash(into:)()
{
  return sub_247BECA58();
}

BOOL static ASN1Error.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(*(_QWORD *)a1 + 16) == *(unsigned __int8 *)(*(_QWORD *)a2 + 16);
}

uint64_t ASN1Error.hashValue.getter()
{
  sub_247BECA4C();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BE3F38()
{
  sub_247BECA4C();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BE3F7C()
{
  return sub_247BECA58();
}

uint64_t sub_247BE3FA8()
{
  sub_247BECA4C();
  sub_247BECA58();
  return sub_247BECA7C();
}

BOOL sub_247BE3FE8(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(*(_QWORD *)a1 + 16) == *(unsigned __int8 *)(*(_QWORD *)a2 + 16);
}

uint64_t ASN1Error.description.getter()
{
  sub_247BEC95C();
  swift_bridgeObjectRelease();
  sub_247BEC77C();
  sub_247BEC794();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  swift_bridgeObjectRetain();
  sub_247BEC794();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  sub_247BEC974();
  sub_247BEC794();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  sub_247BEC9EC();
  sub_247BEC794();
  swift_bridgeObjectRelease();
  return 0x6F727245314E5341;
}

BOOL sub_247BE4144(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247BE4158()
{
  sub_247BECA4C();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BE419C()
{
  return sub_247BECA58();
}

uint64_t sub_247BE41C4()
{
  sub_247BECA4C();
  sub_247BECA58();
  return sub_247BECA7C();
}

void static ASN1Error.ErrorCode.unexpectedFieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static ASN1Error.ErrorCode.invalidASN1Object.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void static ASN1Error.ErrorCode.invalidASN1IntegerEncoding.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

void static ASN1Error.ErrorCode.truncatedASN1Field.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void static ASN1Error.ErrorCode.unsupportedFieldLength.getter(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void static ASN1Error.ErrorCode.invalidPEMDocument.getter(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

void static ASN1Error.ErrorCode.invalidStringRepresentation.getter(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t ASN1Error.ErrorCode.hash(into:)()
{
  return sub_247BECA58();
}

BOOL static ASN1Error.ErrorCode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ASN1Error.ErrorCode.hashValue.getter()
{
  sub_247BECA4C();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t ASN1Error.ErrorCode.description.getter()
{
  return sub_247BEC77C();
}

uint64_t sub_247BE4304()
{
  return sub_247BEC77C();
}

uint64_t sub_247BE4334()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_247BE435C()
{
  unint64_t result;

  result = qword_2576E9E08;
  if (!qword_2576E9E08)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Error, &type metadata for ASN1Error);
    atomic_store(result, (unint64_t *)&qword_2576E9E08);
  }
  return result;
}

unint64_t sub_247BE43A4()
{
  unint64_t result;

  result = qword_2576E9E10;
  if (!qword_2576E9E10)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Error.ErrorCode, &type metadata for ASN1Error.ErrorCode);
    atomic_store(result, (unint64_t *)&qword_2576E9E10);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Error()
{
  return &type metadata for ASN1Error;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Error.ErrorCode()
{
  return &type metadata for ASN1Error.ErrorCode;
}

uint64_t _s9SwiftASN19ASN1ErrorV9ErrorCodeV11BackingCodeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s9SwiftASN19ASN1ErrorV9ErrorCodeV11BackingCodeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_247BE44FC + 4 * byte_247BED9CD[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_247BE4530 + 4 * asc_247BED9C8[v4]))();
}

uint64_t sub_247BE4530(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247BE4538(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247BE4540);
  return result;
}

uint64_t sub_247BE454C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247BE4554);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_247BE4558(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247BE4560(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247BE456C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247BE4574(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Error.ErrorCode.BackingCode()
{
  return &type metadata for ASN1Error.ErrorCode.BackingCode;
}

unint64_t sub_247BE4590()
{
  unint64_t result;

  result = qword_2576E9ED0;
  if (!qword_2576E9ED0)
  {
    result = MEMORY[0x24958E0B8](&unk_247BEDBC4, &type metadata for ASN1Error.ErrorCode.BackingCode);
    atomic_store(result, (unint64_t *)&qword_2576E9ED0);
  }
  return result;
}

unint64_t sub_247BE45D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576E9ED8;
  if (!qword_2576E9ED8)
  {
    v1 = type metadata accessor for ASN1Error.Backing();
    result = MEMORY[0x24958E0B8](&unk_247BEDBEC, v1);
    atomic_store(result, (unint64_t *)&qword_2576E9ED8);
  }
  return result;
}

void static Bool.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 1;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t Bool.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2)
{
  return sub_247BE482C(a1, a2) & 1;
}

uint64_t Bool.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD78A8);
}

uint64_t sub_247BE4694(uint64_t *a1, char a2)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;

  v4 = *a1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((a2 & 1) != 0)
  {
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v4 + 16) + 1, 1, (char *)v4);
      v4 = result;
    }
    v7 = *(_QWORD *)(v4 + 16);
    v6 = *(_QWORD *)(v4 + 24);
    v8 = v7 + 1;
    if (v7 >= v6 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v6 > 1), v7 + 1, 1, (char *)v4);
      v4 = result;
    }
    v9 = -1;
  }
  else
  {
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v4 + 16) + 1, 1, (char *)v4);
      v4 = result;
    }
    v7 = *(_QWORD *)(v4 + 16);
    v10 = *(_QWORD *)(v4 + 24);
    v8 = v7 + 1;
    if (v7 >= v10 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v10 > 1), v7 + 1, 1, (char *)v4);
      v4 = result;
    }
    v9 = 0;
  }
  *(_QWORD *)(v4 + 16) = v8;
  *(_BYTE *)(v4 + v7 + 32) = v9;
  *a1 = v4;
  return result;
}

void sub_247BE47A4(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 1;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE47B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_247BE482C(a1, a2);
  if (!v3)
    *a3 = result & 1;
  return result;
}

uint64_t sub_247BE47E0(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BE4AE0);
}

uint64_t sub_247BE482C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;

  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Boolean.swift", 27, 2, 22, v11);
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, v7);
    swift_unknownObjectRelease();
LABEL_14:
    swift_willThrow();
    return v8 & 1;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    j__swift_unknownObjectRelease(*(_QWORD *)(a1 + 16), v2, v5, v4, v6, 0);
    swift_unknownObjectRelease();
LABEL_13:
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD00000000000001CLL, 0x8000000247BEF120, (uint64_t)"SwiftASN1/ASN1Boolean.swift", 27, 2, 26, v12);
    goto LABEL_14;
  }
  v9 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v9, v2, v5, v4, v6, 1);
  result = swift_unknownObjectRelease();
  if (__OFSUB__(v4 >> 1, v5))
  {
    __break(1u);
    goto LABEL_19;
  }
  if ((v4 >> 1) - v5 != 1)
  {
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
    goto LABEL_13;
  }
  if (v5 < (uint64_t)(v4 >> 1))
  {
    if (*(unsigned __int8 *)(v2 + v5) == 255)
    {
      LOBYTE(v8) = 1;
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
    }
    else if (*(_BYTE *)(v2 + v5))
    {
      sub_247BD3D44();
      swift_allocError();
      static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000019, 0x8000000247BEF140, (uint64_t)"SwiftASN1/ASN1Boolean.swift", 27, 2, 38, v13);
      swift_willThrow();
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
    }
    else
    {
      j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
      LOBYTE(v8) = 0;
    }
    return v8 & 1;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_247BE4AE0(uint64_t *a1)
{
  return sub_247BD78A8(a1);
}

void static ASN1UTF8String.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 12;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t (*ASN1UTF8String.bytes.modify())()
{
  return nullsub_1;
}

unint64_t sub_247BE4B20(unint64_t result, int64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (result)
      return (unint64_t)sub_247BE5FD0((const void *)result, a2);
    __break(1u);
    goto LABEL_9;
  }
  if (HIDWORD(result))
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (result >> 11 != 27)
  {
    if (WORD1(result) <= 0x10u)
      return (unint64_t)sub_247BE5F04(result);
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t ASN1UTF8String.init(derEncoded:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_247BE53A8(a1, a2, a3);
}

uint64_t ASN1UTF8String.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD788C);
}

uint64_t ASN1UTF8String.withUnsafeBytes<A>(_:)()
{
  return sub_247BE5B28();
}

void sub_247BE4C1C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 12;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE4C2C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_247BE4D88(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1UTF8String.init(derEncoded:withIdentifier:));
}

uint64_t sub_247BE4C48(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t sub_247BE4CA0(_QWORD *a1)
{
  return ASN1UTF8String.init(stringLiteral:)(*a1, a1[1]);
}

void static ASN1TeletexString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 20;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t (*ASN1TeletexString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1TeletexString.init(derEncoded:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_247BE53A8(a1, a2, a3);
}

uint64_t ASN1TeletexString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t ASN1TeletexString.withUnsafeBytes<A>(_:)()
{
  return sub_247BE5B28();
}

void sub_247BE4D5C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 20;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE4D6C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_247BE4D88(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1TeletexString.init(derEncoded:withIdentifier:));
}

uint64_t sub_247BE4D88(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t *))
{
  char v5;
  uint64_t v7;
  char v8;

  v5 = *((_BYTE *)a2 + 8);
  v7 = *a2;
  v8 = v5;
  return a5(a1, &v7);
}

void static ASN1PrintableString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 19;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1PrintableString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_247BE61CC(a1, a2, a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t (*ASN1PrintableString.bytes.modify(_QWORD *a1))(uint64_t result, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_247BE4E08;
}

uint64_t sub_247BE4E08(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  BOOL v8;
  unint64_t v9;

  if ((a2 & 1) == 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)result + 16);
    v3 = *(_QWORD *)(*(_QWORD *)result + 24) >> 1;
    v4 = v3 - v2;
    if (v3 != v2)
    {
      if (v2 > v3)
        v3 = *(_QWORD *)(*(_QWORD *)result + 16);
      v5 = v3 - v2;
      v6 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)result + 8) + v2);
      while (v5)
      {
        v7 = *v6;
        v8 = v7 - 58 > 0xFFFFFFF5 || (v7 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5;
        if (!v8)
        {
          v8 = v7 > 0x3F;
          v9 = (1 << v7) & 0xA400FB8100000000;
          if (v8 || v9 == 0)
          {
            __break(1u);
            break;
          }
        }
        --v5;
        ++v6;
        if (!--v4)
          return result;
      }
      __break(1u);
    }
  }
  return result;
}

uint64_t ASN1PrintableString.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;

  v5 = *(_QWORD *)(result + 16);
  v4 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v6 = *(_QWORD *)(result + 40);
  v8 = *(_QWORD *)(result + 48);
  v9 = *(unsigned __int8 *)(result + 56);
  if (*(_QWORD *)result == *(_QWORD *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1);
      swift_unknownObjectRelease();
      result = sub_247BE6158(v4, v7, v6);
      if ((result & 1) != 0)
      {
        *a3 = v5;
        a3[1] = v4;
        a3[2] = v7;
        a3[3] = v6;
      }
      else
      {
        sub_247BD3D44();
        swift_allocError();
        static ASN1Error.invalidStringRepresentation(reason:file:line:)(0xD000000000000025, 0x8000000247BEF160, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, 138, v12);
        swift_willThrow();
        return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t ASN1PrintableString.init(contentBytes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  unint64_t v9;
  uint64_t *v11;

  v5 = a4 >> 1;
  if (a4 >> 1 == a3)
  {
LABEL_2:
    *a5 = result;
    a5[1] = a2;
    a5[2] = a3;
    a5[3] = a4;
  }
  else
  {
    v6 = a3;
    while (v6 < v5)
    {
      v7 = *(unsigned __int8 *)(a2 + v6);
      v8 = (v7 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v7 - 58 > 0xFFFFFFF5;
      if (!v8)
      {
        v8 = v7 > 0x3F;
        v9 = (1 << v7) & 0xA400FB8100000000;
        if (v8 || v9 == 0)
        {
          sub_247BD3D44();
          swift_allocError();
          static ASN1Error.invalidStringRepresentation(reason:file:line:)(0xD000000000000025, 0x8000000247BEF160, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, 146, v11);
          swift_willThrow();
          return swift_unknownObjectRelease();
        }
      }
      if (v5 == ++v6)
        goto LABEL_2;
    }
    __break(1u);
  }
  return result;
}

uint64_t ASN1PrintableString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t ASN1PrintableString.withUnsafeBytes<A>(_:)()
{
  return sub_247BE5B28();
}

void sub_247BE51C4(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 19;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE51D4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_247BE4D88(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1PrintableString.init(derEncoded:withIdentifier:));
}

uint64_t ASN1PrintableString.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_247BE5C80(a1, a2, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_247BE6158, a3);
}

uint64_t ASN1PrintableString.init(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_247BE5D2C(a1, a2, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_247BE6158, 0xD000000000000025, 0x8000000247BEF160, 193, a3);
}

uint64_t sub_247BE5234@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247BE5E24(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_247BE6158, a2);
}

void static ASN1UniversalString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 28;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t (*ASN1UniversalString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1UniversalString.init(derEncoded:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_247BE53A8(a1, a2, a3);
}

uint64_t ASN1UniversalString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t ASN1UniversalString.withUnsafeBytes<A>(_:)()
{
  return sub_247BE5B28();
}

void sub_247BE52F0(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 28;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE5300(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_247BE4D88(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1UniversalString.init(derEncoded:withIdentifier:));
}

void static ASN1BMPString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 30;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t _s9SwiftASN10B10UTF8StringV5bytess10ArraySliceVys5UInt8VGvs_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t (*ASN1BMPString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t ASN1BMPString.init(derEncoded:withIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_247BE53A8(a1, a2, a3);
}

uint64_t sub_247BE53A8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  v5 = *(_QWORD *)(result + 16);
  v4 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v6 = *(_QWORD *)(result + 40);
  v8 = *(_QWORD *)(result + 48);
  v9 = *(unsigned __int8 *)(result + 56);
  if (*(_QWORD *)result == *(_QWORD *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1);
      result = swift_unknownObjectRelease();
      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV12contentBytesACs10ArraySliceVys5UInt8VG_tcfC_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ASN1BMPString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t ASN1BMPString.withUnsafeBytes<A>(_:)()
{
  return sub_247BE5B28();
}

void sub_247BE5550(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 30;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE5560(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_247BE4D88(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1BMPString.init(derEncoded:withIdentifier:));
}

uint64_t _s9SwiftASN10B10UTF8StringV13stringLiteralACSS_tcfC_0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;
  char v7;
  uint64_t v8;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_247BE60F4(v4, 0);
      result = sub_247BEC968();
      if ((v7 & 1) != 0)
        break;
      if (result == v4)
        goto LABEL_11;
      __break(1u);
LABEL_9:
      v4 = sub_247BEC7A0();
      if (!v4)
        goto LABEL_10;
    }
    __break(1u);
  }
  else
  {
LABEL_10:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_11:
    result = swift_bridgeObjectRelease();
    v8 = (2 * v5[2]) | 1;
    *a3 = v5;
    a3[1] = v5 + 4;
    a3[2] = 0;
    a3[3] = v8;
  }
  return result;
}

void static ASN1IA5String.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 22;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t _s9SwiftASN10B10UTF8StringV5bytess10ArraySliceVys5UInt8VGvg_0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_247BE568C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a1[1];
  v7 = a1[2];
  v8 = a1[3];
  v9 = swift_unknownObjectRetain();
  a5(v9, v6, v7, v8);
  return swift_unknownObjectRelease();
}

uint64_t ASN1IA5String.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_247BE6284(a1, a2, a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t (*ASN1IA5String.bytes.modify(_QWORD *a1))(uint64_t result, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_247BE5718;
}

uint64_t sub_247BE5718(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;

  if ((a2 & 1) == 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)result + 16);
    v3 = *(_QWORD *)(*(_QWORD *)result + 24) >> 1;
    if (v2 != v3)
    {
      if (v2 >= v3)
      {
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
      v4 = *(_QWORD *)(*(_QWORD *)result + 8);
      if (*(char *)(v4 + v2) < 0)
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      v5 = v2 + 1;
      if (v2 + 1 != v3)
      {
        if (v2 + 1 >= v3)
        {
LABEL_14:
          __break(1u);
          return result;
        }
        v6 = ~v2 + v3;
        v7 = (char *)(v4 + v5);
        while (1)
        {
          v8 = *v7++;
          if (v8 < 0)
            break;
          if (!--v6)
            return result;
        }
        __break(1u);
        goto LABEL_12;
      }
    }
  }
  return result;
}

unint64_t _s9SwiftASN10B10UTF8StringVyACs06StaticD0VcfC_0@<X0>(unint64_t a1@<X0>, int64_t a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t result;
  uint64_t v6;

  result = sub_247BE4B20(a1, a2, a3);
  v6 = (2 * *(_QWORD *)(result + 16)) | 1;
  *a4 = result;
  a4[1] = result + 32;
  a4[2] = 0;
  a4[3] = v6;
  return result;
}

uint64_t ASN1IA5String.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;

  v5 = *(_QWORD *)(result + 16);
  v4 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v6 = *(_QWORD *)(result + 40);
  v8 = *(_QWORD *)(result + 48);
  v9 = *(unsigned __int8 *)(result + 56);
  if (*(_QWORD *)result != *(_QWORD *)a2 || *(unsigned __int8 *)(result + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v13);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  if (!*(_BYTE *)(result + 56))
    goto LABEL_20;
  v10 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1);
  result = swift_unknownObjectRelease();
  v11 = v6 >> 1;
  if (v7 == v6 >> 1)
    goto LABEL_14;
  if (v7 >= (uint64_t)(v6 >> 1))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(char *)(v4 + v7) < 0)
  {
LABEL_16:
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)(0xD00000000000001FLL, 0x8000000247BEF1B0, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, 313, v14);
    swift_willThrow();
    return j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, 1);
  }
  if (v7 + 1 == v11)
    goto LABEL_14;
  if (v7 + 1 < v11)
  {
    if ((*(char *)(v4 + v7 + 1) & 0x80000000) == 0)
    {
      v12 = v7 + 2;
      if (v7 + 2 != v11)
      {
        while (v12 < v11)
        {
          if (*(char *)(v4 + v12) < 0)
            goto LABEL_16;
          if (v11 == ++v12)
            goto LABEL_14;
        }
        __break(1u);
        goto LABEL_18;
      }
LABEL_14:
      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
      return result;
    }
    goto LABEL_16;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t ASN1IA5String.init(contentBytes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v5 = a4 >> 1;
  if (a4 >> 1 == a3)
    goto LABEL_11;
  if ((uint64_t)(a4 >> 1) <= a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (*(char *)(a2 + a3) < 0)
    goto LABEL_12;
  if (a3 + 1 == v5)
    goto LABEL_11;
  if (a3 + 1 < v5)
  {
    if ((*(char *)(a2 + a3 + 1) & 0x80000000) == 0)
    {
      v6 = a3 + 2;
      if (a3 + 2 != v5)
      {
        while (v6 < v5)
        {
          if (*(char *)(a2 + v6) < 0)
            goto LABEL_12;
          if (v5 == ++v6)
            goto LABEL_11;
        }
        __break(1u);
        goto LABEL_14;
      }
LABEL_11:
      *a5 = result;
      a5[1] = a2;
      a5[2] = a3;
      a5[3] = a4;
      return result;
    }
LABEL_12:
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)(0xD00000000000001FLL, 0x8000000247BEF1B0, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, 321, v7);
    swift_willThrow();
    return swift_unknownObjectRelease();
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t ASN1IA5String.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BD7D84);
}

uint64_t ASN1IA5String.withUnsafeBytes<A>(_:)()
{
  return sub_247BE5B28();
}

uint64_t sub_247BE5B28()
{
  return sub_247BEC950();
}

uint64_t _s9SwiftASN10B10UTF8StringV4hash4intoys6HasherVz_tF_0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0[2];
  v2 = v0[3] >> 1;
  result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = v0[1];
  result = sub_247BECA58();
  v5 = __OFSUB__(v2, v1);
  v6 = v2 - v1;
  if (!v6)
    return result;
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v7 = v4 + v1;
  do
  {
    ++v7;
    result = sub_247BECA64();
    --v6;
  }
  while (v6);
  return result;
}

uint64_t _s9SwiftASN10B10UTF8StringV9hashValueSivg_0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  v4 = v3 >> 1;
  result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    result = sub_247BECA58();
    v6 = __OFSUB__(v4, v2);
    v7 = v4 - v2;
    if (!v7)
      return sub_247BECA7C();
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      v8 = v1 + v2;
      do
      {
        ++v8;
        sub_247BECA64();
        --v7;
      }
      while (v7);
      return sub_247BECA7C();
    }
  }
  __break(1u);
  return result;
}

void sub_247BE5C48(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 22;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE5C58(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_247BE4D88(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t *))ASN1IA5String.init(derEncoded:withIdentifier:));
}

uint64_t ASN1IA5String.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_247BE5C80(a1, a2, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_247BE6328, a3);
}

uint64_t sub_247BE5C80@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(uint64_t, _QWORD, uint64_t)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v6 = sub_247BE605C(a1, a2);
  swift_bridgeObjectRelease();
  v7 = (2 * *(_QWORD *)(v6 + 16)) | 1;
  result = a3(v6 + 32, 0, v7);
  if ((result & 1) != 0)
  {
    *a4 = v6;
    a4[1] = v6 + 32;
    a4[2] = 0;
    a4[3] = v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ASN1IA5String.init(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_247BE5D2C(a1, a2, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_247BE6328, 0xD00000000000001FLL, 0x8000000247BEF1B0, 354, a3);
}

uint64_t sub_247BE5D2C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(uint64_t, _QWORD, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t *v15;

  v12 = sub_247BE605C(a1, a2);
  swift_bridgeObjectRelease();
  v13 = (2 * *(_QWORD *)(v12 + 16)) | 1;
  result = a3(v12 + 32, 0, v13);
  if ((result & 1) != 0)
  {
    *a7 = v12;
    a7[1] = v12 + 32;
    a7[2] = 0;
    a7[3] = v13;
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidStringRepresentation(reason:file:line:)(a4, a5, (uint64_t)"SwiftASN1/ASN1Strings.swift", 27, 2, a6, v15);
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_247BE5E18@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247BE5E24(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_247BE6328, a2);
}

uint64_t sub_247BE5E24@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD, uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = sub_247BE605C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  v6 = (2 * *(_QWORD *)(v5 + 16)) | 1;
  result = a2(v5 + 32, 0, v6);
  if ((result & 1) != 0)
  {
    *a3 = v5;
    a3[1] = v5 + 32;
    a3[2] = 0;
    a3[3] = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t _sSS9SwiftASN1EySSAA0B10UTF8StringVcfC_0(uint64_t result)
{
  uint64_t v1;

  if (__OFSUB__(*(_QWORD *)(result + 24) >> 1, *(_QWORD *)(result + 16)))
  {
    __break(1u);
  }
  else
  {
    v1 = sub_247BEC788();
    swift_unknownObjectRelease();
    return v1;
  }
  return result;
}

_QWORD *sub_247BE5F04(unsigned int a1)
{
  unsigned int v1;
  unsigned int v2;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  if (a1 > 0x7F)
  {
    v4 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      v5 = (v4 | (a1 >> 6) & 0x3F) << 8;
      v6 = (((v5 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      v1 = (v5 | (a1 >> 12)) + 8487393;
      if (HIWORD(a1))
        v1 = v6;
    }
    else
    {
      v1 = (v4 | (a1 >> 6)) + 33217;
    }
  }
  else
  {
    v1 = a1 + 1;
  }
  v2 = __clz(v1);
  v7 = (v1 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (v2 >> 3))));
  return sub_247BE5FD0(&v7, 4 - (v2 >> 3));
}

_QWORD *sub_247BE5FD0(const void *a1, int64_t a2)
{
  _QWORD *v4;
  size_t v5;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576E98C0);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
}

uint64_t sub_247BE605C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_247BE60F4(v2, 0);
      result = sub_247BEC968();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_247BEC7A0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_247BE60F4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576E98C0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247BE6158(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3;
  unsigned int v4;
  BOOL v5;
  unint64_t v6;

  v3 = a3 >> 1;
  if (a3 >> 1 == a2)
    return 1;
  while (a2 < v3)
  {
    v4 = *(unsigned __int8 *)(result + a2);
    v5 = (v4 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v4 - 58 > 0xFFFFFFF5;
    if (!v5)
    {
      v5 = v4 > 0x3F;
      v6 = (1 << v4) & 0xA400FB8100000000;
      if (v5 || v6 == 0)
        return 0;
    }
    if (v3 == ++a2)
      return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_247BE61CC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t result;
  int64_t v10;
  unsigned int v11;
  BOOL v12;
  unint64_t v13;

  swift_unknownObjectRetain();
  result = swift_unknownObjectRelease();
  *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  v10 = a4 >> 1;
  if (a4 >> 1 != a3)
  {
    while (a3 < v10)
    {
      v11 = *(unsigned __int8 *)(a2 + a3);
      v12 = (v11 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5 || v11 - 58 > 0xFFFFFFF5;
      if (!v12)
      {
        v12 = v11 > 0x3F;
        v13 = (1 << v11) & 0xA400FB8100000000;
        if (v12 || v13 == 0)
        {
          __break(1u);
          break;
        }
      }
      if (v10 == ++a3)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_247BE6284(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t result;
  int64_t v10;
  uint64_t v11;
  char *v12;
  int v13;

  swift_unknownObjectRetain();
  result = swift_unknownObjectRelease();
  *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  v10 = a4 >> 1;
  if (a4 >> 1 != a3)
  {
    if ((uint64_t)(a4 >> 1) <= a3)
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
    if (*(char *)(a2 + a3) < 0)
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    if (a3 + 1 != v10)
    {
      if (a3 + 1 >= v10)
      {
LABEL_13:
        __break(1u);
        return result;
      }
      v11 = ~a3 + v10;
      v12 = (char *)(a2 + a3 + 1);
      while (1)
      {
        v13 = *v12++;
        if (v13 < 0)
          break;
        if (!--v11)
          return result;
      }
      __break(1u);
      goto LABEL_11;
    }
  }
  return result;
}

uint64_t sub_247BE6328(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  int v5;

  v3 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    if ((uint64_t)(a3 >> 1) > a2)
    {
      if (*(char *)(result + a2) < 0)
        return 0;
      if (a2 + 1 == v3)
        return 1;
      v4 = result + 1;
      while (a2 + 1 < v3)
      {
        v5 = *(char *)(v4 + a2);
        result = v5 >= 0;
        if ((v5 & 0x80000000) == 0 && v3 - 2 != a2++)
          continue;
        return result;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  return 1;
}

unint64_t sub_247BE639C()
{
  unint64_t result;

  result = qword_2576E9EE0;
  if (!qword_2576E9EE0)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1UTF8String, &type metadata for ASN1UTF8String);
    atomic_store(result, (unint64_t *)&qword_2576E9EE0);
  }
  return result;
}

unint64_t sub_247BE63E4()
{
  unint64_t result;

  result = qword_2576E9EE8;
  if (!qword_2576E9EE8)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1UTF8String, &type metadata for ASN1UTF8String);
    atomic_store(result, (unint64_t *)&qword_2576E9EE8);
  }
  return result;
}

uint64_t sub_247BE6428()
{
  return MEMORY[0x24BEE0D80];
}

unint64_t sub_247BE6438()
{
  unint64_t result;

  result = qword_2576E9EF0;
  if (!qword_2576E9EF0)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1UTF8String, &type metadata for ASN1UTF8String);
    atomic_store(result, (unint64_t *)&qword_2576E9EF0);
  }
  return result;
}

uint64_t sub_247BE647C()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_247BE6488()
{
  return MEMORY[0x24BEE0D88];
}

unint64_t sub_247BE6498()
{
  unint64_t result;

  result = qword_2576E9EF8;
  if (!qword_2576E9EF8)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1TeletexString, &type metadata for ASN1TeletexString);
    atomic_store(result, (unint64_t *)&qword_2576E9EF8);
  }
  return result;
}

unint64_t sub_247BE64E0()
{
  unint64_t result;

  result = qword_2576E9F00;
  if (!qword_2576E9F00)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1TeletexString, &type metadata for ASN1TeletexString);
    atomic_store(result, (unint64_t *)&qword_2576E9F00);
  }
  return result;
}

unint64_t sub_247BE6528()
{
  unint64_t result;

  result = qword_2576E9F08;
  if (!qword_2576E9F08)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1TeletexString, &type metadata for ASN1TeletexString);
    atomic_store(result, (unint64_t *)&qword_2576E9F08);
  }
  return result;
}

unint64_t sub_247BE6570()
{
  unint64_t result;

  result = qword_2576E9F10;
  if (!qword_2576E9F10)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1PrintableString, &type metadata for ASN1PrintableString);
    atomic_store(result, (unint64_t *)&qword_2576E9F10);
  }
  return result;
}

unint64_t sub_247BE65B8()
{
  unint64_t result;

  result = qword_2576E9F18;
  if (!qword_2576E9F18)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1PrintableString, &type metadata for ASN1PrintableString);
    atomic_store(result, (unint64_t *)&qword_2576E9F18);
  }
  return result;
}

unint64_t sub_247BE6600()
{
  unint64_t result;

  result = qword_2576E9F20;
  if (!qword_2576E9F20)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1PrintableString, &type metadata for ASN1PrintableString);
    atomic_store(result, (unint64_t *)&qword_2576E9F20);
  }
  return result;
}

unint64_t sub_247BE6648()
{
  unint64_t result;

  result = qword_2576E9F28;
  if (!qword_2576E9F28)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1UniversalString, &type metadata for ASN1UniversalString);
    atomic_store(result, (unint64_t *)&qword_2576E9F28);
  }
  return result;
}

unint64_t sub_247BE6690()
{
  unint64_t result;

  result = qword_2576E9F30;
  if (!qword_2576E9F30)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1UniversalString, &type metadata for ASN1UniversalString);
    atomic_store(result, (unint64_t *)&qword_2576E9F30);
  }
  return result;
}

unint64_t sub_247BE66D8()
{
  unint64_t result;

  result = qword_2576E9F38;
  if (!qword_2576E9F38)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1UniversalString, &type metadata for ASN1UniversalString);
    atomic_store(result, (unint64_t *)&qword_2576E9F38);
  }
  return result;
}

unint64_t sub_247BE6720()
{
  unint64_t result;

  result = qword_2576E9F40;
  if (!qword_2576E9F40)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1BMPString, &type metadata for ASN1BMPString);
    atomic_store(result, (unint64_t *)&qword_2576E9F40);
  }
  return result;
}

unint64_t sub_247BE6768()
{
  unint64_t result;

  result = qword_2576E9F48;
  if (!qword_2576E9F48)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1BMPString, &type metadata for ASN1BMPString);
    atomic_store(result, (unint64_t *)&qword_2576E9F48);
  }
  return result;
}

unint64_t sub_247BE67B0()
{
  unint64_t result;

  result = qword_2576E9F50;
  if (!qword_2576E9F50)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1BMPString, &type metadata for ASN1BMPString);
    atomic_store(result, (unint64_t *)&qword_2576E9F50);
  }
  return result;
}

unint64_t sub_247BE67F8()
{
  unint64_t result;

  result = qword_2576E9F58;
  if (!qword_2576E9F58)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1IA5String, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_2576E9F58);
  }
  return result;
}

unint64_t sub_247BE6840()
{
  unint64_t result;

  result = qword_2576E9F60;
  if (!qword_2576E9F60)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1IA5String, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_2576E9F60);
  }
  return result;
}

unint64_t sub_247BE6888()
{
  unint64_t result;

  result = qword_2576E9F68;
  if (!qword_2576E9F68)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1IA5String, &type metadata for ASN1IA5String);
    atomic_store(result, (unint64_t *)&qword_2576E9F68);
  }
  return result;
}

uint64_t sub_247BE68D0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247BE568C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_247BE61CC);
}

uint64_t keypath_getTm@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_247BE6900(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_247BE568C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_247BE6284);
}

uint64_t dispatch thunk of ASN1String.bytes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ASN1String.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

ValueMetadata *type metadata accessor for ASN1UTF8String()
{
  return &type metadata for ASN1UTF8String;
}

ValueMetadata *type metadata accessor for ASN1TeletexString()
{
  return &type metadata for ASN1TeletexString;
}

ValueMetadata *type metadata accessor for ASN1PrintableString()
{
  return &type metadata for ASN1PrintableString;
}

ValueMetadata *type metadata accessor for ASN1UniversalString()
{
  return &type metadata for ASN1UniversalString;
}

ValueMetadata *type metadata accessor for ASN1BMPString()
{
  return &type metadata for ASN1BMPString;
}

ValueMetadata *type metadata accessor for ASN1IA5String()
{
  return &type metadata for ASN1IA5String;
}

uint64_t ASN1OctetString.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  v5 = *(_QWORD *)(result + 16);
  v4 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v6 = *(_QWORD *)(result + 40);
  v8 = *(_QWORD *)(result + 48);
  v9 = *(unsigned __int8 *)(result + 56);
  if (*(_QWORD *)result == *(_QWORD *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      v10 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v10, v4, v7, v6, v8, 1);
      result = swift_unknownObjectRelease();
      *a3 = v5;
      a3[1] = v4;
      a3[2] = v7;
      a3[3] = v6;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1OctetString.swift", 31, 2, 26, v11);
    j__swift_unknownObjectRelease(v5, v4, v7, v6, v8, v9);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t ASN1OctetString.init(contentBytes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ASN1OctetString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BE6DF8);
}

void static ASN1OctetString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 4;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1OctetString.bytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t ASN1OctetString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t (*ASN1OctetString.bytes.modify())()
{
  return nullsub_1;
}

uint64_t sub_247BE6BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  swift_unknownObjectRetain();
  sub_247BE2594(a2, a3, a4, a5);
  return swift_unknownObjectRelease();
}

void sub_247BE6C34(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 4;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE6C44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  char v3;
  uint64_t v5;
  char v6;

  v3 = *((_BYTE *)a2 + 8);
  v5 = *a2;
  v6 = v3;
  return ASN1OctetString.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_247BE6C74(char **a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD55BC(&v4, 0, a1, (uint64_t (*)(char **))sub_247BE6DF8);
}

uint64_t ASN1OctetString.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0[2];
  v2 = v0[3] >> 1;
  result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = v0[1];
  result = sub_247BECA58();
  v5 = __OFSUB__(v2, v1);
  v6 = v2 - v1;
  if (!v6)
    return result;
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v7 = v4 + v1;
  do
  {
    ++v7;
    result = sub_247BECA64();
    --v6;
  }
  while (v6);
  return result;
}

uint64_t static ASN1OctetString.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_247BD43A4(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t ASN1OctetString.hashValue.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  v4 = v3 >> 1;
  result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    result = sub_247BECA58();
    v6 = __OFSUB__(v4, v2);
    v7 = v4 - v2;
    if (!v7)
      return sub_247BECA7C();
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      v8 = v1 + v2;
      do
      {
        ++v8;
        sub_247BECA64();
        --v7;
      }
      while (v7);
      return sub_247BECA7C();
    }
  }
  __break(1u);
  return result;
}

uint64_t ASN1OctetString.withUnsafeBytes<A>(_:)()
{
  return sub_247BEC950();
}

uint64_t sub_247BE6DF8()
{
  return sub_247BE6E64();
}

unint64_t sub_247BE6E10()
{
  unint64_t result;

  result = qword_2576E9F70;
  if (!qword_2576E9F70)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1OctetString, &type metadata for ASN1OctetString);
    atomic_store(result, (unint64_t *)&qword_2576E9F70);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1OctetString()
{
  return &type metadata for ASN1OctetString;
}

uint64_t sub_247BE6E64()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[3];
  v3 = v0[4];
  v2 = v0[5];
  v4 = swift_unknownObjectRetain();
  sub_247BE2594(v4, v1, v3, v2);
  return swift_unknownObjectRelease();
}

void static UTCTime.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 23;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t UTCTime.year.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_247BE6EDC(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.year.setter(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return sub_247BE6FD0();
}

uint64_t sub_247BE6FD0()
{
  uint64_t *v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;

  if ((unint64_t)(*v0 - 1950) > 0x63)
  {
    sub_247BD3D44();
    swift_allocError();
    v10 = v13;
    v8 = 0xD000000000000018;
    v11 = 0x8000000247BEF1F0;
    v12 = 143;
    goto LABEL_11;
  }
  v2 = v0[3];
  v1 = v0[4];
  v3 = v0[5];
  v4 = v0[2];
  result = sub_247BE9800(v0[1], *v0);
  if ((v6 & 1) != 0)
  {
    sub_247BD3D44();
    swift_allocError();
    v8 = 0xD000000000000021;
    v10 = v14;
    v11 = 0x8000000247BEF210;
    v12 = 148;
    goto LABEL_11;
  }
  if (v4 < 1 || result < v4)
  {
    sub_247BD3D44();
    swift_allocError();
    v8 = 0xD000000000000020;
    v10 = v9;
    v11 = 0x8000000247BEF2A0;
    v12 = 152;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v8, v11, (uint64_t)"SwiftASN1/UTCTime.swift", 23, 2, v12, v10);
    return swift_willThrow();
  }
  if (v2 > 0x17)
  {
    sub_247BD3D44();
    swift_allocError();
    v10 = v16;
    v8 = 0xD000000000000018;
    v11 = 0x8000000247BEF240;
    v12 = 156;
    goto LABEL_11;
  }
  if (v1 > 0x3B)
  {
    sub_247BD3D44();
    swift_allocError();
    v8 = 0xD00000000000001ALL;
    v10 = v17;
    v11 = 0x8000000247BEF260;
    v12 = 160;
    goto LABEL_11;
  }
  if (v3 > 0x3D)
  {
    sub_247BD3D44();
    swift_allocError();
    v8 = 0xD00000000000001BLL;
    v10 = v15;
    v11 = 0x8000000247BEF280;
    v12 = 168;
    goto LABEL_11;
  }
  return result;
}

uint64_t (*UTCTime.year.modify(_QWORD *a1))(uint64_t a1)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  return sub_247BE7288;
}

uint64_t sub_247BE7288(uint64_t a1)
{
  **(_QWORD **)(a1 + 8) = *(_QWORD *)a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.month.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_247BE7308(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 8) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.month.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
  return sub_247BE6FD0();
}

uint64_t (*UTCTime.month.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
  a1[1] = v1;
  return sub_247BE73FC;
}

uint64_t sub_247BE73FC(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 8) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.day.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_247BE747C(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.day.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_247BE6FD0();
}

uint64_t (*UTCTime.day.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v1;
  return sub_247BE7588;
}

uint64_t sub_247BE7588(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 16) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.hours.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_247BE7608(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 24) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.hours.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return sub_247BE6FD0();
}

uint64_t (*UTCTime.hours.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  a1[1] = v1;
  return sub_247BE770C;
}

uint64_t sub_247BE770C(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 24) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.minutes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t sub_247BE778C(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 32) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.minutes.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return sub_247BE6FD0();
}

uint64_t (*UTCTime.minutes.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 32);
  a1[1] = v1;
  return sub_247BE7880;
}

uint64_t sub_247BE7880(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 32) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.seconds.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t sub_247BE7900(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 40) = *a1;
  return sub_247BE6FD0();
}

uint64_t UTCTime.seconds.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  return sub_247BE6FD0();
}

uint64_t (*UTCTime.seconds.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 40);
  a1[1] = v1;
  return sub_247BE79F4;
}

uint64_t sub_247BE79F4(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 40) = *a1;
  return sub_247BE6FD0();
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> UTCTime.init(year:month:day:hours:minutes:seconds:)(SwiftASN1::UTCTime *__return_ptr retstr, Swift::Int year, Swift::Int month, Swift::Int day, Swift::Int hours, Swift::Int minutes, Swift::Int seconds)
{
  uint64_t v7;

  sub_247BE6FD0();
  if (!v7)
  {
    retstr->_year = year;
    retstr->_month = month;
    retstr->_day = day;
    retstr->_hours = hours;
    retstr->_minutes = minutes;
    retstr->_seconds = seconds;
  }
}

uint64_t UTCTime.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t *v14;
  _OWORD v15[3];

  v5 = *(_QWORD *)(result + 16);
  v6 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v8 = *(_QWORD *)(result + 40);
  v9 = *(_QWORD *)(result + 48);
  v10 = *(unsigned __int8 *)(result + 56);
  if (*(_QWORD *)result == *(_QWORD *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      v11 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v11, v6, v7, v8, v9, 1);
      swift_unknownObjectRelease();
      sub_247BE8378(v6, v7, v8, (uint64_t *)v15);
      result = j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, 1);
      if (!v3)
      {
        v12 = v15[1];
        v13 = v15[2];
        *a3 = v15[0];
        a3[1] = v12;
        a3[2] = v13;
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/UTCTime.swift", 23, 2, 123, v14);
    j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, v10);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t UTCTime.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = v2[1];
  v9 = *v2;
  v10 = v5;
  v11 = v2[2];
  v7 = v3;
  v8 = v4;
  return sub_247BD55BC(&v7, 0, a1, (uint64_t (*)(char **))sub_247BE8058);
}

uint64_t sub_247BE7CB4(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = a2[1];
  v4[0] = *a2;
  v4[1] = v2;
  v4[2] = a2[2];
  return sub_247BE8674((unint64_t *)v4);
}

uint64_t UTCTime.hash(into:)()
{
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA58();
}

uint64_t UTCTime.hashValue.getter()
{
  sub_247BECA4C();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA7C();
}

void sub_247BE7E0C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 23;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE7E1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  char v3;
  uint64_t v5;
  char v6;

  v3 = *((_BYTE *)a2 + 8);
  v5 = *a2;
  v6 = v3;
  return UTCTime.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_247BE7E4C(char **a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = v2[1];
  v9 = *v2;
  v10 = v5;
  v11 = v2[2];
  v7 = v3;
  v8 = v4;
  return sub_247BD55BC(&v7, 0, a1, (uint64_t (*)(char **))sub_247BE8220);
}

uint64_t sub_247BE7EA8()
{
  sub_247BECA4C();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BE7F48()
{
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA58();
}

uint64_t sub_247BE7FB8()
{
  sub_247BECA4C();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BE8058()
{
  uint64_t v0;
  _OWORD *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(_OWORD **)(v0 + 16);
  v2 = v1[1];
  v4[0] = *v1;
  v4[1] = v2;
  v4[2] = v1[2];
  return sub_247BE8674((unint64_t *)v4);
}

BOOL _s9SwiftASN17UTCTimeV2eeoiySbAC_ACtFZ_0(int64x2_t *a1, int64x2_t *a2)
{
  _BOOL8 result;

  result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*a1, *a2), (int32x4_t)vceqq_s64(a1[1], a2[1]))), 0xFuLL))) & 1) != 0&& a1[2].i64[0] == a2[2].i64[0])
  {
    return a1[2].i64[1] == a2[2].i64[1];
  }
  return result;
}

unint64_t sub_247BE8100()
{
  unint64_t result;

  result = qword_2576E9F78;
  if (!qword_2576E9F78)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for UTCTime, &type metadata for UTCTime);
    atomic_store(result, (unint64_t *)&qword_2576E9F78);
  }
  return result;
}

_QWORD *sub_247BE8144@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_247BE8154@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 8);
  return result;
}

uint64_t sub_247BE8164@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 16);
  return result;
}

uint64_t sub_247BE8174@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 24);
  return result;
}

uint64_t sub_247BE8184@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 32);
  return result;
}

uint64_t sub_247BE8194@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 40);
  return result;
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

uint64_t getEnumTagSinglePayload for UTCTime(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for UTCTime(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UTCTime()
{
  return &type metadata for UTCTime;
}

uint64_t sub_247BE8220()
{
  return sub_247BE8058();
}

uint64_t static ArraySlice<A>.isSigned.getter()
{
  return 0;
}

uint64_t ArraySlice<A>.withBigEndianIntegerBytes<A>(_:)(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1(a3, a4, a5, a6);
}

unint64_t sub_247BE8278()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576E9F80;
  if (!qword_2576E9F80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576E98D0);
    result = MEMORY[0x24958E0B8](MEMORY[0x24BEE2188], v1);
    atomic_store(result, (unint64_t *)&qword_2576E9F80);
  }
  return result;
}

uint64_t sub_247BE82C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD v5[6];

  v5[2] = a3;
  v5[3] = a1;
  v5[4] = a2;
  return ArraySlice<A>.withBigEndianIntegerBytes<A>(_:)(sub_247BE82FC, (uint64_t)v5, *v3, v3[1], v3[2], v3[3]);
}

uint64_t sub_247BE82FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t (*v5)(_QWORD *);
  _QWORD v7[4];

  v7[3] = a4;
  v5 = *(uint64_t (**)(_QWORD *))(v4 + 24);
  v7[0] = a1;
  v7[1] = a2;
  v7[2] = a3;
  return v5(v7);
}

uint64_t sub_247BE8330()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t result;

  v1 = v0[2];
  v2 = v0[3] >> 1;
  if (v1 == v2)
  {
    v3 = 0;
  }
  else
  {
    if (v1 >= v2)
    {
      __break(1u);
      return result;
    }
    v3 = *(unsigned __int8 *)(v0[1] + v1);
    v0[2] = v1 + 1;
  }
  return v3 | ((v1 == v2) << 8);
}

void sub_247BE8378(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v37;

  sub_247BE8AD0();
  if ((v7 & 1) != 0 || (v8 = v6, sub_247BE8AD0(), (v10 & 1) != 0) || (v11 = v9, sub_247BE8AD0(), (v13 & 1) != 0))
  {
    sub_247BD3D44();
    swift_allocError();
    v30 = 0xD00000000000002FLL;
    v29 = v25;
    v31 = 0x8000000247BEF440;
    v32 = 69;
    goto LABEL_19;
  }
  v14 = v12;
  sub_247BE8AD0();
  if ((v16 & 1) != 0 || (v17 = v15, sub_247BE8AD0(), (v19 & 1) != 0) || (v20 = v18, sub_247BE8AD0(), (v22 & 1) != 0))
  {
    sub_247BD3D44();
    swift_allocError();
    v30 = 0xD000000000000035;
    v29 = v26;
    v31 = 0x8000000247BEF470;
    v32 = 77;
    goto LABEL_19;
  }
  v23 = a3 >> 1;
  if (a2 == a3 >> 1)
    goto LABEL_22;
  if (a2 >= (uint64_t)(a3 >> 1))
  {
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  if (*(_BYTE *)(a1 + a2) != 90)
  {
LABEL_22:
    sub_247BD3D44();
    swift_allocError();
    v30 = 0xD00000000000001CLL;
    v29 = v27;
    v31 = 0x8000000247BEF4B0;
    v32 = 82;
    goto LABEL_19;
  }
  if (__OFSUB__(v23, a2 + 1))
    goto LABEL_23;
  if (v23 != a2 + 1)
  {
    sub_247BD3D44();
    swift_allocError();
    v29 = v28;
    v30 = 0xD000000000000019;
    v31 = 0x8000000247BEF4D0;
    v32 = 87;
LABEL_19:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v30, v31, (uint64_t)"SwiftASN1/TimeUtilities.swift", 29, 2, v32, v29);
    swift_unknownObjectRetain();
    swift_willThrow();
    swift_unknownObjectRelease();
    return;
  }
  v24 = 1900;
  if (v8 < 50)
    v24 = 2000;
  v37 = v24 + v8;
  v33 = v21;
  swift_unknownObjectRetain();
  sub_247BE6FD0();
  swift_unknownObjectRelease();
  if (!v4)
  {
    *a4 = v37;
    a4[1] = v11;
    a4[2] = v14;
    a4[3] = v17;
    a4[4] = v20;
    a4[5] = v33;
  }
}

uint64_t sub_247BE8674(unint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;

  v3 = *a1;
  if (*a1 - 2050 < 0xFFFFFFFFFFFFFF9CLL)
  {
    __break(1u);
LABEL_9:
    result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v1 + 16) + 1, 1, (char *)v1);
    v1 = result;
    goto LABEL_5;
  }
  v5 = a1[4];
  v4 = a1[5];
  v7 = a1[2];
  v6 = a1[3];
  v8 = a1[1];
  v9 = -2000;
  if (v3 < 0x7D0)
    v9 = -1900;
  sub_247BE93DC(v3 + v9);
  sub_247BE93DC(v8);
  sub_247BE93DC(v7);
  sub_247BE93DC(v6);
  sub_247BE93DC(v5);
  sub_247BE93DC(v4);
  v1 = *v2;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v12 = *(_QWORD *)(v1 + 16);
  v11 = *(_QWORD *)(v1 + 24);
  if (v12 >= v11 >> 1)
  {
    result = (uint64_t)sub_247BD3F98((char *)(v11 > 1), v12 + 1, 1, (char *)v1);
    v1 = result;
  }
  *(_QWORD *)(v1 + 16) = v12 + 1;
  *(_BYTE *)(v1 + v12 + 32) = 90;
  *v2 = v1;
  return result;
}

void sub_247BE8770(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;

  v5 = v4;
  sub_247BE8AD0();
  if ((v8 & 1) != 0
    || (v9 = v7, sub_247BE8AD0(), (v11 & 1) != 0)
    || (v12 = v10, sub_247BE8AD0(), (v14 & 1) != 0)
    || (v15 = v13, sub_247BE8AD0(), (v17 & 1) != 0))
  {
    sub_247BD3D44();
    swift_allocError();
    v29 = 0xD000000000000037;
    v31 = v30;
    v32 = 0x8000000247BEF2D0;
    v33 = 24;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v29, v32, (uint64_t)"SwiftASN1/TimeUtilities.swift", 29, 2, v33, v31);
    swift_unknownObjectRetain();
    swift_willThrow();
    goto LABEL_12;
  }
  v18 = v16;
  sub_247BE8AD0();
  if ((v20 & 1) != 0 || (v21 = v19, sub_247BE8AD0(), v44 = v22, (v23 & 1) != 0) || (sub_247BE8AD0(), (v25 & 1) != 0))
  {
    sub_247BD3D44();
    swift_allocError();
    v29 = 0xD00000000000003DLL;
    v31 = v34;
    v32 = 0x8000000247BEF330;
    v33 = 33;
    goto LABEL_11;
  }
  v43 = v24;
  v26 = a2;
  v27 = a3 >> 1;
  if (a2 == a3 >> 1)
  {
    swift_unknownObjectRetain();
    v28 = 0;
    goto LABEL_20;
  }
  if (a2 >= (uint64_t)(a3 >> 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  v42 = *(unsigned __int8 *)(a1 + a2);
  swift_unknownObjectRetain();
  v28 = 0;
  if (v42 == 46)
  {
    sub_247BE8B54();
    if (!v5)
    {
      v28 = v35;
      v26 = a2;
      v27 = a3 >> 1;
      goto LABEL_20;
    }
LABEL_12:
    swift_unknownObjectRelease();
    return;
  }
LABEL_20:
  if (v26 == v27)
  {
LABEL_28:
    sub_247BD3D44();
    swift_allocError();
    v39 = 0xD000000000000024;
    v38 = v36;
    v40 = 0x8000000247BEF370;
    v41 = 44;
    goto LABEL_29;
  }
  if (v26 >= v27)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (*(_BYTE *)(a1 + v26) != 90)
    goto LABEL_28;
  if (__OFSUB__(v27, v26 + 1))
  {
LABEL_31:
    __break(1u);
    return;
  }
  if (v27 != v26 + 1)
  {
    sub_247BD3D44();
    swift_allocError();
    v38 = v37;
    v39 = 0xD000000000000021;
    v40 = 0x8000000247BEF3A0;
    v41 = 49;
LABEL_29:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v39, v40, (uint64_t)"SwiftASN1/TimeUtilities.swift", 29, 2, v41, v38);
    swift_willThrow();
    goto LABEL_12;
  }
  sub_247BE9AA8();
  swift_unknownObjectRelease();
  if (!v5)
  {
    *a4 = v12 + 100 * v9;
    a4[1] = v15;
    a4[2] = v18;
    a4[3] = v21;
    a4[4] = v44;
    a4[5] = v43;
    a4[6] = v28;
  }
}

void sub_247BE8AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24) >> 1;
  if (v1 != v2)
  {
    if (v1 < v2)
    {
      *(_QWORD *)(v0 + 16) = v1 + 1;
      sub_247BE8330();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_247BE8B54()
{
  _QWORD *v0;
  uint64_t result;
  unint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  char v22;
  uint64_t *v23;

  result = sub_247BE8330();
  if ((result & 0x100) != 0)
    goto LABEL_32;
  if (result != 46)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    return result;
  }
  v3 = v0[2];
  v2 = v0[3];
  v4 = v2 >> 1;
  if (v3 == v2 >> 1)
    goto LABEL_6;
  if (v3 >= (uint64_t)(v2 >> 1))
    goto LABEL_31;
  v5 = v0[1];
  v6 = *(unsigned __int8 *)(v5 + v3);
  if (v6 - 58 < 0xFFFFFFF6)
  {
LABEL_6:
    sub_247BD3D44();
    swift_allocError();
    v8 = v7;
    v9 = 0xD000000000000024;
    v10 = 0x8000000247BEF3D0;
    v11 = 194;
LABEL_7:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v9, v10, (uint64_t)"SwiftASN1/TimeUtilities.swift", 29, 2, v11, v8);
    return swift_willThrow();
  }
  v12 = 0;
  v13 = v2 & 0xFFFFFFFFFFFFFFFELL;
  v14 = v3 + 1;
  v15 = 1;
  while (1)
  {
    v16 = v6 - 48;
    if (__OFSUB__(v4, v14 - 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if ((uint64_t)v4 <= v14 - 1)
      goto LABEL_27;
    if ((uint64_t)(v2 >> 1) <= v14 - 1)
      goto LABEL_28;
    if (v2 >> 1 < v4)
      goto LABEL_29;
    v17 = v2 & 1;
    v18 = (unsigned __int128)(v12 * (__int128)10) >> 64;
    v19 = 10 * v12;
    v20 = v18 != v19 >> 63;
    result = 10 * v15;
    v21 = __OFADD__(v19, v16);
    v12 = v19 + v16;
    v22 = v21;
    if ((unsigned __int128)(v15 * (__int128)10) >> 64 == result >> 63)
      v15 *= 10;
    v2 = v17 | v13;
    if (v20 || (v22 & 1) != 0)
    {
      v0[2] = v14;
      v0[3] = v2;
      sub_247BD3D44();
      swift_allocError();
      v9 = 0xD000000000000036;
      v8 = v23;
      v10 = 0x8000000247BEF400;
      v11 = 185;
      goto LABEL_7;
    }
    if (v4 == v14)
      break;
    v6 = *(unsigned __int8 *)(v5 + v14++);
    if (v6 - 58 < 0xFFFFFFF6)
    {
      v4 = v14 - 1;
      break;
    }
  }
  v0[2] = v4;
  v0[3] = v2;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v12 + 0x1999999999999998, 1) <= 0x1999999999999998uLL)
    goto LABEL_6;
  return result;
}

uint64_t sub_247BE8D64(uint64_t a1)
{
  unint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  int64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char v23;
  unint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t result;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  char *v37;
  char *v38;

  v2 = *(char **)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  sub_247BE91D4(*(_QWORD *)a1);
  sub_247BE93DC((uint64_t)v2);
  sub_247BE93DC(v3);
  sub_247BE93DC(v4);
  sub_247BE93DC(v5);
  sub_247BE93DC(v6);
  if (v7 == 0.0)
    goto LABEL_46;
  v8 = v7 * 1.0e18;
  if ((~COERCE__INT64(v7 * 1.0e18) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_56;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (v8 < 9.22337204e18)
  {
    v9 = (uint64_t)v8;
    if ((uint64_t)v8 < 1)
    {
      v2 = (char *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      v2 = sub_247BD3F98(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v10 = *((_QWORD *)v2 + 2);
      do
      {
        v11 = *((_QWORD *)v2 + 3);
        if (v10 >= v11 >> 1)
          v2 = sub_247BD3F98((char *)(v11 > 1), v10 + 1, 1, v2);
        *((_QWORD *)v2 + 2) = v10 + 1;
        v2[v10++ + 32] = (v9 % 0xA) | 0x30;
        v12 = v9 > 9;
        v9 /= 0xAuLL;
      }
      while (v12);
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_13;
    goto LABEL_58;
  }
LABEL_57:
  __break(1u);
LABEL_58:
  v2 = sub_247BD3F98(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
LABEL_13:
  v14 = *((_QWORD *)v2 + 2);
  v13 = *((_QWORD *)v2 + 3);
  v15 = v14 + 1;
  if (v14 >= v13 >> 1)
    v2 = sub_247BD3F98((char *)(v13 > 1), v14 + 1, 1, v2);
  v16 = v2 + 32;
  *((_QWORD *)v2 + 2) = v15;
  v2[v14 + 32] = 46;
  v36 = (_QWORD *)v1;
  if (v14)
  {
    v17 = 0;
    do
    {
      v18 = *((_QWORD *)v2 + 2);
      if (v17 >= v18)
      {
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
      if (v14 >= v18)
        goto LABEL_52;
      v19 = v16[v17];
      v16[v17] = v16[v14];
      v16[v14] = v19;
      ++v17;
      --v14;
    }
    while (v17 < (uint64_t)v14);
    v20 = *((_QWORD *)v2 + 2);
    if (v20)
      goto LABEL_23;
  }
  else
  {
    v20 = 1;
LABEL_23:
    if (v16[v20 - 1] == 48)
    {
      v15 = (uint64_t)v2;
      do
      {
        v21 = 0;
        v22 = (char *)MEMORY[0x24BEE4AF8];
        v2 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          while (1)
          {
            if (v21 >= *(_QWORD *)(v15 + 16))
            {
              __break(1u);
              goto LABEL_51;
            }
            v23 = *(_BYTE *)(v15 + 32 + v21);
            v24 = v21 + 1;
            if (*((_QWORD *)v22 + 2))
              break;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v37 = v22;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v1 = (unint64_t)&v37;
              sub_247BE3A04(0, 1, 1);
              v22 = v37;
            }
            v27 = *((_QWORD *)v22 + 2);
            v26 = *((_QWORD *)v22 + 3);
            if (v27 >= v26 >> 1)
            {
              v1 = (unint64_t)&v37;
              sub_247BE3A04((char *)(v26 > 1), v27 + 1, 1);
              v22 = v37;
            }
            *((_QWORD *)v22 + 2) = v27 + 1;
            v22[v27 + 32] = v23;
            v21 = v24;
            if (v20 == v24)
              goto LABEL_43;
          }
          v1 = v22[32];
          v28 = swift_isUniquelyReferenced_nonNull_native();
          v38 = v2;
          if ((v28 & 1) == 0)
          {
            sub_247BE3A04(0, *((_QWORD *)v2 + 2) + 1, 1);
            v2 = v38;
          }
          v30 = *((_QWORD *)v2 + 2);
          v29 = *((_QWORD *)v2 + 3);
          v31 = v30 + 1;
          if (v30 >= v29 >> 1)
          {
            sub_247BE3A04((char *)(v29 > 1), v30 + 1, 1);
            v31 = v30 + 1;
            v1 = v1;
            v2 = v38;
          }
          *((_QWORD *)v2 + 2) = v31;
          v2[v30 + 32] = v1;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v22 = sub_247BE97EC((uint64_t)v22);
          if (!*((_QWORD *)v22 + 2))
            goto LABEL_53;
          v22[32] = v23;
        }
        while (v20 - 1 != v21++);
LABEL_43:
        swift_bridgeObjectRelease();
        swift_release();
        v20 = *((_QWORD *)v2 + 2);
        if (!v20)
          break;
        v15 = (uint64_t)v2;
      }
      while (v2[v20 + 31] == 48);
    }
  }
  v1 = (unint64_t)v36;
  sub_247BDFAB0((uint64_t)v2);
LABEL_46:
  v15 = *(_QWORD *)v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
LABEL_54:
    result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v15 + 16) + 1, 1, (char *)v15);
    v15 = result;
  }
  v35 = *(_QWORD *)(v15 + 16);
  v34 = *(_QWORD *)(v15 + 24);
  if (v35 >= v34 >> 1)
  {
    result = (uint64_t)sub_247BD3F98((char *)(v34 > 1), v35 + 1, 1, (char *)v15);
    v15 = result;
  }
  *(_QWORD *)(v15 + 16) = v35 + 1;
  *(_BYTE *)(v15 + v35 + 32) = 90;
  *(_QWORD *)v1 = v15;
  return result;
}

uint64_t sub_247BE91D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v3 + 16) + 1, 1, (char *)v3);
    v3 = result;
  }
  v6 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  v7 = v5 >> 1;
  v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    v3 = result;
    v5 = *(_QWORD *)(result + 24);
    v7 = v5 >> 1;
  }
  v9 = (unsigned __int128)(a1 / 1000 * (__int128)0x6666666666666667) >> 64;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + v6 + 32) = a1 / 1000 - 10 * ((v9 < 0) + (v9 >> 2)) + 48;
  v10 = v6 + 2;
  if (v7 < (uint64_t)(v6 + 2))
  {
    result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v6 + 2, 1, (char *)v3);
    v3 = result;
    v5 = *(_QWORD *)(result + 24);
    v7 = v5 >> 1;
  }
  v11 = (unsigned __int128)(a1 / 100 * (__int128)0x6666666666666667) >> 64;
  *(_QWORD *)(v3 + 16) = v10;
  *(_BYTE *)(v3 + v8 + 32) = a1 / 100 - 10 * ((v11 < 0) + (v11 >> 2)) + 48;
  v12 = v6 + 3;
  if (v7 < (uint64_t)(v6 + 3))
  {
    result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v6 + 3, 1, (char *)v3);
    v3 = result;
    v5 = *(_QWORD *)(result + 24);
    v7 = v5 >> 1;
  }
  v13 = (unsigned __int128)(a1 / 10 * (__int128)0x6666666666666667) >> 64;
  *(_QWORD *)(v3 + 16) = v12;
  *(_BYTE *)(v3 + v10 + 32) = a1 / 10 - 10 * ((v13 < 0) + (v13 >> 2)) + 48;
  if (v7 < (uint64_t)(v6 + 4))
  {
    result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v6 + 4, 1, (char *)v3);
    v3 = result;
  }
  *(_QWORD *)(v3 + 16) = v6 + 4;
  *(_BYTE *)(v3 + v12 + 32) = a1 % 10 + 48;
  *v1 = v3;
  return result;
}

uint64_t sub_247BE93DC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  int64_t v10;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v3 + 16) + 1, 1, (char *)v3);
    v3 = result;
  }
  v6 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  v7 = v5 >> 1;
  v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    v3 = result;
    v5 = *(_QWORD *)(result + 24);
    v7 = v5 >> 1;
  }
  v9 = (unsigned __int128)(a1 / 10 * (__int128)0x6666666666666667) >> 64;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + v6 + 32) = a1 / 10 - 10 * ((v9 < 0) + (v9 >> 2)) + 48;
  v10 = v6 + 2;
  if (v7 < v10)
  {
    result = (uint64_t)sub_247BD3F98((char *)(v5 > 1), v10, 1, (char *)v3);
    v3 = result;
  }
  *(_QWORD *)(v3 + 16) = v10;
  *(_BYTE *)(v3 + v8 + 32) = a1 % 10 + 48;
  *v1 = v3;
  return result;
}

char *sub_247BE94F8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576E9FC0);
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

char *sub_247BE95F8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576E98B8);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_release();
  return v10;
}

char *sub_247BE96F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576E98C0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_247BE97D8(uint64_t a1)
{
  return sub_247BE95F8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_247BE97EC(uint64_t a1)
{
  return sub_247BE96F0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247BE9800(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  BOOL v4;

  v2 = a1 - 1;
  result = 31;
  switch(v2)
  {
    case 0:
    case 2:
    case 4:
    case 6:
    case 7:
    case 9:
    case 11:
      return result;
    case 1:
      if ((a2 & 3) == 0
        && (__ROR8__(0x8F5C28F5C28F5C29 * a2 + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL
          ? (v4 = a2 % 400 == 0)
          : (v4 = 1),
            v4))
      {
        result = 29;
      }
      else
      {
        result = 28;
      }
      break;
    case 3:
    case 5:
    case 8:
    case 10:
      result = 30;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> GeneralizedTime.init(year:month:day:hours:minutes:seconds:fractionalSeconds:)(SwiftASN1::GeneralizedTime *__return_ptr retstr, Swift::Int year, Swift::Int month, Swift::Int day, Swift::Int hours, Swift::Int minutes, Swift::Int seconds, Swift::Double fractionalSeconds)
{
  uint64_t v8;

  sub_247BE9AA8();
  if (!v8)
  {
    retstr->_year = year;
    retstr->_month = month;
    retstr->_day = day;
    retstr->_hours = hours;
    retstr->_minutes = minutes;
    retstr->_seconds = seconds;
    retstr->_fractionalSeconds = fractionalSeconds;
  }
}

uint64_t GeneralizedTime.year.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t GeneralizedTime.month.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t GeneralizedTime.day.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t GeneralizedTime.hours.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t GeneralizedTime.minutes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t GeneralizedTime.seconds.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

double GeneralizedTime.fractionalSeconds.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

void static GeneralizedTime.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 24;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BE99AC(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return sub_247BE9AA8();
}

uint64_t GeneralizedTime.year.setter(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return sub_247BE9AA8();
}

uint64_t sub_247BE9AA8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t result;
  char v12;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;

  if (*(_QWORD *)v0 >> 4 > 0x270uLL)
  {
    sub_247BD3D44();
    swift_allocError();
    v2 = v1;
    v3 = 0xD000000000000020;
    v4 = 0x8000000247BEF620;
    v5 = 153;
LABEL_11:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v3, v4, (uint64_t)"SwiftASN1/GeneralizedTime.swift", 31, 2, v5, v2);
    return swift_willThrow();
  }
  v7 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v8 = *(_QWORD *)(v0 + 40);
  v9 = *(double *)(v0 + 48);
  v10 = *(_QWORD *)(v0 + 16);
  result = sub_247BE9800(*(_QWORD *)(v0 + 8), *(_QWORD *)v0);
  if ((v12 & 1) != 0)
  {
    sub_247BD3D44();
    swift_allocError();
    v3 = 0xD000000000000029;
    v2 = v15;
    v4 = 0x8000000247BEF510;
    v5 = 158;
    goto LABEL_11;
  }
  if (v10 < 1 || result < v10)
  {
    sub_247BD3D44();
    swift_allocError();
    v3 = 0xD000000000000028;
    v2 = v14;
    v4 = 0x8000000247BEF5F0;
    v5 = 162;
    goto LABEL_11;
  }
  if (v7 > 0x17)
  {
    sub_247BD3D44();
    swift_allocError();
    v2 = v17;
    v3 = 0xD000000000000020;
    v4 = 0x8000000247BEF540;
    v5 = 166;
    goto LABEL_11;
  }
  if (v6 > 0x3B)
  {
    sub_247BD3D44();
    swift_allocError();
    v3 = 0xD000000000000022;
    v2 = v18;
    v4 = 0x8000000247BEF570;
    v5 = 170;
    goto LABEL_11;
  }
  if (v8 > 0x3D)
  {
    sub_247BD3D44();
    swift_allocError();
    v3 = 0xD00000000000001FLL;
    v2 = v16;
    v4 = 0x8000000247BEF5D0;
    v5 = 178;
    goto LABEL_11;
  }
  if (v9 < 0.0 || v9 >= 1.0)
  {
    sub_247BD3D44();
    swift_allocError();
    v3 = 0xD00000000000002ELL;
    v2 = v19;
    v4 = 0x8000000247BEF5A0;
    v5 = 183;
    goto LABEL_11;
  }
  return result;
}

uint64_t (*GeneralizedTime.year.modify(_QWORD *a1))(uint64_t a1)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  return sub_247BE9DE0;
}

uint64_t sub_247BE9DE0(uint64_t a1)
{
  **(_QWORD **)(a1 + 8) = *(_QWORD *)a1;
  return sub_247BE9AA8();
}

uint64_t sub_247BE9E60(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 8) = *a1;
  return sub_247BE9AA8();
}

uint64_t GeneralizedTime.month.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
  return sub_247BE9AA8();
}

uint64_t (*GeneralizedTime.month.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
  a1[1] = v1;
  return sub_247BE9F6C;
}

uint64_t sub_247BE9F6C(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 8) = *a1;
  return sub_247BE9AA8();
}

uint64_t sub_247BE9FEC(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 16) = *a1;
  return sub_247BE9AA8();
}

uint64_t GeneralizedTime.day.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_247BE9AA8();
}

uint64_t (*GeneralizedTime.day.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v1;
  return sub_247BEA108;
}

uint64_t sub_247BEA108(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 16) = *a1;
  return sub_247BE9AA8();
}

uint64_t sub_247BEA188(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 24) = *a1;
  return sub_247BE9AA8();
}

uint64_t GeneralizedTime.hours.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return sub_247BE9AA8();
}

uint64_t (*GeneralizedTime.hours.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  a1[1] = v1;
  return sub_247BEA29C;
}

uint64_t sub_247BEA29C(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 24) = *a1;
  return sub_247BE9AA8();
}

uint64_t sub_247BEA31C(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 32) = *a1;
  return sub_247BE9AA8();
}

uint64_t GeneralizedTime.minutes.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return sub_247BE9AA8();
}

uint64_t (*GeneralizedTime.minutes.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 32);
  a1[1] = v1;
  return sub_247BEA420;
}

uint64_t sub_247BEA420(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 32) = *a1;
  return sub_247BE9AA8();
}

uint64_t sub_247BEA4A0(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 40) = *a1;
  return sub_247BE9AA8();
}

uint64_t GeneralizedTime.seconds.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  return sub_247BE9AA8();
}

uint64_t (*GeneralizedTime.seconds.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 40);
  a1[1] = v1;
  return sub_247BEA5A4;
}

uint64_t sub_247BEA5A4(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 40) = *a1;
  return sub_247BE9AA8();
}

uint64_t sub_247BEA624(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 48) = *a1;
  return sub_247BE9AA8();
}

uint64_t GeneralizedTime.fractionalSeconds.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 48) = a1;
  return sub_247BE9AA8();
}

uint64_t (*GeneralizedTime.fractionalSeconds.modify(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = *(_QWORD *)(v1 + 48);
  return sub_247BEA724;
}

uint64_t sub_247BEA724(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + 48) = *a1;
  return sub_247BE9AA8();
}

uint64_t GeneralizedTime.init(derEncoded:withIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t *v15;
  _OWORD v16[3];
  uint64_t v17;

  v5 = *(_QWORD *)(result + 16);
  v6 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v8 = *(_QWORD *)(result + 40);
  v9 = *(_QWORD *)(result + 48);
  v10 = *(unsigned __int8 *)(result + 56);
  if (*(_QWORD *)result == *(_QWORD *)a2 && *(unsigned __int8 *)(result + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*(_BYTE *)(result + 56))
    {
      v11 = swift_unknownObjectRetain();
      j__swift_unknownObjectRelease(v11, v6, v7, v8, v9, 1);
      swift_unknownObjectRelease();
      sub_247BE8770(v6, v7, v8, v16);
      result = j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, 1);
      if (!v3)
      {
        v12 = v17;
        v13 = v16[1];
        v14 = v16[2];
        *(_OWORD *)a3 = v16[0];
        *(_OWORD *)(a3 + 16) = v13;
        *(_OWORD *)(a3 + 32) = v14;
        *(_QWORD *)(a3 + 48) = v12;
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/GeneralizedTime.swift", 31, 2, 134, v15);
    j__swift_unknownObjectRelease(v5, v6, v7, v8, v9, v10);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t GeneralizedTime.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = v2[1];
  v9 = *v2;
  v10 = v5;
  v11 = v2[2];
  v12 = *((_QWORD *)v2 + 6);
  v7 = v3;
  v8 = v4;
  return sub_247BD55BC(&v7, 0, a1, (uint64_t (*)(char **))sub_247BEAC68);
}

uint64_t sub_247BEA984(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  _OWORD v4[3];
  uint64_t v5;

  v2 = *(_OWORD *)(a2 + 16);
  v4[0] = *(_OWORD *)a2;
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  return sub_247BE8D64((uint64_t)v4);
}

uint64_t GeneralizedTime.hash(into:)()
{
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA70();
}

uint64_t GeneralizedTime.hashValue.getter()
{
  sub_247BECA4C();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA70();
  return sub_247BECA7C();
}

void sub_247BEAB08(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 24;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BEAB18@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  char v3;
  uint64_t v5;
  char v6;

  v3 = *((_BYTE *)a2 + 8);
  v5 = *a2;
  v6 = v3;
  return GeneralizedTime.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v5, a3);
}

uint64_t sub_247BEAB48(char **a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = v2[1];
  v9 = *v2;
  v10 = v5;
  v11 = v2[2];
  v12 = *((_QWORD *)v2 + 6);
  v7 = v3;
  v8 = v4;
  return sub_247BD55BC(&v7, 0, a1, (uint64_t (*)(char **))sub_247BEAE64);
}

uint64_t sub_247BEABB4()
{
  sub_247BECA4C();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA58();
  sub_247BECA70();
  return sub_247BECA7C();
}

uint64_t sub_247BEAC68()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _OWORD v4[3];
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  v4[2] = *(_OWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 48);
  return sub_247BE8D64((uint64_t)v4);
}

BOOL _s9SwiftASN115GeneralizedTimeV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)a1, *(int64x2_t *)a2), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 16), *(int64x2_t *)(a2 + 16)))), 0xFuLL))) & 1) != 0&& *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32)&& *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40))
  {
    return *(double *)(a1 + 48) == *(double *)(a2 + 48);
  }
  return result;
}

unint64_t sub_247BEAD2C()
{
  unint64_t result;

  result = qword_2576E9FC8;
  if (!qword_2576E9FC8)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for GeneralizedTime, &type metadata for GeneralizedTime);
    atomic_store(result, (unint64_t *)&qword_2576E9FC8);
  }
  return result;
}

_QWORD *sub_247BEAD70@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_247BEAD80@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 8);
  return result;
}

uint64_t sub_247BEAD90@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 16);
  return result;
}

uint64_t sub_247BEADA0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 24);
  return result;
}

uint64_t sub_247BEADB0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 32);
  return result;
}

uint64_t sub_247BEADC0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 40);
  return result;
}

double sub_247BEADD0@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result;

  result = *(double *)(a1 + 48);
  *a2 = result;
  return result;
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

uint64_t getEnumTagSinglePayload for GeneralizedTime(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for GeneralizedTime(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GeneralizedTime()
{
  return &type metadata for GeneralizedTime;
}

uint64_t sub_247BEAE64()
{
  return sub_247BEAC68();
}

void static ASN1Null.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 5;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1Null.init(derEncoded:withIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v10;
  uint64_t *v11;

  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  if (*(_QWORD *)a1 == *(_QWORD *)a2
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8)
    && *(_BYTE *)(a1 + 56))
  {
    v8 = swift_unknownObjectRetain();
    j__swift_unknownObjectRelease(v8, v2, v5, v4, v6, 1);
    result = swift_unknownObjectRelease();
    if (__OFSUB__(v4 >> 1, v5))
    {
      __break(1u);
    }
    else
    {
      if (v4 >> 1 != v5)
      {
        sub_247BD3D44();
        swift_allocError();
        static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000026, 0x8000000247BEF670, (uint64_t)"SwiftASN1/ASN1Null.swift", 24, 2, 30, v10);
        swift_willThrow();
      }
      return j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, 1);
    }
  }
  else
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1Null.swift", 24, 2, 26, v11);
    j__swift_unknownObjectRelease(v3, v2, v5, v4, v6, v7);
    swift_unknownObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t ASN1Null.serialize(into:withIdentifier:)(uint64_t *a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD0A44(&v4, 0, a1);
}

uint64_t static ASN1Null.== infix(_:_:)()
{
  return 1;
}

uint64_t ASN1Null.hashValue.getter()
{
  sub_247BECA4C();
  return sub_247BECA7C();
}

void sub_247BEB0A8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 5;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BEB0B8(uint64_t a1, uint64_t *a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *((_BYTE *)a2 + 8);
  v4 = *a2;
  v5 = v2;
  return ASN1Null.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v4);
}

uint64_t sub_247BEB0E8(uint64_t *a1, uint64_t a2)
{
  char v2;
  uint64_t v4;
  char v5;

  v2 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = v2;
  return sub_247BD0A44(&v4, 0, a1);
}

uint64_t sub_247BEB120()
{
  sub_247BECA4C();
  return sub_247BECA7C();
}

uint64_t sub_247BEB154()
{
  sub_247BECA4C();
  return sub_247BECA7C();
}

unint64_t sub_247BEB188()
{
  unint64_t result;

  result = qword_2576E9FD0;
  if (!qword_2576E9FD0)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Null, &type metadata for ASN1Null);
    atomic_store(result, (unint64_t *)&qword_2576E9FD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Null()
{
  return &type metadata for ASN1Null;
}

void static ASN1BitString.defaultIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 3;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1BitString.bytes.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_247BEB224(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  sub_247BEB360();
  return swift_unknownObjectRelease();
}

uint64_t ASN1BitString.bytes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  sub_247BEB360();
  return swift_unknownObjectRelease();
}

void sub_247BEB360()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t *v14;

  v1 = v0[2];
  v2 = v0[4];
  v3 = v0[3] >> 1;
  if (v1 == v3)
  {
    if (!v2)
      return;
    sub_247BD3D44();
    swift_allocError();
    v5 = v4;
    v6 = 0xD000000000000030;
    v7 = 0x8000000247BEF750;
    v8 = 93;
    goto LABEL_16;
  }
  if (v3 <= v1)
  {
    __break(1u);
    return;
  }
  v9 = *(unsigned __int8 *)(v3 + v0[1] - 1);
  v10 = v2 - 9;
  v11 = -1 << v2;
  if ((unint64_t)v2 >= 8)
    v11 = 0;
  v12 = 0xFFu >> -(char)v2;
  if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF8)
    v12 = 0;
  if (v2 < 0)
    v13 = v12;
  else
    v13 = v11;
  if (v10 < 0xFFFFFFFFFFFFFFEFLL)
    v13 = 0;
  if ((v9 & ~v13) != 0)
  {
    sub_247BD3D44();
    swift_allocError();
    v6 = 0xD00000000000003CLL;
    v5 = v14;
    v7 = 0x8000000247BEF710;
    v8 = 104;
LABEL_16:
    static ASN1Error.invalidASN1Object(reason:file:line:)(v6, v7, (uint64_t)"SwiftASN1/ASN1BitString.swift", 29, 2, v8, v5);
    swift_willThrow();
  }
}

void (*ASN1BitString.bytes.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_247BEB4C0;
}

void sub_247BEB4C0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    sub_247BEB360();
}

uint64_t ASN1BitString.paddingBits.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

void sub_247BEB538(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;

  v2 = *a1;
  *(_QWORD *)(a2 + 32) = *a1;
  if (v2 > 7)
  {
    __break(1u);
    swift_unexpectedError();
    __break(1u);
  }
  else
  {
    sub_247BEB360();
  }
}

void ASN1BitString.paddingBits.setter(unint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  if (a1 > 7)
  {
    __break(1u);
    swift_unexpectedError();
    __break(1u);
  }
  else
  {
    sub_247BEB360();
  }
}

void (*ASN1BitString.paddingBits.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_247BEB638;
}

void sub_247BEB638(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (*(_QWORD *)(*(_QWORD *)a1 + 32) > 7uLL)
    {
      __break(1u);
      swift_unexpectedError();
      __break(1u);
    }
    else
    {
      sub_247BEB360();
    }
  }
}

void ASN1BitString.init(derEncoded:withIdentifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t *v14;

  v6 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(unsigned __int8 *)(a1 + 56);
  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8))
  {
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.unexpectedFieldType(_:file:line:)((uint64_t)"SwiftASN1/ASN1BitString.swift", 29, 2, 53, v13);
    j__swift_unknownObjectRelease(v6, v5, v8, v7, v9, v10);
    swift_unknownObjectRelease();
    swift_willThrow();
    return;
  }
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_15;
  v11 = swift_unknownObjectRetain();
  j__swift_unknownObjectRelease(v11, v5, v8, v7, v9, 1);
  swift_unknownObjectRelease();
  if (v8 == v7 >> 1)
    goto LABEL_12;
  if (v8 < (uint64_t)(v7 >> 1))
  {
    v12 = *(unsigned __int8 *)(v5 + v8);
    if (v12 <= 7)
    {
      if (__OFSUB__(v7 >> 1, v8))
        goto LABEL_14;
      sub_247BEB360();
      if (!v3)
      {
        *a3 = v6;
        a3[1] = v5;
        a3[2] = v8 + 1;
        a3[3] = v7;
        a3[4] = v12;
        return;
      }
LABEL_13:
      j__swift_unknownObjectRelease(v6, v5, v8, v7, v9, 1);
      return;
    }
LABEL_12:
    sub_247BD3D44();
    swift_allocError();
    static ASN1Error.invalidASN1Object(reason:file:line:)(0xD000000000000044, 0x8000000247BEF6C0, (uint64_t)"SwiftASN1/ASN1BitString.swift", 29, 2, 62, v14);
    swift_willThrow();
    goto LABEL_13;
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
}

uint64_t ASN1BitString.init(bytes:paddingBits:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t result;

  swift_unknownObjectRetain();
  sub_247BEB360();
  result = swift_unknownObjectRelease();
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t ASN1BitString.serialize(into:withIdentifier:)(char **a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = v2[1];
  v9 = *v2;
  v10 = v5;
  v11 = *((_QWORD *)v2 + 4);
  v7 = v3;
  v8 = v4;
  return sub_247BD55BC(&v7, 0, a1, sub_247BD782C);
}

uint64_t sub_247BEB9BC(char **a1, uint64_t *a2)
{
  char *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_247BD3F98(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
  v6 = *((_QWORD *)v4 + 2);
  v5 = *((_QWORD *)v4 + 3);
  if (v6 >= v5 >> 1)
    v4 = sub_247BD3F98((char *)(v5 > 1), v6 + 1, 1, v4);
  v7 = a2[4];
  *((_QWORD *)v4 + 2) = v6 + 1;
  v4[v6 + 32] = v7;
  *a1 = v4;
  v8 = *a2;
  v9 = a2[1];
  v10 = a2[2];
  v11 = a2[3];
  sub_247BD3E64((uint64_t)a2);
  sub_247BE2594(v8, v9, v10, v11);
  return sub_247BD79DC((uint64_t)a2);
}

void sub_247BEBA9C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 3;
  *(_BYTE *)(a1 + 8) = 0;
}

void sub_247BEBAAC(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  char v3;
  uint64_t v4;
  char v5;

  v3 = *((_BYTE *)a2 + 8);
  v4 = *a2;
  v5 = v3;
  ASN1BitString.init(derEncoded:withIdentifier:)(a1, (uint64_t)&v4, a3);
}

uint64_t sub_247BEBADC(char **a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v3;
  char v4;
  __int128 v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = v2[1];
  v9 = *v2;
  v10 = v5;
  v11 = *((_QWORD *)v2 + 4);
  v7 = v3;
  v8 = v4;
  return sub_247BD55BC(&v7, 0, a1, sub_247BEBE0C);
}

uint64_t ASN1BitString.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0[2];
  v2 = v0[3] >> 1;
  result = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v4 = v0[1];
    result = sub_247BECA58();
    v5 = __OFSUB__(v2, v1);
    v6 = v2 - v1;
    if (!v6)
      return sub_247BECA58();
    if (!((v6 < 0) ^ v5 | (v6 == 0)))
    {
      v7 = v4 + v1;
      do
      {
        ++v7;
        sub_247BECA64();
        --v6;
      }
      while (v6);
      return sub_247BECA58();
    }
  }
  __break(1u);
  return result;
}

uint64_t static ASN1BitString.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a2[4];
  return sub_247BD43A4(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1BitString.hashValue.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  v4 = v3 >> 1;
  result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    result = sub_247BECA58();
    v6 = __OFSUB__(v4, v2);
    v7 = v4 - v2;
    if (!v7)
    {
LABEL_6:
      sub_247BECA58();
      return sub_247BECA7C();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      v8 = v1 + v2;
      do
      {
        ++v8;
        sub_247BECA64();
        --v7;
      }
      while (v7);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247BEBC94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  sub_247BECA4C();
  v4 = v3 >> 1;
  result = v4 - v2;
  if (__OFSUB__(v4, v2))
  {
    __break(1u);
  }
  else
  {
    result = sub_247BECA58();
    v6 = __OFSUB__(v4, v2);
    v7 = v4 - v2;
    if (!v7)
    {
LABEL_6:
      sub_247BECA58();
      return sub_247BECA7C();
    }
    if (!((v7 < 0) ^ v6 | (v7 == 0)))
    {
      v8 = v1 + v2;
      do
      {
        ++v8;
        sub_247BECA64();
        --v7;
      }
      while (v7);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247BEBD28(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a2[4];
  return sub_247BD43A4(a1[1], a1[2], a1[3], a2[1], a2[2], a2[3]) & (v2 == v3);
}

uint64_t ASN1BitString.withUnsafeBytes<A>(_:)()
{
  return sub_247BEC950();
}

unint64_t sub_247BEBD94()
{
  unint64_t result;

  result = qword_2576E9FD8;
  if (!qword_2576E9FD8)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1BitString, &type metadata for ASN1BitString);
    atomic_store(result, (unint64_t *)&qword_2576E9FD8);
  }
  return result;
}

uint64_t sub_247BEBDD8@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_247BEBDEC@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(result + 32);
  return result;
}

ValueMetadata *type metadata accessor for ASN1BitString()
{
  return &type metadata for ASN1BitString;
}

uint64_t sub_247BEBE0C(char **a1)
{
  return sub_247BD782C(a1);
}

BOOL static ASN1Identifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a1 == *(_QWORD *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

SwiftASN1::ASN1Identifier __swiftcall ASN1Identifier.init(tagWithNumber:tagClass:)(Swift::UInt tagWithNumber, SwiftASN1::ASN1Identifier::TagClass tagClass)
{
  uint64_t v2;
  char v3;
  SwiftASN1::ASN1Identifier result;

  v3 = *(_BYTE *)tagClass;
  *(_QWORD *)v2 = tagWithNumber;
  *(_BYTE *)(v2 + 8) = v3;
  result.tagNumber = tagWithNumber;
  result.tagClass = tagClass;
  return result;
}

void static ASN1Identifier.sequence.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 16;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.set.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 17;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t sub_247BEBE7C(uint64_t a1, char a2)
{
  char **v2;
  unint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  char v10;
  char *v11;
  char v12;
  unint64_t v13;
  unint64_t v14;

  v3 = *(_QWORD *)a1;
  v4 = *(_BYTE *)(a1 + 8) << 6;
  if (*(_QWORD *)a1 > 0x1EuLL)
  {
    if ((a2 & 1) != 0)
      v10 = 63;
    else
      v10 = 31;
    v11 = *v2;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_247BD3F98(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v12 = v4 | v10;
    v14 = *((_QWORD *)v11 + 2);
    v13 = *((_QWORD *)v11 + 3);
    if (v14 >= v13 >> 1)
      v11 = sub_247BD3F98((char *)(v13 > 1), v14 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v14 + 1;
    v11[v14 + 32] = v12;
    *v2 = v11;
    return sub_247BE2D60(v3);
  }
  else
  {
    if ((a2 & 1) != 0)
      v5 = v4 | v3 | 0x20;
    else
      v5 = v4 | v3;
    v6 = (uint64_t)*v2;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_247BD3F98(0, *(_QWORD *)(v6 + 16) + 1, 1, (char *)v6);
      v6 = result;
    }
    v9 = *(_QWORD *)(v6 + 16);
    v8 = *(_QWORD *)(v6 + 24);
    if (v9 >= v8 >> 1)
    {
      result = (uint64_t)sub_247BD3F98((char *)(v8 > 1), v9 + 1, 1, (char *)v6);
      v6 = result;
    }
    *(_QWORD *)(v6 + 16) = v9 + 1;
    *(_BYTE *)(v6 + v9 + 32) = v5;
    *v2 = (char *)v6;
  }
  return result;
}

uint64_t ASN1Identifier.tagNumber.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ASN1Identifier.tagNumber.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ASN1Identifier.tagNumber.modify())()
{
  return nullsub_1;
}

void ASN1Identifier.tagClass.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

_BYTE *ASN1Identifier.tagClass.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = *result;
  return result;
}

uint64_t (*ASN1Identifier.tagClass.modify())()
{
  return nullsub_1;
}

BOOL static ASN1Identifier.TagClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ASN1Identifier.TagClass.hash(into:)()
{
  return sub_247BECA58();
}

uint64_t ASN1Identifier.TagClass.hashValue.getter()
{
  sub_247BECA4C();
  sub_247BECA58();
  return sub_247BECA7C();
}

void static ASN1Identifier.objectIdentifier.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 6;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.bitString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 3;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.octetString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 4;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.integer.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 2;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.null.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 5;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.BOOLean.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 1;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.enumerated.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 10;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.utf8String.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 12;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.numericString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 18;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.printableString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 19;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.teletexString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 20;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.videotexString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 21;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.ia5String.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 22;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.graphicString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 25;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.visibleString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 26;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.generalString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 27;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.universalString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 28;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.bmpString.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 30;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.generalizedTime.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 24;
  *(_BYTE *)(a1 + 8) = 0;
}

void static ASN1Identifier.utcTime.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 23;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t ASN1Identifier.hash(into:)()
{
  sub_247BECA58();
  return sub_247BECA58();
}

uint64_t ASN1Identifier.hashValue.getter()
{
  sub_247BECA4C();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BEC274()
{
  sub_247BECA4C();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA7C();
}

uint64_t sub_247BEC2D0()
{
  sub_247BECA58();
  return sub_247BECA58();
}

uint64_t sub_247BEC30C()
{
  sub_247BECA4C();
  sub_247BECA58();
  sub_247BECA58();
  return sub_247BECA7C();
}

BOOL sub_247BEC364(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a1 == *(_QWORD *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

uint64_t ASN1Identifier.description.getter()
{
  sub_247BEC95C();
  sub_247BEC794();
  sub_247BEC9EC();
  sub_247BEC794();
  swift_bridgeObjectRelease();
  sub_247BEC794();
  sub_247BEC9B0();
  sub_247BEC794();
  return 0;
}

unint64_t sub_247BEC490()
{
  unint64_t result;

  result = qword_2576E9FE0;
  if (!qword_2576E9FE0)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Identifier.TagClass, &type metadata for ASN1Identifier.TagClass);
    atomic_store(result, (unint64_t *)&qword_2576E9FE0);
  }
  return result;
}

unint64_t sub_247BEC4D8()
{
  unint64_t result;

  result = qword_2576E9FE8;
  if (!qword_2576E9FE8)
  {
    result = MEMORY[0x24958E0B8](&protocol conformance descriptor for ASN1Identifier, &type metadata for ASN1Identifier);
    atomic_store(result, (unint64_t *)&qword_2576E9FE8);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ASN1Identifier(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ASN1Identifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASN1Identifier()
{
  return &type metadata for ASN1Identifier;
}

uint64_t getEnumTagSinglePayload for ASN1Identifier.TagClass(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ASN1Identifier.TagClass(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247BEC6A8 + 4 * byte_247BEE975[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_247BEC6DC + 4 * asc_247BEE970[v4]))();
}

uint64_t sub_247BEC6DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247BEC6E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247BEC6ECLL);
  return result;
}

uint64_t sub_247BEC6F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247BEC700);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_247BEC704(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247BEC70C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ASN1Identifier.TagClass()
{
  return &type metadata for ASN1Identifier.TagClass;
}

uint64_t sub_247BEC728()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_247BEC734()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_247BEC740()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_247BEC74C()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_247BEC758()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_247BEC764()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_247BEC770()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_247BEC77C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_247BEC788()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_247BEC794()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247BEC7A0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247BEC7AC()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_247BEC7B8()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_247BEC7C4()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_247BEC7D0()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_247BEC7DC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_247BEC7E8()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_247BEC7F4()
{
  return MEMORY[0x24BEE1870]();
}

uint64_t sub_247BEC800()
{
  return MEMORY[0x24BEE1888]();
}

uint64_t sub_247BEC80C()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_247BEC818()
{
  return MEMORY[0x24BEE1898]();
}

uint64_t sub_247BEC824()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_247BEC830()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_247BEC83C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_247BEC848()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_247BEC854()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_247BEC860()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_247BEC86C()
{
  return MEMORY[0x24BEE19D0]();
}

uint64_t sub_247BEC878()
{
  return MEMORY[0x24BEE19F0]();
}

uint64_t sub_247BEC884()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t sub_247BEC890()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_247BEC89C()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_247BEC8A8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_247BEC8B4()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_247BEC8C0()
{
  return MEMORY[0x24BEE1F80]();
}

uint64_t sub_247BEC8CC()
{
  return MEMORY[0x24BEE1F88]();
}

uint64_t sub_247BEC8D8()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_247BEC8E4()
{
  return MEMORY[0x24BEE1FD8]();
}

uint64_t sub_247BEC8F0()
{
  return MEMORY[0x24BEE2020]();
}

uint64_t sub_247BEC8FC()
{
  return MEMORY[0x24BEE2028]();
}

uint64_t sub_247BEC908()
{
  return MEMORY[0x24BEE2030]();
}

uint64_t sub_247BEC914()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_247BEC920()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_247BEC92C()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_247BEC938()
{
  return MEMORY[0x24BEE20A0]();
}

uint64_t sub_247BEC944()
{
  return MEMORY[0x24BEE2118]();
}

uint64_t sub_247BEC950()
{
  return MEMORY[0x24BEE2120]();
}

uint64_t sub_247BEC95C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_247BEC968()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_247BEC974()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_247BEC980()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_247BEC98C()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_247BEC998()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_247BEC9A4()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_247BEC9B0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_247BEC9BC()
{
  return MEMORY[0x24BEE2C00]();
}

uint64_t sub_247BEC9C8()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t sub_247BEC9D4()
{
  return MEMORY[0x24BEE2D48]();
}

uint64_t sub_247BEC9E0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_247BEC9EC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247BEC9F8()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_247BECA04()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t sub_247BECA10()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_247BECA1C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_247BECA28()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247BECA34()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_247BECA40()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_247BECA4C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247BECA58()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247BECA64()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_247BECA70()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_247BECA7C()
{
  return MEMORY[0x24BEE4328]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

