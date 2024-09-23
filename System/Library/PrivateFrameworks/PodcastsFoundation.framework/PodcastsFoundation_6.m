uint64_t assignWithCopy for DownloadConsistency.IssueResolution(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_1A9064714(a1, type metadata accessor for DownloadConsistency.Issue);
    type metadata accessor for DownloadConsistency.Issue(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v10 = sub_1A93F73E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A5C88) + 48);
      v12 = a1 + v11;
      v13 = a2 + v11;
      v14 = sub_1A93F726C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      v6 = sub_1A93F73E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEABA190) + 48);
      v8 = (_QWORD *)(a1 + v7);
      v9 = (_QWORD *)(a2 + v7);
      *v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DownloadConsistency.IssueResolution(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  type metadata accessor for DownloadConsistency.Issue(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v8 = sub_1A93F73E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A5C88) + 48);
    v10 = a1 + v9;
    v11 = a2 + v9;
    v12 = sub_1A93F726C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  }
  else
  {
    v6 = sub_1A93F73E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEABA190);
    *(_OWORD *)(a1 + *(int *)(v7 + 48)) = *(_OWORD *)(a2 + *(int *)(v7 + 48));
  }
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DownloadConsistency.IssueResolution(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_1A9064714(a1, type metadata accessor for DownloadConsistency.Issue);
    type metadata accessor for DownloadConsistency.Issue(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v8 = sub_1A93F73E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A5C88) + 48);
      v10 = a1 + v9;
      v11 = a2 + v9;
      v12 = sub_1A93F726C();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    }
    else
    {
      v6 = sub_1A93F73E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEABA190);
      *(_OWORD *)(a1 + *(int *)(v7 + 48)) = *(_OWORD *)(a2 + *(int *)(v7 + 48));
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DownloadConsistency.IssueResolution()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A93D6D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for DownloadConsistency.Issue(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for DownloadConsistency.IssueResolution()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A93D6DE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for DownloadConsistency.Issue(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t storeEnumTagSinglePayload for DownloadConsistency.IssueResolutionError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A93D6E98 + 4 * asc_1A94291D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A93D6EB8 + 4 * byte_1A94291D5[v4]))();
}

_BYTE *sub_1A93D6E98(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A93D6EB8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A93D6EC0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A93D6EC8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A93D6ED0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A93D6ED8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DownloadConsistency.IssueResolutionError()
{
  return &type metadata for DownloadConsistency.IssueResolutionError;
}

uint64_t storeEnumTagSinglePayload for DownloadConsistency.Issue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A93D6F40 + 4 * byte_1A94291DF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A93D6F74 + 4 * byte_1A94291DA[v4]))();
}

uint64_t sub_1A93D6F74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93D6F7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A93D6F84);
  return result;
}

uint64_t sub_1A93D6F90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A93D6F98);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A93D6F9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93D6FA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DownloadConsistency.Issue.CodingKeys()
{
  return &type metadata for DownloadConsistency.Issue.CodingKeys;
}

ValueMetadata *type metadata accessor for DownloadConsistency.Issue.MissingCoreDataEpisodeArtifactCodingKeys()
{
  return &type metadata for DownloadConsistency.Issue.MissingCoreDataEpisodeArtifactCodingKeys;
}

ValueMetadata *type metadata accessor for DownloadConsistency.Issue.MissingMediaLibraryEpisodeArtifactCodingKeys()
{
  return &type metadata for DownloadConsistency.Issue.MissingMediaLibraryEpisodeArtifactCodingKeys;
}

uint64_t _s18PodcastsFoundation19DownloadConsistencyC5IssueO40MissingCoreDataEpisodeArtifactCodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A93D7030 + 4 * byte_1A94291E9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A93D7064 + 4 * byte_1A94291E4[v4]))();
}

uint64_t sub_1A93D7064(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93D706C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A93D7074);
  return result;
}

uint64_t sub_1A93D7080(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A93D7088);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A93D708C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93D7094(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DownloadConsistency.Issue.UnownedAssetCodingKeys()
{
  return &type metadata for DownloadConsistency.Issue.UnownedAssetCodingKeys;
}

unint64_t sub_1A93D70B4()
{
  unint64_t result;

  result = qword_1EEAC0478;
  if (!qword_1EEAC0478)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429598, &type metadata for DownloadConsistency.Issue.UnownedAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC0478);
  }
  return result;
}

unint64_t sub_1A93D70FC()
{
  unint64_t result;

  result = qword_1EEAC0480;
  if (!qword_1EEAC0480)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429650, &type metadata for DownloadConsistency.Issue.MissingMediaLibraryEpisodeArtifactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC0480);
  }
  return result;
}

unint64_t sub_1A93D7144()
{
  unint64_t result;

  result = qword_1EEAC0488;
  if (!qword_1EEAC0488)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429708, &type metadata for DownloadConsistency.Issue.MissingCoreDataEpisodeArtifactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC0488);
  }
  return result;
}

unint64_t sub_1A93D718C()
{
  unint64_t result;

  result = qword_1EEAC0490;
  if (!qword_1EEAC0490)
  {
    result = MEMORY[0x1AF414014](&unk_1A94297C0, &type metadata for DownloadConsistency.Issue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC0490);
  }
  return result;
}

unint64_t sub_1A93D71D4()
{
  unint64_t result;

  result = qword_1EEAC0498;
  if (!qword_1EEAC0498)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429678, &type metadata for DownloadConsistency.Issue.MissingCoreDataEpisodeArtifactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC0498);
  }
  return result;
}

unint64_t sub_1A93D721C()
{
  unint64_t result;

  result = qword_1EEAC04A0;
  if (!qword_1EEAC04A0)
  {
    result = MEMORY[0x1AF414014](&unk_1A94296A0, &type metadata for DownloadConsistency.Issue.MissingCoreDataEpisodeArtifactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC04A0);
  }
  return result;
}

unint64_t sub_1A93D7264()
{
  unint64_t result;

  result = qword_1EEAC04A8;
  if (!qword_1EEAC04A8)
  {
    result = MEMORY[0x1AF414014](&unk_1A94295C0, &type metadata for DownloadConsistency.Issue.MissingMediaLibraryEpisodeArtifactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC04A8);
  }
  return result;
}

unint64_t sub_1A93D72AC()
{
  unint64_t result;

  result = qword_1EEAC04B0;
  if (!qword_1EEAC04B0)
  {
    result = MEMORY[0x1AF414014](&unk_1A94295E8, &type metadata for DownloadConsistency.Issue.MissingMediaLibraryEpisodeArtifactCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC04B0);
  }
  return result;
}

unint64_t sub_1A93D72F4()
{
  unint64_t result;

  result = qword_1EEAC04B8;
  if (!qword_1EEAC04B8)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429508, &type metadata for DownloadConsistency.Issue.UnownedAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC04B8);
  }
  return result;
}

unint64_t sub_1A93D733C()
{
  unint64_t result;

  result = qword_1EEAC04C0;
  if (!qword_1EEAC04C0)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429530, &type metadata for DownloadConsistency.Issue.UnownedAssetCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC04C0);
  }
  return result;
}

unint64_t sub_1A93D7384()
{
  unint64_t result;

  result = qword_1EEAC04C8;
  if (!qword_1EEAC04C8)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429730, &type metadata for DownloadConsistency.Issue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC04C8);
  }
  return result;
}

unint64_t sub_1A93D73CC()
{
  unint64_t result;

  result = qword_1EEAC04D0;
  if (!qword_1EEAC04D0)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429758, &type metadata for DownloadConsistency.Issue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEAC04D0);
  }
  return result;
}

uint64_t sub_1A93D7410(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001ELL && a2 == 0x80000001A9451450 || (sub_1A93F90C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000022 && a2 == 0x80000001A9451470 || (sub_1A93F90C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4164656E776F6E75 && a2 == 0xEC00000074657373)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_1A93F90C0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1A93D7574(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A93F90C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5565646F73697065 && a2 == 0xEB00000000646975)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1A93F90C0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A93D7664(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A93F90C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701603686 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1A93F90C0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A93D772C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  sub_1A9064630(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for DownloadedAssetEffect);
  v3 = type metadata accessor for DownloadedAssetEffect();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 0, 1, v3);
}

uint64_t sub_1A93D7778()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A93D779C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unsigned int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(type metadata accessor for DownloadConsistency.IssueResolution(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);

  type metadata accessor for DownloadConsistency.Issue(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v6 = sub_1A93F73E0();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v2, v6);
    v7 = v0 + v2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A5C88) + 48);
    v8 = sub_1A93F726C();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  else if (EnumCaseMultiPayload <= 1)
  {
    v5 = sub_1A93F73E0();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + v2, v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEABA190);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v9 = v0 + ((v3 + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  __swift_destroy_boxed_opaque_existential_0(v9);
  __swift_destroy_boxed_opaque_existential_0(v9 + 40);

  return swift_deallocObject();
}

uint64_t sub_1A93D78F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;

  v5 = *(_QWORD *)(type metadata accessor for DownloadConsistency.IssueResolution(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  result = sub_1A93D34C8(a1, v2 + v6, v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  *a2 = result;
  return result;
}

uint64_t sub_1A93D795C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A70F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t SettingTransition.init(originValue:newValue:transitionTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32);
  v13(a7, a1, a4);
  v14 = type metadata accessor for SettingTransition(0, a4, a5, a6);
  v13(a7 + *(int *)(v14 + 44), a2, a4);
  v15 = a7 + *(int *)(v14 + 48);
  v16 = sub_1A93F738C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15, a3, v16);
}

uint64_t type metadata accessor for SettingTransition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SettingTransition);
}

uint64_t SettingTransition.originValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t SettingTransition.newValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 44));
}

uint64_t SettingTransition.transitionTime.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 48);
  v5 = sub_1A93F738C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

BOOL sub_1A93D7AE4(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1A93D7AF4()
{
  return sub_1A93F92E8();
}

uint64_t sub_1A93D7B18(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x61566E696769726FLL && a2 == 0xEB0000000065756CLL;
  if (v2 || (sub_1A93F90C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C615677656ELL && a2 == 0xE800000000000000 || (sub_1A93F90C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x697469736E617274 && a2 == 0xEE00656D69546E6FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1A93F90C0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1A93D7CA8(char a1)
{
  if (!a1)
    return 0x61566E696769726FLL;
  if (a1 == 1)
    return 0x65756C615677656ELL;
  return 0x697469736E617274;
}

BOOL sub_1A93D7D14(char *a1, char *a2)
{
  return sub_1A93D7AE4(*a1, *a2);
}

uint64_t sub_1A93D7D2C()
{
  return _s18PodcastsFoundation26PlayButtonTimeFormatHelperV0F5StyleO9hashValueSivg_0();
}

uint64_t sub_1A93D7D3C()
{
  return sub_1A93D7AF4();
}

uint64_t sub_1A93D7D4C()
{
  sub_1A93F92DC();
  sub_1A93D7AF4();
  return sub_1A93F9324();
}

uint64_t sub_1A93D7D94()
{
  char *v0;

  return sub_1A93D7CA8(*v0);
}

uint64_t sub_1A93D7DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A93D7B18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A93D7DD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A93D8DE4();
  *a1 = result;
  return result;
}

uint64_t sub_1A93D7E04(uint64_t a1)
{
  MEMORY[0x1AF414014](&unk_1A9429AD0, a1);
  return sub_1A93F945C();
}

uint64_t sub_1A93D7E38(uint64_t a1)
{
  MEMORY[0x1AF414014](&unk_1A9429AD0, a1);
  return sub_1A93F9468();
}

uint64_t SettingTransition.encode(to:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[4];
  char v13;
  char v14;
  char v15;

  v4 = a2[2];
  v3 = a2[3];
  v12[0] = a2;
  v12[1] = v4;
  v5 = type metadata accessor for SettingTransition.CodingKeys(255, v4, v3, a2[4]);
  MEMORY[0x1AF414014](&unk_1A9429AD0, v5);
  v6 = sub_1A93F9048();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v12 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93F93D8();
  v15 = 0;
  v10 = v12[3];
  sub_1A93F9030();
  if (!v10)
  {
    v14 = 1;
    sub_1A93F9030();
    v13 = 2;
    sub_1A93F738C();
    sub_1A911FB30(&qword_1EEABBF70, MEMORY[0x1E0CB0890]);
    sub_1A93F9030();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t type metadata accessor for SettingTransition.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SettingTransition.CodingKeys);
}

uint64_t SettingTransition.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char v52;
  char v53;
  char v54;

  v39 = a5;
  v40 = sub_1A93F738C();
  v38 = *(_QWORD *)(v40 - 8);
  MEMORY[0x1E0C80A78](v40);
  v41 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](v10);
  v43 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v49 = (char *)&v36 - v13;
  v14 = type metadata accessor for SettingTransition.CodingKeys(255, a2, a3, a4);
  MEMORY[0x1AF414014](&unk_1A9429AD0, v14);
  v46 = sub_1A93F8FA0();
  v42 = *(_QWORD *)(v46 - 8);
  MEMORY[0x1E0C80A78](v46);
  v16 = (char *)&v36 - v15;
  v44 = a2;
  v45 = a3;
  v47 = type metadata accessor for SettingTransition(0, a2, a3, a4);
  v17 = *(_QWORD *)(v47 - 8);
  MEMORY[0x1E0C80A78](v47);
  v19 = (char *)&v36 - v18;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v50 = v16;
  v20 = v51;
  sub_1A93F93C0();
  v21 = (uint64_t)a1;
  if (v20)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v23 = v42;
  v22 = v43;
  v36 = v17;
  v37 = v19;
  v25 = v47;
  v24 = v48;
  v51 = v21;
  v54 = 0;
  v26 = v44;
  v27 = v46;
  sub_1A93F8F7C();
  v28 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
  v28(v37, v49, v26);
  v53 = 1;
  sub_1A93F8F7C();
  v29 = *(int *)(v25 + 44);
  v30 = v37;
  v28(&v37[v29], v22, v26);
  v52 = 2;
  sub_1A911FB30(&qword_1ED2AA110, MEMORY[0x1E0CB08C0]);
  v31 = v40;
  v32 = v41;
  sub_1A93F8F7C();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v50, v27);
  v33 = v47;
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&v30[*(int *)(v47 + 48)], v32, v31);
  v34 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v39, v30, v33);
  __swift_destroy_boxed_opaque_existential_0(v51);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v30, v33);
}

uint64_t sub_1A93D8400@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return SettingTransition.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_1A93D8420(_QWORD *a1, _QWORD *a2)
{
  return SettingTransition.encode(to:)(a1, a2);
}

uint64_t sub_1A93D8434()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = sub_1A93F738C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1A93D84BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  v8 = v7;
  v9 = v6 + v7;
  v10 = (v6 + v8) & ~v8;
  v11 = sub_1A93F738C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v14 = v6 + v13;
  if ((v13 | (unint64_t)v7) > 7
    || ((*(_DWORD *)(v12 + 80) | v7) & 0x100000) != 0
    || ((v14 + v10) & (unint64_t)~v13) + *(_QWORD *)(v12 + 64) > 0x18)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + (((v13 | v7) + 16) & ~(v13 | v7)));
    swift_retain();
  }
  else
  {
    v18 = v11;
    v23 = ~v13;
    v19 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16);
    v19(a1, a2, v4);
    v20 = ((unint64_t)a1 + v9) & ~v8;
    v21 = ((unint64_t)a2 + v9) & ~v8;
    v19((uint64_t *)v20, (uint64_t *)v21, v4);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))((v20 + v14) & v23, (v21 + v14) & v23, v18);
  }
  return a1;
}

uint64_t sub_1A93D85F0(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(unint64_t, uint64_t);
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(void (**)(unint64_t, uint64_t))(v4 + 8);
  v5(a1, v3);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = (v6 + a1 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v5(v7, v3);
  v8 = sub_1A93F738C();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))((v7 + v6 + *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80), v8);
}

uint64_t sub_1A93D8674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v12 = sub_1A93F738C();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 16))((v8 + *(unsigned __int8 *)(v13 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v8 + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), v12);
  return a1;
}

uint64_t sub_1A93D8718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v12 = sub_1A93F738C();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 24))((v8 + *(unsigned __int8 *)(v13 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v8 + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), v12);
  return a1;
}

uint64_t sub_1A93D87BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v12 = sub_1A93F738C();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 32))((v8 + *(unsigned __int8 *)(v13 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v8 + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), v12);
  return a1;
}

uint64_t sub_1A93D8860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v12 = sub_1A93F738C();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 40))((v8 + *(unsigned __int8 *)(v13 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v8 + *(unsigned __int8 *)(v13 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), v12);
  return a1;
}

uint64_t sub_1A93D8904(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = sub_1A93F738C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v7)
    v11 = v7;
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (!a2)
    return 0;
  v12 = *(_QWORD *)(v6 + 64);
  v13 = *(unsigned __int8 *)(v6 + 80);
  v14 = v12 + v13;
  v15 = *(unsigned __int8 *)(v9 + 80);
  if (a2 <= v11)
    goto LABEL_23;
  v16 = ((v12 + v15 + (v14 & ~v13)) & ~v15) + *(_QWORD *)(v9 + 64);
  v17 = 8 * v16;
  if (v16 <= 3)
  {
    v19 = ((a2 - v11 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 < 2)
    {
LABEL_23:
      if (v11)
      {
        if (v7 >= v10)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, v7, v5);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))((((v14 + a1) & ~v13) + v12 + v15) & ~v15, v10, v8);
      }
      return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_23;
LABEL_14:
  v20 = (v18 - 1) << v17;
  if (v16 > 3)
    v20 = 0;
  if ((_DWORD)v16)
  {
    if (v16 <= 3)
      v21 = v16;
    else
      v21 = 4;
    __asm { BR              X12 }
  }
  return v11 + v20 + 1;
}

void sub_1A93D8ABC(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  size_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(sub_1A93F738C() - 8);
  if (*(_DWORD *)(v9 + 84) <= v8)
    v10 = v8;
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = ((*(_QWORD *)(v7 + 64)
        + *(unsigned __int8 *)(v9 + 80)
        + ((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
      + *(_QWORD *)(v9 + 64);
  if (a3 <= v10)
  {
    v12 = 0u;
  }
  else if (v11 <= 3)
  {
    v14 = ((a3 - v10 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
    if (HIWORD(v14))
    {
      v12 = 4u;
    }
    else if (v14 >= 0x100)
    {
      v12 = 2;
    }
    else
    {
      v12 = v14 > 1;
    }
  }
  else
  {
    v12 = 1u;
  }
  if (v10 < a2)
  {
    v13 = ~v10 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v15 = v13 & ~(-1 << (8 * v11));
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if ((_DWORD)v11 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t sub_1A93D8CF8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A93D8D44 + 4 * byte_1A9429943[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A93D8D78 + 4 * byte_1A942993E[v4]))();
}

uint64_t sub_1A93D8D78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93D8D80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A93D8D88);
  return result;
}

uint64_t sub_1A93D8D94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A93D8D9CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A93D8DA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93D8DA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1A93D8DB4()
{
  JUMPOUT(0x1AF414014);
}

void sub_1A93D8DC4()
{
  JUMPOUT(0x1AF414014);
}

void sub_1A93D8DD4()
{
  JUMPOUT(0x1AF414014);
}

uint64_t sub_1A93D8DE4()
{
  return 3;
}

Swift::Void __swiftcall MTEpisode.resolveAvailabilityDate()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char **v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_1A93F738C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v1, sel_pubDate, v4);
  v8 = v7;
  sub_1A93F7380();
  sub_1A93F72D8();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(v1, sel_firstTimeAvailableAsFree);
  v12 = v11;
  if (objc_msgSend(v1, sel_entitlementState) == (id)1)
  {
    objc_msgSend(v1, sel_firstTimeAvailableAsPaid);
    v14 = v13;
    if (v12 <= 0.0)
    {
      v18 = 0.0;
      if (v8 >= v10)
      {
LABEL_13:
        v17 = v18;
        if (v14 > 0.0)
          objc_msgSend(v1, sel_firstTimeAvailableAsPaid, v18);
        if (v17 <= v18)
          v17 = v18;
        goto LABEL_17;
      }
      objc_msgSend(v1, sel_pubDate);
    }
    else
    {
      objc_msgSend(v1, sel_firstTimeAvailableAsFree);
      if (v8 >= v10)
        goto LABEL_12;
    }
    objc_msgSend(v1, sel_pubDate);
LABEL_12:
    v18 = v15;
    goto LABEL_13;
  }
  v16 = &selRef_firstTimeAvailableAsFree;
  if (v12 <= 0.0)
    v16 = &selRef_firstTimeAvailableAsPaid;
  objc_msgSend(v1, *v16);
  if (v8 < v10)
    objc_msgSend(v1, sel_pubDate);
LABEL_17:
  objc_msgSend(v1, sel_setFirstTimeAvailable_, v17);
  objc_msgSend(v1, sel_firstTimeAvailable);
  if (v19 == 0.0)
  {
    objc_msgSend(v1, sel_pubDate);
    objc_msgSend(v1, sel_setFirstTimeAvailable_);
  }
}

uint64_t MTEpisode.isDownloadable.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_isExternalType) ^ 1;
}

uint64_t TranscriptRequestInformation.episodeAdamId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TranscriptRequestInformation.episodeTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TranscriptRequestInformation.ttmlIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TranscriptRequestInformation.selectedTextTimeInterval.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t TranscriptRequestInformation.selectedTextTimeInterval.setter(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 48) = result;
  *(_QWORD *)(v3 + 56) = a2;
  *(_BYTE *)(v3 + 64) = a3 & 1;
  return result;
}

uint64_t (*TranscriptRequestInformation.selectedTextTimeInterval.modify())()
{
  return nullsub_1;
}

void TranscriptRequestInformation.source.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 65);
}

_BYTE *TranscriptRequestInformation.source.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 65) = *result;
  return result;
}

uint64_t (*TranscriptRequestInformation.source.modify())()
{
  return nullsub_1;
}

uint64_t TranscriptRequestInformation.init(episodeAdamId:episodeTitle:ttmlIdentifier:selectedTextTimeInterval:source:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char *a11)
{
  char v11;

  v11 = *a11;
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_BYTE *)(a9 + 64) = a10 & 1;
  *(_BYTE *)(a9 + 65) = v11;
  return result;
}

uint64_t initializeWithCopy for TranscriptRequestInformation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TranscriptRequestInformation(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  return a1;
}

__n128 __swift_memcpy66_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for TranscriptRequestInformation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for TranscriptRequestInformation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 66))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TranscriptRequestInformation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 66) = 1;
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
    *(_BYTE *)(result + 66) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TranscriptRequestInformation()
{
  return &type metadata for TranscriptRequestInformation;
}

uint64_t dispatch thunk of AssetCache.asset(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AssetCache.store(asset:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of AssetCache.containsAsset(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of AssetCache.invalidate(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_1A93D93A4()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for Dependencies()
{
  return &type metadata for Dependencies;
}

void ICContentFairPlayKeySession.__allocating_init(asset:)(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  sub_1A93DB9DC();
  if (v1)
  {

  }
  else
  {
    v4 = v3;
    swift_allocObject();
    sub_1A93D965C((char *)a1, v4);
  }
}

_QWORD *ICContentFairPlayKeySession.__allocating_init(asset:account:)(char *a1, id a2)
{
  _QWORD *v2;
  _QWORD *v3;
  id v6;
  void *v7;
  id v8;
  id v9;

  v3 = v2;
  v6 = objc_msgSend(a2, sel_ams_DSID);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend((id)objc_opt_self(), sel_specificAccountWithDSID_, v6);
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DDC0A0]), sel_initWithIdentity_, v8);

    swift_allocObject();
    v3 = sub_1A93D965C(a1, v9);
  }
  else
  {
    sub_1A93DBAF4();
    swift_allocError();
    swift_willThrow();

  }
  return v3;
}

uint64_t ACAccount.storeRequestContext()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v1 = objc_msgSend(v0, sel_ams_DSID);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_specificAccountWithDSID_, v1);
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DDC0A0]), sel_initWithIdentity_, v3);

    return (uint64_t)v4;
  }
  else
  {
    sub_1A93DBAF4();
    swift_allocError();
    return swift_willThrow();
  }
}

_QWORD *sub_1A93D965C(char *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v30 = *v2;
  v6 = sub_1A93F726C();
  v27 = *(_QWORD *)(v6 - 8);
  v28 = v6;
  MEMORY[0x1E0C80A78](v6);
  v29 = (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FairPlayServerURLConfiguration();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1A93F73E0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_BYTE *)v3 + 40) = 0;
  v3[6] = 0;
  v15 = (_QWORD *)((char *)v3
                 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  *v15 = 0;
  v15[1] = 0;
  *(_QWORD *)((char *)v3
            + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___delegateWrapper) = 0;
  v16 = (_QWORD *)((char *)v3
                 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___logPrefix);
  *v16 = 0;
  v16[1] = 0;
  *(_QWORD *)((char *)v3 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___session) = 0;
  sub_1A93F73D4();
  v17 = sub_1A93F73A4();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v3[2] = v17;
  v3[3] = v19;
  v3[4] = a1;
  v3[7] = *(_QWORD *)&a1[OBJC_IVAR___PFFairPlayAsset_keyStore];
  v3[8] = a2;
  swift_unknownObjectRetain();
  v20 = a2;
  v21 = a1;
  v22 = v31;
  sub_1A938C524((uint64_t)v10);
  if (v22)
  {

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    sub_1A9085818(*(_QWORD *)((char *)v3
                            + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion));
    objc_release(*(id *)((char *)v3
                       + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___delegateWrapper));
    swift_bridgeObjectRelease();
    objc_release(*(id *)((char *)v3
                       + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___session));
    swift_deallocPartialClassInstance();
  }
  else
  {
    v24 = v27;
    v23 = v28;
    sub_1A93DC028((uint64_t)v10, (uint64_t)v3 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_urlConfiguration);
    sub_1A938C7CC();
    v25 = v29;
    sub_1A93D991C(v29);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))((uint64_t)v3 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_keyCertificateURL, v25, v23);
  }
  return v3;
}

uint64_t sub_1A93D991C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v11;
  _BYTE *v12;
  _OWORD v13[2];
  _BYTE v14[24];
  uint64_t v15;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AD3D0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  v6 = objc_msgSend(v5, sel_syncValueForKey_, CFSTR("fps-cert"));

  if (v6)
  {
    sub_1A93F8B44();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  sub_1A9062F08((uint64_t)v13, (uint64_t)v14, qword_1ED2AC800);
  if (v15)
  {
    v7 = sub_1A93F726C();
    v8 = swift_dynamicCast();
    v9 = *(_QWORD *)(v7 - 8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v4, v8 ^ 1u, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v7) != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v4, v7);
  }
  else
  {
    sub_1A905FD54((uint64_t)v14, qword_1ED2AC800);
    v11 = sub_1A93F726C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 1, 1, v11);
  }
  sub_1A905FD54((uint64_t)v4, &qword_1ED2AD3D0);
  sub_1A938C9EC();
  swift_allocError();
  *v12 = 5;
  return swift_willThrow();
}

uint64_t ICContentFairPlayKeySession.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

id ICContentFairPlayKeySession.asset.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t ICContentFairPlayKeySession.bypassCache.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 40);
}

void ICContentFairPlayKeySession.bypassCache.setter(char a1)
{
  uint64_t v1;
  id v3;

  swift_beginAccess();
  *(_BYTE *)(v1 + 40) = a1;
  v3 = sub_1A93D9D14();
  objc_msgSend(v3, sel_setBypassCache_, *(unsigned __int8 *)(v1 + 40));

}

void sub_1A93D9CB8(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  id v4;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_BYTE *)(v3 + 40) = v2;
  v4 = sub_1A93D9D14();
  objc_msgSend(v4, sel_setBypassCache_, *(unsigned __int8 *)(v3 + 40));

}

id sub_1A93D9D14()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___session;
  v2 = *(void **)((char *)v0
                + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___session);
  if (v2)
  {
    v3 = *(id *)((char *)v0 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___session);
  }
  else
  {
    v4 = sub_1A93DA884(v0);
    v5 = *(void **)((char *)v0 + v1);
    *(_QWORD *)((char *)v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void (*ICContentFairPlayKeySession.bypassCache.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1A93D9DB4;
}

void sub_1A93D9DB4(uint64_t a1, char a2)
{
  uint64_t v4;
  id v5;

  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 24);
    v5 = sub_1A93D9D14();
    objc_msgSend(v5, sel_setBypassCache_, *(unsigned __int8 *)(v4 + 40));

  }
}

void *ICContentFairPlayKeySession.keyStoreFilePath.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (!*(_QWORD *)(v0 + 56))
    return 0;
  objc_opt_self();
  v1 = (void *)swift_dynamicCastObjCClass();
  if (v1)
  {
    swift_unknownObjectRetain();
    v2 = objc_msgSend(v1, sel_filePath);
    v1 = (void *)sub_1A93F8040();
    swift_unknownObjectRelease();

  }
  return v1;
}

void *ICContentFairPlayKeySession.keyResponseData.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

void ICContentFairPlayKeySession.keyResponseData.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = a1;

}

uint64_t (*ICContentFairPlayKeySession.keyResponseData.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

Swift::Void __swiftcall ICContentFairPlayKeySession.pauseAutomaticKeyRenewal()()
{
  id v0;

  v0 = sub_1A93D9D14();
  objc_msgSend(v0, sel_pauseAutomaticKeyRenewal);

}

Swift::Void __swiftcall ICContentFairPlayKeySession.resumeAutomaticKeyRenewal()()
{
  id v0;

  v0 = sub_1A93D9D14();
  objc_msgSend(v0, sel_resumeAutomaticKeyRenewal);

}

void sub_1A93DA13C(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4;

  swift_retain();
  v4 = sub_1A93D9D14();
  objc_msgSend(v4, *a3);
  swift_release();

}

Swift::Void __swiftcall ICContentFairPlayKeySession.register()()
{
  sub_1A93DA1A8((SEL *)&selRef_addAsset_);
}

Swift::Void __swiftcall ICContentFairPlayKeySession.deregister()()
{
  sub_1A93DA1A8((SEL *)&selRef_removeAsset_);
}

void sub_1A93DA1A8(SEL *a1)
{
  uint64_t v1;
  id v3;

  v3 = sub_1A93D9D14();
  objc_msgSend(v3, *a1, *(_QWORD *)(*(_QWORD *)(v1 + 32) + OBJC_IVAR___PFFairPlayAsset_avAsset));

}

void sub_1A93DA200(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v5;

  swift_retain();
  v5 = sub_1A93D9D14();
  objc_msgSend(v5, *a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + OBJC_IVAR___PFFairPlayAsset_avAsset));
  swift_release();

}

void ICContentFairPlayKeySession.processKey(with:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (_QWORD *)(v4 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  v6 = *(_QWORD *)(v4 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  *v5 = a3;
  v5[1] = a4;
  sub_1A9085818(v6);
  swift_retain();
  v7 = sub_1A93D9D14();
  v8 = (id)sub_1A93F8010();
  objc_msgSend(v7, sel_processKeyWithIdentifier_, v8);

}

Swift::Void __swiftcall ICContentFairPlayKeySession.renewKey()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;

  if (qword_1ED2A8890 != -1)
    swift_once();
  v0 = sub_1A93F7698();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED2A8878);
  swift_retain_n();
  v1 = sub_1A93F7674();
  v2 = sub_1A93F87B4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v8 = v4;
    *(_DWORD *)v3 = 136315138;
    v5 = sub_1A93DA590();
    sub_1A906436C(v5, v6, &v8);
    sub_1A93F8AA8();
    swift_release_n();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1AF41411C](v4, -1, -1);
    MEMORY[0x1AF41411C](v3, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v7 = sub_1A93D9D14();
  objc_msgSend(v7, sel_renewAllKeys);

}

unint64_t sub_1A93DA590()
{
  uint64_t v0;
  unint64_t *v1;
  unint64_t v2;

  v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___logPrefix);
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___logPrefix + 8))
  {
    v2 = *v1;
  }
  else
  {
    v2 = 0xD000000000000031;
    *v1 = 0xD000000000000031;
    v1[1] = 0x80000001A9451740;
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void ICContentFairPlayKeySession.stopAndInvalidateKeys(completion:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  _QWORD v6[6];

  v4 = sub_1A93D9D14();
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1A90BF160;
  v6[3] = &block_descriptor_89;
  v5 = _Block_copy(v6);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_stopSessionInvalidatingKeys_withCompletion_, 1, v5);
  _Block_release(v5);

}

id sub_1A93DA7D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  objc_class *v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v1 = OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___delegateWrapper;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___delegateWrapper);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___delegateWrapper);
  }
  else
  {
    v4 = (objc_class *)type metadata accessor for ICContentKeySessionDelegateWrapper();
    v5 = (char *)objc_allocWithZone(v4);
    *(_QWORD *)&v5[OBJC_IVAR____TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper_delegate
                 + 8] = 0;
    *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = &off_1E54FE9F0;
    swift_unknownObjectWeakAssign();
    v10.receiver = v5;
    v10.super_class = v4;
    v6 = objc_msgSendSuper2(&v10, sel_init);
    v7 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

id sub_1A93DA884(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v2 = sub_1A93F726C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[7];
  v6 = (void *)a1[8];
  swift_unknownObjectRetain();
  v8 = v6;
  v9 = sub_1A93DA7D0();
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DDBF40]), sel_initWithRequestContext_keyStore_delegate_, v8, v7, v9);

  swift_unknownObjectRelease();
  v11 = a1[4];
  v12 = (void *)sub_1A93F92C4();
  objc_msgSend(v10, sel_setAdamID_, v12);

  v13 = (void *)sub_1A93F71A0();
  objc_msgSend(v10, sel_setKeyCertificateURL_, v13);

  objc_msgSend(v10, sel_setKeyServerProtocolType_, 2);
  objc_msgSend(v10, sel_setBypassCache_, 0);
  v14 = *(id *)(v11 + OBJC_IVAR___PFFairPlayAsset_avAsset);
  v15 = objc_msgSend(v14, sel_URL);
  sub_1A93F7200();

  LOBYTE(v15) = sub_1A93F7140();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  objc_msgSend(v10, sel_setRequestOfflineKeys_, v15 & 1);
  v16 = (void *)sub_1A93F71A0();
  objc_msgSend(v10, sel_setKeyServerURL_, v16);

  type metadata accessor for FairPlayServerURLConfiguration();
  v17 = (void *)sub_1A93F71A0();
  objc_msgSend(v10, sel_setStreamingleaseStopURL_, v17);

  v18 = (void *)sub_1A93F71A0();
  objc_msgSend(v10, sel_setOfflineLeaseStartURL_, v18);

  v19 = (void *)sub_1A93F71A0();
  objc_msgSend(v10, sel_setOfflineLeaseStopURL_, v19);

  v20 = (void *)sub_1A93F71A0();
  objc_msgSend(v10, sel_setOfflineLeaseStopNonceURL_, v20);

  return v10;
}

id *ICContentFairPlayKeySession.deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  v1 = (char *)v0 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_keyCertificateURL;
  v2 = sub_1A93F726C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_1A93DBB38((uint64_t)v0 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_urlConfiguration);
  sub_1A9085818(*(uint64_t *)((char *)v0
                           + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion));
  objc_release(*(id *)((char *)v0
                     + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___delegateWrapper));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)v0
                     + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession____lazy_storage___session));
  return v0;
}

uint64_t ICContentFairPlayKeySession.__deallocating_deinit()
{
  ICContentFairPlayKeySession.deinit();
  return swift_deallocClassInstance();
}

void sub_1A93DAC0C(uint64_t a1, unint64_t a2, void *a3, id a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v9;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  uint64_t *v58;
  void (*v59)(id);
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  os_log_t log;
  uint64_t v74;
  uint64_t v77;
  uint64_t v78[3];

  v5 = v4;
  v9 = &unk_1ED2A8000;
  if (a4)
  {
    v11 = a4;
    if (qword_1ED2A8890 != -1)
      swift_once();
    v12 = sub_1A93F7698();
    __swift_project_value_buffer(v12, (uint64_t)qword_1ED2A8878);
    v13 = a4;
    v14 = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    v15 = a4;
    swift_retain();
    swift_bridgeObjectRetain();
    v16 = v14;
    v17 = sub_1A93F7674();
    v18 = sub_1A93F879C();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v74 = swift_slowAlloc();
      v78[0] = v74;
      *(_DWORD *)v19 = 136316419;
      v20 = sub_1A93DA590();
      sub_1A906436C(v20, v21, v78);
      sub_1A93F8AA8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2160;
      sub_1A93F8AA8();
      *(_WORD *)(v19 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_1A906436C(a1, a2, v78);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 32) = 2160;
      sub_1A93F8AA8();
      *(_WORD *)(v19 + 42) = 2081;
      v22 = v16;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEAC07C0);
      v23 = sub_1A93F8094();
      sub_1A906436C(v23, v24, v78);
      sub_1A93F8AA8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 52) = 2082;
      swift_getErrorValue();
      v25 = sub_1A93F927C();
      v77 = sub_1A906436C(v25, v26, v78);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1A904E000, v17, v18, "%s ICContentKeySession failed to process key for: %{private,mask.hash}s, with delivery response %{private,mask.hash}s and error %{public}s", (uint8_t *)v19, 0x3Eu);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v74, -1, -1);
      v27 = v19;
      v9 = (_QWORD *)&unk_1ED2A8000;
      MEMORY[0x1AF41411C](v27, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();

    }
  }
  else
  {
    if (qword_1ED2A8890 != -1)
      swift_once();
    v28 = sub_1A93F7698();
    __swift_project_value_buffer(v28, (uint64_t)qword_1ED2A8878);
    v29 = a3;
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    v30 = v29;
    v31 = sub_1A93F7674();
    v32 = sub_1A93F87B4();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      log = (os_log_t)swift_slowAlloc();
      v78[0] = (uint64_t)log;
      *(_DWORD *)v33 = 136316163;
      v34 = sub_1A93DA590();
      sub_1A906436C(v34, v35, v78);
      sub_1A93F8AA8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2160;
      sub_1A93F8AA8();
      *(_WORD *)(v33 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_1A906436C(a1, a2, v78);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 32) = 2160;
      sub_1A93F8AA8();
      *(_WORD *)(v33 + 42) = 2081;
      v36 = v30;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEAC07C0);
      v37 = sub_1A93F8094();
      v77 = sub_1A906436C(v37, v38, v78);
      sub_1A93F8AA8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A904E000, v31, v32, "%s ICContentKeySession successfully processed key for: %{private,mask.hash}s, with delivery response %{private,mask.hash}s.", (uint8_t *)v33, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](log, -1, -1);
      v39 = v33;
      v9 = (_QWORD *)&unk_1ED2A8000;
      MEMORY[0x1AF41411C](v39, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
  }
  if (v9[274] != -1)
    swift_once();
  v40 = sub_1A93F7698();
  __swift_project_value_buffer(v40, (uint64_t)qword_1ED2A8878);
  v41 = a3;
  swift_retain_n();
  v42 = v41;
  v43 = sub_1A93F7674();
  v44 = sub_1A93F87B4();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = swift_slowAlloc();
    v46 = v5;
    v47 = swift_slowAlloc();
    v78[0] = v47;
    *(_DWORD *)v45 = 136315651;
    v48 = sub_1A93DA590();
    sub_1A906436C(v48, v49, v78);
    v50 = a3;
    sub_1A93F8AA8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2160;
    sub_1A93F8AA8();
    *(_WORD *)(v45 + 22) = 2081;
    v51 = v42;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEAC07C0);
    v52 = sub_1A93F8094();
    v77 = sub_1A906436C(v52, v53, v78);
    sub_1A93F8AA8();

    a3 = v50;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A904E000, v43, v44, "%s Setting currentResponse=%{private,mask.hash}s.", (uint8_t *)v45, 0x20u);
    swift_arrayDestroy();
    v54 = v47;
    v5 = v46;
    MEMORY[0x1AF41411C](v54, -1, -1);
    MEMORY[0x1AF41411C](v45, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v55 = v42;
  v56 = sub_1A93DBDD4(a3);
  swift_beginAccess();
  v57 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v56;

  v58 = (uint64_t *)(v5 + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  v59 = *(void (**)(id))(v5
                                  + OBJC_IVAR____TtC18PodcastsFoundation27ICContentFairPlayKeySession_pendingProcessCompletion);
  if (v59)
  {
    swift_retain_n();
    sub_1A90858C0((uint64_t)v59);
    v60 = sub_1A93F7674();
    v61 = sub_1A93F8790();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      v63 = swift_slowAlloc();
      v77 = v63;
      *(_DWORD *)v62 = 136315138;
      v64 = sub_1A93DA590();
      sub_1A906436C(v64, v65, &v77);
      sub_1A93F8AA8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A904E000, v60, v61, "%s Calling completion handler.", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v63, -1, -1);
      MEMORY[0x1AF41411C](v62, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v59(a4);
    sub_1A9085818((uint64_t)v59);
    v72 = *v58;
    *v58 = 0;
    v58[1] = 0;
    sub_1A9085818(v72);
  }
  else
  {
    swift_retain_n();
    v66 = sub_1A93F7674();
    v67 = sub_1A93F8790();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      v69 = swift_slowAlloc();
      v77 = v69;
      *(_DWORD *)v68 = 136315138;
      v70 = sub_1A93DA590();
      sub_1A906436C(v70, v71, &v77);
      sub_1A93F8AA8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A904E000, v66, v67, "%s No completion handler found.", v68, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v69, -1, -1);
      MEMORY[0x1AF41411C](v68, -1, -1);

    }
    else
    {

      swift_release_n();
    }
  }
}

uint64_t ICContentFairPlayKeySession.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  v1 = v0;
  sub_1A93F8C70();
  sub_1A93F810C();
  swift_bridgeObjectRetain();
  sub_1A93F810C();
  swift_bridgeObjectRelease();
  sub_1A93F810C();
  v2 = *(id *)(v0 + 32);
  v3 = objc_msgSend(v2, sel_description);
  sub_1A93F8040();

  sub_1A93F810C();
  swift_bridgeObjectRelease();
  sub_1A93F810C();
  swift_beginAccess();
  v4 = *(id *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0618);
  sub_1A93F8094();
  sub_1A93F810C();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1A93DB8A0()
{
  return ICContentFairPlayKeySession.description.getter();
}

void sub_1A93DB9DC()
{
  id v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  _BYTE *v5;

  v0 = objc_msgSend((id)objc_opt_self(), sel_ams_sharedAccountStore);
  v1 = objc_msgSend(v0, sel_ams_activeiTunesAccount);
  if (v1 && (v2 = v1, v3 = objc_msgSend(v1, sel_ams_DSID), v2, v3))
  {

    v4 = objc_msgSend((id)objc_opt_self(), sel_specificAccountWithDSID_, v3);
    objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DDC0A0]), sel_initWithIdentity_, v4);

  }
  else
  {
    sub_1A938C9EC();
    swift_allocError();
    *v5 = 2;
    swift_willThrow();

  }
}

unint64_t sub_1A93DBAF4()
{
  unint64_t result;

  result = qword_1EEAC05E0;
  if (!qword_1EEAC05E0)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429E04, &type metadata for ICContentFairPlayKeySession.Errors);
    atomic_store(result, (unint64_t *)&qword_1EEAC05E0);
  }
  return result;
}

uint64_t sub_1A93DBB38(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FairPlayServerURLConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A93DBB74@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 40);
  return result;
}

uint64_t sub_1A93DBBBC()
{
  return type metadata accessor for ICContentFairPlayKeySession();
}

uint64_t type metadata accessor for ICContentFairPlayKeySession()
{
  uint64_t result;

  result = qword_1EEAC0648;
  if (!qword_1EEAC0648)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A93DBC00()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1A93F726C();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for FairPlayServerURLConfiguration();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for ICContentFairPlayKeySession()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for ICContentKeySessionDelegateWrapper()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for ICContentFairPlayKeySession.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A93DBD30 + 4 * byte_1A9429BF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A93DBD50 + 4 * byte_1A9429BF5[v4]))();
}

_BYTE *sub_1A93DBD30(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A93DBD50(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A93DBD58(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A93DBD60(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A93DBD68(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A93DBD70(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ICContentFairPlayKeySession.Errors()
{
  return &type metadata for ICContentFairPlayKeySession.Errors;
}

unint64_t sub_1A93DBD90()
{
  unint64_t result;

  result = qword_1EEAC07B8;
  if (!qword_1EEAC07B8)
  {
    result = MEMORY[0x1AF414014](&unk_1A9429DDC, &type metadata for ICContentFairPlayKeySession.Errors);
    atomic_store(result, (unint64_t *)&qword_1EEAC07B8);
  }
  return result;
}

id sub_1A93DBDD4(void *a1)
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
  char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void (*v20)(char *, char *, uint64_t);
  objc_class *v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  objc_super v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v25 - v6;
  v8 = sub_1A93F738C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v25 - v14;
  if (a1)
  {
    v16 = objc_msgSend(a1, sel_renewalDate, v13);
    if (v16)
    {
      v17 = v16;
      sub_1A93F7368();

      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v4, v18, 1, v8);
    sub_1A9062F08((uint64_t)v4, (uint64_t)v7, (uint64_t *)&unk_1ED2AD360);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v15, v7, v8);
      v20 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
      v20(v11, v15, v8);
      v21 = (objc_class *)type metadata accessor for FairPlayKeyResponseData();
      v22 = (char *)objc_allocWithZone(v21);
      v20(&v22[OBJC_IVAR___PFFairPlayKeyResponseData_renewalDate], v11, v8);
      v25.receiver = v22;
      v25.super_class = v21;
      v19 = objc_msgSendSuper2(&v25, sel_init);
      v23 = *(void (**)(char *, uint64_t))(v9 + 8);
      v23(v11, v8);

      v23(v15, v8);
      return v19;
    }

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, double))(v9 + 56))(v7, 1, 1, v8, v13);
  }
  sub_1A905FD54((uint64_t)v7, (uint64_t *)&unk_1ED2AD360);
  return 0;
}

uint64_t sub_1A93DC004()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A93DC028(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FairPlayServerURLConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static NSManagedObject.predicateForObjects(with:)(uint64_t a1)
{
  uint64_t v2;

  sub_1A9072534(0, (unint64_t *)&qword_1ED2AC4A0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD3C0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1A9405520;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABBF8);
  *(_QWORD *)(v2 + 64) = sub_1A91599E4();
  *(_QWORD *)(v2 + 32) = a1;
  swift_bridgeObjectRetain();
  return sub_1A93F8754();
}

id sub_1A93DC124()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  sub_1A9072534(0, (unint64_t *)&qword_1ED2A41B8);
  v0 = sub_1A93F8310();
  sub_1A9072534(0, (unint64_t *)&qword_1ED2AC4A0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD3C0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1A9405520;
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABBF8);
  *(_QWORD *)(v1 + 64) = sub_1A91599E4();
  *(_QWORD *)(v1 + 32) = v0;
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8754();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t InMemoryAssetCache.__allocating_init<A>(maxWeight:purgePublisher:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A9084E30(a1, a2, a3, a4, (uint64_t (*)(void))sub_1A9084DD0);
}

void InMemoryAssetCache.invalidate(at:)()
{
  type metadata accessor for InMemoryAssetCache.SizedStore();
}

void sub_1A93DC260()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A905F5EC((void (*)(uint64_t))sub_1A93DC78C, (uint64_t)&v1, v0);
}

uint64_t sub_1A93DC298()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
    sub_1A93DC2EC();
  return result;
}

void sub_1A93DC2EC()
{
  type metadata accessor for InMemoryAssetCache.SizedStore();
}

void sub_1A93DC324()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A905F5EC((void (*)(uint64_t))sub_1A93DC960, v1, v0);
}

uint64_t InMemoryAssetCache.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t InMemoryAssetCache.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1A93DC3B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  return sub_1A9067250(a1, a2, a3);
}

void InMemoryAssetCache.containsAsset(for:)()
{
  type metadata accessor for InMemoryAssetCache.SizedStore();
}

uint64_t sub_1A93DC44C()
{
  uint64_t v0;
  _BYTE v2[160];

  sub_1A905F5EC((void (*)(uint64_t))sub_1A93DC7AC, (uint64_t)v2, v0);
  return v2[64];
}

void sub_1A93DC48C()
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  type metadata accessor for InMemoryAssetCache.Record();
}

uint64_t sub_1A93DC538(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  char v10;
  uint64_t result;

  *(_QWORD *)(v7 - 120) = nullsub_1(v1, v3, a1, v2);
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  swift_bridgeObjectRetain();
  v8(v6, v5);
  v9 = sub_1A93F7F38();
  MEMORY[0x1AF414014](MEMORY[0x1E0DE9ED0], v9);
  v10 = sub_1A93F825C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 136) + 8))(v4, v3);
  result = swift_bridgeObjectRelease();
  **(_BYTE **)(v7 - 128) = v10 & 1;
  return result;
}

void sub_1A93DC600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t, double))(a5 + 16))(a3, a5, v13);
  v14 = a1;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = v15;
  v20 = a7;
  type metadata accessor for InMemoryAssetCache.Record();
}

uint64_t sub_1A93DC6BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;

  sub_1A93F7F5C();
  sub_1A93F7F14();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
  result = *(_QWORD *)(v3 - 72);
  if (result)
  {
    v5 = *(_QWORD *)(result + *(_QWORD *)(*(_QWORD *)result + 128));
    result = swift_release();
    v6 = *(_QWORD *)(v3 - 144);
    v7 = *(_QWORD *)(v6 + 8);
    v8 = v7 >= v5;
    v9 = v7 - v5;
    if (v8)
      *(_QWORD *)(v6 + 8) = v9;
    else
      __break(1u);
  }
  return result;
}

void sub_1A93DC744()
{
  InMemoryAssetCache.containsAsset(for:)();
}

uint64_t sub_1A93DC758(char a1)
{
  return a1 & 1;
}

void sub_1A93DC768()
{
  InMemoryAssetCache.invalidate(at:)();
}

void sub_1A93DC78C(uint64_t a1)
{
  uint64_t *v1;

  sub_1A93DC600(a1, v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

void sub_1A93DC7AC()
{
  sub_1A93DC48C();
}

uint64_t method lookup function for InMemoryAssetCache()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InMemoryAssetCache.__allocating_init<A>(maxWeight:purgePublisher:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

_QWORD *sub_1A93DC7E0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A93DC828(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A93DC860(uint64_t a1, int a2)
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

uint64_t sub_1A93DC8A8(uint64_t result, int a2, int a3)
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

uint64_t sub_1A93DC8E8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A93DC90C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93DC930()
{
  return sub_1A93DC298();
}

void sub_1A93DC960()
{
  sub_1A93DC994();
}

void sub_1A93DC994()
{
  swift_getAssociatedTypeWitness();
  type metadata accessor for InMemoryAssetCache.Record();
}

uint64_t sub_1A93DCA08()
{
  uint64_t v0;
  uint64_t result;

  sub_1A93F7F5C();
  result = sub_1A93F7F50();
  *(_QWORD *)(v0 + 8) = 0;
  return result;
}

uint64_t InterestModel.adamID.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

double InterestModel.interestValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

uint64_t InterestModel.interestValueUpdatedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for InterestModel() + 24);
  v4 = sub_1A93F738C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for InterestModel()
{
  uint64_t result;

  result = qword_1ED2A5628;
  if (!qword_1ED2A5628)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t InterestModel.init(adamID:interestValue:interestValueUpdatedDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a3 = a1;
  *(double *)(a3 + 8) = a4;
  v5 = a3 + *(int *)(type metadata accessor for InterestModel() + 24);
  v6 = sub_1A93F738C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a2, v6);
}

uint64_t static InterestModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
    return 0;
  type metadata accessor for InterestModel();
  return sub_1A93F735C();
}

uint64_t sub_1A93DCB94(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8))
    return sub_1A93F735C();
  else
    return 0;
}

uint64_t *initializeBufferWithCopyOfBuffer for InterestModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v5 = *(int *)(a3 + 24);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_1A93F738C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for InterestModel(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 24);
  v3 = sub_1A93F738C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_OWORD *initializeWithCopy for InterestModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A93F738C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for InterestModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A93F738C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *initializeWithTake for InterestModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A93F738C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for InterestModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A93F738C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for InterestModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A93DCE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 24);
  v5 = sub_1A93F738C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for InterestModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A93DCE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 24);
  v6 = sub_1A93F738C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_1A93DCEA8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A93F738C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void ServerPodcastEpisode.transcriptRequestInformation()(uint64_t a1@<X8>)
{
  char *v1;
  char *v3;
  _QWORD *v4;
  unint64_t *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int16 v44;
  void *v45;

  v3 = &v1[OBJC_IVAR___MTServerPodcastEpisode_relationships];
  swift_beginAccess();
  if (!*(_QWORD *)v3
    || (v4 = (_QWORD *)(*(_QWORD *)v3 + OBJC_IVAR____TtC18PodcastsFoundation27PodcastEpisodeRelationships_podcast),
        swift_beginAccess(),
        !*v4))
  {
    v7 = 0;
    goto LABEL_34;
  }
  v5 = (unint64_t *)(*v4 + OBJC_IVAR____TtC18PodcastsFoundation28PodcastRelationshipContainer_data);
  swift_beginAccess();
  v6 = *v5;
  if (*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = (char *)sub_1A93F8E5C();
    if (v7)
    {
LABEL_5:
      if ((v6 & 0xC000000000000001) != 0)
      {
        v8 = (char *)MEMORY[0x1AF4129DC](0, v6);
      }
      else
      {
        if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_32:
          swift_bridgeObjectRetain();
          if (sub_1A93F8E5C())
            goto LABEL_12;
          goto LABEL_33;
        }
        v8 = (char *)*(id *)(v6 + 32);
      }
      v7 = v8;
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)&v7[OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_relationships];
      if (!v9)
        goto LABEL_34;
      v10 = *(_QWORD *)(v9 + 16);
      if (!v10)
        goto LABEL_34;
      v6 = *(_QWORD *)(v10 + 16);
      if (!(v6 >> 62))
      {
        v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v11)
        {
LABEL_12:
          if ((v6 & 0xC000000000000001) != 0)
          {
            v12 = (char *)MEMORY[0x1AF4129DC](0, v6);
          }
          else
          {
            if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return;
            }
            v12 = (char *)*(id *)(v6 + 32);
          }
          v13 = v12;
          swift_bridgeObjectRelease();
          if ((*(_BYTE *)(*(_QWORD *)&v13[OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes] + 74) & 1) != 0)
          {
            v19 = objc_msgSend(v1, sel_entitledTranscriptIdentifier);
            if (v19)
            {
              v20 = v19;
              v16 = sub_1A93F8040();
              v18 = v21;

            }
            else
            {
              v16 = 0;
              v18 = 0;
            }
            v22 = objc_msgSend(v1, sel_entitledTranscriptProvider);
            if (v22)
            {
LABEL_23:
              v23 = v22;
              sub_1A93F8040();
              v25 = v24;

              if (!v18)
                goto LABEL_43;
              goto LABEL_39;
            }
          }
          else
          {
            v14 = objc_msgSend(v1, sel_freeTranscriptIdentifier);
            if (v14)
            {
              v15 = v14;
              v16 = sub_1A93F8040();
              v18 = v17;

            }
            else
            {
              v16 = 0;
              v18 = 0;
            }
            v22 = objc_msgSend(v1, sel_freeTranscriptProvider);
            if (v22)
              goto LABEL_23;
          }

          goto LABEL_42;
        }
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  else
  {
    v7 = *(char **)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_5;
  }
LABEL_33:
  swift_bridgeObjectRelease();
LABEL_34:
  v26 = objc_msgSend(v1, sel_freeTranscriptIdentifier);
  if (v26)
  {
    v27 = v26;
    v16 = sub_1A93F8040();
    v18 = v28;

  }
  else
  {
    v16 = 0;
    v18 = 0;
  }
  v29 = objc_msgSend(v1, sel_freeTranscriptProvider);
  if (!v29)
  {
LABEL_42:
    v25 = 0;
    if (!v18)
      goto LABEL_43;
    goto LABEL_39;
  }
  v30 = v29;
  sub_1A93F8040();
  v25 = v31;

  if (!v18)
  {
LABEL_43:
    swift_bridgeObjectRelease();

    *(_WORD *)(a1 + 64) = 0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return;
  }
LABEL_39:
  if (!v25)
    goto LABEL_43;
  v45 = v7;
  v32 = objc_msgSend(v1, sel_episodeStoreId);
  if (v32)
  {
    v33 = v32;
    v34 = v16;
    v35 = sub_1A93F8040();
    v37 = v36;

  }
  else
  {
    v34 = v16;
    v37 = 0xE100000000000000;
    v35 = 48;
  }
  v38 = objc_msgSend(v1, sel_title);
  if (v38)
  {
    v39 = v38;
    v40 = sub_1A93F8040();
    v42 = v41;

  }
  else
  {
    v40 = 0;
    v42 = 0;
  }
  v43 = sub_1A93F8ED4();
  swift_bridgeObjectRelease();

  *(_QWORD *)a1 = v35;
  *(_QWORD *)(a1 + 8) = v37;
  if (v43 == 1)
    v44 = 257;
  else
    v44 = 513;
  if (!v43)
    v44 = 1;
  *(_QWORD *)(a1 + 16) = v40;
  *(_QWORD *)(a1 + 24) = v42;
  *(_QWORD *)(a1 + 32) = v34;
  *(_QWORD *)(a1 + 40) = v18;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_WORD *)(a1 + 64) = v44;
}

double Double.roundedDownToNearestMillisecond.getter(double a1)
{
  return floor(a1 * 1000.0) / 1000.0;
}

uint64_t static ModelError.== infix(_:_:)()
{
  return 1;
}

uint64_t ModelError.hash(into:)()
{
  return sub_1A93F92E8();
}

uint64_t ModelError.hashValue.getter()
{
  sub_1A93F92DC();
  sub_1A93F92E8();
  return sub_1A93F9324();
}

unint64_t sub_1A93DD40C()
{
  unint64_t result;

  result = qword_1EEAC0810;
  if (!qword_1EEAC0810)
  {
    result = MEMORY[0x1AF414014](&protocol conformance descriptor for ModelError, &type metadata for ModelError);
    atomic_store(result, (unint64_t *)&qword_1EEAC0810);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ModelError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A93DD490 + 4 * asc_1A9429FA0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A93DD4B0 + 4 * byte_1A9429FA5[v4]))();
}

_BYTE *sub_1A93DD490(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A93DD4B0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A93DD4B8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A93DD4C0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A93DD4C8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A93DD4D0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ModelError()
{
  return &type metadata for ModelError;
}

uint64_t TranscriptsBackgroundSessionDescriptor.init(caches:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A93DD4F4(a1, a2);
}

uint64_t sub_1A93DD4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t TranscriptsBackgroundSessionDescriptor.caches.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A93DD548(v1, a1);
}

uint64_t sub_1A93DD548(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id TranscriptsBackgroundSessionDescriptor.create(session:delegate:)(void *a1, uint64_t a2)
{
  swift_getObjectType();
  return sub_1A9389670(a1, a2);
}

uint64_t TranscriptsBackgroundSessionDescriptor.load(data:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  double v17;
  uint64_t v18;
  char *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A1C88);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1A93F726C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A9160);
  v28 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A8F10);
  v29 = *(_QWORD *)(v12 - 8);
  v30 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0818);
  v31 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0820);
  v32 = *(_QWORD *)(v34 - 8);
  v17 = MEMORY[0x1E0C80A78](v34);
  v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v6 + 16))(v8, a1, v5, v17);
  sub_1A93F7A58();
  if (qword_1EEAB6D08 != -1)
    swift_once();
  v20 = (void *)qword_1EEAB9E68;
  v35 = (id)qword_1EEAB9E68;
  v21 = sub_1A93F882C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 1, 1, v21);
  sub_1A9066C6C();
  sub_1A9066D74(&qword_1ED2A9158, &qword_1ED2A9160, MEMORY[0x1E0C960B0]);
  sub_1A9066CA8((unint64_t *)&qword_1ED2A1C90, (uint64_t (*)(uint64_t))sub_1A9066C6C, MEMORY[0x1E0DEF7F8]);
  v22 = v20;
  sub_1A93F7C80();
  sub_1A90C0C1C((uint64_t)v4);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v9);
  sub_1A9066D74(&qword_1ED2A8F08, &qword_1ED2A8F10, MEMORY[0x1E0C95CB8]);
  v23 = v30;
  sub_1A93F7C20();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0828);
  sub_1A9066D74(&qword_1EEAC0830, &qword_1EEAC0818, MEMORY[0x1E0C95B48]);
  sub_1A9066D74(&qword_1EEAC0838, &qword_1EEAC0828, MEMORY[0x1E0C960D0]);
  v24 = v33;
  sub_1A93F7BB4();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v24);
  sub_1A9066D74(&qword_1EEAC0840, &qword_1EEAC0820, MEMORY[0x1E0C959F8]);
  v25 = v34;
  v26 = sub_1A93F7B24();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v25);
  return v26;
}

uint64_t sub_1A93DD9C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  result = sub_1A93F7278();
  if (!v1)
  {
    v5 = result;
    v6 = v4;
    TranscriptParser.parse(ttmlData:)(result, v4, a1);
    return sub_1A905F180(v5, v6);
  }
  return result;
}

uint64_t sub_1A93DDA24(void **a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v1 = *a1;
  if (qword_1ED2A3F28 != -1)
    swift_once();
  v2 = sub_1A93F7698();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED2A3F08);
  v3 = v1;
  v4 = v1;
  v5 = sub_1A93F7674();
  v6 = sub_1A93F879C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v13 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A1CB0);
    v10 = sub_1A93F8094();
    sub_1A906436C(v10, v11, &v13);
    sub_1A93F8AA8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1A904E000, v5, v6, "Received background wakeup for non-transcript (or malformed) content from transcript session; error: %s",
      v7,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF41411C](v8, -1, -1);
    MEMORY[0x1AF41411C](v7, -1, -1);
  }
  else
  {

  }
  return sub_1A93F7A64();
}

uint64_t TranscriptsBackgroundSessionDescriptor.stash(asset:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v15[3];
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAB87B0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEABEB60);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v12;
  v15[2] = *(_OWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF80);
  sub_1A93847CC((uint64_t)v15, a2);
  sub_1A93F7A58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A1CB0);
  sub_1A93F7A34();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1A9066D74(&qword_1EEABEB68, &qword_1EEABEB60, MEMORY[0x1E0C964C8]);
  v13 = sub_1A93F7B24();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13;
}

uint64_t sub_1A93DDDAC(uint64_t a1)
{
  return TranscriptsBackgroundSessionDescriptor.load(data:)(a1);
}

uint64_t sub_1A93DDDC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v15[3];
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAB87B0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEABEB60);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v12;
  v15[2] = *(_OWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF80);
  sub_1A93847CC((uint64_t)v15, a2);
  sub_1A93F7A58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A1CB0);
  sub_1A93F7A34();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1A9066D74(&qword_1EEABEB68, &qword_1EEABEB60, MEMORY[0x1E0C964C8]);
  v13 = sub_1A93F7B24();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13;
}

_UNKNOWN **sub_1A93DDF5C()
{
  return &protocol witness table for TTMLRequest;
}

_UNKNOWN **sub_1A93DDF68()
{
  return &protocol witness table for TTMLRequest;
}

uint64_t sub_1A93DDF74()
{
  return sub_1A9066CA8(&qword_1EEABEBA0, (uint64_t (*)(uint64_t))type metadata accessor for TTMLRequest, (uint64_t)&protocol conformance descriptor for TTMLRequest);
}

uint64_t sub_1A93DDFA0()
{
  return sub_1A9066CA8(&qword_1EEABEBA8, (uint64_t (*)(uint64_t))type metadata accessor for TTMLRequest, (uint64_t)&protocol conformance descriptor for TTMLRequest);
}

uint64_t *initializeBufferWithCopyOfBuffer for TranscriptsBackgroundSessionDescriptor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  int *v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  v6 = *a2;
  *a1 = *a2;
  if ((v5 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = *(int *)(v4 + 60);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1A93F726C();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_retain();
    v11(v8, v9, v10);
    v12 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF80);
    *(_QWORD *)&v8[v12[15]] = *(_QWORD *)&v9[v12[15]];
    *(_QWORD *)&v8[v12[16]] = *(_QWORD *)&v9[v12[16]];
    *(_QWORD *)&v8[v12[17]] = *(_QWORD *)&v9[v12[17]];
    *(_QWORD *)&v8[v12[18]] = *(_QWORD *)&v9[v12[18]];
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return a1;
}

uint64_t destroy for TranscriptsBackgroundSessionDescriptor(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_release();
  v2 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010) + 60);
  v3 = sub_1A93F726C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF80);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for TranscriptsBackgroundSessionDescriptor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int *v8;

  *a1 = *a2;
  swift_retain();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010) + 60);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A93F726C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF80);
  *(_QWORD *)&v5[v8[15]] = *(_QWORD *)&v6[v8[15]];
  *(_QWORD *)&v5[v8[16]] = *(_QWORD *)&v6[v8[16]];
  *(_QWORD *)&v5[v8[17]] = *(_QWORD *)&v6[v8[17]];
  *(_QWORD *)&v5[v8[18]] = *(_QWORD *)&v6[v8[18]];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for TranscriptsBackgroundSessionDescriptor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int *v8;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010) + 60);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A93F726C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF80);
  *(_QWORD *)&v5[v8[15]] = *(_QWORD *)&v6[v8[15]];
  swift_retain();
  swift_release();
  *(_QWORD *)&v5[v8[16]] = *(_QWORD *)&v6[v8[16]];
  swift_retain();
  swift_release();
  *(_QWORD *)&v5[v8[17]] = *(_QWORD *)&v6[v8[17]];
  swift_retain();
  swift_release();
  *(_QWORD *)&v5[v8[18]] = *(_QWORD *)&v6[v8[18]];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *initializeWithTake for TranscriptsBackgroundSessionDescriptor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int *v8;

  *a1 = *a2;
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010) + 60);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A93F726C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF80);
  *(_QWORD *)&v5[v8[15]] = *(_QWORD *)&v6[v8[15]];
  *(_QWORD *)&v5[v8[16]] = *(_QWORD *)&v6[v8[16]];
  *(_QWORD *)&v5[v8[17]] = *(_QWORD *)&v6[v8[17]];
  *(_QWORD *)&v5[v8[18]] = *(_QWORD *)&v6[v8[18]];
  return a1;
}

_QWORD *assignWithTake for TranscriptsBackgroundSessionDescriptor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int *v8;

  *a1 = *a2;
  swift_release();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010) + 60);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A93F726C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF80);
  *(_QWORD *)&v5[v8[15]] = *(_QWORD *)&v6[v8[15]];
  swift_release();
  *(_QWORD *)&v5[v8[16]] = *(_QWORD *)&v6[v8[16]];
  swift_release();
  *(_QWORD *)&v5[v8[17]] = *(_QWORD *)&v6[v8[17]];
  swift_release();
  *(_QWORD *)&v5[v8[18]] = *(_QWORD *)&v6[v8[18]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TranscriptsBackgroundSessionDescriptor()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A93DE4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TranscriptsBackgroundSessionDescriptor()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A93DE504(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AB010);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TranscriptsBackgroundSessionDescriptor()
{
  uint64_t result;

  result = qword_1ED2AB788;
  if (!qword_1ED2AB788)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A93DE584()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A9378838();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t CoreDataEpisodeAndShowStorage.__allocating_init(context:)(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  CoreDataEpisodeAndShowStorage.init(context:)(a1);
  return v2;
}

uint64_t sub_1A93DE628(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;

  v1 = a1 + 56;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 56);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v8 >= v5)
      return swift_release();
    v9 = *(_QWORD *)(v1 + 8 * v8);
    ++v7;
    if (!v9)
    {
      v7 = v8 + 1;
      if (v8 + 1 >= v5)
        return swift_release();
      v9 = *(_QWORD *)(v1 + 8 * v7);
      if (!v9)
      {
        v7 = v8 + 2;
        if (v8 + 2 >= v5)
          return swift_release();
        v9 = *(_QWORD *)(v1 + 8 * v7);
        if (!v9)
        {
          v7 = v8 + 3;
          if (v8 + 3 >= v5)
            return swift_release();
          v9 = *(_QWORD *)(v1 + 8 * v7);
          if (!v9)
            break;
        }
      }
    }
LABEL_22:
    v4 = (v9 - 1) & v9;
LABEL_5:
    swift_bridgeObjectRetain();
    sub_1A93F7974();
    result = swift_bridgeObjectRelease();
  }
  v10 = v8 + 4;
  if (v10 >= v5)
    return swift_release();
  v9 = *(_QWORD *)(v1 + 8 * v10);
  if (v9)
  {
    v7 = v10;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v7 >= v5)
      return swift_release();
    v9 = *(_QWORD *)(v1 + 8 * v7);
    ++v10;
    if (v9)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t CoreDataEpisodeAndShowStorage.episodeChanges.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  swift_retain();
  return swift_retain();
}

uint64_t CoreDataEpisodeAndShowStorage.showChanges.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 40);
  *a1 = *(_QWORD *)(v1 + 32);
  a1[1] = v2;
  swift_retain();
  return swift_retain();
}

id CoreDataEpisodeAndShowStorage.context.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 64);
}

uint64_t sub_1A93DE7FC(uint64_t a1)
{
  return sub_1A93DE978(a1);
}

void sub_1A93DE820(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[6];

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = sub_1A908CDB8;
  v9[5] = v8;
  v13[4] = sub_1A93DF7B8;
  v13[5] = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1A908A91C;
  v13[3] = &block_descriptor_30_4;
  v10 = _Block_copy(v13);
  swift_retain();
  v11 = a3;
  v12 = a4;
  swift_release();
  objc_msgSend(v11, sel_performBlock_, v10);
  _Block_release(v10);
}

uint64_t sub_1A93DE920()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1A93DE94C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A93DE820(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1A93DE954(uint64_t a1)
{
  return sub_1A93DE978(a1);
}

uint64_t sub_1A93DE978(uint64_t a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  sub_1A93F8040();
  v3 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v4 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithEntityName_, v4);

  objc_msgSend(v5, sel_setPredicate_, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A48C8);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1A9405950;
  v7 = sub_1A93F8040();
  v8 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  v10 = sub_1A93F8040();
  *(_QWORD *)(v6 + 88) = v8;
  *(_QWORD *)(v6 + 64) = v10;
  *(_QWORD *)(v6 + 72) = v11;
  v12 = (void *)sub_1A93F82F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setPropertiesToFetch_, v12);

  objc_msgSend(v5, sel_setResultType_, 2);
  v13 = *(void **)(v1 + 64);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2A9238);
  swift_allocObject();
  v15 = v13;
  v16 = v5;
  sub_1A93F7A94();
  sub_1A9066D74(&qword_1ED2A9230, (uint64_t *)&unk_1ED2A9238, MEMORY[0x1E0C96108]);
  v17 = sub_1A93F7B24();
  swift_release();

  return v17;
}

void sub_1A93DEB74(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[6];

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = sub_1A908CDB8;
  v9[5] = v8;
  v13[4] = sub_1A93DF798;
  v13[5] = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1A908A91C;
  v13[3] = &block_descriptor_90;
  v10 = _Block_copy(v13);
  swift_retain();
  v11 = a3;
  v12 = a4;
  swift_release();
  objc_msgSend(v11, sel_performBlock_, v10);
  _Block_release(v10);
}

void sub_1A93DEC74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A93DEB74(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1A93DEC7C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *, _QWORD))
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void (*v19)(_QWORD *, _QWORD);
  _OWORD v20[2];
  _BYTE v21[24];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_1A9072534(0, &qword_1ED2A9390);
  v4 = sub_1A93F89DC();
  v5 = v4;
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1A93F8E5C();
    v6 = result;
    if (result)
      goto LABEL_3;
LABEL_25:
    swift_bridgeObjectRelease();
    a3((_QWORD *)MEMORY[0x1E0DEE9D8], 0);
LABEL_26:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_25;
LABEL_3:
  if (v6 >= 1)
  {
    v19 = a3;
    v8 = 0;
    v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v11 = (v5 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1AF4129DC](v8, v5) : *(id *)(v5 + 8 * v8 + 32);
      v12 = v11;
      *(_QWORD *)&v20[0] = sub_1A93F8040();
      *((_QWORD *)&v20[0] + 1) = v13;
      swift_bridgeObjectRetain();
      v14 = objc_msgSend(v12, sel___swift_objectForKeyedSubscript_, sub_1A93F9228());
      swift_unknownObjectRelease();
      if (v14)
      {
        sub_1A93F8B44();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v20, 0, sizeof(v20));
      }
      sub_1A90A4E08((uint64_t)v20, (uint64_t)v21);
      if (v22)
        break;
      swift_bridgeObjectRelease();
      sub_1A90A593C((uint64_t)v21);
      v23 = 0;
      v24 = 0;

      v15 = v24;
      if (v24)
        goto LABEL_19;
LABEL_6:
      if (v6 == ++v8)
      {
        swift_bridgeObjectRelease();
        v19(v9, 0);
        goto LABEL_26;
      }
    }
    if ((swift_dynamicCast() & 1) == 0)
    {
      v23 = 0;
      v24 = 0;
    }

    swift_bridgeObjectRelease();
    v15 = v24;
    if (!v24)
      goto LABEL_6;
LABEL_19:
    v16 = v23;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_1A907ECFC(0, v9[2] + 1, 1, v9);
    v18 = v9[2];
    v17 = v9[3];
    if (v18 >= v17 >> 1)
      v9 = sub_1A907ECFC((_QWORD *)(v17 > 1), v18 + 1, 1, v9);
    v9[2] = v18 + 1;
    v10 = &v9[2 * v18];
    v10[4] = v16;
    v10[5] = v15;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A93DEF84(uint64_t a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;

  sub_1A93F8040();
  v3 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v4 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithEntityName_, v4);

  objc_msgSend(v5, sel_setPredicate_, a1);
  objc_msgSend(v5, sel_setResultType_, 1);
  v6 = *(void **)(v1 + 64);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v6;
  v8[3] = sub_1A93DF190;
  v8[4] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABB60);
  swift_allocObject();
  v9 = v5;
  v10 = v6;
  sub_1A93F7A94();
  sub_1A9066D74(&qword_1ED2ABB58, &qword_1ED2ABB60, MEMORY[0x1E0C96108]);
  v11 = sub_1A93F7B24();
  swift_release();

  return v11;
}

uint64_t sub_1A93DF108@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  sub_1A9072534(0, (unint64_t *)&qword_1ED2A41B8);
  result = sub_1A93F89DC();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_1A93DF16C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1A93DF190@<X0>(uint64_t *a1@<X8>)
{
  return sub_1A93DF108(a1);
}

uint64_t sub_1A93DF1A8()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1A93DF1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A929B898(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_1A93DF1E4(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 48) = a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A93DF23C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 56) = a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t CoreDataEpisodeAndShowStorage.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return v0;
}

uint64_t CoreDataEpisodeAndShowStorage.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1A93DF354(uint64_t a1)
{
  return sub_1A93DE7FC(a1);
}

uint64_t sub_1A93DF374(uint64_t a1)
{
  return sub_1A93DE954(a1);
}

uint64_t sub_1A93DF394(uint64_t a1)
{
  return sub_1A93DEF84(a1);
}

uint64_t sub_1A93DF3B4(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  if (!a2)
    return 1;
  v3 = objc_msgSend(a1, sel_changedValues);
  v4 = sub_1A93F7EFC();

  swift_bridgeObjectRetain_n();
  v5 = sub_1A90A6368(v4, a2);
  v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v7)
    return 0;
  v8 = qword_1ED2A3F00;
  swift_bridgeObjectRetain();
  if (v8 != -1)
    swift_once();
  v9 = sub_1A93F7698();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED2A3EE0);
  swift_bridgeObjectRetain();
  v10 = sub_1A93F7674();
  v11 = sub_1A93F8784();
  if (!os_log_type_enabled(v10, v11))
  {

    swift_bridgeObjectRelease_n();
    return 1;
  }
  v12 = (uint8_t *)swift_slowAlloc();
  v13 = swift_slowAlloc();
  v16 = v13;
  *(_DWORD *)v12 = 136315138;
  swift_bridgeObjectRetain();
  sub_1A906436C(v5, v7, &v16);
  sub_1A93F8AA8();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_1A904E000, v10, v11, "Found requested key in notification: %s", v12, 0xCu);
  v14 = 1;
  swift_arrayDestroy();
  MEMORY[0x1AF41411C](v13, -1, -1);
  MEMORY[0x1AF41411C](v12, -1, -1);
  swift_bridgeObjectRelease();

  return v14;
}

uint64_t sub_1A93DF5E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 48);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A93DF634@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 56);
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for CoreDataEpisodeAndShowStorage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.showPropertyLimiters.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.episodePropertyLimitiers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.__allocating_init(context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.fetchShowIDs(matching:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.fetchEpisodeIDs(matching:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.fetchEpisodeManagedIDs(matching:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.managed(object:didChange:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.limitShowNotifications(on:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of CoreDataEpisodeAndShowStorage.limitEpisodeNotifications(on:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

unint64_t sub_1A93DF6F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEAC08B8;
  if (!qword_1EEAC08B8)
  {
    v1 = sub_1A9072534(255, (unint64_t *)&qword_1ED2AC7B0);
    result = MEMORY[0x1AF414014](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EEAC08B8);
  }
  return result;
}

uint64_t sub_1A93DF74C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A93DF770()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93DF798()
{
  uint64_t v0;

  return sub_1A93DEC7C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(_QWORD *, _QWORD))(v0 + 32));
}

unint64_t static FeedUpdateMetricsAction.error.getter()
{
  return 0xD000000000000011;
}

unint64_t static FeedUpdateMetricsAction.finishedWithoutURL.getter()
{
  return 0xD000000000000020;
}

unint64_t static FeedUpdateMetricsAction.notificationReceived.getter()
{
  return 0xD00000000000001ELL;
}

unint64_t static FeedUpdateMetricsAction.notificationScheduled.getter()
{
  return 0xD00000000000001FLL;
}

unint64_t static FeedUpdateMetricsAction.notificationTapped.getter()
{
  return 0xD00000000000001CLL;
}

unint64_t static FeedUpdateMetricsAction.podcastDataSource.getter()
{
  return 0xD000000000000013;
}

unint64_t static FeedUpdateMetricsAction.notificationSetRetryFlag.getter()
{
  return 0xD000000000000022;
}

unint64_t static FeedUpdateMetricsAction.notificationScheduledViaCarousel.getter()
{
  return 0xD00000000000002ALL;
}

unint64_t static FeedUpdateMetricsAction.pageParser.getter()
{
  return 0xD000000000000014;
}

unint64_t static FeedUpdateMetricsAction.parser.getter()
{
  return 0xD000000000000010;
}

unint64_t static FeedUpdateMetricsAction.fetchFeedsExpectedToUpdate.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static FeedUpdateMetricsAction.processCarouselTask.getter()
{
  return 0xD000000000000013;
}

id FeedUpdateMetricsAction.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id FeedUpdateMetricsAction.init()()
{
  return sub_1A93E02B0(type metadata accessor for FeedUpdateMetricsAction);
}

uint64_t type metadata accessor for FeedUpdateMetricsAction()
{
  return objc_opt_self();
}

id FeedUpdateMetricsAction.__deallocating_deinit()
{
  return sub_1A91D2A44(type metadata accessor for FeedUpdateMetricsAction);
}

uint64_t static FeedUpdateMetricsDataKey.actionType.getter()
{
  return 0x79546E6F69746361;
}

unint64_t static FeedUpdateMetricsDataKey.hasPendingCarouselTask.getter()
{
  return 0xD000000000000016;
}

uint64_t static FeedUpdateMetricsDataKey.backgroundFetch.getter()
{
  return 0x756F72676B636162;
}

unint64_t static FeedUpdateMetricsDataKey.carouselTaskUserString.getter()
{
  return 0xD000000000000016;
}

uint64_t static FeedUpdateMetricsDataKey.backgroundTask.getter()
{
  return 0x756F72676B636162;
}

unint64_t static FeedUpdateMetricsDataKey.deletedEpisodeCount.getter()
{
  return 0xD000000000000013;
}

uint64_t static FeedUpdateMetricsDataKey.episodeCount.getter()
{
  return 0x4365646F73697065;
}

uint64_t static FeedUpdateMetricsDataKey.error.getter()
{
  return 0x726F727265;
}

unint64_t static FeedUpdateMetricsDataKey.eventId.getter()
{
  return 0xD000000000000011;
}

uint64_t static FeedUpdateMetricsDataKey.fetchInterval.getter()
{
  return 0x746E496863746566;
}

uint64_t static FeedUpdateMetricsDataKey.foreground.getter()
{
  return 0x756F726765726F66;
}

uint64_t static FeedUpdateMetricsDataKey.needsBootstrap.getter()
{
  return 0x6F6F42736465656ELL;
}

uint64_t static FeedUpdateMetricsDataKey.newEpisodeCount.getter()
{
  return 0x6F7369704577656ELL;
}

unint64_t static FeedUpdateMetricsDataKey.notificationEpisodesCount.getter()
{
  return 0xD000000000000019;
}

unint64_t static FeedUpdateMetricsDataKey.notificationType.getter()
{
  return 0xD000000000000010;
}

uint64_t static FeedUpdateMetricsDataKey.pageCount.getter()
{
  return 0x6E756F4365676170;
}

uint64_t static FeedUpdateMetricsDataKey.pcrFallback.getter()
{
  return 0x6C6C61665F726370;
}

uint64_t static FeedUpdateMetricsDataKey.podcastCount.getter()
{
  return 0x4374736163646F70;
}

uint64_t static FeedUpdateMetricsDataKey.podcastStoreId.getter()
{
  return 0x5374736163646F70;
}

uint64_t static FeedUpdateMetricsDataKey.podcastUuid.getter()
{
  return 0x5574736163646F70;
}

unint64_t static FeedUpdateMetricsDataKey.source.getter()
{
  return 0xD000000000000010;
}

uint64_t static FeedUpdateMetricsDataKey.statusCode.getter()
{
  return 0x635F737574617473;
}

unint64_t static FeedUpdateMetricsDataKey.totalEpisodeCount.getter()
{
  return 0xD000000000000011;
}

unint64_t static FeedUpdateMetricsDataKey.uniquePodcastUuidCount.getter()
{
  return 0xD000000000000016;
}

unint64_t static FeedUpdateMetricsDataKey.updatedEpisodeCount.getter()
{
  return 0xD000000000000013;
}

uint64_t static FeedUpdateMetricsDataKey.updaterType.getter()
{
  return 0x5472657461647075;
}

uint64_t static FeedUpdateMetricsDataKey.userInitiated.getter()
{
  return 0x74696E4972657375;
}

unint64_t static FeedUpdateMetricsDataKey.detectedSyncLoop.getter()
{
  return 0xD000000000000010;
}

id FeedUpdateMetricsDataKey.init()()
{
  return sub_1A93E02B0(type metadata accessor for FeedUpdateMetricsDataKey);
}

uint64_t type metadata accessor for FeedUpdateMetricsDataKey()
{
  return objc_opt_self();
}

id FeedUpdateMetricsDataKey.__deallocating_deinit()
{
  return sub_1A91D2A44(type metadata accessor for FeedUpdateMetricsDataKey);
}

uint64_t static FeedUpdateMetricsDataUpdaterValue.sync.getter()
{
  return 1668184435;
}

uint64_t static FeedUpdateMetricsDataUpdaterValue.rss.getter()
{
  return 7566194;
}

id FeedUpdateMetricsDataUpdaterValue.init()()
{
  return sub_1A93E02B0(type metadata accessor for FeedUpdateMetricsDataUpdaterValue);
}

id sub_1A93E02B0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for FeedUpdateMetricsDataUpdaterValue()
{
  return objc_opt_self();
}

id sub_1A93E030C(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id FeedUpdateMetricsDataUpdaterValue.__deallocating_deinit()
{
  return sub_1A91D2A44(type metadata accessor for FeedUpdateMetricsDataUpdaterValue);
}

void *static MAPIContentType.allCases.getter()
{
  return &unk_1E54D70A0;
}

unint64_t MAPIContentType.init(rawValue:)(unint64_t a1)
{
  return sub_1A93E0654(a1);
}

uint64_t MediaRequest.ContentType.mapiContentType.getter()
{
  char *v0;

  return qword_1A942A3A8[*v0];
}

unint64_t MAPIContentType.mediaRequestContentType.getter@<X0>(unint64_t result@<X0>, _BYTE *a2@<X8>)
{
  if (result >= 6)
  {
    result = sub_1A93F921C();
    __break(1u);
  }
  else
  {
    *a2 = 0x50402030001uLL >> (8 * result);
  }
  return result;
}

unint64_t sub_1A93E03F8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_1A93E0654(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1A93E0428(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E54D70A0;
}

uint64_t MAPIContentType.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0x74736163646F70;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x4574736163646F70;
      break;
    case 2:
      result = 0x4374736163646F70;
      break;
    case 3:
      result = 0x5374736163646F70;
      break;
    case 4:
      result = 0x697263736E617274;
      break;
    case 5:
      result = 0x69726F6765746163;
      break;
    default:
      result = sub_1A93F921C();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_1A93E0548()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = 0x74736163646F70;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      result = 0x4574736163646F70;
      break;
    case 2:
      result = 0x4374736163646F70;
      break;
    case 3:
      result = 0x5374736163646F70;
      break;
    case 4:
      v2 = 0x63736E617274;
      goto LABEL_7;
    case 5:
      v2 = 0x6F6765746163;
LABEL_7:
      result = v2 & 0xFFFFFFFFFFFFLL | 0x6972000000000000;
      break;
    default:
      result = sub_1A93F921C();
      __break(1u);
      break;
  }
  return result;
}

unint64_t sub_1A93E0654(unint64_t result)
{
  if (result > 5)
    return 0;
  return result;
}

unint64_t sub_1A93E0668()
{
  unint64_t result;

  result = qword_1EEAC08C0;
  if (!qword_1EEAC08C0)
  {
    result = MEMORY[0x1AF414014](&protocol conformance descriptor for MAPIContentType, &type metadata for MAPIContentType);
    atomic_store(result, (unint64_t *)&qword_1EEAC08C0);
  }
  return result;
}

unint64_t sub_1A93E06B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEAC08C8;
  if (!qword_1EEAC08C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEAC08D0);
    result = MEMORY[0x1AF414014](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EEAC08C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for MAPIContentType()
{
  return &type metadata for MAPIContentType;
}

uint64_t FloatingPoint.clamped(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7FF8();
  sub_1A93F9240();
  sub_1A93F9234();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, a2);
}

uint64_t FloatingPoint.clamped(to:)()
{
  return sub_1A93F9234();
}

{
  return sub_1A93F9240();
}

uint64_t sub_1A93E0808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC08);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A93E0878()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 80);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_18:
    swift_bridgeObjectRelease();
    v25 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EEAC0908 + dword_1EEAC0908);
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v20;
    *v20 = v0;
    v20[1] = sub_1A93E0B2C;
    return v25(0, 0);
  }
  swift_bridgeObjectRetain();
  result = sub_1A93F8E5C();
  v2 = result;
  if (!result)
    goto LABEL_18;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v22 = v1 & 0xC000000000000001;
    v21 = *(_QWORD *)(v0 + 80) + 32;
    v23 = v2;
    do
    {
      v24 = v4;
      if (v22)
      {
        v6 = MEMORY[0x1AF4129DC](v4, *(_QWORD *)(v0 + 80));
      }
      else
      {
        v6 = *(_QWORD *)(v21 + 8 * v4);
        swift_retain();
      }
      v8 = *(_QWORD *)(v0 + 104);
      v7 = *(_QWORD *)(v0 + 112);
      v9 = *(_QWORD *)(v0 + 88);
      v10 = *(_QWORD *)(v0 + 96);
      v11 = sub_1A93F84CC();
      v12 = *(_QWORD *)(v11 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v7, 1, 1, v11);
      v13 = (_QWORD *)swift_allocObject();
      v13[2] = 0;
      v13[3] = 0;
      v13[4] = v6;
      v13[5] = v9;
      v13[6] = v10;
      sub_1A92174D4(v7, v8);
      LODWORD(v7) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11);
      swift_retain();
      v14 = *(_QWORD *)(v0 + 104);
      if ((_DWORD)v7 == 1)
      {
        sub_1A921751C(*(_QWORD *)(v0 + 104));
      }
      else
      {
        sub_1A93F84C0();
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v11);
      }
      if (v13[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v15 = sub_1A93F840C();
        v17 = v16;
        swift_unknownObjectRelease();
      }
      else
      {
        v15 = 0;
        v17 = 0;
      }
      v18 = **(_QWORD **)(v0 + 72);
      v19 = v17 | v15;
      if (v17 | v15)
      {
        v19 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v15;
        *(_QWORD *)(v0 + 40) = v17;
      }
      v4 = v24 + 1;
      v5 = *(_QWORD *)(v0 + 112);
      *(_QWORD *)(v0 + 48) = 1;
      *(_QWORD *)(v0 + 56) = v19;
      *(_QWORD *)(v0 + 64) = v18;
      swift_task_create();
      swift_release();
      sub_1A921751C(v5);
    }
    while (v23 != v24 + 1);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A93E0B2C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A93E0B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC68);
  v5[13] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[14] = v7;
  v5[15] = *(_QWORD *)(v7 + 64);
  v5[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC08);
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A93E0C30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 112);
    v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v5 = v1 + v4;
    v27 = v4;
    v28 = v3;
    v26 = *(_QWORD *)(v3 + 72);
    v25 = (*(_QWORD *)(v0 + 120) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
    v6 = sub_1A93F84CC();
    v7 = *(_QWORD *)(v6 - 8);
    v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    swift_bridgeObjectRetain();
    while (1)
    {
      v30 = v2;
      v9 = *(_QWORD *)(v0 + 136);
      v10 = *(_QWORD *)(v0 + 144);
      v11 = *(_QWORD *)(v0 + 128);
      v12 = *(_QWORD *)(v0 + 104);
      v31 = *(_QWORD *)(v0 + 88);
      v32 = *(_QWORD *)(v0 + 96);
      v24(v10, 1, 1, v6);
      v29 = v5;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v11, v5, v12);
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = 0;
      v14 = (_QWORD *)(v13 + 16);
      *(_QWORD *)(v13 + 24) = 0;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v28 + 32))(v13 + v27, v11, v12);
      v15 = (_QWORD *)(v13 + v25);
      *v15 = v31;
      v15[1] = v32;
      sub_1A92174D4(v10, v9);
      LODWORD(v9) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6);
      swift_retain();
      v16 = *(_QWORD *)(v0 + 136);
      if ((_DWORD)v9 == 1)
      {
        sub_1A921751C(*(_QWORD *)(v0 + 136));
        if (!*v14)
          goto LABEL_8;
      }
      else
      {
        sub_1A93F84C0();
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v16, v6);
        if (!*v14)
        {
LABEL_8:
          v17 = 0;
          v19 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      v17 = sub_1A93F840C();
      v19 = v18;
      swift_unknownObjectRelease();
LABEL_9:
      v20 = **(_QWORD **)(v0 + 72);
      v21 = v19 | v17;
      if (v19 | v17)
      {
        v21 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v17;
        *(_QWORD *)(v0 + 40) = v19;
      }
      v8 = *(_QWORD *)(v0 + 144);
      *(_QWORD *)(v0 + 48) = 1;
      *(_QWORD *)(v0 + 56) = v21;
      *(_QWORD *)(v0 + 64) = v20;
      swift_task_create();
      swift_release();
      sub_1A921751C(v8);
      v5 = v29 + v26;
      v2 = v30 - 1;
      if (v30 == 1)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  v33 = (char *)&dword_1EEAC0908 + dword_1EEAC0908;
  v22 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v22;
  *v22 = v0;
  v22[1] = sub_1A93E0F14;
  return ((uint64_t (*)(_QWORD, _QWORD))v33)(0, 0);
}

uint64_t sub_1A93E0F14()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A93E0F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  v7 = sub_1A93F6E7C();
  v6[6] = v7;
  v6[7] = *(_QWORD *)(v7 - 8);
  v6[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AAF58);
  v6[9] = swift_task_alloc();
  v8 = sub_1A93F8958();
  v6[10] = v8;
  v6[11] = *(_QWORD *)(v8 - 8);
  v6[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A93E1030()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = v0[3];
  sub_1A93F8964();
  sub_1A9066CA8(&qword_1ED2ABCF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1EF0], MEMORY[0x1E0CB1F00]);
  swift_retain();
  sub_1A93F858C();
  v0[13] = sub_1A9066CA8(&qword_1ED2ABCF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1EE0], MEMORY[0x1E0CB1EE8]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[14] = v1;
  *v1 = v0;
  v1[1] = sub_1A93E1118;
  return sub_1A93F8460();
}

uint64_t sub_1A93E1118()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93E117C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD);

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
    goto LABEL_4;
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 64), v1, v2);
  if ((sub_1A93F8520() & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
LABEL_4:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v6 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 32) + *(_QWORD *)(v0 + 32));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v5;
  *v5 = v0;
  v5[1] = sub_1A93E131C;
  return v6(*(_QWORD *)(v0 + 64));
}

uint64_t sub_1A93E1284()
{
  uint64_t v0;

  if (!sub_1A93F9084())
    swift_allocError();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93E131C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93E1380()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD))(v0[7] + 8))(v0[8], v0[6]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[17] = v1;
  *v1 = v0;
  v1[1] = sub_1A93E13EC;
  return sub_1A93F8460();
}

uint64_t sub_1A93E13EC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93E1450()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93E14C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[7] = a5;
  v6[8] = a6;
  v6[6] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC68);
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC50);
  v6[12] = v8;
  v6[13] = *(_QWORD *)(v8 - 8);
  v6[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A93E1558()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[10] + 16))(v0[11], v0[6], v0[9]);
  sub_1A9066D74(&qword_1ED2ABC70, &qword_1ED2ABC68, MEMORY[0x1E0DF0848]);
  sub_1A93F858C();
  v0[15] = sub_1A9066D74(&qword_1ED2ABC48, &qword_1ED2ABC50, MEMORY[0x1E0DF0830]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[16] = v1;
  *v1 = v0;
  v1[1] = sub_1A93E163C;
  return sub_1A93F8460();
}

uint64_t sub_1A93E163C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93E16A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t);

  v1 = *(_QWORD *)(v0 + 24);
  if (!v1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
    goto LABEL_5;
  }
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = v1;
  if ((sub_1A93F8520() & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 104);
    v2 = *(_QWORD *)(v0 + 112);
    v4 = *(_QWORD *)(v0 + 96);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v7 = (uint64_t (*)(uint64_t))(**(int **)(v0 + 56) + *(_QWORD *)(v0 + 56));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v6;
  *v6 = v0;
  v6[1] = sub_1A93E180C;
  return v7(v0 + 32);
}

uint64_t sub_1A93E1788()
{
  uint64_t v0;

  if (!sub_1A93F9084())
    swift_allocError();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93E180C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93E1870()
{
  uint64_t v0;
  _QWORD *v1;

  swift_bridgeObjectRelease();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_1A93E18DC;
  return sub_1A93F8460();
}

uint64_t sub_1A93E18DC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93E1940()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93E19A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  if (a1)
  {
    swift_getObjectType();
    v4 = sub_1A93F840C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v3[10] = v4;
  v3[11] = v6;
  return swift_task_switch();
}

uint64_t sub_1A93E1A1C()
{
  uint64_t v0;
  int isPlatformVersionAtLeast;
  _QWORD *v3;

  *(_QWORD *)(v0 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A1CB0);
  if ((sub_1A93F855C() & 1) != 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  isPlatformVersionAtLeast = __isPlatformVersionAtLeast(2, 18, 0, 0);
  *(_DWORD *)(v0 + 128) = isPlatformVersionAtLeast;
  *(_QWORD *)(v0 + 104) = 0;
  if (!isPlatformVersionAtLeast)
    return swift_taskGroup_wait_next_throwing();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC78);
  *v3 = v0;
  v3[1] = sub_1A93E1B34;
  return sub_1A93F8550();
}

uint64_t sub_1A93E1B34()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 120) = v0;
  else
    *(_BYTE *)(v2 + 134) = *(_BYTE *)(v2 + 132);
  return swift_task_switch();
}

uint64_t sub_1A93E1BA0()
{
  uint64_t v0;
  uint64_t v1;

  if (v0)
    *(_QWORD *)(v1 + 120) = v0;
  else
    *(_BYTE *)(v1 + 135) = *(_BYTE *)(v1 + 133);
  return swift_task_switch();
}

uint64_t sub_1A93E1BD0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  if ((*(_BYTE *)(v0 + 134) & 1) == 0)
    goto LABEL_7;
  v1 = *(_QWORD *)(v0 + 104);
  if ((sub_1A93F855C() & 1) == 0)
  {
    *(_QWORD *)(v0 + 104) = v1;
LABEL_7:
    if (!*(_DWORD *)(v0 + 128))
      return swift_taskGroup_wait_next_throwing();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC78);
    *v3 = v0;
    v3[1] = sub_1A93E1B34;
    return sub_1A93F8550();
  }
  if (v1)
    swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93E1CD0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  if ((*(_BYTE *)(v0 + 135) & 1) == 0)
    goto LABEL_7;
  v1 = *(_QWORD *)(v0 + 104);
  if ((sub_1A93F855C() & 1) == 0)
  {
    *(_QWORD *)(v0 + 104) = v1;
LABEL_7:
    if (!*(_DWORD *)(v0 + 128))
      return swift_taskGroup_wait_next_throwing();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC78);
    *v3 = v0;
    v3[1] = sub_1A93E1B34;
    return sub_1A93F8550();
  }
  if (v1)
    swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93E1DD0()
{
  uint64_t v0;
  void *v1;
  _QWORD *v3;

  v1 = *(void **)(v0 + 120);
  if (*(_QWORD *)(v0 + 104))
  {

    v1 = *(void **)(v0 + 104);
  }
  if ((sub_1A93F855C() & 1) != 0)
  {
    if (v1)
      swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 104) = v1;
    if (*(_DWORD *)(v0 + 128))
    {
      v3 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC78);
      *v3 = v0;
      v3[1] = sub_1A93E1B34;
      return sub_1A93F8550();
    }
    else
    {
      return swift_taskGroup_wait_next_throwing();
    }
  }
}

uint64_t NSNotificationCenter.respond(to:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_1A93E1EFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(id *)(v0 + 48);
  v5 = sub_1A93E20E4(v2);
  *(_QWORD *)(v0 + 56) = v5;

  v6 = swift_allocObject();
  *(_QWORD *)(v0 + 64) = v6;
  *(_QWORD *)(v6 + 16) = v3;
  *(_QWORD *)(v6 + 24) = v1;
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v7;
  v7[2] = v5;
  v7[3] = &unk_1EEABB3E8;
  v7[4] = v6;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v8;
  *v8 = v0;
  v8[1] = sub_1A92505C0;
  return sub_1A93F8EE0();
}

uint64_t sub_1A93E1FFC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1A921755C;
  return v6(a1);
}

uint64_t sub_1A93E205C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v12;
  _QWORD *v13;

  v12 = *a4;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_1A9164CD4;
  return sub_1A93E0F80(a1, a2, a3, v12, a5, a6);
}

uint64_t sub_1A93E20E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v7 = MEMORY[0x1E0DEE9D8];
    sub_1A93F8D84();
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      v6 = v5;
      sub_1A93F8970();

      sub_1A93F8D60();
      sub_1A93F8D90();
      sub_1A93F8D9C();
      sub_1A93F8D6C();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_1A93E21A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93E21CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A921755C;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_1A921755C;
  return v8(a1);
}

uint64_t sub_1A93E2254(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_1A9164CD4;
  return sub_1A93E0808(a1, a2, v6, v7, v8);
}

uint64_t sub_1A93E22D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC68);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93E2368(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2ABC68) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_1A921755C;
  return sub_1A93E14C4(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_1A93E2418()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93E244C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1 + 4;
  v8 = v1[5];
  v7 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1A921755C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))((char *)&dword_1EEAC0910
                                                                                         + dword_1EEAC0910))(a1, v4, v5, v6, v8, v7);
}

uint64_t sub_1A93E24E0(uint64_t result, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v3 >= result)
      v4 = result;
    else
      v4 = *(_QWORD *)(a2 + 16);
    if (result)
      v5 = v4;
    else
      v5 = 0;
    if (v3 >= v5)
    {
      type metadata accessor for PodcastsMediaLibrary.MediaItem(0);
      return a2;
    }
  }
  __break(1u);
  return result;
}

BOOL String.containsVisibleText.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v4 = sub_1A93F6E34();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = a1;
  v13[1] = a2;
  sub_1A93F6E10();
  sub_1A90828B0();
  v8 = sub_1A93F8AE4();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v8 & 0xFFFFFFFFFFFFLL;
  return v11 != 0;
}

uint64_t String.init(playedOn:dateString:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v6 = sub_1A93F7494();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7470();
  v10 = sub_1A93F7428();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_1ED2AD260 != -1)
      swift_once();
    v11 = sub_1A93F7044();
  }
  else
  {
    v12 = (void *)sub_1A93F7314();
    v13 = objc_msgSend(v12, sel_isLessThanWeekOld);

    if (v13)
    {
      if (qword_1ED2AD260 != -1)
        swift_once();
    }
    else if (qword_1ED2AD260 != -1)
    {
      swift_once();
    }
    sub_1A93F7044();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD3C0);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1A9405520;
    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 64) = sub_1A90A92DC();
    *(_QWORD *)(v14 + 32) = a2;
    *(_QWORD *)(v14 + 40) = a3;
    v11 = sub_1A93F8070();
    swift_bridgeObjectRelease();
  }
  v15 = sub_1A93F738C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  return v11;
}

uint64_t String.capitalizedFirstLetter.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRetain();
  sub_1A93E2A50(1);
  swift_bridgeObjectRelease();
  sub_1A9320C50();
  v4 = sub_1A93F8AF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1A93E29B4(1uLL, a1, a2);
  swift_bridgeObjectRelease();
  sub_1A93E2AD8();
  swift_bridgeObjectRetain();
  sub_1A93F8100();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_1A93E29B4(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_1A93F80F4();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_1A93F819C();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A93E2A50(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1A93F80F4();
    return sub_1A93F819C();
  }
  return result;
}

unint64_t sub_1A93E2AD8()
{
  unint64_t result;

  result = qword_1ED2A92A0;
  if (!qword_1ED2A92A0)
  {
    result = MEMORY[0x1AF414014](MEMORY[0x1E0DEBB10], MEMORY[0x1E0DEBAF0]);
    atomic_store(result, (unint64_t *)&qword_1ED2A92A0);
  }
  return result;
}

uint64_t PodcastIdentifier.description.getter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v5;

  if (a3)
  {
    if (a3 == 1)
      v3 = 0x2864697575;
    else
      v3 = 0x284C525564656566;
    v5 = v3;
    sub_1A93F810C();
  }
  else
  {
    v5 = 0x28444965726F7473;
    sub_1A93F9060();
    sub_1A93F810C();
    swift_bridgeObjectRelease();
  }
  sub_1A93F810C();
  return v5;
}

uint64_t PodcastIdentifier.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    sub_1A93F92E8();
    return sub_1A93F7FBC();
  }
  else
  {
    sub_1A93F92E8();
    return sub_1A93F930C();
  }
}

uint64_t PodcastIdentifier.hashValue.getter(uint64_t a1, uint64_t a2, char a3)
{
  sub_1A93F92DC();
  sub_1A93F92E8();
  if (a3)
    sub_1A93F7FBC();
  else
    sub_1A93F930C();
  return sub_1A93F9324();
}

uint64_t sub_1A93E2CF4()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1A93F92DC();
  sub_1A93F92E8();
  if (v1)
    sub_1A93F7FBC();
  else
    sub_1A93F930C();
  return sub_1A93F9324();
}

uint64_t sub_1A93E2D88()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 16))
  {
    sub_1A93F92E8();
    return sub_1A93F7FBC();
  }
  else
  {
    sub_1A93F92E8();
    return sub_1A93F930C();
  }
}

uint64_t sub_1A93E2E08()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  sub_1A93F92DC();
  sub_1A93F92E8();
  if (v1)
    sub_1A93F7FBC();
  else
    sub_1A93F930C();
  return sub_1A93F9324();
}

uint64_t sub_1A93E2E98()
{
  uint64_t v0;

  return PodcastIdentifier.description.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_1A93E2EA4(uint64_t a1, uint64_t a2)
{
  return _s18PodcastsFoundation17PodcastIdentifierO2eeoiySbAC_ACtFZ_0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

_QWORD *RemoteNonFollowedShow.prioritizedIDs.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  os_log_type_t type;
  uint64_t v21;

  v2 = *v0;
  v1 = v0[1];
  v3 = v0[2];
  if (objc_msgSend((id)objc_opt_self(), sel_isNotEmpty_, *v0))
  {
    v4 = sub_1A9119ECC(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v6 = v4[2];
    v5 = v4[3];
    if (v6 >= v5 >> 1)
      v4 = sub_1A9119ECC((_QWORD *)(v5 > 1), v6 + 1, 1, v4);
    v4[2] = v6 + 1;
    v7 = &v4[3 * v6];
    v7[4] = v2;
    v7[5] = 0;
    *((_BYTE *)v7 + 48) = 0;
  }
  else
  {
    v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v8 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v8 = v1 & 0xFFFFFFFFFFFFLL;
  if (v8)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v4 = sub_1A9119ECC(0, v4[2] + 1, 1, v4);
    v10 = v4[2];
    v9 = v4[3];
    if (v10 >= v9 >> 1)
      v4 = sub_1A9119ECC((_QWORD *)(v9 > 1), v10 + 1, 1, v4);
    v4[2] = v10 + 1;
    v11 = &v4[3 * v10];
    v11[4] = v1;
    v11[5] = v3;
    *((_BYTE *)v11 + 48) = 2;
  }
  else if (!v4[2])
  {
    if (qword_1ED2A3F00 != -1)
      swift_once();
    v12 = sub_1A93F7698();
    __swift_project_value_buffer(v12, (uint64_t)qword_1ED2A3EE0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v13 = sub_1A93F7674();
    v14 = sub_1A93F87A8();
    if (os_log_type_enabled(v13, v14))
    {
      type = v14;
      v15 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v15 = 134218498;
      sub_1A93F8AA8();
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1A906436C(v1, v3, &v21);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2080;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A9350);
      v16 = sub_1A93F8094();
      sub_1A906436C(v16, v17, &v21);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A904E000, v13, type, "We shouldn't be here: RemoteNonFollowedShow must at least have a non empty feedURL. AdamID %lld, feedURL %s, lastDatePlayed %s.", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v19, -1, -1);
      MEMORY[0x1AF41411C](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  return v4;
}

uint64_t _s18PodcastsFoundation17PodcastIdentifierO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    if (a3 == 1)
    {
      if (a6 == 1)
      {
        if (a1 == a4 && a2 == a5)
          return 1;
        return sub_1A93F90C0();
      }
    }
    else if (a6 == 2)
    {
      if (a1 == a4 && a2 == a5)
        return 1;
      return sub_1A93F90C0();
    }
    return 0;
  }
  return !a6 && a1 == a4;
}

unint64_t sub_1A93E32C8()
{
  unint64_t result;

  result = qword_1EEAC0928;
  if (!qword_1EEAC0928)
  {
    result = MEMORY[0x1AF414014](&protocol conformance descriptor for PodcastIdentifier, &type metadata for PodcastIdentifier);
    atomic_store(result, (unint64_t *)&qword_1EEAC0928);
  }
  return result;
}

uint64_t destroy for PodcastIdentifier(uint64_t a1)
{
  return sub_1A909F1A0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s18PodcastsFoundation17PodcastIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1A909F644(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PodcastIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1A909F644(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1A909F1A0(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for PodcastIdentifier(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1A909F1A0(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for PodcastIdentifier()
{
  return &type metadata for PodcastIdentifier;
}

uint64_t static MTDB.shared.getter()
{
  id *v0;
  id *v1;
  void *v2;
  void *v3;
  uint64_t result;
  id v5;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x1E0C80C00];
  v0 = (id *)swift_allocObject();
  v0[2] = 0;
  v1 = v0 + 2;
  v2 = (void *)objc_opt_self();
  aBlock[4] = sub_1A93E362C;
  aBlock[5] = v0;
  aBlock[0] = (id)MEMORY[0x1E0C809B0];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_91;
  v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v2, sel_perform_error_, v3, aBlock);
  _Block_release(v3);
  if (aBlock[0])
  {
    swift_willThrow();
    return swift_release();
  }
  else
  {
    result = swift_beginAccess();
    if (*v1)
    {
      v5 = *v1;
      swift_release();
      return (uint64_t)v5;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1A93E3594()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1A93E35B8(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  swift_beginAccess();
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v2;

}

void sub_1A93E362C()
{
  uint64_t v0;

  sub_1A93E35B8(v0);
}

void sub_1A93E3634(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1A93F711C();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_1A93E3680(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return v2;
  v24 = *(_QWORD *)(a1 + 16);
  v25 = MEMORY[0x1E0DEE9D8];
  sub_1A929E454(0, v1, 0);
  v2 = v25;
  result = sub_1A93E94FC(a1);
  v6 = result;
  v7 = v24;
  v8 = 0;
  v9 = a1 + 64;
  v10 = a1 + 80;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v12 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v9 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v5)
      goto LABEL_24;
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v6) + OBJC_IVAR___PFFairPlayAsset_adamID);
    v15 = *(_QWORD *)(v25 + 16);
    v14 = *(_QWORD *)(v25 + 24);
    if (v15 >= v14 >> 1)
    {
      v22 = v9;
      v23 = v5;
      v21 = v10;
      result = sub_1A929E454(v14 > 1, v15 + 1, 1);
      v10 = v21;
      v9 = v22;
      v5 = v23;
      v7 = v24;
    }
    *(_QWORD *)(v25 + 16) = v15 + 1;
    *(_QWORD *)(v25 + 8 * v15 + 32) = v13;
    v11 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v11)
      goto LABEL_25;
    v16 = *(_QWORD *)(v9 + 8 * v12);
    if ((v16 & (1 << v6)) == 0)
      goto LABEL_26;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v5)
      goto LABEL_27;
    v17 = v16 & (-2 << (v6 & 0x3F));
    if (v17)
    {
      v11 = __clz(__rbit64(v17)) | v6 & 0xFFFFFFFFFFFFFFC0;
    }
    else
    {
      v18 = v12 + 1;
      v19 = (unint64_t)(v11 + 63) >> 6;
      if (v12 + 1 < v19)
      {
        v20 = *(_QWORD *)(v9 + 8 * v18);
        if (v20)
        {
LABEL_20:
          v11 = __clz(__rbit64(v20)) + (v18 << 6);
        }
        else
        {
          while (v19 - 2 != v12)
          {
            v20 = *(_QWORD *)(v10 + 8 * v12++);
            if (v20)
            {
              v18 = v12 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v8;
    v6 = v11;
    if (v8 == v7)
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

void sub_1A93E388C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  type metadata accessor for FairPlayAsset();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A1CB0);
  sub_1A9066CA8(&qword_1EEABE3C8, (uint64_t (*)(uint64_t))type metadata accessor for FairPlayAsset, MEMORY[0x1E0DEFCF8]);
  v5 = (void *)sub_1A93F7ED8();
  if (a2)
    v6 = sub_1A93F711C();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

id FairPlayKeyLoader.__allocating_init(metadataLoader:fairPlayKeySessionProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  ObjectType = swift_getObjectType();
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = __swift_mutable_project_boxed_opaque_existential_1(a2, v6);
  v9 = sub_1A93E984C(a1, v8, v2, ObjectType, v6, v7);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a2);
  return v9;
}

id FairPlayKeyLoader.init(metadataLoader:fairPlayKeySessionProvider:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  ObjectType = swift_getObjectType();
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = __swift_mutable_project_boxed_opaque_existential_1(a2, v6);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v12 + 16))(v11, v9);
  v13 = sub_1A93E95AC(a1, (uint64_t)v11, v2, ObjectType, v6, v7);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a2);
  return v13;
}

id FairPlayKeyLoader.init()()
{
  objc_class *ObjectType;
  id v1;
  uint64_t v2;
  id v3;

  ObjectType = (objc_class *)swift_getObjectType();
  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaItemMetadataLoader()), sel_init);
  type metadata accessor for FairPlayKeySessionProvider();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  v3 = sub_1A9066800((uint64_t)v1, v2, (char *)objc_allocWithZone(ObjectType));

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t FairPlayKeyLoader.createSession(asset:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = sub_1A93F7D58();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v22 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1A93F7DB8();
  v12 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)(v4 + OBJC_IVAR___PFFairPlayKeyLoader_internalQueue);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = v15;
  v16[5] = a1;
  aBlock[4] = sub_1A93E995C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_92;
  v17 = _Block_copy(aBlock);
  sub_1A90858C0(a2);
  swift_retain();
  v18 = a1;
  sub_1A93F7D88();
  v23 = MEMORY[0x1E0DEE9D8];
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, v9, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
  sub_1A93F8B5C();
  MEMORY[0x1AF412598](0, v14, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v21);
  swift_release();
  return swift_release();
}

uint64_t sub_1A93E3D7C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v5)(uint64_t, void *);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  _BYTE *v14;
  uint64_t v15;

  if (result)
  {
    v5 = (void (*)(uint64_t, void *))result;
    v6 = a3 + 16;
    swift_beginAccess();
    v7 = MEMORY[0x1AF41420C](v6);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (_QWORD *)(v7 + OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider);
      v10 = v9[3];
      v11 = v9[4];
      __swift_project_boxed_opaque_existential_1(v9, v10);
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 8);
      swift_retain();
      v12(a4, v10, v11);
      v15 = swift_unknownObjectRetain();
      v5(v15, 0);
      swift_unknownObjectRelease();

      sub_1A9085818((uint64_t)v5);
      return swift_unknownObjectRelease();
    }
    else
    {
      sub_1A938C9EC();
      v13 = (void *)swift_allocError();
      *v14 = 1;
      swift_retain();
      v5(0, v13);

      return sub_1A9085818((uint64_t)v5);
    }
  }
  return result;
}

unint64_t sub_1A93E40DC()
{
  uint64_t v0;
  unint64_t *v1;
  unint64_t v2;

  v1 = (unint64_t *)(v0 + OBJC_IVAR___PFFairPlayKeyLoader____lazy_storage___logPrefix);
  if (*(_QWORD *)(v0 + OBJC_IVAR___PFFairPlayKeyLoader____lazy_storage___logPrefix + 8))
  {
    v2 = *v1;
  }
  else
  {
    v2 = 0xD000000000000027;
    *v1 = 0xD000000000000027;
    v1[1] = 0x80000001A9451E40;
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t FairPlayKeyLoader.startKeyRequest(session:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = sub_1A93F7D58();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v21 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1A93F7DB8();
  v12 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v4 + OBJC_IVAR___PFFairPlayKeyLoader_internalQueue);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  aBlock[4] = sub_1A93E99A4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_10_8;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  sub_1A90858C0(a2);
  sub_1A93F7D88();
  v22 = MEMORY[0x1E0DEE9D8];
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, v9, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
  sub_1A93F8B5C();
  MEMORY[0x1AF412598](0, v14, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  swift_release();
  return swift_release();
}

void sub_1A93E4448(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v7 = a1 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x1AF41420C](v7);
  if (v8)
  {
    v9 = (void *)v8;
    sub_1A93E44BC(a2, a3, a4);

  }
}

uint64_t sub_1A93E44BC(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  char *v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  char **v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD v37[2];
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v7 = sub_1A93F7E18();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (_QWORD *)((char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)&v3[OBJC_IVAR___PFFairPlayKeyLoader_internalQueue];
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v8 + 104))(v11, *MEMORY[0x1E0DEF740], v7, v9);
  v13 = v12;
  v14 = sub_1A93F7E3C();
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v11, v7);
  if ((v14 & 1) != 0)
  {
    if (qword_1ED2A8890 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v15 = sub_1A93F7698();
  __swift_project_value_buffer(v15, (uint64_t)qword_1ED2A8878);
  v16 = v3;
  swift_unknownObjectRetain_n();
  v17 = v16;
  v18 = sub_1A93F7674();
  v19 = sub_1A93F8790();
  v20 = v19;
  v21 = &selRef_isOTAPurchased;
  if (os_log_type_enabled(v18, v19))
  {
    v22 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v41 = v39;
    *(_DWORD *)v22 = 136315651;
    v38 = v20;
    v23 = sub_1A93E40DC();
    v40 = sub_1A906436C(v23, v24, &v41);
    sub_1A93F8AA8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2160;
    v40 = 1752392040;
    sub_1A93F8AA8();
    *(_WORD *)(v22 + 22) = 2081;
    v37[1] = v22 + 24;
    v25 = objc_msgSend(a1, sel_asset);
    v26 = FairPlayAsset.description.getter();
    v27 = a2;
    v28 = a3;
    v30 = v29;

    v31 = v26;
    v21 = &selRef_isOTAPurchased;
    v40 = sub_1A906436C(v31, v30, &v41);
    sub_1A93F8AA8();
    swift_unknownObjectRelease_n();
    a3 = v28;
    a2 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A904E000, v18, (os_log_type_t)v38, "%s Sending start request for asset: %{private,mask.hash}s", (uint8_t *)v22, 0x20u);
    v32 = v39;
    swift_arrayDestroy();
    MEMORY[0x1AF41411C](v32, -1, -1);
    MEMORY[0x1AF41411C](v22, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_1A93E7368((uint64_t)a1);
  objc_msgSend(a1, sel_register);
  v33 = objc_msgSend(a1, v21[455]);
  v34 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v35 = (_QWORD *)swift_allocObject();
  v35[2] = v34;
  v35[3] = a2;
  v35[4] = a3;
  v35[5] = a1;
  swift_unknownObjectRetain();
  swift_retain();
  sub_1A90858C0(a2);
  sub_1A93E7CEC(v33, (uint64_t)sub_1A93E9CDC, (uint64_t)v35);

  swift_release();
  return swift_release();
}

void FairPlayKeyLoader.renewKeyRequest(asset:completion:)(char *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  char *v22;
  void (*v23)(void);
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t aBlock[6];
  uint64_t v40;

  v4 = v3;
  v38 = a3;
  v7 = sub_1A93F7D58();
  v37 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1A93F7DB8();
  v35 = *(_QWORD *)(v10 - 8);
  v36 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1A93F726C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend(*(id *)&a1[OBJC_IVAR___PFFairPlayAsset_avAsset], sel_URL, v15);
  sub_1A93F7200();

  LOBYTE(v18) = sub_1A93F7140();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  if ((v18 & 1) != 0)
  {
    v19 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = v19;
    v20[3] = a2;
    v20[4] = v38;
    v20[5] = a1;
    aBlock[4] = (uint64_t)sub_1A93E99B4;
    aBlock[5] = (uint64_t)v20;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1A908A91C;
    aBlock[3] = (uint64_t)&block_descriptor_17_7;
    v21 = _Block_copy(aBlock);
    swift_retain();
    sub_1A90858C0(a2);
    v22 = a1;
    sub_1A93F7D88();
    v40 = MEMORY[0x1E0DEE9D8];
    sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
    sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
    sub_1A93F8B5C();
    MEMORY[0x1AF412598](0, v12, v9, v21);
    _Block_release(v21);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v7);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v36);
    swift_release();
    swift_release();
    return;
  }
  v23 = (void (*)(void))a2;
  if (qword_1ED2A8890 != -1)
    swift_once();
  v24 = sub_1A93F7698();
  __swift_project_value_buffer(v24, (uint64_t)qword_1ED2A8878);
  v25 = v4;
  v26 = sub_1A93F7674();
  v27 = sub_1A93F879C();
  if (!os_log_type_enabled(v26, v27))
  {

    if (!v23)
      return;
    goto LABEL_9;
  }
  v28 = (uint8_t *)swift_slowAlloc();
  v29 = swift_slowAlloc();
  aBlock[0] = v29;
  *(_DWORD *)v28 = 136315138;
  v30 = sub_1A93E40DC();
  v40 = sub_1A906436C(v30, v31, aBlock);
  sub_1A93F8AA8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1A904E000, v26, v27, "%s Unsupported operation, attempting to renew a non-offline asset.", v28, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1AF41411C](v29, -1, -1);
  MEMORY[0x1AF41411C](v28, -1, -1);

  if (v23)
  {
LABEL_9:
    sub_1A938C9EC();
    v32 = (void *)swift_allocError();
    *v33 = 6;
    v23();

  }
}

void sub_1A93E4DA8(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE *v14;
  void *v15;

  v7 = a1 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x1AF41420C](v7);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (_QWORD *)(v8 + OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider);
    v11 = v10[3];
    v12 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v11);
    v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 8))(a4, v11, v12);
    objc_msgSend(v15, sel_setBypassCache_, 1);
    sub_1A93E4EF8(v15, (uint64_t)a2, a3);
    swift_unknownObjectRelease();

  }
  else if (a2)
  {
    sub_1A938C9EC();
    v13 = (void *)swift_allocError();
    *v14 = 1;
    a2();

  }
}

uint64_t sub_1A93E4EF8(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  char *v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD v32[2];
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v7 = sub_1A93F7E18();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (_QWORD *)((char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)&v3[OBJC_IVAR___PFFairPlayKeyLoader_internalQueue];
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v8 + 104))(v11, *MEMORY[0x1E0DEF740], v7, v9);
  v13 = v12;
  v14 = sub_1A93F7E3C();
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v11, v7);
  if ((v14 & 1) != 0)
  {
    if (qword_1ED2A8890 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v15 = sub_1A93F7698();
  __swift_project_value_buffer(v15, (uint64_t)qword_1ED2A8878);
  v16 = v3;
  swift_unknownObjectRetain_n();
  v17 = v16;
  v18 = sub_1A93F7674();
  v19 = sub_1A93F8790();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v34 = swift_slowAlloc();
    v36 = v34;
    *(_DWORD *)v21 = 136315651;
    v33 = v20;
    v22 = sub_1A93E40DC();
    v35 = sub_1A906436C(v22, v23, &v36);
    sub_1A93F8AA8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2160;
    v35 = 1752392040;
    sub_1A93F8AA8();
    *(_WORD *)(v21 + 22) = 2081;
    v32[1] = v21 + 24;
    v24 = objc_msgSend(a1, sel_asset);
    v25 = FairPlayAsset.description.getter();
    v26 = a2;
    v27 = a3;
    v29 = v28;

    v35 = sub_1A906436C(v25, v29, &v36);
    sub_1A93F8AA8();
    swift_unknownObjectRelease_n();
    a3 = v27;
    a2 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A904E000, v18, (os_log_type_t)v33, "%s Sending renew request for asset: %{private,mask.hash}s.", (uint8_t *)v21, 0x20u);
    v30 = v34;
    swift_arrayDestroy();
    MEMORY[0x1AF41411C](v30, -1, -1);
    MEMORY[0x1AF41411C](v21, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  return sub_1A93E44BC(a1, a2, a3);
}

uint64_t FairPlayKeyLoader.renewKeyRequests(assets:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = sub_1A93F7D58();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v21 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1A93F7DB8();
  v12 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v4 + OBJC_IVAR___PFFairPlayKeyLoader_internalQueue);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a1;
  aBlock[4] = sub_1A93E99CC;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_24_6;
  v17 = _Block_copy(aBlock);
  swift_retain();
  sub_1A90858C0(a2);
  swift_bridgeObjectRetain();
  sub_1A93F7D88();
  v22 = MEMORY[0x1E0DEE9D8];
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, v9, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
  sub_1A93F8B5C();
  MEMORY[0x1AF412598](0, v14, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  swift_release();
  return swift_release();
}

uint64_t sub_1A93E5508(uint64_t a1, void (*a2)(_QWORD, _QWORD), uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  void *v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  _BOOL4 v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  _BYTE *v36;
  _QWORD *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  void *v48;
  _QWORD *v49;
  char *v50;
  id v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  void (*v64)(_QWORD, _QWORD);
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t aBlock[6];

  v73 = a4;
  v7 = sub_1A93F7D58();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1A93F7DB8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = MEMORY[0x1AF41420C](a1 + 16);
  if (result)
  {
    v16 = (void *)result;
    v64 = a2;
    v65 = a3;
    v66 = v14;
    v67 = v12;
    if (qword_1ED2A8890 != -1)
      swift_once();
    v17 = sub_1A93F7698();
    __swift_project_value_buffer(v17, (uint64_t)qword_1ED2A8878);
    v18 = v16;
    v19 = v73;
    swift_bridgeObjectRetain_n();
    v20 = v18;
    v21 = sub_1A93F7674();
    LOBYTE(v22) = sub_1A93F87B4();
    v23 = os_log_type_enabled(v21, (os_log_type_t)v22);
    v24 = v19 >> 62;
    v71 = v7;
    v72 = v20;
    v69 = v10;
    v70 = v8;
    v68 = v11;
    if (!v23)
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_24;
    }
    v25 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    aBlock[0] = v8;
    *(_DWORD *)v25 = 136315651;
    v63 = v19 >> 62;
    v26 = sub_1A93E40DC();
    v74 = sub_1A906436C(v26, v27, aBlock);
    sub_1A93F8AA8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2160;
    v74 = 1752392040;
    sub_1A93F8AA8();
    *(_WORD *)(v25 + 22) = 2081;
    if (v63)
      goto LABEL_36;
    v28 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      v29 = MEMORY[0x1E0DEE9D8];
      if (v28)
      {
        v74 = MEMORY[0x1E0DEE9D8];
        result = sub_1A929E454(0, v28 & ~(v28 >> 63), 0);
        if (v28 < 0)
        {
          __break(1u);
          return result;
        }
        v62 = v8;
        v29 = v74;
        if ((v19 & 0xC000000000000001) != 0)
        {
          for (i = 0; i != v28; ++i)
          {
            v31 = *(_QWORD *)(MEMORY[0x1AF4129DC](i, v73) + OBJC_IVAR___PFFairPlayAsset_adamID);
            swift_unknownObjectRelease();
            v74 = v29;
            v33 = *(_QWORD *)(v29 + 16);
            v32 = *(_QWORD *)(v29 + 24);
            if (v33 >= v32 >> 1)
            {
              sub_1A929E454(v32 > 1, v33 + 1, 1);
              v29 = v74;
            }
            *(_QWORD *)(v29 + 16) = v33 + 1;
            *(_QWORD *)(v29 + 8 * v33 + 32) = v31;
          }
        }
        else
        {
          v37 = (_QWORD *)(v19 + 32);
          v38 = *(_QWORD *)(v74 + 16);
          do
          {
            v39 = *(_QWORD *)(*v37 + OBJC_IVAR___PFFairPlayAsset_adamID);
            v74 = v29;
            v40 = *(_QWORD *)(v29 + 24);
            if (v38 >= v40 >> 1)
            {
              sub_1A929E454(v40 > 1, v38 + 1, 1);
              v29 = v74;
            }
            *(_QWORD *)(v29 + 16) = v38 + 1;
            *(_QWORD *)(v29 + 8 * v38 + 32) = v39;
            ++v37;
            ++v38;
            --v28;
          }
          while (v28);
        }
        v19 = v73;
        v8 = v62;
      }
      v41 = MEMORY[0x1AF412034](v29, MEMORY[0x1E0DEDC60]);
      v43 = v42;
      swift_bridgeObjectRelease();
      v74 = sub_1A906436C(v41, v43, aBlock);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A904E000, v21, (os_log_type_t)v22, "%s Beginning renewals for adamIDs: %{private,mask.hash}s", (uint8_t *)v25, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v8, -1, -1);
      MEMORY[0x1AF41411C](v25, -1, -1);

      v24 = v63;
LABEL_24:
      v25 = (uint64_t)dispatch_group_create();
      v22 = swift_allocObject();
      *(_QWORD *)(v22 + 16) = sub_1A91130A8(MEMORY[0x1E0DEE9D8]);
      if (v24)
      {
        swift_bridgeObjectRetain();
        v44 = sub_1A93F8E5C();
        if (!v44)
          goto LABEL_33;
      }
      else
      {
        v44 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v44)
          goto LABEL_33;
      }
      if (v44 >= 1)
      {
        v45 = 0;
        v46 = v19 & 0xC000000000000001;
        do
        {
          if (v46)
            v47 = (id)MEMORY[0x1AF4129DC](v45, v19);
          else
            v47 = *(id *)(v19 + 8 * v45 + 32);
          v48 = v47;
          ++v45;
          dispatch_group_enter((dispatch_group_t)v25);
          v49 = (_QWORD *)swift_allocObject();
          v49[2] = v22;
          v49[3] = v48;
          v49[4] = v25;
          swift_retain();
          v50 = v48;
          v51 = (id)v25;
          FairPlayKeyLoader.renewKeyRequest(asset:completion:)(v50, (uint64_t)sub_1A93E9C64, (uint64_t)v49);

          swift_release();
          v19 = v73;
        }
        while (v44 != v45);
LABEL_33:
        swift_bridgeObjectRelease();
        v52 = v72;
        v53 = (_QWORD *)swift_allocObject();
        v53[2] = v52;
        v53[3] = v22;
        v55 = (uint64_t)v64;
        v54 = v65;
        v53[4] = v64;
        v53[5] = v54;
        aBlock[4] = (uint64_t)sub_1A93E9C7C;
        aBlock[5] = (uint64_t)v53;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1A908A91C;
        aBlock[3] = (uint64_t)&block_descriptor_78_1;
        v56 = _Block_copy(aBlock);
        v57 = v52;
        swift_retain();
        sub_1A90858C0(v55);
        v58 = v66;
        sub_1A93F7D88();
        v74 = MEMORY[0x1E0DEE9D8];
        sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
        sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
        v59 = v69;
        v60 = v71;
        sub_1A93F8B5C();
        sub_1A93F87FC();
        _Block_release(v56);

        (*(void (**)(char *, uint64_t))(v70 + 8))(v59, v60);
        (*(void (**)(char *, uint64_t))(v67 + 8))(v58, v68);

        swift_release();
        return swift_release();
      }
      __break(1u);
LABEL_36:
      swift_bridgeObjectRetain();
      v28 = sub_1A93F8E5C();
      swift_bridgeObjectRelease();
    }
  }
  if (a2)
  {
    v34 = sub_1A91130A8(MEMORY[0x1E0DEE9D8]);
    sub_1A938C9EC();
    v35 = (void *)swift_allocError();
    *v36 = 1;
    a2(v34, v35);

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1A93E5C80(void *a1, uint64_t a2, void *a3, dispatch_group_t group)
{
  id v8;
  id v9;
  id v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;

  if (a1)
  {
    swift_beginAccess();
    v8 = a1;
    v9 = a1;
    v10 = a3;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = 0x8000000000000000;
    sub_1A930FC60((uint64_t)a1, v10, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(a2 + 16) = v12;

    swift_bridgeObjectRelease();
    swift_endAccess();

  }
  dispatch_group_leave(group);
}

void sub_1A93E5D4C(void *a1, uint64_t a2, void (*a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD);
  uint64_t v21[3];

  if (qword_1ED2A8890 != -1)
    swift_once();
  v5 = sub_1A93F7698();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED2A8878);
  v6 = a1;
  swift_retain_n();
  v7 = v6;
  v8 = sub_1A93F7674();
  v9 = sub_1A93F87B4();
  if (!os_log_type_enabled(v8, v9))
  {

    swift_release_n();
    if (!a3)
      return;
    goto LABEL_7;
  }
  v10 = swift_slowAlloc();
  v11 = swift_slowAlloc();
  v21[0] = v11;
  *(_DWORD *)v10 = 136315651;
  v20 = a3;
  v12 = sub_1A93E40DC();
  sub_1A906436C(v12, v13, v21);
  sub_1A93F8AA8();

  swift_bridgeObjectRelease();
  *(_WORD *)(v10 + 12) = 2160;
  sub_1A93F8AA8();
  *(_WORD *)(v10 + 22) = 2081;
  swift_beginAccess();
  v14 = swift_bridgeObjectRetain();
  v15 = sub_1A93E3680(v14);
  swift_bridgeObjectRelease();
  v16 = MEMORY[0x1AF412034](v15, MEMORY[0x1E0DEDC60]);
  v18 = v17;
  swift_bridgeObjectRelease();
  sub_1A906436C(v16, v18, v21);
  sub_1A93F8AA8();
  swift_release_n();
  a3 = v20;
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1A904E000, v8, v9, "%s Completed renewals with errors for adamIDs: %{private,mask.hash}s", (uint8_t *)v10, 0x20u);
  swift_arrayDestroy();
  MEMORY[0x1AF41411C](v11, -1, -1);
  MEMORY[0x1AF41411C](v10, -1, -1);

  if (v20)
  {
LABEL_7:
    swift_beginAccess();
    v19 = swift_bridgeObjectRetain();
    a3(v19, 0);
    swift_bridgeObjectRelease();
  }
}

id FairPlayKeyLoader.renewKey(session:)(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  if (qword_1ED2A8890 != -1)
    swift_once();
  v3 = sub_1A93F7698();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED2A8878);
  v4 = v1;
  swift_unknownObjectRetain_n();
  v5 = v4;
  v6 = sub_1A93F7674();
  v7 = sub_1A93F87B4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v16 = v9;
    *(_DWORD *)v8 = 136315651;
    v10 = sub_1A93E40DC();
    sub_1A906436C(v10, v11, &v16);
    sub_1A93F8AA8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2160;
    sub_1A93F8AA8();
    *(_WORD *)(v8 + 22) = 2081;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0938);
    v12 = sub_1A93F8094();
    v15 = sub_1A906436C(v12, v13, &v16);
    sub_1A93F8AA8();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A904E000, v6, v7, "%s Renewing keys for session: %{private,mask.hash}s.", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AF41411C](v9, -1, -1);
    MEMORY[0x1AF41411C](v8, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  return objc_msgSend(a1, sel_renewKey, v15, v16);
}

void FairPlayKeyLoader.stopKeyRequest(asset:completion:)(char *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  char *v17;
  id v18;
  void (*v19)(void);
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  char *v31;
  void *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t aBlock[6];

  v4 = v3;
  v38 = a3;
  v7 = sub_1A93F7D58();
  v37 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1A93F7DB8();
  v35 = *(_QWORD *)(v10 - 8);
  v36 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1A93F726C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend(*(id *)&a1[OBJC_IVAR___PFFairPlayAsset_avAsset], sel_URL, v15);
  sub_1A93F7200();

  LOBYTE(v18) = sub_1A93F7140();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  if ((v18 & 1) == 0)
  {
    v28 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = v28;
    v29[3] = a2;
    v29[4] = v38;
    v29[5] = a1;
    aBlock[4] = (uint64_t)sub_1A93E9A18;
    aBlock[5] = (uint64_t)v29;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1A908A91C;
    aBlock[3] = (uint64_t)&block_descriptor_31_4;
    v30 = _Block_copy(aBlock);
    swift_retain();
    sub_1A90858C0(a2);
    v31 = a1;
    sub_1A93F7D88();
    v39 = MEMORY[0x1E0DEE9D8];
    sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
    sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
    sub_1A93F8B5C();
    MEMORY[0x1AF412598](0, v12, v9, v30);
    _Block_release(v30);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v7);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v36);
    swift_release();
    swift_release();
    return;
  }
  v19 = (void (*)(void))a2;
  if (qword_1ED2A8890 != -1)
    swift_once();
  v20 = sub_1A93F7698();
  __swift_project_value_buffer(v20, (uint64_t)qword_1ED2A8878);
  v21 = v4;
  v22 = sub_1A93F7674();
  v23 = sub_1A93F879C();
  if (!os_log_type_enabled(v22, v23))
  {

    if (!v19)
      return;
    goto LABEL_9;
  }
  v24 = (uint8_t *)swift_slowAlloc();
  v25 = swift_slowAlloc();
  aBlock[0] = v25;
  *(_DWORD *)v24 = 136315138;
  v26 = sub_1A93E40DC();
  v39 = sub_1A906436C(v26, v27, aBlock);
  sub_1A93F8AA8();

  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  MEMORY[0x1AF41411C](v25, -1, -1);
  MEMORY[0x1AF41411C](v24, -1, -1);

  if (v19)
  {
LABEL_9:
    sub_1A938C9EC();
    v32 = (void *)swift_allocError();
    *v33 = 6;
    v19();

  }
}

void sub_1A93E67F4(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BYTE *v15;

  v7 = a1 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x1AF41420C](v7);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (_QWORD *)(v8 + OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider);
    v11 = v10[3];
    v12 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v11);
    v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 8))(a4, v11, v12);
    sub_1A93E6930(v13, (uint64_t)a2, a3);
    swift_unknownObjectRelease();

  }
  else if (a2)
  {
    sub_1A938C9EC();
    v14 = (void *)swift_allocError();
    *v15 = 1;
    a2();

  }
}

void sub_1A93E6930(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  char *v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t aBlock[6];

  v7 = sub_1A93F7E18();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (uint64_t *)((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)&v3[OBJC_IVAR___PFFairPlayKeyLoader_internalQueue];
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v8 + 104))(v11, *MEMORY[0x1E0DEF740], v7, v9);
  v13 = v12;
  v14 = sub_1A93F7E3C();
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v11, v7);
  if ((v14 & 1) != 0)
  {
    if (qword_1ED2A8890 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v15 = sub_1A93F7698();
  __swift_project_value_buffer(v15, (uint64_t)qword_1ED2A8878);
  v16 = v3;
  swift_unknownObjectRetain_n();
  v17 = v16;
  v18 = sub_1A93F7674();
  v19 = sub_1A93F8790();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v38 = swift_slowAlloc();
    aBlock[0] = v38;
    *(_DWORD *)v21 = 136315651;
    v22 = sub_1A93E40DC();
    v39 = sub_1A906436C(v22, v23, aBlock);
    sub_1A93F8AA8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2160;
    v39 = 1752392040;
    sub_1A93F8AA8();
    *(_WORD *)(v21 + 22) = 2081;
    v37 = v21 + 24;
    v24 = objc_msgSend(a1, sel_asset);
    v25 = a2;
    v26 = a3;
    v27 = a1;
    v28 = FairPlayAsset.description.getter();
    HIDWORD(v36) = v20;
    v30 = v29;

    v31 = v28;
    a1 = v27;
    a3 = v26;
    a2 = v25;
    v39 = sub_1A906436C(v31, v30, aBlock);
    sub_1A93F8AA8();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A904E000, v18, BYTE4(v36), "%s Sending stop request for asset: %{private,mask.hash}s.", (uint8_t *)v21, 0x20u);
    v32 = v38;
    swift_arrayDestroy();
    MEMORY[0x1AF41411C](v32, -1, -1);
    MEMORY[0x1AF41411C](v21, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  v33 = (_QWORD *)swift_allocObject();
  v33[2] = v17;
  v33[3] = a2;
  v33[4] = a3;
  aBlock[4] = (uint64_t)sub_1A93E9C00;
  aBlock[5] = (uint64_t)v33;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A90BF160;
  aBlock[3] = (uint64_t)&block_descriptor_66_4;
  v34 = _Block_copy(aBlock);
  v35 = v17;
  sub_1A90858C0(a2);
  swift_release();
  objc_msgSend(a1, sel_stopAndInvalidateKeysWithCompletion_, v34);
  _Block_release(v34);
}

void FairPlayKeyLoader.stopKeyRequest(session:completion:)(void *a1, void (*a2)(void), uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void (*v32)(void);
  void *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(void);
  uint64_t v40;
  uint64_t aBlock[6];

  v4 = v3;
  v38 = a3;
  v39 = a2;
  v6 = sub_1A93F7D58();
  v37 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1A93F7DB8();
  v35 = *(_QWORD *)(v9 - 8);
  v36 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A93F726C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (char *)objc_msgSend(a1, sel_asset, v14);
  v18 = objc_msgSend(*(id *)&v17[OBJC_IVAR___PFFairPlayAsset_avAsset], sel_URL);
  sub_1A93F7200();

  LOBYTE(v18) = sub_1A93F7140();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);

  if ((v18 & 1) != 0)
  {
    if (qword_1ED2A8890 != -1)
      swift_once();
    v19 = sub_1A93F7698();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED2A8878);
    v20 = v4;
    v21 = sub_1A93F7674();
    v22 = sub_1A93F879C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      aBlock[0] = v24;
      *(_DWORD *)v23 = 136315138;
      v25 = sub_1A93E40DC();
      v40 = sub_1A906436C(v25, v26, aBlock);
      sub_1A93F8AA8();

      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v24, -1, -1);
      MEMORY[0x1AF41411C](v23, -1, -1);

    }
    else
    {

    }
    v32 = v39;
    if (v39)
    {
      sub_1A938C9EC();
      v33 = (void *)swift_allocError();
      *v34 = 6;
      v32();

    }
  }
  else
  {
    v27 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v28 = (_QWORD *)swift_allocObject();
    v29 = v38;
    v30 = (uint64_t)v39;
    v28[2] = v27;
    v28[3] = v30;
    v28[4] = v29;
    v28[5] = a1;
    aBlock[4] = (uint64_t)sub_1A93E9A30;
    aBlock[5] = (uint64_t)v28;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1A908A91C;
    aBlock[3] = (uint64_t)&block_descriptor_38_3;
    v31 = _Block_copy(aBlock);
    swift_retain();
    sub_1A90858C0(v30);
    swift_unknownObjectRetain();
    sub_1A93F7D88();
    v40 = MEMORY[0x1E0DEE9D8];
    sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
    sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
    sub_1A93F8B5C();
    MEMORY[0x1AF412598](0, v11, v8, v31);
    _Block_release(v31);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v36);
    swift_release();
    swift_release();
  }
}

void sub_1A93E720C(uint64_t a1, void (*a2)(void), uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BYTE *v11;

  v7 = a1 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x1AF41420C](v7);
  if (v8)
  {
    v9 = (void *)v8;
    sub_1A93E6930(a4, (uint64_t)a2, a3);

  }
  else if (a2)
  {
    sub_1A938C9EC();
    v10 = (void *)swift_allocError();
    *v11 = 1;
    a2();

  }
}

uint64_t sub_1A93E7368(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v2 = sub_1A93F7D58();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v16 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1A93F7DB8();
  v6 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1A93E8C40();
  v10 = swift_allocObject();
  swift_weakInit();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = a1;
  aBlock[4] = sub_1A93E9F0C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_129;
  v12 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  sub_1A93F7D88();
  v17 = MEMORY[0x1E0DEE9D8];
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, v3, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
  sub_1A93F8B5C();
  MEMORY[0x1AF412598](0, v8, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  swift_release();
  return swift_release();
}

void sub_1A93E7590(void *a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(void), uint64_t a6, void *a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  _BYTE *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v14 = sub_1A93F7E18();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (_QWORD *)((char *)&aBlock[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v18 = MEMORY[0x1AF41420C](a4 + 16);
  if (v18)
  {
    v19 = (void *)v18;
    v34 = a6;
    v20 = *(void **)(v18 + OBJC_IVAR___PFFairPlayKeyLoader_internalQueue);
    *v17 = v20;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x1E0DEF740], v14);
    v21 = v20;
    LOBYTE(v20) = sub_1A93F7E3C();
    (*(void (**)(_QWORD *, uint64_t))(v15 + 8))(v17, v14);
    if ((v20 & 1) != 0)
    {
      if ((a3 & 1) != 0)
      {
        swift_retain();
        sub_1A93E9DB0(a1, a2, 1);
        v29 = objc_msgSend(a7, sel_id);
        v30 = sub_1A93F8040();
        v32 = v31;

        sub_1A93E7B30(v30, v32);
        swift_release();
        swift_bridgeObjectRelease();
        if (a5)
        {
          v33 = a1;
          ((void (*)(void *))a5)(a1);
          sub_1A93E9DC0(a1, a2, 1);

          sub_1A93E9DC0(a1, a2, 1);
        }
        else
        {
          sub_1A93E9DC0(a1, a2, 1);

        }
      }
      else
      {
        v22 = (void *)sub_1A93F8010();
        v23 = (_QWORD *)swift_allocObject();
        v23[2] = v19;
        v23[3] = a7;
        v24 = v34;
        v23[4] = a5;
        v23[5] = v24;
        aBlock[4] = sub_1A93E9E24;
        aBlock[5] = v23;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1A90BF160;
        aBlock[3] = &block_descriptor_107;
        v25 = _Block_copy(aBlock);
        v26 = v19;
        swift_unknownObjectRetain();
        sub_1A90858C0((uint64_t)a5);
        swift_release();
        objc_msgSend(a7, sel_processKeyWith_completion_, v22, v25);

        _Block_release(v25);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else if (a5)
  {
    sub_1A938C9EC();
    v27 = (void *)swift_allocError();
    *v28 = 1;
    a5();

  }
}

uint64_t sub_1A93E7874(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v10 = sub_1A93F7D58();
  v23 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1A93F7DB8();
  v13 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)&a2[OBJC_IVAR___PFFairPlayKeyLoader_internalQueue];
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  v16[6] = a1;
  aBlock[4] = sub_1A93E9E74;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_113;
  v17 = _Block_copy(aBlock);
  v18 = a2;
  swift_unknownObjectRetain();
  sub_1A90858C0(a4);
  v19 = a1;
  sub_1A93F7D88();
  v24 = MEMORY[0x1E0DEE9D8];
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
  sub_1A93F8B5C();
  MEMORY[0x1AF412598](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v22);
  return swift_release();
}

uint64_t sub_1A93E7A94(int a1, id a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t a5)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v7 = objc_msgSend(a2, sel_id);
  v8 = sub_1A93F8040();
  v10 = v9;

  sub_1A93E7B30(v8, v10);
  result = swift_bridgeObjectRelease();
  if (a3)
    return a3(a5);
  return result;
}

uint64_t sub_1A93E7B30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v17 = sub_1A93F7DB8();
  v4 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1A93F7D58();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1A93E8C40();
  sub_1A93F7D4C();
  v12 = swift_allocObject();
  swift_weakInit();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_1A93E9ED4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_122;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1A93F7D88();
  MEMORY[0x1AF412598](0, v6, v10, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  return swift_release();
}

void sub_1A93E7CEC(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  id v8;
  id v9;
  char *v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint64_t aBlock[6];

  if (qword_1ED2A8890 != -1)
    swift_once();
  v7 = sub_1A93F7698();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ED2A8878);
  v8 = v3;
  v9 = a1;
  v10 = (char *)v8;
  v11 = (char *)v9;
  v12 = sub_1A93F7674();
  v13 = sub_1A93F8790();
  if (os_log_type_enabled(v12, v13))
  {
    v27 = a2;
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136315651;
    v16 = sub_1A93E40DC();
    sub_1A906436C(v16, v17, aBlock);
    sub_1A93F8AA8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2160;
    sub_1A93F8AA8();
    *(_WORD *)(v14 + 22) = 2081;
    v18 = FairPlayAsset.description.getter();
    sub_1A906436C(v18, v19, aBlock);
    sub_1A93F8AA8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A904E000, v12, v13, "%s Fetching key identifier for: %{private,mask.hash}s.", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AF41411C](v15, -1, -1);
    v20 = v14;
    a2 = v27;
    MEMORY[0x1AF41411C](v20, -1, -1);

  }
  else
  {

  }
  v21 = *(void **)&v10[OBJC_IVAR___PFFairPlayKeyLoader_metadataLoader];
  v22 = *(_QWORD *)&v11[OBJC_IVAR___PFFairPlayAsset_avAsset];
  v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = v23;
  v24[3] = a2;
  v24[4] = a3;
  v24[5] = v11;
  aBlock[4] = (uint64_t)sub_1A93E9D20;
  aBlock[5] = (uint64_t)v24;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A926CB6C;
  aBlock[3] = (uint64_t)&block_descriptor_89_1;
  v25 = _Block_copy(aBlock);
  v26 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v21, sel_keyIdentifiersFrom_completion_, v22, v25);
  _Block_release(v25);
}

void sub_1A93E7FFC(id a1, void *a2, void (*a3)(id))
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;

  if (a1)
  {
    v6 = a1;
    if (qword_1ED2A8890 != -1)
      swift_once();
    v7 = sub_1A93F7698();
    __swift_project_value_buffer(v7, (uint64_t)qword_1ED2A8878);
    v8 = a2;
    v9 = a1;
    v10 = v8;
    v11 = a1;
    v12 = sub_1A93F7674();
    v13 = sub_1A93F879C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v28 = v15;
      *(_DWORD *)v14 = 136315394;
      v16 = sub_1A93E40DC();
      sub_1A906436C(v16, v17, &v28);
      sub_1A93F8AA8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      swift_getErrorValue();
      v18 = sub_1A93F927C();
      sub_1A906436C(v18, v19, &v28);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1A904E000, v12, v13, "%s Failed to stop and/or invalidate with error: %s.", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v15, -1, -1);
      MEMORY[0x1AF41411C](v14, -1, -1);

      if (!a3)
        return;
    }
    else
    {

      if (!a3)
        return;
    }
  }
  else
  {
    if (qword_1ED2A8890 != -1)
      swift_once();
    v20 = sub_1A93F7698();
    __swift_project_value_buffer(v20, (uint64_t)qword_1ED2A8878);
    v21 = a2;
    v22 = sub_1A93F7674();
    v23 = sub_1A93F87B4();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v28 = v25;
      *(_DWORD *)v24 = 136315138;
      v26 = sub_1A93E40DC();
      sub_1A906436C(v26, v27, &v28);
      sub_1A93F8AA8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A904E000, v22, v23, "%s Session stopped successfully.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v25, -1, -1);
      MEMORY[0x1AF41411C](v24, -1, -1);

      if (!a3)
        return;
    }
    else
    {

      if (!a3)
        return;
    }
  }
  a3(a1);
}

void sub_1A93E83E4(_QWORD *a1, uint64_t a2, void (*a3)(void *, _QWORD, uint64_t), uint64_t a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  char *v54;
  char *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t aBlock;
  uint64_t v74;
  uint64_t (*v75)(uint64_t);
  void *v76;
  void *v77;
  _QWORD *v78;

  v10 = sub_1A93F7D58();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1A93F7DB8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v71 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v17 = MEMORY[0x1AF41420C](a2 + 16);
  if (v17)
  {
    v18 = (void *)v17;
    v69 = v11;
    v70 = v14;
    v67 = v15;
    v68 = v13;
    v66 = a4;
    if (a1 && a1[2])
    {
      v19 = a1[4];
      v63 = a1[5];
      v64 = v19;
      v20 = qword_1ED2A8890;
      swift_bridgeObjectRetain();
      if (v20 != -1)
        swift_once();
      v65 = v10;
      v21 = sub_1A93F7698();
      __swift_project_value_buffer(v21, (uint64_t)qword_1ED2A8878);
      v22 = v18;
      v23 = a5;
      v24 = v22;
      v25 = v23;
      v26 = sub_1A93F7674();
      v27 = sub_1A93F8790();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = swift_slowAlloc();
        v29 = swift_slowAlloc();
        aBlock = v29;
        *(_DWORD *)v28 = 136315651;
        v30 = sub_1A93E40DC();
        v72 = sub_1A906436C(v30, v31, &aBlock);
        sub_1A93F8AA8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2160;
        v72 = 1752392040;
        sub_1A93F8AA8();
        *(_WORD *)(v28 + 22) = 2081;
        v32 = FairPlayAsset.description.getter();
        v72 = sub_1A906436C(v32, v33, &aBlock);
        sub_1A93F8AA8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A904E000, v26, v27, "%s Loaded key identifier for: %{private,mask.hash}s.", (uint8_t *)v28, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1AF41411C](v29, -1, -1);
        MEMORY[0x1AF41411C](v28, -1, -1);

      }
      else
      {

      }
      v56 = (_QWORD *)swift_allocObject();
      v57 = v66;
      v56[2] = a3;
      v56[3] = v57;
      v58 = v63;
      v56[4] = v64;
      v56[5] = v58;
      v77 = sub_1A93E9D84;
      v78 = v56;
      aBlock = MEMORY[0x1E0C809B0];
      v74 = 1107296256;
      v75 = sub_1A908A91C;
      v76 = &block_descriptor_101;
      v59 = _Block_copy(&aBlock);
      swift_retain();
      v60 = v71;
      sub_1A93F7D88();
      v72 = MEMORY[0x1E0DEE9D8];
      sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
      sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
      v61 = v68;
      v62 = v65;
      sub_1A93F8B5C();
      MEMORY[0x1AF412598](0, v60, v61, v59);
      _Block_release(v59);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v61, v62);
      (*(void (**)(char *, uint64_t))(v67 + 8))(v60, v70);

    }
    else
    {
      if (qword_1ED2A8890 != -1)
        swift_once();
      v34 = sub_1A93F7698();
      __swift_project_value_buffer(v34, (uint64_t)qword_1ED2A8878);
      v35 = v18;
      v36 = a5;
      v37 = v35;
      v38 = v36;
      v39 = sub_1A93F7674();
      v40 = sub_1A93F8790();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = swift_slowAlloc();
        v65 = v10;
        v42 = v41;
        v43 = swift_slowAlloc();
        aBlock = v43;
        *(_DWORD *)v42 = 136315651;
        v44 = sub_1A93E40DC();
        v72 = sub_1A906436C(v44, v45, &aBlock);
        sub_1A93F8AA8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v42 + 12) = 2160;
        v72 = 1752392040;
        sub_1A93F8AA8();
        *(_WORD *)(v42 + 22) = 2081;
        v46 = FairPlayAsset.description.getter();
        v72 = sub_1A906436C(v46, v47, &aBlock);
        sub_1A93F8AA8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A904E000, v39, v40, "%s Missing key identifier for: %{private,mask.hash}s.", (uint8_t *)v42, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1AF41411C](v43, -1, -1);
        v48 = v42;
        v10 = v65;
        MEMORY[0x1AF41411C](v48, -1, -1);

      }
      else
      {

      }
      v51 = swift_allocObject();
      v52 = v66;
      *(_QWORD *)(v51 + 16) = a3;
      *(_QWORD *)(v51 + 24) = v52;
      v77 = sub_1A93E9D50;
      v78 = (_QWORD *)v51;
      aBlock = MEMORY[0x1E0C809B0];
      v74 = 1107296256;
      v75 = sub_1A908A91C;
      v76 = &block_descriptor_95_0;
      v53 = _Block_copy(&aBlock);
      swift_retain();
      v54 = v71;
      sub_1A93F7D88();
      v72 = MEMORY[0x1E0DEE9D8];
      sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
      sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
      v55 = v68;
      sub_1A93F8B5C();
      MEMORY[0x1AF412598](0, v54, v55, v53);
      _Block_release(v53);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v55, v10);
      (*(void (**)(char *, uint64_t))(v67 + 8))(v54, v70);

    }
    swift_release();
  }
  else
  {
    sub_1A938C9EC();
    v49 = (void *)swift_allocError();
    *v50 = 1;
    a3(v49, 0, 1);

  }
}

void sub_1A93E8BAC(void (*a1)(void *, _QWORD, uint64_t))
{
  void *v2;
  _BYTE *v3;

  sub_1A938C9EC();
  v2 = (void *)swift_allocError();
  *v3 = 3;
  a1(v2, 0, 1);

}

id FairPlayKeyLoader.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1A93E8C40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v1 = v0;
  v2 = sub_1A93F885C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1A93F8808();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1A93F7DB8();
  MEMORY[0x1E0C80A78](v7);
  v8 = *(void **)(v0 + 40);
  if (v8)
  {
    v9 = *(id *)(v0 + 40);
  }
  else
  {
    v14[0] = sub_1A9066C6C();
    sub_1A93F7D94();
    v14[1] = MEMORY[0x1E0DEE9D8];
    sub_1A9066CA8((unint64_t *)&qword_1ED2AD3A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD380);
    sub_1A9066DB4((unint64_t *)&qword_1ED2AD390, (uint64_t *)&unk_1ED2AD380);
    sub_1A93F8B5C();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF8D0], v2);
    v10 = (void *)sub_1A93F888C();
    v11 = *(void **)(v0 + 40);
    *(_QWORD *)(v1 + 40) = v10;
    v9 = v10;

    v8 = 0;
  }
  v12 = v8;
  return v9;
}

uint64_t sub_1A93E8E24(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  char **v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[3];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = result;
    if (qword_1ED2A8890 != -1)
      swift_once();
    v5 = sub_1A93F7698();
    __swift_project_value_buffer(v5, (uint64_t)qword_1ED2A8878);
    swift_unknownObjectRetain_n();
    swift_retain_n();
    v6 = sub_1A93F7674();
    v7 = sub_1A93F8790();
    v8 = &selRef_isOTAPurchased;
    if (os_log_type_enabled(v6, v7))
    {
      v9 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v28[0] = v25;
      *(_DWORD *)v9 = 136315907;
      v10 = sub_1A93E91BC();
      sub_1A906436C(v10, v11, v28);
      sub_1A93F8AA8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      v12 = objc_msgSend(a2, sel_id);
      v13 = sub_1A93F8040();
      v15 = v14;

      sub_1A906436C(v13, v15, v28);
      sub_1A93F8AA8();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 22) = 2160;
      sub_1A93F8AA8();
      *(_WORD *)(v9 + 32) = 2081;
      v16 = objc_msgSend(a2, sel_asset);
      v17 = FairPlayAsset.description.getter();
      v19 = v18;

      v26 = sub_1A906436C(v17, v19, v28);
      v8 = &selRef_isOTAPurchased;
      sub_1A93F8AA8();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A904E000, v6, v7, "%s Adding session with id: %s, asset: %{private,mask.hash}s", (uint8_t *)v9, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v25, -1, -1);
      MEMORY[0x1AF41411C](v9, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_release_n();
    }
    v20 = objc_msgSend(a2, v8[412], v25, v26, v28[0]);
    v21 = sub_1A93F8040();
    v23 = v22;

    swift_beginAccess();
    swift_unknownObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v27 = *(_QWORD *)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0x8000000000000000;
    sub_1A930FDB0((uint64_t)a2, v21, v23, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v4 + 16) = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_release();
  }
  return result;
}

unint64_t sub_1A93E91BC()
{
  uint64_t v0;
  unint64_t v1;

  if (*(_QWORD *)(v0 + 32))
  {
    v1 = *(_QWORD *)(v0 + 24);
  }
  else
  {
    v1 = 0xD000000000000028;
    *(_QWORD *)(v0 + 24) = 0xD000000000000028;
    *(_QWORD *)(v0 + 32) = 0x80000001A9451E10;
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A93E9224(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13[3];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_1ED2A8890 != -1)
      swift_once();
    v6 = sub_1A93F7698();
    __swift_project_value_buffer(v6, (uint64_t)qword_1ED2A8878);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    v7 = sub_1A93F7674();
    v8 = sub_1A93F8790();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = swift_slowAlloc();
      v10 = swift_slowAlloc();
      v13[0] = v10;
      *(_DWORD *)v9 = 136315394;
      v11 = sub_1A93E91BC();
      sub_1A906436C(v11, v12, v13);
      sub_1A93F8AA8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1A906436C(a2, a3, v13);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A904E000, v7, v8, "%s Removing session with id: %s.", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v10, -1, -1);
      MEMORY[0x1AF41411C](v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    swift_beginAccess();
    sub_1A913112C(a2, a3);
    swift_endAccess();
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

PodcastsFoundation::FairPlayKeyLoadError_optional __swiftcall FairPlayKeyLoadError.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 7;
  if ((unint64_t)rawValue < 7)
    v2 = rawValue;
  *v1 = v2;
  return (PodcastsFoundation::FairPlayKeyLoadError_optional)rawValue;
}

uint64_t FairPlayKeyLoadError.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

PodcastsFoundation::FairPlayKeyLoadError_optional sub_1A93E94AC(Swift::Int *a1)
{
  return FairPlayKeyLoadError.init(rawValue:)(*a1);
}

uint64_t sub_1A93E94B4()
{
  sub_1A93E9B88();
  sub_1A9051AC0();
  return sub_1A93F92B8();
}

uint64_t sub_1A93E94FC(uint64_t a1)
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
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4)
    v7 = 4;
  v8 = v7 - 4;
  v9 = (unint64_t *)(a1 + 96);
  v2 = 192;
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

id sub_1A93E95AC(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *ObjectType;
  objc_super v28;
  uint64_t v29;
  uint64_t v30[5];

  v26 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  v10 = sub_1A93F885C();
  v24 = *(_QWORD *)(v10 - 8);
  v25 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1A93F8808();
  MEMORY[0x1E0C80A78](v13);
  v14 = sub_1A93F7DB8();
  MEMORY[0x1E0C80A78](v14);
  v30[3] = a5;
  v30[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_1, a2, a5);
  v16 = OBJC_IVAR___PFFairPlayKeyLoader_activeSessionStore;
  type metadata accessor for ActiveSessionStore();
  v17 = (_QWORD *)swift_allocObject();
  v18 = a3;
  v19 = MEMORY[0x1E0DEE9D8];
  v17[2] = sub_1A9067138(MEMORY[0x1E0DEE9D8]);
  v17[3] = 0;
  v17[4] = 0;
  v17[5] = 0;
  *(_QWORD *)&a3[v16] = v17;
  v20 = OBJC_IVAR___PFFairPlayKeyLoader_internalQueue;
  sub_1A9066C6C();
  sub_1A93F7D94();
  v29 = v19;
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD3A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD380);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD390, (uint64_t *)&unk_1ED2AD380);
  sub_1A93F8B5C();
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v12, *MEMORY[0x1E0DEF8D0], v25);
  *(_QWORD *)&v18[v20] = sub_1A93F888C();
  v21 = &v18[OBJC_IVAR___PFFairPlayKeyLoader____lazy_storage___logPrefix];
  *(_QWORD *)v21 = 0;
  *((_QWORD *)v21 + 1) = 0;
  *(_QWORD *)&v18[OBJC_IVAR___PFFairPlayKeyLoader_metadataLoader] = v26;
  sub_1A905DC3C((uint64_t)v30, (uint64_t)&v18[OBJC_IVAR___PFFairPlayKeyLoader_fairPlayKeySessionProvider]);
  swift_unknownObjectRetain();

  v28.receiver = v18;
  v28.super_class = ObjectType;
  v22 = objc_msgSendSuper2(&v28, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  return v22;
}

id sub_1A93E984C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  Class v14;
  char *v15;
  uint64_t v17;

  v11 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)objc_allocWithZone(v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, a5);
  return sub_1A93E95AC(a1, (uint64_t)v13, v15, a4, a5, a6);
}

uint64_t sub_1A93E98FC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A93E9920()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A93E995C()
{
  uint64_t *v0;

  return sub_1A93E3D7C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1A93E9968()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

void sub_1A93E99A4()
{
  uint64_t v0;

  sub_1A93E4448(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

void sub_1A93E99B4()
{
  uint64_t v0;

  sub_1A93E4DA8(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1A93E99C0()
{
  return objectdestroy_20Tm_0((void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

uint64_t sub_1A93E99CC()
{
  uint64_t v0;

  return sub_1A93E5508(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD, _QWORD))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();

  return swift_deallocObject();
}

void sub_1A93E9A18()
{
  uint64_t v0;

  sub_1A93E67F4(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1A93E9A24()
{
  return objectdestroy_20Tm_0((void (*)(_QWORD))MEMORY[0x1E0DEEEC0]);
}

void sub_1A93E9A30()
{
  uint64_t v0;

  sub_1A93E720C(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

unint64_t sub_1A93E9A40()
{
  unint64_t result;

  result = qword_1EEAC0940;
  if (!qword_1EEAC0940)
  {
    result = MEMORY[0x1AF414014](&protocol conformance descriptor for FairPlayKeyLoadError, &type metadata for FairPlayKeyLoadError);
    atomic_store(result, (unint64_t *)&qword_1EEAC0940);
  }
  return result;
}

uint64_t method lookup function for FairPlayKeyLoader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FairPlayKeyLoader.__allocating_init(metadataLoader:fairPlayKeySessionProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t storeEnumTagSinglePayload for FairPlayKeyLoadError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A93E9AE4 + 4 * byte_1A942A4D5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1A93E9B18 + 4 * asc_1A942A4D0[v4]))();
}

uint64_t sub_1A93E9B18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93E9B20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A93E9B28);
  return result;
}

uint64_t sub_1A93E9B34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A93E9B3CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1A93E9B40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93E9B48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FairPlayKeyLoadError()
{
  return &type metadata for FairPlayKeyLoadError;
}

uint64_t sub_1A93E9B64()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

unint64_t sub_1A93E9B88()
{
  unint64_t result;

  result = qword_1EEAC0968;
  if (!qword_1EEAC0968)
  {
    result = MEMORY[0x1AF414014](&protocol conformance descriptor for FairPlayKeyLoadError, &type metadata for FairPlayKeyLoadError);
    atomic_store(result, &qword_1EEAC0968);
  }
  return result;
}

uint64_t sub_1A93E9BCC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

void sub_1A93E9C00(void *a1)
{
  uint64_t v1;

  sub_1A93E7FFC(a1, *(void **)(v1 + 16), *(void (**)(id))(v1 + 24));
}

uint64_t sub_1A93E9C0C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A93E9C30()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1A93E9C64(void *a1)
{
  uint64_t v1;

  sub_1A93E5C80(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(dispatch_group_t *)(v1 + 32));
}

uint64_t sub_1A93E9C70()
{
  return objectdestroy_74Tm_0((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

void sub_1A93E9C7C()
{
  uint64_t v0;

  sub_1A93E5D4C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(_QWORD, _QWORD))(v0 + 32));
}

uint64_t sub_1A93E9C88()
{
  return objectdestroy_20Tm_0((void (*)(_QWORD))MEMORY[0x1E0DEEEC0]);
}

uint64_t objectdestroy_20Tm_0(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  if (*(_QWORD *)(v1 + 24))
    swift_release();
  a1(*(_QWORD *)(v1 + 40));
  return swift_deallocObject();
}

void sub_1A93E9CDC(void *a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_1A93E7590(a1, a2, a3 & 1, *(_QWORD *)(v3 + 16), *(void (**)(void))(v3 + 24), *(_QWORD *)(v3 + 32), *(void **)(v3 + 40));
}

uint64_t sub_1A93E9CEC()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_1A93E9D20(_QWORD *a1)
{
  uint64_t v1;

  sub_1A93E83E4(a1, *(_QWORD *)(v1 + 16), *(void (**)(void *, _QWORD, uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_1A93E9D2C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1A93E9D50()
{
  uint64_t v0;

  sub_1A93E8BAC(*(void (**)(void *, _QWORD, uint64_t))(v0 + 16));
}

uint64_t sub_1A93E9D58()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A93E9D84()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), 0);
}

id sub_1A93E9DB0(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

void sub_1A93E9DC0(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_1A93E9DD0()
{
  return objectdestroy_74Tm_0((void (*)(_QWORD))MEMORY[0x1E0DEEEC0]);
}

uint64_t objectdestroy_74Tm_0(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 24));
  if (*(_QWORD *)(v1 + 32))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93E9E24(void *a1)
{
  uint64_t v1;

  return sub_1A93E7874(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_1A93E9E30()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A93E9E74()
{
  uint64_t v0;

  return sub_1A93E7A94(*(_QWORD *)(v0 + 16), *(id *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_1A93E9E84()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A93E9EA8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A93E9ED4()
{
  uint64_t v0;

  return sub_1A93E9224(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1A93E9EE0()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A93E9F0C()
{
  uint64_t v0;

  return sub_1A93E8E24(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t static ImageCacheDeleteStrategy.cacheDeleteLevels(for:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  char v2;

  v2 = 8 * (*(_BYTE *)(result + 32) + 1);
  *a2 = 0x201u >> v2;
  a2[1] = 0x2020101u >> v2;
  return result;
}

ValueMetadata *type metadata accessor for ImageCacheDeleteStrategy()
{
  return &type metadata for ImageCacheDeleteStrategy;
}

_QWORD *AssetReaderScoutingAligner.__allocating_init(asset:catalog:logger:)(void *a1, void *a2, uint64_t a3)
{
  _QWORD *v6;

  swift_allocObject();
  v6 = sub_1A93EE528(a1, (uint64_t)a2, a3);

  return v6;
}

_QWORD *AssetReaderScoutingAligner.init(asset:catalog:logger:)(void *a1, void *a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = sub_1A93EE528(a1, (uint64_t)a2, a3);

  return v5;
}

uint64_t sub_1A93EA054(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 64) = v3;
  *(double *)(v4 + 48) = a2;
  *(double *)(v4 + 56) = a3;
  *(double *)(v4 + 40) = a1;
  v5 = sub_1A93F7638();
  *(_QWORD *)(v4 + 72) = v5;
  *(_QWORD *)(v4 + 80) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 88) = swift_task_alloc();
  *(_QWORD *)(v4 + 96) = swift_task_alloc();
  v6 = sub_1A93F75FC();
  *(_QWORD *)(v4 + 104) = v6;
  *(_QWORD *)(v4 + 112) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  *(_QWORD *)(v4 + 136) = swift_task_alloc();
  *(_QWORD *)(v4 + 144) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A93EA11C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint8_t *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  _QWORD *v15;

  if (qword_1EEAB6DF0 != -1)
    swift_once();
  v1 = sub_1A93F762C();
  *(_QWORD *)(v0 + 152) = __swift_project_value_buffer(v1, (uint64_t)qword_1EEABA7C8);
  sub_1A93F7620();
  sub_1A93F75D8();
  v2 = sub_1A93F7620();
  v3 = sub_1A93F8940();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 136);
    v5 = *(_QWORD *)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 112);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v7(v4, *(_QWORD *)(v0 + 144), v5);
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    v9 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v2, v3, v9, "ScoutingAlignment", "", v8, 2u);
    MEMORY[0x1AF41411C](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 112);

    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  }
  *(_QWORD *)(v0 + 160) = v7;
  v11 = *(_QWORD *)(v0 + 144);
  v12 = *(_QWORD *)(v0 + 104);
  v13 = *(_QWORD *)(v0 + 112);
  v7(*(_QWORD *)(v0 + 136), v11, v12);
  sub_1A93F765C();
  swift_allocObject();
  *(_QWORD *)(v0 + 168) = sub_1A93F7650();
  v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  *(_QWORD *)(v0 + 176) = v14;
  v14(v11, v12);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v15;
  *v15 = v0;
  v15[1] = sub_1A93EA2E4;
  return sub_1A93EA70C(*(double *)(v0 + 40), *(double *)(v0 + 48), *(double *)(v0 + 56));
}

uint64_t sub_1A93EA2E4(double a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 16) = v2;
  *(double *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = v1;
  *(_QWORD *)(v3 + 192) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93EA354()
{
  uint64_t v0;
  _QWORD *v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  os_signpost_id_t v12;
  double v13;

  v1 = (_QWORD *)(v0 + 128);
  v2 = sub_1A93F7620();
  sub_1A93F7644();
  v3 = sub_1A93F8934();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 72);
    v6 = *(_QWORD *)(v0 + 80);
    swift_retain();
    sub_1A93F7668();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v6 + 88))(v4, v5) == *MEMORY[0x1E0DF2190])
    {
      v7 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
      v7 = "";
    }
    v1 = (_QWORD *)(v0 + 136);
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    v9 = *(_QWORD *)(v0 + 128);
    v10 = *(_QWORD *)(v0 + 104);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 160))(*(_QWORD *)(v0 + 136), v9, v10);
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    v12 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v2, v3, v12, "ScoutingAlignment", v7, v11, 2u);
    MEMORY[0x1AF41411C](v11, -1, -1);

    v8(v9, v10);
  }
  else
  {

  }
  v13 = *(double *)(v0 + 24);
  (*(void (**)(_QWORD, _QWORD))(v0 + 176))(*v1, *(_QWORD *)(v0 + 104));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(double))(v0 + 8))(v13);
}

uint64_t sub_1A93EA534()
{
  uint64_t v0;
  _QWORD *v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  os_signpost_id_t v12;

  v1 = (_QWORD *)(v0 + 120);
  v2 = sub_1A93F7620();
  sub_1A93F7644();
  v3 = sub_1A93F8934();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    v5 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 72);
    swift_retain();
    sub_1A93F7668();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6) == *MEMORY[0x1E0DF2190])
    {
      v7 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
      v7 = "";
    }
    v1 = (_QWORD *)(v0 + 136);
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    v9 = *(_QWORD *)(v0 + 120);
    v10 = *(_QWORD *)(v0 + 104);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 160))(*(_QWORD *)(v0 + 136), v9, v10);
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    v12 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v2, v3, v12, "ScoutingAlignment", v7, v11, 2u);
    MEMORY[0x1AF41411C](v11, -1, -1);

    v8(v9, v10);
  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 176))(*v1, *(_QWORD *)(v0 + 104));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93EA70C(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 280) = v3;
  *(double *)(v4 + 264) = a2;
  *(double *)(v4 + 272) = a3;
  *(double *)(v4 + 256) = a1;
  v5 = sub_1A93F7638();
  *(_QWORD *)(v4 + 288) = v5;
  *(_QWORD *)(v4 + 296) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 304) = swift_task_alloc();
  v6 = sub_1A93F75FC();
  *(_QWORD *)(v4 + 312) = v6;
  *(_QWORD *)(v4 + 320) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 328) = swift_task_alloc();
  *(_QWORD *)(v4 + 336) = swift_task_alloc();
  *(_QWORD *)(v4 + 344) = swift_task_alloc();
  *(_QWORD *)(v4 + 352) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A93EA7C4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  NSObject *v6;
  os_signpost_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint8_t *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t inited;
  uint64_t v22;
  uint64_t v23;
  double v24;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  os_log_type_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  char v41;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  NSObject *v46;
  os_signpost_type_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t *v60;
  os_signpost_id_t v61;
  NSObject *v62;
  os_signpost_type_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint8_t *v67;
  os_signpost_id_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  __int128 v75;

  *(_QWORD *)(v0 + 360) = OBJC_IVAR____TtC18PodcastsFoundation26AssetReaderScoutingAligner_logger;
  v1 = sub_1A93F7674();
  v2 = sub_1A93F87B4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 256);
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 134217984;
    *(_QWORD *)(v0 + 248) = v3;
    sub_1A93F8AA8();
    _os_log_impl(&dword_1A904E000, v1, v2, "Scouting: Beginning with initial guess for %f", v4, 0xCu);
    MEMORY[0x1AF41411C](v4, -1, -1);
  }

  if (qword_1EEAB6DF0 != -1)
LABEL_45:
    swift_once();
  v5 = sub_1A93F762C();
  *(_QWORD *)(v0 + 368) = __swift_project_value_buffer(v5, (uint64_t)qword_1EEABA7C8);
  sub_1A93F7620();
  sub_1A93F75D8();
  v6 = sub_1A93F7620();
  v7 = sub_1A93F8940();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    v8 = *(_QWORD *)(v0 + 344);
    v9 = *(_QWORD *)(v0 + 312);
    v10 = *(_QWORD *)(v0 + 320);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    v11(v8, *(_QWORD *)(v0 + 352), v9);
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    v13 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v6, v7, v13, "ScoutingAlignmentResolve", "", v12, 2u);
    MEMORY[0x1AF41411C](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 320);

    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  }
  v15 = (uint64_t *)(v0 + 136);
  *(_QWORD *)(v0 + 376) = v11;
  v16 = *(_QWORD *)(v0 + 352);
  v74 = (_QWORD *)(v0 + 144);
  v17 = *(_QWORD *)(v0 + 312);
  v18 = *(_QWORD *)(v0 + 320);
  v19 = *(_QWORD *)(v0 + 256);
  v11(*(_QWORD *)(v0 + 344), v16, v17);
  *(_QWORD *)(v0 + 384) = sub_1A93F765C();
  swift_allocObject();
  *(_QWORD *)(v0 + 392) = sub_1A93F7650();
  v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  *(_QWORD *)(v0 + 400) = v20;
  v20(v16, v17);
  *(_QWORD *)(v0 + 144) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAB7960);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 408) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1A9405520;
  *(_BYTE *)(inited + 32) = 0;
  *(_QWORD *)(inited + 40) = v19;
  v22 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(v0 + 128) = 0;
  *(_QWORD *)(v0 + 136) = inited;
  *(_QWORD *)(v0 + 112) = v22;
  *(_QWORD *)(v0 + 120) = 0;
  swift_beginAccess();
  swift_beginAccess();
  *(_DWORD *)(v0 + 448) = *MEMORY[0x1E0DF2190];
  v23 = *(_QWORD *)(inited + 16);
  while (1)
  {
    if (!v23)
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    *(_BYTE *)(v0 + 452) = *(_BYTE *)(inited + 32);
    v24 = *(double *)(inited + 40);
    *(double *)(v0 + 416) = v24;
    sub_1A9174404(0, 1);
    if (*(uint64_t *)(v0 + 120) >= 24)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v36 = *(_QWORD *)(v0 + 120);
      sub_1A93EE7C4();
      swift_allocError();
      v38 = *(_QWORD *)(v0 + 392);
      v39 = *(_QWORD *)(v0 + 280);
      v40 = *(double *)(v0 + 256);
      if (v36 < 24)
        v41 = 1;
      else
        v41 = 2;
      *v37 = v41;
      swift_willThrow();
      sub_1A93EC058(v40, v39, v38, v74);
      swift_release();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    if (v24 < *(double *)(v0 + 264) || v24 >= *(double *)(v0 + 272))
    {
      v26 = sub_1A93F7674();
      v27 = sub_1A93F87B4();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = swift_slowAlloc();
        *(_DWORD *)v28 = 134217984;
        *(double *)(v28 + 4) = v24;
        v29 = v26;
        v30 = v27;
        v31 = "Scouting: Skipping out of bounds %f";
LABEL_23:
        _os_log_impl(&dword_1A904E000, v29, v30, v31, (uint8_t *)v28, 0xCu);
        MEMORY[0x1AF41411C](v28, -1, -1);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
    if ((~*(_QWORD *)&v24 & 0x7FF0000000000000) == 0)
      goto LABEL_42;
    if (v24 <= -9.22337204e18)
      goto LABEL_43;
    if (v24 >= 9.22337204e18)
      goto LABEL_44;
    v32 = *(_QWORD *)(v0 + 112);
    v33 = (((uint64_t)v24 >> 63) & 0xF21F494C589C0000)
        + (((unint64_t)(uint64_t)v24 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
    swift_bridgeObjectRetain();
    v34 = sub_1A92EFDC8(1000000000000000000 * (uint64_t)v24, v33, v32);
    swift_bridgeObjectRelease();
    if ((v34 & 1) == 0)
      break;
    v26 = sub_1A93F7674();
    v35 = sub_1A93F87B4();
    if (os_log_type_enabled(v26, v35))
    {
      v28 = swift_slowAlloc();
      *(_DWORD *)v28 = 134217984;
      *(double *)(v28 + 4) = v24;
      v29 = v26;
      v30 = v35;
      v31 = "Scouting: Skipping already visited position %f";
      goto LABEL_23;
    }
LABEL_8:

    inited = *v15;
    v23 = *(_QWORD *)(*v15 + 16);
    if (!v23)
      goto LABEL_24;
  }
  sub_1A9328E84(&v75, 1000000000000000000 * (uint64_t)v24, v33);
  v43 = sub_1A93F7674();
  v44 = sub_1A93F87B4();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = swift_slowAlloc();
    *(_DWORD *)v45 = 134218752;
    *(_QWORD *)(v0 + 216) = *(_QWORD *)(v0 + 128);
    sub_1A93F8AA8();
    *(_WORD *)(v45 + 12) = 2048;
    *(double *)(v0 + 224) = v24;
    sub_1A93F8AA8();
    *(_WORD *)(v45 + 22) = 2048;
    *(_QWORD *)(v0 + 232) = *(_QWORD *)(v0 + 120);
    sub_1A93F8AA8();
    *(_WORD *)(v45 + 32) = 2048;
    *(_QWORD *)(v0 + 240) = 24;
    sub_1A93F8AA8();
    _os_log_impl(&dword_1A904E000, v43, v44, "Scouting: Beginning step %ld, Position: %f, GiveUp: %ld/%ld", (uint8_t *)v45, 0x2Au);
    MEMORY[0x1AF41411C](v45, -1, -1);
  }

  if (*v74)
  {
    swift_retain();
    v46 = sub_1A93F7620();
    sub_1A93F7644();
    v47 = sub_1A93F8934();
    if ((sub_1A93F8A6C() & 1) != 0)
    {
      v48 = *(_DWORD *)(v0 + 448);
      v50 = *(_QWORD *)(v0 + 296);
      v49 = *(_QWORD *)(v0 + 304);
      v51 = *(_QWORD *)(v0 + 288);
      swift_retain();
      sub_1A93F7668();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v50 + 88))(v49, v51) == v48)
      {
        v52 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
        v52 = "";
      }
      v56 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      v58 = *(_QWORD *)(v0 + 336);
      v57 = *(_QWORD *)(v0 + 344);
      v59 = *(_QWORD *)(v0 + 312);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376))(v57, v58, v59);
      v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v60 = 0;
      v61 = sub_1A93F75E4();
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v46, v47, v61, "ScoutingAlignmentStep", v52, v60, 2u);
      MEMORY[0x1AF41411C](v60, -1, -1);

      v56(v58, v59);
      swift_release();
      v56(v57, v59);
    }
    else
    {
      v53 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      v54 = *(_QWORD *)(v0 + 336);
      v55 = *(_QWORD *)(v0 + 312);

      v53(v54, v55);
      swift_release();
    }
  }
  sub_1A93F7620();
  sub_1A93F75D8();
  v62 = sub_1A93F7620();
  v63 = sub_1A93F8940();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    v64 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    v65 = *(_QWORD *)(v0 + 344);
    v66 = *(_QWORD *)(v0 + 312);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 376))(v65, *(_QWORD *)(v0 + 328), v66);
    v67 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v67 = 0;
    v68 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v62, v63, v68, "ScoutingAlignmentStep", "", v67, 2u);
    MEMORY[0x1AF41411C](v67, -1, -1);

    v64(v65, v66);
  }
  else
  {

  }
  v69 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
  v70 = *(_QWORD *)(v0 + 328);
  v71 = *(_QWORD *)(v0 + 312);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 376))(*(_QWORD *)(v0 + 344), v70, v71);
  swift_allocObject();
  v72 = sub_1A93F7650();
  v69(v70, v71);
  swift_release();
  *(_QWORD *)(v0 + 144) = v72;
  v73 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v73;
  *v73 = v0;
  v73[1] = sub_1A93EB188;
  return sub_1A93EC4EC(*(double *)(v0 + 256), v24);
}

uint64_t sub_1A93EB188(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;

  v5 = *v3;
  *(_QWORD *)(v5 + 432) = a1;
  *(_QWORD *)(v5 + 440) = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_BYTE *)(v5 + 453) = a2;
  }
  return swift_task_switch();
}

uint64_t sub_1A93EB214()
{
  _QWORD *v0;
  uint64_t v1;
  double v2;
  double v3;
  uint64_t *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t (*v22)(__n128);
  __n128 v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint8_t *v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  char v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint8_t *v38;
  double v39;
  unint64_t v40;
  unint64_t v41;
  int64_t v42;
  unint64_t v43;
  _QWORD *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint8_t *v48;
  double v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  os_log_type_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  char v71;
  NSObject *v73;
  os_log_type_t v74;
  uint64_t v75;
  NSObject *v76;
  os_signpost_type_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  void (*v83)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint8_t *v90;
  os_signpost_id_t v91;
  NSObject *v92;
  os_signpost_type_t v93;
  void (*v94)(uint64_t, uint64_t);
  uint64_t v95;
  uint64_t v96;
  uint8_t *v97;
  os_signpost_id_t v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  _QWORD *v104;
  __int128 v105;

  if (*(_BYTE *)(v1 + 453))
  {
    v4 = (uint64_t *)(v1 + 136);
    v104 = (_QWORD *)(v1 + 144);
    if (*(_BYTE *)(v1 + 453) != 1)
    {
      v24 = *(_QWORD *)(v1 + 120);
      v6 = __OFADD__(v24, 1);
      v25 = v24 + 1;
      if (v6)
        goto LABEL_77;
      v26 = *(unsigned __int8 *)(v1 + 452);
      *(_QWORD *)(v1 + 120) = v25;
      if (v26)
      {
        if (v26 == 1)
        {
          v27 = sub_1A93F7674();
          v28 = sub_1A93F87B4();
          if (os_log_type_enabled(v27, v28))
          {
            v29 = *(_QWORD *)(v1 + 416);
            v30 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)v30 = 134217984;
            *(_QWORD *)(v1 + 160) = v29;
            sub_1A93F8AA8();
            _os_log_impl(&dword_1A904E000, v27, v28, "Scouting: ⬅️ No match found for %f", v30, 0xCu);
            MEMORY[0x1AF41411C](v30, -1, -1);
          }
          v2 = *(double *)(v1 + 416);

          v3 = -120.0;
          v0 = *(_QWORD **)(v1 + 136);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            goto LABEL_16;
          goto LABEL_78;
        }
        v45 = sub_1A93F7674();
        v46 = sub_1A93F87B4();
        if (os_log_type_enabled(v45, v46))
        {
          v47 = *(_QWORD *)(v1 + 416);
          v48 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v48 = 134217984;
          *(_QWORD *)(v1 + 152) = v47;
          sub_1A93F8AA8();
          _os_log_impl(&dword_1A904E000, v45, v46, "Scouting: ➡️ No match found for %f", v48, 0xCu);
          MEMORY[0x1AF41411C](v48, -1, -1);
        }
        v49 = *(double *)(v1 + 416);

        v3 = 120.0;
        v0 = *(_QWORD **)(v1 + 136);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v0 = sub_1A9119EE0(0, v0[2] + 1, 1, v0);
        v2 = v49 + 120.0;
        v51 = v0[2];
        v50 = v0[3];
        if (v51 >= v50 >> 1)
          v0 = sub_1A9119EE0((_QWORD *)(v50 > 1), v51 + 1, 1, v0);
        v0[2] = v51 + 1;
        v33 = &v0[2 * v51];
        v34 = 2;
      }
      else
      {
        v35 = sub_1A93F7674();
        v36 = sub_1A93F87B4();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = *(_QWORD *)(v1 + 416);
          v38 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v38 = 134217984;
          *(_QWORD *)(v1 + 168) = v37;
          sub_1A93F8AA8();
          _os_log_impl(&dword_1A904E000, v35, v36, "Scouting: ↔️ No match found for %f", v38, 0xCu);
          MEMORY[0x1AF41411C](v38, -1, -1);
        }
        v39 = *(double *)(v1 + 416);

        v0 = *(_QWORD **)(v1 + 136);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v0 = sub_1A9119EE0(0, v0[2] + 1, 1, v0);
        v3 = v39 + 120.0;
        v41 = v0[2];
        v40 = v0[3];
        v42 = v40 >> 1;
        v43 = v41 + 1;
        if (v40 >> 1 <= v41)
        {
          v0 = sub_1A9119EE0((_QWORD *)(v40 > 1), v41 + 1, 1, v0);
          v40 = v0[3];
          v42 = v40 >> 1;
        }
        v2 = v39 + -120.0;
        v0[2] = v43;
        v44 = &v0[2 * v41];
        *((_BYTE *)v44 + 32) = 2;
        *((double *)v44 + 5) = v3;
        if (v42 < (uint64_t)(v41 + 2))
          v0 = sub_1A9119EE0((_QWORD *)(v40 > 1), v41 + 2, 1, v0);
        v0[2] = v41 + 2;
        v33 = &v0[2 * v43];
        v34 = 1;
      }
      goto LABEL_35;
    }
    v5 = *(_QWORD *)(v1 + 120);
    v6 = __OFADD__(v5, 4);
    v7 = v5 + 4;
    if (v6)
      goto LABEL_76;
    v2 = *(double *)(v1 + 432);
    *(_QWORD *)(v1 + 120) = v7;
    v8 = sub_1A93F7674();
    v9 = sub_1A93F87B4();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = *(_QWORD *)(v1 + 432);
      v3 = *(double *)(v1 + 416);
      v11 = swift_slowAlloc();
      *(_DWORD *)v11 = 134218240;
      *(double *)(v1 + 176) = v3;
      sub_1A93F8AA8();
      *(_WORD *)(v11 + 12) = 2048;
      *(_QWORD *)(v1 + 184) = v10;
      sub_1A93F8AA8();
      _os_log_impl(&dword_1A904E000, v8, v9, "Scouting: 🔎 Refined guess from %f to %f.", (uint8_t *)v11, 0x16u);
      MEMORY[0x1AF41411C](v11, -1, -1);
    }

    v0 = (_QWORD *)(v1 + 136);
    sub_1A917352C(0, 0, 0, v2);
    while (1)
    {
      v52 = *(_QWORD *)(v1 + 128);
      v6 = __OFADD__(v52, 1);
      v53 = v52 + 1;
      if (!v6)
        break;
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      v0 = sub_1A9119EE0(0, v0[2] + 1, 1, v0);
LABEL_16:
      v2 = v2 + v3;
      v32 = v0[2];
      v31 = v0[3];
      if (v32 >= v31 >> 1)
        v0 = sub_1A9119EE0((_QWORD *)(v31 > 1), v32 + 1, 1, v0);
      v0[2] = v32 + 1;
      v33 = &v0[2 * v32];
      v34 = 1;
LABEL_35:
      *((_BYTE *)v33 + 32) = v34;
      *((double *)v33 + 5) = v2;
      *v4 = (uint64_t)v0;
    }
    *(_QWORD *)(v1 + 128) = v53;
    v54 = *v4;
    if (*(_QWORD *)(*v4 + 16))
    {
      while (1)
      {
        *(_BYTE *)(v1 + 452) = *(_BYTE *)(v54 + 32);
        v2 = *(double *)(v54 + 40);
        *(double *)(v1 + 416) = v2;
        v0 = (_QWORD *)(v1 + 136);
        sub_1A9174404(0, 1);
        if (*(uint64_t *)(v1 + 120) >= 24)
          goto LABEL_54;
        if (v2 < *(double *)(v1 + 264) || v2 >= *(double *)(v1 + 272))
          break;
        if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
          goto LABEL_75;
        }
        if (v2 <= -9.22337204e18)
          goto LABEL_73;
        if (v2 >= 9.22337204e18)
          goto LABEL_74;
        v62 = *(_QWORD *)(v1 + 112);
        v63 = (((uint64_t)v2 >> 63) & 0xF21F494C589C0000)
            + (((unint64_t)(uint64_t)v2 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
        swift_bridgeObjectRetain();
        v64 = sub_1A92EFDC8(1000000000000000000 * (uint64_t)v2, v63, v62);
        swift_bridgeObjectRelease();
        if ((v64 & 1) == 0)
        {
          sub_1A9328E84(&v105, 1000000000000000000 * (uint64_t)v2, v63);
          v73 = sub_1A93F7674();
          v74 = sub_1A93F87B4();
          if (os_log_type_enabled(v73, v74))
          {
            v75 = swift_slowAlloc();
            *(_DWORD *)v75 = 134218752;
            *(_QWORD *)(v1 + 216) = *(_QWORD *)(v1 + 128);
            sub_1A93F8AA8();
            *(_WORD *)(v75 + 12) = 2048;
            *(double *)(v1 + 224) = v2;
            sub_1A93F8AA8();
            *(_WORD *)(v75 + 22) = 2048;
            *(_QWORD *)(v1 + 232) = *(_QWORD *)(v1 + 120);
            sub_1A93F8AA8();
            *(_WORD *)(v75 + 32) = 2048;
            *(_QWORD *)(v1 + 240) = 24;
            sub_1A93F8AA8();
            _os_log_impl(&dword_1A904E000, v73, v74, "Scouting: Beginning step %ld, Position: %f, GiveUp: %ld/%ld", (uint8_t *)v75, 0x2Au);
            MEMORY[0x1AF41411C](v75, -1, -1);
          }

          if (*v104)
          {
            swift_retain();
            v76 = sub_1A93F7620();
            sub_1A93F7644();
            v77 = sub_1A93F8934();
            if ((sub_1A93F8A6C() & 1) != 0)
            {
              v78 = *(_DWORD *)(v1 + 448);
              v80 = *(_QWORD *)(v1 + 296);
              v79 = *(_QWORD *)(v1 + 304);
              v81 = *(_QWORD *)(v1 + 288);
              swift_retain();
              sub_1A93F7668();
              swift_release();
              if ((*(unsigned int (**)(uint64_t, uint64_t))(v80 + 88))(v79, v81) == v78)
              {
                v82 = "[Error] Interval already ended";
              }
              else
              {
                (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 296) + 8))(*(_QWORD *)(v1 + 304), *(_QWORD *)(v1 + 288));
                v82 = "";
              }
              v86 = *(void (**)(uint64_t, uint64_t))(v1 + 400);
              v88 = *(_QWORD *)(v1 + 336);
              v87 = *(_QWORD *)(v1 + 344);
              v89 = *(_QWORD *)(v1 + 312);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 376))(v87, v88, v89);
              v90 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v90 = 0;
              v91 = sub_1A93F75E4();
              _os_signpost_emit_with_name_impl(&dword_1A904E000, v76, v77, v91, "ScoutingAlignmentStep", v82, v90, 2u);
              MEMORY[0x1AF41411C](v90, -1, -1);

              v86(v88, v89);
              swift_release();
              v86(v87, v89);
            }
            else
            {
              v83 = *(void (**)(uint64_t, uint64_t))(v1 + 400);
              v84 = *(_QWORD *)(v1 + 336);
              v85 = *(_QWORD *)(v1 + 312);

              v83(v84, v85);
              swift_release();
            }
          }
          sub_1A93F7620();
          sub_1A93F75D8();
          v92 = sub_1A93F7620();
          v93 = sub_1A93F8940();
          if ((sub_1A93F8A6C() & 1) != 0)
          {
            v94 = *(void (**)(uint64_t, uint64_t))(v1 + 400);
            v95 = *(_QWORD *)(v1 + 344);
            v96 = *(_QWORD *)(v1 + 312);
            (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 376))(v95, *(_QWORD *)(v1 + 328), v96);
            v97 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v97 = 0;
            v98 = sub_1A93F75E4();
            _os_signpost_emit_with_name_impl(&dword_1A904E000, v92, v93, v98, "ScoutingAlignmentStep", "", v97, 2u);
            MEMORY[0x1AF41411C](v97, -1, -1);

            v94(v95, v96);
          }
          else
          {

          }
          v99 = *(void (**)(uint64_t, uint64_t))(v1 + 400);
          v100 = *(_QWORD *)(v1 + 328);
          v101 = *(_QWORD *)(v1 + 312);
          (*(void (**)(_QWORD, uint64_t, uint64_t))(v1 + 376))(*(_QWORD *)(v1 + 344), v100, v101);
          swift_allocObject();
          v102 = sub_1A93F7650();
          v99(v100, v101);
          swift_release();
          *(_QWORD *)(v1 + 144) = v102;
          v103 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v1 + 424) = v103;
          *v103 = v1;
          v103[1] = sub_1A93EB188;
          return sub_1A93EC4EC(*(double *)(v1 + 256), v2);
        }
        v56 = sub_1A93F7674();
        v65 = sub_1A93F87B4();
        if (os_log_type_enabled(v56, v65))
        {
          v58 = swift_slowAlloc();
          *(_DWORD *)v58 = 134217984;
          *(double *)(v58 + 4) = v2;
          v59 = v56;
          v60 = v65;
          v61 = "Scouting: Skipping already visited position %f";
LABEL_39:
          _os_log_impl(&dword_1A904E000, v59, v60, v61, (uint8_t *)v58, 0xCu);
          MEMORY[0x1AF41411C](v58, -1, -1);
        }
LABEL_40:

        v54 = *v4;
        if (!*(_QWORD *)(*v4 + 16))
          goto LABEL_54;
      }
      v56 = sub_1A93F7674();
      v57 = sub_1A93F87B4();
      if (!os_log_type_enabled(v56, v57))
        goto LABEL_40;
      v58 = swift_slowAlloc();
      *(_DWORD *)v58 = 134217984;
      *(double *)(v58 + 4) = v2;
      v59 = v56;
      v60 = v57;
      v61 = "Scouting: Skipping out of bounds %f";
      goto LABEL_39;
    }
LABEL_54:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v66 = *(_QWORD *)(v1 + 120);
    sub_1A93EE7C4();
    swift_allocError();
    v68 = *(_QWORD *)(v1 + 392);
    v69 = *(_QWORD *)(v1 + 280);
    v70 = *(double *)(v1 + 256);
    if (v66 < 24)
      v71 = 1;
    else
      v71 = 2;
    *v67 = v71;
    swift_willThrow();
    sub_1A93EC058(v70, v69, v68, v104);
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v22 = *(uint64_t (**)(__n128))(v1 + 8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v1 + 128);
    v13 = sub_1A93F7674();
    v14 = sub_1A93F87B4();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = *(_QWORD *)(v1 + 416);
      v16 = *(_QWORD *)(v1 + 256);
      v17 = swift_slowAlloc();
      *(_DWORD *)v17 = 134218496;
      *(_QWORD *)(v1 + 192) = v16;
      sub_1A93F8AA8();
      *(_WORD *)(v17 + 12) = 2048;
      *(_QWORD *)(v1 + 200) = v15;
      sub_1A93F8AA8();
      *(_WORD *)(v17 + 22) = 2048;
      *(_QWORD *)(v1 + 208) = v12;
      sub_1A93F8AA8();
      _os_log_impl(&dword_1A904E000, v13, v14, "Scouting: 🎯 Resolved from %f to %f in %ld steps", (uint8_t *)v17, 0x20u);
      MEMORY[0x1AF41411C](v17, -1, -1);
    }
    v18 = *(_QWORD *)(v1 + 432);
    v19 = *(_QWORD *)(v1 + 392);
    v20 = *(_QWORD *)(v1 + 280);
    v21 = *(double *)(v1 + 256);

    sub_1A93EC058(v21, v20, v19, (_QWORD *)(v1 + 144));
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v22 = *(uint64_t (**)(__n128))(v1 + 8);
    v23.n128_u64[0] = v18;
  }
  return v22(v23);
}

uint64_t sub_1A93EBFC0()
{
  uint64_t v0;

  sub_1A93EC058(*(double *)(v0 + 256), *(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 392), (_QWORD *)(v0 + 144));
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93EC058(double a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
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
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint8_t *v23;
  uint64_t v24;
  NSObject *v25;
  os_signpost_type_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void (*v30)(char *, uint64_t);
  uint64_t result;
  uint8_t *v32;
  os_signpost_id_t v33;
  uint64_t v34;
  NSObject *v35;
  char *v36;
  os_signpost_type_t v37;
  char *v38;
  uint64_t v39;
  const char *v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint8_t *v43;
  os_signpost_id_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  uint64_t v49;
  double v50;

  v48 = a4;
  v46 = sub_1A93F7638();
  v49 = *(_QWORD *)(v46 - 8);
  MEMORY[0x1E0C80A78](v46);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v45 - v8;
  v10 = sub_1A93F75FC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v45 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v45 - v18;
  v20 = sub_1A93F7674();
  v21 = sub_1A93F87B4();
  v22 = os_log_type_enabled(v20, v21);
  v47 = v13;
  v45 = v6;
  if (v22)
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 134217984;
    v50 = a1;
    sub_1A93F8AA8();
    _os_log_impl(&dword_1A904E000, v20, v21, "Scouting: Ending task for %f", v23, 0xCu);
    MEMORY[0x1AF41411C](v23, -1, -1);
  }

  if (qword_1EEAB6DF0 != -1)
    swift_once();
  v24 = sub_1A93F762C();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EEABA7C8);
  v25 = sub_1A93F7620();
  sub_1A93F7644();
  v26 = sub_1A93F8934();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    swift_retain();
    sub_1A93F7668();
    swift_release();
    v27 = v49;
    v28 = v46;
    if ((*(unsigned int (**)(char *, uint64_t))(v49 + 88))(v9, v46) == *MEMORY[0x1E0DF2190])
    {
      v29 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
      v29 = "";
    }
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v19, v10);
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    v33 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v25, v26, v33, "ScoutingAlignmentResolve", v29, v32, 2u);
    MEMORY[0x1AF41411C](v32, -1, -1);

    v30 = *(void (**)(char *, uint64_t))(v11 + 8);
    v30(v19, v10);
    result = ((uint64_t (*)(char *, uint64_t))v30)(v16, v10);
  }
  else
  {

    v30 = *(void (**)(char *, uint64_t))(v11 + 8);
    result = ((uint64_t (*)(char *, uint64_t))v30)(v19, v10);
  }
  v34 = v49;
  if (*v48)
  {
    swift_retain();
    v35 = sub_1A93F7620();
    v36 = v47;
    sub_1A93F7644();
    v37 = sub_1A93F8934();
    if ((sub_1A93F8A6C() & 1) != 0)
    {
      swift_retain();
      v38 = v45;
      sub_1A93F7668();
      swift_release();
      v39 = v46;
      if ((*(unsigned int (**)(char *, uint64_t))(v34 + 88))(v38, v46) == *MEMORY[0x1E0DF2190])
      {
        v40 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v34 + 8))(v38, v39);
        v40 = "";
      }
      v41 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
      v42 = v47;
      v41(v16, v47, v10);
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      v44 = sub_1A93F75E4();
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v35, v37, v44, "ScoutingAlignmentStep", v40, v43, 2u);
      MEMORY[0x1AF41411C](v43, -1, -1);

      v30(v42, v10);
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v30)(v16, v10);
    }
    else
    {

      v30(v36, v10);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1A93EC4EC(double a1, double a2)
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

  *(_QWORD *)(v3 + 152) = v2;
  *(double *)(v3 + 136) = a1;
  *(double *)(v3 + 144) = a2;
  v4 = sub_1A93F7638();
  *(_QWORD *)(v3 + 160) = v4;
  *(_QWORD *)(v3 + 168) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 176) = swift_task_alloc();
  *(_QWORD *)(v3 + 184) = swift_task_alloc();
  *(_QWORD *)(v3 + 192) = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0A80);
  *(_QWORD *)(v3 + 200) = v5;
  *(_QWORD *)(v3 + 208) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 216) = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0A88);
  *(_QWORD *)(v3 + 224) = v6;
  *(_QWORD *)(v3 + 232) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 240) = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0A90);
  *(_QWORD *)(v3 + 248) = v7;
  *(_QWORD *)(v3 + 256) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 264) = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0A98);
  *(_QWORD *)(v3 + 272) = v8;
  *(_QWORD *)(v3 + 280) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v3 + 288) = swift_task_alloc();
  v9 = sub_1A93F75FC();
  *(_QWORD *)(v3 + 296) = v9;
  *(_QWORD *)(v3 + 304) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v3 + 312) = swift_task_alloc();
  *(_QWORD *)(v3 + 320) = swift_task_alloc();
  *(_QWORD *)(v3 + 328) = swift_task_alloc();
  *(_QWORD *)(v3 + 336) = swift_task_alloc();
  *(_QWORD *)(v3 + 344) = swift_task_alloc();
  *(_QWORD *)(v3 + 352) = swift_task_alloc();
  *(_QWORD *)(v3 + 360) = swift_task_alloc();
  v10 = sub_1A93F762C();
  *(_QWORD *)(v3 + 368) = v10;
  *(_QWORD *)(v3 + 376) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v3 + 384) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A93EC6B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint8_t *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (qword_1EEAB6DE8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 376);
  v1 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 368);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EEABA7B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  if (qword_1EEAB6DF0 != -1)
    swift_once();
  *(_QWORD *)(v0 + 392) = __swift_project_value_buffer(*(_QWORD *)(v0 + 368), (uint64_t)qword_1EEABA7C8);
  sub_1A93F7620();
  sub_1A93F75D8();
  v5 = sub_1A93F7620();
  v6 = sub_1A93F8940();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 352);
    v8 = *(_QWORD *)(v0 + 296);
    v9 = *(_QWORD *)(v0 + 304);
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    v10(v7, *(_QWORD *)(v0 + 360), v8);
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    v12 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v5, v6, v12, "ScoutingAssetRead", "", v11, 2u);
    MEMORY[0x1AF41411C](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 304);

    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  }
  *(_QWORD *)(v0 + 400) = v10;
  v14 = *(_QWORD *)(v0 + 376);
  v25 = *(_QWORD *)(v0 + 384);
  v16 = *(_QWORD *)(v0 + 360);
  v15 = *(_QWORD *)(v0 + 368);
  v18 = *(_QWORD *)(v0 + 296);
  v17 = *(_QWORD *)(v0 + 304);
  v28 = *(_QWORD *)(v0 + 256);
  v26 = *(_QWORD *)(v0 + 264);
  v27 = *(_QWORD *)(v0 + 248);
  v31 = *(_QWORD *)(v0 + 272);
  v32 = *(_QWORD *)(v0 + 208);
  v29 = *(_QWORD *)(v0 + 216);
  v30 = *(_QWORD *)(v0 + 200);
  v19 = *(_QWORD *)(v0 + 152);
  v10(*(_QWORD *)(v0 + 352), v16, v18);
  *(_QWORD *)(v0 + 408) = sub_1A93F765C();
  swift_allocObject();
  *(_QWORD *)(v0 + 416) = sub_1A93F7650();
  v20 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  *(_QWORD *)(v0 + 424) = v20;
  v20(v16, v18);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v25, v15);
  v21 = *(void **)(v19 + 24);
  sub_1A93F9408();
  sub_1A93F8A18();
  sub_1A93F8A18();
  sub_1A93F8748();
  *(_QWORD *)(v0 + 120) = sub_1A923E4B8(v21, (_OWORD *)(v0 + 488));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEABD2E8);
  sub_1A9066D74(&qword_1EEABD2F0, &qword_1EEABD2E8, MEMORY[0x1E0C95D90]);
  sub_1A93F7C38();
  swift_release();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAC0AA0);
  sub_1A9066D74(&qword_1EEAC0AA8, &qword_1EEAC0A90, MEMORY[0x1E0C95B60]);
  sub_1A93F7C20();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
  v22 = sub_1A9066D74(&qword_1EEAC0AB0, &qword_1EEAC0A98, MEMORY[0x1E0C95B48]);
  MEMORY[0x1AF411944](v31, v22);
  sub_1A93F7A04();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v29, v30);
  sub_1A9066D74(&qword_1EEAC0AB8, &qword_1EEAC0A88, MEMORY[0x1E0C95FF0]);
  v23 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 432) = v23;
  *v23 = v0;
  v23[1] = sub_1A93ECB24;
  return sub_1A93F8454();
}

uint64_t sub_1A93ECB24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 440) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93ECB88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_signpost_type_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 448) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 32);
    v3 = *(_OWORD *)(v0 + 40);
    v4 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 64);
    *(_QWORD *)(v0 + 72) = *(_QWORD *)(v0 + 24);
    *(_QWORD *)(v0 + 80) = v2;
    *(_OWORD *)(v0 + 88) = v3;
    *(_QWORD *)(v0 + 104) = v4;
    *(_QWORD *)(v0 + 112) = v5;
    sub_1A93F7620();
    sub_1A93F75D8();
    v6 = sub_1A93F7620();
    v7 = sub_1A93F8940();
    if ((sub_1A93F8A6C() & 1) != 0)
    {
      v8 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
      v9 = *(_QWORD *)(v0 + 352);
      v10 = *(_QWORD *)(v0 + 296);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 400))(v9, *(_QWORD *)(v0 + 344), v10);
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      v12 = sub_1A93F75E4();
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v6, v7, v12, "ScoutingSignatureMatching", "", v11, 2u);
      MEMORY[0x1AF41411C](v11, -1, -1);

      v8(v9, v10);
    }
    else
    {

    }
    v18 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    v19 = *(_QWORD *)(v0 + 344);
    v20 = *(_QWORD *)(v0 + 296);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 400))(*(_QWORD *)(v0 + 352), v19, v20);
    swift_allocObject();
    *(_QWORD *)(v0 + 456) = sub_1A93F7650();
    v18(v19, v20);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 464) = v21;
    *v21 = v0;
    v21[1] = sub_1A93ED010;
    return sub_1A93F8A84();
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 280);
    v14 = *(_QWORD *)(v0 + 288);
    v15 = *(_QWORD *)(v0 + 272);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 224));
    sub_1A93EE7C4();
    swift_allocError();
    *v16 = 1;
    swift_willThrow();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
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
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1A93ECE78()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 128) = *(_QWORD *)(v0 + 440);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A1CB0);
  swift_willThrowTypedImpl();
  return swift_task_switch();
}

uint64_t sub_1A93ECED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 280);
  v1 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 272);
  v5 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 240);
  v6 = *(_QWORD *)(v0 + 224);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A93ED010(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 472) = a1;
  *(_QWORD *)(v4 + 480) = a2;
  *(_BYTE *)(v4 + 536) = a3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A93ED070()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  _QWORD *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  os_signpost_id_t v12;
  int v13;
  id v14;
  NSObject *v15;
  os_signpost_type_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  os_signpost_id_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  Swift::Double v33;
  Swift::Double v34;
  uint64_t v35;
  unsigned int v36;
  NSObject *v37;
  os_signpost_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  unsigned int v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t *v51;
  uint64_t *v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint8_t *v56;
  os_signpost_id_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint8_t *v70;
  os_signpost_id_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v1 = sub_1A93F7620();
  sub_1A93F7644();
  v2 = sub_1A93F8934();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 192);
    v4 = *(_QWORD *)(v0 + 160);
    v5 = *(_QWORD *)(v0 + 168);
    swift_retain();
    sub_1A93F7668();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v3, v4) == *MEMORY[0x1E0DF2190])
    {
      v6 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
      v6 = "";
    }
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    v7 = (_QWORD *)(v0 + 352);
    v9 = *(_QWORD *)(v0 + 336);
    v10 = *(_QWORD *)(v0 + 296);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 400))(*(_QWORD *)(v0 + 352), v9, v10);
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    v12 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v1, v2, v12, "ScoutingSignatureMatching", v6, v11, 2u);
    MEMORY[0x1AF41411C](v11, -1, -1);

    v8(v9, v10);
  }
  else
  {
    v7 = (_QWORD *)(v0 + 336);

  }
  v13 = *(unsigned __int8 *)(v0 + 536);
  (*(void (**)(_QWORD, _QWORD))(v0 + 424))(*v7, *(_QWORD *)(v0 + 296));
  if (!v13)
  {
    v14 = *(id *)(v0 + 472);
    sub_1A93F7620();
    sub_1A93F75D8();
    v15 = sub_1A93F7620();
    v16 = sub_1A93F8940();
    if ((sub_1A93F8A6C() & 1) != 0)
    {
      v17 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
      v18 = *(_QWORD *)(v0 + 352);
      v19 = *(_QWORD *)(v0 + 296);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 400))(v18, *(_QWORD *)(v0 + 328), v19);
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      v21 = sub_1A93F75E4();
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v15, v16, v21, "ScoutingSignatureAlignment", "", v20, 2u);
      MEMORY[0x1AF41411C](v20, -1, -1);

      v17(v18, v19);
    }
    else
    {

    }
    v29 = *(_QWORD *)(v0 + 440);
    v30 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    v31 = *(_QWORD *)(v0 + 328);
    v32 = *(_QWORD *)(v0 + 296);
    v34 = *(double *)(v0 + 136);
    v33 = *(double *)(v0 + 144);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 400))(*(_QWORD *)(v0 + 352), v31, v32);
    swift_allocObject();
    sub_1A93F7650();
    v30(v31, v32);
    v35 = sub_1A93EE858(v14, v0 + 72, v34, v33);
    if (!v29)
    {
      v43 = v35;
      v44 = v36;
      v45 = sub_1A93F7620();
      sub_1A93F7644();
      v46 = sub_1A93F8934();
      v84 = v43;
      v83 = v44;
      if ((sub_1A93F8A6C() & 1) != 0)
      {
        v47 = *(_QWORD *)(v0 + 184);
        v49 = *(_QWORD *)(v0 + 160);
        v48 = *(_QWORD *)(v0 + 168);
        swift_retain();
        sub_1A93F7668();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v48 + 88))(v47, v49) == *MEMORY[0x1E0DF2190])
        {
          v50 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
          v50 = "";
        }
        v67 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
        v68 = *(_QWORD *)(v0 + 320);
        v69 = *(_QWORD *)(v0 + 296);
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 400))(*(_QWORD *)(v0 + 352), v68, v69);
        v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v70 = 0;
        v71 = sub_1A93F75E4();
        _os_signpost_emit_with_name_impl(&dword_1A904E000, v45, (os_signpost_type_t)v46, v71, "ScoutingSignatureAlignment", v50, v70, 2u);
        MEMORY[0x1AF41411C](v70, -1, -1);

        v67(v68, v69);
        v52 = (uint64_t *)(v0 + 352);
      }
      else
      {
        v52 = (uint64_t *)(v0 + 320);

      }
      v72 = *v52;
      v73 = *(void **)(v0 + 472);
      v74 = *(void **)(v0 + 480);
      (*(void (**)(uint64_t, _QWORD))(v0 + 424))(v72, *(_QWORD *)(v0 + 296));
      swift_release();
      sub_1A93EE820(v73, v74, 0);
      goto LABEL_30;
    }
    v37 = sub_1A93F7620();
    sub_1A93F7644();
    v38 = sub_1A93F8934();
    if ((sub_1A93F8A6C() & 1) != 0)
    {
      v39 = *(_QWORD *)(v0 + 168);
      v40 = *(_QWORD *)(v0 + 176);
      v41 = *(_QWORD *)(v0 + 160);
      swift_retain();
      sub_1A93F7668();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v39 + 88))(v40, v41) == *MEMORY[0x1E0DF2190])
      {
        v42 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));
        v42 = "";
      }
      v53 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
      v54 = *(_QWORD *)(v0 + 312);
      v55 = *(_QWORD *)(v0 + 296);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 400))(*(_QWORD *)(v0 + 352), v54, v55);
      v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v56 = 0;
      v57 = sub_1A93F75E4();
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v37, v38, v57, "ScoutingSignatureAlignment", v42, v56, 2u);
      MEMORY[0x1AF41411C](v56, -1, -1);

      v53(v54, v55);
      v51 = (uint64_t *)(v0 + 352);
    }
    else
    {
      v51 = (uint64_t *)(v0 + 312);

    }
    v58 = *v51;
    v60 = *(void **)(v0 + 472);
    v59 = *(void **)(v0 + 480);
    v61 = *(void **)(v0 + 448);
    v90 = *(_QWORD *)(v0 + 288);
    v62 = *(_QWORD *)(v0 + 280);
    v87 = *(_QWORD *)(v0 + 272);
    v63 = *(_QWORD *)(v0 + 232);
    v64 = *(_QWORD *)(v0 + 240);
    v65 = *(_QWORD *)(v0 + 224);
    (*(void (**)(uint64_t, _QWORD))(v0 + 424))(v58, *(_QWORD *)(v0 + 296));
    swift_release();
    sub_1A93EE820(v60, v59, 0);

    sub_1A93EE820(v60, v59, 0);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v64, v65);
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v90, v87);
LABEL_26:
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
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (v13 != 1)
  {
    v23 = *(void **)(v0 + 472);
    v22 = *(void **)(v0 + 480);
    v24 = *(void **)(v0 + 448);
    v89 = *(_QWORD *)(v0 + 288);
    v86 = *(_QWORD *)(v0 + 280);
    v88 = *(_QWORD *)(v0 + 272);
    v25 = *(_QWORD *)(v0 + 232);
    v26 = *(_QWORD *)(v0 + 240);
    v27 = *(_QWORD *)(v0 + 224);
    v28 = v23;
    swift_willThrow();

    sub_1A93EE820(v23, v22, 2u);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v89, v88);
    goto LABEL_26;
  }
  v84 = 0;
  v83 = 2;
LABEL_30:
  v76 = *(void **)(v0 + 472);
  v75 = *(void **)(v0 + 480);
  v78 = *(_QWORD *)(v0 + 280);
  v77 = *(_QWORD *)(v0 + 288);
  v85 = *(_QWORD *)(v0 + 272);
  v80 = *(_QWORD *)(v0 + 232);
  v79 = *(_QWORD *)(v0 + 240);
  v81 = *(_QWORD *)(v0 + 224);
  v82 = *(_BYTE *)(v0 + 536);

  sub_1A93EE820(v76, v75, v82);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v81);
  (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v85);
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
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v84, v83);
}

uint64_t AssetReaderScoutingAligner.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();

  v1 = v0 + OBJC_IVAR____TtC18PodcastsFoundation26AssetReaderScoutingAligner_logger;
  v2 = sub_1A93F7698();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AssetReaderScoutingAligner.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();

  v1 = v0 + OBJC_IVAR____TtC18PodcastsFoundation26AssetReaderScoutingAligner_logger;
  v2 = sub_1A93F7698();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1A93ED9F8(double a1, double a2, double a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1A93EDA60;
  return sub_1A93EA054(a1, a2, a3);
}

uint64_t sub_1A93EDA60(double a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  __n128 v5;

  v4 = *v2;
  swift_task_dealloc();
  if (!v1)
    v5.n128_f64[0] = a1;
  return (*(uint64_t (**)(__n128))(v4 + 8))(v5);
}

uint64_t sub_1A93EDAB4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  os_signpost_type_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint8_t *v38;
  os_signpost_id_t v39;
  os_signpost_type_t v40;
  NSObject *v41;
  os_signpost_type_t v42;
  void (*v43)(char *, char *, uint64_t);
  uint8_t *v44;
  os_signpost_id_t v45;
  CMTimeEpoch *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  void *v50;
  char *v51;
  uint64_t v52;
  CMTimeValue v53;
  uint64_t v54;
  uint64_t v55;
  CMTimeEpoch epoch;
  id v57;
  unsigned int v58;
  void *value;
  CMTimeEpoch *v60;
  id v61;
  CMTimeEpoch v62;
  CMTimeValue v63;
  uint64_t v64;
  unsigned __int8 v65;
  id v66;
  NSObject *v67;
  char *v68;
  os_signpost_type_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  const char *v75;
  _QWORD *v76;
  NSObject *v77;
  char *v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  void (*v83)(char *, uint64_t);
  const char *v84;
  char *v85;
  uint64_t v86;
  id v87;
  id v88;
  _QWORD *v89;
  char *v90;
  char v91;
  char *v92;
  uint8_t *v93;
  os_signpost_id_t v94;
  char *v95;
  uint8_t *v96;
  os_signpost_id_t v97;
  void (*v98)(char *, uint64_t);
  uint64_t v100;
  char *v101;
  _QWORD *v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  void (*v107)(char *, char *, uint64_t);
  uint64_t v108;
  void (*v109)(char *, uint64_t);
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  id v116;
  CMTimeEpoch *v117;
  CMTime v118;
  CMTime rhs;
  CMTime lhs;
  uint64_t v121;

  v102 = a2;
  v121 = *MEMORY[0x1E0C80C00];
  v3 = sub_1A93F7638();
  v110 = *(_QWORD *)(v3 - 8);
  v111 = v3;
  MEMORY[0x1E0C80A78](v3);
  v104 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v101 = (char *)&v100 - v6;
  MEMORY[0x1E0C80A78](v7);
  v117 = (uint64_t *)((char *)&v100 - v8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v100 - v10;
  v113 = sub_1A93F75FC();
  v12 = *(_QWORD *)(v113 - 8);
  MEMORY[0x1E0C80A78](v113);
  v106 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v100 - v15;
  MEMORY[0x1E0C80A78](v17);
  v105 = (char *)&v100 - v18;
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v100 - v20;
  MEMORY[0x1E0C80A78](v22);
  v112 = (char *)&v100 - v23;
  MEMORY[0x1E0C80A78](v24);
  v26 = (char *)&v100 - v25;
  v114 = (_QWORD *)*a1;
  if (qword_1EEAB6DF0 != -1)
    swift_once();
  v27 = sub_1A93F762C();
  v115 = __swift_project_value_buffer(v27, (uint64_t)qword_1EEABA7C8);
  v28 = sub_1A93F7620();
  sub_1A93F7644();
  v29 = sub_1A93F8934();
  v30 = sub_1A93F8A6C();
  v103 = v16;
  if ((v30 & 1) != 0)
  {
    swift_retain();
    sub_1A93F7668();
    swift_release();
    v32 = v110;
    v31 = v111;
    if ((*(unsigned int (**)(char *, uint64_t))(v110 + 88))(v11, v111) == *MEMORY[0x1E0DF2190])
    {
      v33 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v31);
      v33 = "";
    }
    v37 = v112;
    v35 = v113;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v112, v26, v113);
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    v39 = sub_1A93F75E4();
    v40 = v29;
    v36 = v37;
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v28, v40, v39, "ScoutingAssetRead", v33, v38, 2u);
    MEMORY[0x1AF41411C](v38, -1, -1);

    v34 = *(void (**)(char *, uint64_t))(v12 + 8);
    v34(v26, v35);
    v34(v37, v35);
  }
  else
  {

    v34 = *(void (**)(char *, uint64_t))(v12 + 8);
    v35 = v113;
    v34(v26, v113);
    v36 = v112;
  }
  sub_1A93F7620();
  sub_1A93F75D8();
  v41 = sub_1A93F7620();
  v42 = sub_1A93F8940();
  if ((sub_1A93F8A6C() & 1) != 0)
  {
    v43 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v43(v36, v21, v35);
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    v45 = sub_1A93F75E4();
    _os_signpost_emit_with_name_impl(&dword_1A904E000, v41, v42, v45, "ScoutingSignatureGeneration", "", v44, 2u);
    MEMORY[0x1AF41411C](v44, -1, -1);

    v34(v36, v35);
  }
  else
  {

    v43 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  }
  v46 = v117;
  v107 = v43;
  v43(v36, v21, v35);
  sub_1A93F765C();
  swift_allocObject();
  v47 = sub_1A93F7650();
  v109 = v34;
  v34(v21, v35);
  v116 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD7510]), sel_init);
  v48 = v114;
  v49 = v114[2];
  if (!v49)
  {
    sub_1A92AFF7C();
    swift_allocError();
    *v76 = 1;
    swift_willThrow();

    v77 = sub_1A93F7620();
    v78 = v105;
    sub_1A93F7644();
    v79 = sub_1A93F8934();
    if ((sub_1A93F8A6C() & 1) != 0)
    {
      LODWORD(v117) = v79;
      swift_retain();
      sub_1A93F7668();
      v108 = v47;
      swift_release();
      v81 = v110;
      v80 = v111;
      v82 = (*(uint64_t (**)(CMTimeEpoch *, uint64_t))(v110 + 88))(v46, v111);
      v83 = v109;
      if (v82 == *MEMORY[0x1E0DF2190])
      {
        v84 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(CMTimeEpoch *, uint64_t))(v81 + 8))(v46, v80);
        v84 = "";
      }
      v107(v36, v78, v35);
      v92 = v78;
      v93 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v93 = 0;
      v94 = sub_1A93F75E4();
      _os_signpost_emit_with_name_impl(&dword_1A904E000, v77, (os_signpost_type_t)v117, v94, "ScoutingSignatureGeneration", v84, v93, 2u);
      MEMORY[0x1AF41411C](v93, -1, -1);

      v83(v92, v35);
      v83(v36, v35);
      return swift_release();
    }

    v85 = v78;
    v86 = v35;
LABEL_25:
    v109(v85, v86);
    return swift_release();
  }
  v108 = v47;
  v50 = (void *)v114[4];
  v51 = (char *)v114[5];
  v52 = v114[6];
  v54 = v114[7];
  v53 = v114[8];
  v55 = v114[9];
  epoch = v114[10];
  swift_bridgeObjectRetain();
  v57 = v50;
  lhs.value = 0;
  v58 = objc_msgSend(v116, sel_appendBuffer_atTime_error_, v57, 0, &lhs);
  value = (void *)lhs.value;
  if (!v58)
  {
LABEL_17:
    v66 = value;
    swift_bridgeObjectRelease();
    sub_1A93F7128();

    swift_willThrow();
    v67 = sub_1A93F7620();
    v68 = v106;
    sub_1A93F7644();
    v69 = sub_1A93F8934();
    if ((sub_1A93F8A6C() & 1) != 0)
    {
      swift_retain();
      v70 = v104;
      sub_1A93F7668();
      swift_release();
      v72 = v110;
      v71 = v111;
      v73 = (*(uint64_t (**)(char *, uint64_t))(v110 + 88))(v70, v111);
      v74 = v113;
      if (v73 == *MEMORY[0x1E0DF2190])
      {
        v75 = "[Error] Interval already ended";
LABEL_34:
        v95 = v112;
        v107(v112, v68, v74);
        v96 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v96 = 0;
        v97 = sub_1A93F75E4();
        _os_signpost_emit_with_name_impl(&dword_1A904E000, v67, v69, v97, "ScoutingSignatureGeneration", v75, v96, 2u);
        MEMORY[0x1AF41411C](v96, -1, -1);

        v98 = v109;
        v109(v68, v74);
        v98(v95, v74);
        return swift_release();
      }
LABEL_33:
      (*(void (**)(char *, uint64_t))(v72 + 8))(v70, v71);
      v75 = "";
      goto LABEL_34;
    }

    v85 = v68;
    v86 = v113;
    goto LABEL_25;
  }
  v100 = v54;
  v105 = v51;
  v60 = v48 + 17;
  while (1)
  {
    v61 = value;

    if (!--v49)
      break;
    v117 = v60 + 7;
    v62 = *v60;
    v63 = *(v60 - 2);
    v57 = (id)*(v60 - 6);
    v64 = *(v60 - 1);
    rhs.epoch = v62;
    lhs.value = v53;
    *(_QWORD *)&lhs.timescale = v55;
    lhs.epoch = epoch;
    rhs.value = v63;
    *(_QWORD *)&rhs.timescale = v64;
    CMTimeAdd(&v118, &lhs, &rhs);
    v53 = v118.value;
    v55 = *(_QWORD *)&v118.timescale;
    epoch = v118.epoch;
    lhs.value = 0;
    v65 = objc_msgSend(v116, sel_appendBuffer_atTime_error_, v57, 0, &lhs);
    value = (void *)lhs.value;
    v60 = v117;
    if ((v65 & 1) == 0)
      goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  v87 = v116;
  v88 = objc_msgSend(v116, sel_signature);

  v89 = v102;
  v90 = v105;
  *v102 = v88;
  v89[1] = v90;
  v89[2] = v52;
  v89[3] = v100;
  v89[4] = v53;
  v89[5] = v55;
  v89[6] = epoch;
  v67 = sub_1A93F7620();
  v68 = v103;
  sub_1A93F7644();
  v69 = sub_1A93F8934();
  v91 = sub_1A93F8A6C();
  v74 = v113;
  if ((v91 & 1) != 0)
  {
    swift_retain();
    v70 = v101;
    sub_1A93F7668();
    swift_release();
    v72 = v110;
    v71 = v111;
    if ((*(unsigned int (**)(char *, uint64_t))(v110 + 88))(v70, v111) == *MEMORY[0x1E0DF2190])
    {
      v75 = "[Error] Interval already ended";
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  v109(v68, v74);
  return swift_release();
}

_QWORD *sub_1A93EE528(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  uint64_t v15;

  type metadata accessor for AssetReader.StateController();
  v7 = (_QWORD *)swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEABD378);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 20) = 0;
  *(_BYTE *)(v8 + 16) = 0;
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = v8;
  if (qword_1EEAB6D10 != -1)
    swift_once();
  v9 = (void *)qword_1EEAB9E70;
  type metadata accessor for AssetReader();
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_OWORD *)(v10 + 64) = 0u;
  *(_BYTE *)(v10 + 80) = 1;
  *(_QWORD *)(v10 + 88) = 0;
  *(_QWORD *)(v10 + 16) = v7;
  *(_QWORD *)(v10 + 24) = v9;
  v3[2] = v10;
  v3[3] = a1;
  v11 = objc_allocWithZone(MEMORY[0x1E0CD74F0]);
  v12 = v9;
  v13 = a1;
  v3[4] = objc_msgSend(v11, sel_initWithCatalog_, a2);
  v14 = (char *)v3 + OBJC_IVAR____TtC18PodcastsFoundation26AssetReaderScoutingAligner_logger;
  v15 = sub_1A93F7698();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a3, v15);
  return v3;
}

uint64_t sub_1A93EE660()
{
  return type metadata accessor for AssetReaderScoutingAligner();
}

uint64_t type metadata accessor for AssetReaderScoutingAligner()
{
  uint64_t result;

  result = qword_1EEAC09B8;
  if (!qword_1EEAC09B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A93EE6A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A93F7698();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AssetReaderScoutingAligner()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssetReaderScoutingAligner.__allocating_init(asset:catalog:logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AssetReaderScoutingAligner.align(at:within:)(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(double, double, double);

  v10 = (uint64_t (*)(double, double, double))(**(int **)(*(_QWORD *)v3 + 120)
                                                       + *(_QWORD *)(*(_QWORD *)v3 + 120));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_1A913BE94;
  return v10(a1, a2, a3);
}

unint64_t sub_1A93EE7C4()
{
  unint64_t result;

  result = qword_1EEAC0A70;
  if (!qword_1EEAC0A70)
  {
    result = MEMORY[0x1AF414014](&unk_1A942A7F4, &type metadata for AssetReaderScoutingAligner.ScoutingError);
    atomic_store(result, &qword_1EEAC0A70);
  }
  return result;
}

uint64_t sub_1A93EE808@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1A93EDAB4(a1, a2);
}

void sub_1A93EE820(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2)
      return;

    a1 = a2;
  }

}

uint64_t sub_1A93EE858(void *a1, uint64_t a2, Swift::Double a3, Swift::Double a4)
{
  unint64_t v4;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  id v14;
  unint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  char v21;
  double v22;
  char v23;
  char v24;
  _BYTE *v25;
  uint64_t v27;
  Swift::Double_optional v28;
  Swift::Double_optional v29;

  v9 = sub_1A93F7698();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(a1, sel_mediaItems, v11);
  sub_1A9072534(0, &qword_1EEABD288);
  v15 = sub_1A93F8310();

  if (!(v15 >> 62))
  {
    v16 = *(void **)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v16)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v16 = (void *)sub_1A93F8E5C();
  swift_bridgeObjectRelease();
  if (!v16)
    goto LABEL_15;
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    v17 = (id)MEMORY[0x1AF4129DC](0, v15);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v17 = *(id *)(v15 + 32);
LABEL_6:
    v16 = v17;
    swift_bridgeObjectRelease();
    v18 = objc_msgSend(v16, sel_signatureAlignments);
    if (v18)
    {
      v19 = v18;
      sub_1A9072534(0, &qword_1EEABD290);
      v15 = sub_1A93F8310();

      v4 = sub_1A91154D4(MEMORY[0x1E0DEE9D8]);
      if (qword_1EEAB6D48 == -1)
        goto LABEL_8;
      goto LABEL_20;
    }

LABEL_16:
    sub_1A93EE7C4();
    swift_allocError();
    *v25 = 0;
    swift_willThrow();
    return a2;
  }
  __break(1u);
LABEL_20:
  swift_once();
LABEL_8:
  v20 = __swift_project_value_buffer(v9, (uint64_t)qword_1EEABA660);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v20, v9);
  type metadata accessor for AssetReaderTimelineAlignment();
  swift_allocObject();
  sub_1A91446E4(v4, 0, 1, 3, 2000000000000000000, 0, (uint64_t)v13);
  sub_1A91447D8(v15, a2, 0);
  swift_bridgeObjectRelease();
  v28 = AssetReaderTimelineAlignment.playerTimestamp(for:)(a3);
  if ((v21 & 1) != 0)
  {
    v29 = AssetReaderTimelineAlignment.referenceTimestamp(for:)(a4);
    v22 = *(double *)&v29.is_nil;
    v24 = v23;

    swift_release();
    if ((v24 & 1) != 0)
      *(double *)&a2 = 0.0;
    else
      *(double *)&a2 = a4 - v22 + a3;
  }
  else
  {
    a2 = *(uint64_t *)&v28.is_nil;

    swift_release();
  }
  return a2;
}

ValueMetadata *type metadata accessor for AssetReaderScoutingAligner.ScoutingError()
{
  return &type metadata for AssetReaderScoutingAligner.ScoutingError;
}

uint64_t getEnumTagSinglePayload for AssetReaderScoutingAligner.ScoutingStep(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[16])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetReaderScoutingAligner.ScoutingStep(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetReaderScoutingAligner.ScoutingStep()
{
  return &type metadata for AssetReaderScoutingAligner.ScoutingStep;
}

unint64_t sub_1A93EEC04()
{
  unint64_t result;

  result = qword_1EEAC0AC0;
  if (!qword_1EEAC0AC0)
  {
    result = MEMORY[0x1AF414014](&unk_1A942A7CC, &type metadata for AssetReaderScoutingAligner.ScoutingError);
    atomic_store(result, (unint64_t *)&qword_1EEAC0AC0);
  }
  return result;
}

uint64_t _s18PodcastsFoundation26AssetReaderScoutingAlignerC13ScoutingErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A93EEC94 + 4 * byte_1A942A6E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A93EECC8 + 4 * asc_1A942A6E0[v4]))();
}

uint64_t sub_1A93EECC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93EECD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A93EECD8);
  return result;
}

uint64_t sub_1A93EECE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A93EECECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A93EECF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93EECF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssetReaderScoutingAligner.ScoutingStep.StepType()
{
  return &type metadata for AssetReaderScoutingAligner.ScoutingStep.StepType;
}

unint64_t sub_1A93EED18()
{
  unint64_t result;

  result = qword_1EEAC0AC8;
  if (!qword_1EEAC0AC8)
  {
    result = MEMORY[0x1AF414014](&unk_1A942A880, &type metadata for AssetReaderScoutingAligner.ScoutingStep.StepType);
    atomic_store(result, (unint64_t *)&qword_1EEAC0AC8);
  }
  return result;
}

uint64_t MTBookmarksSyncType.description.getter(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;

  v1 = 0xD00000000000001DLL;
  v2 = 0xD00000000000001DLL;
  if (a1 == 1)
    v2 = 5067332;
  if (a1 != 2)
    v1 = v2;
  if (a1)
    return v1;
  else
    return 5460818;
}

uint64_t sub_1A93EEDBC()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *v0;
  v2 = 0xD00000000000001DLL;
  v3 = 0xD00000000000001DLL;
  if (*v0 == 1)
    v3 = 5067332;
  if (v1 != 2)
    v2 = v3;
  if (v1)
    return v2;
  else
    return 5460818;
}

double ServerArtwork.__allocating_init(from:)(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double result;

  v2 = objc_msgSend(a1, sel_artworkWidth);
  if (v2)
  {
    v3 = v2;
    sub_1A93F86A0();

  }
  v4 = objc_msgSend(a1, sel_artworkHeight);
  if (v4)
  {
    v5 = v4;
    sub_1A93F86A0();

  }
  v6 = objc_msgSend(a1, sel_artworkTemplateURL);
  if (v6)
  {
    v7 = v6;
    v8 = sub_1A93F8040();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = objc_msgSend(a1, sel_artworkPrimaryColor);
  if (v11)
  {
    v12 = v11;
    v13 = sub_1A93F8040();
    v15 = v14;

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    v13 = 0;
    v15 = 0;
  }
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = 0;
  *(_BYTE *)(v16 + 24) = 1;
  *(_QWORD *)(v16 + 32) = 0;
  *(_BYTE *)(v16 + 40) = 1;
  *(_QWORD *)(v16 + 48) = v8;
  *(_QWORD *)(v16 + 56) = v10;
  *(_QWORD *)(v16 + 64) = v13;
  *(_QWORD *)(v16 + 72) = v15;
  result = 0.0;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 96) = 0u;
  *(_OWORD *)(v16 + 112) = 0u;
  *(_OWORD *)(v16 + 128) = 0u;
  return result;
}

Swift::Void __swiftcall DeviceCapacityMonitor.removeCapacityChangeObserver(with:)(Swift::Int64 with)
{
  uint64_t v1;
  os_unfair_lock_s *v2;

  v2 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
  swift_retain();
  os_unfair_lock_lock(v2 + 6);
  sub_1A918FD60((uint64_t)&v2[4], (uint64_t (*)(void))sub_1A93F0DE8);
  os_unfair_lock_unlock(v2 + 6);
  swift_release();
}

uint64_t DeviceCapacityMonitor.CapacityLevel.description.getter(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
      return 0x64657269736564;
    case 2:
      return 1819047270;
    case 1:
      return 7827308;
  }
  result = sub_1A93F921C();
  __break(1u);
  return result;
}

unint64_t DeviceCapacityMonitor.CapacityLevel.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t *sub_1A93EF0B4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_1A93EF0D0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = *v0;
  if (!*v0)
    return 0x64657269736564;
  if (v1 == 2)
    return 1819047270;
  if (v1 == 1)
    return 7827308;
  result = sub_1A93F921C();
  __break(1u);
  return result;
}

void *DeviceCapacityMonitor.activeNotificationName.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  v2 = *v1;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  v3 = *(void **)(v2 + 16);
  v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  swift_release();
  return v3;
}

void DeviceCapacityMonitor.activeNotificationName.setter(void *a1)
{
  sub_1A93F152C(a1);

}

uint64_t sub_1A93EF298@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  os_unfair_lock_s **v3;
  os_unfair_lock_s *v4;
  void **v5;
  void *v6;
  uint64_t result;
  void *v8;

  v3 = (os_unfair_lock_s **)(*a1 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  v4 = *v3;
  v5 = (void **)&(*v3)[4];
  swift_retain();
  os_unfair_lock_lock(v4 + 6);
  sub_1A93F0DF0(v5, &v8);
  os_unfair_lock_unlock(v4 + 6);
  v6 = v8;
  result = swift_release();
  *a2 = v6;
  return result;
}

void (*DeviceCapacityMonitor.activeNotificationName.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = (uint64_t *)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  v5 = *v4;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
  v6 = *(void **)(v5 + 16);
  v7 = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
  swift_release();
  v3[3] = v6;
  return sub_1A93EF3D0;
}

void sub_1A93EF3D0(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void **v4;
  id v5;

  v2 = *(void **)a1;
  v4 = (void **)(*(_QWORD *)a1 + 24);
  v3 = *v4;
  if ((a2 & 1) != 0)
  {
    v5 = v3;
    sub_1A93F152C(v3);

    v3 = *v4;
  }
  else
  {
    sub_1A93F152C(*(void **)(*(_QWORD *)a1 + 24));
  }

  free(v2);
}

void sub_1A93EF438(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1AF41420C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    dispatch_resume(*(dispatch_object_t *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue));

  }
}

void sub_1A93EF494(uint64_t a1, Swift::Int64 a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  Swift::Int64 value;
  Swift::Bool is_nil;
  uint64_t v10;
  os_unfair_lock_s **v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;
  Swift::Int64_optional v14;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x1AF41420C](v5);
  if (v6)
  {
    v7 = (char *)v6;
    swift_beginAccess();
    v14 = URL.volumeAvailableCapacityForOpportunisticUsage()();
    value = v14.value;
    is_nil = v14.is_nil;
    swift_endAccess();
    v10 = 0;
    if (is_nil)
    {
LABEL_8:
      v11 = (os_unfair_lock_s **)&v7[OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel];
      swift_beginAccess();
      v12 = *v11;
      v13 = *v11 + 6;
      os_unfair_lock_lock(v13);
      *(_QWORD *)&v12[4]._os_unfair_lock_opaque = v10;
      os_unfair_lock_unlock(v13);
      swift_endAccess();

      return;
    }
    if ((a3 & 1) != 0)
    {
      if (value <= 0)
        goto LABEL_5;
    }
    else if (value <= a2)
    {
LABEL_5:
      v10 = 2;
      goto LABEL_8;
    }
    v10 = 0;
    goto LABEL_8;
  }
}

uint64_t sub_1A93EF5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v20;
  _QWORD aBlock[6];

  v6 = sub_1A93F7D58();
  v20 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1A93F7DB8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v13 = MEMORY[0x1AF41420C](a1 + 16);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = sub_1A93EF7F4();

  }
  else
  {
    v15 = 0;
  }
  sub_1A9072534(0, (unint64_t *)&qword_1ED2AD6C0);
  v16 = (void *)sub_1A93F8868();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a2;
  v17[3] = a3;
  v17[4] = v15;
  aBlock[4] = sub_1A92C4548;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_21_5;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1A93F7D88();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
  sub_1A93F8B5C();
  MEMORY[0x1AF412598](0, v12, v8, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1A93EF7F4()
{
  uint64_t v0;
  Swift::Int64 v1;
  int v2;
  Swift::Int64 value;
  Swift::Bool is_nil;
  uint64_t result;
  Swift::Int v6;
  Swift::Bool v7;
  Swift::Int64_optional v8;
  Swift::Int_optional v9;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___MTDeviceCapacityMonitor_capacityThreshold);
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR___MTDeviceCapacityMonitor_capacityThreshold + 8);
  swift_beginAccess();
  v8 = URL.volumeAvailableCapacityForOpportunisticUsage()();
  value = v8.value;
  is_nil = v8.is_nil;
  swift_endAccess();
  result = 0;
  if (!is_nil)
  {
    if (v2)
    {
      if (value > 0)
        return 0;
    }
    else if (v1 < value)
    {
      return 0;
    }
    swift_beginAccess();
    v9 = URL.volumeAvailableCapacity()();
    v6 = v9.value;
    v7 = v9.is_nil;
    swift_endAccess();
    if (v7)
      return 1;
    if (v2)
    {
      if (v6 > 0)
        return 1;
    }
    else if (v1 < v6)
    {
      return 1;
    }
    return 2;
  }
  return result;
}

id DeviceCapacityMonitor.__deallocating_deinit()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = sub_1A93F7D58();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1A93F7DB8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource;
  if (*(_QWORD *)&v0[OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource])
  {
    swift_getObjectType();
    v13 = v2;
    swift_unknownObjectRetain();
    sub_1A93F7D88();
    sub_1A93EFAF8();
    sub_1A93F8904();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v13);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if (*(_QWORD *)&v0[v10])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1A93F891C();
      swift_unknownObjectRelease();
    }
  }
  v11 = *(_QWORD *)&v0[OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v11 + 24));
  sub_1A917CC5C((uint64_t *)(v11 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
  swift_release();
  v14.receiver = v0;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_dealloc);
}

uint64_t sub_1A93EFAF8()
{
  sub_1A93F7D58();
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
  return sub_1A93F8B5C();
}

uint64_t sub_1A93EFC68(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  swift_retain();
  v8 = sub_1A906C0C4((uint64_t)sub_1A92613E0, v7);
  result = swift_release();
  *a2 = v8;
  return result;
}

uint64_t sub_1A93EFD50(_QWORD *a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v11;

  v3 = (uint64_t *)(*a1 + 16);
  swift_beginAccess();
  v4 = sub_1A906C424(a2);
  v5 = 0;
  if ((v6 & 1) != 0)
  {
    v7 = v4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1A930BE14();
      v9 = v11;
    }
    v5 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v7);
    sub_1A91AC044(v7, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return sub_1A9085818(v5);
}

void sub_1A93EFEB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v2 = sub_1A93F7D58();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1A93F7DB8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v10 = MEMORY[0x1AF41420C](a1 + 16);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = *(_QWORD *)(v10 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource);
    swift_unknownObjectRetain();

    if (v12)
    {
      swift_getObjectType();
      v13 = sub_1A93F8910();
      if (MT_isDispatchSourceDataVfsDesiredDisk(v13))
      {
        v20 = v3;
        v14 = 0;
      }
      else if ((MT_isDispatchSourceDataVfsConstrainedDisk(v13) & 1) != 0)
      {
        v20 = v3;
        v14 = 1;
      }
      else
      {
        if (!MT_isDispatchSourceDataVfsFullDisk(v13))
        {
          swift_unknownObjectRelease();
          return;
        }
        v20 = v3;
        v14 = 2;
      }
      sub_1A9072534(0, (unint64_t *)&qword_1ED2AD6C0);
      v19 = sub_1A93F8868();
      v15 = swift_allocObject();
      *(_QWORD *)(v15 + 16) = a1;
      *(_QWORD *)(v15 + 24) = v14;
      aBlock[4] = sub_1A93F1830;
      aBlock[5] = v15;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1A908A91C;
      aBlock[3] = &block_descriptor_94_0;
      v16 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_1A93F7D88();
      aBlock[0] = MEMORY[0x1E0DEE9D8];
      sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
      sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
      sub_1A93F8B5C();
      v17 = (void *)v19;
      MEMORY[0x1AF412598](0, v9, v5, v16);
      _Block_release(v16);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
}

void sub_1A93F0168(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1AF41420C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_1A93F01C0(a2);

  }
}

uint64_t sub_1A93F01C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  const void *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_1A93F7D58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1A93F7DB8();
  v29 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
  swift_retain();
  os_unfair_lock_lock(v11 + 6);
  swift_retain();
  os_unfair_lock_unlock(v11 + 6);
  swift_release();
  swift_beginAccess();
  v12 = swift_bridgeObjectRetain();
  v13 = sub_1A930C704(v12);
  swift_release();
  swift_bridgeObjectRelease();
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a1;
  v15[3] = v14;
  v15[4] = v13;
  if (*(_QWORD *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource))
  {
    v16 = (uint64_t *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel);
    swift_beginAccess();
    v17 = *v16;
    swift_retain_n();
    swift_retain();
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v17 + 24));
    v18 = *(_QWORD *)(v17 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 24));
    swift_release();
    sub_1A93F0870(v18, a1, v14, v13);
    swift_release();
    swift_release_n();
  }
  else
  {
    v28 = *(_QWORD *)(v2 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue);
    v19 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = v19;
    v20[3] = sub_1A93F1754;
    v27 = v19;
    v20[4] = v15;
    aBlock[4] = sub_1A93F188C;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A908A91C;
    aBlock[3] = &block_descriptor_44_2;
    v26 = _Block_copy(aBlock);
    swift_retain_n();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A93F7D88();
    v30 = MEMORY[0x1E0DEE9D8];
    sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
    v25 = v8;
    v21 = v5;
    sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
    sub_1A93F8B5C();
    v22 = v26;
    MEMORY[0x1AF412598](0, v10, v7, v26);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v25);
    swift_release();
    swift_release_n();
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1A93F0598(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD aBlock[6];

  v2 = sub_1A93F7D58();
  v14 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&aBlock[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1A93F7DB8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F87A8();
  if (qword_1ED2AC4B0 != -1)
    swift_once();
  swift_beginAccess();
  v9 = (id)qword_1ED2AC308;
  v10 = MEMORY[0x1E0DEE9D8];
  sub_1A93F75A8();

  sub_1A9072534(0, (unint64_t *)&qword_1ED2AD6C0);
  v11 = (void *)sub_1A93F8868();
  aBlock[4] = sub_1A93F1804;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A908A91C;
  aBlock[3] = &block_descriptor_88_1;
  v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1A93F7D88();
  aBlock[0] = v10;
  sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
  sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
  sub_1A93F8B5C();
  MEMORY[0x1AF412598](0, v8, v4, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

char *sub_1A93F0810(uint64_t a1)
{
  uint64_t v1;
  char *result;

  v1 = a1 + 16;
  swift_beginAccess();
  result = (char *)MEMORY[0x1AF41420C](v1);
  if (result)
  {
    *(_QWORD *)&result[OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource] = 0;

    return (char *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_1A93F0870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v7;
  void *v8;
  NSObject *v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  os_unfair_lock_s **v16;
  os_unfair_lock_s *v17;
  os_unfair_lock_s *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t *);
  uint64_t v22[3];
  uint64_t v23[3];

  if (a2 != a1)
  {
    v7 = sub_1A93F8790();
    if (qword_1ED2AC4B0 != -1)
      swift_once();
    swift_beginAccess();
    v8 = (void *)qword_1ED2AC308;
    if (os_log_type_enabled((os_log_t)qword_1ED2AC308, v7))
    {
      v9 = v8;
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v23[0] = v11;
      *(_DWORD *)v10 = 136315138;
      if (a2)
      {
        if (a2 == 2)
        {
          v12 = 0xE400000000000000;
          v13 = 1819047270;
        }
        else
        {
          if (a2 != 1)
          {
            sub_1A93F921C();
            __break(1u);
            return;
          }
          v12 = 0xE300000000000000;
          v13 = 7827308;
        }
      }
      else
      {
        v12 = 0xE700000000000000;
        v13 = 0x64657269736564;
      }
      v22[0] = sub_1A906436C(v13, v12, v23);
      sub_1A93F8AA8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A904E000, v9, v7, "Device capacity reached %s threshold, notifying observers.", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF41411C](v11, -1, -1);
      MEMORY[0x1AF41411C](v10, -1, -1);

    }
    swift_beginAccess();
    v14 = MEMORY[0x1AF41420C](a3 + 16);
    if (v14)
    {
      v15 = (void *)v14;
      v16 = (os_unfair_lock_s **)(v14 + OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel);
      swift_beginAccess();
      v17 = *v16;
      v18 = *v16 + 6;
      os_unfair_lock_lock(v18);
      *(_QWORD *)&v17[4]._os_unfair_lock_opaque = a2;
      os_unfair_lock_unlock(v18);
      swift_endAccess();

    }
    v19 = *(_QWORD *)(a4 + 16);
    if (v19)
    {
      swift_bridgeObjectRetain();
      v20 = a4 + 40;
      do
      {
        v21 = *(void (**)(uint64_t *))(v20 - 8);
        v22[0] = a2;
        swift_retain();
        v21(v22);
        swift_release();
        v20 += 16;
        --v19;
      }
      while (v19);
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_1A93F0B1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v2 = sub_1A93F7D58();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1A93F7DB8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = MEMORY[0x1AF41420C](a1 + 16);
  if (result)
  {
    v11 = (void *)result;
    v12 = sub_1A93EF7F4();
    v21 = v6;
    v13 = v12;
    sub_1A9072534(0, (unint64_t *)&qword_1ED2AD6C0);
    v14 = sub_1A93F8868();
    v20 = v3;
    v15 = (void *)v14;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v11;
    *(_QWORD *)(v16 + 24) = v13;
    aBlock[4] = sub_1A93F1704;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A908A91C;
    aBlock[3] = &block_descriptor_32_0;
    v17 = _Block_copy(aBlock);
    v18 = v11;
    swift_release();
    sub_1A93F7D88();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
    sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
    sub_1A93F8B5C();
    MEMORY[0x1AF412598](0, v9, v5, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v21);
  }
  return result;
}

id DeviceCapacityMonitor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DeviceCapacityMonitor.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1A93F0DDC(uint64_t a1)
{
  uint64_t v1;

  return sub_1A93EFC68(a1, *(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1A93F0DE8(_QWORD *a1)
{
  uint64_t v1;

  return sub_1A93EFD50(a1, *(_QWORD *)(v1 + 16));
}

id sub_1A93F0DF0@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = *a1;
  return v2;
}

uint64_t sub_1A93F0E1C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v6 = sub_1A93F7D58();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1A93F7DB8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  if (*(_QWORD *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource))
  {
    v15 = (uint64_t *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel);
    swift_beginAccess();
    v16 = *v15;
    v17 = a2;
    swift_retain();
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v16 + 24));
    v18 = *(_QWORD *)(v16 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 24));
    swift_release();
    sub_1A90C490C(v18, (uint64_t)v17, a3);
  }
  else
  {
    v27 = *(_QWORD *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue);
    v19 = swift_allocObject();
    v26 = v7;
    v20 = v19;
    swift_unknownObjectWeakInit();
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = v20;
    v21[3] = sub_1A9190FE4;
    v21[4] = v14;
    aBlock[4] = sub_1A93F188C;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A908A91C;
    aBlock[3] = &block_descriptor_66_5;
    v22 = _Block_copy(aBlock);
    v23 = a2;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A93F7D88();
    v28 = MEMORY[0x1E0DEE9D8];
    sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
    v25 = v10;
    sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
    sub_1A93F8B5C();
    MEMORY[0x1AF412598](0, v13, v9, v22);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1A93F1110(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v4 = sub_1A93F7D58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1A93F7DB8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  if (*(_QWORD *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor_vfsSource))
  {
    v13 = (uint64_t *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor____capacityLevel);
    swift_beginAccess();
    v14 = *v13;
    _Block_copy(a2);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v14 + 24));
    v15 = *(_QWORD *)(v14 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 24));
    swift_release();
    a2[2](a2, v15);
  }
  else
  {
    v23 = *(_QWORD *)(a1 + OBJC_IVAR___MTDeviceCapacityMonitor_diskAccessQueue);
    v16 = swift_allocObject();
    v22 = v5;
    v17 = v16;
    swift_unknownObjectWeakInit();
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v17;
    v18[3] = sub_1A93F1890;
    v18[4] = v12;
    aBlock[4] = sub_1A92BB2D8;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A908A91C;
    aBlock[3] = &block_descriptor_93;
    v19 = _Block_copy(aBlock);
    _Block_copy(a2);
    swift_retain();
    swift_retain();
    sub_1A93F7D88();
    v24 = MEMORY[0x1E0DEE9D8];
    sub_1A9066CA8((unint64_t *)&qword_1ED2AD6F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD700);
    v21 = v8;
    sub_1A9066DB4((unint64_t *)&qword_1ED2AD710, (uint64_t *)&unk_1ED2AD700);
    sub_1A93F8B5C();
    MEMORY[0x1AF412598](0, v11, v7, v19);
    _Block_release(v19);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v21);
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1A93F13F4(char a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  os_unfair_lock_s *v8;

  *(_QWORD *)(swift_allocObject() + 16) = a3;
  v6 = (uint64_t)_Block_copy(a3);
  if ((a1 & 1) != 0)
    v6 = sub_1A93F1110(a2, (void (**)(_QWORD, _QWORD))a3);
  if ((a1 & 2) != 0)
  {
    v8 = *(os_unfair_lock_s **)(a2 + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
    MEMORY[0x1E0C80A78](v6);
    swift_retain();
    os_unfair_lock_lock(v8 + 6);
    sub_1A918FD60((uint64_t)&v8[4], (uint64_t (*)(void))sub_1A93F183C);
    os_unfair_lock_unlock(v8 + 6);
    swift_release();
  }
  swift_release();
  return 0;
}

uint64_t sub_1A93F152C(void *a1)
{
  uint64_t v1;
  os_unfair_lock_s **v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  id v6;
  id v7;

  sub_1A90771CC(a1);
  v3 = (os_unfair_lock_s **)(v1 + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  v4 = *v3;
  v5 = *v3 + 6;
  v6 = a1;
  os_unfair_lock_lock(v5);

  *(_QWORD *)&v4[4]._os_unfair_lock_opaque = a1;
  v7 = v6;
  os_unfair_lock_unlock(v5);

  return swift_endAccess();
}

unint64_t sub_1A93F15C0()
{
  unint64_t result;

  result = qword_1EEAC0AE0;
  if (!qword_1EEAC0AE0)
  {
    result = MEMORY[0x1AF414014](&protocol conformance descriptor for DeviceCapacityMonitor.CapacityLevel, &type metadata for DeviceCapacityMonitor.CapacityLevel);
    atomic_store(result, (unint64_t *)&qword_1EEAC0AE0);
  }
  return result;
}

void sub_1A93F1608(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A93F152C(v1);

}

uint64_t method lookup function for DeviceCapacityMonitor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1A93F1650(uint64_t a1)
{
  uint64_t v1;

  return sub_1A918FD60(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_1A93F1668()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A93F168C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A93F16B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93F16D8()
{
  uint64_t v0;

  return sub_1A93F0B1C(v0);
}

uint64_t sub_1A93F16E0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1A93F1704()
{
  uint64_t v0;

  return sub_1A93F01C0(*(_QWORD *)(v0 + 24));
}

uint64_t sub_1A93F1728()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1A93F1754(uint64_t a1)
{
  uint64_t *v1;

  sub_1A93F0870(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1A93F1768()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93F178C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A93F17BC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1A93F17E0()
{
  uint64_t v0;

  sub_1A93EF494(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

void sub_1A93F17EC()
{
  uint64_t v0;

  sub_1A93EF438(v0);
}

void sub_1A93F17F4()
{
  uint64_t v0;

  sub_1A93EFEB4(v0);
}

uint64_t sub_1A93F17FC()
{
  uint64_t v0;

  return sub_1A93F0598(v0);
}

char *sub_1A93F1804()
{
  uint64_t v0;

  return sub_1A93F0810(v0);
}

uint64_t sub_1A93F180C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1A93F1830()
{
  uint64_t v0;

  sub_1A93F0168(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_1A93F1894(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1A93F82F8();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t type metadata accessor for MediaItemMetadataLoadingMock()
{
  return objc_opt_self();
}

uint64_t sub_1A93F19D4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t StorageSpace.init(bytes:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static StorageSpace.zero.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t StorageSpace.megabytes.getter()
{
  _QWORD *v0;

  return *v0 >> 20;
}

uint64_t StorageSpace.init(integerLiteral:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

_QWORD *static StorageSpace.+= infix(_:_:)(_QWORD *result, _QWORD *a2)
{
  if (__CFADD__(*result, *a2))
    __break(1u);
  else
    *result += *a2;
  return result;
}

_QWORD *static StorageSpace.+ infix(_:_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__CFADD__(*result, *a2))
    __break(1u);
  else
    *a3 = *result + *a2;
  return result;
}

unint64_t StorageSpace.init(megabytes:)@<X0>(unint64_t result@<X0>, _QWORD *a2@<X8>)
{
  if (result >> 54)
  {
    __break(1u);
  }
  else if ((result & 0x3FF00000000000) == 0)
  {
    *a2 = result << 20;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t StorageSpace.bytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t StorageSpace.kilobytes.getter()
{
  _QWORD *v0;

  return *v0 >> 10;
}

uint64_t StorageSpace.gigabytes.getter()
{
  _QWORD *v0;

  return *v0 >> 30;
}

unint64_t StorageSpace.init(kilobytes:)@<X0>(unint64_t result@<X0>, _QWORD *a2@<X8>)
{
  if (result >> 54)
    __break(1u);
  else
    *a2 = result << 10;
  return result;
}

unint64_t StorageSpace.init(gigabytes:)@<X0>(unint64_t result@<X0>, _QWORD *a2@<X8>)
{
  if (result >> 54)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((result & 0x3FF00000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if ((result & 0xFFC00000000) == 0)
  {
    *a2 = result << 30;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t StorageSpace.encode(to:)(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93F93CC();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_1A93F91D4();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t StorageSpace.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD v7[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93F93B4();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    v5 = sub_1A93F9114();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
    *a2 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A93F1C20@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD v7[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93F93B4();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    v5 = sub_1A93F9114();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
    *a2 = v5;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1A93F1CD0(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A93F93CC();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_1A93F91D4();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

_QWORD *static StorageSpace.- infix(_:_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result < *a2)
    __break(1u);
  else
    *a3 = *result - *a2;
  return result;
}

_QWORD *static StorageSpace.-= infix(_:_:)(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2)
    __break(1u);
  else
    *result -= *a2;
  return result;
}

unint64_t *static StorageSpace.* infix(_:_:)@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  if (is_mul_ok(*result, *a2))
    *a3 = *result * *a2;
  else
    __break(1u);
  return result;
}

BOOL static StorageSpace.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_1A93F1DD0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__CFADD__(*result, *a2))
    __break(1u);
  else
    *a3 = *result + *a2;
  return result;
}

_QWORD *sub_1A93F1DEC(_QWORD *result, _QWORD *a2)
{
  if (__CFADD__(*result, *a2))
    __break(1u);
  else
    *result += *a2;
  return result;
}

_QWORD *sub_1A93F1E08@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result < *a2)
    __break(1u);
  else
    *a3 = *result - *a2;
  return result;
}

_QWORD *sub_1A93F1E24(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2)
    __break(1u);
  else
    *result -= *a2;
  return result;
}

BOOL static StorageSpace.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

id StorageSpace.description.getter()
{
  _QWORD *v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend((id)objc_opt_self(), sel_stringWithBytesize_, *v0);
  if (result)
  {
    v2 = result;
    v3 = sub_1A93F8040();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1A93F1EC4()
{
  unint64_t result;

  result = qword_1EEAC0B98;
  if (!qword_1EEAC0B98)
  {
    result = MEMORY[0x1AF414014](&protocol conformance descriptor for StorageSpace, &type metadata for StorageSpace);
    atomic_store(result, (unint64_t *)&qword_1EEAC0B98);
  }
  return result;
}

id sub_1A93F1F08()
{
  _QWORD *v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend((id)objc_opt_self(), sel_stringWithBytesize_, *v0);
  if (result)
  {
    v2 = result;
    v3 = sub_1A93F8040();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageSpace()
{
  return &type metadata for StorageSpace;
}

void PFAutoBugCaptureBugReporter.prepare(bugReport:maximumFrequency:checkBlock:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v6 = *a2;
  if (a3)
  {
    v8[4] = a3;
    v8[5] = a4;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 1107296256;
    v8[2] = sub_1A93F2160;
    v8[3] = &block_descriptor_94;
    v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, sel_submitBugReport_userInfo_withMaximumSubmissionCadence_, a1, v7, dbl_1A942AD90[v6]);
  _Block_release(v7);
}

PodcastsFoundation::BugReportFrequency_optional __swiftcall BugReportFrequency.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (PodcastsFoundation::BugReportFrequency_optional)rawValue;
}

uint64_t BugReportFrequency.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

PodcastsFoundation::BugReportFrequency_optional sub_1A93F2064(Swift::Int *a1)
{
  return BugReportFrequency.init(rawValue:)(*a1);
}

uint64_t PFAutoBugCaptureBugReporter.submit(bugReport:maximumFrequency:userInfo:)(uint64_t a1, char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];

  v6 = *a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  v10[4] = sub_1A93F21F4;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1A93F2160;
  v10[3] = &block_descriptor_3;
  v8 = _Block_copy(v10);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_submitBugReport_userInfo_withMaximumSubmissionCadence_, a1, v8, dbl_1A942AD90[v6]);
  _Block_release(v8);
  return swift_release();
}

uint64_t sub_1A93F2160(uint64_t a1, void *aBlock)
{
  void (*v2)(void (*)(), uint64_t);
  void *v3;
  uint64_t v4;

  v2 = *(void (**)(void (*)(), uint64_t))(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_1A93F27A0, v4);
  swift_release();
  return swift_release();
}

uint64_t sub_1A93F21D0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A93F21F4(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 + 16));
}

void sub_1A93F221C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  PFAutoBugCaptureBugReporter.prepare(bugReport:maximumFrequency:checkBlock:)(a1, a2, a3, a4);
}

uint64_t sub_1A93F223C(uint64_t a1, char *a2, uint64_t a3)
{
  return PFAutoBugCaptureBugReporter.submit(bugReport:maximumFrequency:userInfo:)(a1, a2, a3);
}

id PFBugReporterBridge.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PFBugReporterBridge.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PFBugReporterBridge.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s18PodcastsFoundation19PFBugReporterBridgeC23reportKeyIntegrityErroryyFZ_0()
{
  objc_class *v0;
  _BYTE *v1;
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];
  objc_super v9;

  v0 = (objc_class *)type metadata accessor for BugReport();
  v1 = objc_allocWithZone(v0);
  v1[OBJC_IVAR___PFBugReport_system] = 23;
  v1[OBJC_IVAR___PFBugReport_errorKind] = 4;
  v1[OBJC_IVAR___PFBugReport_forceSubmissionAttempt] = 0;
  v9.receiver = v1;
  v9.super_class = v0;
  v2 = objc_msgSendSuper2(&v9, sel_init);
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v4 = sub_1A91129D8(MEMORY[0x1E0DEE9D8]);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v8[4] = sub_1A93F280C;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1A93F2160;
  v8[3] = &block_descriptor_17_8;
  v6 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_submitBugReport_userInfo_withMaximumSubmissionCadence_, v2, v6, 3600.0);
  _Block_release(v6);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t _s18PodcastsFoundation19PFBugReporterBridgeC31reportMissingFairPlayOfflineKeyyyFZ_0()
{
  objc_class *v0;
  _BYTE *v1;
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];
  objc_super v9;

  v0 = (objc_class *)type metadata accessor for BugReport();
  v1 = objc_allocWithZone(v0);
  v1[OBJC_IVAR___PFBugReport_system] = 23;
  v1[OBJC_IVAR___PFBugReport_errorKind] = 3;
  v1[OBJC_IVAR___PFBugReport_forceSubmissionAttempt] = 0;
  v9.receiver = v1;
  v9.super_class = v0;
  v2 = objc_msgSendSuper2(&v9, sel_init);
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v4 = sub_1A91129D8(MEMORY[0x1E0DEE9D8]);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v8[4] = sub_1A93F280C;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1A93F2160;
  v8[3] = &block_descriptor_10_9;
  v6 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_submitBugReport_userInfo_withMaximumSubmissionCadence_, v2, v6, 3600.0);
  _Block_release(v6);
  swift_bridgeObjectRelease();

  return swift_release();
}

unint64_t sub_1A93F263C()
{
  unint64_t result;

  result = qword_1EEAC0BA0;
  if (!qword_1EEAC0BA0)
  {
    result = MEMORY[0x1AF414014](&protocol conformance descriptor for BugReportFrequency, &type metadata for BugReportFrequency);
    atomic_store(result, (unint64_t *)&qword_1EEAC0BA0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for BugReportFrequency(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A93F26CC + 4 * byte_1A942AC35[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A93F2700 + 4 * asc_1A942AC30[v4]))();
}

uint64_t sub_1A93F2700(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93F2708(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A93F2710);
  return result;
}

uint64_t sub_1A93F271C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A93F2724);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A93F2728(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A93F2730(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BugReportFrequency()
{
  return &type metadata for BugReportFrequency;
}

uint64_t dispatch thunk of BugReporter.prepare(bugReport:maximumFrequency:checkBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of BugReporter.submit(bugReport:maximumFrequency:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t type metadata accessor for PFBugReporterBridge()
{
  return objc_opt_self();
}

uint64_t sub_1A93F277C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1A93F27A0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_1A93F7ED8();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

_QWORD *sub_1A93F2810(_QWORD *result)
{
  *result = ++qword_1EEAED2E0;
  return result;
}

void sub_1A93F282C(uint64_t a1)
{
  int v1;

  if (a1)
    v1 = 1;
  else
    v1 = 2;
  __asm { BR              X10 }
}

uint64_t sub_1A93F2870()
{
  return 4294925273;
}

void sub_1A93F28E8(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1A93F2938@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v3 = -21985948 * v1;
  v4 = v3 - 4 * a1 + 6;
  if (((uint64_t (*)(uint64_t))((char *)*(&off_1E5500580 + v3 - 4 * a1 + 10) - 2))(200))
    v5 = v4;
  else
    v5 = v4 + 1;
  return ((uint64_t (*)())((char *)sub_1A93F2938 + *(int *)(v2 + 4 * v5)))();
}

uint64_t sub_1A93F29A0@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  _QWORD *v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  int v8;

  v8 = ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v5 + 8 * (v6 + a2 * (v4 - 2) + 21985954)) - 2))(a1, 0);
  if (v8 == 16)
  {
    v3 = 1537719254;
    goto LABEL_7;
  }
  if (v8 == 12)
  {
LABEL_7:
    ((void (*)(uint64_t))(*(_QWORD *)(v5 + 8 * (v4 + 21985952)) - 2))(a1);
    return (1510190423 * v3 + 277669913);
  }
  if (v8)
  {
    v3 = 292433263;
    goto LABEL_7;
  }
  *v2 = a1;
  v3 = 1191165937;
  return (1510190423 * v3 + 277669913);
}

void fd3fa4R8(int a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1A93F2AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  int v21;
  int v22;

  v22 = -7 * v21 - 191875505 * (v21 ^ 1) + 8;
  *(&a21 + 16 * (_QWORD)&a21 - 144 * (((unint64_t)&a9 - 0x36F214C141B3E0AELL) / 9) - 0x6F214C141B3E10D1) = *((_BYTE *)*(&off_1E5500580 + v22 + 17) + 5) ^ *(_BYTE *)(a2 + 15) ^ 0xD1 ^ *((_BYTE *)*(&off_1E5500580 + v22 + 22) + 16) ^ *((_BYTE *)*(&off_1E5500580 + v22 + 12) + 12);
  return ((uint64_t (*)(void))((char *)&loc_1A93F2BBC + *(int *)(a5 + 4 * v22)))();
}

void sub_1A93F2BB8()
{
  JUMPOUT(0x1A93F2B44);
}

uint64_t sub_1A93F2BC8()
{
  return 4294925273;
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  BOOL v6;

  if (qword_1ED2B63C0 == -1)
  {
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1ED2B63C0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  if (v6)
    return 0;
  if (dword_1ED2B63B4 > a2)
    return 1;
  return dword_1ED2B63B4 >= a2 && dword_1ED2B63B8 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_1ED2B63C8 == -1)
  {
    if (qword_1ED2B63D0)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_1ED2B63C8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1ED2B63D0)
      return _availability_version_check();
  }
  if (qword_1ED2B63C0 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1ED2B63C0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_1ED2B63B4 > a3)
    return 1;
  return dword_1ED2B63B4 >= a3 && dword_1ED2B63B8 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t (*)(void))qword_1ED2B63D0;
  if (qword_1ED2B63D0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x1E0C80CC0])
    {
      qword_1ED2B63D0 = (uint64_t)MEMORY[0x1E0C80CC0];
      v1 = MEMORY[0x1E0C80CC0];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x1AF4137D4](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1ED2B63B4, &dword_1ED2B63B8);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t getkSymptomDiagnosticReplySuccess_cold_1()
{
  dlerror();
  abort_report_np();
  return __getSDRDiagnosticReporterClass_block_invoke_cold_1();
}

uint64_t __getSDRDiagnosticReporterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[MTEpisode(Core) setPodcastUuid:].cold.1(v0);
}

uint64_t __getASDSubscriptionEntitlementsClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[IMAVSecureKeyLoader startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:].cold.1(v0);
}

uint64_t sub_1A93F6D08()
{
  return MEMORY[0x1E0CADEB0]();
}

uint64_t sub_1A93F6D14()
{
  return MEMORY[0x1E0CADEB8]();
}

uint64_t sub_1A93F6D20()
{
  return MEMORY[0x1E0CADED8]();
}

uint64_t sub_1A93F6D2C()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1A93F6D38()
{
  return MEMORY[0x1E0CADEF8]();
}

uint64_t sub_1A93F6D44()
{
  return MEMORY[0x1E0CADF08]();
}

uint64_t sub_1A93F6D50()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1A93F6D5C()
{
  return MEMORY[0x1E0CADF18]();
}

uint64_t sub_1A93F6D68()
{
  return MEMORY[0x1E0CADF30]();
}

uint64_t sub_1A93F6D74()
{
  return MEMORY[0x1E0CADF40]();
}

uint64_t sub_1A93F6D80()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1A93F6D8C()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1A93F6D98()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1A93F6DA4()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1A93F6DB0()
{
  return MEMORY[0x1E0CAE0D0]();
}

uint64_t sub_1A93F6DBC()
{
  return MEMORY[0x1E0CAE0E0]();
}

uint64_t sub_1A93F6DC8()
{
  return MEMORY[0x1E0CAE108]();
}

uint64_t sub_1A93F6DD4()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1A93F6DE0()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1A93F6DEC()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1A93F6DF8()
{
  return MEMORY[0x1E0CAE390]();
}

uint64_t sub_1A93F6E04()
{
  return MEMORY[0x1E0CAE3A0]();
}

uint64_t sub_1A93F6E10()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1A93F6E1C()
{
  return MEMORY[0x1E0CAE488]();
}

uint64_t sub_1A93F6E28()
{
  return MEMORY[0x1E0CAE498]();
}

uint64_t sub_1A93F6E34()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1A93F6E40()
{
  return MEMORY[0x1E0CAE578]();
}

uint64_t sub_1A93F6E4C()
{
  return MEMORY[0x1E0CAE5C0]();
}

uint64_t sub_1A93F6E58()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1A93F6E64()
{
  return MEMORY[0x1E0CAE628]();
}

uint64_t sub_1A93F6E70()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1A93F6E7C()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1A93F6E88()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1A93F6E94()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_1A93F6EA0()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_1A93F6EAC()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1A93F6EB8()
{
  return MEMORY[0x1E0CAE760]();
}

uint64_t sub_1A93F6EC4()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_1A93F6ED0()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1A93F6EDC()
{
  return MEMORY[0x1E0CAE788]();
}

uint64_t sub_1A93F6EE8()
{
  return MEMORY[0x1E0CAE7E0]();
}

uint64_t sub_1A93F6EF4()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_1A93F6F00()
{
  return MEMORY[0x1E0CAE800]();
}

uint64_t sub_1A93F6F0C()
{
  return MEMORY[0x1E0CAE808]();
}

uint64_t sub_1A93F6F18()
{
  return MEMORY[0x1E0CAE840]();
}

uint64_t sub_1A93F6F24()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1A93F6F30()
{
  return MEMORY[0x1E0CAE858]();
}

uint64_t sub_1A93F6F3C()
{
  return MEMORY[0x1E0CAE860]();
}

uint64_t sub_1A93F6F48()
{
  return MEMORY[0x1E0CAE870]();
}

uint64_t sub_1A93F6F54()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1A93F6F60()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1A93F6F6C()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1A93F6F78()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1A93F6F84()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1A93F6F90()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1A93F6F9C()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1A93F6FA8()
{
  return MEMORY[0x1E0CAE9F0]();
}

uint64_t sub_1A93F6FB4()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_1A93F6FC0()
{
  return MEMORY[0x1E0CAEA00]();
}

uint64_t sub_1A93F6FCC()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1A93F6FD8()
{
  return MEMORY[0x1E0CAEA40]();
}

uint64_t sub_1A93F6FE4()
{
  return MEMORY[0x1E0CAEA48]();
}

uint64_t sub_1A93F6FF0()
{
  return MEMORY[0x1E0CAEA50]();
}

uint64_t sub_1A93F6FFC()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1A93F7008()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1A93F7014()
{
  return MEMORY[0x1E0CAEEB8]();
}

uint64_t sub_1A93F7020()
{
  return MEMORY[0x1E0CAEEC0]();
}

uint64_t sub_1A93F702C()
{
  return MEMORY[0x1E0CAEEC8]();
}

uint64_t sub_1A93F7038()
{
  return MEMORY[0x1E0CAEED0]();
}

uint64_t sub_1A93F7044()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1A93F7050()
{
  return MEMORY[0x1E0CAF370]();
}

uint64_t sub_1A93F705C()
{
  return MEMORY[0x1E0CAF3A0]();
}

uint64_t sub_1A93F7068()
{
  return MEMORY[0x1E0CAF3C0]();
}

uint64_t sub_1A93F7074()
{
  return MEMORY[0x1E0CAF3D8]();
}

uint64_t sub_1A93F7080()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1A93F708C()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1A93F7098()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1A93F70A4()
{
  return MEMORY[0x1E0CAF628]();
}

uint64_t sub_1A93F70B0()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1A93F70BC()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1A93F70C8()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1A93F70D4()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1A93F70E0()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1A93F70EC()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1A93F70F8()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1A93F7104()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1A93F7110()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1A93F711C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1A93F7128()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1A93F7134()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1A93F7140()
{
  return MEMORY[0x1E0CAFD30]();
}

uint64_t sub_1A93F714C()
{
  return MEMORY[0x1E0CAFD40]();
}

uint64_t sub_1A93F7158()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1A93F7164()
{
  return MEMORY[0x1E0CAFD98]();
}

uint64_t sub_1A93F7170()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1A93F717C()
{
  return MEMORY[0x1E0CAFDC0]();
}

uint64_t sub_1A93F7188()
{
  return MEMORY[0x1E0CAFDF0]();
}

uint64_t sub_1A93F7194()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1A93F71A0()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1A93F71AC()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1A93F71B8()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1A93F71C4()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1A93F71D0()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1A93F71DC()
{
  return MEMORY[0x1E0CAFEC0]();
}

uint64_t sub_1A93F71E8()
{
  return MEMORY[0x1E0CAFED0]();
}

uint64_t sub_1A93F71F4()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1A93F7200()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1A93F720C()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_1A93F7218()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1A93F7224()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1A93F7230()
{
  return MEMORY[0x1E0CAFF68]();
}

uint64_t sub_1A93F723C()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_1A93F7248()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1A93F7254()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1A93F7260()
{
  return MEMORY[0x1E0CAFFE0]();
}

uint64_t sub_1A93F726C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A93F7278()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1A93F7284()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_1A93F7290()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1A93F729C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1A93F72A8()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1A93F72B4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1A93F72C0()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1A93F72CC()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1A93F72D8()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1A93F72E4()
{
  return MEMORY[0x1E0CB03D0]();
}

uint64_t sub_1A93F72F0()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1A93F72FC()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1A93F7308()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1A93F7314()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1A93F7320()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1A93F732C()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1A93F7338()
{
  return MEMORY[0x1E0CB06E8]();
}

uint64_t sub_1A93F7344()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1A93F7350()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1A93F735C()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1A93F7368()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1A93F7374()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1A93F7380()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1A93F738C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A93F7398()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1A93F73A4()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1A93F73B0()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1A93F73BC()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1A93F73C8()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1A93F73D4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1A93F73E0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A93F73EC()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1A93F73F8()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1A93F7404()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1A93F7410()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1A93F741C()
{
  return MEMORY[0x1E0CB0F60]();
}

uint64_t sub_1A93F7428()
{
  return MEMORY[0x1E0CB0F80]();
}

uint64_t sub_1A93F7434()
{
  return MEMORY[0x1E0CB0FA0]();
}

uint64_t sub_1A93F7440()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1A93F744C()
{
  return MEMORY[0x1E0CB1030]();
}

uint64_t sub_1A93F7458()
{
  return MEMORY[0x1E0CB1050]();
}

uint64_t sub_1A93F7464()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1A93F7470()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1A93F747C()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1A93F7488()
{
  return MEMORY[0x1E0CB11E0]();
}

uint64_t sub_1A93F7494()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1A93F74A0()
{
  return MEMORY[0x1E0CB1438]();
}

uint64_t sub_1A93F74AC()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_1A93F74B8()
{
  return MEMORY[0x1E0CB1448]();
}

uint64_t sub_1A93F74C4()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1A93F74D0()
{
  return MEMORY[0x1E0CB15E0]();
}

uint64_t sub_1A93F74DC()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1A93F74E8()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1A93F74F4()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1A93F7500()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1A93F750C()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_1A93F7518()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_1A93F7524()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_1A93F7530()
{
  return MEMORY[0x1E0DF1EB8]();
}

uint64_t sub_1A93F753C()
{
  return MEMORY[0x1E0DF0190]();
}

uint64_t sub_1A93F7548()
{
  return MEMORY[0x1E0DF01E8]();
}

uint64_t sub_1A93F7554()
{
  return MEMORY[0x1E0DF0248]();
}

uint64_t sub_1A93F7560()
{
  return MEMORY[0x1E0DF0268]();
}

uint64_t sub_1A93F756C()
{
  return MEMORY[0x1E0DF0278]();
}

uint64_t sub_1A93F7578()
{
  return MEMORY[0x1E0DF0298]();
}

uint64_t sub_1A93F7584()
{
  return MEMORY[0x1E0DF02C0]();
}

uint64_t sub_1A93F7590()
{
  return MEMORY[0x1E0DF02E0]();
}

uint64_t sub_1A93F759C()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1A93F75A8()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1A93F75B4()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t sub_1A93F75C0()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1A93F75CC()
{
  return MEMORY[0x1E0DF20F8]();
}

uint64_t sub_1A93F75D8()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1A93F75E4()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1A93F75F0()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1A93F75FC()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1A93F7608()
{
  return MEMORY[0x1E0DF2128]();
}

uint64_t sub_1A93F7614()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_1A93F7620()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1A93F762C()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1A93F7638()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1A93F7644()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1A93F7650()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1A93F765C()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1A93F7668()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1A93F7674()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A93F7680()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1A93F768C()
{
  return MEMORY[0x1E0DF2250]();
}

uint64_t sub_1A93F7698()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A93F76A4()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1A93F76B0()
{
  return MEMORY[0x1E0C95640]();
}

uint64_t sub_1A93F76BC()
{
  return MEMORY[0x1E0C95650]();
}

uint64_t sub_1A93F76C8()
{
  return MEMORY[0x1E0C95658]();
}

uint64_t sub_1A93F76D4()
{
  return MEMORY[0x1E0C95660]();
}

uint64_t sub_1A93F76E0()
{
  return MEMORY[0x1E0C956A0]();
}

uint64_t sub_1A93F76EC()
{
  return MEMORY[0x1E0C956B0]();
}

uint64_t sub_1A93F76F8()
{
  return MEMORY[0x1E0C956C0]();
}

uint64_t sub_1A93F7704()
{
  return MEMORY[0x1E0C956D0]();
}

uint64_t sub_1A93F7710()
{
  return MEMORY[0x1E0C956E0]();
}

uint64_t sub_1A93F771C()
{
  return MEMORY[0x1E0C956E8]();
}

uint64_t sub_1A93F7728()
{
  return MEMORY[0x1E0C956F0]();
}

uint64_t sub_1A93F7734()
{
  return MEMORY[0x1E0C956F8]();
}

uint64_t sub_1A93F7740()
{
  return MEMORY[0x1E0C95758]();
}

uint64_t sub_1A93F774C()
{
  return MEMORY[0x1E0C95778]();
}

uint64_t sub_1A93F7758()
{
  return MEMORY[0x1E0C95790]();
}

uint64_t sub_1A93F7764()
{
  return MEMORY[0x1E0C957A8]();
}

uint64_t sub_1A93F7770()
{
  return MEMORY[0x1E0C957B0]();
}

uint64_t sub_1A93F777C()
{
  return MEMORY[0x1E0C957D8]();
}

uint64_t sub_1A93F7788()
{
  return MEMORY[0x1E0C95840]();
}

uint64_t sub_1A93F7794()
{
  return MEMORY[0x1E0C95858]();
}

uint64_t sub_1A93F77A0()
{
  return MEMORY[0x1E0C95860]();
}

uint64_t sub_1A93F77AC()
{
  return MEMORY[0x1E0C958C8]();
}

uint64_t sub_1A93F77B8()
{
  return MEMORY[0x1E0C958D0]();
}

uint64_t sub_1A93F77C4()
{
  return MEMORY[0x1E0C95930]();
}

uint64_t sub_1A93F77D0()
{
  return MEMORY[0x1E0C95938]();
}

uint64_t sub_1A93F77DC()
{
  return MEMORY[0x1E0C95940]();
}

uint64_t sub_1A93F77E8()
{
  return MEMORY[0x1E0C959A8]();
}

uint64_t sub_1A93F77F4()
{
  return MEMORY[0x1E0C959E8]();
}

uint64_t sub_1A93F7800()
{
  return MEMORY[0x1E0C95A58]();
}

uint64_t sub_1A93F780C()
{
  return MEMORY[0x1E0C95A68]();
}

uint64_t sub_1A93F7818()
{
  return MEMORY[0x1E0C95A90]();
}

uint64_t sub_1A93F7824()
{
  return MEMORY[0x1E0C95B28]();
}

uint64_t sub_1A93F7830()
{
  return MEMORY[0x1E0C95B30]();
}

uint64_t sub_1A93F783C()
{
  return MEMORY[0x1E0C95B38]();
}

uint64_t sub_1A93F7848()
{
  return MEMORY[0x1E0C95B68]();
}

uint64_t sub_1A93F7854()
{
  return MEMORY[0x1E0C95BB8]();
}

uint64_t sub_1A93F7860()
{
  return MEMORY[0x1E0C95BF0]();
}

uint64_t sub_1A93F786C()
{
  return MEMORY[0x1E0C95C00]();
}

uint64_t sub_1A93F7878()
{
  return MEMORY[0x1E0C95C88]();
}

uint64_t sub_1A93F7884()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t sub_1A93F7890()
{
  return MEMORY[0x1E0C95CD8]();
}

uint64_t sub_1A93F789C()
{
  return MEMORY[0x1E0C95CE0]();
}

uint64_t sub_1A93F78A8()
{
  return MEMORY[0x1E0C95CE8]();
}

uint64_t sub_1A93F78B4()
{
  return MEMORY[0x1E0C95D08]();
}

uint64_t sub_1A93F78C0()
{
  return MEMORY[0x1E0C95D20]();
}

uint64_t sub_1A93F78CC()
{
  return MEMORY[0x1E0C95D40]();
}

uint64_t sub_1A93F78D8()
{
  return MEMORY[0x1E0C95D48]();
}

uint64_t sub_1A93F78E4()
{
  return MEMORY[0x1E0C95D50]();
}

uint64_t sub_1A93F78F0()
{
  return MEMORY[0x1E0C95D70]();
}

uint64_t sub_1A93F78FC()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1A93F7908()
{
  return MEMORY[0x1E0C95DB0]();
}

uint64_t sub_1A93F7914()
{
  return MEMORY[0x1E0C95DD0]();
}

uint64_t sub_1A93F7920()
{
  return MEMORY[0x1E0C95DD8]();
}

uint64_t sub_1A93F792C()
{
  return MEMORY[0x1E0C95DE0]();
}

uint64_t sub_1A93F7938()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1A93F7944()
{
  return MEMORY[0x1E0C95E50]();
}

uint64_t sub_1A93F7950()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1A93F795C()
{
  return MEMORY[0x1E0C95EE8]();
}

uint64_t sub_1A93F7968()
{
  return MEMORY[0x1E0C95F00]();
}

uint64_t sub_1A93F7974()
{
  return MEMORY[0x1E0C95F08]();
}

uint64_t sub_1A93F7980()
{
  return MEMORY[0x1E0C95F18]();
}

uint64_t sub_1A93F798C()
{
  return MEMORY[0x1E0C95F20]();
}

uint64_t sub_1A93F7998()
{
  return MEMORY[0x1E0C95F28]();
}

uint64_t sub_1A93F79A4()
{
  return MEMORY[0x1E0C95F50]();
}

uint64_t sub_1A93F79B0()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1A93F79BC()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1A93F79C8()
{
  return MEMORY[0x1E0C95F80]();
}

uint64_t sub_1A93F79D4()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t sub_1A93F79E0()
{
  return MEMORY[0x1E0C95FA0]();
}

uint64_t sub_1A93F79EC()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1A93F79F8()
{
  return MEMORY[0x1E0C95FC0]();
}

uint64_t sub_1A93F7A04()
{
  return MEMORY[0x1E0C95FC8]();
}

uint64_t sub_1A93F7A10()
{
  return MEMORY[0x1E0C96018]();
}

uint64_t sub_1A93F7A1C()
{
  return MEMORY[0x1E0C96050]();
}

uint64_t sub_1A93F7A28()
{
  return MEMORY[0x1E0C96070]();
}

uint64_t sub_1A93F7A34()
{
  return MEMORY[0x1E0C96078]();
}

uint64_t sub_1A93F7A40()
{
  return MEMORY[0x1E0C96090]();
}

uint64_t sub_1A93F7A4C()
{
  return MEMORY[0x1E0C96098]();
}

uint64_t sub_1A93F7A58()
{
  return MEMORY[0x1E0C960A8]();
}

uint64_t sub_1A93F7A64()
{
  return MEMORY[0x1E0C960B8]();
}

uint64_t sub_1A93F7A70()
{
  return MEMORY[0x1E0C960D8]();
}

uint64_t sub_1A93F7A7C()
{
  return MEMORY[0x1E0C960F0]();
}

uint64_t sub_1A93F7A88()
{
  return MEMORY[0x1E0C960F8]();
}

uint64_t sub_1A93F7A94()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t sub_1A93F7AA0()
{
  return MEMORY[0x1E0C96128]();
}

uint64_t sub_1A93F7AAC()
{
  return MEMORY[0x1E0C96130]();
}

uint64_t sub_1A93F7AB8()
{
  return MEMORY[0x1E0C96138]();
}

uint64_t sub_1A93F7AC4()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1A93F7AD0()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1A93F7ADC()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1A93F7AE8()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1A93F7AF4()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1A93F7B00()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1A93F7B0C()
{
  return MEMORY[0x1E0C961B8]();
}

uint64_t sub_1A93F7B18()
{
  return MEMORY[0x1E0C961C0]();
}

uint64_t sub_1A93F7B24()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1A93F7B30()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t sub_1A93F7B3C()
{
  return MEMORY[0x1E0C961E0]();
}

uint64_t sub_1A93F7B48()
{
  return MEMORY[0x1E0C961F0]();
}

uint64_t sub_1A93F7B54()
{
  return MEMORY[0x1E0C96208]();
}

uint64_t sub_1A93F7B60()
{
  return MEMORY[0x1E0C96218]();
}

uint64_t sub_1A93F7B6C()
{
  return MEMORY[0x1E0C96220]();
}

uint64_t sub_1A93F7B78()
{
  return MEMORY[0x1E0C96240]();
}

uint64_t sub_1A93F7B84()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1A93F7B90()
{
  return MEMORY[0x1E0C96280]();
}

uint64_t sub_1A93F7B9C()
{
  return MEMORY[0x1E0C96288]();
}

uint64_t sub_1A93F7BA8()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1A93F7BB4()
{
  return MEMORY[0x1E0C96298]();
}

uint64_t sub_1A93F7BC0()
{
  return MEMORY[0x1E0C962C0]();
}

uint64_t sub_1A93F7BCC()
{
  return MEMORY[0x1E0C962C8]();
}

uint64_t sub_1A93F7BD8()
{
  return MEMORY[0x1E0C962D0]();
}

uint64_t sub_1A93F7BE4()
{
  return MEMORY[0x1E0C962E0]();
}

uint64_t sub_1A93F7BF0()
{
  return MEMORY[0x1E0C962F0]();
}

uint64_t sub_1A93F7BFC()
{
  return MEMORY[0x1E0C962F8]();
}

uint64_t sub_1A93F7C08()
{
  return MEMORY[0x1E0C96308]();
}

uint64_t sub_1A93F7C14()
{
  return MEMORY[0x1E0C96318]();
}

uint64_t sub_1A93F7C20()
{
  return MEMORY[0x1E0C96328]();
}

uint64_t sub_1A93F7C2C()
{
  return MEMORY[0x1E0C96330]();
}

uint64_t sub_1A93F7C38()
{
  return MEMORY[0x1E0C96338]();
}

uint64_t sub_1A93F7C44()
{
  return MEMORY[0x1E0C96348]();
}

uint64_t sub_1A93F7C50()
{
  return MEMORY[0x1E0C96350]();
}

uint64_t sub_1A93F7C5C()
{
  return MEMORY[0x1E0C96358]();
}

uint64_t sub_1A93F7C68()
{
  return MEMORY[0x1E0C96360]();
}

uint64_t sub_1A93F7C74()
{
  return MEMORY[0x1E0C96368]();
}

uint64_t sub_1A93F7C80()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1A93F7C8C()
{
  return MEMORY[0x1E0C96388]();
}

uint64_t sub_1A93F7C98()
{
  return MEMORY[0x1E0C96390]();
}

uint64_t sub_1A93F7CA4()
{
  return MEMORY[0x1E0C96398]();
}

uint64_t sub_1A93F7CB0()
{
  return MEMORY[0x1E0C963B8]();
}

uint64_t sub_1A93F7CBC()
{
  return MEMORY[0x1E0C963C8]();
}

uint64_t sub_1A93F7CC8()
{
  return MEMORY[0x1E0C963D0]();
}

uint64_t sub_1A93F7CD4()
{
  return MEMORY[0x1E0C963D8]();
}

uint64_t sub_1A93F7CE0()
{
  return MEMORY[0x1E0C963E8]();
}

uint64_t sub_1A93F7CEC()
{
  return MEMORY[0x1E0C963F0]();
}

uint64_t sub_1A93F7CF8()
{
  return MEMORY[0x1E0C96400]();
}

uint64_t sub_1A93F7D04()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1A93F7D10()
{
  return MEMORY[0x1E0C96418]();
}

uint64_t sub_1A93F7D1C()
{
  return MEMORY[0x1E0C96428]();
}

uint64_t sub_1A93F7D28()
{
  return MEMORY[0x1E0C96430]();
}

uint64_t sub_1A93F7D34()
{
  return MEMORY[0x1E0C96438]();
}

uint64_t sub_1A93F7D40()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1A93F7D4C()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_1A93F7D58()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A93F7D64()
{
  return MEMORY[0x1E0DEF558]();
}

uint64_t sub_1A93F7D70()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1A93F7D7C()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1A93F7D88()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A93F7D94()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1A93F7DA0()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1A93F7DAC()
{
  return MEMORY[0x1E0DEF5A8]();
}

uint64_t sub_1A93F7DB8()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A93F7DC4()
{
  return MEMORY[0x1E0DEF688]();
}

uint64_t sub_1A93F7DD0()
{
  return MEMORY[0x1E0DEF690]();
}

uint64_t sub_1A93F7DDC()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1A93F7DE8()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1A93F7DF4()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1A93F7E00()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1A93F7E0C()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1A93F7E18()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1A93F7E24()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1A93F7E30()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1A93F7E3C()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1A93F7E48()
{
  return MEMORY[0x1E0DEEFD0]();
}

uint64_t sub_1A93F7E54()
{
  return MEMORY[0x1E0DEF150]();
}

uint64_t sub_1A93F7E60()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1A93F7E6C()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t sub_1A93F7E78()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t sub_1A93F7E84()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1A93F7E90()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1A93F7E9C()
{
  return MEMORY[0x1E0CA9A18]();
}

uint64_t sub_1A93F7EA8()
{
  return MEMORY[0x1E0CA9A48]();
}

uint64_t sub_1A93F7EB4()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_1A93F7EC0()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1A93F7ECC()
{
  return MEMORY[0x1E0DE9D78]();
}

uint64_t sub_1A93F7ED8()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1A93F7EE4()
{
  return MEMORY[0x1E0CB17E8]();
}

uint64_t sub_1A93F7EF0()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1A93F7EFC()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1A93F7F08()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1A93F7F14()
{
  return MEMORY[0x1E0DE9E40]();
}

uint64_t sub_1A93F7F20()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1A93F7F2C()
{
  return MEMORY[0x1E0DE9E80]();
}

uint64_t sub_1A93F7F38()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_1A93F7F44()
{
  return MEMORY[0x1E0DE9F78]();
}

uint64_t sub_1A93F7F50()
{
  return MEMORY[0x1E0DEA040]();
}

uint64_t sub_1A93F7F5C()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1A93F7F68()
{
  return MEMORY[0x1E0DEA058]();
}

uint64_t sub_1A93F7F74()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1A93F7F80()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1A93F7F8C()
{
  return MEMORY[0x1E0DEA100]();
}

uint64_t sub_1A93F7F98()
{
  return MEMORY[0x1E0DEA138]();
}

uint64_t sub_1A93F7FA4()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1A93F7FB0()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1A93F7FBC()
{
  return MEMORY[0x1E0DEA2A0]();
}

uint64_t sub_1A93F7FC8()
{
  return MEMORY[0x1E0DF1F80]();
}

uint64_t sub_1A93F7FD4()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t sub_1A93F7FE0()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1A93F7FEC()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1A93F7FF8()
{
  return MEMORY[0x1E0DEA4B0]();
}

uint64_t sub_1A93F8004()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A93F8010()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A93F801C()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1A93F8028()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1A93F8034()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1A93F8040()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A93F804C()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1A93F8058()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1A93F8064()
{
  return MEMORY[0x1E0CB19B0]();
}

uint64_t sub_1A93F8070()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1A93F807C()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1A93F8088()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1A93F8094()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1A93F80A0()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1A93F80AC()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1A93F80B8()
{
  return MEMORY[0x1E0DEA668]();
}

uint64_t sub_1A93F80C4()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1A93F80D0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A93F80DC()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1A93F80E8()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1A93F80F4()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1A93F8100()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1A93F810C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A93F8118()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1A93F8124()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1A93F8130()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1A93F813C()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1A93F8148()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1A93F8154()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1A93F8160()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1A93F816C()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1A93F8178()
{
  return MEMORY[0x1E0DEA958]();
}

uint64_t sub_1A93F8184()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1A93F8190()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1A93F819C()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1A93F81A8()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1A93F81B4()
{
  return MEMORY[0x1E0DEAA68]();
}

uint64_t sub_1A93F81C0()
{
  return MEMORY[0x1E0C96490]();
}

uint64_t sub_1A93F81CC()
{
  return MEMORY[0x1E0DEAAA0]();
}

uint64_t sub_1A93F81D8()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1A93F81E4()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_1A93F81F0()
{
  return MEMORY[0x1E0DEAAF8]();
}

uint64_t sub_1A93F81FC()
{
  return MEMORY[0x1E0DEAB00]();
}

uint64_t sub_1A93F8208()
{
  return MEMORY[0x1E0DEAB08]();
}

uint64_t sub_1A93F8214()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_1A93F8220()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t sub_1A93F822C()
{
  return MEMORY[0x1E0DEAB30]();
}

uint64_t sub_1A93F8238()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1A93F8244()
{
  return MEMORY[0x1E0DEAB48]();
}

uint64_t sub_1A93F8250()
{
  return MEMORY[0x1E0DEAB88]();
}

uint64_t sub_1A93F825C()
{
  return MEMORY[0x1E0DEABA0]();
}

uint64_t sub_1A93F8268()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_1A93F8274()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1A93F8280()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t sub_1A93F828C()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1A93F8298()
{
  return MEMORY[0x1E0DEACB0]();
}

uint64_t sub_1A93F82A4()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1A93F82B0()
{
  return MEMORY[0x1E0DEACD8]();
}

uint64_t sub_1A93F82BC()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1A93F82C8()
{
  return MEMORY[0x1E0DEAD28]();
}

uint64_t sub_1A93F82D4()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1A93F82E0()
{
  return MEMORY[0x1E0DEAD50]();
}

uint64_t sub_1A93F82EC()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1A93F82F8()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A93F8304()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1A93F8310()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A93F831C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1A93F8328()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A93F8334()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1A93F8340()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1A93F834C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1A93F8358()
{
  return MEMORY[0x1E0DEADF8]();
}

uint64_t sub_1A93F8364()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_1A93F8370()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A93F837C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1A93F8388()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1A93F8394()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1A93F83A0()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1A93F83AC()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1A93F83B8()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1A93F83C4()
{
  return MEMORY[0x1E0DEAEA0]();
}

uint64_t sub_1A93F83D0()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A93F83DC()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t sub_1A93F83E8()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1A93F83F4()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1A93F8400()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1A93F840C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1A93F8418()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1A93F8424()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1A93F8430()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1A93F843C()
{
  return MEMORY[0x1E0DF05F0]();
}

uint64_t sub_1A93F8448()
{
  return MEMORY[0x1E0DF0600]();
}

uint64_t sub_1A93F8454()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1A93F8460()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_1A93F846C()
{
  return MEMORY[0x1E0DF06D0]();
}

uint64_t sub_1A93F8478()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_1A93F8484()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1A93F8490()
{
  return MEMORY[0x1E0DF0728]();
}

uint64_t sub_1A93F849C()
{
  return MEMORY[0x1E0DF0730]();
}

uint64_t sub_1A93F84A8()
{
  return MEMORY[0x1E0DF0738]();
}

uint64_t sub_1A93F84B4()
{
  return MEMORY[0x1E0DF0740]();
}

uint64_t sub_1A93F84C0()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1A93F84CC()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1A93F84D8()
{
  return MEMORY[0x1E0DF07A0]();
}

uint64_t sub_1A93F84E4()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1A93F84F0()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_1A93F84FC()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1A93F8508()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1A93F8514()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1A93F8520()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1A93F852C()
{
  return MEMORY[0x1E0DF0928]();
}

uint64_t sub_1A93F8538()
{
  return MEMORY[0x1E0DF0938]();
}

uint64_t sub_1A93F8544()
{
  return MEMORY[0x1E0DF0950]();
}

uint64_t sub_1A93F8550()
{
  return MEMORY[0x1E0DF0958]();
}

uint64_t sub_1A93F855C()
{
  return MEMORY[0x1E0DF0978]();
}

uint64_t sub_1A93F8568()
{
  return MEMORY[0x1E0DF0980]();
}

uint64_t sub_1A93F8574()
{
  return MEMORY[0x1E0DF0990]();
}

uint64_t sub_1A93F8580()
{
  return MEMORY[0x1E0DF09B0]();
}

uint64_t sub_1A93F858C()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1A93F8598()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1A93F85A4()
{
  return MEMORY[0x1E0CB1B68]();
}

uint64_t sub_1A93F85B0()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1A93F85BC()
{
  return MEMORY[0x1E0DEB008]();
}

uint64_t sub_1A93F85C8()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1A93F85D4()
{
  return MEMORY[0x1E0DEB048]();
}

uint64_t sub_1A93F85E0()
{
  return MEMORY[0x1E0DEB160]();
}

uint64_t sub_1A93F85EC()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1A93F85F8()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1A93F8604()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1A93F8610()
{
  return MEMORY[0x1E0DEB228]();
}

uint64_t sub_1A93F861C()
{
  return MEMORY[0x1E0DEB230]();
}

uint64_t sub_1A93F8628()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1A93F8634()
{
  return MEMORY[0x1E0DEB288]();
}

uint64_t sub_1A93F8640()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1A93F864C()
{
  return MEMORY[0x1E0DEB2C8]();
}

uint64_t sub_1A93F8658()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t sub_1A93F8664()
{
  return MEMORY[0x1E0DEB2F0]();
}

uint64_t sub_1A93F8670()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1A93F867C()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1A93F8688()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_1A93F8694()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1A93F86A0()
{
  return MEMORY[0x1E0CB1C20]();
}

uint64_t sub_1A93F86AC()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1A93F86B8()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1A93F86C4()
{
  return MEMORY[0x1E0DEB598]();
}

uint64_t sub_1A93F86D0()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1A93F86DC()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1A93F86E8()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1A93F86F4()
{
  return MEMORY[0x1E0DEB678]();
}

uint64_t sub_1A93F8700()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1A93F870C()
{
  return MEMORY[0x1E0DEB738]();
}

uint64_t sub_1A93F8718()
{
  return MEMORY[0x1E0C9B8C8]();
}

uint64_t sub_1A93F8724()
{
  return MEMORY[0x1E0DEF180]();
}

uint64_t sub_1A93F8730()
{
  return MEMORY[0x1E0DEF188]();
}

uint64_t sub_1A93F873C()
{
  return MEMORY[0x1E0DEF190]();
}

uint64_t sub_1A93F8748()
{
  return MEMORY[0x1E0DEF198]();
}

uint64_t sub_1A93F8754()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1A93F8760()
{
  return MEMORY[0x1E0CB1D20]();
}

uint64_t sub_1A93F876C()
{
  return MEMORY[0x1E0CB1D58]();
}

uint64_t sub_1A93F8778()
{
  return MEMORY[0x1E0CB1D68]();
}

uint64_t sub_1A93F8784()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1A93F8790()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1A93F879C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1A93F87A8()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1A93F87B4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1A93F87C0()
{
  return MEMORY[0x1E0DEF1D8]();
}

uint64_t sub_1A93F87CC()
{
  return MEMORY[0x1E0DEF210]();
}

uint64_t sub_1A93F87D8()
{
  return MEMORY[0x1E0DEF218]();
}

uint64_t sub_1A93F87E4()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1A93F87F0()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1A93F87FC()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1A93F8808()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1A93F8814()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1A93F8820()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1A93F882C()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1A93F8838()
{
  return MEMORY[0x1E0DEF888]();
}

uint64_t sub_1A93F8844()
{
  return MEMORY[0x1E0DEF890]();
}

uint64_t sub_1A93F8850()
{
  return MEMORY[0x1E0DEF8A0]();
}

uint64_t sub_1A93F885C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1A93F8868()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1A93F8874()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1A93F8880()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A93F888C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1A93F8898()
{
  return MEMORY[0x1E0DEF918]();
}

uint64_t sub_1A93F88A4()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1A93F88B0()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1A93F88BC()
{
  return MEMORY[0x1E0DEF990]();
}

uint64_t sub_1A93F88C8()
{
  return MEMORY[0x1E0DEF998]();
}

uint64_t sub_1A93F88D4()
{
  return MEMORY[0x1E0DEF9B0]();
}

uint64_t sub_1A93F88E0()
{
  return MEMORY[0x1E0DEF9D8]();
}

uint64_t sub_1A93F88EC()
{
  return MEMORY[0x1E0DEF9E8]();
}

uint64_t sub_1A93F88F8()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1A93F8904()
{
  return MEMORY[0x1E0DEFA00]();
}

uint64_t sub_1A93F8910()
{
  return MEMORY[0x1E0DEFA10]();
}

uint64_t sub_1A93F891C()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1A93F8928()
{
  return MEMORY[0x1E0DEFA30]();
}

uint64_t sub_1A93F8934()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1A93F8940()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1A93F894C()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1A93F8958()
{
  return MEMORY[0x1E0CB1EE0]();
}

uint64_t sub_1A93F8964()
{
  return MEMORY[0x1E0CB1EF0]();
}

uint64_t sub_1A93F8970()
{
  return MEMORY[0x1E0CB1F08]();
}

uint64_t sub_1A93F897C()
{
  return MEMORY[0x1E0CB1F10]();
}

uint64_t sub_1A93F8988()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1A93F8994()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1A93F89A0()
{
  return MEMORY[0x1E0DEFA38]();
}

uint64_t sub_1A93F89AC()
{
  return MEMORY[0x1E0DEFA50]();
}

uint64_t sub_1A93F89B8()
{
  return MEMORY[0x1E0C977B8]();
}

uint64_t sub_1A93F89C4()
{
  return MEMORY[0x1E0C977C8]();
}

uint64_t sub_1A93F89D0()
{
  return MEMORY[0x1E0C977D0]();
}

uint64_t sub_1A93F89DC()
{
  return MEMORY[0x1E0C977D8]();
}

uint64_t sub_1A93F89E8()
{
  return MEMORY[0x1E0C977E0]();
}

uint64_t sub_1A93F89F4()
{
  return MEMORY[0x1E0DEFAB0]();
}

uint64_t sub_1A93F8A00()
{
  return MEMORY[0x1E0DEFAC0]();
}

uint64_t sub_1A93F8A0C()
{
  return MEMORY[0x1E0DEF2F8]();
}

uint64_t sub_1A93F8A18()
{
  return MEMORY[0x1E0DEF338]();
}

uint64_t sub_1A93F8A24()
{
  return MEMORY[0x1E0DEF340]();
}

uint64_t sub_1A93F8A30()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1A93F8A3C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1A93F8A48()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1A93F8A54()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1A93F8A60()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1A93F8A6C()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1A93F8A78()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1A93F8A84()
{
  return MEMORY[0x1E0CD74B0]();
}

uint64_t sub_1A93F8A90()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A93F8A9C()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1A93F8AA8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1A93F8AB4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1A93F8AC0()
{
  return MEMORY[0x1E0CB2400]();
}

uint64_t sub_1A93F8ACC()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1A93F8AD8()
{
  return MEMORY[0x1E0CB2478]();
}

uint64_t sub_1A93F8AE4()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1A93F8AF0()
{
  return MEMORY[0x1E0CB2498]();
}

uint64_t sub_1A93F8AFC()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1A93F8B08()
{
  return MEMORY[0x1E0CB24B8]();
}

uint64_t sub_1A93F8B14()
{
  return MEMORY[0x1E0CB24C8]();
}

uint64_t sub_1A93F8B20()
{
  return MEMORY[0x1E0CB2538]();
}

uint64_t sub_1A93F8B2C()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1A93F8B38()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1A93F8B44()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A93F8B50()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1A93F8B5C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A93F8B68()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1A93F8B74()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1A93F8B80()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1A93F8B8C()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1A93F8B98()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1A93F8BA4()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1A93F8BB0()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1A93F8BBC()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1A93F8BC8()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1A93F8BD4()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1A93F8BE0()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1A93F8BEC()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1A93F8BF8()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1A93F8C04()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1A93F8C10()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1A93F8C1C()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1A93F8C28()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1A93F8C34()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1A93F8C40()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1A93F8C4C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1A93F8C58()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1A93F8C64()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_1A93F8C70()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A93F8C7C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1A93F8C88()
{
  return MEMORY[0x1E0DEC2D0]();
}

uint64_t sub_1A93F8C94()
{
  return MEMORY[0x1E0DEC310]();
}

uint64_t sub_1A93F8CA0()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1A93F8CAC()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1A93F8CB8()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1A93F8CC4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A93F8CD0()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1A93F8CDC()
{
  return MEMORY[0x1E0DEC430]();
}

uint64_t sub_1A93F8CE8()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1A93F8CF4()
{
  return MEMORY[0x1E0DEC488]();
}

uint64_t sub_1A93F8D00()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1A93F8D0C()
{
  return MEMORY[0x1E0DEC4B8]();
}

uint64_t sub_1A93F8D18()
{
  return MEMORY[0x1E0DEC4D0]();
}

uint64_t sub_1A93F8D24()
{
  return MEMORY[0x1E0DEC4E0]();
}

uint64_t sub_1A93F8D30()
{
  return MEMORY[0x1E0DEC508]();
}

uint64_t sub_1A93F8D3C()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1A93F8D48()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A93F8D54()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t sub_1A93F8D60()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1A93F8D6C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1A93F8D78()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1A93F8D84()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1A93F8D90()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1A93F8D9C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1A93F8DA8()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1A93F8DB4()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1A93F8DC0()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1A93F8DCC()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t sub_1A93F8DD8()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1A93F8DE4()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1A93F8DF0()
{
  return MEMORY[0x1E0DECA80]();
}

uint64_t sub_1A93F8DFC()
{
  return MEMORY[0x1E0DECA88]();
}

uint64_t sub_1A93F8E08()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A93F8E14()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1A93F8E20()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1A93F8E2C()
{
  return MEMORY[0x1E0DECC38]();
}

uint64_t sub_1A93F8E38()
{
  return MEMORY[0x1E0DECC40]();
}

uint64_t sub_1A93F8E44()
{
  return MEMORY[0x1E0DECC48]();
}

uint64_t sub_1A93F8E50()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t sub_1A93F8E5C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A93F8E68()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1A93F8E74()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1A93F8E80()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1A93F8E8C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1A93F8E98()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A93F8EA4()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_1A93F8EB0()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1A93F8EBC()
{
  return MEMORY[0x1E0DECEF8]();
}

uint64_t sub_1A93F8EC8()
{
  return MEMORY[0x1E0DECF18]();
}

uint64_t sub_1A93F8ED4()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A93F8EE0()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1A93F8EEC()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1A93F8EF8()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1A93F8F04()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1A93F8F10()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1A93F8F1C()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_1A93F8F28()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_1A93F8F34()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1A93F8F40()
{
  return MEMORY[0x1E0DECFB8]();
}

uint64_t sub_1A93F8F4C()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1A93F8F58()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1A93F8F64()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1A93F8F70()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1A93F8F7C()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1A93F8F88()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1A93F8F94()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1A93F8FA0()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1A93F8FAC()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1A93F8FB8()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1A93F8FC4()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1A93F8FD0()
{
  return MEMORY[0x1E0DED0A0]();
}

uint64_t sub_1A93F8FDC()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_1A93F8FE8()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1A93F8FF4()
{
  return MEMORY[0x1E0DED0E8]();
}

uint64_t sub_1A93F9000()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1A93F900C()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1A93F9018()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1A93F9024()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1A93F9030()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1A93F903C()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1A93F9048()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1A93F9054()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1A93F9060()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1A93F906C()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1A93F9078()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1A93F9084()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1A93F9090()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1A93F909C()
{
  return MEMORY[0x1E0DED560]();
}

uint64_t sub_1A93F90A8()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1A93F90B4()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_1A93F90C0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A93F90CC()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1A93F90D8()
{
  return MEMORY[0x1E0DED630]();
}

uint64_t sub_1A93F90E4()
{
  return MEMORY[0x1E0DED638]();
}

uint64_t sub_1A93F90F0()
{
  return MEMORY[0x1E0DED648]();
}

uint64_t sub_1A93F90FC()
{
  return MEMORY[0x1E0DED650]();
}

uint64_t sub_1A93F9108()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_1A93F9114()
{
  return MEMORY[0x1E0DED688]();
}

uint64_t sub_1A93F9120()
{
  return MEMORY[0x1E0DED6C0]();
}

uint64_t sub_1A93F912C()
{
  return MEMORY[0x1E0DED6C8]();
}

uint64_t sub_1A93F9138()
{
  return MEMORY[0x1E0DED6D0]();
}

uint64_t sub_1A93F9144()
{
  return MEMORY[0x1E0DED6D8]();
}

uint64_t sub_1A93F9150()
{
  return MEMORY[0x1E0DED6E0]();
}

uint64_t sub_1A93F915C()
{
  return MEMORY[0x1E0DED6E8]();
}

uint64_t sub_1A93F9168()
{
  return MEMORY[0x1E0DED6F0]();
}

uint64_t sub_1A93F9174()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1A93F9180()
{
  return MEMORY[0x1E0DED700]();
}

uint64_t sub_1A93F918C()
{
  return MEMORY[0x1E0DED708]();
}

uint64_t sub_1A93F9198()
{
  return MEMORY[0x1E0DED710]();
}

uint64_t sub_1A93F91A4()
{
  return MEMORY[0x1E0DED718]();
}

uint64_t sub_1A93F91B0()
{
  return MEMORY[0x1E0DED720]();
}

uint64_t sub_1A93F91BC()
{
  return MEMORY[0x1E0DED728]();
}

uint64_t sub_1A93F91C8()
{
  return MEMORY[0x1E0DED730]();
}

uint64_t sub_1A93F91D4()
{
  return MEMORY[0x1E0DED738]();
}

uint64_t sub_1A93F91E0()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1A93F91EC()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1A93F91F8()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1A93F9204()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1A93F9210()
{
  return MEMORY[0x1E0DED9B0]();
}

uint64_t sub_1A93F921C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1A93F9228()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1A93F9234()
{
  return MEMORY[0x1E0DEDA10]();
}

uint64_t sub_1A93F9240()
{
  return MEMORY[0x1E0DEDA20]();
}

uint64_t sub_1A93F924C()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1A93F9258()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A93F9264()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1A93F9270()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1A93F927C()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1A93F9288()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A93F9294()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A93F92A0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A93F92AC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A93F92B8()
{
  return MEMORY[0x1E0DEDB30]();
}

uint64_t sub_1A93F92C4()
{
  return MEMORY[0x1E0CB2688]();
}

uint64_t sub_1A93F92D0()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1A93F92DC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A93F92E8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A93F92F4()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1A93F9300()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1A93F930C()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1A93F9318()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_1A93F9324()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A93F9330()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_1A93F933C()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1A93F9348()
{
  return MEMORY[0x1E0DEDFC8]();
}

uint64_t sub_1A93F9354()
{
  return MEMORY[0x1E0DEDFF0]();
}

uint64_t sub_1A93F9360()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_1A93F936C()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1A93F9378()
{
  return MEMORY[0x1E0DEE020]();
}

uint64_t sub_1A93F9384()
{
  return MEMORY[0x1E0C964B8]();
}

uint64_t sub_1A93F9390()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1A93F939C()
{
  return MEMORY[0x1E0CB2710]();
}

uint64_t sub_1A93F93A8()
{
  return MEMORY[0x1E0DEE220]();
}

uint64_t sub_1A93F93B4()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1A93F93C0()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1A93F93CC()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1A93F93D8()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1A93F93E4()
{
  return MEMORY[0x1E0CB27D0]();
}

uint64_t sub_1A93F93F0()
{
  return MEMORY[0x1E0CB27E0]();
}

uint64_t sub_1A93F93FC()
{
  return MEMORY[0x1E0CB27F0]();
}

uint64_t sub_1A93F9408()
{
  return MEMORY[0x1E0DEE750]();
}

uint64_t sub_1A93F9414()
{
  return MEMORY[0x1E0DEE758]();
}

uint64_t sub_1A93F9420()
{
  return MEMORY[0x1E0DEE780]();
}

uint64_t sub_1A93F942C()
{
  return MEMORY[0x1E0DEE7A0]();
}

uint64_t sub_1A93F9438()
{
  return MEMORY[0x1E0DEE7A8]();
}

uint64_t sub_1A93F9444()
{
  return MEMORY[0x1E0DEE7B8]();
}

uint64_t sub_1A93F9450()
{
  return MEMORY[0x1E0DEE7C8]();
}

uint64_t sub_1A93F945C()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1A93F9468()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1A93F9474()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AMSError()
{
  return MEMORY[0x1E0CFD800]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFStreamCreateBoundPair(CFAllocatorRef alloc, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream, CFIndex transferBufferSize)
{
  MEMORY[0x1E0C98EC0](alloc, readStream, writeStream, transferBufferSize);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C99260](theString, locale);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C993F8](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99400](allocator, originalString, charactersToLeaveEscaped);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1E0C9BC88](a1, *(_QWORD *)&intent, color, options);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB0](red, green, blue, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BDB8](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC318](idst, isrc, index, properties);
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBC328]();
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

uint64_t CGImageSourceCreateWithFile()
{
  return MEMORY[0x1E0CBC5A8]();
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x1E0C9D810]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFC8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

uint64_t CacheDeleteEnumerateRemovedFilesInDirectories()
{
  return MEMORY[0x1E0D09B68]();
}

uint64_t CacheDeleteInitPurgeMarker()
{
  return MEMORY[0x1E0D09B70]();
}

uint64_t CacheDeleteRegisterPurgeNotification()
{
  return MEMORY[0x1E0D09BB0]();
}

uint64_t ICSiriGetSharedUserIDs()
{
  return MEMORY[0x1E0DDBD78]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE88E8](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE88F8](target, queue);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8900](target, runLoop, runLoopMode);
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x1E0CD5F48](certificate, commonName);
}

OSStatus SecCertificateCopyEmailAddresses(SecCertificateRef certificate, CFArrayRef *emailAddresses)
{
  return MEMORY[0x1E0CD5F68](certificate, emailAddresses);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD5FD8](certificate, error);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1E0CD5FF8](certificate);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6670](trust);
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6690](trust);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CTServerConnectionCopyDataStatus()
{
  return MEMORY[0x1E0CA6E98]();
}

uint64_t _CTServerConnectionCopyOperatorName()
{
  return MEMORY[0x1E0CA6ED8]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1E0CA6F18]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1E0CA7030]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1E0CA7078]();
}

uint64_t _CTServerConnectionUnregisterForNotification()
{
  return MEMORY[0x1E0CA7098]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x1E0C82CF0](object);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x1E0C838C0](*(_QWORD *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1E0C838D8](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

htmlDocPtr htmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (htmlDocPtr)MEMORY[0x1E0DE8C40](buffer, *(_QWORD *)&size, URL, encoding, *(_QWORD *)&options);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1E0C841C8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x1E0C855E0](a1, a2, a3, a4);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x1E0DF0F80]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1E0DEEB70]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced()
{
  return MEMORY[0x1E0DEEDA8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_job_run()
{
  return MEMORY[0x1E0DF0FD8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x1E0DF0FF0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x1E0DE8D38](cur);
}

