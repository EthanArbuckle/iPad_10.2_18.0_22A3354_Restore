uint64_t static PlaygroundMetadata.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_2449CFCD0() & 1) != 0)
        return 1;
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_2449AC260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2449B4F30(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2449AC288()
{
  return 0;
}

uint64_t sub_2449AC294()
{
  sub_2449B09E0();
  return sub_2449CFDB4();
}

uint64_t sub_2449AC2BC()
{
  sub_2449B09E0();
  return sub_2449CFDC0();
}

uint64_t PlaygroundMetadata.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1F88);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2449B09E0();
  sub_2449CFDA8();
  sub_2449CFC64();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PlaygroundMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1F98);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2449B09E0();
  sub_2449CFD9C();
  if (!v2)
  {
    v9 = sub_2449CFC34();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2449AC4EC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7272457765726874;
  else
    return 0x6F4E646574697865;
}

uint64_t sub_2449AC534@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return PlaygroundMetadata.init(from:)(a1, a2);
}

uint64_t sub_2449AC548(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1F88);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2449B09E0();
  sub_2449CFDA8();
  sub_2449CFC64();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2449AC634(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_2449CFCD0() & 1) != 0)
        return 1;
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

BOOL sub_2449AC68C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2449AC6A4()
{
  char *v0;

  return sub_2449AC4EC(*v0);
}

uint64_t sub_2449AC6AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2449B4FE4(a1, a2);
  *a3 = result;
  return result;
}

void sub_2449AC6D0(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2449AC6DC()
{
  sub_2449B0A24();
  return sub_2449CFDB4();
}

uint64_t sub_2449AC704()
{
  sub_2449B0A24();
  return sub_2449CFDC0();
}

uint64_t sub_2449AC72C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2449AC758()
{
  sub_2449B0AAC();
  return sub_2449CFDB4();
}

uint64_t sub_2449AC780()
{
  sub_2449B0AAC();
  return sub_2449CFDC0();
}

uint64_t sub_2449AC7A8()
{
  sub_2449CFD48();
  sub_2449CFD54();
  return sub_2449CFD84();
}

uint64_t sub_2449AC7E8()
{
  return sub_2449CFD54();
}

uint64_t sub_2449AC80C()
{
  sub_2449CFD48();
  sub_2449CFD54();
  return sub_2449CFD84();
}

uint64_t sub_2449AC84C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2449B50EC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2449AC874()
{
  sub_2449B0A68();
  return sub_2449CFDB4();
}

uint64_t sub_2449AC89C()
{
  sub_2449B0A68();
  return sub_2449CFDC0();
}

uint64_t PlaygroundEvent.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1FA0);
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1FA8);
  v16 = *(_QWORD *)(v6 - 8);
  v17 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1FB0);
  v21 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1[1];
  v18 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2449B0A24();
  sub_2449CFDA8();
  if (v12)
  {
    v23 = 1;
    sub_2449B0A68();
    sub_2449CFC58();
    v13 = v20;
    sub_2449CFC70();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v13);
  }
  else
  {
    v22 = 0;
    sub_2449B0AAC();
    sub_2449CFC58();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v11, v9);
}

uint64_t PlaygroundEvent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  char *v34;
  _QWORD *v35;
  char v36;
  char v37;

  v33 = a2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1FD0);
  v32 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1FD8);
  v4 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1FE0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2449B0A24();
  v11 = v35;
  sub_2449CFD9C();
  if (v11)
    goto LABEL_9;
  v12 = v34;
  v29 = v8;
  v35 = a1;
  v13 = sub_2449CFC4C();
  v14 = v7;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v19 = sub_2449CFBC8();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1FE8);
    *v21 = &type metadata for PlaygroundEvent;
    sub_2449CFC28();
    sub_2449CFBBC();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v14);
    a1 = v35;
LABEL_9:
    v22 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v22);
  }
  if ((*(_BYTE *)(v13 + 32) & 1) != 0)
  {
    v37 = 1;
    sub_2449B0A68();
    sub_2449CFC1C();
    v15 = v7;
    v16 = v30;
    v17 = sub_2449CFC40();
    v18 = v29;
    v24 = v17;
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v15);
  }
  else
  {
    v36 = 0;
    sub_2449B0AAC();
    sub_2449CFC1C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v31);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v7);
    v24 = 0;
    v26 = 0;
  }
  v27 = v33;
  *v33 = v24;
  v27[1] = v26;
  v22 = (uint64_t)v35;
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_2449ACE6C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return PlaygroundEvent.init(from:)(a1, a2);
}

uint64_t sub_2449ACE80(_QWORD *a1)
{
  return PlaygroundEvent.encode(to:)(a1);
}

uint64_t IOSurfacePayload.surfaceID.getter()
{
  unsigned int *v0;

  return *v0;
}

double IOSurfacePayload.scaleFactor.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double IOSurfacePayload.width.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double IOSurfacePayload.height.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

uint64_t IOSurfacePayload.selectableRegions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IOSurfacePayload.init(surfaceID:scaleFactor:width:height:selectableRegions:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  *(_DWORD *)a3 = result;
  *(double *)(a3 + 8) = a4;
  *(double *)(a3 + 16) = a5;
  *(double *)(a3 + 24) = a6;
  *(_QWORD *)(a3 + 32) = a2;
  return result;
}

uint64_t sub_2449ACED0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2449ACF08 + 4 * byte_2449DB906[a1]))(0xD000000000000011, 0x80000002449E2A00);
}

uint64_t sub_2449ACF08()
{
  return 0x4965636166727573;
}

uint64_t sub_2449ACF24()
{
  return 0x636146656C616373;
}

uint64_t sub_2449ACF44()
{
  return 0x6874646977;
}

uint64_t sub_2449ACF58()
{
  return 0x746867696568;
}

void sub_2449ACF6C(char *a1)
{
  sub_2449A13C0(*a1);
}

void sub_2449ACF78()
{
  char *v0;

  sub_2449C7D68(*v0);
}

void sub_2449ACF80(uint64_t a1)
{
  char *v1;

  sub_244924530(a1, *v1);
}

void sub_2449ACF88(uint64_t a1)
{
  char *v1;

  sub_2449CA058(a1, *v1);
}

uint64_t sub_2449ACF90@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449B51A0();
  *a1 = result;
  return result;
}

uint64_t sub_2449ACFBC@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449ACED0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449ACFE4()
{
  unsigned __int8 *v0;

  return sub_2449ACED0(*v0);
}

uint64_t IOSurfacePayload.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449AD02C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1E70);
  sub_2449B0AF8();
  sub_244931570(&qword_2573A1E80, &qword_2573A1E70, (uint64_t (*)(void))sub_2449A4A8C);
  return sub_2449CF5E0();
}

uint64_t IOSurfacePayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  ValueMetadata *v15;
  unint64_t v16;
  int v17;

  v15 = &type metadata for IOSurfacePayload.Key;
  v5 = sub_2449B0AF8();
  v16 = v5;
  v14[0] = 0;
  sub_2449CF37C();
  if (v2)
  {
    v7 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    v6 = v17;
    v15 = &type metadata for IOSurfacePayload.Key;
    v16 = v5;
    v14[0] = 1;
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    v15 = &type metadata for IOSurfacePayload.Key;
    v16 = v5;
    v14[0] = 2;
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    v15 = &type metadata for IOSurfacePayload.Key;
    v16 = v5;
    v14[0] = 3;
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    v15 = &type metadata for IOSurfacePayload.Key;
    v16 = v5;
    v14[0] = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A1E70);
    sub_244931570(&qword_2573A1E80, &qword_2573A1E70, (uint64_t (*)(void))sub_2449A4A8C);
    sub_2449CF37C();
    v8 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    *(_DWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v13;
    *(_QWORD *)(a2 + 16) = v12;
    *(_QWORD *)(a2 + 24) = v11;
    *(_QWORD *)(a2 + 32) = v10;
  }
  return result;
}

uint64_t sub_2449AD374()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449AD3B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return IOSurfacePayload.init(propertyListValue:)(a1, a2);
}

uint64_t PreviewDescription.index.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PreviewDescription.index.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*PreviewDescription.index.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.contentType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewDescription.contentType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*PreviewDescription.contentType.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.device.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewDescription.device.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*PreviewDescription.device.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewDescription.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*PreviewDescription.displayName.modify())()
{
  return nullsub_1;
}

__n128 PreviewDescription.layout.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  unsigned __int8 v2;
  __n128 result;

  v2 = *(_BYTE *)(v1 + 72);
  result = *(__n128 *)(v1 + 56);
  *a1 = result;
  a1[1].n128_u8[0] = v2;
  return result;
}

__n128 PreviewDescription.layout.setter(__n128 *a1)
{
  uint64_t v1;
  unsigned __int8 v2;
  __n128 result;

  v2 = a1[1].n128_u8[0];
  result = *a1;
  *(__n128 *)(v1 + 56) = *a1;
  *(_BYTE *)(v1 + 72) = v2;
  return result;
}

uint64_t (*PreviewDescription.layout.modify())()
{
  return nullsub_1;
}

void PreviewDescription.contentDomain.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 73);
}

_BYTE *PreviewDescription.contentDomain.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 73) = *result;
  return result;
}

uint64_t (*PreviewDescription.contentDomain.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.supportsLive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 74);
}

uint64_t PreviewDescription.supportsLive.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 74) = result;
  return result;
}

uint64_t (*PreviewDescription.supportsLive.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.supportsOnDevice.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 75);
}

uint64_t PreviewDescription.supportsOnDevice.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 75) = result;
  return result;
}

uint64_t (*PreviewDescription.supportsOnDevice.modify())()
{
  return nullsub_1;
}

void PreviewDescription.interfaceOrientation.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 76);
}

_BYTE *PreviewDescription.interfaceOrientation.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 76) = *result;
  return result;
}

uint64_t (*PreviewDescription.interfaceOrientation.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.contentCategory.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 88);
  *a1 = *(_QWORD *)(v1 + 80);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewDescription.contentCategory.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v3;
  return result;
}

uint64_t (*PreviewDescription.contentCategory.modify())()
{
  return nullsub_1;
}

__n128 PreviewDescription.init(index:contentType:device:displayName:layout:contentDomain:supportsLive:supportsOnDevice:interfaceOrientation:contentCategory:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X7>, uint64_t a9@<X8>, char *a10, char a11, char a12, char *a13, uint64_t *a14)
{
  unsigned __int8 v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  __n128 result;

  v14 = a8[1].n128_u8[0];
  v15 = *a10;
  v16 = *a13;
  v18 = *a14;
  v17 = a14[1];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  result = *a8;
  *(__n128 *)(a9 + 56) = *a8;
  *(_BYTE *)(a9 + 72) = v14;
  *(_BYTE *)(a9 + 73) = v15;
  *(_BYTE *)(a9 + 74) = a11;
  *(_BYTE *)(a9 + 75) = a12;
  *(_BYTE *)(a9 + 76) = v16;
  *(_QWORD *)(a9 + 80) = v18;
  *(_QWORD *)(a9 + 88) = v17;
  return result;
}

uint64_t sub_2449AD6A0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2449AD6D8 + 4 * byte_2449DB90B[a1]))(0xD000000000000010, 0x80000002449E2BD0);
}

uint64_t sub_2449AD6D8()
{
  return 0x7865646E69;
}

uint64_t sub_2449AD6EC()
{
  return 0x54746E65746E6F63;
}

uint64_t sub_2449AD768()
{
  return 0x7374726F70707573;
}

uint64_t sub_2449AD788(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_2449AD7B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_2449AD6A0(*a1);
  v5 = v4;
  if (v3 == sub_2449AD6A0(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_2449CFCD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2449AD838()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_2449CFD48();
  sub_2449AD6A0(v1);
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449AD898()
{
  unsigned __int8 *v0;

  sub_2449AD6A0(*v0);
  sub_2449CF88C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2449AD8D8()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_2449CFD48();
  sub_2449AD6A0(v1);
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449AD934@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449B51E8();
  *a1 = result;
  return result;
}

uint64_t sub_2449AD960@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449AD6A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449AD988()
{
  unsigned __int8 *v0;

  return sub_2449AD6A0(*v0);
}

void sub_2449AD990(_QWORD *a1@<X8>)
{
  *a1 = &unk_251592168;
}

uint64_t PreviewDescription.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449AD9E8(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  char v12;
  _BYTE v13[32];
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  _BYTE v19[24];
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  char v26;
  _BYTE v27[16];
  _BYTE v28[16];
  _BYTE v29[24];

  v1 = a1;
  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  sub_2449314A4((uint64_t)(a1 + 3), (uint64_t)v29, &qword_25739F178);
  sub_2449314A4((uint64_t)(v1 + 5), (uint64_t)v28, &qword_25739F178);
  v5 = v1[7];
  v6 = v1[8];
  v7 = *((_BYTE *)v1 + 72);
  v8 = *((_BYTE *)v1 + 73);
  v9 = *((_BYTE *)v1 + 74);
  v12 = *((_BYTE *)v1 + 75);
  v10 = (uint64_t)(v1 + 10);
  LOBYTE(v1) = *((_BYTE *)v1 + 76);
  sub_2449314A4(v10, (uint64_t)v27, &qword_2573A2500);
  v26 = 0;
  v24 = v2;
  v25 = 0;
  v23 = 1;
  v21 = v3;
  v22 = v4;
  v20[23] = 2;
  sub_2449314A4((uint64_t)v29, (uint64_t)v20, &qword_25739F178);
  v19[23] = 3;
  sub_2449314A4((uint64_t)v28, (uint64_t)v19, &qword_25739F178);
  v18 = 4;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  v17 = 0;
  v13[31] = 5;
  v13[30] = v8;
  v13[29] = 6;
  v13[28] = v9;
  v13[27] = 7;
  v13[26] = v12;
  v13[25] = 8;
  v13[24] = (_BYTE)v1;
  v13[23] = 9;
  sub_2449314A4((uint64_t)v27, (uint64_t)v13, &qword_2573A2500);
  sub_2449B0B44();
  sub_2449A86C8();
  sub_244981738();
  sub_2449729C4();
  sub_2449424D8();
  return sub_2449CF5B0();
}

uint64_t PreviewDescription.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _BYTE v16[24];
  ValueMetadata *v17;
  unint64_t v18;
  uint64_t v19;

  v17 = &type metadata for PreviewDescription.Key;
  v5 = sub_2449B0B44();
  v18 = v5;
  v16[0] = 0;
  sub_2449CF37C();
  if (v2)
  {
    v6 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 1;
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 2;
    swift_bridgeObjectRetain();
    sub_2449CF3B8();
    v19 = v14;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 3;
    sub_2449CF3B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 4;
    sub_2449A86C8();
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 5;
    sub_244981738();
    sub_2449CF3B8();
    v8 = v19;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v9 = v13;
    if (v13 == 3)
      v9 = 0;
    v12 = v9;
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 6;
    sub_2449CF3B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 7;
    sub_2449CF3B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 8;
    sub_2449729C4();
    sub_2449CF3B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v17 = &type metadata for PreviewDescription.Key;
    v18 = v5;
    v16[0] = 9;
    sub_2449424D8();
    sub_2449CF3B8();
    if (v13 == 4)
      v10 = 0;
    else
      v10 = v13;
    v11 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)a2 = v13;
    *(_QWORD *)(a2 + 8) = v13;
    *(_QWORD *)(a2 + 16) = v8;
    *(_QWORD *)(a2 + 24) = v13;
    *(_QWORD *)(a2 + 32) = v14;
    *(_QWORD *)(a2 + 40) = v13;
    *(_QWORD *)(a2 + 48) = v14;
    *(_QWORD *)(a2 + 56) = v13;
    *(_QWORD *)(a2 + 64) = v14;
    *(_BYTE *)(a2 + 72) = v15;
    *(_BYTE *)(a2 + 73) = v12;
    *(_BYTE *)(a2 + 74) = (v13 == 2) | v13 & 1;
    *(_BYTE *)(a2 + 75) = (v13 == 2) | v13 & 1;
    *(_BYTE *)(a2 + 76) = v10;
    *(_QWORD *)(a2 + 80) = v13;
    *(_QWORD *)(a2 + 88) = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall PreviewDescription.describe(with:)(Swift::OpaquePointer *with)
{
  _QWORD *v1;

  v1 = &unk_251592168;
  sub_2449AF8C8((uint64_t *)&v1);
  if (v1[2])
    __asm { BR              X9; loc_2449AE378 }
  swift_release();
}

uint64_t PreviewContentDomain.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aApplicatwidget_0[8 * *v0];
}

__n128 PreviewDescription.previewTraits.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  unsigned __int8 v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = *(_BYTE *)(v1 + 72);
  v3 = *(_BYTE *)(v1 + 76);
  result = *(__n128 *)(v1 + 56);
  *a1 = result;
  a1[1].n128_u8[0] = v2;
  a1[1].n128_u8[1] = v3;
  return result;
}

void PreviewDescription.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(unsigned __int8 *)(v0 + 72);
  v4 = *(unsigned __int8 *)(v0 + 76);
  sub_2449CFD54();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  sub_2449CFD60();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_2449CF88C();
    swift_bridgeObjectRelease();
  }
  sub_2449CFD60();
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_2449CF88C();
    swift_bridgeObjectRelease();
  }
  sub_2449CFD54();
  if (!v3)
  {
    sub_2449CFD78();
    sub_2449CFD78();
  }
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  sub_2449CFD60();
  sub_2449CFD60();
  __asm { BR              X9 }
}

uint64_t sub_2449AE864()
{
  uint64_t v0;

  sub_2449CF88C();
  swift_bridgeObjectRelease();
  if (!v0)
    return sub_2449CFD60();
  sub_2449CFD60();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  return swift_bridgeObjectRelease();
}

uint64_t PreviewDescription.hashValue.getter()
{
  sub_2449CFD48();
  PreviewDescription.hash(into:)();
  return sub_2449CFD84();
}

uint64_t sub_2449AE9D4()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449AEA1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewDescription.init(propertyListValue:)(a1, a2);
}

uint64_t sub_2449AEA30()
{
  sub_2449CFD48();
  PreviewDescription.hash(into:)();
  return sub_2449CFD84();
}

uint64_t sub_2449AEAD0()
{
  sub_2449CFD48();
  PreviewDescription.hash(into:)();
  return sub_2449CFD84();
}

uint64_t sub_2449AEB70()
{
  __int128 *v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  Swift::OpaquePointer with;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  __int128 v20;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_BYTE *)v0 + 72);
  v3 = *((_BYTE *)v0 + 73);
  v4 = *((_BYTE *)v0 + 74);
  v5 = *((_BYTE *)v0 + 75);
  v6 = *((_BYTE *)v0 + 76);
  v10 = *v0;
  v11 = v1;
  v12 = *(__int128 *)((char *)v0 + 24);
  v13 = *(__int128 *)((char *)v0 + 40);
  v14 = *(__int128 *)((char *)v0 + 56);
  v15 = v2;
  v16 = v3;
  v17 = v4;
  v18 = v5;
  v19 = v6;
  v20 = v0[5];
  with._rawValue = (void *)MEMORY[0x24BEE4AF8];
  PreviewDescription.describe(with:)(&with);
  v7 = sub_2449CF91C();
  swift_bridgeObjectRelease();
  return v7;
}

PreviewsMessagingOS::PreviewContentDomain_optional __swiftcall PreviewContentDomain.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PreviewsMessagingOS::PreviewContentDomain_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2449CFC10();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_2449AEC84(char *a1, char *a2)
{
  return sub_24499FCF8(*a1, *a2);
}

uint64_t sub_2449AEC90()
{
  return sub_2449C7E48();
}

uint64_t sub_2449AEC98()
{
  return sub_244923968();
}

uint64_t sub_2449AECA0()
{
  return sub_2449CAD0C();
}

PreviewsMessagingOS::PreviewContentDomain_optional sub_2449AECA8(Swift::String *a1)
{
  return PreviewContentDomain.init(rawValue:)(*a1);
}

uint64_t sub_2449AECB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PreviewContentDomain.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2449AECD8()
{
  sub_2449B5274();
  return sub_2449CF670();
}

uint64_t sub_2449AED20()
{
  sub_2449B5274();
  return sub_2449CF67C();
}

unint64_t OneWayMessageKey.getter()
{
  return 0xD000000000000012;
}

void sub_2449AEDA0()
{
  qword_2573A1E50 = 1701869940;
  *(_QWORD *)algn_2573A1E58 = 0xE400000000000000;
}

uint64_t MessageTypeKey.getter()
{
  uint64_t v0;

  if (qword_25739EDB0 != -1)
    swift_once();
  v0 = qword_2573A1E50;
  swift_bridgeObjectRetain();
  return v0;
}

void MessageSendingError.lowValueTitle.getter()
{
  uint64_t v0;
  _BYTE v1[88];

  sub_2449B0F00(v0, (uint64_t)v1);
  __asm { BR              X10 }
}

uint64_t sub_2449AEE54()
{
  uint64_t v1;
  uint64_t v2;

  sub_2449CFB98();
  swift_bridgeObjectRelease();
  sub_2449CF898();
  swift_bridgeObjectRelease();
  sub_2449CF898();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v1);
  return 0x1000000000000021;
}

void MessageSendingError.additionalInfo.getter()
{
  uint64_t v0;
  _BYTE v1[88];

  sub_2449B0F00(v0, (uint64_t)v1);
  __asm { BR              X10 }
}

uint64_t sub_2449AF070()
{
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t MessageSendingError.additionalDiagnostics.getter()
{
  return 0;
}

uint64_t MessageSendingError.isPotentialCrash.getter()
{
  uint64_t v0;
  _BYTE v2[8];
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  sub_2449B0F00(v0, (uint64_t)v2);
  if (v5 - 1 >= 2)
  {
    if (v5)
    {
      sub_2449B0F34((uint64_t)v2);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v4);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
    }
    return 0;
  }
  else
  {
    sub_2449B0F34((uint64_t)v2);
    return 1;
  }
}

uint64_t sub_2449AF264()
{
  uint64_t v0;
  _BYTE v2[8];
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  sub_2449B0F00(v0, (uint64_t)v2);
  if (v5 - 1 >= 2)
  {
    if (v5)
    {
      sub_2449B0F34((uint64_t)v2);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v4);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
    }
    return 0;
  }
  else
  {
    sub_2449B0F34((uint64_t)v2);
    return 1;
  }
}

uint64_t sub_2449AF2E4()
{
  sub_2449B5230();
  return sub_2449CF52C();
}

uint64_t sub_2449AF30C()
{
  sub_2449B5230();
  return sub_2449CF508();
}

uint64_t sub_2449AF334(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A24F8);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2449CFC04();
  __break(1u);
  return result;
}

uint64_t sub_2449AF480(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25739F280);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2449CFC04();
  __break(1u);
  return result;
}

uint64_t sub_2449AF5E8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25739F278);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 48 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2449CFC04();
  __break(1u);
  return result;
}

uint64_t sub_2449AF760(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25739F270);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2449CFC04();
  __break(1u);
  return result;
}

uint64_t sub_2449AF8C8(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2449B0704(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_2449AF930(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2449AF930(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  int v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  unsigned __int8 *v33;
  unsigned __int8 v34;
  unsigned __int8 *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v69;
  char v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  unint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unsigned __int8 *__dst;
  uint64_t v113;

  v2 = v1;
  v4 = a1[1];
  result = sub_2449CFC7C();
  if (result >= v4)
  {
    if (v4 < 0)
      goto LABEL_152;
    if (v4)
      return sub_2449B00B0(0, v4, 1, a1);
    return result;
  }
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
    goto LABEL_160;
  v109 = v4 - 2;
  v106 = result;
  v104 = a1;
  if (v4 < 2)
  {
    v9 = (char *)MEMORY[0x24BEE4AF8];
    __dst = (unsigned __int8 *)(MEMORY[0x24BEE4AF8] + 32);
    v105 = MEMORY[0x24BEE4AF8];
    if (v4 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_118:
      v96 = v9;
      if (v12 >= 2)
      {
        v97 = *v104;
        do
        {
          v98 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v97)
            goto LABEL_159;
          v99 = v96;
          v100 = *(_QWORD *)&v96[16 * v98 + 32];
          v101 = *(_QWORD *)&v96[16 * v12 + 24];
          sub_2449B01C0((unsigned __int8 *)(v97 + v100), (unsigned __int8 *)(v97 + *(_QWORD *)&v96[16 * v12 + 16]), v97 + v101, __dst);
          if (v2)
            break;
          if (v101 < v100)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v99 = sub_2449B06F0((uint64_t)v99);
          if (v98 >= *((_QWORD *)v99 + 2))
            goto LABEL_149;
          v102 = &v99[16 * v98 + 32];
          *(_QWORD *)v102 = v100;
          *((_QWORD *)v102 + 1) = v101;
          v103 = *((_QWORD *)v99 + 2);
          if (v12 > v103)
            goto LABEL_150;
          memmove(&v99[16 * v12 + 16], &v99[16 * v12 + 32], 16 * (v103 - v12));
          v96 = v99;
          *((_QWORD *)v99 + 2) = v103 - 1;
          v12 = v103 - 1;
        }
        while (v103 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v105 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v113 = v1;
  }
  else
  {
    v113 = v1;
    v7 = v6 >> 1;
    v8 = sub_2449CF970();
    *(_QWORD *)(v8 + 16) = v7;
    v105 = v8;
    __dst = (unsigned __int8 *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v9 = (char *)MEMORY[0x24BEE4AF8];
  v107 = v4;
  while (1)
  {
    v13 = v10++;
    v110 = v13;
    if (v10 >= v4)
      goto LABEL_46;
    v14 = *(_BYTE *)(v11 + v13);
    v15 = sub_2449AD6A0(*(_BYTE *)(v11 + v10));
    v17 = v16;
    if (v15 == sub_2449AD6A0(v14) && v17 == v18)
      v20 = 0;
    else
      v20 = sub_2449CFCD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v21 = v13;
    v10 = v13 + 2;
    if (v13 + 2 >= v107)
      goto LABEL_36;
    while (1)
    {
      v23 = *(_BYTE *)(v11 + v21 + 1);
      v24 = sub_2449AD6A0(*(_BYTE *)(v11 + v21 + 2));
      v26 = v25;
      if (v24 == sub_2449AD6A0(v23) && v26 == v27)
      {
        swift_bridgeObjectRelease_n();
        if ((v20 & 1) != 0)
        {
          v10 = v21 + 2;
          v4 = v107;
          v13 = v110;
          goto LABEL_37;
        }
        goto LABEL_26;
      }
      v22 = sub_2449CFCD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (((v20 ^ v22) & 1) != 0)
        break;
LABEL_26:
      if (v109 == ++v21)
      {
        v10 = v107;
        goto LABEL_36;
      }
    }
    v10 = v21 + 2;
LABEL_36:
    v4 = v107;
    v13 = v110;
    if ((v20 & 1) != 0)
    {
LABEL_37:
      if (v10 < v13)
        goto LABEL_153;
      if (v13 < v10)
      {
        v29 = v10 - 1;
        v30 = v13;
        do
        {
          if (v30 != v29)
          {
            if (!v11)
              goto LABEL_158;
            v31 = *(_BYTE *)(v11 + v30);
            *(_BYTE *)(v11 + v30) = *(_BYTE *)(v11 + v29);
            *(_BYTE *)(v11 + v29) = v31;
          }
          v75 = ++v30 < v29--;
        }
        while (v75);
      }
    }
LABEL_46:
    if (v10 < v4)
    {
      if (__OFSUB__(v10, v13))
        goto LABEL_151;
      if (v10 - v13 < v106)
        break;
    }
LABEL_67:
    if (v10 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_2449B04C0(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v44 = *((_QWORD *)v9 + 2);
    v43 = *((_QWORD *)v9 + 3);
    v12 = v44 + 1;
    if (v44 >= v43 >> 1)
      v9 = sub_2449B04C0((char *)(v43 > 1), v44 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v12;
    v45 = v9 + 32;
    v46 = &v9[16 * v44 + 32];
    *(_QWORD *)v46 = v13;
    *((_QWORD *)v46 + 1) = v10;
    if (v44)
    {
      v111 = v10;
      while (1)
      {
        v47 = v12 - 1;
        if (v12 >= 4)
        {
          v52 = &v45[16 * v12];
          v53 = *((_QWORD *)v52 - 8);
          v54 = *((_QWORD *)v52 - 7);
          v58 = __OFSUB__(v54, v53);
          v55 = v54 - v53;
          if (v58)
            goto LABEL_135;
          v57 = *((_QWORD *)v52 - 6);
          v56 = *((_QWORD *)v52 - 5);
          v58 = __OFSUB__(v56, v57);
          v50 = v56 - v57;
          v51 = v58;
          if (v58)
            goto LABEL_136;
          v59 = v12 - 2;
          v60 = &v45[16 * v12 - 32];
          v62 = *(_QWORD *)v60;
          v61 = *((_QWORD *)v60 + 1);
          v58 = __OFSUB__(v61, v62);
          v63 = v61 - v62;
          if (v58)
            goto LABEL_138;
          v58 = __OFADD__(v50, v63);
          v64 = v50 + v63;
          if (v58)
            goto LABEL_141;
          if (v64 >= v55)
          {
            v82 = &v45[16 * v47];
            v84 = *(_QWORD *)v82;
            v83 = *((_QWORD *)v82 + 1);
            v58 = __OFSUB__(v83, v84);
            v85 = v83 - v84;
            if (v58)
              goto LABEL_145;
            v75 = v50 < v85;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v76 = *((_QWORD *)v9 + 4);
            v77 = *((_QWORD *)v9 + 5);
            v58 = __OFSUB__(v77, v76);
            v69 = v77 - v76;
            v70 = v58;
            goto LABEL_99;
          }
          v49 = *((_QWORD *)v9 + 4);
          v48 = *((_QWORD *)v9 + 5);
          v58 = __OFSUB__(v48, v49);
          v50 = v48 - v49;
          v51 = v58;
        }
        if ((v51 & 1) != 0)
          goto LABEL_137;
        v59 = v12 - 2;
        v65 = &v45[16 * v12 - 32];
        v67 = *(_QWORD *)v65;
        v66 = *((_QWORD *)v65 + 1);
        v68 = __OFSUB__(v66, v67);
        v69 = v66 - v67;
        v70 = v68;
        if (v68)
          goto LABEL_140;
        v71 = &v45[16 * v47];
        v73 = *(_QWORD *)v71;
        v72 = *((_QWORD *)v71 + 1);
        v58 = __OFSUB__(v72, v73);
        v74 = v72 - v73;
        if (v58)
          goto LABEL_143;
        if (__OFADD__(v69, v74))
          goto LABEL_144;
        if (v69 + v74 >= v50)
        {
          v75 = v50 < v74;
LABEL_105:
          if (v75)
            v47 = v59;
          goto LABEL_107;
        }
LABEL_99:
        if ((v70 & 1) != 0)
          goto LABEL_139;
        v78 = &v45[16 * v47];
        v80 = *(_QWORD *)v78;
        v79 = *((_QWORD *)v78 + 1);
        v58 = __OFSUB__(v79, v80);
        v81 = v79 - v80;
        if (v58)
          goto LABEL_142;
        if (v81 < v69)
          goto LABEL_15;
LABEL_107:
        v86 = v47 - 1;
        if (v47 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
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
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
          goto LABEL_155;
        }
        v87 = v11;
        if (!v11)
          goto LABEL_157;
        v88 = v9;
        v89 = &v45[16 * v86];
        v90 = *(_QWORD *)v89;
        v91 = v47;
        v92 = &v45[16 * v47];
        v93 = *((_QWORD *)v92 + 1);
        v94 = v87;
        sub_2449B01C0((unsigned __int8 *)(v87 + *(_QWORD *)v89), (unsigned __int8 *)(v87 + *(_QWORD *)v92), v87 + v93, __dst);
        if (v113)
          goto LABEL_115;
        if (v93 < v90)
          goto LABEL_132;
        if (v91 > *((_QWORD *)v88 + 2))
          goto LABEL_133;
        *(_QWORD *)v89 = v90;
        *(_QWORD *)&v45[16 * v86 + 8] = v93;
        v95 = *((_QWORD *)v88 + 2);
        if (v91 >= v95)
          goto LABEL_134;
        v9 = v88;
        v12 = v95 - 1;
        memmove(v92, v92 + 16, 16 * (v95 - 1 - v91));
        *((_QWORD *)v88 + 2) = v95 - 1;
        v11 = v94;
        v10 = v111;
        if (v95 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v4 = v107;
    if (v10 >= v107)
    {
      v2 = v113;
      goto LABEL_118;
    }
  }
  v32 = v13 + v106;
  if (__OFADD__(v13, v106))
    goto LABEL_154;
  if (v32 >= v4)
    v32 = v4;
  if (v32 >= v13)
  {
    if (v10 != v32)
    {
      v33 = (unsigned __int8 *)(v11 + v10);
      v108 = v32;
      do
      {
        v34 = *(_BYTE *)(v11 + v10);
        v35 = v33;
        while (1)
        {
          v36 = *(v35 - 1);
          v37 = sub_2449AD6A0(v34);
          v39 = v38;
          if (v37 == sub_2449AD6A0(v36) && v39 == v40)
            break;
          v42 = sub_2449CFCD0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v42 & 1) == 0)
            goto LABEL_56;
          if (!v11)
            goto LABEL_156;
          v34 = *v35;
          *v35 = *(v35 - 1);
          *(v35 - 1) = v34;
          ++v13;
          --v35;
          if (v10 == v13)
            goto LABEL_56;
        }
        swift_bridgeObjectRelease_n();
LABEL_56:
        ++v10;
        ++v33;
        v13 = v110;
      }
      while (v10 != v108);
      v10 = v108;
    }
    goto LABEL_67;
  }
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  result = sub_2449CFBEC();
  __break(1u);
  return result;
}

uint64_t sub_2449B00B0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;

  v17 = result;
  if (a3 != a2)
  {
    v4 = a3;
    v6 = *a4;
    v7 = (_BYTE *)(*a4 + a3);
LABEL_6:
    LOBYTE(result) = *(_BYTE *)(v6 + v4);
    v8 = v17;
    v9 = v7;
    while (1)
    {
      v10 = *(v9 - 1);
      v11 = sub_2449AD6A0(result);
      v13 = v12;
      if (v11 == sub_2449AD6A0(v10) && v13 == v14)
      {
        result = swift_bridgeObjectRelease_n();
LABEL_5:
        ++v4;
        ++v7;
        if (v4 == a2)
          return result;
        goto LABEL_6;
      }
      v16 = sub_2449CFCD0();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
        goto LABEL_5;
      if (!v6)
        break;
      result = *v9;
      *v9 = *(v9 - 1);
      *(v9 - 1) = result;
      ++v8;
      --v9;
      if (v4 == v8)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2449B01C0(unsigned __int8 *__src, unsigned __int8 *a2, unint64_t a3, unsigned __int8 *__dst)
{
  unsigned __int8 *v4;
  unsigned __int8 *v6;
  size_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  uint64_t result;
  unsigned __int8 *v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  unsigned __int8 *v35;
  unsigned __int8 *v36;

  v36 = __src;
  v4 = __dst;
  v6 = a2;
  v8 = a2 - __src;
  v9 = a3 - (_QWORD)a2;
  v35 = __dst;
  if (a2 - __src >= (uint64_t)(a3 - (_QWORD)a2))
  {
    if ((v9 & 0x8000000000000000) != 0)
      goto LABEL_50;
    if (__dst != a2 || a3 <= (unint64_t)__dst)
      memmove(__dst, a2, a3 - (_QWORD)a2);
    v20 = &v4[v9];
    v33 = __src;
    v34 = &v4[v9];
    v36 = v6;
    if (__src >= v6 || (unsigned __int8 *)a3 == v6)
    {
LABEL_49:
      sub_2449B05B8((void **)&v36, (const void **)&v35, &v34);
      return 1;
    }
    v21 = (unsigned __int8 *)(a3 - 1);
    v22 = v6;
    v32 = v4;
    while (1)
    {
      v23 = v21 + 1;
      v24 = *--v22;
      v25 = sub_2449AD6A0(*(v20 - 1));
      v27 = v26;
      if (v25 == sub_2449AD6A0(v24) && v27 == v28)
        break;
      v30 = sub_2449CFCD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0)
        goto LABEL_42;
      if (v23 != v6 || v21 >= v6)
        *v21 = *v22;
      v36 = v22;
LABEL_47:
      if (v22 > v33)
      {
        --v21;
        v6 = v22;
        if (v20 > v32)
          continue;
      }
      goto LABEL_49;
    }
    swift_bridgeObjectRelease_n();
LABEL_42:
    v34 = v20 - 1;
    if (v23 < v20 || v21 >= v20 || v23 != v20)
      *v21 = *(v20 - 1);
    v22 = v6;
    --v20;
    goto LABEL_47;
  }
  if ((v8 & 0x8000000000000000) == 0)
  {
    if (__dst != __src || a2 <= __dst)
      memmove(__dst, __src, v8);
    v10 = &v4[v8];
    v34 = &v4[v8];
    if (v6 != __src && (unint64_t)v6 < a3)
    {
      v11 = __src;
      while (1)
      {
        v12 = *v4;
        v13 = sub_2449AD6A0(*v6);
        v15 = v14;
        if (v13 == sub_2449AD6A0(v12) && v15 == v16)
          break;
        v18 = sub_2449CFCD0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
          goto LABEL_19;
        v19 = v6 + 1;
        if (v11 < v6 || v11 >= v19 || v11 != v6)
          *v11 = *v6;
LABEL_22:
        ++v11;
        if (v4 < v10)
        {
          v6 = v19;
          if ((unint64_t)v19 < a3)
            continue;
        }
        v36 = v11;
        goto LABEL_49;
      }
      swift_bridgeObjectRelease_n();
LABEL_19:
      if (v11 != v4)
        *v11 = *v4;
      v35 = ++v4;
      v19 = v6;
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_50:
  result = sub_2449CFC04();
  __break(1u);
  return result;
}

char *sub_2449B04C0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A24F0);
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

char *sub_2449B05B8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  int64_t v4;
  char *result;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 < 0)
  {
    result = (char *)sub_2449CFC04();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    if (result != v3 || result >= &v3[v4])
      return (char *)memmove(result, v3, v4);
  }
  return result;
}

char *sub_2449B0648(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_2449CFC04();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_2449B06F0(uint64_t a1)
{
  return sub_2449B04C0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2449B0704(uint64_t a1)
{
  return sub_2449AF334(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2449B0718(uint64_t a1)
{
  return sub_2449AF760(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2449B072C()
{
  return 2036625250;
}

uint64_t sub_2449B073C()
{
  return 0x656E696C656D6974;
}

uint64_t sub_2449B075C()
{
  return 0x7377656976657270;
}

BOOL _s19PreviewsMessagingOS15PreviewMetadataV2eeoiySbAC_ACtFZ_0(char *a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  char v9;
  _BOOL8 result;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  char v20;
  __int128 v21;
  __int128 v22;
  int v23;
  int v24;
  int v25;

  v2 = *((_QWORD *)a1 + 1);
  v3 = *((_QWORD *)a1 + 2);
  v4 = a1[24];
  v25 = a1[25];
  *(_QWORD *)&v22 = *((_QWORD *)a1 + 5);
  *((_QWORD *)&v22 + 1) = *((_QWORD *)a1 + 4);
  v20 = a1[49];
  v19 = a1[50];
  v15 = *((_QWORD *)a1 + 7);
  v16 = *((_QWORD *)a1 + 8);
  v5 = *((_QWORD *)a2 + 1);
  v6 = *((_QWORD *)a2 + 2);
  v7 = a2[24];
  v8 = a2[25];
  *((_QWORD *)&v21 + 1) = *((_QWORD *)a2 + 4);
  *(_QWORD *)&v21 = *((_QWORD *)a2 + 5);
  v23 = a2[48];
  v24 = a1[48];
  v18 = a2[50];
  v14 = *((_QWORD *)a2 + 7);
  v17 = *((_QWORD *)a2 + 8);
  if (*(_QWORD *)&aApplicatwidget_0[8 * *a1] == *(_QWORD *)&aApplicatwidget_0[8 * *a2]
    && *(_QWORD *)&aComplicaion_0[8 * *a1 + 8] == *(_QWORD *)&aComplicaion_0[8 * *a2 + 8])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_2449CFCD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v9 & 1) == 0)
      return result;
  }
  if (v2 == v5 && v3 == v6)
  {
    result = 0;
    if (v4 != v7)
      return result;
  }
  else
  {
    v11 = sub_2449CFCD0();
    result = 0;
    if ((v11 & 1) == 0 || ((v4 ^ v7) & 1) != 0)
      return result;
  }
  if (((v25 ^ v8) & 1) != 0)
    return result;
  if (v24)
  {
    if (v22 == 0)
    {
      if (!v23 || v21 != 0)
        return 0;
    }
    else if (!v23 || v21 == 0)
    {
      return 0;
    }
LABEL_23:
    sub_24499EC84(v20);
    v13 = v12;
    result = 0;
    if ((v13 & 1) != 0 && ((v19 ^ v18) & 1) == 0)
    {
      if (v16)
        return v17 && (v15 == v14 && v16 == v17 || (sub_2449CFCD0() & 1) != 0);
      return !v17;
    }
    return result;
  }
  if ((v23 & 1) != 0)
    return 0;
  result = 0;
  if (*((double *)&v22 + 1) == *((double *)&v21 + 1) && *(double *)&v22 == *(double *)&v21)
    goto LABEL_23;
  return result;
}

unint64_t sub_2449B09E0()
{
  unint64_t result;

  result = qword_2573A1F90;
  if (!qword_2573A1F90)
  {
    result = MEMORY[0x24951C158](&unk_2449DDDC8, &type metadata for PlaygroundMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A1F90);
  }
  return result;
}

unint64_t sub_2449B0A24()
{
  unint64_t result;

  result = qword_2573A1FB8;
  if (!qword_2573A1FB8)
  {
    result = MEMORY[0x24951C158](&unk_2449DDD78, &type metadata for PlaygroundEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A1FB8);
  }
  return result;
}

unint64_t sub_2449B0A68()
{
  unint64_t result;

  result = qword_2573A1FC0;
  if (!qword_2573A1FC0)
  {
    result = MEMORY[0x24951C158](&unk_2449DDD28, &type metadata for PlaygroundEvent.ThrewErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A1FC0);
  }
  return result;
}

unint64_t sub_2449B0AAC()
{
  unint64_t result;

  result = qword_2573A1FC8;
  if (!qword_2573A1FC8)
  {
    result = MEMORY[0x24951C158](&unk_2449DDCD8, &type metadata for PlaygroundEvent.ExitedNormallyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A1FC8);
  }
  return result;
}

uint64_t sub_2449B0AF0()
{
  return sub_2449AD02C();
}

unint64_t sub_2449B0AF8()
{
  unint64_t result;

  result = qword_2573A1FF0;
  if (!qword_2573A1FF0)
  {
    result = MEMORY[0x24951C158](&unk_2449DDCB0, &type metadata for IOSurfacePayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A1FF0);
  }
  return result;
}

uint64_t sub_2449B0B3C()
{
  uint64_t v0;

  return sub_2449AD9E8(*(_QWORD **)(v0 + 16));
}

unint64_t sub_2449B0B44()
{
  unint64_t result;

  result = qword_2573A1FF8;
  if (!qword_2573A1FF8)
  {
    result = MEMORY[0x24951C158](&unk_2449DDC88, &type metadata for PreviewDescription.Key);
    atomic_store(result, (unint64_t *)&qword_2573A1FF8);
  }
  return result;
}

unint64_t sub_2449B0B88()
{
  unint64_t result;

  result = qword_2573A2000;
  if (!qword_2573A2000)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for ContentCategory, &type metadata for ContentCategory);
    atomic_store(result, (unint64_t *)&qword_2573A2000);
  }
  return result;
}

unint64_t sub_2449B0BCC()
{
  unint64_t result;

  result = qword_2573A2008;
  if (!qword_2573A2008)
  {
    result = MEMORY[0x24951C158](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2573A2008);
  }
  return result;
}

BOOL _s19PreviewsMessagingOS18PreviewDescriptionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  _BOOL8 result;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;

  if (*(_QWORD *)a1 != *(_QWORD *)a2)
    return 0;
  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  *((_QWORD *)&v30 + 1) = *(_QWORD *)(a1 + 56);
  *(_QWORD *)&v30 = *(_QWORD *)(a1 + 64);
  v6 = *(unsigned __int8 *)(a1 + 72);
  v26 = *(unsigned __int8 *)(a1 + 74);
  v24 = *(unsigned __int8 *)(a1 + 75);
  v22 = *(_BYTE *)(a1 + 76);
  v19 = *(_QWORD *)(a1 + 80);
  v20 = *(_QWORD *)(a1 + 88);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  *((_QWORD *)&v29 + 1) = *(_QWORD *)(a2 + 56);
  v28 = *(char *)(a1 + 73);
  *(_QWORD *)&v29 = *(_QWORD *)(a2 + 64);
  v11 = *(unsigned __int8 *)(a2 + 72);
  v27 = *(char *)(a2 + 73);
  v25 = *(unsigned __int8 *)(a2 + 74);
  v23 = *(unsigned __int8 *)(a2 + 75);
  v18 = *(_QWORD *)(a2 + 80);
  v21 = *(_QWORD *)(a2 + 88);
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16)
    || (v12 = sub_2449CFCD0(), result = 0, (v12 & 1) != 0))
  {
    if (v3)
    {
      if (!v8)
        return 0;
      if (v2 != v7 || v3 != v8)
      {
        v14 = sub_2449CFCD0();
        result = 0;
        if ((v14 & 1) == 0)
          return result;
      }
    }
    else if (v8)
    {
      return 0;
    }
    if (v5)
    {
      if (!v9)
        return 0;
      if (v4 != v10 || v5 != v9)
      {
        v15 = sub_2449CFCD0();
        result = 0;
        if ((v15 & 1) == 0)
          return result;
      }
    }
    else if (v9)
    {
      return 0;
    }
    if (v6)
    {
      if (v30 == 0)
      {
        if (!v11 || v29 != 0)
          return 0;
      }
      else if (!v11 || v29 == 0)
      {
        return 0;
      }
    }
    else
    {
      if ((v11 & 1) != 0)
        return 0;
      result = 0;
      if (*((double *)&v30 + 1) != *((double *)&v29 + 1) || *(double *)&v30 != *(double *)&v29)
        return result;
    }
    if (*(_QWORD *)&aApplicatwidget_0[8 * v28] == *(_QWORD *)&aApplicatwidget_0[8 * v27]
      && *(_QWORD *)&aComplicaion_0[8 * v28 + 8] == *(_QWORD *)&aComplicaion_0[8 * v27 + 8])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = 0;
      if (v26 != v25)
        return result;
    }
    else
    {
      v16 = sub_2449CFCD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = 0;
      if ((v16 & 1) == 0 || ((v26 ^ v25) & 1) != 0)
        return result;
    }
    if (((v24 ^ v23) & 1) != 0)
      return result;
    sub_24499EC84(v22);
    if ((v17 & 1) != 0)
    {
      if (v20)
        return v21 && (v19 == v18 && v20 == v21 || (sub_2449CFCD0() & 1) != 0);
      if (!v21)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_2449B0F00(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MessageSendingError(a2, a1);
  return a2;
}

uint64_t sub_2449B0F34(uint64_t a1)
{
  destroy for MessageSendingError(a1);
  return a1;
}

unint64_t sub_2449B0F64()
{
  unint64_t result;

  result = qword_2573A2010;
  if (!qword_2573A2010)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for AgentMessageType, &type metadata for AgentMessageType);
    atomic_store(result, (unint64_t *)&qword_2573A2010);
  }
  return result;
}

unint64_t sub_2449B0FAC()
{
  unint64_t result;

  result = qword_2573A2018;
  if (!qword_2573A2018)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for ChromeType, &type metadata for ChromeType);
    atomic_store(result, (unint64_t *)&qword_2573A2018);
  }
  return result;
}

unint64_t sub_2449B0FF4()
{
  unint64_t result;

  result = qword_2573A2020;
  if (!qword_2573A2020)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewTraits, &type metadata for PreviewTraits);
    atomic_store(result, (unint64_t *)&qword_2573A2020);
  }
  return result;
}

unint64_t sub_2449B103C()
{
  unint64_t result;

  result = qword_2573A2028;
  if (!qword_2573A2028)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewTraits.Layout, &type metadata for PreviewTraits.Layout);
    atomic_store(result, (unint64_t *)&qword_2573A2028);
  }
  return result;
}

unint64_t sub_2449B1084()
{
  unint64_t result;

  result = qword_2573A2030;
  if (!qword_2573A2030)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewTraits.Orientation, &type metadata for PreviewTraits.Orientation);
    atomic_store(result, (unint64_t *)&qword_2573A2030);
  }
  return result;
}

unint64_t sub_2449B10CC()
{
  unint64_t result;

  result = qword_2573A2038;
  if (!qword_2573A2038)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewMetadata, &type metadata for PreviewMetadata);
    atomic_store(result, (unint64_t *)&qword_2573A2038);
  }
  return result;
}

unint64_t sub_2449B1114()
{
  unint64_t result;

  result = qword_2573A2040;
  if (!qword_2573A2040)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewDescription, &type metadata for PreviewDescription);
    atomic_store(result, (unint64_t *)&qword_2573A2040);
  }
  return result;
}

unint64_t sub_2449B115C()
{
  unint64_t result;

  result = qword_2573A2048;
  if (!qword_2573A2048)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewDescription, &type metadata for PreviewDescription);
    atomic_store(result, (unint64_t *)&qword_2573A2048);
  }
  return result;
}

unint64_t sub_2449B11A4()
{
  unint64_t result;

  result = qword_2573A2050;
  if (!qword_2573A2050)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewContentDomain, &type metadata for PreviewContentDomain);
    atomic_store(result, (unint64_t *)&qword_2573A2050);
  }
  return result;
}

unint64_t sub_2449B11EC()
{
  unint64_t result;

  result = qword_2573A2058;
  if (!qword_2573A2058)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageSendingError, &type metadata for MessageSendingError);
    atomic_store(result, (unint64_t *)&qword_2573A2058);
  }
  return result;
}

unint64_t sub_2449B1234()
{
  unint64_t result;

  result = qword_2573A2060;
  if (!qword_2573A2060)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageSendingError, &type metadata for MessageSendingError);
    atomic_store(result, (unint64_t *)&qword_2573A2060);
  }
  return result;
}

unint64_t sub_2449B127C()
{
  unint64_t result;

  result = qword_2573A2068;
  if (!qword_2573A2068)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageSendingError, &type metadata for MessageSendingError);
    atomic_store(result, (unint64_t *)&qword_2573A2068);
  }
  return result;
}

ValueMetadata *type metadata accessor for AgentMessageType()
{
  return &type metadata for AgentMessageType;
}

uint64_t destroy for LegacyAgentPayload()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LegacyAgentPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LegacyAgentPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v4;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LegacyAgentPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyAgentPayload(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyAgentPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyAgentPayload()
{
  return &type metadata for LegacyAgentPayload;
}

uint64_t *initializeBufferWithCopyOfBuffer for TimelinePayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_244964F34(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for TimelinePayload(uint64_t a1)
{
  return sub_244962528(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *assignWithCopy for TimelinePayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_244964F34(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_244962528(v5, v6);
  return a1;
}

uint64_t *assignWithTake for TimelinePayload(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_244962528(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimelinePayload(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TimelinePayload(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for TimelinePayload()
{
  return &type metadata for TimelinePayload;
}

ValueMetadata *type metadata accessor for GeometryPayload()
{
  return &type metadata for GeometryPayload;
}

ValueMetadata *type metadata accessor for SceneLayout()
{
  return &type metadata for SceneLayout;
}

uint64_t destroy for HostIdentity(uint64_t a1)
{
  return sub_2449A7354(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s19PreviewsMessagingOS12HostIdentityOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2449A67C8(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for HostIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2449A67C8(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_2449A7354(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for HostIdentity(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_2449A7354(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for HostIdentity()
{
  return &type metadata for HostIdentity;
}

ValueMetadata *type metadata accessor for ChromeType()
{
  return &type metadata for ChromeType;
}

ValueMetadata *type metadata accessor for GridIndex()
{
  return &type metadata for GridIndex;
}

uint64_t *initializeBufferWithCopyOfBuffer for StaticPreviewReply(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2449CF400();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for StaticPreviewReply(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_BYTE *initializeWithCopy for StaticPreviewReply(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_2449CF400();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *assignWithCopy for StaticPreviewReply(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_2449CF400();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_BYTE *initializeWithTake for StaticPreviewReply(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_2449CF400();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  return a1;
}

_BYTE *assignWithTake for StaticPreviewReply(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_2449CF400();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StaticPreviewReply()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449B1BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2449CF400();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for StaticPreviewReply()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449B1C6C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2449CF400();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_2449B1CE8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2449CF400();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t initializeBufferWithCopyOfBuffer for HostedPreviewReply(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v15 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_QWORD *)(a2 + 8);
    v9 = *(_BYTE *)(a2 + 16);
    sub_2449A67C8(*(_QWORD *)a2, v8, v9);
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    v10 = a3[6];
    v11 = a1 + v10;
    v12 = a2 + v10;
    v13 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = a3[8];
    *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
    *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for HostedPreviewReply(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_2449A7354(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HostedPreviewReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_2449A67C8(*(_QWORD *)a2, v7, v8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v9 = a3[6];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HostedPreviewReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_2449A67C8(*(_QWORD *)a2, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  v11 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v8;
  sub_2449A7354(v9, v10, v11);
  v12 = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v12;
  v13 = a3[6];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for HostedPreviewReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  return a1;
}

uint64_t assignWithTake for HostedPreviewReply(uint64_t a1, uint64_t a2, int *a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v9 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  sub_2449A7354(v7, v8, v9);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HostedPreviewReply()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449B21A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2449CF400();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 24), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for HostedPreviewReply()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449B2234(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2449CF400();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

uint64_t sub_2449B22B0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2449CF400();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for RenderPayload()
{
  return &type metadata for RenderPayload;
}

ValueMetadata *type metadata accessor for LayerHostPayload()
{
  return &type metadata for LayerHostPayload;
}

ValueMetadata *type metadata accessor for PreviewInstancesPayload()
{
  return &type metadata for PreviewInstancesPayload;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewTraits(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 18))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 17);
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewTraits(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)(result + 17) = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewTraits()
{
  return &type metadata for PreviewTraits;
}

uint64_t getEnumTagSinglePayload for PreviewTraits.Layout(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviewTraits.Layout(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

uint64_t sub_2449B2468(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2449B2484(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    *(_BYTE *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewTraits.Layout()
{
  return &type metadata for PreviewTraits.Layout;
}

ValueMetadata *type metadata accessor for PreviewTraits.Orientation()
{
  return &type metadata for PreviewTraits.Orientation;
}

ValueMetadata *type metadata accessor for Explanation()
{
  return &type metadata for Explanation;
}

uint64_t sub_2449B24D8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_QWORD *sub_2449B254C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    switch(*((_BYTE *)a2 + v5))
    {
      case 0:
        (*(void (**)(_QWORD *))(v4 + 16))(a1);
        *((_BYTE *)v3 + v5) = 0;
        return v3;
      case 1:
        v10 = a2[1];
        *v3 = *a2;
        v3[1] = v10;
        v11 = 1;
        goto LABEL_19;
      case 2:
        v12 = a2[1];
        *v3 = *a2;
        v3[1] = v12;
        v11 = 2;
        goto LABEL_19;
      case 3:
        v13 = a2[1];
        *v3 = *a2;
        v3[1] = v13;
        v11 = 3;
LABEL_19:
        *((_BYTE *)v3 + v5) = v11;
        swift_bridgeObjectRetain();
        break;
      default:
        if (v5 <= 3)
          v9 = v5;
        else
          v9 = 4;
        __asm { BR              X13 }
        return result;
    }
  }
  return v3;
}

uint64_t sub_2449B2698(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 0x10)
    v3 = 16;
  switch(*(_BYTE *)(a1 + v3))
  {
    case 0:
      result = (*(uint64_t (**)(void))(v2 + 8))();
      break;
    case 1:
    case 2:
    case 3:
      result = swift_bridgeObjectRelease();
      break;
    default:
      if (*(unsigned __int8 *)(a1 + v3) <= 3u)
        v4 = *(unsigned __int8 *)(a1 + v3);
      else
        v4 = 4;
      result = ((uint64_t (*)(void))((char *)&loc_2449B26E0 + 4 * byte_2449DB938[v4]))();
      break;
  }
  return result;
}

_QWORD *sub_2449B274C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *result;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  switch(*((_BYTE *)a2 + v5))
  {
    case 0:
      (*(void (**)(_QWORD *))(v4 + 16))(a1);
      *((_BYTE *)a1 + v5) = 0;
      return a1;
    case 1:
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      v8 = 1;
      goto LABEL_13;
    case 2:
      v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      v8 = 2;
      goto LABEL_13;
    case 3:
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v8 = 3;
LABEL_13:
      *((_BYTE *)a1 + v5) = v8;
      swift_bridgeObjectRetain();
      return a1;
    default:
      if (v5 <= 3)
        v6 = v5;
      else
        v6 = 4;
      __asm { BR              X13 }
      return result;
  }
}

_QWORD *sub_2449B2858(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD *result;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    switch(*((_BYTE *)a1 + v7))
    {
      case 0:
        (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
        break;
      case 1:
      case 2:
      case 3:
        swift_bridgeObjectRelease();
        break;
      default:
        if (v7 <= 3)
          v8 = v7;
        else
          v8 = 4;
        __asm { BR              X12 }
        return result;
    }
    switch(*((_BYTE *)a2 + v7))
    {
      case 0:
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
        *((_BYTE *)a1 + v7) = 0;
        return a1;
      case 1:
        *a1 = *a2;
        a1[1] = a2[1];
        v10 = 1;
        goto LABEL_22;
      case 2:
        *a1 = *a2;
        a1[1] = a2[1];
        v10 = 2;
        goto LABEL_22;
      case 3:
        *a1 = *a2;
        a1[1] = a2[1];
        v10 = 3;
LABEL_22:
        *((_BYTE *)a1 + v7) = v10;
        swift_bridgeObjectRetain();
        break;
      default:
        if (v7 <= 3)
          v9 = v7;
        else
          v9 = 4;
        __asm { BR              X12 }
        return result;
    }
  }
  return a1;
}

_OWORD *sub_2449B2A48(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _OWORD *result;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  switch(*((_BYTE *)a2 + v5))
  {
    case 0:
      (*(void (**)(_OWORD *))(v4 + 32))(a1);
      v7 = 0;
      break;
    case 1:
      *a1 = *a2;
      v7 = 1;
      break;
    case 2:
      *a1 = *a2;
      v7 = 2;
      break;
    case 3:
      *a1 = *a2;
      v7 = 3;
      break;
    default:
      if (v5 <= 3)
        v6 = v5;
      else
        v6 = 4;
      __asm { BR              X13 }
      return result;
  }
  *((_BYTE *)a1 + v5) = v7;
  return a1;
}

_OWORD *sub_2449B2B50(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _OWORD *result;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    switch(*((_BYTE *)a1 + v7))
    {
      case 0:
        (*(void (**)(_OWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
        break;
      case 1:
      case 2:
      case 3:
        swift_bridgeObjectRelease();
        break;
      default:
        if (v7 <= 3)
          v8 = v7;
        else
          v8 = 4;
        __asm { BR              X12 }
        return result;
    }
    switch(*((_BYTE *)a2 + v7))
    {
      case 0:
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
        v10 = 0;
        break;
      case 1:
        *a1 = *a2;
        v10 = 1;
        break;
      case 2:
        *a1 = *a2;
        v10 = 2;
        break;
      case 3:
        *a1 = *a2;
        v10 = 3;
        break;
      default:
        if (v7 <= 3)
          v9 = v7;
        else
          v9 = 4;
        __asm { BR              X12 }
        return result;
    }
    *((_BYTE *)a1 + v7) = v10;
  }
  return a1;
}

uint64_t sub_2449B2D24(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 0x10uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 252) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 4)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 253);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2449B2DE8 + 4 * byte_2449DB977[(v4 - 1)]))();
}

void sub_2449B2E34(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10)
    v5 = 16;
  v6 = v5 + 1;
  if (a3 < 0xFD)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 252) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFC)
    __asm { BR              X11 }
  v8 = a2 - 253;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_2449B2FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 0x10uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 4u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2449B3024 + 4 * byte_2449DB985[v3]))();
}

void sub_2449B306C(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 0x10uLL)
    v4 = 16;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 3)
  {
    v5 = a2 - 4;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 4;
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
      a1[v4] = 4;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t destroy for PreviewMetadata()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PreviewMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewMetadata(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviewMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewMetadata(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewMetadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewMetadata()
{
  return &type metadata for PreviewMetadata;
}

ValueMetadata *type metadata accessor for PlaygroundMetadata()
{
  return &type metadata for PlaygroundMetadata;
}

uint64_t getEnumTagSinglePayload for PlaygroundEvent(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PlaygroundEvent(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for PlaygroundEvent()
{
  return &type metadata for PlaygroundEvent;
}

uint64_t destroy for IOSurfacePayload()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IOSurfacePayload(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IOSurfacePayload(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for IOSurfacePayload(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for IOSurfacePayload()
{
  return &type metadata for IOSurfacePayload;
}

uint64_t destroy for PreviewDescription()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PreviewDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_DWORD *)(a1 + 73) = *(_DWORD *)(a2 + 73);
  v5 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewDescription(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v4;
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_BYTE *)(a1 + 75) = *(_BYTE *)(a2 + 75);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for PreviewDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_BYTE *)(a1 + 75) = *(_BYTE *)(a2 + 75);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewDescription(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewDescription(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewDescription()
{
  return &type metadata for PreviewDescription;
}

ValueMetadata *type metadata accessor for PreviewContentDomain()
{
  return &type metadata for PreviewContentDomain;
}

uint64_t destroy for MessageSendingError(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 80);
  while (2)
  {
    switch(v2)
    {
      case 0:
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(a1 + 16);
        result = __swift_destroy_boxed_opaque_existential_1(a1 + 48);
        break;
      case 1:
      case 2:
      case 3:
        result = swift_bridgeObjectRelease();
        break;
      default:
        v2 = *(_DWORD *)a1 + 4;
        continue;
    }
    break;
  }
  return result;
}

uint64_t initializeWithCopy for MessageSendingError(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(unsigned __int8 *)(a2 + 80);
  while (2)
  {
    switch(v4)
    {
      case 0:
        v5 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v5;
        v6 = *(_QWORD *)(a2 + 40);
        *(_QWORD *)(a1 + 40) = v6;
        v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
        swift_bridgeObjectRetain();
        v7(a1 + 16, a2 + 16, v6);
        v8 = *(_QWORD *)(a2 + 72);
        *(_QWORD *)(a1 + 72) = v8;
        (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 48, a2 + 48);
        *(_BYTE *)(a1 + 80) = 0;
        return a1;
      case 1:
        v12 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v12;
        v10 = 1;
        goto LABEL_8;
      case 2:
        v9 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v9;
        v10 = 2;
        goto LABEL_8;
      case 3:
        v11 = *(_QWORD *)(a2 + 8);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = v11;
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
        v10 = 3;
LABEL_8:
        *(_BYTE *)(a1 + 80) = v10;
        swift_bridgeObjectRetain();
        return a1;
      default:
        v4 = *(_DWORD *)a2 + 4;
        continue;
    }
  }
}

uint64_t assignWithCopy for MessageSendingError(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char v9;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 80);
    while (2)
    {
      switch(v4)
      {
        case 0:
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1(a1 + 16);
          __swift_destroy_boxed_opaque_existential_1(a1 + 48);
          break;
        case 1:
        case 2:
        case 3:
          swift_bridgeObjectRelease();
          break;
        default:
          v4 = *(_DWORD *)a1 + 4;
          continue;
      }
      break;
    }
    v5 = *(unsigned __int8 *)(a2 + 80);
    while (2)
    {
      switch(v5)
      {
        case 0:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          v6 = *(_QWORD *)(a2 + 40);
          *(_QWORD *)(a1 + 40) = v6;
          v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
          swift_bridgeObjectRetain();
          v7(a1 + 16, a2 + 16, v6);
          v8 = *(_QWORD *)(a2 + 72);
          *(_QWORD *)(a1 + 72) = v8;
          (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 48, a2 + 48);
          *(_BYTE *)(a1 + 80) = 0;
          return a1;
        case 1:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          v9 = 1;
          goto LABEL_14;
        case 2:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          v9 = 2;
          goto LABEL_14;
        case 3:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
          v9 = 3;
LABEL_14:
          *(_BYTE *)(a1 + 80) = v9;
          swift_bridgeObjectRetain();
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
  }
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
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
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for MessageSendingError(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  char v6;
  __int128 v7;
  __int128 v8;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 80);
    while (2)
    {
      switch(v4)
      {
        case 0:
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1(a1 + 16);
          __swift_destroy_boxed_opaque_existential_1(a1 + 48);
          break;
        case 1:
        case 2:
        case 3:
          swift_bridgeObjectRelease();
          break;
        default:
          v4 = *(_DWORD *)a1 + 4;
          continue;
      }
      break;
    }
    v5 = *(unsigned __int8 *)(a2 + 80);
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = 0;
          v7 = *(_OWORD *)(a2 + 48);
          *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
          *(_OWORD *)(a1 + 48) = v7;
          *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
          v8 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v8;
          break;
        case 1:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          v6 = 1;
          break;
        case 2:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          v6 = 2;
          break;
        case 3:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
          v6 = 3;
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
    *(_BYTE *)(a1 + 80) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageSendingError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 >= 4)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MessageSendingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_2449B3CE8(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 4)
    return (*(_DWORD *)a1 + 4);
  return result;
}

uint64_t sub_2449B3D04(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageSendingError()
{
  return &type metadata for MessageSendingError;
}

uint64_t _s19PreviewsMessagingOS16AgentMessageTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_2449B3D8C + 4 * byte_2449DB9A7[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_2449B3DC0 + 4 * byte_2449DB9A2[v4]))();
}

uint64_t sub_2449B3DC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B3DC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449B3DD0);
  return result;
}

uint64_t sub_2449B3DDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449B3DE4);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_2449B3DE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B3DF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewDescription.Key()
{
  return &type metadata for PreviewDescription.Key;
}

uint64_t _s19PreviewsMessagingOS10ChromeTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449B3E58 + 4 * byte_2449DB9B1[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2449B3E8C + 4 * byte_2449DB9AC[v4]))();
}

uint64_t sub_2449B3E8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B3E94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449B3E9CLL);
  return result;
}

uint64_t sub_2449B3EA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449B3EB0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2449B3EB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B3EBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IOSurfacePayload.Key()
{
  return &type metadata for IOSurfacePayload.Key;
}

ValueMetadata *type metadata accessor for PlaygroundEvent.CodingKeys()
{
  return &type metadata for PlaygroundEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for PlaygroundEvent.ExitedNormallyCodingKeys()
{
  return &type metadata for PlaygroundEvent.ExitedNormallyCodingKeys;
}

ValueMetadata *type metadata accessor for PlaygroundEvent.ThrewErrorCodingKeys()
{
  return &type metadata for PlaygroundEvent.ThrewErrorCodingKeys;
}

ValueMetadata *type metadata accessor for PlaygroundMetadata.CodingKeys()
{
  return &type metadata for PlaygroundMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for PreviewMetadata.Key()
{
  return &type metadata for PreviewMetadata.Key;
}

ValueMetadata *type metadata accessor for Explanation.Key()
{
  return &type metadata for Explanation.Key;
}

ValueMetadata *type metadata accessor for PreviewTraits.Layout.Discriminant()
{
  return &type metadata for PreviewTraits.Layout.Discriminant;
}

ValueMetadata *type metadata accessor for PreviewTraits.Layout.Key()
{
  return &type metadata for PreviewTraits.Layout.Key;
}

ValueMetadata *type metadata accessor for PreviewTraits.Key()
{
  return &type metadata for PreviewTraits.Key;
}

ValueMetadata *type metadata accessor for PreviewInstancesPayload.Key()
{
  return &type metadata for PreviewInstancesPayload.Key;
}

ValueMetadata *type metadata accessor for LayerHostPayload.Key()
{
  return &type metadata for LayerHostPayload.Key;
}

ValueMetadata *type metadata accessor for RenderPayload.Key()
{
  return &type metadata for RenderPayload.Key;
}

uint64_t storeEnumTagSinglePayload for HostedPreviewReply.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449B3FF4 + 4 * byte_2449DB9BB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2449B4028 + 4 * byte_2449DB9B6[v4]))();
}

uint64_t sub_2449B4028(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B4030(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449B4038);
  return result;
}

uint64_t sub_2449B4044(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449B404CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2449B4050(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B4058(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostedPreviewReply.Key()
{
  return &type metadata for HostedPreviewReply.Key;
}

ValueMetadata *type metadata accessor for StaticPreviewReply.Key()
{
  return &type metadata for StaticPreviewReply.Key;
}

ValueMetadata *type metadata accessor for GridIndex.Key()
{
  return &type metadata for GridIndex.Key;
}

uint64_t _s19PreviewsMessagingOS13PreviewTraitsV11OrientationOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449B40E0 + 4 * byte_2449DB9C5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2449B4114 + 4 * byte_2449DB9C0[v4]))();
}

uint64_t sub_2449B4114(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B411C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449B4124);
  return result;
}

uint64_t sub_2449B4130(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449B4138);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2449B413C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B4144(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostIdentity.Discriminant()
{
  return &type metadata for HostIdentity.Discriminant;
}

ValueMetadata *type metadata accessor for HostIdentity.Key()
{
  return &type metadata for HostIdentity.Key;
}

uint64_t _s19PreviewsMessagingOS15PlaygroundEventO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449B41BC + 4 * byte_2449DB9CF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2449B41F0 + 4 * byte_2449DB9CA[v4]))();
}

uint64_t sub_2449B41F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B41F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449B4200);
  return result;
}

uint64_t sub_2449B420C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449B4214);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2449B4218(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B4220(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SceneLayout.Discriminant()
{
  return &type metadata for SceneLayout.Discriminant;
}

uint64_t _s19PreviewsMessagingOS20PreviewContentDomainOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449B4288 + 4 * byte_2449DB9D9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2449B42BC + 4 * byte_2449DB9D4[v4]))();
}

uint64_t sub_2449B42BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B42C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449B42CCLL);
  return result;
}

uint64_t sub_2449B42D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449B42E0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2449B42E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B42EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SceneLayout.Key()
{
  return &type metadata for SceneLayout.Key;
}

ValueMetadata *type metadata accessor for GeometryPayload.Key()
{
  return &type metadata for GeometryPayload.Key;
}

uint64_t _s19PreviewsMessagingOS15PlaygroundEventO20ThrewErrorCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2449B4358 + 4 * byte_2449DB9DE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2449B4378 + 4 * byte_2449DB9E3[v4]))();
}

_BYTE *sub_2449B4358(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2449B4378(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449B4380(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449B4388(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449B4390(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449B4398(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TimelinePayload.Key()
{
  return &type metadata for TimelinePayload.Key;
}

uint64_t _s19PreviewsMessagingOS15PreviewMetadataV3KeyOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449B4400 + 4 * byte_2449DB9ED[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2449B4434 + 4 * byte_2449DB9E8[v4]))();
}

uint64_t sub_2449B4434(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B443C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449B4444);
  return result;
}

uint64_t sub_2449B4450(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449B4458);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2449B445C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449B4464(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LegacyAgentPayload.Key()
{
  return &type metadata for LegacyAgentPayload.Key;
}

unint64_t sub_2449B4484()
{
  unint64_t result;

  result = qword_2573A23A8;
  if (!qword_2573A23A8)
  {
    result = MEMORY[0x24951C158](&unk_2449DCC20, &type metadata for LegacyAgentPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23A8);
  }
  return result;
}

unint64_t sub_2449B44CC()
{
  unint64_t result;

  result = qword_2573A23B0;
  if (!qword_2573A23B0)
  {
    result = MEMORY[0x24951C158](&unk_2449DCCC0, &type metadata for TimelinePayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23B0);
  }
  return result;
}

unint64_t sub_2449B4514()
{
  unint64_t result;

  result = qword_2573A23B8;
  if (!qword_2573A23B8)
  {
    result = MEMORY[0x24951C158](&unk_2449DCD60, &type metadata for GeometryPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23B8);
  }
  return result;
}

unint64_t sub_2449B455C()
{
  unint64_t result;

  result = qword_2573A23C0;
  if (!qword_2573A23C0)
  {
    result = MEMORY[0x24951C158](&unk_2449DCE00, &type metadata for SceneLayout.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23C0);
  }
  return result;
}

unint64_t sub_2449B45A4()
{
  unint64_t result;

  result = qword_2573A23C8;
  if (!qword_2573A23C8)
  {
    result = MEMORY[0x24951C158](&unk_2449DCEA0, &type metadata for SceneLayout.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A23C8);
  }
  return result;
}

unint64_t sub_2449B45EC()
{
  unint64_t result;

  result = qword_2573A23D0;
  if (!qword_2573A23D0)
  {
    result = MEMORY[0x24951C158](&unk_2449DCF40, &type metadata for HostIdentity.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23D0);
  }
  return result;
}

unint64_t sub_2449B4634()
{
  unint64_t result;

  result = qword_2573A23D8;
  if (!qword_2573A23D8)
  {
    result = MEMORY[0x24951C158](&unk_2449DCFE0, &type metadata for HostIdentity.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A23D8);
  }
  return result;
}

unint64_t sub_2449B467C()
{
  unint64_t result;

  result = qword_2573A23E0;
  if (!qword_2573A23E0)
  {
    result = MEMORY[0x24951C158](&unk_2449DD080, &type metadata for GridIndex.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23E0);
  }
  return result;
}

unint64_t sub_2449B46C4()
{
  unint64_t result;

  result = qword_2573A23E8;
  if (!qword_2573A23E8)
  {
    result = MEMORY[0x24951C158](&unk_2449DD120, &type metadata for StaticPreviewReply.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23E8);
  }
  return result;
}

unint64_t sub_2449B470C()
{
  unint64_t result;

  result = qword_2573A23F0;
  if (!qword_2573A23F0)
  {
    result = MEMORY[0x24951C158](&unk_2449DD1C0, &type metadata for HostedPreviewReply.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23F0);
  }
  return result;
}

unint64_t sub_2449B4754()
{
  unint64_t result;

  result = qword_2573A23F8;
  if (!qword_2573A23F8)
  {
    result = MEMORY[0x24951C158](&unk_2449DD260, &type metadata for RenderPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A23F8);
  }
  return result;
}

unint64_t sub_2449B479C()
{
  unint64_t result;

  result = qword_2573A2400;
  if (!qword_2573A2400)
  {
    result = MEMORY[0x24951C158](&unk_2449DD300, &type metadata for LayerHostPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2400);
  }
  return result;
}

unint64_t sub_2449B47E4()
{
  unint64_t result;

  result = qword_2573A2408;
  if (!qword_2573A2408)
  {
    result = MEMORY[0x24951C158](&unk_2449DD3A0, &type metadata for PreviewInstancesPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2408);
  }
  return result;
}

unint64_t sub_2449B482C()
{
  unint64_t result;

  result = qword_2573A2410;
  if (!qword_2573A2410)
  {
    result = MEMORY[0x24951C158](&unk_2449DD440, &type metadata for PreviewTraits.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2410);
  }
  return result;
}

unint64_t sub_2449B4874()
{
  unint64_t result;

  result = qword_2573A2418;
  if (!qword_2573A2418)
  {
    result = MEMORY[0x24951C158](&unk_2449DD4E0, &type metadata for PreviewTraits.Layout.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2418);
  }
  return result;
}

unint64_t sub_2449B48BC()
{
  unint64_t result;

  result = qword_2573A2420;
  if (!qword_2573A2420)
  {
    result = MEMORY[0x24951C158](&unk_2449DD580, &type metadata for PreviewTraits.Layout.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A2420);
  }
  return result;
}

unint64_t sub_2449B4904()
{
  unint64_t result;

  result = qword_2573A2428;
  if (!qword_2573A2428)
  {
    result = MEMORY[0x24951C158](&unk_2449DD620, &type metadata for Explanation.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2428);
  }
  return result;
}

void sub_2449B4948()
{
  JUMPOUT(0x24951C158);
}

void sub_2449B4958()
{
  JUMPOUT(0x24951C158);
}

void sub_2449B4968()
{
  JUMPOUT(0x24951C158);
}

unint64_t sub_2449B497C()
{
  unint64_t result;

  result = qword_2573A2430;
  if (!qword_2573A2430)
  {
    result = MEMORY[0x24951C158](&unk_2449DD870, &type metadata for PreviewMetadata.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2430);
  }
  return result;
}

unint64_t sub_2449B49C4()
{
  unint64_t result;

  result = qword_2573A2438;
  if (!qword_2573A2438)
  {
    result = MEMORY[0x24951C158](&unk_2449DD928, &type metadata for PlaygroundMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2438);
  }
  return result;
}

unint64_t sub_2449B4A0C()
{
  unint64_t result;

  result = qword_2573A2440;
  if (!qword_2573A2440)
  {
    result = MEMORY[0x24951C158](&unk_2449DD9E0, &type metadata for PlaygroundEvent.ThrewErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2440);
  }
  return result;
}

unint64_t sub_2449B4A54()
{
  unint64_t result;

  result = qword_2573A2448;
  if (!qword_2573A2448)
  {
    result = MEMORY[0x24951C158](&unk_2449DDAE8, &type metadata for PlaygroundEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2448);
  }
  return result;
}

unint64_t sub_2449B4A9C()
{
  unint64_t result;

  result = qword_2573A2450;
  if (!qword_2573A2450)
  {
    result = MEMORY[0x24951C158](&unk_2449DDB88, &type metadata for IOSurfacePayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2450);
  }
  return result;
}

unint64_t sub_2449B4AE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573A2458;
  if (!qword_2573A2458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573A2460);
    result = MEMORY[0x24951C158](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2573A2458);
  }
  return result;
}

unint64_t sub_2449B4B34()
{
  unint64_t result;

  result = qword_2573A2468;
  if (!qword_2573A2468)
  {
    result = MEMORY[0x24951C158](&unk_2449DDC60, &type metadata for PreviewDescription.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2468);
  }
  return result;
}

unint64_t sub_2449B4B7C()
{
  unint64_t result;

  result = qword_2573A2470;
  if (!qword_2573A2470)
  {
    result = MEMORY[0x24951C158](&unk_2449DDA08, &type metadata for PlaygroundEvent.ExitedNormallyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2470);
  }
  return result;
}

unint64_t sub_2449B4BC4()
{
  unint64_t result;

  result = qword_2573A2478;
  if (!qword_2573A2478)
  {
    result = MEMORY[0x24951C158](&unk_2449DDA30, &type metadata for PlaygroundEvent.ExitedNormallyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2478);
  }
  return result;
}

unint64_t sub_2449B4C0C()
{
  unint64_t result;

  result = qword_2573A2480;
  if (!qword_2573A2480)
  {
    result = MEMORY[0x24951C158](&unk_2449DD950, &type metadata for PlaygroundEvent.ThrewErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2480);
  }
  return result;
}

unint64_t sub_2449B4C54()
{
  unint64_t result;

  result = qword_2573A2488;
  if (!qword_2573A2488)
  {
    result = MEMORY[0x24951C158](&unk_2449DD978, &type metadata for PlaygroundEvent.ThrewErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2488);
  }
  return result;
}

unint64_t sub_2449B4C9C()
{
  unint64_t result;

  result = qword_2573A2490;
  if (!qword_2573A2490)
  {
    result = MEMORY[0x24951C158](&unk_2449DDA58, &type metadata for PlaygroundEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2490);
  }
  return result;
}

unint64_t sub_2449B4CE4()
{
  unint64_t result;

  result = qword_2573A2498;
  if (!qword_2573A2498)
  {
    result = MEMORY[0x24951C158](&unk_2449DDA80, &type metadata for PlaygroundEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A2498);
  }
  return result;
}

unint64_t sub_2449B4D2C()
{
  unint64_t result;

  result = qword_2573A24A0;
  if (!qword_2573A24A0)
  {
    result = MEMORY[0x24951C158](&unk_2449DD898, &type metadata for PlaygroundMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A24A0);
  }
  return result;
}

unint64_t sub_2449B4D74()
{
  unint64_t result;

  result = qword_2573A24A8;
  if (!qword_2573A24A8)
  {
    result = MEMORY[0x24951C158](&unk_2449DD8C0, &type metadata for PlaygroundMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573A24A8);
  }
  return result;
}

void sub_2449B4DB8()
{
  JUMPOUT(0x24951C158);
}

void sub_2449B4DC8()
{
  JUMPOUT(0x24951C158);
}

unint64_t sub_2449B4DD8()
{
  unint64_t result;

  result = qword_2573A24B0;
  if (!qword_2573A24B0)
  {
    result = MEMORY[0x24951C158](&unk_2449DCE28, &type metadata for SceneLayout.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A24B0);
  }
  return result;
}

unint64_t sub_2449B4E1C()
{
  unint64_t result;

  result = qword_2573A24B8;
  if (!qword_2573A24B8)
  {
    result = MEMORY[0x24951C158](&unk_2449DCF68, &type metadata for HostIdentity.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A24B8);
  }
  return result;
}

unint64_t sub_2449B4E60()
{
  unint64_t result;

  result = qword_2573A24C0;
  if (!qword_2573A24C0)
  {
    result = MEMORY[0x24951C158](&unk_2449DD508, &type metadata for PreviewTraits.Layout.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A24C0);
  }
  return result;
}

uint64_t sub_2449B4EA4()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_2449B4EEC()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

uint64_t sub_2449B4F30(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2449CFCD0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2449B4FC4()
{
  return 0x4E79616C70736964;
}

uint64_t sub_2449B4FE4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6F4E646574697865 && a2 == 0xEE00796C6C616D72;
  if (v3 || (sub_2449CFCD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7272457765726874 && a2 == 0xEA0000000000726FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2449CFCD0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2449B50EC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2449CFCD0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2449B5180()
{
  return 0x7470697263736564;
}

uint64_t sub_2449B51A0()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_2449B51E8()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA)
    return 10;
  else
    return v0;
}

unint64_t sub_2449B5230()
{
  unint64_t result;

  result = qword_2573A24C8;
  if (!qword_2573A24C8)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageSendingError, &type metadata for MessageSendingError);
    atomic_store(result, (unint64_t *)&qword_2573A24C8);
  }
  return result;
}

unint64_t sub_2449B5274()
{
  unint64_t result;

  result = qword_2573A24D0;
  if (!qword_2573A24D0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewContentDomain, &type metadata for PreviewContentDomain);
    atomic_store(result, (unint64_t *)&qword_2573A24D0);
  }
  return result;
}

unint64_t sub_2449B52B8()
{
  unint64_t result;

  result = qword_2573A24D8;
  if (!qword_2573A24D8)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewTraits.Orientation, &type metadata for PreviewTraits.Orientation);
    atomic_store(result, (unint64_t *)&qword_2573A24D8);
  }
  return result;
}

uint64_t sub_2449B52FC()
{
  return sub_2449A84C4();
}

unint64_t sub_2449B5318()
{
  unint64_t result;

  result = qword_2573A24E0;
  if (!qword_2573A24E0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for ChromeType, &type metadata for ChromeType);
    atomic_store(result, (unint64_t *)&qword_2573A24E0);
  }
  return result;
}

uint64_t sub_2449B535C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 24);
  *a2 = v3;
  a2[1] = v4;
  return sub_244964F34(v3, v4);
}

unint64_t sub_2449B536C()
{
  unint64_t result;

  result = qword_2573A24E8;
  if (!qword_2573A24E8)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for AgentMessageType, &type metadata for AgentMessageType);
    atomic_store(result, (unint64_t *)&qword_2573A24E8);
  }
  return result;
}

uint64_t sub_2449B53B0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1)
    return sub_2449A7354(a1, a2, a3);
  return a1;
}

uint64_t sub_2449B5400(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
          break;
      }
    }
LABEL_23:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_2449CFD48();
    swift_bridgeObjectRetain_n();
    sub_2449CF88C();
    swift_bridgeObjectRelease();
    v18 = sub_2449CFD84();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_39;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_2449CFCD0() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_2449CFCD0() & 1) != 0)
          goto LABEL_7;
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 4;
  if (v3 + 4 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_23;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_2449B5690(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
          break;
      }
    }
LABEL_23:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_2449CFD48();
    swift_bridgeObjectRetain();
    sub_2449CF88C();
    v18 = sub_2449CFD84();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_39;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_2449CFCD0() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_2449CFCD0() & 1) != 0)
          goto LABEL_7;
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 4;
  if (v3 + 4 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_23;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_2449B5914(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v30)
            return 1;
          v11 = *(_QWORD *)(v29 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_2449CFD48();
    swift_bridgeObjectRetain_n();
    sub_2449CF88C();
    swift_bridgeObjectRelease();
    v18 = sub_2449CFD84();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_2449CFCD0() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_2449CFCD0() & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t PreviewVariantGroup.id.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewVariantGroup.id.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*PreviewVariantGroup.id.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariantGroup.associatedGroupIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewVariantGroup.associatedGroupIDs.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*PreviewVariantGroup.associatedGroupIDs.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariantGroup.overridesConfiguration.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v1[3];
  v3 = v1[4];
  v4 = v1[5];
  v5 = v1[6];
  v6 = v1[7];
  v7 = v1[8];
  v8 = v1[9];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  return sub_2449B5C70(v2, v3);
}

uint64_t sub_2449B5C70(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2449B5CD4();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2449B5CD4()
{
  return swift_bridgeObjectRetain();
}

__n128 PreviewVariantGroup.overridesConfiguration.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  __n128 v4;
  __int128 v5;
  __int128 v6;

  v5 = a1[1];
  v6 = *a1;
  v4 = (__n128)a1[2];
  v2 = *((_QWORD *)a1 + 6);
  sub_2449B5D48(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
  *(_OWORD *)(v1 + 24) = v6;
  *(_OWORD *)(v1 + 40) = v5;
  result = v4;
  *(__n128 *)(v1 + 56) = v4;
  *(_QWORD *)(v1 + 72) = v2;
  return result;
}

uint64_t sub_2449B5D48(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    sub_2449B5DAC();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2449B5DAC()
{
  return swift_bridgeObjectRelease();
}

uint64_t (*PreviewVariantGroup.overridesConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariantGroup.variantsConfiguration.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1[10];
  v3 = v1[11];
  v4 = v1[12];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  return sub_2449B5DDC(v2, v3);
}

uint64_t sub_2449B5DDC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

__n128 PreviewVariantGroup.variantsConfiguration.setter(__n128 *a1)
{
  uint64_t *v1;
  uint64_t v2;
  __n128 result;
  __n128 v4;

  v4 = *a1;
  v2 = a1[1].n128_i64[0];
  sub_2449B5E50(v1[10], v1[11]);
  result = v4;
  *((__n128 *)v1 + 5) = v4;
  v1[12] = v2;
  return result;
}

uint64_t sub_2449B5E50(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*PreviewVariantGroup.variantsConfiguration.modify())()
{
  return nullsub_1;
}

__n128 PreviewVariantGroup.init(id:associatedGroupIDs:overridesConfiguration:variantsConfiguration:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X3>, uint64_t a5@<X8>)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __n128 result;

  v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a5 + 24) = *(_OWORD *)a3;
  v6 = a1[1];
  v7 = *(_QWORD *)(a3 + 48);
  v8 = a4[1].n128_u64[0];
  *(_QWORD *)a5 = *a1;
  *(_QWORD *)(a5 + 8) = v6;
  *(_QWORD *)(a5 + 16) = a2;
  *(_OWORD *)(a5 + 40) = v5;
  *(_OWORD *)(a5 + 56) = *(_OWORD *)(a3 + 32);
  *(_QWORD *)(a5 + 72) = v7;
  result = *a4;
  *(__n128 *)(a5 + 80) = *a4;
  *(_QWORD *)(a5 + 96) = v8;
  return result;
}

uint64_t sub_2449B5ECC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2449B5F08 + 4 * byte_2449DE940[a1]))(0xD000000000000016, 0x80000002449E2CA0);
}

uint64_t sub_2449B5F08()
{
  return 25705;
}

unint64_t sub_2449B5F14()
{
  return 0xD000000000000015;
}

uint64_t sub_2449B5F30()
{
  uint64_t v0;

  return v0 + 2;
}

void sub_2449B5F48(char *a1)
{
  sub_24499FD7C(*a1);
}

void sub_2449B5F54()
{
  char *v0;

  sub_2449C7EB0(*v0);
}

void sub_2449B5F5C(uint64_t a1)
{
  char *v1;

  sub_2449239A8(a1, *v1);
}

void sub_2449B5F64(uint64_t a1)
{
  char *v1;

  sub_2449CAC48(a1, *v1);
}

uint64_t sub_2449B5F6C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449BA680();
  *a1 = result;
  return result;
}

uint64_t sub_2449B5F98@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449B5ECC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449B5FC0()
{
  unsigned __int8 *v0;

  return sub_2449B5ECC(*v0);
}

uint64_t PreviewVariantGroup.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B6018(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[32];
  _BYTE v9[64];
  _QWORD *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _BYTE v15[24];
  _BYTE v16[56];

  v3 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_244940784(v4);
  swift_bridgeObjectRelease();
  sub_2449314A4((uint64_t)(a1 + 3), (uint64_t)v16, &qword_2573A2710);
  sub_2449314A4((uint64_t)(a1 + 10), (uint64_t)v15, &qword_2573A2718);
  v14 = 0;
  v12 = v3;
  v13 = v2;
  v11 = 3;
  v10 = v5;
  v9[63] = 1;
  sub_2449314A4((uint64_t)v16, (uint64_t)v9, &qword_2573A2710);
  v8[31] = 2;
  sub_2449314A4((uint64_t)v15, (uint64_t)v8, &qword_2573A2718);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2540);
  sub_2449B64BC();
  sub_2449B6500();
  sub_2449BAE18(&qword_2573A2548, &qword_2573A2540, (uint64_t (*)(void))sub_2449B6500, MEMORY[0x24BE76D10]);
  sub_2449BA75C();
  sub_2449BA7A0();
  v6 = sub_2449CF5EC();
  swift_bridgeObjectRelease();
  swift_release();
  return v6;
}

uint64_t sub_2449B61C0()
{
  uint64_t v0;

  return sub_2449B6018(*(uint64_t **)(v0 + 16));
}

uint64_t PreviewVariantGroup.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  ValueMetadata *v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[3];
  ValueMetadata *v23;
  unint64_t v24;
  _QWORD v25[3];
  ValueMetadata *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v26 = &type metadata for PreviewVariantGroup.Key;
  v5 = sub_2449B64BC();
  v27 = v5;
  LOBYTE(v25[0]) = 0;
  sub_2449B6500();
  sub_2449CF37C();
  if (v2)
  {
    v6 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    v8 = v30;
    v7 = v31;
    v26 = &type metadata for PreviewVariantGroup.Key;
    v27 = v5;
    LOBYTE(v25[0]) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2540);
    sub_2449BAE18(&qword_2573A2548, &qword_2573A2540, (uint64_t (*)(void))sub_2449B6500, MEMORY[0x24BE76D10]);
    sub_2449CF3B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    if (v22[0])
      v10 = v22[0];
    else
      v10 = MEMORY[0x24BEE4AF8];
    v11 = sub_2449BA6C8(v10);
    swift_bridgeObjectRelease();
    v23 = &type metadata for PreviewVariantGroup.Key;
    v24 = v5;
    LOBYTE(v22[0]) = 1;
    sub_2449BA75C();
    sub_2449CF3B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    v12 = v25[0];
    v15 = v25[1];
    v16 = v25[2];
    v17 = v26;
    v18 = v27;
    v19 = v28;
    v32 = v29;
    v23 = &type metadata for PreviewVariantGroup.Key;
    v24 = v5;
    LOBYTE(v22[0]) = 2;
    sub_2449BA7A0();
    sub_2449CF3B8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    v13 = sub_2449CF400();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
    *(_QWORD *)a2 = v8;
    *(_QWORD *)(a2 + 8) = v7;
    *(_QWORD *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v12;
    *(_QWORD *)(a2 + 32) = v15;
    *(_QWORD *)(a2 + 40) = v16;
    *(_QWORD *)(a2 + 48) = v17;
    *(_QWORD *)(a2 + 56) = v18;
    v14 = v32;
    *(_QWORD *)(a2 + 64) = v19;
    *(_QWORD *)(a2 + 72) = v14;
    *(_OWORD *)(a2 + 80) = v20;
    *(_QWORD *)(a2 + 96) = v21;
  }
  return result;
}

unint64_t sub_2449B64BC()
{
  unint64_t result;

  result = qword_2573A2530;
  if (!qword_2573A2530)
  {
    result = MEMORY[0x24951C158](&unk_2449DFA48, &type metadata for PreviewVariantGroup.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2530);
  }
  return result;
}

unint64_t sub_2449B6500()
{
  unint64_t result;

  result = qword_2573A2538;
  if (!qword_2573A2538)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariantGroup.ID, &type metadata for PreviewVariantGroup.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2538);
  }
  return result;
}

uint64_t sub_2449B6548()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B6598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewVariantGroup.init(propertyListValue:)(a1, a2);
}

uint64_t PreviewVariantGroup.overridesVariants.getter()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    return swift_bridgeObjectRetain();
  else
    return MEMORY[0x24BEE4AF8];
}

uint64_t PreviewVariantGroup.gridVariants.getter()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v0 + 88))
  {
    v5 = MEMORY[0x24BEE4AF8];
    v2 = *(_QWORD *)(*(_QWORD *)(v0 + 96) + 16);
    if (v2)
    {
      swift_bridgeObjectRetain_n();
      v3 = 48;
      do
      {
        v4 = swift_bridgeObjectRetain();
        sub_24492C090(v4);
        v3 += 24;
        --v2;
      }
      while (v2);
      swift_bridgeObjectRelease_n();
      return v5;
    }
  }
  return result;
}

uint64_t PreviewVariantGroup.allVariants.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2560);
  MEMORY[0x24BDAC7A8](v1);
  if (*(_QWORD *)(v0 + 32))
    swift_bridgeObjectRetain();
  v2 = PreviewVariantGroup.gridVariants.getter();
  sub_24492C090(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2568);
  sub_2449BA7E4();
  sub_2449320D0(&qword_2573A2578, &qword_2573A2568, MEMORY[0x24BEE12C8]);
  sub_2449CF0E8();
  sub_2449320D0(&qword_2573A2580, &qword_2573A2560, MEMORY[0x24BE76230]);
  return sub_2449CF8B0();
}

uint64_t PreviewOverridesConfiguration.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewOverridesConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.title.modify())()
{
  return nullsub_1;
}

uint64_t PreviewOverridesConfiguration.selectionBehavior.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_BYTE *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  return sub_2449B5CD4();
}

__n128 PreviewOverridesConfiguration.selectionBehavior.setter(__n128 *a1)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;
  __n128 v5;

  v5 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u8[8];
  sub_2449B5DAC();
  result = v5;
  v1[1] = v5;
  v1[2].n128_u64[0] = v2;
  v1[2].n128_u8[8] = v3;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.selectionBehavior.modify())()
{
  return nullsub_1;
}

uint64_t PreviewOverridesConfiguration.variants.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewOverridesConfiguration.variants.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.variants.modify())()
{
  return nullsub_1;
}

__n128 PreviewOverridesConfiguration.init(title:selectionBehavior:variants:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, unint64_t a4@<X3>, __n128 *a5@<X8>)
{
  unint64_t v5;
  unsigned __int8 v6;
  __n128 result;

  v5 = a3[1].n128_u64[0];
  v6 = a3[1].n128_u8[8];
  a5->n128_u64[0] = a1;
  a5->n128_u64[1] = a2;
  result = *a3;
  a5[1] = *a3;
  a5[2].n128_u64[0] = v5;
  a5[2].n128_u8[8] = v6;
  a5[3].n128_u64[0] = a4;
  return result;
}

uint64_t sub_2449B6938(char a1)
{
  if (!a1)
    return 0x656C746974;
  if (a1 == 1)
    return 0xD000000000000011;
  return 0x73746E6169726176;
}

uint64_t sub_2449B6990(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24499E240(*a1, *a2);
}

uint64_t sub_2449B699C()
{
  return sub_2449C7F78();
}

uint64_t sub_2449B69A4()
{
  return sub_244922CB4();
}

uint64_t sub_2449B69AC()
{
  return sub_2449CBFEC();
}

uint64_t sub_2449B69B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244940DA8();
  *a1 = result;
  return result;
}

uint64_t sub_2449B69E8@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449B6938(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449B6A10()
{
  char *v0;

  return sub_2449B6938(*v0);
}

uint64_t PreviewOverridesConfiguration.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B6A60()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2568);
  sub_2449BA830();
  sub_2449BA874();
  sub_2449BAE18(&qword_2573A2598, &qword_2573A2568, (uint64_t (*)(void))sub_2449BA8B8, MEMORY[0x24BE76D10]);
  return sub_2449CF5F8();
}

uint64_t PreviewOverridesConfiguration.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _BYTE v16[24];
  ValueMetadata *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v17 = &type metadata for PreviewOverridesConfiguration.Key;
  v5 = sub_2449BA830();
  v18 = v5;
  v16[0] = 0;
  sub_2449CF37C();
  if (v2)
  {
    v6 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v8 = v19;
    v7 = v20;
    v17 = &type metadata for PreviewOverridesConfiguration.Key;
    v18 = v5;
    v16[0] = 1;
    sub_2449BA874();
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v17 = &type metadata for PreviewOverridesConfiguration.Key;
    v18 = v5;
    v16[0] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2568);
    sub_2449BAE18(&qword_2573A2598, &qword_2573A2568, (uint64_t (*)(void))sub_2449BA8B8, MEMORY[0x24BE76D10]);
    sub_2449CF37C();
    v10 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v11 = v21;
    *(_QWORD *)a2 = v8;
    *(_QWORD *)(a2 + 8) = v7;
    *(_QWORD *)(a2 + 16) = v12;
    *(_QWORD *)(a2 + 24) = v13;
    *(_QWORD *)(a2 + 32) = v14;
    *(_BYTE *)(a2 + 40) = v15;
    *(_QWORD *)(a2 + 48) = v11;
  }
  return result;
}

uint64_t PreviewOverridesConfiguration.defaultSelection.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;

  v1 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v0 + 40) & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v4 = v0 + 24;
    v2 = *(_QWORD *)(v0 + 24);
    v3 = *(_QWORD *)(v4 + 8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A25A8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2449D1F20;
    *(_QWORD *)(inited + 32) = v2;
    *(_QWORD *)(inited + 40) = v3;
    sub_2449B5CD4();
    v1 = sub_2449BA8FC(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  return v1;
}

uint64_t sub_2449B6E3C()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B6E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewOverridesConfiguration.init(propertyListValue:)(a1, a2);
}

uint64_t PreviewVariantsConfiguration.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

PreviewsMessagingOS::PreviewVariantsConfiguration __swiftcall PreviewVariantsConfiguration.init(title:variants:)(Swift::String title, Swift::OpaquePointer variants)
{
  uint64_t *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PreviewsMessagingOS::PreviewVariantsConfiguration result;

  object = title._object;
  countAndFlagsBits = title._countAndFlagsBits;
  v6 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A25B0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2449D1F20;
  *(_QWORD *)(v7 + 32) = 0;
  *(_QWORD *)(v7 + 40) = 0;
  *(Swift::OpaquePointer *)(v7 + 48) = variants;
  *v6 = countAndFlagsBits;
  v6[1] = (uint64_t)object;
  v6[2] = v7;
  result.sections._rawValue = v9;
  result.title._object = v8;
  result.title._countAndFlagsBits = v7;
  return result;
}

PreviewsMessagingOS::PreviewVariantsConfiguration __swiftcall PreviewVariantsConfiguration.init(title:sections:)(Swift::String title, Swift::OpaquePointer sections)
{
  uint64_t v2;
  PreviewsMessagingOS::PreviewVariantsConfiguration result;

  *(Swift::String *)v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = sections;
  result.title = title;
  result.sections = sections;
  return result;
}

uint64_t sub_2449B6F38(char a1)
{
  if ((a1 & 1) != 0)
    return 0x736E6F6974636573;
  else
    return 0x656C746974;
}

uint64_t sub_2449B6F6C(char *a1, char *a2)
{
  return sub_24499EE74(*a1, *a2);
}

uint64_t sub_2449B6F78()
{
  return sub_2449C8018();
}

uint64_t sub_2449B6F80()
{
  return sub_244923234();
}

uint64_t sub_2449B6F88()
{
  return sub_2449CB814();
}

uint64_t sub_2449B6F90@<X0>(char *a1@<X8>)
{
  return sub_24493C2EC(a1);
}

uint64_t sub_2449B6F9C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449B6F38(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449B6FC4()
{
  char *v0;

  return sub_2449B6F38(*v0);
}

uint64_t PreviewVariantsConfiguration.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B7004()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A25C0);
  sub_2449BAAB4();
  sub_2449BAE18(&qword_2573A25C8, &qword_2573A25C0, (uint64_t (*)(void))sub_2449BAAF8, MEMORY[0x24BE76D10]);
  return sub_2449CF604();
}

uint64_t PreviewVariantsConfiguration.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];
  ValueMetadata *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v13 = &type metadata for PreviewVariantsConfiguration.Key;
  v5 = sub_2449BAAB4();
  v14 = v5;
  v12[0] = 0;
  sub_2449CF37C();
  if (v2)
  {
    v6 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v8 = v15;
    v7 = v16;
    v13 = &type metadata for PreviewVariantsConfiguration.Key;
    v14 = v5;
    v12[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A25C0);
    sub_2449BAE18(&qword_2573A25C8, &qword_2573A25C0, (uint64_t (*)(void))sub_2449BAAF8, MEMORY[0x24BE76D10]);
    sub_2449CF37C();
    v10 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v11 = v17;
    *a2 = v8;
    a2[1] = v7;
    a2[2] = v11;
  }
  return result;
}

uint64_t static PreviewVariantsConfiguration.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_2449CFCD0() & 1) != 0)
    return sub_24493858C(v2, v3);
  else
    return 0;
}

uint64_t sub_2449B728C()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B72C4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return PreviewVariantsConfiguration.init(propertyListValue:)(a1, a2);
}

uint64_t sub_2449B72D8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_2449CFCD0() & 1) != 0)
    return sub_24493858C(v2, v3);
  else
    return 0;
}

uint64_t PreviewVariantsConfiguration.Section.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewVariantsConfiguration.Section.variants.getter()
{
  return swift_bridgeObjectRetain();
}

PreviewsMessagingOS::PreviewVariantsConfiguration::Section __swiftcall PreviewVariantsConfiguration.Section.init(title:variants:)(Swift::String title, Swift::OpaquePointer variants)
{
  uint64_t v2;
  PreviewsMessagingOS::PreviewVariantsConfiguration::Section result;

  *(Swift::String *)v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = variants;
  result.title.value = title;
  result.variants = variants;
  return result;
}

uint64_t sub_2449B7378(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73746E6169726176;
  else
    return 0x656C746974;
}

uint64_t sub_2449B73AC(char *a1, char *a2)
{
  return sub_24499EDD8(*a1, *a2);
}

uint64_t sub_2449B73B8()
{
  return sub_2449C8094();
}

uint64_t sub_2449B73C0()
{
  return sub_2449231E0();
}

uint64_t sub_2449B73C8()
{
  return sub_2449CB88C();
}

uint64_t sub_2449B73D0@<X0>(char *a1@<X8>)
{
  return sub_24493C2EC(a1);
}

uint64_t sub_2449B73DC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449B7378(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449B7404()
{
  char *v0;

  return sub_2449B7378(*v0);
}

uint64_t PreviewVariantsConfiguration.Section.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B7444()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2568);
  sub_2449BAB48();
  sub_2449BAE18(&qword_2573A2598, &qword_2573A2568, (uint64_t (*)(void))sub_2449BA8B8, MEMORY[0x24BE76D10]);
  return sub_2449CF604();
}

uint64_t PreviewVariantsConfiguration.Section.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];
  ValueMetadata *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v13 = &type metadata for PreviewVariantsConfiguration.Section.Key;
  v5 = sub_2449BAB48();
  v14 = v5;
  v12[0] = 0;
  sub_2449CF3B8();
  if (v2)
  {
    v6 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v8 = v15;
    v7 = v16;
    v13 = &type metadata for PreviewVariantsConfiguration.Section.Key;
    v14 = v5;
    v12[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2568);
    sub_2449BAE18(&qword_2573A2598, &qword_2573A2568, (uint64_t (*)(void))sub_2449BA8B8, MEMORY[0x24BE76D10]);
    sub_2449CF37C();
    v10 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v11 = v17;
    *a2 = v8;
    a2[1] = v7;
    a2[2] = v11;
  }
  return result;
}

uint64_t sub_2449B7670()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B76A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return PreviewVariantsConfiguration.Section.init(propertyListValue:)(a1, a2);
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SelectionBehavior::Discriminant_optional __swiftcall PreviewOverridesConfiguration.SelectionBehavior.Discriminant.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (PreviewsMessagingOS::PreviewOverridesConfiguration::SelectionBehavior::Discriminant_optional)sub_244925874(v1);
}

uint64_t PreviewOverridesConfiguration.SelectionBehavior.Discriminant.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C655369746C756DLL;
  else
    return 0x6553656C676E6973;
}

uint64_t sub_2449B7718(char a1)
{
  if (!a1)
    return 0x696D697263736964;
  if (a1 == 1)
    return 0xD000000000000019;
  return 0xD000000000000018;
}

uint64_t sub_2449B777C(char *a1, char *a2)
{
  return sub_24499E450(*a1, *a2);
}

uint64_t sub_2449B7788()
{
  return sub_2449C8110();
}

uint64_t sub_2449B7790()
{
  return sub_244922DB0();
}

uint64_t sub_2449B7798()
{
  return sub_2449CBEB8();
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SelectionBehavior::Discriminant_optional sub_2449B77A0(Swift::String *a1)
{
  return PreviewOverridesConfiguration.SelectionBehavior.Discriminant.init(rawValue:)(*a1);
}

uint64_t sub_2449B77AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PreviewOverridesConfiguration.SelectionBehavior.Discriminant.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2449B77D0()
{
  sub_2449BC5B4();
  return sub_2449CF670();
}

uint64_t sub_2449B7818()
{
  sub_2449BC5B4();
  return sub_2449CF67C();
}

uint64_t sub_2449B787C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24499E340(*a1, *a2);
}

uint64_t sub_2449B7888()
{
  return sub_2449C81A0();
}

uint64_t sub_2449B7890()
{
  return sub_244922D2C();
}

uint64_t sub_2449B7898()
{
  return sub_2449CBF44();
}

uint64_t sub_2449B78A0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244940DA8();
  *a1 = result;
  return result;
}

uint64_t sub_2449B78D4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449B7718(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449B78FC()
{
  char *v0;

  return sub_2449B7718(*v0);
}

uint64_t PreviewOverridesConfiguration.SelectionBehavior.propertyListValue.getter(uint64_t a1)
{
  MEMORY[0x24BDAC7A8](a1);
  return sub_2449CF3D0();
}

uint64_t sub_2449B7988()
{
  sub_2449BABA0();
  sub_2449BABE4();
  sub_2449BAC6C();
  return sub_2449CF604();
}

uint64_t sub_2449B7A0C()
{
  sub_2449BABA0();
  sub_2449BABE4();
  sub_2449BAC28();
  return sub_2449CF604();
}

uint64_t PreviewOverridesConfiguration.SelectionBehavior.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[24];
  ValueMetadata *v17;
  unint64_t v18;

  v17 = &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Key;
  v5 = sub_2449BABA0();
  v18 = v5;
  v16[0] = 0;
  sub_2449BABE4();
  sub_2449CF37C();
  if (v2)
  {
    v6 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v17 = &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Key;
    v18 = v5;
    if ((v13 & 1) != 0)
    {
      v16[0] = 2;
      sub_2449BAC28();
      sub_2449CF37C();
      v8 = sub_2449CF400();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      v9 = 0;
      v10 = 0;
      v11 = v13;
    }
    else
    {
      v16[0] = 1;
      sub_2449BAC6C();
      sub_2449CF37C();
      v12 = sub_2449CF400();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      v11 = v13;
      v9 = v14;
      v10 = v15;
    }
    *(_QWORD *)a2 = v11;
    *(_QWORD *)(a2 + 8) = v9;
    *(_QWORD *)(a2 + 16) = v10;
    *(_BYTE *)(a2 + 24) = v13;
  }
  return result;
}

uint64_t static PreviewOverridesConfiguration.MultiSelectConfiguration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_2449B5400(*a1, *a2);
}

uint64_t sub_2449B7C30(uint64_t a1)
{
  MEMORY[0x24BDAC7A8](a1);
  return sub_2449CF3D0();
}

uint64_t sub_2449B7CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewOverridesConfiguration.SelectionBehavior.init(propertyListValue:)(a1, a2);
}

void PreviewOverridesConfiguration.SingleSelectConfiguration.style.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *PreviewOverridesConfiguration.SingleSelectConfiguration.style.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.SingleSelectConfiguration.style.modify())()
{
  return nullsub_1;
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.defaultVariant.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *a1 = *(_QWORD *)(v1 + 8);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.defaultVariant.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.SingleSelectConfiguration.defaultVariant.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration __swiftcall PreviewOverridesConfiguration.SingleSelectConfiguration.init(style:defaultVariant:)(PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration::Style style, PreviewsMessagingOS::PreviewVariant::ID defaultVariant)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration result;

  v3 = *(_QWORD *)defaultVariant.rawValue._countAndFlagsBits;
  v4 = *(_QWORD *)(defaultVariant.rawValue._countAndFlagsBits + 8);
  *(_BYTE *)v2 = *(_BYTE *)style;
  *(_QWORD *)(v2 + 8) = v3;
  *(_QWORD *)(v2 + 16) = v4;
  result.defaultVariant = defaultVariant;
  result.style = style;
  return result;
}

uint64_t sub_2449B7D54(char a1)
{
  if ((a1 & 1) != 0)
    return 0x56746C7561666564;
  else
    return 0x656C797473;
}

uint64_t sub_2449B7D94(char *a1, char *a2)
{
  return sub_24499E594(*a1, *a2);
}

uint64_t sub_2449B7DA0()
{
  return sub_2449C824C();
}

uint64_t sub_2449B7DA8()
{
  return sub_244922E64();
}

uint64_t sub_2449B7DB0()
{
  return sub_2449CBDC4();
}

uint64_t sub_2449B7DB8@<X0>(char *a1@<X8>)
{
  return sub_24493C2EC(a1);
}

uint64_t sub_2449B7DC4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449B7D54(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449B7DEC()
{
  char *v0;

  return sub_2449B7D54(*v0);
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B7E2C()
{
  sub_2449BACBC();
  sub_2449BAD00();
  sub_2449BAD44();
  return sub_2449CF604();
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];
  ValueMetadata *v13;
  unint64_t v14;
  char v15;

  v13 = &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Key;
  v5 = sub_2449BACBC();
  v14 = v5;
  v12[0] = 0;
  sub_2449BAD00();
  sub_2449CF37C();
  if (v2)
  {
    v7 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v6 = v15;
    v13 = &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Key;
    v14 = v5;
    v12[0] = 1;
    sub_2449BAD44();
    sub_2449CF37C();
    v8 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    *(_BYTE *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v11;
  }
  return result;
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration::Style_optional __swiftcall PreviewOverridesConfiguration.SingleSelectConfiguration.Style.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration::Style_optional)sub_244925874(v1);
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.Style.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x65676E6172;
  else
    return 1953720684;
}

uint64_t sub_2449B8008(char *a1, char *a2)
{
  return sub_24499E500(*a1, *a2);
}

uint64_t sub_2449B8014()
{
  return sub_2449C82D4();
}

uint64_t sub_2449B801C()
{
  return sub_244922E18();
}

uint64_t sub_2449B8024()
{
  return sub_2449CBE48();
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration::Style_optional sub_2449B802C(Swift::String *a1)
{
  return PreviewOverridesConfiguration.SingleSelectConfiguration.Style.init(rawValue:)(*a1);
}

uint64_t sub_2449B8038@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PreviewOverridesConfiguration.SingleSelectConfiguration.Style.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2449B805C()
{
  sub_2449BC570();
  return sub_2449CF670();
}

uint64_t sub_2449B80A4()
{
  sub_2449BC570();
  return sub_2449CF67C();
}

uint64_t sub_2449B810C()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B8144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewOverridesConfiguration.SingleSelectConfiguration.init(propertyListValue:)(a1, a2);
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.defaultVariants.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.defaultVariants.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.MultiSelectConfiguration.defaultVariants.modify())()
{
  return nullsub_1;
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.init(defaultVariants:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2449B81AC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2449CFC10();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2449B81FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2449B9CD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.propertyListValue.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2618);
  sub_2449BAD88();
  sub_2449BAE18(&qword_2573A2628, &qword_2573A2618, (uint64_t (*)(void))sub_2449BAD44, MEMORY[0x24BE76DA0]);
  return sub_2449CF3E8();
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;
  uint64_t v10;

  v8 = &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration.Key;
  v9 = sub_2449BAD88();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2618);
  sub_2449BAE18(&qword_2573A2628, &qword_2573A2618, (uint64_t (*)(void))sub_2449BAD44, MEMORY[0x24BE76DA0]);
  sub_2449CF37C();
  v5 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2)
    *a2 = v10;
  return result;
}

uint64_t sub_2449B83B4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2618);
  sub_2449BAD88();
  sub_2449BAE18(&qword_2573A2628, &qword_2573A2618, (uint64_t (*)(void))sub_2449BAD44, MEMORY[0x24BE76DA0]);
  return sub_2449CF3E8();
}

uint64_t sub_2449B844C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;
  uint64_t v10;

  v8 = &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration.Key;
  v9 = sub_2449BAD88();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2618);
  sub_2449BAE18(&qword_2573A2628, &qword_2573A2618, (uint64_t (*)(void))sub_2449BAD44, MEMORY[0x24BE76DA0]);
  sub_2449CF37C();
  v5 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2)
    *a2 = v10;
  return result;
}

uint64_t sub_2449B8544(uint64_t *a1, uint64_t *a2)
{
  return sub_2449B5400(*a1, *a2);
}

uint64_t (*PreviewVariantGroup.ID.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t sub_2449B8560()
{
  sub_2449BC52C();
  return sub_2449CF670();
}

uint64_t sub_2449B85A8()
{
  sub_2449BC52C();
  return sub_2449CF67C();
}

uint64_t PreviewVariant.id.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewVariant.id.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*PreviewVariant.id.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariant.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewVariant.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*PreviewVariant.displayName.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariant.renderEffects.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewVariant.renderEffects.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*PreviewVariant.renderEffects.modify())()
{
  return nullsub_1;
}

void PreviewVariant.interfaceOrientationOverride.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 40);
}

_BYTE *PreviewVariant.interfaceOrientationOverride.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = *result;
  return result;
}

uint64_t (*PreviewVariant.interfaceOrientationOverride.modify())()
{
  return nullsub_1;
}

double PreviewVariant.init(id:displayName:renderEffect:interfaceOrientationOverride:)@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, char *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double result;

  v9 = *a1;
  v10 = a1[1];
  v11 = *a4;
  v12 = a4[1];
  v13 = *a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2630);
  v14 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v14 + 16) = xmmword_2449D1F20;
  *(_QWORD *)(v14 + 32) = v11;
  *(_QWORD *)(v14 + 40) = v12;
  *(_QWORD *)a6 = v9;
  *(_QWORD *)(a6 + 8) = v10;
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a3;
  *(_QWORD *)(a6 + 32) = v14;
  *(_BYTE *)(a6 + 40) = v13;
  return result;
}

_QWORD *PreviewVariant.init(id:displayName:renderEffects:interfaceOrientationOverride:)@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  char v7;

  v6 = result[1];
  v7 = *a5;
  *(_QWORD *)a6 = *result;
  *(_QWORD *)(a6 + 8) = v6;
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a3;
  *(_QWORD *)(a6 + 32) = a4;
  *(_BYTE *)(a6 + 40) = v7;
  return result;
}

uint64_t sub_2449B87CC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2449B8804 + 4 * byte_2449DE944[a1]))(0xD00000000000001CLL, 0x80000002449E2DA0);
}

uint64_t sub_2449B8804()
{
  return 25705;
}

uint64_t sub_2449B8810()
{
  return 0x4E79616C70736964;
}

uint64_t sub_2449B8830()
{
  return 0x66457265646E6572;
}

void sub_2449B8864(char *a1)
{
  sub_2449A2464(*a1);
}

void sub_2449B8870()
{
  char *v0;

  sub_2449C8348(*v0);
}

void sub_2449B8878(uint64_t a1)
{
  char *v1;

  sub_244924D20(a1, *v1);
}

void sub_2449B8880(uint64_t a1)
{
  char *v1;

  sub_2449C96B8(a1, *v1);
}

uint64_t sub_2449B8888@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449BC4A0();
  *a1 = result;
  return result;
}

uint64_t sub_2449B88B4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449B87CC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449B88DC()
{
  unsigned __int8 *v0;

  return sub_2449B87CC(*v0);
}

uint64_t PreviewVariant.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B8924(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[2];
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;

  v3 = a1[2];
  v2 = a1[3];
  v4 = a1[4];
  sub_2449314A4((uint64_t)(a1 + 5), (uint64_t)&v18, &qword_2573A26F8);
  if (*(_QWORD *)(v4 + 16))
    swift_bridgeObjectRetain();
  v5 = *a1;
  v6 = a1[1];
  v17 = 0;
  v15 = v5;
  v16 = v6;
  v14 = 1;
  v12 = v3;
  v13 = v2;
  v11 = 2;
  v10 = v4;
  v9[1] = 3;
  sub_2449314A4((uint64_t)&v18, (uint64_t)v9, &qword_2573A26F8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A0730);
  sub_2449BADD4();
  sub_2449BAD44();
  sub_2449BAE18((unint64_t *)&qword_2573A0738, &qword_2573A0730, (uint64_t (*)(void))sub_24496DA50, MEMORY[0x24BE76D10]);
  sub_2449729C4();
  sub_24496DA50();
  v7 = sub_2449CF5E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t PreviewVariant.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];
  ValueMetadata *v16;
  unint64_t v17;
  char v18;

  v16 = &type metadata for PreviewVariant.Key;
  v5 = sub_2449BADD4();
  v17 = v5;
  v15[0] = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A0730);
  sub_2449BAE18((unint64_t *)&qword_2573A0738, &qword_2573A0730, (uint64_t (*)(void))sub_24496DA50, MEMORY[0x24BE76D10]);
  sub_2449CF3B8();
  if (v2)
  {
    v6 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    v7 = v13;
    if (!v13)
    {
      v16 = &type metadata for PreviewVariant.Key;
      v17 = v5;
      v15[0] = 4;
      sub_24496DA50();
      sub_2449CF37C();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2630);
      v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_2449D1F20;
      *(_QWORD *)(v7 + 32) = 0;
      *(_QWORD *)(v7 + 40) = v14;
    }
    v16 = &type metadata for PreviewVariant.Key;
    v17 = v5;
    v15[0] = 0;
    sub_2449BAD44();
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    v16 = &type metadata for PreviewVariant.Key;
    v17 = v5;
    v15[0] = 1;
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    v16 = &type metadata for PreviewVariant.Key;
    v17 = v5;
    v15[0] = 3;
    sub_2449729C4();
    sub_2449CF3B8();
    v9 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    v10 = v18;
    *(_QWORD *)a2 = v13;
    *(_QWORD *)(a2 + 8) = v14;
    *(_QWORD *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v12;
    *(_QWORD *)(a2 + 32) = v7;
    *(_BYTE *)(a2 + 40) = v10;
  }
  return result;
}

uint64_t PreviewVariant.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(unsigned __int8 *)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  sub_2449CFD54();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_2449CF88C();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  if ((_DWORD)v2 != 4)
  {
    sub_2449CFD60();
    __asm { BR              X9 }
  }
  return sub_2449CFD60();
}

uint64_t sub_2449B8F04()
{
  sub_2449CF88C();
  return swift_bridgeObjectRelease();
}

uint64_t PreviewVariant.hashValue.getter()
{
  sub_2449CFD48();
  PreviewVariant.hash(into:)();
  return sub_2449CFD84();
}

uint64_t sub_2449B8FDC()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449B901C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewVariant.init(propertyListValue:)(a1, a2);
}

uint64_t sub_2449B9030()
{
  sub_2449CFD48();
  PreviewVariant.hash(into:)();
  return sub_2449CFD84();
}

uint64_t sub_2449B9094()
{
  sub_2449CFD48();
  PreviewVariant.hash(into:)();
  return sub_2449CFD84();
}

uint64_t PreviewVariant.ID.rawValue.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PreviewVariant.ID.rawValue.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::PreviewVariant::ID __swiftcall PreviewVariant.ID.init(stringLiteral:)(PreviewsMessagingOS::PreviewVariant::ID stringLiteral)
{
  PreviewsMessagingOS::PreviewVariant::ID *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t PreviewVariant.ID.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2449B916C()
{
  sub_2449BC4E8();
  return sub_2449CF670();
}

uint64_t sub_2449B91B4()
{
  sub_2449BC4E8();
  return sub_2449CF67C();
}

uint64_t sub_2449B9218(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_2449CFD48();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  v8 = sub_2449CFD84();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2449CFCD0() & 1) != 0)
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
      if (v19 || (sub_2449CFCD0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2449B96C0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2449B93D4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2708);
  v3 = sub_2449CFB80();
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
      sub_2449CFD48();
      swift_bridgeObjectRetain();
      sub_2449CF88C();
      swift_bridgeObjectRelease();
      result = sub_2449CFD84();
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

uint64_t sub_2449B96C0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2449B93D4();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2449B9868();
      goto LABEL_22;
    }
    sub_2449B9A18();
  }
  v11 = *v4;
  sub_2449CFD48();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  result = sub_2449CFD84();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2449CFCD0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2449CFD00();
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
          result = sub_2449CFCD0();
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

void *sub_2449B9868()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2708);
  v2 = *v0;
  v3 = sub_2449CFB74();
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

uint64_t sub_2449B9A18()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2708);
  v3 = sub_2449CFB80();
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
    sub_2449CFD48();
    swift_bridgeObjectRetain_n();
    sub_2449CF88C();
    swift_bridgeObjectRelease();
    result = sub_2449CFD84();
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

uint64_t sub_2449B9CD0()
{
  return 0x56746C7561666564;
}

uint64_t _s19PreviewsMessagingOS14PreviewVariantV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  uint64_t result;
  char v12;
  char v13;

  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(unsigned __int8 *)(a2 + 40);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v10 = sub_2449CFCD0(), result = 0, (v10 & 1) != 0))
  {
    if (v2 == v6 && v4 == v7 || (v12 = sub_2449CFCD0(), result = 0, (v12 & 1) != 0))
    {
      if ((sub_244938A78(v3, v8) & 1) != 0)
      {
        if (v5 == 4)
        {
          if (v9 != 4)
            return 0;
        }
        else
        {
          if (v9 == 4)
            return 0;
          sub_24499EC84(v5);
          if ((v13 & 1) == 0)
            return 0;
        }
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV012SingleSelectF0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v12;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)a1 == 0;
  if (*(_BYTE *)a1)
    v7 = 0x65676E6172;
  else
    v7 = 1953720684;
  if (v6)
    v8 = 0xE400000000000000;
  else
    v8 = 0xE500000000000000;
  if (*(_BYTE *)a2)
    v9 = 0x65676E6172;
  else
    v9 = 1953720684;
  if (*(_BYTE *)a2)
    v10 = 0xE500000000000000;
  else
    v10 = 0xE400000000000000;
  if (v7 == v9 && v8 == v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v2 != v4)
      return sub_2449CFCD0();
  }
  else
  {
    v12 = sub_2449CFCD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v12 & 1) == 0)
      return result;
    if (v2 != v4)
      return sub_2449CFCD0();
  }
  if (v3 != v5)
    return sub_2449CFCD0();
  return 1;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV17SelectionBehaviorO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _BYTE v10[8];
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 24) & 1) != 0)
    {
      sub_2449B5CD4();
      sub_2449B5CD4();
      sub_2449B5CD4();
      sub_2449B5CD4();
      v8 = sub_2449B5400(v3, v6);
      sub_2449B5DAC();
      sub_2449B5DAC();
      sub_2449B5DAC();
LABEL_7:
      sub_2449B5DAC();
      return v8 & 1;
    }
  }
  else if ((*(_BYTE *)(a2 + 24) & 1) == 0)
  {
    v13[0] = v3 & 1;
    v14 = v2;
    v15 = v4;
    v10[0] = v6 & 1;
    v11 = v5;
    v12 = v7;
    sub_2449B5CD4();
    sub_2449B5CD4();
    sub_2449B5CD4();
    sub_2449B5CD4();
    v8 = _s19PreviewsMessagingOS29PreviewOverridesConfigurationV012SingleSelectF0V2eeoiySbAE_AEtFZ_0((uint64_t)v13, (uint64_t)v10);
    sub_2449B5DAC();
    sub_2449B5DAC();
    sub_2449B5DAC();
    goto LABEL_7;
  }
  sub_2449B5CD4();
  sub_2449B5CD4();
  sub_2449B5DAC();
  sub_2449B5DAC();
  v8 = 0;
  return v8 & 1;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  uint64_t v18;
  char v19;

  v2 = *(_OWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
  {
    v12 = *(_OWORD *)(a2 + 16);
    v13 = *(_OWORD *)(a1 + 16);
    v10 = sub_2449CFCD0();
    v6 = v12;
    v2 = v13;
    if ((v10 & 1) == 0)
      return 0;
  }
  v17 = v2;
  v18 = v3;
  v19 = v4;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  if ((_s19PreviewsMessagingOS29PreviewOverridesConfigurationV17SelectionBehaviorO2eeoiySbAE_AEtFZ_0((uint64_t)&v17, (uint64_t)&v14) & 1) != 0)return sub_24493831C(v5, v9);
  else
    return 0;
}

BOOL _s19PreviewsMessagingOS19PreviewVariantGroupV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
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
  char v12;
  _BOOL8 result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
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
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  char v34;
  uint64_t v35;
  _QWORD v36[8];

  v2 = a1[2];
  v3 = a1[4];
  v32 = a1[5];
  v30 = a1[3];
  v31 = a1[6];
  v4 = a1[8];
  v5 = a1[9];
  v23 = a1[10];
  v24 = a1[11];
  v25 = a1[12];
  v7 = a2[2];
  v6 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v10 = a2[6];
  v11 = a2[7];
  v26 = a2[8];
  v27 = a2[9];
  v29 = a1[7];
  v21 = a2[10];
  v22 = a2[11];
  v20 = a2[12];
  if (*a1 == *a2 && a1[1] == a2[1] || (v12 = sub_2449CFCD0(), result = 0, (v12 & 1) != 0))
  {
    if ((sub_2449B5914(v2, v7) & 1) == 0)
      return 0;
    if (v3)
    {
      v36[0] = v30;
      v36[1] = v3;
      v36[2] = v32;
      v36[3] = v31;
      v36[4] = v29;
      v36[5] = v4;
      v36[6] = v5;
      if (v8)
      {
        v33[0] = v6;
        v33[1] = v8;
        v33[2] = v9;
        v33[3] = v10;
        v33[4] = v11;
        v34 = v26 & 1;
        v35 = v27;
        sub_2449B5C70(v30, v3);
        swift_bridgeObjectRetain();
        sub_2449B5CD4();
        swift_bridgeObjectRetain();
        v28 = _s19PreviewsMessagingOS29PreviewOverridesConfigurationV2eeoiySbAC_ACtFZ_0((uint64_t)v36, (uint64_t)v33);
        swift_bridgeObjectRelease();
        sub_2449B5DAC();
        swift_bridgeObjectRelease();
        sub_2449B5D48(v30, v3);
        if ((v28 & 1) == 0)
          return 0;
LABEL_10:
        if (v24)
        {
          v15 = v22;
          v14 = v23;
          v16 = v21;
          if (v22)
          {
            if (v23 == v21 && v24 == v22 || (sub_2449CFCD0() & 1) != 0)
            {
              sub_2449B5DDC(v23, v24);
              sub_2449B5DDC(v23, v24);
              sub_2449B5DDC(v21, v22);
              v17 = sub_24493858C(v25, v20);
              sub_2449B5E50(v21, v22);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_2449B5E50(v23, v24);
              return (v17 & 1) != 0;
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v18 = v23;
            v19 = v24;
LABEL_23:
            sub_2449B5E50(v18, v19);
            return 0;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          v15 = v22;
          v14 = v23;
          v16 = v21;
          if (!v22)
            return 1;
        }
        sub_2449B5DDC(v16, v15);
        sub_2449B5E50(v14, v24);
        v18 = v16;
        v19 = v15;
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_2449B5CD4();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2449B5CD4();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_2449B5DAC();
      swift_bridgeObjectRelease();
    }
    else if (!v8)
    {
      goto LABEL_10;
    }
    sub_2449B5C70(v6, v8);
    sub_2449B5D48(v30, v3);
    sub_2449B5D48(v6, v8);
    return 0;
  }
  return result;
}

uint64_t _s19PreviewsMessagingOS28PreviewVariantsConfigurationV7SectionV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a2[1];
  v6 = a2[2];
  if (v3)
  {
    if (v5)
    {
      v7 = *a1 == *a2 && v3 == v5;
      if (v7 || (sub_2449CFCD0() & 1) != 0)
        return sub_24493831C(v4, v6);
    }
  }
  else if (!v5)
  {
    return sub_24493831C(v4, v6);
  }
  return 0;
}

uint64_t sub_2449BA680()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_2449BA6C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  sub_2449BAE80();
  result = sub_2449CFACC();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2449B9218(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

unint64_t sub_2449BA75C()
{
  unint64_t result;

  result = qword_2573A2550;
  if (!qword_2573A2550)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration, &type metadata for PreviewOverridesConfiguration);
    atomic_store(result, (unint64_t *)&qword_2573A2550);
  }
  return result;
}

unint64_t sub_2449BA7A0()
{
  unint64_t result;

  result = qword_2573A2558;
  if (!qword_2573A2558)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariantsConfiguration, &type metadata for PreviewVariantsConfiguration);
    atomic_store(result, (unint64_t *)&qword_2573A2558);
  }
  return result;
}

unint64_t sub_2449BA7E4()
{
  unint64_t result;

  result = qword_2573A2570;
  if (!qword_2573A2570)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant, &type metadata for PreviewVariant);
    atomic_store(result, (unint64_t *)&qword_2573A2570);
  }
  return result;
}

uint64_t sub_2449BA828()
{
  return sub_2449B6A60();
}

unint64_t sub_2449BA830()
{
  unint64_t result;

  result = qword_2573A2588;
  if (!qword_2573A2588)
  {
    result = MEMORY[0x24951C158](&unk_2449DFA20, &type metadata for PreviewOverridesConfiguration.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2588);
  }
  return result;
}

unint64_t sub_2449BA874()
{
  unint64_t result;

  result = qword_2573A2590;
  if (!qword_2573A2590)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.SelectionBehavior, &type metadata for PreviewOverridesConfiguration.SelectionBehavior);
    atomic_store(result, (unint64_t *)&qword_2573A2590);
  }
  return result;
}

unint64_t sub_2449BA8B8()
{
  unint64_t result;

  result = qword_2573A25A0;
  if (!qword_2573A25A0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant, &type metadata for PreviewVariant);
    atomic_store(result, (unint64_t *)&qword_2573A25A0);
  }
  return result;
}

uint64_t sub_2449BA8FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2700);
    v3 = sub_2449CFB8C();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_2449CFD48();
      swift_bridgeObjectRetain_n();
      sub_2449CF88C();
      swift_bridgeObjectRelease();
      result = sub_2449CFD84();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_2449CFCD0(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_2449CFCD0();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_2449BAAA8()
{
  return sub_2449B7004();
}

unint64_t sub_2449BAAB4()
{
  unint64_t result;

  result = qword_2573A25B8;
  if (!qword_2573A25B8)
  {
    result = MEMORY[0x24951C158](&unk_2449DF9F8, &type metadata for PreviewVariantsConfiguration.Key);
    atomic_store(result, (unint64_t *)&qword_2573A25B8);
  }
  return result;
}

unint64_t sub_2449BAAF8()
{
  unint64_t result;

  result = qword_2573A25D0;
  if (!qword_2573A25D0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariantsConfiguration.Section, &type metadata for PreviewVariantsConfiguration.Section);
    atomic_store(result, (unint64_t *)&qword_2573A25D0);
  }
  return result;
}

uint64_t sub_2449BAB3C()
{
  return sub_2449B7444();
}

unint64_t sub_2449BAB48()
{
  unint64_t result;

  result = qword_2573A25D8;
  if (!qword_2573A25D8)
  {
    result = MEMORY[0x24951C158](&unk_2449DF9D0, &type metadata for PreviewVariantsConfiguration.Section.Key);
    atomic_store(result, (unint64_t *)&qword_2573A25D8);
  }
  return result;
}

uint64_t sub_2449BAB8C()
{
  return sub_2449B7A0C();
}

uint64_t sub_2449BAB94()
{
  return sub_2449B7988();
}

unint64_t sub_2449BABA0()
{
  unint64_t result;

  result = qword_2573A25E0;
  if (!qword_2573A25E0)
  {
    result = MEMORY[0x24951C158](&unk_2449DF9A8, &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Key);
    atomic_store(result, (unint64_t *)&qword_2573A25E0);
  }
  return result;
}

unint64_t sub_2449BABE4()
{
  unint64_t result;

  result = qword_2573A25E8;
  if (!qword_2573A25E8)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.SelectionBehavior.Discriminant, &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A25E8);
  }
  return result;
}

unint64_t sub_2449BAC28()
{
  unint64_t result;

  result = qword_2573A25F0;
  if (!qword_2573A25F0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.MultiSelectConfiguration, &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration);
    atomic_store(result, (unint64_t *)&qword_2573A25F0);
  }
  return result;
}

unint64_t sub_2449BAC6C()
{
  unint64_t result;

  result = qword_2573A25F8;
  if (!qword_2573A25F8)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.SingleSelectConfiguration, &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration);
    atomic_store(result, (unint64_t *)&qword_2573A25F8);
  }
  return result;
}

uint64_t sub_2449BACB0()
{
  return sub_2449B7E2C();
}

unint64_t sub_2449BACBC()
{
  unint64_t result;

  result = qword_2573A2600;
  if (!qword_2573A2600)
  {
    result = MEMORY[0x24951C158](&unk_2449DF980, &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2600);
  }
  return result;
}

unint64_t sub_2449BAD00()
{
  unint64_t result;

  result = qword_2573A2608;
  if (!qword_2573A2608)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.SingleSelectConfiguration.Style, &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Style);
    atomic_store(result, (unint64_t *)&qword_2573A2608);
  }
  return result;
}

unint64_t sub_2449BAD44()
{
  unint64_t result;

  result = qword_2573A2610;
  if (!qword_2573A2610)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant.ID, &type metadata for PreviewVariant.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2610);
  }
  return result;
}

unint64_t sub_2449BAD88()
{
  unint64_t result;

  result = qword_2573A2620;
  if (!qword_2573A2620)
  {
    result = MEMORY[0x24951C158](&unk_2449DF958, &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2620);
  }
  return result;
}

uint64_t sub_2449BADCC()
{
  uint64_t v0;

  return sub_2449B8924(*(uint64_t **)(v0 + 16));
}

unint64_t sub_2449BADD4()
{
  unint64_t result;

  result = qword_2573A2638;
  if (!qword_2573A2638)
  {
    result = MEMORY[0x24951C158](&unk_2449DF930, &type metadata for PreviewVariant.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2638);
  }
  return result;
}

uint64_t sub_2449BAE18(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24951C158](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2449BAE80()
{
  unint64_t result;

  result = qword_2573A2640;
  if (!qword_2573A2640)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariantGroup.ID, &type metadata for PreviewVariantGroup.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2640);
  }
  return result;
}

unint64_t sub_2449BAEC8()
{
  unint64_t result;

  result = qword_2573A2648;
  if (!qword_2573A2648)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.SelectionBehavior.Discriminant, &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A2648);
  }
  return result;
}

unint64_t sub_2449BAF10()
{
  unint64_t result;

  result = qword_2573A2650;
  if (!qword_2573A2650)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.SingleSelectConfiguration.Style, &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Style);
    atomic_store(result, (unint64_t *)&qword_2573A2650);
  }
  return result;
}

unint64_t sub_2449BAF58()
{
  unint64_t result;

  result = qword_2573A2658;
  if (!qword_2573A2658)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariantGroup.ID, &type metadata for PreviewVariantGroup.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2658);
  }
  return result;
}

unint64_t sub_2449BAFA0()
{
  unint64_t result;

  result = qword_2573A2660;
  if (!qword_2573A2660)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariantGroup.ID, &type metadata for PreviewVariantGroup.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2660);
  }
  return result;
}

unint64_t sub_2449BAFE8()
{
  unint64_t result;

  result = qword_2573A2668;
  if (!qword_2573A2668)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariantGroup.ID, &type metadata for PreviewVariantGroup.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2668);
  }
  return result;
}

unint64_t sub_2449BB030()
{
  unint64_t result;

  result = qword_2573A2670;
  if (!qword_2573A2670)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant.ID, &type metadata for PreviewVariant.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2670);
  }
  return result;
}

unint64_t sub_2449BB078()
{
  unint64_t result;

  result = qword_2573A2678;
  if (!qword_2573A2678)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant, &type metadata for PreviewVariant);
    atomic_store(result, (unint64_t *)&qword_2573A2678);
  }
  return result;
}

unint64_t sub_2449BB0C0()
{
  unint64_t result;

  result = qword_2573A2680;
  if (!qword_2573A2680)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant.ID, &type metadata for PreviewVariant.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2680);
  }
  return result;
}

unint64_t sub_2449BB108()
{
  unint64_t result;

  result = qword_2573A2688;
  if (!qword_2573A2688)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant.ID, &type metadata for PreviewVariant.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2688);
  }
  return result;
}

unint64_t sub_2449BB150()
{
  unint64_t result;

  result = qword_2573A2690;
  if (!qword_2573A2690)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant.ID, &type metadata for PreviewVariant.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2690);
  }
  return result;
}

uint64_t destroy for PreviewVariantGroup(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 32))
  {
    swift_bridgeObjectRelease();
    sub_2449B5DAC();
    swift_bridgeObjectRelease();
  }
  result = *(_QWORD *)(a1 + 88);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for PreviewVariantGroup(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  __int128 v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v5)
  {
    v11 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v11;
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    v10 = *(_QWORD *)(a2 + 88);
    if (v10)
      goto LABEL_3;
LABEL_5:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    return a1;
  }
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain();
  sub_2449B5CD4();
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  v10 = *(_QWORD *)(a2 + 88);
  if (!v10)
    goto LABEL_5;
LABEL_3:
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewVariantGroup(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a1 + 24);
  v5 = (__int128 *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v6)
    {
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v7 = *(_QWORD *)(a2 + 40);
      v8 = *(_QWORD *)(a2 + 48);
      v9 = *(_QWORD *)(a2 + 56);
      v10 = *(_BYTE *)(a2 + 64);
      sub_2449B5CD4();
      *(_QWORD *)(a1 + 40) = v7;
      *(_QWORD *)(a1 + 48) = v8;
      *(_QWORD *)(a1 + 56) = v9;
      *(_BYTE *)(a1 + 64) = v10;
      sub_2449B5DAC();
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2449BB540(a1 + 24);
      v16 = *(_OWORD *)(a2 + 40);
      v15 = *(_OWORD *)(a2 + 56);
      v17 = *v5;
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 40) = v16;
      *(_OWORD *)(a1 + 56) = v15;
      *v4 = v17;
    }
  }
  else if (v6)
  {
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    v11 = *(_QWORD *)(a2 + 40);
    v12 = *(_QWORD *)(a2 + 48);
    v13 = *(_QWORD *)(a2 + 56);
    v14 = *(_BYTE *)(a2 + 64);
    swift_bridgeObjectRetain();
    sub_2449B5CD4();
    *(_QWORD *)(a1 + 40) = v11;
    *(_QWORD *)(a1 + 48) = v12;
    *(_QWORD *)(a1 + 56) = v13;
    *(_BYTE *)(a1 + 64) = v14;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
  }
  else
  {
    v18 = *v5;
    v19 = *(_OWORD *)(a2 + 40);
    v20 = *(_OWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 40) = v19;
    *(_OWORD *)(a1 + 56) = v20;
    *v4 = v18;
  }
  v21 = (_OWORD *)(a1 + 80);
  v22 = (_OWORD *)(a2 + 80);
  v23 = *(_QWORD *)(a2 + 88);
  if (*(_QWORD *)(a1 + 88))
  {
    if (v23)
    {
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2449BB56C(a1 + 80);
      v24 = *(_QWORD *)(a2 + 96);
      *v21 = *v22;
      *(_QWORD *)(a1 + 96) = v24;
    }
  }
  else if (v23)
  {
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v25 = *v22;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *v21 = v25;
  }
  return a1;
}

uint64_t sub_2449BB540(uint64_t a1)
{
  destroy for PreviewOverridesConfiguration();
  return a1;
}

uint64_t sub_2449BB56C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviewVariantGroup(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = *(_QWORD *)(a2 + 32);
    if (v5)
    {
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = v5;
      swift_bridgeObjectRelease();
      v6 = *(_QWORD *)(a2 + 56);
      v7 = *(_BYTE *)(a2 + 64);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 56) = v6;
      *(_BYTE *)(a1 + 64) = v7;
      sub_2449B5DAC();
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_2449BB540(a1 + 24);
  }
  v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
LABEL_6:
  if (!*(_QWORD *)(a1 + 88))
  {
LABEL_10:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    return a1;
  }
  v9 = *(_QWORD *)(a2 + 88);
  if (!v9)
  {
    sub_2449BB56C(a1 + 80);
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewVariantGroup(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewVariantGroup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewVariantGroup()
{
  return &type metadata for PreviewVariantGroup;
}

uint64_t destroy for PreviewOverridesConfiguration()
{
  swift_bridgeObjectRelease();
  sub_2449B5DAC();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PreviewOverridesConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_2449B5CD4();
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewOverridesConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_BYTE *)(a2 + 40);
  sub_2449B5CD4();
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = v7;
  sub_2449B5DAC();
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

uint64_t assignWithTake for PreviewOverridesConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  sub_2449B5DAC();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewOverridesConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewOverridesConfiguration(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration()
{
  return &type metadata for PreviewOverridesConfiguration;
}

ValueMetadata *type metadata accessor for PreviewVariantsConfiguration()
{
  return &type metadata for PreviewVariantsConfiguration;
}

ValueMetadata *type metadata accessor for PreviewVariantsConfiguration.Section()
{
  return &type metadata for PreviewVariantsConfiguration.Section;
}

uint64_t destroy for PreviewOverridesConfiguration.SelectionBehavior()
{
  return sub_2449B5DAC();
}

uint64_t initializeWithCopy for PreviewOverridesConfiguration.SelectionBehavior(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = *((_BYTE *)a2 + 24);
  sub_2449B5CD4();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for PreviewOverridesConfiguration.SelectionBehavior(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = *((_BYTE *)a2 + 24);
  sub_2449B5CD4();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  sub_2449B5DAC();
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PreviewOverridesConfiguration.SelectionBehavior(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  sub_2449B5DAC();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewOverridesConfiguration.SelectionBehavior(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewOverridesConfiguration.SelectionBehavior(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_2449BBBEC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_2449BBBF4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SelectionBehavior()
{
  return &type metadata for PreviewOverridesConfiguration.SelectionBehavior;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SelectionBehavior.Discriminant()
{
  return &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Discriminant;
}

uint64_t destroy for PreviewOverridesConfiguration.SingleSelectConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV25SingleSelectConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewOverridesConfiguration.SingleSelectConfiguration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviewOverridesConfiguration.SingleSelectConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV25SingleSelectConfigurationVwet_0(uint64_t a1, int a2)
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

uint64_t sub_2449BBD2C(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SingleSelectConfiguration()
{
  return &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SingleSelectConfiguration.Style()
{
  return &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Style;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.MultiSelectConfiguration()
{
  return &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration;
}

ValueMetadata *type metadata accessor for PreviewVariantGroup.ID()
{
  return &type metadata for PreviewVariantGroup.ID;
}

uint64_t getEnumTagSinglePayload for PreviewVariant(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewVariant(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewVariant()
{
  return &type metadata for PreviewVariant;
}

ValueMetadata *type metadata accessor for PreviewVariant.ID()
{
  return &type metadata for PreviewVariant.ID;
}

uint64_t storeEnumTagSinglePayload for PreviewVariant.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449BBEAC + 4 * byte_2449DE952[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2449BBEE0 + 4 * byte_2449DE94D[v4]))();
}

uint64_t sub_2449BBEE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449BBEE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449BBEF0);
  return result;
}

uint64_t sub_2449BBEFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449BBF04);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2449BBF08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449BBF10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewVariant.Key()
{
  return &type metadata for PreviewVariant.Key;
}

uint64_t storeEnumTagSinglePayload for PreviewOverridesConfiguration.MultiSelectConfiguration.Key(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2449BBF6C + 4 * byte_2449DE957[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2449BBF8C + 4 * byte_2449DE95C[v4]))();
}

_BYTE *sub_2449BBF6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2449BBF8C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449BBF94(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449BBF9C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449BBFA4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449BBFAC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.MultiSelectConfiguration.Key()
{
  return &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration.Key;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SingleSelectConfiguration.Key()
{
  return &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Key;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SelectionBehavior.Key()
{
  return &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Key;
}

ValueMetadata *type metadata accessor for PreviewVariantsConfiguration.Section.Key()
{
  return &type metadata for PreviewVariantsConfiguration.Section.Key;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV25SingleSelectConfigurationV5StyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449BC048 + 4 * byte_2449DE966[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2449BC07C + 4 * byte_2449DE961[v4]))();
}

uint64_t sub_2449BC07C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449BC084(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449BC08CLL);
  return result;
}

uint64_t sub_2449BC098(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449BC0A0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2449BC0A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449BC0AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewVariantsConfiguration.Key()
{
  return &type metadata for PreviewVariantsConfiguration.Key;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV17SelectionBehaviorO3KeyOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449BC114 + 4 * byte_2449DE970[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2449BC148 + 4 * byte_2449DE96B[v4]))();
}

uint64_t sub_2449BC148(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449BC150(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449BC158);
  return result;
}

uint64_t sub_2449BC164(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449BC16CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2449BC170(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449BC178(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.Key()
{
  return &type metadata for PreviewOverridesConfiguration.Key;
}

uint64_t storeEnumTagSinglePayload for PreviewVariantGroup.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449BC1E0 + 4 * byte_2449DE97A[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2449BC214 + 4 * byte_2449DE975[v4]))();
}

uint64_t sub_2449BC214(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449BC21C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449BC224);
  return result;
}

uint64_t sub_2449BC230(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449BC238);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2449BC23C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449BC244(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewVariantGroup.Key()
{
  return &type metadata for PreviewVariantGroup.Key;
}

unint64_t sub_2449BC264()
{
  unint64_t result;

  result = qword_2573A2698;
  if (!qword_2573A2698)
  {
    result = MEMORY[0x24951C158](&unk_2449DF4A8, &type metadata for PreviewVariantGroup.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2698);
  }
  return result;
}

unint64_t sub_2449BC2AC()
{
  unint64_t result;

  result = qword_2573A26A0;
  if (!qword_2573A26A0)
  {
    result = MEMORY[0x24951C158](&unk_2449DF548, &type metadata for PreviewOverridesConfiguration.Key);
    atomic_store(result, (unint64_t *)&qword_2573A26A0);
  }
  return result;
}

unint64_t sub_2449BC2F4()
{
  unint64_t result;

  result = qword_2573A26A8;
  if (!qword_2573A26A8)
  {
    result = MEMORY[0x24951C158](&unk_2449DF5E8, &type metadata for PreviewVariantsConfiguration.Key);
    atomic_store(result, (unint64_t *)&qword_2573A26A8);
  }
  return result;
}

unint64_t sub_2449BC33C()
{
  unint64_t result;

  result = qword_2573A26B0;
  if (!qword_2573A26B0)
  {
    result = MEMORY[0x24951C158](&unk_2449DF688, &type metadata for PreviewVariantsConfiguration.Section.Key);
    atomic_store(result, (unint64_t *)&qword_2573A26B0);
  }
  return result;
}

unint64_t sub_2449BC384()
{
  unint64_t result;

  result = qword_2573A26B8;
  if (!qword_2573A26B8)
  {
    result = MEMORY[0x24951C158](&unk_2449DF728, &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Key);
    atomic_store(result, (unint64_t *)&qword_2573A26B8);
  }
  return result;
}

unint64_t sub_2449BC3CC()
{
  unint64_t result;

  result = qword_2573A26C0;
  if (!qword_2573A26C0)
  {
    result = MEMORY[0x24951C158](&unk_2449DF7C8, &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Key);
    atomic_store(result, (unint64_t *)&qword_2573A26C0);
  }
  return result;
}

unint64_t sub_2449BC414()
{
  unint64_t result;

  result = qword_2573A26C8;
  if (!qword_2573A26C8)
  {
    result = MEMORY[0x24951C158](&unk_2449DF868, &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration.Key);
    atomic_store(result, (unint64_t *)&qword_2573A26C8);
  }
  return result;
}

unint64_t sub_2449BC45C()
{
  unint64_t result;

  result = qword_2573A26D0;
  if (!qword_2573A26D0)
  {
    result = MEMORY[0x24951C158](&unk_2449DF908, &type metadata for PreviewVariant.Key);
    atomic_store(result, (unint64_t *)&qword_2573A26D0);
  }
  return result;
}

uint64_t sub_2449BC4A0()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

unint64_t sub_2449BC4E8()
{
  unint64_t result;

  result = qword_2573A26D8;
  if (!qword_2573A26D8)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariant.ID, &type metadata for PreviewVariant.ID);
    atomic_store(result, (unint64_t *)&qword_2573A26D8);
  }
  return result;
}

unint64_t sub_2449BC52C()
{
  unint64_t result;

  result = qword_2573A26E0;
  if (!qword_2573A26E0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewVariantGroup.ID, &type metadata for PreviewVariantGroup.ID);
    atomic_store(result, (unint64_t *)&qword_2573A26E0);
  }
  return result;
}

unint64_t sub_2449BC570()
{
  unint64_t result;

  result = qword_2573A26E8;
  if (!qword_2573A26E8)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.SingleSelectConfiguration.Style, &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Style);
    atomic_store(result, (unint64_t *)&qword_2573A26E8);
  }
  return result;
}

unint64_t sub_2449BC5B4()
{
  unint64_t result;

  result = qword_2573A26F0;
  if (!qword_2573A26F0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for PreviewOverridesConfiguration.SelectionBehavior.Discriminant, &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A26F0);
  }
  return result;
}

PreviewsMessagingOS::RenderEffect __swiftcall RenderEffect.init(stringLiteral:)(PreviewsMessagingOS::RenderEffect stringLiteral)
{
  PreviewsMessagingOS::RenderEffect *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t RenderEffect.id.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t RenderEffect.id.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*RenderEffect.id.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::RenderEffect __swiftcall RenderEffect.init(id:)(PreviewsMessagingOS::RenderEffect id)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(id.id.rawValue._countAndFlagsBits + 8);
  *v1 = *(_QWORD *)id.id.rawValue._countAndFlagsBits;
  v1[1] = v2;
  return id;
}

uint64_t sub_2449BC6A4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2449CFC10();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2449BC6F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2449BD0E4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t RenderEffect.propertyListValue.getter()
{
  sub_2449BC780();
  sub_2449BC7C4();
  return sub_2449CF3E8();
}

unint64_t sub_2449BC780()
{
  unint64_t result;

  result = qword_2573A2720;
  if (!qword_2573A2720)
  {
    result = MEMORY[0x24951C158](&unk_2449DFEC0, &type metadata for RenderEffect.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2720);
  }
  return result;
}

unint64_t sub_2449BC7C4()
{
  unint64_t result;

  result = qword_2573A2728;
  if (!qword_2573A2728)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RenderEffect.ID, &type metadata for RenderEffect.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2728);
  }
  return result;
}

uint64_t RenderEffect.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _BYTE v8[24];
  ValueMetadata *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = &type metadata for RenderEffect.Key;
  v10 = sub_2449BC780();
  sub_2449BC7C4();
  sub_2449CF37C();
  v5 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  if (!v2)
  {
    v7 = v12;
    *a2 = v11;
    a2[1] = v7;
  }
  return result;
}

uint64_t RenderEffect.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RenderEffect.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  return swift_bridgeObjectRelease();
}

uint64_t static RenderEffect.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_2449CFCD0();
}

uint64_t RenderEffect.hashValue.getter()
{
  sub_2449CFD48();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449BC9C4()
{
  sub_2449BC780();
  sub_2449BC7C4();
  return sub_2449CF3E8();
}

uint64_t sub_2449BCA28@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _BYTE v8[24];
  ValueMetadata *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = &type metadata for RenderEffect.Key;
  v10 = sub_2449BC780();
  sub_2449BC7C4();
  sub_2449CF37C();
  v5 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  if (!v2)
  {
    v7 = v12;
    *a2 = v11;
    a2[1] = v7;
  }
  return result;
}

PreviewsMessagingOS::RenderEffect::ID __swiftcall RenderEffect.ID.init(stringLiteral:)(PreviewsMessagingOS::RenderEffect::ID stringLiteral)
{
  PreviewsMessagingOS::RenderEffect::ID *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t sub_2449BCAF4()
{
  sub_2449BD0F0();
  return sub_2449CF670();
}

uint64_t sub_2449BCB3C()
{
  sub_2449BD0F0();
  return sub_2449CF67C();
}

void static RenderEffect.DynamicTypeSize.xSmall.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000022;
  a1[1] = 0x80000002449E4C50;
}

void static RenderEffect.DynamicTypeSize.small.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000021;
  a1[1] = 0x80000002449E4C80;
}

void static RenderEffect.DynamicTypeSize.medium.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000022;
  a1[1] = 0x80000002449E4CB0;
}

void static RenderEffect.DynamicTypeSize.large.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000021;
  a1[1] = 0x80000002449E4CE0;
}

void static RenderEffect.DynamicTypeSize.xLarge.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000022;
  a1[1] = 0x80000002449E4D10;
}

void static RenderEffect.DynamicTypeSize.xxLarge.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000023;
  a1[1] = 0x80000002449E4D40;
}

void static RenderEffect.DynamicTypeSize.xxxLarge.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000024;
  a1[1] = 0x80000002449E4D70;
}

void static RenderEffect.DynamicTypeSize.accessibility1.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x80000002449E4DA0;
}

void static RenderEffect.DynamicTypeSize.accessibility2.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x80000002449E4DD0;
}

void static RenderEffect.DynamicTypeSize.accessibility3.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x80000002449E4E00;
}

void static RenderEffect.DynamicTypeSize.accessibility4.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x80000002449E4E30;
}

void static RenderEffect.DynamicTypeSize.accessibility5.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x80000002449E4E60;
}

void static RenderEffect.ColorScheme.light.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001DLL;
  a1[1] = 0x80000002449E4E90;
}

void static RenderEffect.ColorScheme.dark.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x80000002449E4EB0;
}

void static RenderEffect.Orientation.default.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x80000002449E4ED0;
}

void static RenderEffect.Orientation.portrait.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x80000002449E4EF0;
}

void static RenderEffect.Orientation.landscapeLeft.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x80000002449E4F20;
}

void static RenderEffect.Orientation.landscapeRight.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x80000002449E4F50;
}

void static RenderEffect.Orientation.portraitUpsideDown.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x80000002449E4F80;
}

unint64_t sub_2449BCE04()
{
  unint64_t result;

  result = qword_2573A2730;
  if (!qword_2573A2730)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RenderEffect, &type metadata for RenderEffect);
    atomic_store(result, (unint64_t *)&qword_2573A2730);
  }
  return result;
}

unint64_t sub_2449BCE4C()
{
  unint64_t result;

  result = qword_2573A2738;
  if (!qword_2573A2738)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RenderEffect, &type metadata for RenderEffect);
    atomic_store(result, (unint64_t *)&qword_2573A2738);
  }
  return result;
}

unint64_t sub_2449BCE94()
{
  unint64_t result;

  result = qword_2573A2740;
  if (!qword_2573A2740)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RenderEffect, &type metadata for RenderEffect);
    atomic_store(result, (unint64_t *)&qword_2573A2740);
  }
  return result;
}

unint64_t sub_2449BCEDC()
{
  unint64_t result;

  result = qword_2573A2748;
  if (!qword_2573A2748)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RenderEffect.ID, &type metadata for RenderEffect.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2748);
  }
  return result;
}

unint64_t sub_2449BCF24()
{
  unint64_t result;

  result = qword_2573A2750;
  if (!qword_2573A2750)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RenderEffect.ID, &type metadata for RenderEffect.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2750);
  }
  return result;
}

unint64_t sub_2449BCF6C()
{
  unint64_t result;

  result = qword_2573A2758;
  if (!qword_2573A2758)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RenderEffect.ID, &type metadata for RenderEffect.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2758);
  }
  return result;
}

ValueMetadata *type metadata accessor for RenderEffect()
{
  return &type metadata for RenderEffect;
}

ValueMetadata *type metadata accessor for RenderEffect.ID()
{
  return &type metadata for RenderEffect.ID;
}

ValueMetadata *type metadata accessor for RenderEffect.DynamicTypeSize()
{
  return &type metadata for RenderEffect.DynamicTypeSize;
}

ValueMetadata *type metadata accessor for RenderEffect.ColorScheme()
{
  return &type metadata for RenderEffect.ColorScheme;
}

ValueMetadata *type metadata accessor for RenderEffect.Orientation()
{
  return &type metadata for RenderEffect.Orientation;
}

uint64_t storeEnumTagSinglePayload for RenderEffect.Key(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2449BD040 + 4 * byte_2449DFA70[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2449BD060 + 4 * byte_2449DFA75[v4]))();
}

_BYTE *sub_2449BD040(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2449BD060(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449BD068(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449BD070(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449BD078(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449BD080(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RenderEffect.Key()
{
  return &type metadata for RenderEffect.Key;
}

unint64_t sub_2449BD0A0()
{
  unint64_t result;

  result = qword_2573A2760;
  if (!qword_2573A2760)
  {
    result = MEMORY[0x24951C158](&unk_2449DFE98, &type metadata for RenderEffect.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2760);
  }
  return result;
}

uint64_t sub_2449BD0E4()
{
  return 25705;
}

unint64_t sub_2449BD0F0()
{
  unint64_t result;

  result = qword_2573A2768;
  if (!qword_2573A2768)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RenderEffect.ID, &type metadata for RenderEffect.ID);
    atomic_store(result, &qword_2573A2768);
  }
  return result;
}

uint64_t sub_2449BD140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2449CF9F4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2449CF9E8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_244940E8C(a1, &qword_25739F578);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2449CF9AC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t MessageStream.Responder.reply<A>(payload:)(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ReplyBox(0, v7, v8, v9);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v16 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, v6, a2);
  v14 = MEMORY[0x24951C158](&unk_2449E0084, v10);
  TransportReply.send<A>(_:file:line:column:function:)((uint64_t)v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsMessaging/Sources/PreviewsMessaging/MessageStream.swift", 123, 2, 138, 32, (uint64_t)"reply(payload:)", 15, 2u, v10, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t type metadata accessor for ReplyBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ReplyBox);
}

uint64_t MessageStream.open<A, B>(forSending:receiving:receiver:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  v10 = MessageStream.open<A>(forReceiving:receiver:)(a1, a3, a4, a6, a8);
  return MessageStream.open<A>(forSending:)(v10, a5, a7);
}

uint64_t MessageStream.Sender.send(oneWay:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a2 + 24);
  v6 = type metadata accessor for CompatibilityInterface(255, *(_QWORD *)(a2 + 16), v5, a4);
  v7 = MEMORY[0x24951C158](&unk_2449E0068, v6);
  v9 = type metadata accessor for AsyncMessageStream.Sender(0, v6, v7, v8);
  return AsyncMessageStream.Sender<>.send(oneWay:)(a1, v9, v5, v10);
}

uint64_t MessageStream.Sender.send<A>(_:expecting:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t *v7;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;

  v32 = a3;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739F578);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v7[3];
  v33 = *v7;
  v34 = *(_OWORD *)(v7 + 1);
  v35 = v16;
  v36 = *((_OWORD *)v7 + 2);
  v18 = type metadata accessor for ReplyBox(0, a6, a7, v17);
  v20 = *(_QWORD *)(a5 + 16);
  v19 = *(_QWORD *)(a5 + 24);
  v22 = type metadata accessor for CompatibilityInterface(255, v20, v19, v21);
  v23 = MEMORY[0x24951C158](&unk_2449E0068, v22);
  v25 = type metadata accessor for AsyncMessageStream.Sender(0, v22, v23, v24);
  v26 = MEMORY[0x24951C158](&unk_2449E0084, v18);
  v27 = AsyncMessageStream.Sender<>.send<A>(message:expecting:)(a1, v18, v25, v18, v26, v19);
  v28 = sub_2449CF9F4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v15, 1, 1, v28);
  v29 = (_QWORD *)swift_allocObject();
  v29[2] = 0;
  v29[3] = 0;
  v29[4] = v20;
  v29[5] = a6;
  v29[6] = v19;
  v29[7] = a7;
  v29[8] = v32;
  v29[9] = a4;
  v29[10] = v27;
  swift_retain();
  sub_2449BD140((uint64_t)v15, (uint64_t)&unk_2573A2778, (uint64_t)v29);
  return swift_release();
}

uint64_t MessageStream.invalidationHandle.getter()
{
  return swift_retain();
}

uint64_t MessageStream.init(underlying:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v7[5];

  sub_2449CF5A4();
  swift_allocObject();
  *a2 = sub_2449CF598();
  v4 = type metadata accessor for MessageStream(0);
  sub_24493DCE8(a1, (uint64_t)a2 + *(int *)(v4 + 20), type metadata accessor for AsyncMessageStream);
  v7[3] = type metadata accessor for AsyncMessageStream(0);
  v7[4] = sub_24493DED4(&qword_25739EEC0, type metadata accessor for AsyncMessageStream, (uint64_t)&protocol conformance descriptor for AsyncMessageStream);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  sub_24493DCE8(a1, (uint64_t)boxed_opaque_existential_1, type metadata accessor for AsyncMessageStream);
  sub_24493DED4(&qword_2573A0C78, type metadata accessor for MessageStream, (uint64_t)&protocol conformance descriptor for MessageStream);
  sub_2449CF418();
  sub_2449299E4(a1, type metadata accessor for AsyncMessageStream);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t MessageStream.onInterruption(_:)(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  type metadata accessor for MessageStream(0);
  return sub_244927DC4(a1, a2);
}

uint64_t MessageStream.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MessageStream(0) + 20) + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageStream.replacementAfterInterruption.getter()
{
  return swift_task_switch();
}

uint64_t sub_2449BD81C()
{
  uint64_t v0;

  sub_2449BEC88();
  swift_allocError();
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t MessageStream.open<A>(forReceiving:receiver:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a5;
  v30 = a2;
  v31 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739F578);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CompatibilityInterface(255, a4, a5, v10);
  v12 = MEMORY[0x24951C158](&unk_2449E0068, v11);
  type metadata accessor for TransportMessage(255, v11, v12, v13);
  v14 = sub_2449CFA78();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v28 - v19;
  type metadata accessor for MessageStream(0);
  AsyncMessageStream.activate<A>(forReceiving:)(v11, v11, v12);
  v21 = sub_2449CF9F4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v9, 1, 1, v21);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, v14);
  v22 = (*(unsigned __int8 *)(v15 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v23 = (char *)swift_allocObject();
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  v24 = v29;
  *((_QWORD *)v23 + 4) = a4;
  *((_QWORD *)v23 + 5) = v24;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v23[v22], v18, v14);
  v25 = &v23[(v16 + v22 + 7) & 0xFFFFFFFFFFFFFFF8];
  v26 = v31;
  *(_QWORD *)v25 = v30;
  *((_QWORD *)v25 + 1) = v26;
  swift_retain();
  sub_2449BD140((uint64_t)v9, (uint64_t)&unk_2573A2798, (uint64_t)v23);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v20, v14);
}

uint64_t MessageStream.open<A>(forSending:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v4 = v3;
  v7 = type metadata accessor for MessageStream(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739F578);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessageStream.Sender(255, a2, a3, v13);
  sub_2449CF70C();
  v14 = sub_2449CF9F4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 1, 1, v14);
  sub_24493DCE8(v4, (uint64_t)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MessageStream);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  sub_24493DD84((uint64_t)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for MessageStream);
  return sub_2449CF700();
}

uint64_t sub_2449BDC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  *(_QWORD *)(v4 + 64) = a1;
  type metadata accessor for MessageStream(0);
  v8 = type metadata accessor for CompatibilityInterface(0, a3, a4, v7);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 72) = v9;
  MEMORY[0x24951C158](&unk_2449E0068, v8);
  *v9 = v4;
  v9[1] = sub_2449287C4;
  return AsyncMessageStream.sender<A>(for:)(v4 + 16, v8, v8);
}

uint64_t sub_2449BDCC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  v8[6] = type metadata accessor for TransportReply();
  v8[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A0DF8);
  v8[8] = swift_task_alloc();
  v8[9] = *(_QWORD *)(a7 - 8);
  v8[10] = swift_task_alloc();
  v12 = type metadata accessor for CompatibilityInterface(255, a7, a8, v11);
  v13 = MEMORY[0x24951C158](&unk_2449E0068, v12);
  v15 = type metadata accessor for TransportMessage(0, v12, v13, v14);
  v8[11] = v15;
  v8[12] = *(_QWORD *)(v15 - 8);
  v8[13] = swift_task_alloc();
  sub_2449CFB2C();
  v8[14] = swift_task_alloc();
  v16 = sub_2449CFA6C();
  v8[15] = v16;
  v8[16] = *(_QWORD *)(v16 - 8);
  v8[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2449BDE10()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2449CFA78();
  sub_2449CFA48();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  *v1 = v0;
  v1[1] = sub_2449BDE88;
  return sub_2449CFA60();
}

uint64_t sub_2449BDE88()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2449BDEDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 104), v1, v2);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v6 = *(_QWORD *)(v0 + 104);
    v8 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 64);
    if (EnumCaseMultiPayload == 1)
    {
      v10 = *(_QWORD *)(v0 + 56);
      v11 = *(_QWORD *)(v0 + 40);
      v12 = *(void (**)(uint64_t, uint64_t))(v0 + 24);
      v13 = v6 + *(int *)(swift_getTupleTypeMetadata2() + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v7, v6, v11);
      sub_24493DD84(v13, v10, (uint64_t (*)(_QWORD))type metadata accessor for TransportReply);
      sub_24493DCE8(v10, v9, (uint64_t (*)(_QWORD))type metadata accessor for TransportReply);
      v14 = type metadata accessor for MessageStream.Responder(0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 0, 1, v14);
      v12(v7, v9);
      sub_244940E8C(v9, &qword_2573A0DF8);
      sub_2449299E4(v10, (uint64_t (*)(_QWORD))type metadata accessor for TransportReply);
    }
    else
    {
      v15 = *(void (**)(uint64_t, uint64_t))(v0 + 24);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v8 + 32))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 40));
      v16 = type metadata accessor for MessageStream.Responder(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 1, 1, v16);
      v15(v7, v9);
      sub_244940E8C(v9, &qword_2573A0DF8);
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 40));
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v17;
    *v17 = v0;
    v17[1] = sub_2449BDE88;
    return sub_2449CFA60();
  }
}

uint64_t sub_2449BE148(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 20) + 8);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t MessageStream.Sender.send(_:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  _QWORD *v23;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739F578);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v4[3];
  v25 = *v4;
  v26 = *(_OWORD *)(v4 + 1);
  v27 = v12;
  v28 = *((_OWORD *)v4 + 2);
  v13 = *(_QWORD *)(a4 + 16);
  v14 = *(_QWORD *)(a4 + 24);
  v16 = type metadata accessor for CompatibilityInterface(255, v13, v14, v15);
  v17 = MEMORY[0x24951C158](&unk_2449E0068, v16);
  v19 = type metadata accessor for AsyncMessageStream.Sender(0, v16, v17, v18);
  v21 = AsyncMessageStream.Sender<>.send(message:)(a1, v19, v14, v20);
  v22 = sub_2449CF9F4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v11, 1, 1, v22);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = a2;
  v23[5] = a3;
  v23[6] = v21;
  swift_retain();
  sub_2449BD140((uint64_t)v11, (uint64_t)&unk_2573A27B8, (uint64_t)v23);
  return swift_release();
}

uint64_t sub_2449BE2C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;

  v5[4] = a4;
  v5[5] = a5;
  v6 = (_QWORD *)swift_task_alloc();
  v5[6] = v6;
  __swift_instantiateConcreteTypeFromMangledName(qword_25739F080);
  *v6 = v5;
  v6[1] = sub_2449BE354;
  return sub_2449CFAB4();
}

uint64_t sub_2449BE354()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2449BE3A8()
{
  uint64_t v0;
  void *v1;
  unsigned __int8 v2;

  v1 = *(void **)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 24);
  (*(void (**)(void *, _QWORD))(v0 + 32))(v1, v2);
  sub_244998AD0(v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2449BE3FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;

  v8[6] = v13;
  v8[7] = v14;
  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a4;
  v8[3] = a5;
  type metadata accessor for ReplyBox(255, a8, v14, a4);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_25739F080);
  v9 = sub_2449CFD90();
  v8[8] = v9;
  v8[9] = *(_QWORD *)(v9 - 8);
  v8[10] = swift_task_alloc();
  v10 = sub_2449CFD90();
  v8[11] = v10;
  v8[12] = *(_QWORD *)(v10 - 8);
  v8[13] = swift_task_alloc();
  v11 = (_QWORD *)swift_task_alloc();
  v8[14] = v11;
  *v11 = v8;
  v11[1] = sub_2449BE51C;
  return sub_2449CFAB4();
}

uint64_t sub_2449BE51C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2449BE570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  _QWORD *v9;
  __int128 v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 80);
  v13 = *(_QWORD *)(v0 + 96);
  v14 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v12 = *(void (**)(uint64_t))(v0 + 16);
  v7 = swift_task_alloc();
  v11 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)v7 = v6;
  *(_QWORD *)(v7 + 8) = v5;
  *(_OWORD *)(v7 + 16) = v11;
  KeyPath = swift_getKeyPath();
  swift_task_dealloc();
  v9 = (_QWORD *)swift_task_alloc();
  v9[2] = v6;
  v9[3] = v11;
  v9[4] = KeyPath;
  sub_244959B78((void (*)(char *))sub_2449C02B4, v3, v1);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_release();
  v12(v1);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t MessageStream.Sender.send(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573A27C0);
  return sub_2449CF6F4();
}

uint64_t sub_2449BE740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;

  v7 = type metadata accessor for MessageStream.Sender(0, a4, a5, a4);
  swift_retain();
  MessageStream.Sender.send(_:replyHandler:)(a3, (uint64_t)sub_2449C0144, a1, v7);
  return swift_release();
}

uint64_t MessageStream.Sender.send<A>(_:expecting:)()
{
  sub_2449CF70C();
  return sub_2449CF6F4();
}

uint64_t sub_2449BE854(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v11 = *a1;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a6;
  v12[5] = a1;
  v13 = *(_QWORD *)(v11 + *MEMORY[0x24BE76BF8]);
  v15 = type metadata accessor for MessageStream.Sender(0, a4, a5, v14);
  swift_retain();
  MessageStream.Sender.send<A>(_:expecting:replyHandler:)(a3, v16, (uint64_t)sub_2449C0124, (uint64_t)v12, v15, v13, a6);
  return swift_release();
}

Swift::Void __swiftcall MessageStream.Responder.reply()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739FDA0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2449CF724();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2449CF730();
  _s19PreviewsMessagingOS24CanvasControlDescriptionV9ModifiersV17propertyListValue0a10FoundationC008PropertyI0Vvg_0();
  type metadata accessor for LazyPropertyList();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(qword_25739FC80);
  sub_2449CF2E0();
  sub_244940E8C((uint64_t)v2, &qword_25739FDA0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MessageStream.Responder.reply(error:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739FDA0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_2449CF724();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2449CF730();
  *v4 = a1;
  swift_storeEnumTagMultiPayload();
  v9 = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_25739FC80);
  sub_2449CF2E0();
  sub_244940E8C((uint64_t)v4, &qword_25739FDA0);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t type metadata accessor for CompatibilityInterface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CompatibilityInterface);
}

uint64_t sub_2449BEB98()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2449BEBCC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v4 = v1[5];
  v12 = v1[4];
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[8];
  v8 = v1[9];
  v9 = v1[10];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_2449382FC;
  return sub_2449BE3FC(a1, v5, v6, v7, v8, v9, v12, v4);
}

uint64_t type metadata accessor for MessageStream(uint64_t a1)
{
  return sub_24492813C(a1, qword_2573A2820);
}

unint64_t sub_2449BEC88()
{
  unint64_t result;

  result = qword_2573A2788;
  if (!qword_2573A2788)
  {
    result = MEMORY[0x24951C158](&unk_2449E0028, &type metadata for MessageStream.ThisDoesNotWorkAnyMore);
    atomic_store(result, &qword_2573A2788);
  }
  return result;
}

uint64_t sub_2449BECCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v5 = type metadata accessor for CompatibilityInterface(255, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4);
  v6 = MEMORY[0x24951C158](&unk_2449E0068, v5);
  type metadata accessor for TransportMessage(255, v5, v6, v7);
  v8 = sub_2449CFA78();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v4 + v10, v8);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2449BED94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v8 = v4[4];
  v7 = v4[5];
  v9 = type metadata accessor for CompatibilityInterface(255, v8, v7, a4);
  v10 = MEMORY[0x24951C158](&unk_2449E0068, v9);
  type metadata accessor for TransportMessage(255, v9, v10, v11);
  v12 = *(_QWORD *)(sub_2449CFA78() - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = v4[2];
  v15 = v4[3];
  v16 = (uint64_t)v4 + v13;
  v17 = (_QWORD *)((char *)v4 + ((*(_QWORD *)(v12 + 64) + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  v18 = *v17;
  v19 = v17[1];
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v20;
  *v20 = v5;
  v20[1] = sub_244933754;
  return sub_2449BDCC0(a1, v14, v15, v16, v18, v19, v8, v7);
}

uint64_t type metadata accessor for MessageStream.Sender(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageStream.Sender);
}

uint64_t sub_2449BEE98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for MessageStream(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 32) & ~v2);
  swift_release();
  v4 = v3 + *(int *)(v1 + 20);
  swift_release();
  swift_bridgeObjectRelease();
  v5 = v4 + *(int *)(type metadata accessor for AsyncMessageStream(0) + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739EE88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2449BEF58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageStream(0) - 8) + 80);
  v7 = v1 + ((v6 + 32) & ~v6);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_244933754;
  return sub_2449BDC0C(a1, v7, v4, v5);
}

uint64_t sub_2449BEFDC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2449BF010(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_2449382FC;
  return sub_2449BE2C8(a1, v4, v5, v6, v7);
}

uint64_t sub_2449BF090(uint64_t a1)
{
  uint64_t *v1;

  return sub_2449BE740(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_2449BF09C(uint64_t *a1)
{
  uint64_t *v1;

  return sub_2449BE854(a1, v1[5], v1[6], v1[2], v1[3], v1[4]);
}

uint64_t MessageStream.Responder.reply(result:)(void *a1, char a2)
{
  return TransportReply.send(result:file:line:column:function:)(a1, a2 & 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsMessaging/Sources/PreviewsMessaging/MessageStream.swift", 123, 2, 142, 32, (uint64_t)"reply(result:)", 14, 2u);
}

uint64_t MessageStream.Responder.reply<A>(result:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(_QWORD);
  uint64_t (*v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[6];

  v20[1] = a1;
  v7 = type metadata accessor for ReplyBox(255, a2, a3, a4);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_25739F080);
  v8 = sub_2449CFD90();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v20 - v10;
  v12 = type metadata accessor for TransportReply();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v15;
  sub_24493DCE8(v4, (uint64_t)v14, v15);
  v20[4] = a2;
  v20[5] = a3;
  v17 = sub_2449CFD90();
  sub_244959B78((void (*)(char *))sub_2449BF324, v17, (uint64_t)v11);
  v18 = MEMORY[0x24951C158](&unk_2449E0084, v7);
  TransportReply.send<A>(result:file:line:column:function:)((uint64_t)v11, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsMessaging/Sources/PreviewsMessaging/MessageStream.swift", 123, 2, 146, 32, (uint64_t)"reply(result:)", 14, 2u, v7, v18);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return sub_2449299E4((uint64_t)v14, v16);
}

uint64_t sub_2449BF2A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, a2);
}

uint64_t sub_2449BF324@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2449BF2A4(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageStream(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (char *)a2 + v6;
    v10 = *(uint64_t *)((char *)a2 + v6);
    v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    *v7 = v10;
    v7[1] = v9;
    v7[2] = *((_QWORD *)v8 + 2);
    v11 = type metadata accessor for AsyncMessageStream(0);
    v12 = *(int *)(v11 + 24);
    v13 = (char *)v7 + v12;
    v14 = &v8[v12];
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739EE88);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    *(_QWORD *)((char *)v7 + *(int *)(v11 + 28)) = *(_QWORD *)&v8[*(int *)(v11 + 28)];
  }
  swift_retain();
  return v5;
}

uint64_t destroy for MessageStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_bridgeObjectRelease();
  v5 = v4 + *(int *)(type metadata accessor for AsyncMessageStream(0) + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739EE88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_release();
}

_QWORD *initializeWithCopy for MessageStream(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (_QWORD *)((char *)a1 + v4);
  v6 = (char *)a2 + v4;
  v8 = *(_QWORD *)((char *)a2 + v4);
  v7 = *(_QWORD *)((char *)a2 + v4 + 8);
  *v5 = v8;
  v5[1] = v7;
  v5[2] = *((_QWORD *)v6 + 2);
  v9 = type metadata accessor for AsyncMessageStream(0);
  v10 = *(int *)(v9 + 24);
  v11 = (char *)v5 + v10;
  v12 = &v6[v10];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739EE88);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  *(_QWORD *)((char *)v5 + *(int *)(v9 + 28)) = *(_QWORD *)&v6[*(int *)(v9 + 28)];
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for MessageStream(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((_QWORD *)v7 + 1) = *((_QWORD *)v8 + 1);
  *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for AsyncMessageStream(0);
  v10 = *(int *)(v9 + 24);
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739EE88);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  *(_QWORD *)&v7[*(int *)(v9 + 28)] = *(_QWORD *)&v8[*(int *)(v9 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *initializeWithTake for MessageStream(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *(_QWORD *)v5 = *(_QWORD *)((char *)a2 + v4);
  *(_OWORD *)(v5 + 8) = *(_OWORD *)((char *)a2 + v4 + 8);
  v7 = type metadata accessor for AsyncMessageStream(0);
  v8 = *(int *)(v7 + 24);
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739EE88);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *(_QWORD *)&v5[*(int *)(v7 + 28)] = *(_QWORD *)&v6[*(int *)(v7 + 28)];
  return a1;
}

_QWORD *assignWithTake for MessageStream(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  swift_release();
  v9 = *((_QWORD *)v8 + 2);
  *((_QWORD *)v7 + 1) = *((_QWORD *)v8 + 1);
  *((_QWORD *)v7 + 2) = v9;
  swift_bridgeObjectRelease();
  v10 = type metadata accessor for AsyncMessageStream(0);
  v11 = *(int *)(v10 + 24);
  v12 = &v7[v11];
  v13 = &v8[v11];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739EE88);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  *(_QWORD *)&v7[*(int *)(v10 + 28)] = *(_QWORD *)&v8[*(int *)(v10 + 28)];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageStream()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449BF7BC(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for AsyncMessageStream(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MessageStream()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2449BF844(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for AsyncMessageStream(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_2449BF8B8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AsyncMessageStream(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MessageStream.Responder()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449BF93C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TransportReply();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MessageStream.Responder()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449BF984(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TransportReply();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MessageStream.Responder(uint64_t a1)
{
  return sub_24492813C(a1, qword_2573A2930);
}

ValueMetadata *type metadata accessor for MessageStream.ThisDoesNotWorkAnyMore()
{
  return &type metadata for MessageStream.ThisDoesNotWorkAnyMore;
}

uint64_t sub_2449BF9E8()
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

uint64_t sub_2449BFA54(uint64_t a1, unsigned int a2, uint64_t a3)
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
  return ((uint64_t (*)(void))((char *)&loc_2449BFB04 + 4 * byte_2449DFEF0[(v7 - 1)]))();
}

void sub_2449BFB54(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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

BOOL sub_2449BFD04()
{
  uint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_2449BFD48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24951C158](&unk_2449E0100, a3);
  return sub_2449CFCE8();
}

uint64_t sub_2449BFD9C(uint64_t a1)
{
  MEMORY[0x24951C158](&unk_2449E0100, a1);
  return sub_2449CF8D4();
}

uint64_t sub_2449BFDE8()
{
  MEMORY[0x24951C158](&unk_2449E0100);
  return sub_2449CF8EC();
}

uint64_t sub_2449BFE38()
{
  MEMORY[0x24951C158](&unk_2449E0100);
  return sub_2449CF8E0();
}

BOOL sub_2449BFE88@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_2449BFD04();
  *a1 = result;
  return result;
}

uint64_t sub_2449BFEC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2449C0358();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2449BFEE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for ReplyBox.Key(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  MEMORY[0x24951C158](&unk_2449E01A0, v4);
  return sub_2449CF3E8();
}

uint64_t sub_2449BFF68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v16[24];
  uint64_t v17;
  uint64_t v18;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v17 = type metadata accessor for ReplyBox.Key(0, v10, v11, v12);
  v18 = MEMORY[0x24951C158](&unk_2449E01A0, v17);
  sub_2449CF37C();
  v13 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
  if (v3)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(a3, v9, a2);
}

uint64_t sub_2449C0084@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2449BFF68(a1, *(_QWORD *)(a2 + 16), a3);
}

uint64_t type metadata accessor for ReplyBox.Key(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ReplyBox.Key);
}

uint64_t sub_2449C00AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 32);
  v6 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a2, v5, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(a2, 0, 1, v4);
}

uint64_t sub_2449C0100()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2449C0124()
{
  return sub_2449CF718();
}

uint64_t sub_2449C0144()
{
  return sub_2449CF718();
}

uint64_t sub_2449C0170(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2449C01D4;
  return v6(a1);
}

uint64_t sub_2449C01D4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2449C0220()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2449C0244(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2449382FC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2573A2A80 + dword_2573A2A80))(a1, v4);
}

uint64_t sub_2449C02B4()
{
  return swift_getAtKeyPath();
}

uint64_t sub_2449C02BC(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2449C02FC + 4 * byte_2449DFEFE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2449C031C + 4 * byte_2449DFF03[v4]))();
}

_BYTE *sub_2449C02FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2449C031C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449C0324(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449C032C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449C0334(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449C033C(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_2449C0348()
{
  JUMPOUT(0x24951C158);
}

uint64_t sub_2449C0358()
{
  return 0x64616F6C796170;
}

PreviewsMessagingOS::MessageStreamInstanceIdentifier __swiftcall MessageStreamInstanceIdentifier.init(rawValue:)(PreviewsMessagingOS::MessageStreamInstanceIdentifier rawValue)
{
  PreviewsMessagingOS::MessageStreamInstanceIdentifier *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t MessageStreamAgentIdentifier.deviceIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2449C1224((uint64_t (*)(_QWORD))MEMORY[0x24BE761F8], a1);
}

uint64_t MessageStreamAgentIdentifier.agentPid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for MessageStreamAgentIdentifier(0) + 20));
}

uint64_t type metadata accessor for MessageStreamAgentIdentifier(uint64_t a1)
{
  return sub_24492813C(a1, qword_2573A2C90);
}

uint64_t MessageStreamAgentIdentifier.init(deviceIdentifier:agentPid:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return sub_2449C1294(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8], type metadata accessor for MessageStreamAgentIdentifier, a3);
}

uint64_t MessageStreamAgentIdentifier.hash(into:)(uint64_t a1)
{
  return sub_2449C1754(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], &qword_2573A1D40, MEMORY[0x24BE76208], (void (*)(_QWORD))type metadata accessor for MessageStreamAgentIdentifier);
}

BOOL static MessageStreamAgentIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_2449C17F0(a1, a2, MEMORY[0x24BE761E8], type metadata accessor for MessageStreamAgentIdentifier);
}

uint64_t MessageStreamAgentIdentifier.hashValue.getter()
{
  return sub_2449C186C((uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], &qword_2573A1D40, MEMORY[0x24BE76208], (void (*)(_QWORD))type metadata accessor for MessageStreamAgentIdentifier);
}

uint64_t sub_2449C0428(uint64_t a1, uint64_t a2)
{
  return sub_2449C1950(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], &qword_2573A1D40, MEMORY[0x24BE76208]);
}

uint64_t sub_2449C0444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C19FC(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], &qword_2573A1D40, MEMORY[0x24BE76208]);
}

uint64_t sub_2449C0460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C1A98(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8], &qword_2573A1D40, MEMORY[0x24BE76208]);
}

BOOL sub_2449C047C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2449C1B70(a1, a2, a3, a4, MEMORY[0x24BE761E8]);
}

uint64_t MessageStreamRequest.agentSpecification.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24493DCE8(v1, a1, type metadata accessor for MessageStreamAgentSpecification);
}

uint64_t type metadata accessor for MessageStreamAgentSpecification(uint64_t a1)
{
  return sub_24492813C(a1, qword_2573A2DB0);
}

uint64_t MessageStreamRequest.streamHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MessageStreamRequest(0) + 20));
  swift_retain();
  return v1;
}

uint64_t type metadata accessor for MessageStreamRequest(uint64_t a1)
{
  return sub_24492813C(a1, qword_2573A2D20);
}

uint64_t MessageStreamRequest.init(specification:streamHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  _QWORD *v8;

  sub_24493DD84(a1, a4, type metadata accessor for MessageStreamAgentSpecification);
  result = type metadata accessor for MessageStreamRequest(0);
  v8 = (_QWORD *)(a4 + *(int *)(result + 20));
  *v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t MessageStreamRequest.init(agentClassName:agentIdentifier:initializationPayload:streamHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  char *v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;

  *a8 = a1;
  a8[1] = a2;
  a8[2] = 0;
  a8[3] = 0;
  a8[4] = a3;
  a8[5] = a4;
  v12 = (char *)a8 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v13 = sub_2449CF400();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a5, v13);
  result = type metadata accessor for MessageStreamRequest(0);
  v15 = (_QWORD *)((char *)a8 + *(int *)(result + 20));
  *v15 = a6;
  v15[1] = a7;
  return result;
}

uint64_t MessageStreamAgentSpecification.init(mangledClassName:frameworkPath:instanceIdentifier:initializationPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  char *v9;
  uint64_t v10;

  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  v9 = (char *)a8 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v10 = sub_2449CF400();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a7, v10);
}

uint64_t MessageStreamAgentSpecification.mangledClassName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageStreamAgentSpecification.frameworkPath.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageStreamAgentSpecification.instanceIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageStreamAgentSpecification.initializationPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v4 = sub_2449CF400();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2449C070C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2449C0744 + 4 * byte_2449E01D0[a1]))(0xD000000000000010, 0x80000002449E2DD0);
}

uint64_t sub_2449C0744()
{
  return 0x726F77656D617266;
}

uint64_t sub_2449C0768(uint64_t a1)
{
  return a1 + 2;
}

void sub_2449C0790(char *a1)
{
  sub_24499DF88(*a1);
}

void sub_2449C079C()
{
  char *v0;

  sub_2449C8424(*v0);
}

void sub_2449C07A4(uint64_t a1)
{
  char *v1;

  sub_244922B38(a1, *v1);
}

void sub_2449C07AC(uint64_t a1)
{
  char *v1;

  sub_2449CC1A8(a1, *v1);
}

uint64_t sub_2449C07B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449C40AC();
  *a1 = result;
  return result;
}

uint64_t sub_2449C07E0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449C070C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449C0808()
{
  unsigned __int8 *v0;

  return sub_2449C070C(*v0);
}

uint64_t MessageStreamAgentSpecification.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449C083C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25739F710);
  MEMORY[0x24BDAC7A8](v2);
  v27 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2F60);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v28 = (uint64_t)&v23 - v9;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v24 = *a1;
  v25 = v11;
  v13 = a1[5];
  v26 = a1[4];
  v14 = (char *)&v23 + *(int *)(v8 + 48) - v9;
  *((_BYTE *)&v23 - v9) = 3;
  v15 = (char *)a1 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v16 = sub_2449CF400();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v18(v14, v15, v16);
  v38 = 0;
  v36 = v24;
  v37 = v10;
  v35 = 1;
  v33 = v25;
  v34 = v12;
  v32 = 2;
  v30 = v26;
  v31 = v13;
  v19 = &v7[*(int *)(v4 + 48)];
  *v7 = 3;
  v18(v19, v14, v16);
  v20 = (uint64_t)v27;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v27, v19, v16);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(v20, 0, 1, v16);
  v29 = 3;
  sub_2449C0D40();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21 = sub_2449CF5EC();
  sub_244940E8C(v20, &qword_25739F710);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_244940E8C(v28, &qword_2573A2F60);
  return v21;
}

uint64_t sub_2449C0ABC()
{
  uint64_t v0;

  return sub_2449C083C(*(uint64_t **)(v0 + 16));
}

uint64_t MessageStreamAgentSpecification.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v16;
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
  _BYTE v28[24];
  ValueMetadata *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;

  v5 = sub_2449CF400();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = &type metadata for MessageStreamAgentSpecification.Key;
  v9 = sub_2449C0D40();
  v30 = v9;
  v28[0] = 0;
  sub_2449CF37C();
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  else
  {
    v33 = a2;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    v11 = v31;
    v10 = v32;
    v29 = &type metadata for MessageStreamAgentSpecification.Key;
    v30 = v9;
    v28[0] = 1;
    sub_2449CF3B8();
    v22 = v11;
    v23 = v10;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    v12 = v26;
    v13 = v27;
    v29 = &type metadata for MessageStreamAgentSpecification.Key;
    v30 = v9;
    v28[0] = 2;
    sub_2449CF3B8();
    v20 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    v19 = v24;
    v21 = v25;
    v29 = &type metadata for MessageStreamAgentSpecification.Key;
    v30 = v9;
    v28[0] = 3;
    sub_2449CF37C();
    v14 = v23;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    v16 = v33;
    *(_QWORD *)v33 = v22;
    *((_QWORD *)v16 + 1) = v14;
    *((_QWORD *)v16 + 2) = v20;
    *((_QWORD *)v16 + 3) = v13;
    v17 = v21;
    *((_QWORD *)v16 + 4) = v19;
    *((_QWORD *)v16 + 5) = v17;
    v18 = type metadata accessor for MessageStreamAgentSpecification(0);
    return (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(&v16[*(int *)(v18 + 28)], v8, v5);
  }
}

unint64_t sub_2449C0D40()
{
  unint64_t result;

  result = qword_2573A2B10;
  if (!qword_2573A2B10)
  {
    result = MEMORY[0x24951C158](&unk_2449E0A54, &type metadata for MessageStreamAgentSpecification.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2B10);
  }
  return result;
}

uint64_t sub_2449C0D84()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449C0DB0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return MessageStreamAgentSpecification.init(propertyListValue:)(a1, a2);
}

uint64_t MessageStreamAgentSpecification.ID.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_2449CFD60();
    swift_bridgeObjectRetain();
    sub_2449CF88C();
    swift_bridgeObjectRelease();
    if (v2)
    {
LABEL_3:
      sub_2449CFD60();
      swift_bridgeObjectRetain();
      sub_2449CF88C();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2449CFD60();
    if (v2)
      goto LABEL_3;
  }
  return sub_2449CFD60();
}

uint64_t MessageStreamAgentSpecification.ID.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 40);
  sub_2449CFD48();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    sub_2449CFD60();
    if (v2)
      goto LABEL_3;
LABEL_5:
    sub_2449CFD60();
    return sub_2449CFD84();
  }
  sub_2449CFD60();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  if (!v2)
    goto LABEL_5;
LABEL_3:
  sub_2449CFD60();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C0FB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 40);
  sub_2449CFD48();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    sub_2449CFD60();
    if (v2)
      goto LABEL_3;
LABEL_5:
    sub_2449CFD60();
    return sub_2449CFD84();
  }
  sub_2449CFD60();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  if (!v2)
    goto LABEL_5;
LABEL_3:
  sub_2449CFD60();
  swift_bridgeObjectRetain();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t MessageStreamAgentSpecification.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2449C10F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t MessageStreamInstanceIdentifier.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2449C116C()
{
  sub_2449C413C();
  return sub_2449CF670();
}

uint64_t sub_2449C11B4()
{
  sub_2449C413C();
  return sub_2449CF67C();
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.streamID.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2449C1224((uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t sub_2449C1224@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.agentPid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for HostAgentSystem.AgentEndpoint.Identity(0) + 20));
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.init(streamID:agentPid:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return sub_2449C1294(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], type metadata accessor for HostAgentSystem.AgentEndpoint.Identity, a3);
}

uint64_t sub_2449C1294@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t (*a4)(_QWORD)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t result;

  v9 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a5, a1, v9);
  result = a4(0);
  *(_DWORD *)(a5 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t sub_2449C12F4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x646950746E656761;
  else
    return 0x44496D6165727473;
}

uint64_t sub_2449C1324(char *a1, char *a2)
{
  return sub_2449A1DA8(*a1, *a2);
}

uint64_t sub_2449C1330()
{
  return sub_2449C84F8();
}

uint64_t sub_2449C1338()
{
  return sub_2449249A8();
}

uint64_t sub_2449C1340()
{
  return sub_2449C9BEC();
}

uint64_t sub_2449C1348@<X0>(char *a1@<X8>)
{
  return sub_24493C2EC(a1);
}

uint64_t sub_2449C1354@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449C12F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449C137C()
{
  char *v0;

  return sub_2449C12F4(*v0);
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449C13B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  int v16;
  char *v17;
  uint64_t v18;
  _DWORD v20[3];
  char v21;
  char v22;
  char v23;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A06A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2F58);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v20 - v10;
  v12 = (char *)v20 + *(int *)(v9 + 48) - v10;
  *((_BYTE *)v20 - v10) = 0;
  v13 = sub_2449CF07C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v15(v12, a1, v13);
  v16 = *(_DWORD *)(a1 + *(int *)(type metadata accessor for HostAgentSystem.AgentEndpoint.Identity(0) + 20));
  v17 = &v8[*(int *)(v5 + 48)];
  *v8 = 0;
  v15(v17, (uint64_t)v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v4, v17, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v4, 0, 1, v13);
  v23 = 0;
  v22 = 1;
  v20[2] = v16;
  v21 = 0;
  sub_2449C2580();
  v18 = sub_2449CF604();
  sub_244940E8C((uint64_t)v4, &qword_2573A06A0);
  sub_244940E8C((uint64_t)v11, &qword_2573A2F58);
  return v18;
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  int v13;
  _DWORD v14[2];
  _BYTE v15[24];
  ValueMetadata *v16;
  unint64_t v17;

  v5 = sub_2449CF07C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &type metadata for HostAgentSystem.AgentEndpoint.Identity.Key;
  v9 = sub_2449C2580();
  v17 = v9;
  v15[0] = 0;
  sub_2449CF37C();
  if (v2)
  {
    v10 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    v16 = &type metadata for HostAgentSystem.AgentEndpoint.Identity.Key;
    v17 = v9;
    v15[0] = 1;
    sub_2449CF37C();
    v12 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    v13 = v14[1];
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
    result = type metadata accessor for HostAgentSystem.AgentEndpoint.Identity(0);
    *(_DWORD *)(a2 + *(int *)(result + 20)) = v13;
  }
  return result;
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.hash(into:)(uint64_t a1)
{
  return sub_2449C1754(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], (unint64_t *)&qword_2573A06C8, MEMORY[0x24BDCEA88], (void (*)(_QWORD))type metadata accessor for HostAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_2449C1754(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4, void (*a5)(_QWORD))
{
  a2(0);
  sub_24493DED4(a3, a2, a4);
  sub_2449CF838();
  a5(0);
  return sub_2449CFD6C();
}

BOOL static HostAgentSystem.AgentEndpoint.Identity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_2449C17F0(a1, a2, MEMORY[0x24BDCE9E0], type metadata accessor for HostAgentSystem.AgentEndpoint.Identity);
}

BOOL sub_2449C17F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(_QWORD))
{
  uint64_t v7;

  if ((a3() & 1) == 0)
    return 0;
  v7 = a4(0);
  return *(_DWORD *)(a1 + *(int *)(v7 + 20)) == *(_DWORD *)(a2 + *(int *)(v7 + 20));
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.hashValue.getter()
{
  return sub_2449C186C((uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], (unint64_t *)&qword_2573A06C8, MEMORY[0x24BDCEA88], (void (*)(_QWORD))type metadata accessor for HostAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_2449C186C(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3, void (*a4)(_QWORD))
{
  sub_2449CFD48();
  a1(0);
  sub_24493DED4(a2, a1, a3);
  sub_2449CF838();
  a4(0);
  sub_2449CFD6C();
  return sub_2449CFD84();
}

uint64_t sub_2449C1904(char a1)
{
  if ((a1 & 1) != 0)
    return 0x657461647075;
  else
    return 0x746E656761;
}

uint64_t sub_2449C1934(uint64_t a1, uint64_t a2)
{
  return sub_2449C1950(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], (unint64_t *)&qword_2573A06C8, MEMORY[0x24BDCEA88]);
}

uint64_t sub_2449C1950(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  sub_2449CFD48();
  a3(0);
  sub_24493DED4(a4, a3, a5);
  sub_2449CF838();
  sub_2449CFD6C();
  return sub_2449CFD84();
}

uint64_t sub_2449C19E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C19FC(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], (unint64_t *)&qword_2573A06C8, MEMORY[0x24BDCEA88]);
}

uint64_t sub_2449C19FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, uint64_t a6)
{
  a4(0);
  sub_24493DED4(a5, a4, a6);
  sub_2449CF838();
  return sub_2449CFD6C();
}

uint64_t sub_2449C1A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C1A98(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], (unint64_t *)&qword_2573A06C8, MEMORY[0x24BDCEA88]);
}

uint64_t sub_2449C1A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, uint64_t a6)
{
  sub_2449CFD48();
  a4(0);
  sub_24493DED4(a5, a4, a6);
  sub_2449CF838();
  sub_2449CFD6C();
  return sub_2449CFD84();
}

uint64_t sub_2449C1B24()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449C1B50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return HostAgentSystem.AgentEndpoint.Identity.init(propertyListValue:)(a1, a2);
}

BOOL sub_2449C1B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2449C1B70(a1, a2, a3, a4, MEMORY[0x24BDCE9E0]);
}

BOOL sub_2449C1B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return (a5() & 1) != 0 && *(_DWORD *)(a1 + *(int *)(a3 + 20)) == *(_DWORD *)(a2 + *(int *)(a3 + 20));
}

uint64_t sub_2449C1BC0(char *a1, char *a2)
{
  return sub_2449A1FAC(*a1, *a2);
}

uint64_t sub_2449C1BCC()
{
  return sub_2449C856C();
}

uint64_t sub_2449C1BD4()
{
  return sub_244924AAC();
}

uint64_t sub_2449C1BDC()
{
  return sub_2449C9A8C();
}

uint64_t sub_2449C1BE4@<X0>(char *a1@<X8>)
{
  return sub_24493C2EC(a1);
}

uint64_t sub_2449C1BF0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449C1904(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449C1C18()
{
  sub_2449C4068();
  return sub_2449CF670();
}

uint64_t sub_2449C1C60()
{
  sub_2449C4068();
  return sub_2449CF67C();
}

uint64_t sub_2449C1CC4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2449C1CFC + 4 * byte_2449E01D4[a1]))(0xD000000000000012, 0x80000002449E2E40);
}

uint64_t sub_2449C1CFC()
{
  return 0x696D697263736964;
}

uint64_t sub_2449C1D1C(uint64_t a1)
{
  return a1 - 1;
}

void sub_2449C1D64(char *a1)
{
  sub_2449A1E24(*a1);
}

void sub_2449C1D70()
{
  char *v0;

  sub_2449C85E4(*v0);
}

void sub_2449C1D78(uint64_t a1)
{
  char *v1;

  sub_2449249EC(a1, *v1);
}

void sub_2449C1D80(uint64_t a1)
{
  char *v1;

  sub_2449C9B00(a1, *v1);
}

uint64_t sub_2449C1D88@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449C40F4();
  *a1 = result;
  return result;
}

uint64_t sub_2449C1DB4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449C1CC4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449C1DDC()
{
  unsigned __int8 *v0;

  return sub_2449C1CC4(*v0);
}

uint64_t HostAgentSystem.AgentEndpoint.StreamContext.propertyListValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[16];
  uint64_t v18;
  _BYTE v19[24];
  ValueMetadata *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A2B20);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for MessageStreamAgentSpecification(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)&v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = v0;
  v11 = sub_2449C25E0();
  sub_2449C2624();
  sub_2449CF3E8();
  sub_24493DCE8(v0, (uint64_t)v10, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = v10[1];
    v13 = v10[2];
    v14 = v10[3];
    v15 = v10[4];
    v22 = *v10;
    v23 = v12;
    v20 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    v21 = v11;
    v19[0] = 2;
    sub_244942470();
    sub_2449CF370();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    v21 = v11;
    v22 = v13;
    LOBYTE(v23) = 0;
    v20 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    v19[0] = 3;
    sub_2449423E8();
    sub_2449CF370();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    v22 = v14;
    v23 = v15;
    v20 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    v21 = v11;
    v19[0] = 4;
    sub_2449C2668();
    sub_2449CF370();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24493DD84((uint64_t)v10, (uint64_t)v7, type metadata accessor for MessageStreamAgentSpecification);
    sub_24493DCE8((uint64_t)v7, (uint64_t)v3, type metadata accessor for MessageStreamAgentSpecification);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    v20 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    v21 = v11;
    v19[0] = 1;
    sub_24493DED4(&qword_2573A2B40, type metadata accessor for MessageStreamAgentSpecification, (uint64_t)&protocol conformance descriptor for MessageStreamAgentSpecification);
    sub_2449CF370();
    sub_244940E8C((uint64_t)v3, &qword_2573A2B20);
    sub_2449299E4((uint64_t)v7, type metadata accessor for MessageStreamAgentSpecification);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_2449C20A0(_BYTE *a1, BOOL *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int EnumCaseMultiPayload;
  BOOL v10;
  uint64_t (*v11)(uint64_t);
  uint64_t result;
  uint64_t v13;

  v6 = type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_24493DCE8(a3, (uint64_t)v8, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v10 = EnumCaseMultiPayload == 1;
  if (EnumCaseMultiPayload == 1)
    v11 = type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext;
  else
    v11 = type metadata accessor for MessageStreamAgentSpecification;
  result = sub_2449299E4((uint64_t)v8, v11);
  *a2 = v10;
  return result;
}

uint64_t HostAgentSystem.AgentEndpoint.StreamContext.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[24];
  ValueMetadata *v25;
  unint64_t v26;
  uint64_t v27;

  v5 = type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (_QWORD *)((char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v21 - v9;
  v25 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
  v11 = sub_2449C25E0();
  v26 = v11;
  v24[0] = 0;
  sub_2449C2624();
  sub_2449CF37C();
  if (v2)
  {
    v12 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    v25 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    v26 = v11;
    if ((v22 & 1) != 0)
    {
      v24[0] = 2;
      sub_244942470();
      sub_2449CF37C();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      v15 = v22;
      v14 = v23;
      v25 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
      v26 = v11;
      v24[0] = 3;
      sub_2449423E8();
      sub_2449CF37C();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      v21[0] = v27;
      v25 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
      v26 = v11;
      v24[0] = 4;
      sub_2449C2668();
      sub_2449CF37C();
      v17 = sub_2449CF400();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a1, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      v18 = v21[1];
      v19 = v21[2];
      *v8 = v15;
      v8[1] = v14;
      v8[2] = v21[0];
      v8[3] = v18;
      v8[4] = v19;
      swift_storeEnumTagMultiPayload();
      v20 = (uint64_t)v8;
    }
    else
    {
      v24[0] = 1;
      type metadata accessor for MessageStreamAgentSpecification(0);
      sub_24493DED4(&qword_2573A2B40, type metadata accessor for MessageStreamAgentSpecification, (uint64_t)&protocol conformance descriptor for MessageStreamAgentSpecification);
      sub_2449CF37C();
      v16 = sub_2449CF400();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a1, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      swift_storeEnumTagMultiPayload();
      v20 = (uint64_t)v10;
    }
    return sub_24493DD84(v20, a2, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
  }
}

uint64_t sub_2449C2450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return HostAgentSystem.AgentEndpoint.StreamContext.init(propertyListValue:)(a1, a2);
}

uint64_t _s19PreviewsMessagingOS31MessageStreamAgentSpecificationV2IDV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  char v12;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a1[5];
  v7 = a2[2];
  v6 = a2[3];
  v9 = a2[4];
  v8 = a2[5];
  if (*a1 == *a2 && a1[1] == a2[1] || (v10 = sub_2449CFCD0(), result = 0, (v10 & 1) != 0))
  {
    if (v4)
    {
      if (!v6)
        return 0;
      if (v2 != v7 || v4 != v6)
      {
        v12 = sub_2449CFCD0();
        result = 0;
        if ((v12 & 1) == 0)
          return result;
      }
    }
    else if (v6)
    {
      return 0;
    }
    if (v5)
    {
      if (v8 && (v3 == v9 && v5 == v8 || (sub_2449CFCD0() & 1) != 0))
        return 1;
    }
    else if (!v8)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1)
{
  return sub_24492813C(a1, qword_2573A2E48);
}

uint64_t sub_2449C2578()
{
  uint64_t v0;

  return sub_2449C13B0(*(_QWORD *)(v0 + 16));
}

unint64_t sub_2449C2580()
{
  unint64_t result;

  result = qword_2573A2B18;
  if (!qword_2573A2B18)
  {
    result = MEMORY[0x24951C158](&unk_2449E0A2C, &type metadata for HostAgentSystem.AgentEndpoint.Identity.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2B18);
  }
  return result;
}

uint64_t type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext(uint64_t a1)
{
  return sub_24492813C(a1, qword_2573A2EF0);
}

uint64_t sub_2449C25D8(_BYTE *a1, BOOL *a2)
{
  uint64_t v2;

  return sub_2449C20A0(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_2449C25E0()
{
  unint64_t result;

  result = qword_2573A2B28;
  if (!qword_2573A2B28)
  {
    result = MEMORY[0x24951C158](&unk_2449E0A04, &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2B28);
  }
  return result;
}

unint64_t sub_2449C2624()
{
  unint64_t result;

  result = qword_2573A2B30;
  if (!qword_2573A2B30)
  {
    result = MEMORY[0x24951C158](&unk_2449E09C4, &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A2B30);
  }
  return result;
}

unint64_t sub_2449C2668()
{
  unint64_t result;

  result = qword_2573A2B38;
  if (!qword_2573A2B38)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageStreamInstanceIdentifier, &type metadata for MessageStreamInstanceIdentifier);
    atomic_store(result, (unint64_t *)&qword_2573A2B38);
  }
  return result;
}

uint64_t sub_2449C26AC()
{
  return sub_24493DED4(&qword_2573A2B48, type metadata accessor for MessageStreamAgentIdentifier, (uint64_t)&protocol conformance descriptor for MessageStreamAgentIdentifier);
}

unint64_t sub_2449C26DC()
{
  unint64_t result;

  result = qword_2573A2B50;
  if (!qword_2573A2B50)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageStreamAgentSpecification.ID, &type metadata for MessageStreamAgentSpecification.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2B50);
  }
  return result;
}

unint64_t sub_2449C2724()
{
  unint64_t result;

  result = qword_2573A2B58;
  if (!qword_2573A2B58)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageStreamAgentSpecification.ID, &type metadata for MessageStreamAgentSpecification.ID);
    atomic_store(result, (unint64_t *)&qword_2573A2B58);
  }
  return result;
}

unint64_t sub_2449C276C()
{
  unint64_t result;

  result = qword_2573A2B60;
  if (!qword_2573A2B60)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageStreamInstanceIdentifier, &type metadata for MessageStreamInstanceIdentifier);
    atomic_store(result, (unint64_t *)&qword_2573A2B60);
  }
  return result;
}

uint64_t sub_2449C27B0()
{
  return MEMORY[0x24BE76190];
}

uint64_t sub_2449C27BC()
{
  return sub_24493DED4((unint64_t *)&qword_2573A06C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

unint64_t sub_2449C27EC()
{
  unint64_t result;

  result = qword_2573A2B68;
  if (!qword_2573A2B68)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for HostAgentSystem.AgentEndpoint, &type metadata for HostAgentSystem.AgentEndpoint);
    atomic_store(result, (unint64_t *)&qword_2573A2B68);
  }
  return result;
}

uint64_t sub_2449C2830()
{
  return sub_24493DED4(&qword_2573A2BB8, type metadata accessor for HostAgentSystem.AgentEndpoint.Identity, (uint64_t)&protocol conformance descriptor for HostAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_2449C285C()
{
  return sub_24493DED4(&qword_2573A2BC0, type metadata accessor for HostAgentSystem.AgentEndpoint.Identity, (uint64_t)&protocol conformance descriptor for HostAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_2449C2888()
{
  return sub_24493DED4(&qword_2573A2BC8, type metadata accessor for HostAgentSystem.AgentEndpoint.Identity, (uint64_t)&protocol conformance descriptor for HostAgentSystem.AgentEndpoint.Identity);
}

unint64_t sub_2449C28B8()
{
  unint64_t result;

  result = qword_2573A2BD0;
  if (!qword_2573A2BD0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for HostAgentSystem.HostEndpoint, &type metadata for HostAgentSystem.HostEndpoint);
    atomic_store(result, (unint64_t *)&qword_2573A2BD0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageStreamAgentIdentifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2449C3468(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8]);
}

uint64_t destroy for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2)
{
  return sub_2449C34FC(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8]);
}

uint64_t initializeWithCopy for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C353C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8]);
}

uint64_t assignWithCopy for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C35A4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8]);
}

uint64_t initializeWithTake for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C360C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8]);
}

uint64_t assignWithTake for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C3674(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8]);
}

uint64_t getEnumTagSinglePayload for MessageStreamAgentIdentifier()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449C2950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8]);
}

uint64_t storeEnumTagSinglePayload for MessageStreamAgentIdentifier()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449C2968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BE761F8]);
}

uint64_t sub_2449C2974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244970E58(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BE761F8]);
}

uint64_t dispatch thunk of MessageStreamAgentProtocol.init(initializationPayload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MessageStreamAgentProtocol.handleMessageStream(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MessageStreamAgentProtocol.handleHotSwap()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageStreamRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
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
    v10 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_2449CF400();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v15 = *(int *)(a3 + 20);
    v16 = (uint64_t *)((char *)v4 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for MessageStreamRequest(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = a1 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v3 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_release();
}

_QWORD *initializeWithCopy for MessageStreamRequest(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2449CF400();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v14 = *(int *)(a3 + 20);
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for MessageStreamRequest(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

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
  v6 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2449CF400();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 20);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *initializeWithTake for MessageStreamRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2449CF400();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *assignWithTake for MessageStreamRequest(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

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
  v9 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2449CF400();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageStreamRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449C2E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for MessageStreamAgentSpecification(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageStreamRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449C2E94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for MessageStreamAgentSpecification(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_2449C2F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244970E58(a1, a2, a3, type metadata accessor for MessageStreamAgentSpecification);
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageStreamAgentSpecification(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
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
    v7 = a2[5];
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a2 + v8;
    v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    v11 = sub_2449CF400();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for MessageStreamAgentSpecification(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_2449CF400();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for MessageStreamAgentSpecification(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a2 + v7;
  v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  v10 = sub_2449CF400();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

_QWORD *assignWithCopy for MessageStreamAgentSpecification(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2449CF400();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for MessageStreamAgentSpecification(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2449CF400();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for MessageStreamAgentSpecification(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

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
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2449CF400();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageStreamAgentSpecification()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449C3290(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_2449CF400();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MessageStreamAgentSpecification()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449C3318(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_2449CF400();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2449C338C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2449CF400();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageStreamAgentSpecification.ID()
{
  return &type metadata for MessageStreamAgentSpecification.ID;
}

ValueMetadata *type metadata accessor for MessageStreamInstanceIdentifier()
{
  return &type metadata for MessageStreamInstanceIdentifier;
}

ValueMetadata *type metadata accessor for HostAgentSystem()
{
  return &type metadata for HostAgentSystem;
}

ValueMetadata *type metadata accessor for HostAgentSystem.HostEndpoint()
{
  return &type metadata for HostAgentSystem.HostEndpoint;
}

ValueMetadata *type metadata accessor for HostAgentSystem.AgentEndpoint()
{
  return &type metadata for HostAgentSystem.AgentEndpoint;
}

uint64_t *initializeBufferWithCopyOfBuffer for HostAgentSystem.AgentEndpoint.Identity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2449C3468(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t *sub_2449C3468(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  int v6;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v8 = a4(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2)
{
  return sub_2449C34FC(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_2449C34FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v4;

  v4 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

uint64_t initializeWithCopy for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C353C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_2449C353C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;

  v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C35A4(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_2449C35A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;

  v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(a1, a2, v7);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C360C(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_2449C360C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;

  v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2449C3674(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_2449C3674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;

  v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(a1, a2, v7);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for HostAgentSystem.AgentEndpoint.Identity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449C36DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t storeEnumTagSinglePayload for HostAgentSystem.AgentEndpoint.Identity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449C36F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_2449C3700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_244970E58(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58]);
}

uint64_t initializeBufferWithCopyOfBuffer for HostAgentSystem.AgentEndpoint.StreamContext(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v8 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    if (EnumCaseMultiPayload == 1)
    {
      *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
      *(_QWORD *)(a1 + 32) = a2[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v9 = a2[3];
      *(_QWORD *)(a1 + 16) = a2[2];
      *(_QWORD *)(a1 + 24) = v9;
      v10 = a2[5];
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_QWORD *)(a1 + 40) = v10;
      v11 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
      v12 = a1 + v11;
      v13 = (uint64_t)a2 + v11;
      v14 = sub_2449CF400();
      v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for HostAgentSystem.AgentEndpoint.StreamContext(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t v4;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload == 1)
    return swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  v5 = sub_2449CF400();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for HostAgentSystem.AgentEndpoint.StreamContext(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  if (EnumCaseMultiPayload == 1)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v6;
    v7 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v7;
    v8 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
    v9 = a1 + v8;
    v10 = a2 + v8;
    v11 = sub_2449CF400();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for HostAgentSystem.AgentEndpoint.StreamContext(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  if (a1 != a2)
  {
    sub_2449299E4((uint64_t)a1, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    if (EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      a1[5] = a2[5];
      v5 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
      v6 = (char *)a1 + v5;
      v7 = (char *)a2 + v5;
      v8 = sub_2449CF400();
      v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v9(v6, v7, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for HostAgentSystem.AgentEndpoint.StreamContext(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    a1[2] = a2[2];
    v7 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2449CF400();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for HostAgentSystem.AgentEndpoint.StreamContext(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_2449299E4((uint64_t)a1, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      a1[2] = a2[2];
      v7 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_2449CF400();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2449C3C64()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MessageStreamAgentSpecification(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext.Discriminant()
{
  return &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Discriminant;
}

uint64_t storeEnumTagSinglePayload for HostAgentSystem.AgentEndpoint.StreamContext.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449C3D30 + 4 * byte_2449E01DE[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2449C3D64 + 4 * byte_2449E01D9[v4]))();
}

uint64_t sub_2449C3D64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449C3D6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449C3D74);
  return result;
}

uint64_t sub_2449C3D80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449C3D88);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2449C3D8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449C3D94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext.Key()
{
  return &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
}

uint64_t _s19PreviewsMessagingOS15HostAgentSystemO13AgentEndpointO13StreamContextO12DiscriminantOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449C3DFC + 4 * byte_2449E01E8[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2449C3E30 + 4 * byte_2449E01E3[v4]))();
}

uint64_t sub_2449C3E30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449C3E38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449C3E40);
  return result;
}

uint64_t sub_2449C3E4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449C3E54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2449C3E58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449C3E60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostAgentSystem.AgentEndpoint.Identity.Key()
{
  return &type metadata for HostAgentSystem.AgentEndpoint.Identity.Key;
}

uint64_t storeEnumTagSinglePayload for MessageStreamAgentSpecification.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449C3EC8 + 4 * byte_2449E01F2[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2449C3EFC + 4 * byte_2449E01ED[v4]))();
}

uint64_t sub_2449C3EFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449C3F04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449C3F0CLL);
  return result;
}

uint64_t sub_2449C3F18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449C3F20);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2449C3F24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449C3F2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessageStreamAgentSpecification.Key()
{
  return &type metadata for MessageStreamAgentSpecification.Key;
}

unint64_t sub_2449C3F4C()
{
  unint64_t result;

  result = qword_2573A2F28;
  if (!qword_2573A2F28)
  {
    result = MEMORY[0x24951C158](&unk_2449E07BC, &type metadata for MessageStreamAgentSpecification.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2F28);
  }
  return result;
}

unint64_t sub_2449C3F94()
{
  unint64_t result;

  result = qword_2573A2F30;
  if (!qword_2573A2F30)
  {
    result = MEMORY[0x24951C158](&unk_2449E085C, &type metadata for HostAgentSystem.AgentEndpoint.Identity.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2F30);
  }
  return result;
}

unint64_t sub_2449C3FDC()
{
  unint64_t result;

  result = qword_2573A2F38;
  if (!qword_2573A2F38)
  {
    result = MEMORY[0x24951C158](&unk_2449E08FC, &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2F38);
  }
  return result;
}

unint64_t sub_2449C4024()
{
  unint64_t result;

  result = qword_2573A2F40;
  if (!qword_2573A2F40)
  {
    result = MEMORY[0x24951C158](&unk_2449E099C, &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A2F40);
  }
  return result;
}

unint64_t sub_2449C4068()
{
  unint64_t result;

  result = qword_2573A2F48;
  if (!qword_2573A2F48)
  {
    result = MEMORY[0x24951C158](&unk_2449E0924, &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A2F48);
  }
  return result;
}

uint64_t sub_2449C40AC()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_2449C40F4()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

unint64_t sub_2449C413C()
{
  unint64_t result;

  result = qword_2573A2F50;
  if (!qword_2573A2F50)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for MessageStreamInstanceIdentifier, &type metadata for MessageStreamInstanceIdentifier);
    atomic_store(result, (unint64_t *)&qword_2573A2F50);
  }
  return result;
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.contentIdentifier.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.contentIdentifier.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*HostShellSystem.ShellEndpoint.StreamContext.contentIdentifier.modify())()
{
  return nullsub_1;
}

void HostShellSystem.ShellEndpoint.StreamContext.hostUpdateSeed.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
}

_QWORD *HostShellSystem.ShellEndpoint.StreamContext.hostUpdateSeed.setter(_QWORD *result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *result;
  return result;
}

uint64_t (*HostShellSystem.ShellEndpoint.StreamContext.hostUpdateSeed.modify())()
{
  return nullsub_1;
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.instanceIdentifier.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 32);
  *a1 = *(_QWORD *)(v1 + 24);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.instanceIdentifier.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v3;
  return result;
}

uint64_t (*HostShellSystem.ShellEndpoint.StreamContext.instanceIdentifier.modify())()
{
  return nullsub_1;
}

_QWORD *HostShellSystem.ShellEndpoint.StreamContext.init(contentIdentifier:hostUpdateSeed:instanceIdentifier:)@<X0>(_QWORD *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = result[1];
  v5 = *a2;
  v6 = *a3;
  v7 = a3[1];
  *a4 = *result;
  a4[1] = v4;
  a4[2] = v5;
  a4[3] = v6;
  a4[4] = v7;
  return result;
}

uint64_t sub_2449C4268(char a1)
{
  uint64_t result;

  result = 0xD000000000000011;
  if (a1)
  {
    if (a1 == 1)
      return 0x6164705574736F68;
    else
      return 0xD000000000000012;
  }
  return result;
}

uint64_t sub_2449C42D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2449A1C94(*a1, *a2);
}

uint64_t sub_2449C42DC()
{
  return sub_2449C86D4();
}

uint64_t sub_2449C42E4()
{
  return sub_244924920();
}

uint64_t sub_2449C42EC()
{
  return sub_2449C9C5C();
}

uint64_t sub_2449C42F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449C49E0();
  *a1 = result;
  return result;
}

uint64_t sub_2449C4320@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449C4268(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449C4348()
{
  char *v0;

  return sub_2449C4268(*v0);
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.propertyListValue.getter()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449C4390()
{
  sub_2449C45EC();
  sub_244942470();
  sub_2449423E8();
  sub_2449C2668();
  return sub_2449CF5F8();
}

uint64_t sub_2449C4454()
{
  return sub_2449C4390();
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];
  ValueMetadata *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key;
  v5 = sub_2449C45EC();
  v16 = v5;
  v14[0] = 0;
  sub_244942470();
  sub_2449CF37C();
  if (v2)
  {
    v6 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    v8 = v17;
    v7 = v18;
    v15 = &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key;
    v16 = v5;
    v14[0] = 1;
    sub_2449423E8();
    sub_2449CF37C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    v15 = &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key;
    v16 = v5;
    v14[0] = 2;
    sub_2449C2668();
    sub_2449CF37C();
    v10 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    *a2 = v8;
    a2[1] = v7;
    a2[2] = v13;
    a2[3] = v11;
    a2[4] = v12;
  }
  return result;
}

unint64_t sub_2449C45EC()
{
  unint64_t result;

  result = qword_2573A2F68;
  if (!qword_2573A2F68)
  {
    result = MEMORY[0x24951C158](&unk_2449E0C24, &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key);
    atomic_store(result, (unint64_t *)&qword_2573A2F68);
  }
  return result;
}

unint64_t sub_2449C4634()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573A06C8;
  if (!qword_2573A06C8)
  {
    v1 = sub_2449CF07C();
    result = MEMORY[0x24951C158](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_2573A06C8);
  }
  return result;
}

unint64_t sub_2449C4680()
{
  unint64_t result;

  result = qword_2573A2F70;
  if (!qword_2573A2F70)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for HostShellSystem.ShellEndpoint, &type metadata for HostShellSystem.ShellEndpoint);
    atomic_store(result, (unint64_t *)&qword_2573A2F70);
  }
  return result;
}

uint64_t sub_2449C46C4()
{
  return sub_2449CF3D0();
}

uint64_t sub_2449C4704@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return HostShellSystem.ShellEndpoint.StreamContext.init(propertyListValue:)(a1, a2);
}

unint64_t sub_2449C471C()
{
  unint64_t result;

  result = qword_2573A2FC0;
  if (!qword_2573A2FC0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for HostShellSystem.HostEndpoint, &type metadata for HostShellSystem.HostEndpoint);
    atomic_store(result, (unint64_t *)&qword_2573A2FC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HostShellSystem()
{
  return &type metadata for HostShellSystem;
}

ValueMetadata *type metadata accessor for HostShellSystem.HostEndpoint()
{
  return &type metadata for HostShellSystem.HostEndpoint;
}

ValueMetadata *type metadata accessor for HostShellSystem.ShellEndpoint()
{
  return &type metadata for HostShellSystem.ShellEndpoint;
}

uint64_t destroy for HostShellSystem.ShellEndpoint.StreamContext()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HostShellSystem.ShellEndpoint.StreamContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HostShellSystem.ShellEndpoint.StreamContext(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HostShellSystem.ShellEndpoint.StreamContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for HostShellSystem.ShellEndpoint.StreamContext()
{
  return &type metadata for HostShellSystem.ShellEndpoint.StreamContext;
}

uint64_t storeEnumTagSinglePayload for HostShellSystem.ShellEndpoint.StreamContext.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449C4918 + 4 * byte_2449E0A85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2449C494C + 4 * byte_2449E0A80[v4]))();
}

uint64_t sub_2449C494C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449C4954(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449C495CLL);
  return result;
}

uint64_t sub_2449C4968(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449C4970);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2449C4974(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449C497C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostShellSystem.ShellEndpoint.StreamContext.Key()
{
  return &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key;
}

unint64_t sub_2449C499C()
{
  unint64_t result;

  result = qword_2573A3028;
  if (!qword_2573A3028)
  {
    result = MEMORY[0x24951C158](&unk_2449E0BFC, &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key);
    atomic_store(result, (unint64_t *)&qword_2573A3028);
  }
  return result;
}

uint64_t sub_2449C49E0()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t SecurityScopedURLWrapper.init(url:readonly:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t result;

  v6 = objc_allocWithZone(MEMORY[0x24BDD17B8]);
  v7 = (void *)sub_2449CF010();
  v8 = objc_msgSend(v6, sel_initWithURL_readonly_, v7, a2 & 1);

  v9 = sub_2449CF034();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  *a3 = v8;
  return result;
}

uint64_t SecurityScopedURLWrapper.init(playgroundsExecutePermissionsForURL:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;

  v4 = objc_allocWithZone(MEMORY[0x24BDD17B8]);
  v5 = (void *)sub_2449CF010();
  v6 = (void *)sub_2449CF85C();
  v7 = objc_msgSend(v4, sel_initWithURL_readonly_extensionClass_, v5, 1, v6);

  v8 = sub_2449CF034();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  *a2 = v7;
  return result;
}

uint64_t SecurityScopedURLWrapper.data.getter()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *v0;
  v8[0] = 0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v1, 1, v8);
  v3 = v8[0];
  if (v2)
  {
    v4 = sub_2449CF04C();

  }
  else
  {
    v5 = v3;
    v6 = (void *)sub_2449CEFE0();

    swift_willThrow();
    return 0;
  }
  return v4;
}

uint64_t SecurityScopedURLWrapper.propertyListValue.getter()
{
  return SecurityScopedURLWrapper.data.getter();
}

uint64_t SecurityScopedURLWrapper.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;

  sub_2449C4D5C(0, &qword_2573A3030);
  sub_2449C4D5C(0, &qword_2573A3038);
  v7 = sub_2449CFB08();
  if (v3)
    return sub_244962528(a1, a2);
  v9 = v7;
  if (!v7)
  {
    sub_2449C4D94();
    swift_allocError();
    *v10 = 0;
    v10[1] = 0;
    swift_willThrow();
    return sub_244962528(a1, a2);
  }
  result = sub_244962528(a1, a2);
  *a3 = v9;
  return result;
}

uint64_t sub_2449C4D5C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_2449C4D94()
{
  unint64_t result;

  result = qword_2573A3040;
  if (!qword_2573A3040)
  {
    result = MEMORY[0x24951C158](&unk_2449E0E20, &type metadata for SecurityScopedURLWrapper.UnarchiveFailedError);
    atomic_store(result, (unint64_t *)&qword_2573A3040);
  }
  return result;
}

unint64_t SecurityScopedURLWrapper.description.getter()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  unint64_t v8;
  unint64_t v9;

  v1 = sub_2449CEFA4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_2449CFB98();
  swift_bridgeObjectRelease();
  v8 = 0xD000000000000019;
  v9 = 0x80000002449E5000;
  v6 = objc_msgSend(v5, sel_description);
  sub_2449CF868();

  sub_2449CEF98();
  sub_2449CF880();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_2449CF898();
  swift_bridgeObjectRelease();
  sub_2449CF898();
  return v8;
}

void SecurityScopedURLWrapper.url.getter()
{
  id *v0;
  id v1;

  v1 = objc_msgSend(*v0, sel_url);
  sub_2449CF01C();

}

uint64_t sub_2449C4F64()
{
  return MEMORY[0x24BE76178];
}

unint64_t sub_2449C4F74()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_2449C4F90()
{
  sub_2449C51B0();
  return sub_2449CF52C();
}

uint64_t sub_2449C4FB8()
{
  sub_2449C51B0();
  return sub_2449CF508();
}

uint64_t sub_2449C4FE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SecurityScopedURLWrapper.data.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2449C5018@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;

  v4 = *a1;
  v5 = a1[1];
  sub_2449C4D5C(0, &qword_2573A3030);
  sub_2449C4D5C(0, &qword_2573A3038);
  v6 = sub_2449CFB08();
  if (v2)
    return sub_244962528(v4, v5);
  v8 = v6;
  if (!v6)
  {
    sub_2449C4D94();
    swift_allocError();
    *v9 = 0;
    v9[1] = 0;
    swift_willThrow();
    return sub_244962528(v4, v5);
  }
  result = sub_244962528(v4, v5);
  *a2 = v8;
  return result;
}

ValueMetadata *type metadata accessor for SecurityScopedURLWrapper()
{
  return &type metadata for SecurityScopedURLWrapper;
}

ValueMetadata *type metadata accessor for SecurityScopedURLWrapper.UnarchiveFailedError()
{
  return &type metadata for SecurityScopedURLWrapper.UnarchiveFailedError;
}

unint64_t sub_2449C5124()
{
  unint64_t result;

  result = qword_2573A3048;
  if (!qword_2573A3048)
  {
    result = MEMORY[0x24951C158](&unk_2449E0D40, &type metadata for SecurityScopedURLWrapper.UnarchiveFailedError);
    atomic_store(result, (unint64_t *)&qword_2573A3048);
  }
  return result;
}

unint64_t sub_2449C516C()
{
  unint64_t result;

  result = qword_2573A3050;
  if (!qword_2573A3050)
  {
    result = MEMORY[0x24951C158](&unk_2449E0D18, &type metadata for SecurityScopedURLWrapper.UnarchiveFailedError);
    atomic_store(result, (unint64_t *)&qword_2573A3050);
  }
  return result;
}

unint64_t sub_2449C51B0()
{
  unint64_t result;

  result = qword_2573A3058;
  if (!qword_2573A3058)
  {
    result = MEMORY[0x24951C158](&unk_2449E0D88, &type metadata for SecurityScopedURLWrapper.UnarchiveFailedError);
    atomic_store(result, (unint64_t *)&qword_2573A3058);
  }
  return result;
}

uint64_t sub_2449C51F4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5278()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C52E0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5364()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C53CC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5448()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C54B0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5560()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C55E0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5648()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C56B0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5744()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C57C8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5830()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C58D8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C5940(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C5998()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5A30()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5A98()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5B2C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5B98()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5C28()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5CBC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5D30()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5DB0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5E18()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5E74()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C5F08(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C5F60()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C5FE8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C604C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C60D8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6140()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C61D0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6238()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C62BC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6330()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C63C0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6428()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C64D8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6540()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C65D0(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C6624()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C66B8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6740()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C67C0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6828()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C68B4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C691C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C69A0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6A2C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C6AB0(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C6B08()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6B90()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6C28()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6CA4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C6D0C(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C6D64()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6E24()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6EB0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6F48()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C6FD8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7060()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C70D8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C715C(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C71B0()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7260()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C72E8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7378()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C7408(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C745C()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C74E4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7598()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7604()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C766C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C76D4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C773C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C77A4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C781C(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C7870()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C78FC(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C7950()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C7A18(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C7A70()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7AE4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7B4C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7BD0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7C38()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C7C9C(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C7CF0()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C7D68(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C7DBC()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7E48()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C7EB0(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C7F0C()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C7F78()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8018()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8094()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8110()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C81A0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C824C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C82D4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C8348(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C839C()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C8424(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C847C()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C84F8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C856C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C85E4(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C863C()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C86D4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8784()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8808()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8898()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C8924(char a1)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C8978()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8A14()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8A7C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8AFC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8B60()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C8BE0(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C8C34()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8CBC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8D24()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8D88()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8E18()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8EA4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8F2C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8F94()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C8FF8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C905C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C90C0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C9148(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C9198()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9210()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9290()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C92F4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C9354(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C93A8()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C9420(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C9474()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9534()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C95B8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C962C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C96B8(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C9708()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9790()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9814()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9890()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9918()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C997C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C99E0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9A8C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C9B00(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C9B54()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9BEC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9C5C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9D08()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449C9D88(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449C9DDC()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9ED4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9F44()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449C9FF4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CA058(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CA0A8()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA134()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA198()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA208()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA26C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA2FC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA388()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA408()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA484()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CA4E8(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CA538()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CA600(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CA650()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA71C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA7A8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CA830()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CA894(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CA8E4()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CA980(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CA9D0()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CAA5C(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CAAB0()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CAB48(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CAB98()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CAC48(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CACA0()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CAD0C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CAD70()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CADF8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CAE5C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CAEE4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CAF48()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CAFD4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB058()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CB0BC(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CB110()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB198()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB224()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB284()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB2E8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB34C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB3F0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB454()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB4D4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB564()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB610()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB6A4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB724()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB7B0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB814()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB88C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB904()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB97C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CB9E0()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CBA60(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CBAB0()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CBB88()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CBC08(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CBC58()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CBCE0(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CBD30()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CBDC4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CBE48()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CBEB8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CBF44()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CBFEC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CC088()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CC114()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void sub_2449CC1A8(uint64_t a1, char a2)
{
  sub_2449CFD48();
  __asm { BR              X10 }
}

uint64_t sub_2449CC1FC()
{
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CC278()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CC2F8()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CC36C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CC3E4()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CC448()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

uint64_t sub_2449CC4AC()
{
  sub_2449CFD48();
  sub_2449CF88C();
  swift_bridgeObjectRelease();
  return sub_2449CFD84();
}

void static MessageStreamInstanceIdentifier.previewRemoteEvents.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x80000002449E5050;
}

uint64_t sub_2449CC524(char *a1, char *a2)
{
  return sub_24499F044(*a1, *a2);
}

uint64_t sub_2449CC530()
{
  return sub_2449C8784();
}

uint64_t sub_2449CC538()
{
  sub_2449CF88C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2449CC598()
{
  return sub_2449CB6A4();
}

uint64_t sub_2449CC5A0@<X0>(char *a1@<X8>)
{
  return sub_24493C2EC(a1);
}

void sub_2449CC5AC(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD00000000000001DLL;
  else
    v2 = 0xD000000000000011;
  v3 = 0x80000002449E2E60;
  if (*v1)
    v3 = 0x80000002449E2E80;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2449CC5F0()
{
  sub_2449CEE2C();
  return sub_2449CF670();
}

uint64_t sub_2449CC638()
{
  sub_2449CEE2C();
  return sub_2449CF67C();
}

uint64_t sub_2449CC69C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7065526873617263;
  else
    return 0x696D697263736964;
}

uint64_t sub_2449CC6E4(char *a1, char *a2)
{
  return sub_24499EF94(*a1, *a2);
}

uint64_t sub_2449CC6F0()
{
  return sub_2449C8808();
}

uint64_t sub_2449CC6F8()
{
  return sub_2449232C8();
}

uint64_t sub_2449CC700()
{
  return sub_2449CB724();
}

uint64_t sub_2449CC708@<X0>(char *a1@<X8>)
{
  return sub_24493C2EC(a1);
}

uint64_t sub_2449CC714@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449CC69C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449CC73C()
{
  char *v0;

  return sub_2449CC69C(*v0);
}

uint64_t RemoteEventRequestPayload.propertyListValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  uint64_t result;
  _BYTE v13[16];
  uint64_t v14;
  char v15[24];
  ValueMetadata *v16;
  unint64_t v17;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A3060);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_2449CF238();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for RemoteEventRequestPayload(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = v0;
  v11 = sub_2449CCA08();
  sub_2449CCA4C();
  sub_2449CF3E8();
  sub_24493DCE8(v0, (uint64_t)v10, type metadata accessor for RemoteEventRequestPayload);
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
  if ((_DWORD)result != 1)
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v10, v4);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v3, v7, v4);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    v16 = &type metadata for RemoteEventRequestPayload.Key;
    v17 = v11;
    v15[0] = 1;
    sub_2449CCA90();
    sub_2449CF370();
    sub_2449CCAD8((uint64_t)v3);
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  return result;
}

uint64_t type metadata accessor for RemoteEventRequestPayload(uint64_t a1)
{
  return sub_24492813C(a1, (uint64_t *)&unk_2573A3118);
}

uint64_t sub_2449CC93C(_BYTE *a1, BOOL *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t result;
  int v12;
  uint64_t v13;

  v6 = type metadata accessor for RemoteEventRequestPayload(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_24493DCE8(a3, (uint64_t)v8, v9);
  v10 = sub_2449CF238();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v8, 1, v10);
  v12 = result;
  if ((_DWORD)result != 1)
    result = sub_2449299E4((uint64_t)v8, type metadata accessor for RemoteEventRequestPayload);
  *a2 = v12 != 1;
  return result;
}

uint64_t sub_2449CCA00(_BYTE *a1, BOOL *a2)
{
  uint64_t v2;

  return sub_2449CC93C(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_2449CCA08()
{
  unint64_t result;

  result = qword_2573A3068;
  if (!qword_2573A3068)
  {
    result = MEMORY[0x24951C158](&unk_2449E15D8, &type metadata for RemoteEventRequestPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A3068);
  }
  return result;
}

unint64_t sub_2449CCA4C()
{
  unint64_t result;

  result = qword_2573A3070;
  if (!qword_2573A3070)
  {
    result = MEMORY[0x24951C158](&unk_2449E1598, &type metadata for RemoteEventRequestPayload.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A3070);
  }
  return result;
}

unint64_t sub_2449CCA90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573A01A0;
  if (!qword_2573A01A0)
  {
    v1 = sub_2449CF238();
    result = MEMORY[0x24951C158](&protocol conformance descriptor for CrashReport, v1);
    atomic_store(result, (unint64_t *)&qword_2573A01A0);
  }
  return result;
}

uint64_t sub_2449CCAD8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A3060);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t RemoteEventRequestPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];
  ValueMetadata *v16;
  unint64_t v17;
  char v18;

  v5 = type metadata accessor for RemoteEventRequestPayload(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = &type metadata for RemoteEventRequestPayload.Key;
  v8 = sub_2449CCA08();
  v17 = v8;
  v15[0] = 0;
  sub_2449CCA4C();
  sub_2449CF37C();
  if (v2)
  {
    v9 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    if ((v18 & 1) != 0)
    {
      v16 = &type metadata for RemoteEventRequestPayload.Key;
      v17 = v8;
      v15[0] = 1;
      v11 = sub_2449CF238();
      sub_2449CCA90();
      sub_2449CF37C();
      v12 = sub_2449CF400();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 0, 1, v11);
      return sub_24493DD84((uint64_t)v7, a2, type metadata accessor for RemoteEventRequestPayload);
    }
    else
    {
      v13 = sub_2449CF400();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
      v14 = sub_2449CF238();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a2, 1, 1, v14);
    }
  }
}

uint64_t sub_2449CCCE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return RemoteEventRequestPayload.init(propertyListValue:)(a1, a2);
}

BOOL static RemoteEventPayload.DiagnosticsBehavior.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t RemoteEventPayload.DiagnosticsBehavior.hash(into:)()
{
  return sub_2449CFD54();
}

uint64_t RemoteEventPayload.DiagnosticsBehavior.hashValue.getter()
{
  sub_2449CFD48();
  sub_2449CFD54();
  return sub_2449CFD84();
}

uint64_t sub_2449CCD6C()
{
  sub_2449CD92C();
  sub_2449CD970();
  return sub_2449CF3E8();
}

uint64_t RemoteEventPayload.DiagnosticsBehavior.propertyListValue.getter()
{
  sub_2449CD92C();
  sub_2449CD970();
  return sub_2449CF3E8();
}

uint64_t sub_2449CCE30@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2449CDDB8(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t RemoteEventPayload.DiagnosticsBehavior.init(propertyListValue:)(uint64_t a1)
{
  return sub_2449CDDB8(a1);
}

uint64_t sub_2449CCE6C(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000017;
  else
    return 0x617243746E656761;
}

uint64_t sub_2449CCEB0(char *a1, char *a2)
{
  return sub_2449A061C(*a1, *a2);
}

uint64_t sub_2449CCEBC()
{
  return sub_2449C8898();
}

uint64_t sub_2449CCEC4()
{
  return sub_244923DB8();
}

uint64_t sub_2449CCECC()
{
  return sub_2449CA7A8();
}

uint64_t sub_2449CCED4@<X0>(char *a1@<X8>)
{
  return sub_24493C2EC(a1);
}

uint64_t sub_2449CCEE0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449CCE6C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449CCF08()
{
  sub_2449CEEB4();
  return sub_2449CF670();
}

uint64_t sub_2449CCF50()
{
  sub_2449CEEB4();
  return sub_2449CF67C();
}

uint64_t sub_2449CCFB4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2449CCFEC + 4 * byte_2449E0F17[a1]))(0xD000000000000011, 0x80000002449E2EE0);
}

uint64_t sub_2449CCFEC()
{
  return 0x696D697263736964;
}

uint64_t sub_2449CD00C()
{
  return 0x7065526873617263;
}

uint64_t sub_2449CD02C()
{
  return 6580592;
}

uint64_t sub_2449CD03C()
{
  return 0x686542746E656761;
}

void sub_2449CD060(char *a1)
{
  sub_2449A03E4(*a1);
}

void sub_2449CD06C()
{
  char *v0;

  sub_2449C8924(*v0);
}

void sub_2449CD074(uint64_t a1)
{
  char *v1;

  sub_244923CAC(a1, *v1);
}

void sub_2449CD07C(uint64_t a1)
{
  char *v1;

  sub_2449CA894(a1, *v1);
}

uint64_t sub_2449CD084@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449CEEF8();
  *a1 = result;
  return result;
}

uint64_t sub_2449CD0B0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449CCFB4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449CD0D8()
{
  unsigned __int8 *v0;

  return sub_2449CCFB4(*v0);
}

uint64_t RemoteEventPayload.propertyListValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  int v12;
  _BYTE v14[16];
  uint64_t v15;
  int v16;
  char v17;
  _BYTE v18[24];
  ValueMetadata *v19;
  unint64_t v20;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573A3060);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_2449CF238();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for RemoteEventPayload(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v14[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = v0;
  v11 = sub_2449CDE88();
  sub_2449CDECC();
  sub_2449CF3E8();
  sub_24493DCE8(v0, (uint64_t)v10, type metadata accessor for RemoteEventPayload);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v10, v4);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v3, v7, v4);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    v19 = &type metadata for RemoteEventPayload.Key;
    v20 = v11;
    v18[0] = 1;
    sub_2449CCA90();
    sub_2449CF370();
    sub_2449CCAD8((uint64_t)v3);
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    v12 = v10[4];
    v16 = *(_DWORD *)v10;
    v17 = 0;
    v19 = &type metadata for RemoteEventPayload.Key;
    v20 = v11;
    v18[0] = 2;
    sub_2449CF370();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    LOBYTE(v16) = v12;
    v19 = &type metadata for RemoteEventPayload.Key;
    v20 = v11;
    v18[0] = 3;
    sub_2449CDF10();
    sub_2449CF370();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    LOBYTE(v16) = v12 == 0;
    v19 = &type metadata for RemoteEventPayload.Key;
    v20 = v11;
    v18[0] = 4;
    sub_2449CF370();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

uint64_t sub_2449CD378(_BYTE *a1, BOOL *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t result;
  int v11;
  uint64_t v12;

  v6 = type metadata accessor for RemoteEventPayload(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_24493DCE8(a3, (uint64_t)v8, v9);
  result = swift_getEnumCaseMultiPayload();
  v11 = result;
  if ((_DWORD)result == 1)
    result = sub_2449299E4((uint64_t)v8, type metadata accessor for RemoteEventPayload);
  *a2 = v11 == 1;
  return result;
}

uint64_t RemoteEventPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE v18[4];
  int v19;
  _BYTE v20[24];
  ValueMetadata *v21;
  unint64_t v22;

  v5 = type metadata accessor for RemoteEventPayload(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-v9];
  v21 = &type metadata for RemoteEventPayload.Key;
  v11 = sub_2449CDE88();
  v22 = v11;
  v20[0] = 0;
  sub_2449CDECC();
  sub_2449CF37C();
  if (v2)
  {
    v12 = sub_2449CF400();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    if ((v19 & 1) != 0)
    {
      v21 = &type metadata for RemoteEventPayload.Key;
      v22 = v11;
      v20[0] = 1;
      sub_2449CF238();
      sub_2449CCA90();
      sub_2449CF37C();
      v14 = sub_2449CF400();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      swift_storeEnumTagMultiPayload();
      v15 = (uint64_t)v8;
    }
    else
    {
      v21 = &type metadata for RemoteEventPayload.Key;
      v22 = v11;
      v20[0] = 3;
      sub_2449CDF10();
      sub_2449CF3B8();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      v16 = v19;
      if (v19 == 3)
      {
        v21 = &type metadata for RemoteEventPayload.Key;
        v22 = v11;
        v20[0] = 4;
        sub_2449CF37C();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
        if ((_BYTE)v19)
          v16 = 0;
        else
          v16 = 2;
      }
      v21 = &type metadata for RemoteEventPayload.Key;
      v22 = v11;
      v20[0] = 2;
      sub_2449CF37C();
      v17 = sub_2449CF400();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a1, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      *(_DWORD *)v10 = v19;
      v10[4] = v16;
      swift_storeEnumTagMultiPayload();
      v15 = (uint64_t)v10;
    }
    return sub_24493DD84(v15, a2, type metadata accessor for RemoteEventPayload);
  }
}

uint64_t sub_2449CD6E8(char a1)
{
  return *(_QWORD *)&aWillprovcansym_1[8 * a1];
}

uint64_t sub_2449CD70C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return RemoteEventPayload.init(propertyListValue:)(a1, a2);
}

uint64_t sub_2449CD720(char *a1, char *a2)
{
  return sub_2449A0598(*a1, *a2);
}

uint64_t sub_2449CD72C()
{
  return sub_2449C8A14();
}

uint64_t sub_2449CD734()
{
  return sub_244923D78();
}

uint64_t sub_2449CD73C()
{
  return sub_2449CA830();
}

uint64_t sub_2449CD744@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2449CEF40();
  *a1 = result;
  return result;
}

uint64_t sub_2449CD770@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2449CD6E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2449CD798()
{
  sub_2449CEE70();
  return sub_2449CF670();
}

uint64_t sub_2449CD7E0()
{
  sub_2449CEE70();
  return sub_2449CF67C();
}

uint64_t sub_2449CD844()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CD878()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CD8A8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2449CFC10();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2449CD8F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2449CD9B4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_2449CD920(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *a2 = *(_BYTE *)(v2 + 16);
}

unint64_t sub_2449CD92C()
{
  unint64_t result;

  result = qword_2573A3078;
  if (!qword_2573A3078)
  {
    result = MEMORY[0x24951C158](&unk_2449E1570, &type metadata for RemoteEventPayload.DiagnosticsBehavior.Key);
    atomic_store(result, (unint64_t *)&qword_2573A3078);
  }
  return result;
}

unint64_t sub_2449CD970()
{
  unint64_t result;

  result = qword_2573A3080;
  if (!qword_2573A3080)
  {
    result = MEMORY[0x24951C158](&unk_2449E1530, &type metadata for RemoteEventPayload.DiagnosticsBehavior.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A3080);
  }
  return result;
}

uint64_t sub_2449CD9B4()
{
  return 0x696D697263736964;
}

uint64_t sub_2449CD9D4()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CD9E8()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDA00()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDA14()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDA34()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDA54()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDA78()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDA94()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDAA8()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDACC()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDAE8()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDB04()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDB24()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDB3C()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDB4C()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDB70()
{
  return sub_2449CDB7C();
}

uint64_t sub_2449CDB7C()
{
  sub_2449CFD48();
  sub_2449CF88C();
  return sub_2449CFD84();
}

uint64_t sub_2449CDBC8()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDBE4()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDBF4()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDC00()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDC14()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDC30()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDC4C()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDC6C()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDC8C()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDCAC()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDCD0()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDCF4()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDD08()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDD20()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDD38()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDD4C()
{
  return sub_2449CDD70();
}

uint64_t sub_2449CDD70()
{
  sub_2449CFD48();
  sub_2449CF88C();
  return sub_2449CFD84();
}

uint64_t sub_2449CDDB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD v5[5];
  unsigned __int8 v6;

  v5[3] = &type metadata for RemoteEventPayload.DiagnosticsBehavior.Key;
  v5[4] = sub_2449CD92C();
  sub_2449CD970();
  sub_2449CF37C();
  v3 = sub_2449CF400();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v6;
}

uint64_t type metadata accessor for RemoteEventPayload(uint64_t a1)
{
  return sub_24492813C(a1, qword_2573A3198);
}

uint64_t sub_2449CDE80(_BYTE *a1, BOOL *a2)
{
  uint64_t v2;

  return sub_2449CD378(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_2449CDE88()
{
  unint64_t result;

  result = qword_2573A3088;
  if (!qword_2573A3088)
  {
    result = MEMORY[0x24951C158](&unk_2449E1508, &type metadata for RemoteEventPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A3088);
  }
  return result;
}

unint64_t sub_2449CDECC()
{
  unint64_t result;

  result = qword_2573A3090;
  if (!qword_2573A3090)
  {
    result = MEMORY[0x24951C158](&unk_2449E14C8, &type metadata for RemoteEventPayload.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A3090);
  }
  return result;
}

unint64_t sub_2449CDF10()
{
  unint64_t result;

  result = qword_2573A3098;
  if (!qword_2573A3098)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RemoteEventPayload.DiagnosticsBehavior, &type metadata for RemoteEventPayload.DiagnosticsBehavior);
    atomic_store(result, (unint64_t *)&qword_2573A3098);
  }
  return result;
}

unint64_t sub_2449CDF58()
{
  unint64_t result;

  result = qword_2573A30A0;
  if (!qword_2573A30A0)
  {
    result = MEMORY[0x24951C158](&protocol conformance descriptor for RemoteEventPayload.DiagnosticsBehavior, &type metadata for RemoteEventPayload.DiagnosticsBehavior);
    atomic_store(result, (unint64_t *)&qword_2573A30A0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RemoteEventRequestPayload(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
    v7 = sub_2449CF238();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for RemoteEventRequestPayload(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_2449CF238();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *initializeWithCopy for RemoteEventRequestPayload(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2449CF238();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for RemoteEventRequestPayload(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_2449CF238();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for RemoteEventRequestPayload(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2449CF238();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for RemoteEventRequestPayload(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_2449CF238();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteEventRequestPayload()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449CE400(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = sub_2449CF238();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RemoteEventRequestPayload()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2449CE458(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = sub_2449CF238();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_2449CE4A8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2449CF238();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_2449CE4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2449CF238();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_2449CE520()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2449CF238();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RemoteEventPayload(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_2449CF238();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for RemoteEventPayload(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v3 = sub_2449CF238();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for RemoteEventPayload(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_2449CF238();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for RemoteEventPayload(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2449299E4((uint64_t)a1, type metadata accessor for RemoteEventPayload);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_2449CF238();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for RemoteEventPayload(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_2449CF238();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for RemoteEventPayload(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2449299E4((uint64_t)a1, type metadata accessor for RemoteEventPayload);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_2449CF238();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2449CE8D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2449CF238();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.DiagnosticsBehavior()
{
  return &type metadata for RemoteEventPayload.DiagnosticsBehavior;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.Discriminant()
{
  return &type metadata for RemoteEventPayload.Discriminant;
}

uint64_t storeEnumTagSinglePayload for RemoteEventPayload.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449CE9B8 + 4 * byte_2449E0F21[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2449CE9EC + 4 * byte_2449E0F1C[v4]))();
}

uint64_t sub_2449CE9EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449CE9F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449CE9FCLL);
  return result;
}

uint64_t sub_2449CEA08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449CEA10);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2449CEA14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449CEA1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.Key()
{
  return &type metadata for RemoteEventPayload.Key;
}

uint64_t _s19PreviewsMessagingOS18RemoteEventPayloadO19DiagnosticsBehaviorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449CEA84 + 4 * byte_2449E0F2B[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2449CEAB8 + 4 * byte_2449E0F26[v4]))();
}

uint64_t sub_2449CEAB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449CEAC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449CEAC8);
  return result;
}

uint64_t sub_2449CEAD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449CEADCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2449CEAE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449CEAE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.DiagnosticsBehavior.Discriminant()
{
  return &type metadata for RemoteEventPayload.DiagnosticsBehavior.Discriminant;
}

uint64_t storeEnumTagSinglePayload for RemoteEventPayload.DiagnosticsBehavior.Key(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2449CEB44 + 4 * byte_2449E0F30[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2449CEB64 + 4 * byte_2449E0F35[v4]))();
}

_BYTE *sub_2449CEB44(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2449CEB64(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449CEB6C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449CEB74(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2449CEB7C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2449CEB84(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.DiagnosticsBehavior.Key()
{
  return &type metadata for RemoteEventPayload.DiagnosticsBehavior.Key;
}

ValueMetadata *type metadata accessor for RemoteEventRequestPayload.Discriminant()
{
  return &type metadata for RemoteEventRequestPayload.Discriminant;
}

uint64_t _s19PreviewsMessagingOS18RemoteEventPayloadO12DiscriminantOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2449CEBFC + 4 * byte_2449E0F3F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2449CEC30 + 4 * byte_2449E0F3A[v4]))();
}

uint64_t sub_2449CEC30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449CEC38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2449CEC40);
  return result;
}

uint64_t sub_2449CEC4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2449CEC54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2449CEC58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2449CEC60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteEventRequestPayload.Key()
{
  return &type metadata for RemoteEventRequestPayload.Key;
}

unint64_t sub_2449CEC80()
{
  unint64_t result;

  result = qword_2573A31D0;
  if (!qword_2573A31D0)
  {
    result = MEMORY[0x24951C158](&unk_2449E1180, &type metadata for RemoteEventRequestPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A31D0);
  }
  return result;
}

unint64_t sub_2449CECC8()
{
  unint64_t result;

  result = qword_2573A31D8;
  if (!qword_2573A31D8)
  {
    result = MEMORY[0x24951C158](&unk_2449E1220, &type metadata for RemoteEventRequestPayload.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A31D8);
  }
  return result;
}

unint64_t sub_2449CED10()
{
  unint64_t result;

  result = qword_2573A31E0;
  if (!qword_2573A31E0)
  {
    result = MEMORY[0x24951C158](&unk_2449E12C0, &type metadata for RemoteEventPayload.DiagnosticsBehavior.Key);
    atomic_store(result, (unint64_t *)&qword_2573A31E0);
  }
  return result;
}

unint64_t sub_2449CED58()
{
  unint64_t result;

  result = qword_2573A31E8;
  if (!qword_2573A31E8)
  {
    result = MEMORY[0x24951C158](&unk_2449E1360, &type metadata for RemoteEventPayload.DiagnosticsBehavior.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A31E8);
  }
  return result;
}

unint64_t sub_2449CEDA0()
{
  unint64_t result;

  result = qword_2573A31F0;
  if (!qword_2573A31F0)
  {
    result = MEMORY[0x24951C158](&unk_2449E1400, &type metadata for RemoteEventPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2573A31F0);
  }
  return result;
}

unint64_t sub_2449CEDE8()
{
  unint64_t result;

  result = qword_2573A31F8;
  if (!qword_2573A31F8)
  {
    result = MEMORY[0x24951C158](&unk_2449E14A0, &type metadata for RemoteEventPayload.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A31F8);
  }
  return result;
}

unint64_t sub_2449CEE2C()
{
  unint64_t result;

  result = qword_2573A3200;
  if (!qword_2573A3200)
  {
    result = MEMORY[0x24951C158](&unk_2449E11A8, &type metadata for RemoteEventRequestPayload.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A3200);
  }
  return result;
}

unint64_t sub_2449CEE70()
{
  unint64_t result;

  result = qword_2573A3208;
  if (!qword_2573A3208)
  {
    result = MEMORY[0x24951C158](&unk_2449E12E8, &type metadata for RemoteEventPayload.DiagnosticsBehavior.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A3208);
  }
  return result;
}

unint64_t sub_2449CEEB4()
{
  unint64_t result;

  result = qword_2573A3210;
  if (!qword_2573A3210)
  {
    result = MEMORY[0x24951C158](&unk_2449E1428, &type metadata for RemoteEventPayload.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2573A3210);
  }
  return result;
}

uint64_t sub_2449CEEF8()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_2449CEF40()
{
  unint64_t v0;

  v0 = sub_2449CFC10();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_2449CEF8C()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_2449CEF98()
{
  return MEMORY[0x24BDCB728]();
}

uint64_t sub_2449CEFA4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2449CEFB0()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2449CEFBC()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2449CEFC8()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2449CEFD4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2449CEFE0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2449CEFEC()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2449CEFF8()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2449CF004()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_2449CF010()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2449CF01C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2449CF028()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_2449CF034()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2449CF040()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2449CF04C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2449CF058()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2449CF064()
{
  return MEMORY[0x24BE76198]();
}

uint64_t sub_2449CF070()
{
  return MEMORY[0x24BE761A0]();
}

uint64_t sub_2449CF07C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2449CF088()
{
  return MEMORY[0x24BE785E8]();
}

uint64_t sub_2449CF094()
{
  return MEMORY[0x24BE785F0]();
}

uint64_t sub_2449CF0A0()
{
  return MEMORY[0x24BE785F8]();
}

uint64_t sub_2449CF0AC()
{
  return MEMORY[0x24BE78600]();
}

uint64_t sub_2449CF0B8()
{
  return MEMORY[0x24BE78608]();
}

uint64_t sub_2449CF0C4()
{
  return MEMORY[0x24BE78610]();
}

uint64_t sub_2449CF0D0()
{
  return MEMORY[0x24BE761F0]();
}

uint64_t sub_2449CF0DC()
{
  return MEMORY[0x24BE761F8]();
}

uint64_t sub_2449CF0E8()
{
  return MEMORY[0x24BE76228]();
}

uint64_t sub_2449CF0F4()
{
  return MEMORY[0x24BE76240]();
}

uint64_t sub_2449CF100()
{
  return MEMORY[0x24BE76248]();
}

uint64_t sub_2449CF10C()
{
  return MEMORY[0x24BE76250]();
}

uint64_t sub_2449CF118()
{
  return MEMORY[0x24BE76258]();
}

uint64_t sub_2449CF124()
{
  return MEMORY[0x24BE76268]();
}

uint64_t sub_2449CF130()
{
  return MEMORY[0x24BE76270]();
}

uint64_t sub_2449CF13C()
{
  return MEMORY[0x24BE76278]();
}

uint64_t sub_2449CF148()
{
  return MEMORY[0x24BE76280]();
}

uint64_t sub_2449CF154()
{
  return MEMORY[0x24BE76288]();
}

uint64_t sub_2449CF160()
{
  return MEMORY[0x24BE76290]();
}

uint64_t sub_2449CF16C()
{
  return MEMORY[0x24BE76298]();
}

uint64_t sub_2449CF178()
{
  return MEMORY[0x24BE762A0]();
}

uint64_t sub_2449CF184()
{
  return MEMORY[0x24BE762A8]();
}

uint64_t sub_2449CF190()
{
  return MEMORY[0x24BE762B0]();
}

uint64_t sub_2449CF19C()
{
  return MEMORY[0x24BE762B8]();
}

uint64_t sub_2449CF1A8()
{
  return MEMORY[0x24BE762C0]();
}

uint64_t sub_2449CF1B4()
{
  return MEMORY[0x24BE762C8]();
}

uint64_t sub_2449CF1C0()
{
  return MEMORY[0x24BE762D0]();
}

uint64_t sub_2449CF1CC()
{
  return MEMORY[0x24BE762E8]();
}

uint64_t sub_2449CF1D8()
{
  return MEMORY[0x24BE762F0]();
}

uint64_t sub_2449CF1E4()
{
  return MEMORY[0x24BE762F8]();
}

uint64_t sub_2449CF1F0()
{
  return MEMORY[0x24BE76300]();
}

uint64_t sub_2449CF1FC()
{
  return MEMORY[0x24BE76308]();
}

uint64_t sub_2449CF208()
{
  return MEMORY[0x24BE76310]();
}

uint64_t sub_2449CF214()
{
  return MEMORY[0x24BE76328]();
}

uint64_t sub_2449CF220()
{
  return MEMORY[0x24BE76330]();
}

uint64_t sub_2449CF22C()
{
  return MEMORY[0x24BE76338]();
}

uint64_t sub_2449CF238()
{
  return MEMORY[0x24BE76340]();
}

uint64_t sub_2449CF244()
{
  return MEMORY[0x24BE763B0]();
}

uint64_t sub_2449CF250()
{
  return MEMORY[0x24BE763B8]();
}

uint64_t sub_2449CF25C()
{
  return MEMORY[0x24BE763C8]();
}

uint64_t sub_2449CF268()
{
  return MEMORY[0x24BE763D0]();
}

uint64_t sub_2449CF274()
{
  return MEMORY[0x24BE763D8]();
}

uint64_t sub_2449CF280()
{
  return MEMORY[0x24BE763E0]();
}

uint64_t sub_2449CF28C()
{
  return MEMORY[0x24BE763F0]();
}

uint64_t sub_2449CF298()
{
  return MEMORY[0x24BE763F8]();
}

uint64_t sub_2449CF2A4()
{
  return MEMORY[0x24BE76400]();
}

uint64_t sub_2449CF2B0()
{
  return MEMORY[0x24BE76408]();
}

uint64_t sub_2449CF2BC()
{
  return MEMORY[0x24BE76410]();
}

uint64_t sub_2449CF2C8()
{
  return MEMORY[0x24BE76418]();
}

uint64_t sub_2449CF2D4()
{
  return MEMORY[0x24BE76420]();
}

uint64_t sub_2449CF2E0()
{
  return MEMORY[0x24BE76430]();
}

uint64_t sub_2449CF2EC()
{
  return MEMORY[0x24BE76438]();
}

uint64_t sub_2449CF2F8()
{
  return MEMORY[0x24BE76440]();
}

uint64_t sub_2449CF304()
{
  return MEMORY[0x24BE76448]();
}

uint64_t sub_2449CF310()
{
  return MEMORY[0x24BE76450]();
}

uint64_t sub_2449CF31C()
{
  return MEMORY[0x24BE76460]();
}

uint64_t sub_2449CF328()
{
  return MEMORY[0x24BE76468]();
}

uint64_t sub_2449CF334()
{
  return MEMORY[0x24BE76470]();
}

uint64_t sub_2449CF340()
{
  return MEMORY[0x24BE76478]();
}

uint64_t sub_2449CF34C()
{
  return MEMORY[0x24BE76480]();
}

uint64_t sub_2449CF358()
{
  return MEMORY[0x24BE764A0]();
}

uint64_t sub_2449CF364()
{
  return MEMORY[0x24BE764B0]();
}

uint64_t sub_2449CF370()
{
  return MEMORY[0x24BE764C0]();
}

uint64_t sub_2449CF37C()
{
  return MEMORY[0x24BE764C8]();
}

uint64_t sub_2449CF388()
{
  return MEMORY[0x24BE764D0]();
}

uint64_t sub_2449CF394()
{
  return MEMORY[0x24BE764D8]();
}

uint64_t sub_2449CF3A0()
{
  return MEMORY[0x24BE764E0]();
}

uint64_t sub_2449CF3AC()
{
  return MEMORY[0x24BE764E8]();
}

uint64_t sub_2449CF3B8()
{
  return MEMORY[0x24BE764F0]();
}

uint64_t _s19PreviewsMessagingOS24CanvasControlDescriptionV9ModifiersV17propertyListValue0a10FoundationC008PropertyI0Vvg_0()
{
  return MEMORY[0x24BE764F8]();
}

uint64_t sub_2449CF3D0()
{
  return MEMORY[0x24BE76500]();
}

uint64_t sub_2449CF3DC()
{
  return MEMORY[0x24BE76508]();
}

uint64_t sub_2449CF3E8()
{
  return MEMORY[0x24BE76510]();
}

uint64_t sub_2449CF3F4()
{
  return MEMORY[0x24BE76528]();
}

uint64_t sub_2449CF400()
{
  return MEMORY[0x24BE76530]();
}

uint64_t sub_2449CF40C()
{
  return MEMORY[0x24BE765C0]();
}

uint64_t sub_2449CF418()
{
  return MEMORY[0x24BE765C8]();
}

uint64_t sub_2449CF424()
{
  return MEMORY[0x24BE765E0]();
}

uint64_t sub_2449CF430()
{
  return MEMORY[0x24BE765E8]();
}

uint64_t sub_2449CF43C()
{
  return MEMORY[0x24BE765F8]();
}

uint64_t sub_2449CF448()
{
  return MEMORY[0x24BE76600]();
}

uint64_t sub_2449CF454()
{
  return MEMORY[0x24BE76608]();
}

uint64_t sub_2449CF460()
{
  return MEMORY[0x24BE76610]();
}

uint64_t sub_2449CF46C()
{
  return MEMORY[0x24BE76618]();
}

uint64_t sub_2449CF478()
{
  return MEMORY[0x24BE76628]();
}

uint64_t sub_2449CF484()
{
  return MEMORY[0x24BE76648]();
}

uint64_t sub_2449CF490()
{
  return MEMORY[0x24BE76650]();
}

uint64_t sub_2449CF49C()
{
  return MEMORY[0x24BE76660]();
}

uint64_t sub_2449CF4A8()
{
  return MEMORY[0x24BE76668]();
}

uint64_t sub_2449CF4B4()
{
  return MEMORY[0x24BE76670]();
}

uint64_t sub_2449CF4C0()
{
  return MEMORY[0x24BE76680]();
}

uint64_t sub_2449CF4CC()
{
  return MEMORY[0x24BE76708]();
}

uint64_t sub_2449CF4D8()
{
  return MEMORY[0x24BE76710]();
}

uint64_t sub_2449CF4E4()
{
  return MEMORY[0x24BE76728]();
}

uint64_t sub_2449CF4F0()
{
  return MEMORY[0x24BE76748]();
}

uint64_t sub_2449CF4FC()
{
  return MEMORY[0x24BE76750]();
}

uint64_t sub_2449CF508()
{
  return MEMORY[0x24BE76758]();
}

uint64_t sub_2449CF514()
{
  return MEMORY[0x24BE76760]();
}

uint64_t sub_2449CF520()
{
  return MEMORY[0x24BE76768]();
}

uint64_t sub_2449CF52C()
{
  return MEMORY[0x24BE76778]();
}

uint64_t sub_2449CF538()
{
  return MEMORY[0x24BE76780]();
}

uint64_t sub_2449CF544()
{
  return MEMORY[0x24BE76788]();
}

uint64_t sub_2449CF550()
{
  return MEMORY[0x24BE76790]();
}

uint64_t sub_2449CF55C()
{
  return MEMORY[0x24BE76798]();
}

uint64_t sub_2449CF568()
{
  return MEMORY[0x24BE767A0]();
}

uint64_t sub_2449CF574()
{
  return MEMORY[0x24BE767A8]();
}

uint64_t sub_2449CF580()
{
  return MEMORY[0x24BE767B0]();
}

uint64_t sub_2449CF58C()
{
  return MEMORY[0x24BE767B8]();
}

uint64_t sub_2449CF598()
{
  return MEMORY[0x24BE767F0]();
}

uint64_t sub_2449CF5A4()
{
  return MEMORY[0x24BE767F8]();
}

uint64_t sub_2449CF5B0()
{
  return MEMORY[0x24BE76810]();
}

uint64_t sub_2449CF5BC()
{
  return MEMORY[0x24BE76818]();
}

uint64_t sub_2449CF5C8()
{
  return MEMORY[0x24BE76820]();
}

uint64_t sub_2449CF5D4()
{
  return MEMORY[0x24BE76828]();
}

uint64_t sub_2449CF5E0()
{
  return MEMORY[0x24BE76830]();
}

uint64_t sub_2449CF5EC()
{
  return MEMORY[0x24BE76838]();
}

uint64_t sub_2449CF5F8()
{
  return MEMORY[0x24BE76840]();
}

uint64_t sub_2449CF604()
{
  return MEMORY[0x24BE76848]();
}

uint64_t sub_2449CF610()
{
  return MEMORY[0x24BE768A0]();
}

uint64_t sub_2449CF61C()
{
  return MEMORY[0x24BE768A8]();
}

uint64_t sub_2449CF628()
{
  return MEMORY[0x24BE768B0]();
}

uint64_t sub_2449CF634()
{
  return MEMORY[0x24BE768D0]();
}

uint64_t sub_2449CF640()
{
  return MEMORY[0x24BE76910]();
}

uint64_t sub_2449CF64C()
{
  return MEMORY[0x24BE76928]();
}

uint64_t sub_2449CF658()
{
  return MEMORY[0x24BE769A8]();
}

uint64_t sub_2449CF664()
{
  return MEMORY[0x24BE769B0]();
}

uint64_t sub_2449CF670()
{
  return MEMORY[0x24BE769C8]();
}

uint64_t sub_2449CF67C()
{
  return MEMORY[0x24BE769D0]();
}

uint64_t sub_2449CF688()
{
  return MEMORY[0x24BE76A00]();
}

uint64_t sub_2449CF694()
{
  return MEMORY[0x24BE76A08]();
}

uint64_t sub_2449CF6A0()
{
  return MEMORY[0x24BE76A18]();
}

uint64_t sub_2449CF6AC()
{
  return MEMORY[0x24BE76A28]();
}

uint64_t sub_2449CF6B8()
{
  return MEMORY[0x24BE76A30]();
}

uint64_t sub_2449CF6C4()
{
  return MEMORY[0x24BE76A50]();
}

uint64_t sub_2449CF6D0()
{
  return MEMORY[0x24BE76A60]();
}

uint64_t sub_2449CF6DC()
{
  return MEMORY[0x24BE76A88]();
}

uint64_t sub_2449CF6E8()
{
  return MEMORY[0x24BE76AE8]();
}

uint64_t sub_2449CF6F4()
{
  return MEMORY[0x24BE76B48]();
}

uint64_t sub_2449CF700()
{
  return MEMORY[0x24BE76B80]();
}

uint64_t sub_2449CF70C()
{
  return MEMORY[0x24BE76B98]();
}

uint64_t sub_2449CF718()
{
  return MEMORY[0x24BE76BC0]();
}

uint64_t sub_2449CF724()
{
  return MEMORY[0x24BE76C40]();
}

uint64_t sub_2449CF730()
{
  return MEMORY[0x24BE76C50]();
}

uint64_t sub_2449CF73C()
{
  return MEMORY[0x24BE76C70]();
}

uint64_t sub_2449CF748()
{
  return MEMORY[0x24BE76C80]();
}

uint64_t sub_2449CF754()
{
  return MEMORY[0x24BE76C88]();
}

uint64_t sub_2449CF760()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2449CF76C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2449CF778()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2449CF784()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2449CF790()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2449CF79C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2449CF7A8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2449CF7B4()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2449CF7C0()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_2449CF7CC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2449CF7D8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2449CF7E4()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2449CF7F0()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2449CF7FC()
{
  return MEMORY[0x24BEE03D0]();
}

uint64_t sub_2449CF808()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_2449CF814()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_2449CF820()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_2449CF82C()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_2449CF838()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2449CF844()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2449CF850()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2449CF85C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2449CF868()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2449CF874()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2449CF880()
{
  return MEMORY[0x24BE76CC8]();
}

uint64_t sub_2449CF88C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2449CF898()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2449CF8A4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2449CF8B0()
{
  return MEMORY[0x24BEE0E00]();
}

uint64_t sub_2449CF8BC()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_2449CF8C8()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_2449CF8D4()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_2449CF8E0()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_2449CF8EC()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_2449CF8F8()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_2449CF904()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_2449CF910()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_2449CF91C()
{
  return MEMORY[0x24BE76CD8]();
}

uint64_t sub_2449CF928()
{
  return MEMORY[0x24BE76CE0]();
}

uint64_t sub_2449CF934()
{
  return MEMORY[0x24BE76CE8]();
}

uint64_t sub_2449CF940()
{
  return MEMORY[0x24BE76CF0]();
}

uint64_t sub_2449CF94C()
{
  return MEMORY[0x24BE76CF8]();
}

uint64_t sub_2449CF958()
{
  return MEMORY[0x24BE76D00]();
}

uint64_t sub_2449CF964()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2449CF970()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2449CF97C()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_2449CF988()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_2449CF994()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_2449CF9A0()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2449CF9AC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2449CF9B8()
{
  return MEMORY[0x24BE76D28]();
}

uint64_t sub_2449CF9C4()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2449CF9D0()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2449CF9DC()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_2449CF9E8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2449CF9F4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2449CFA00()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_2449CFA0C()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_2449CFA18()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_2449CFA24()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_2449CFA30()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_2449CFA3C()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_2449CFA48()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_2449CFA54()
{
  return MEMORY[0x24BE76D30]();
}

uint64_t sub_2449CFA60()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_2449CFA6C()
{
  return MEMORY[0x24BEE6A78]();
}

uint64_t sub_2449CFA78()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_2449CFA84()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_2449CFA90()
{
  return MEMORY[0x24BE76D68]();
}

uint64_t sub_2449CFA9C()
{
  return MEMORY[0x24BE76D78]();
}

uint64_t sub_2449CFAA8()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_2449CFAB4()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_2449CFAC0()
{
  return MEMORY[0x24BEE6AE8]();
}

uint64_t sub_2449CFACC()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2449CFAD8()
{
  return MEMORY[0x24BE76DD0]();
}

uint64_t sub_2449CFAE4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2449CFAF0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2449CFAFC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2449CFB08()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_2449CFB14()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_2449CFB20()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2449CFB2C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2449CFB38()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2449CFB44()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2449CFB50()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_2449CFB5C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2449CFB68()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2449CFB74()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2449CFB80()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2449CFB8C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2449CFB98()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2449CFBA4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2449CFBB0()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_2449CFBBC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2449CFBC8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2449CFBD4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2449CFBE0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2449CFBEC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2449CFBF8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2449CFC04()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2449CFC10()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2449CFC1C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2449CFC28()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2449CFC34()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2449CFC40()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2449CFC4C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2449CFC58()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2449CFC64()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2449CFC70()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2449CFC7C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2449CFC88()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2449CFC94()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_2449CFCA0()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_2449CFCAC()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_2449CFCB8()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_2449CFCC4()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_2449CFCD0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2449CFCDC()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_2449CFCE8()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_2449CFCF4()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2449CFD00()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2449CFD0C()
{
  return MEMORY[0x24BE76E10]();
}

uint64_t sub_2449CFD18()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2449CFD24()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2449CFD30()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2449CFD3C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2449CFD48()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2449CFD54()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2449CFD60()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2449CFD6C()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2449CFD78()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2449CFD84()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2449CFD90()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_2449CFD9C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2449CFDA8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2449CFDB4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2449CFDC0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2449CFDCC()
{
  return MEMORY[0x24BEE4A98]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
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

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

