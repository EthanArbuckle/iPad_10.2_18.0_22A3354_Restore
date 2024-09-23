uint64_t TrustedCloudComputeError.RateLimitInfo.bundleID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.bundleID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.bundleID.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.featureID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.featureID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.featureID.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.workloadType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.workloadType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.workloadType.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.workloadTags.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TrustedCloudComputeError.RateLimitInfo.workloadTags.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.workloadTags.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.WorkloadTag.key.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.WorkloadTag.key.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.WorkloadTag.key.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.WorkloadTag.value.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.WorkloadTag.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.WorkloadTag.value.modify())()
{
  return nullsub_1;
}

PrivateCloudCompute::TrustedCloudComputeError::RateLimitInfo::WorkloadTag __swiftcall TrustedCloudComputeError.RateLimitInfo.WorkloadTag.init(key:value:)(Swift::String key, Swift::String value)
{
  Swift::String *v2;
  PrivateCloudCompute::TrustedCloudComputeError::RateLimitInfo::WorkloadTag result;

  *v2 = key;
  v2[1] = value;
  result.value = value;
  result.key = key;
  return result;
}

uint64_t sub_244A137C4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65756C6176;
  else
    return 7955819;
}

uint64_t sub_244A137F8()
{
  char *v0;

  return sub_244A137C4(*v0);
}

uint64_t sub_244A13800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A24D14(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A13824()
{
  return 0;
}

void sub_244A13830(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_244A1383C()
{
  sub_244A13A24();
  return sub_244A571E8();
}

uint64_t sub_244A13864()
{
  sub_244A13A24();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.RateLimitInfo.WorkloadTag.encode(to:)(_QWORD *a1)
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C27E0);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v9[1] = *(_QWORD *)(v1 + 24);
  v9[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A13A24();
  sub_244A571DC();
  v12 = 0;
  sub_244A570A4();
  if (!v2)
  {
    v11 = 1;
    sub_244A570A4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24951D360]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

unint64_t sub_244A13A24()
{
  unint64_t result;

  result = qword_2573C27E8;
  if (!qword_2573C27E8)
  {
    result = MEMORY[0x24951D378](&unk_244A5A2CC, &type metadata for TrustedCloudComputeError.RateLimitInfo.WorkloadTag.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C27E8);
  }
  return result;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.WorkloadTag.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C27F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A13A24();
  sub_244A571D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = 0;
  v9 = sub_244A57008();
  v11 = v10;
  v19 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_244A57008();
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_244A13C28@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return TrustedCloudComputeError.RateLimitInfo.WorkloadTag.init(from:)(a1, a2);
}

uint64_t sub_244A13C3C(_QWORD *a1)
{
  return TrustedCloudComputeError.RateLimitInfo.WorkloadTag.encode(to:)(a1);
}

uint64_t TrustedCloudComputeError.RateLimitInfo.count.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t TrustedCloudComputeError.RateLimitInfo.count.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.count.modify())()
{
  return nullsub_1;
}

double TrustedCloudComputeError.RateLimitInfo.duration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void TrustedCloudComputeError.RateLimitInfo.duration.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 64) = a1;
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.duration.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.retryAfterDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
  v4 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for TrustedCloudComputeError.RateLimitInfo(uint64_t a1)
{
  return sub_244A1A938(a1, (uint64_t *)&unk_2543FB178);
}

uint64_t TrustedCloudComputeError.RateLimitInfo.retryAfterDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
  v4 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*TrustedCloudComputeError.RateLimitInfo.retryAfterDate.modify())()
{
  type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.init(bundleID:featureID:workloadType:workloadTags:count:duration:retryAfterDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(double *)(a9 + 64) = a10;
  v11 = a9 + *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
  v12 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a11, v12);
}

uint64_t TrustedCloudComputeError.RateLimitInfo.init(retryAfter:retryAfterDate:)@<X0>(double a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_QWORD *)(a4 + 48) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a4 + 56) = 0;
  if ((a2 & 1) != 0)
    a1 = 0.0;
  *(double *)(a4 + 64) = a1;
  v6 = a4 + *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
  v7 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a3, v7);
}

uint64_t sub_244A13E34(char a1)
{
  return *(_QWORD *)&aBundleidfeatur[8 * a1];
}

uint64_t sub_244A13E54()
{
  char *v0;

  return sub_244A13E34(*v0);
}

uint64_t sub_244A13E5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A24DE4(a1, a2);
  *a3 = result;
  return result;
}

void sub_244A13E80(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_244A13E8C()
{
  sub_244A14134();
  return sub_244A571E8();
}

uint64_t sub_244A13EB4()
{
  sub_244A14134();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.RateLimitInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  uint64_t v11;
  char v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C27F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A14134();
  sub_244A571DC();
  v14 = 0;
  sub_244A57074();
  if (!v2)
  {
    v13 = 1;
    sub_244A57074();
    v12 = 2;
    sub_244A57074();
    v11 = *(_QWORD *)(v3 + 48);
    v10[15] = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2808);
    sub_244A14578(&qword_2573C2810, (uint64_t (*)(void))sub_244A141BC, MEMORY[0x24BEE12A0]);
    sub_244A570E0();
    v10[14] = 4;
    sub_244A570D4();
    v10[13] = 5;
    sub_244A570BC();
    type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
    v10[12] = 6;
    sub_244A56C78();
    sub_244A14624(&qword_2573C2820, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_244A570E0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_244A14134()
{
  unint64_t result;

  result = qword_2573C2800;
  if (!qword_2573C2800)
  {
    result = MEMORY[0x24951D378](&unk_244A5A27C, &type metadata for TrustedCloudComputeError.RateLimitInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2800);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24951D36C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_244A141BC()
{
  unint64_t result;

  result = qword_2573C2818;
  if (!qword_2573C2818)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.RateLimitInfo.WorkloadTag, &type metadata for TrustedCloudComputeError.RateLimitInfo.WorkloadTag);
    atomic_store(result, (unint64_t *)&qword_2573C2818);
  }
  return result;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v23 = a2;
  v24 = sub_244A56C78();
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2828);
  v5 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_OWORD *)v10 + 1) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *(_OWORD *)v10 = 0u;
  v11 = a1[3];
  v26 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_244A14134();
  v12 = v27;
  sub_244A571D0();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v13 = v4;
    v15 = v24;
    v14 = v25;
    v35 = 0;
    *(_QWORD *)v10 = sub_244A56FD8();
    *((_QWORD *)v10 + 1) = v16;
    v34 = 1;
    *((_QWORD *)v10 + 2) = sub_244A56FD8();
    *((_QWORD *)v10 + 3) = v17;
    v33 = 2;
    *((_QWORD *)v10 + 4) = sub_244A56FD8();
    *((_QWORD *)v10 + 5) = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2808);
    v32 = 3;
    sub_244A14578(&qword_2573C2830, (uint64_t (*)(void))sub_244A145E0, MEMORY[0x24BEE12D0]);
    sub_244A57044();
    *((_QWORD *)v10 + 6) = v28;
    v31 = 4;
    *((_QWORD *)v10 + 7) = sub_244A57038();
    v30 = 5;
    sub_244A57020();
    *((_QWORD *)v10 + 8) = v19;
    v29 = 6;
    sub_244A14624(&qword_2573C2840, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_244A57044();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v14);
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(&v10[*(int *)(v8 + 40)], v13, v15);
    sub_244A1581C((uint64_t)v10, v23, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    return sub_244A15860((uint64_t)v10, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
  }
}

uint64_t sub_244A14578(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573C2808);
    v8 = a2();
    result = MEMORY[0x24951D378](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244A145E0()
{
  unint64_t result;

  result = qword_2573C2838;
  if (!qword_2573C2838)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.RateLimitInfo.WorkloadTag, &type metadata for TrustedCloudComputeError.RateLimitInfo.WorkloadTag);
    atomic_store(result, (unint64_t *)&qword_2573C2838);
  }
  return result;
}

uint64_t sub_244A14624(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24951D378](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244A14664@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrustedCloudComputeError.RateLimitInfo.init(from:)(a1, a2);
}

uint64_t sub_244A14678(_QWORD *a1)
{
  return TrustedCloudComputeError.RateLimitInfo.encode(to:)(a1);
}

uint64_t (*TrustedCloudComputeError.AvailabilityInfo.reason.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.retryAfterDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244A158F8(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo, a1);
}

uint64_t type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(uint64_t a1)
{
  return sub_244A1A938(a1, qword_2573C2D50);
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.retryAfterDate.setter(uint64_t a1)
{
  return sub_244A15964(a1, type metadata accessor for TrustedCloudComputeError.AvailabilityInfo);
}

uint64_t (*TrustedCloudComputeError.AvailabilityInfo.retryAfterDate.modify())()
{
  type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.init(reason:retryAfterDate:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_244A159E0(a1, a2, type metadata accessor for TrustedCloudComputeError.AvailabilityInfo, a3);
}

BOOL static TrustedCloudComputeError.AvailabilityInfo.Reason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.Reason.hash(into:)()
{
  return sub_244A571A0();
}

uint64_t sub_244A14738(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A14770 + 4 * byte_244A576E0[a1]))(0xD000000000000010, 0x8000000244A5E450);
}

uint64_t sub_244A14770()
{
  return 0x576E776F6E6B6E75;
}

uint64_t sub_244A14794()
{
  return 0x7375427365646F6ELL;
}

uint64_t sub_244A147B0(uint64_t a1)
{
  return a1 + 6;
}

uint64_t sub_244A147C8()
{
  unsigned __int8 *v0;

  return sub_244A14738(*v0);
}

uint64_t sub_244A147D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A250C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_244A147F4(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_244A14800()
{
  sub_244A14C94();
  return sub_244A571E8();
}

uint64_t sub_244A14828()
{
  sub_244A14C94();
  return sub_244A571F4();
}

uint64_t sub_244A14850()
{
  return 0;
}

void sub_244A1485C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_244A14868()
{
  sub_244A14D60();
  return sub_244A571E8();
}

uint64_t sub_244A14890()
{
  sub_244A14D60();
  return sub_244A571F4();
}

uint64_t sub_244A148B8()
{
  sub_244A14CD8();
  return sub_244A571E8();
}

uint64_t sub_244A148E0()
{
  sub_244A14CD8();
  return sub_244A571F4();
}

uint64_t sub_244A14908()
{
  sub_244A14D1C();
  return sub_244A571E8();
}

uint64_t sub_244A14930()
{
  sub_244A14D1C();
  return sub_244A571F4();
}

uint64_t sub_244A14958()
{
  sub_244A14DA4();
  return sub_244A571E8();
}

uint64_t sub_244A14980()
{
  sub_244A14DA4();
  return sub_244A571F4();
}

void TrustedCloudComputeError.AvailabilityInfo.Reason.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[11];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2848);
  v10[8] = *(_QWORD *)(v4 - 8);
  v10[9] = v4;
  MEMORY[0x24BDAC7A8]();
  v10[7] = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2850);
  v10[5] = *(_QWORD *)(v6 - 8);
  v10[6] = v6;
  MEMORY[0x24BDAC7A8]();
  v10[4] = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2858);
  v10[2] = *(_QWORD *)(v8 - 8);
  v10[3] = v8;
  MEMORY[0x24BDAC7A8]();
  v10[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2860);
  MEMORY[0x24BDAC7A8]();
  v10[10] = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C2868) - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A14C94();
  sub_244A571DC();
  __asm { BR              X9 }
}

uint64_t sub_244A14B60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v4 - 68) = 0;
  sub_244A14DA4();
  sub_244A57068();
  (*(void (**)(uint64_t, _QWORD))(v3 + 8))(v2, *(_QWORD *)(v4 - 168));
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v1, v0);
}

unint64_t sub_244A14C94()
{
  unint64_t result;

  result = qword_2573C2870;
  if (!qword_2573C2870)
  {
    result = MEMORY[0x24951D378](&unk_244A5A22C, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2870);
  }
  return result;
}

unint64_t sub_244A14CD8()
{
  unint64_t result;

  result = qword_2573C2878;
  if (!qword_2573C2878)
  {
    result = MEMORY[0x24951D378](&unk_244A5A1DC, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NodeAttestationChangedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2878);
  }
  return result;
}

unint64_t sub_244A14D1C()
{
  unint64_t result;

  result = qword_2573C2880;
  if (!qword_2573C2880)
  {
    result = MEMORY[0x24951D378](&unk_244A5A18C, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NodesBusyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2880);
  }
  return result;
}

unint64_t sub_244A14D60()
{
  unint64_t result;

  result = qword_2573C2888;
  if (!qword_2573C2888)
  {
    result = MEMORY[0x24951D378](&unk_244A5A13C, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NoNodesAvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2888);
  }
  return result;
}

unint64_t sub_244A14DA4()
{
  unint64_t result;

  result = qword_2573C2890;
  if (!qword_2573C2890)
  {
    result = MEMORY[0x24951D378](&unk_244A5A0EC, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.UnknownWorkloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2890);
  }
  return result;
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.Reason.hashValue.getter()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.Reason.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;

  v23 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2898);
  v21[5] = *(_QWORD *)(v3 - 8);
  v21[6] = v3;
  MEMORY[0x24BDAC7A8]();
  v26 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28A0);
  v21[4] = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8]();
  v25 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28A8);
  v21[2] = *(_QWORD *)(v6 - 8);
  v21[3] = v6;
  MEMORY[0x24BDAC7A8]();
  v24 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28B0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28B8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v27 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_244A14C94();
  v15 = v28;
  sub_244A571D0();
  if (!v15)
  {
    v21[0] = v9;
    v21[1] = v8;
    v28 = v11;
    v16 = sub_244A5705C();
    if (*(_QWORD *)(v16 + 16) == 1)
      __asm { BR              X9 }
    v17 = sub_244A56F3C();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C0);
    *v19 = &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason;
    sub_244A56FCC();
    sub_244A56F30();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v10);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
}

BOOL sub_244A152B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_244A152C4()
{
  return sub_244A571A0();
}

uint64_t sub_244A152EC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrustedCloudComputeError.AvailabilityInfo.Reason.init(from:)(a1, a2);
}

void sub_244A15300(_QWORD *a1)
{
  TrustedCloudComputeError.AvailabilityInfo.Reason.encode(to:)(a1);
}

uint64_t sub_244A15314()
{
  sub_244A154D0();
  return sub_244A571E8();
}

uint64_t sub_244A1533C()
{
  sub_244A154D0();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A154D0();
  sub_244A571DC();
  v10[15] = *v3;
  v10[14] = 0;
  sub_244A15514();
  sub_244A57098();
  if (!v2)
  {
    type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
    v10[13] = 1;
    sub_244A56C78();
    sub_244A14624(&qword_2573C2820, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_244A570E0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_244A154D0()
{
  unint64_t result;

  result = qword_2573C28D0;
  if (!qword_2573C28D0)
  {
    result = MEMORY[0x24951D378](&unk_244A5A09C, &type metadata for TrustedCloudComputeError.AvailabilityInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C28D0);
  }
  return result;
}

unint64_t sub_244A15514()
{
  unint64_t result;

  result = qword_2573C28D8;
  if (!qword_2573C28D8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.AvailabilityInfo.Reason, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C28D8);
  }
  return result;
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;

  v25 = a2;
  v24 = sub_244A56C78();
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28E0);
  v5 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A154D0();
  sub_244A571D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = v8;
  v21 = v5;
  v11 = v10;
  v13 = v23;
  v12 = v24;
  v14 = v25;
  v28 = 0;
  sub_244A157D8();
  v15 = v26;
  sub_244A56FFC();
  v19 = v11;
  *v11 = v29;
  v27 = 1;
  sub_244A14624(&qword_2573C2840, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  sub_244A57044();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v15);
  v16 = v14;
  v17 = (uint64_t)v19;
  (*(void (**)(_BYTE *, char *, uint64_t))(v22 + 32))(&v19[*(int *)(v20 + 20)], v13, v12);
  sub_244A1581C(v17, v16, type metadata accessor for TrustedCloudComputeError.AvailabilityInfo);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_244A15860(v17, type metadata accessor for TrustedCloudComputeError.AvailabilityInfo);
}

unint64_t sub_244A157D8()
{
  unint64_t result;

  result = qword_2573C28E8;
  if (!qword_2573C28E8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.AvailabilityInfo.Reason, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C28E8);
  }
  return result;
}

uint64_t sub_244A1581C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_244A15860(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_244A1589C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrustedCloudComputeError.AvailabilityInfo.init(from:)(a1, a2);
}

uint64_t sub_244A158B0(_QWORD *a1)
{
  return TrustedCloudComputeError.AvailabilityInfo.encode(to:)(a1);
}

void TrustedCloudComputeError.TimeoutErrorInfo.reason.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *TrustedCloudComputeError.TimeoutErrorInfo.reason.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*TrustedCloudComputeError.TimeoutErrorInfo.reason.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.retryAfterDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_244A158F8(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo, a1);
}

uint64_t sub_244A158F8@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1(0) + 20);
  v5 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(uint64_t a1)
{
  return sub_244A1A938(a1, qword_2573C2DE0);
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.retryAfterDate.setter(uint64_t a1)
{
  return sub_244A15964(a1, type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo);
}

uint64_t sub_244A15964(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2(0) + 20);
  v5 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*TrustedCloudComputeError.TimeoutErrorInfo.retryAfterDate.modify())()
{
  type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.init(reason:retryAfterDate:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_244A159E0(a1, a2, type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo, a3);
}

uint64_t sub_244A159E0@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, _BYTE *a4@<X8>)
{
  _BYTE *v5;
  uint64_t v6;

  *a4 = *a1;
  v5 = &a4[*(int *)(a3(0) + 20)];
  v6 = sub_244A56C78();
  return (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a2, v6);
}

BOOL static TrustedCloudComputeError.TimeoutErrorInfo.Reason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.Reason.hash(into:)()
{
  return sub_244A571A0();
}

unint64_t sub_244A15A74()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0xD000000000000013;
}

uint64_t sub_244A15AB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25284(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A15AD4()
{
  sub_244A15D98();
  return sub_244A571E8();
}

uint64_t sub_244A15AFC()
{
  sub_244A15D98();
  return sub_244A571F4();
}

uint64_t sub_244A15B24()
{
  sub_244A15DDC();
  return sub_244A571E8();
}

uint64_t sub_244A15B4C()
{
  sub_244A15DDC();
  return sub_244A571F4();
}

uint64_t sub_244A15B74()
{
  sub_244A15E20();
  return sub_244A571E8();
}

uint64_t sub_244A15B9C()
{
  sub_244A15E20();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.Reason.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28F0);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28F8);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2900);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A15D98();
  sub_244A571DC();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_244A15DDC();
    sub_244A57068();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_244A15E20();
    sub_244A57068();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_244A15D98()
{
  unint64_t result;

  result = qword_2573C2908;
  if (!qword_2573C2908)
  {
    result = MEMORY[0x24951D378](&unk_244A5A04C, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2908);
  }
  return result;
}

unint64_t sub_244A15DDC()
{
  unint64_t result;

  result = qword_2573C2910;
  if (!qword_2573C2910)
  {
    result = MEMORY[0x24951D378](&unk_244A59FFC, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.DecryptionKeyTimeoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2910);
  }
  return result;
}

unint64_t sub_244A15E20()
{
  unint64_t result;

  result = qword_2573C2918;
  if (!qword_2573C2918)
  {
    result = MEMORY[0x24951D378](&unk_244A59FAC, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.SetupRequestTimeoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2918);
  }
  return result;
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.Reason.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2920);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2928);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2930);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A15D98();
  v11 = v33;
  sub_244A571D0();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_244A5705C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_244A56F3C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C0);
    *v21 = &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason;
    sub_244A56FCC();
    sub_244A56F30();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_244A15DDC();
    sub_244A56FC0();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_244A15E20();
    v22 = v6;
    sub_244A56FC0();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_244A161C0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7466417972746572;
  else
    return 0x6E6F73616572;
}

BOOL sub_244A16200(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_244A16218@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return TrustedCloudComputeError.TimeoutErrorInfo.Reason.init(from:)(a1, a2);
}

uint64_t sub_244A1622C(_QWORD *a1)
{
  return TrustedCloudComputeError.TimeoutErrorInfo.Reason.encode(to:)(a1);
}

uint64_t sub_244A16240()
{
  char *v0;

  return sub_244A161C0(*v0);
}

uint64_t sub_244A16248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A2536C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A1626C()
{
  sub_244A16428();
  return sub_244A571E8();
}

uint64_t sub_244A16294()
{
  sub_244A16428();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2938);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A16428();
  sub_244A571DC();
  v10[15] = *v3;
  v10[14] = 0;
  sub_244A1646C();
  sub_244A57098();
  if (!v2)
  {
    type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
    v10[13] = 1;
    sub_244A56C78();
    sub_244A14624(&qword_2573C2820, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_244A570E0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_244A16428()
{
  unint64_t result;

  result = qword_2573C2940;
  if (!qword_2573C2940)
  {
    result = MEMORY[0x24951D378](&unk_244A59F5C, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2940);
  }
  return result;
}

unint64_t sub_244A1646C()
{
  unint64_t result;

  result = qword_2573C2948;
  if (!qword_2573C2948)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.TimeoutErrorInfo.Reason, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2948);
  }
  return result;
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;

  v25 = a2;
  v24 = sub_244A56C78();
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2950);
  v5 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A16428();
  sub_244A571D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = v8;
  v21 = v5;
  v11 = v10;
  v13 = v23;
  v12 = v24;
  v14 = v25;
  v28 = 0;
  sub_244A16730();
  v15 = v26;
  sub_244A56FFC();
  v19 = v11;
  *v11 = v29;
  v27 = 1;
  sub_244A14624(&qword_2573C2840, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  sub_244A57044();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v15);
  v16 = v14;
  v17 = (uint64_t)v19;
  (*(void (**)(_BYTE *, char *, uint64_t))(v22 + 32))(&v19[*(int *)(v20 + 20)], v13, v12);
  sub_244A1581C(v17, v16, type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_244A15860(v17, type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo);
}

unint64_t sub_244A16730()
{
  unint64_t result;

  result = qword_2573C2958;
  if (!qword_2573C2958)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.TimeoutErrorInfo.Reason, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2958);
  }
  return result;
}

uint64_t sub_244A16774@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrustedCloudComputeError.TimeoutErrorInfo.init(from:)(a1, a2);
}

uint64_t sub_244A16788(_QWORD *a1)
{
  return TrustedCloudComputeError.TimeoutErrorInfo.encode(to:)(a1);
}

uint64_t (*TrustedCloudComputeError.InvalidRequestErrorInfo.reason.modify())()
{
  return nullsub_1;
}

uint64_t static TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_244A167B4()
{
  return 1;
}

uint64_t sub_244A167C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25464(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A167F0()
{
  sub_244A169CC();
  return sub_244A571E8();
}

uint64_t sub_244A16818()
{
  sub_244A169CC();
  return sub_244A571F4();
}

uint64_t sub_244A16840()
{
  sub_244A16A10();
  return sub_244A571E8();
}

uint64_t sub_244A16868()
{
  sub_244A16A10();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2960);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2968);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A169CC();
  sub_244A571DC();
  sub_244A16A10();
  sub_244A57068();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_244A169CC()
{
  unint64_t result;

  result = qword_2573C2970;
  if (!qword_2573C2970)
  {
    result = MEMORY[0x24951D378](&unk_244A59F0C, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2970);
  }
  return result;
}

unint64_t sub_244A16A10()
{
  unint64_t result;

  result = qword_2573C2978;
  if (!qword_2573C2978)
  {
    result = MEMORY[0x24951D378](&unk_244A59EBC, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.InvalidWorkloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2978);
  }
  return result;
}

uint64_t TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.init(from:)(_QWORD *a1)
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
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2980);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2988);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A169CC();
  v8 = v23;
  sub_244A571D0();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_244A5705C() + 16) != 1)
  {
    v14 = sub_244A56F3C();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C0);
    *v16 = &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason;
    sub_244A56FCC();
    sub_244A56F30();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v13);
  }
  sub_244A16A10();
  v11 = v4;
  sub_244A56FC0();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

uint64_t sub_244A16CB4(_QWORD *a1)
{
  return TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.init(from:)(a1);
}

uint64_t sub_244A16CC8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2960);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2968);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A169CC();
  sub_244A571DC();
  sub_244A16A10();
  sub_244A57068();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_244A16E08()
{
  sub_244A16F54();
  return sub_244A571E8();
}

uint64_t sub_244A16E30()
{
  sub_244A16F54();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.InvalidRequestErrorInfo.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2990);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A16F54();
  sub_244A571DC();
  v10 = v7;
  sub_244A16F98();
  sub_244A57098();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_244A16F54()
{
  unint64_t result;

  result = qword_2573C2998;
  if (!qword_2573C2998)
  {
    result = MEMORY[0x24951D378](&unk_244A59E6C, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2998);
  }
  return result;
}

unint64_t sub_244A16F98()
{
  unint64_t result;

  result = qword_2573C29A0;
  if (!qword_2573C29A0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C29A0);
  }
  return result;
}

uint64_t TrustedCloudComputeError.InvalidRequestErrorInfo.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C29A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A16F54();
  sub_244A571D0();
  if (!v2)
  {
    sub_244A170F8();
    sub_244A56FFC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_244A170F8()
{
  unint64_t result;

  result = qword_2573C29B0;
  if (!qword_2573C29B0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C29B0);
  }
  return result;
}

uint64_t sub_244A1713C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return TrustedCloudComputeError.InvalidRequestErrorInfo.init(from:)(a1, a2);
}

uint64_t sub_244A17150(_QWORD *a1)
{
  return TrustedCloudComputeError.InvalidRequestErrorInfo.encode(to:)(a1);
}

void TrustedCloudComputeError.UnauthorizedErrorInfo.reason.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *TrustedCloudComputeError.UnauthorizedErrorInfo.reason.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*TrustedCloudComputeError.UnauthorizedErrorInfo.reason.modify())()
{
  return nullsub_1;
}

_BYTE *TrustedCloudComputeError.UnauthorizedErrorInfo.init(reason:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t static TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.== infix(_:_:)()
{
  return 1;
}

uint64_t TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.hash(into:)()
{
  return sub_244A571A0();
}

uint64_t sub_244A171C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25524(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A171F0()
{
  sub_244A173F8();
  return sub_244A571E8();
}

uint64_t sub_244A17218()
{
  sub_244A173F8();
  return sub_244A571F4();
}

uint64_t sub_244A17240@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_244A1726C()
{
  sub_244A1743C();
  return sub_244A571E8();
}

uint64_t sub_244A17294()
{
  sub_244A1743C();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C29B8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C29C0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A173F8();
  sub_244A571DC();
  sub_244A1743C();
  sub_244A57068();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_244A173F8()
{
  unint64_t result;

  result = qword_2573C29C8;
  if (!qword_2573C29C8)
  {
    result = MEMORY[0x24951D378](&unk_244A59E1C, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C29C8);
  }
  return result;
}

unint64_t sub_244A1743C()
{
  unint64_t result;

  result = qword_2573C29D0;
  if (!qword_2573C29D0)
  {
    result = MEMORY[0x24951D378](&unk_244A59DCC, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.SoftwareBlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C29D0);
  }
  return result;
}

uint64_t _s19PrivateCloudCompute07TrustedbC5ErrorO014InvalidRequestE4InfoV6ReasonO9hashValueSivg_0()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

uint64_t TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.init(from:)(_QWORD *a1)
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
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C29D8);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C29E0);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A173F8();
  v8 = v23;
  sub_244A571D0();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_244A5705C() + 16) != 1)
  {
    v14 = sub_244A56F3C();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C0);
    *v16 = &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason;
    sub_244A56FCC();
    sub_244A56F30();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v13);
  }
  sub_244A1743C();
  v11 = v4;
  sub_244A56FC0();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

uint64_t sub_244A17720(_QWORD *a1)
{
  return TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.init(from:)(a1);
}

uint64_t sub_244A17734(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C29B8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C29C0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A173F8();
  sub_244A571DC();
  sub_244A1743C();
  sub_244A57068();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_244A17870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A255E4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A17898()
{
  sub_244A179E4();
  return sub_244A571E8();
}

uint64_t sub_244A178C0()
{
  sub_244A179E4();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.UnauthorizedErrorInfo.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C29E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A179E4();
  sub_244A571DC();
  v10 = v7;
  sub_244A17A28();
  sub_244A57098();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_244A179E4()
{
  unint64_t result;

  result = qword_2573C29F0;
  if (!qword_2573C29F0)
  {
    result = MEMORY[0x24951D378](&unk_244A59D7C, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C29F0);
  }
  return result;
}

unint64_t sub_244A17A28()
{
  unint64_t result;

  result = qword_2573C29F8;
  if (!qword_2573C29F8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C29F8);
  }
  return result;
}

uint64_t TrustedCloudComputeError.UnauthorizedErrorInfo.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A00);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A179E4();
  sub_244A571D0();
  if (!v2)
  {
    sub_244A17B88();
    sub_244A56FFC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_244A17B88()
{
  unint64_t result;

  result = qword_2573C2A08;
  if (!qword_2573C2A08)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2A08);
  }
  return result;
}

uint64_t sub_244A17BCC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return TrustedCloudComputeError.UnauthorizedErrorInfo.init(from:)(a1, a2);
}

uint64_t sub_244A17BE0(_QWORD *a1)
{
  return TrustedCloudComputeError.UnauthorizedErrorInfo.encode(to:)(a1);
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.responseMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_244A1581C(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for TC2RopesResponseMetadata);
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.responseMetadata.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_244A17C20(a1, v1);
}

uint64_t sub_244A17C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TC2RopesResponseMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TrustedCloudComputeError.ServerErrorInfo.responseMetadata.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.retryable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0) + 20));
}

uint64_t type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(uint64_t a1)
{
  return sub_244A1A938(a1, (uint64_t *)&unk_2573C2E70);
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.retryable.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*TrustedCloudComputeError.ServerErrorInfo.retryable.modify())()
{
  type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.retryAfterDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0) + 24);
  return sub_244A17D2C(v3, a1);
}

uint64_t sub_244A17D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.retryAfterDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0) + 24);
  return sub_244A17DA4(a1, v3);
}

uint64_t sub_244A17DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TrustedCloudComputeError.ServerErrorInfo.retryAfterDate.modify())()
{
  type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.init(responseMetadata:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  v8 = a2 + *(int *)(v7 + 24);
  v9 = sub_244A56C78();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v11(v8, 1, 1, v9);
  sub_244A1581C((uint64_t)a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for TC2RopesResponseMetadata);
  if (a1[48] == 1)
  {
    v12 = a1[2] - 16;
    if (v12 < 0x13 && ((0x78CEBu >> v12) & 1) != 0)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      v13 = a1[1];
      if (v13 > 0xE || (LOBYTE(v14) = 1, ((1 << v13) & 0x4110) == 0))
      {
        v15 = *a1;
        v16 = v15 >= 0x2D;
        v14 = (0x108002000000uLL >> v15) & 1;
        if (v16)
          LOBYTE(v14) = 0;
      }
    }
    *(_BYTE *)(a2 + *(int *)(v7 + 20)) = v14;
    v17 = type metadata accessor for TC2RopesResponseMetadata();
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v10 + 16))(v6, &a1[*(int *)(v17 + 60)], v9);
  }
  else
  {
    *(_BYTE *)(a2 + *(int *)(v7 + 20)) = 1;
    type metadata accessor for TC2RopesResponseMetadata();
    sub_244A56C54();
  }
  sub_244A15860((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for TC2RopesResponseMetadata);
  v11((uint64_t)v6, 0, 1, v9);
  return sub_244A17DA4((uint64_t)v6, v8);
}

uint64_t sub_244A17FE0(char a1)
{
  if (!a1)
    return 0xD000000000000010;
  if (a1 == 1)
    return 0x6C62617972746572;
  return 0x7466417972746572;
}

uint64_t sub_244A1804C()
{
  char *v0;

  return sub_244A17FE0(*v0);
}

uint64_t sub_244A18054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25674(a1, a2);
  *a3 = result;
  return result;
}

void sub_244A18078(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_244A18084()
{
  sub_244A18288();
  return sub_244A571E8();
}

uint64_t sub_244A180AC()
{
  sub_244A18288();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A18);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A18288();
  sub_244A571DC();
  v8[15] = 0;
  type metadata accessor for TC2RopesResponseMetadata();
  sub_244A14624(&qword_2573C2A28, (uint64_t (*)(uint64_t))type metadata accessor for TC2RopesResponseMetadata, (uint64_t)&protocol conformance descriptor for TC2RopesResponseMetadata);
  sub_244A570E0();
  if (!v1)
  {
    type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
    v8[14] = 1;
    sub_244A570B0();
    v8[13] = 2;
    sub_244A56C78();
    sub_244A14624(&qword_2573C2820, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_244A57098();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_244A18288()
{
  unint64_t result;

  result = qword_2573C2A20;
  if (!qword_2573C2A20)
  {
    result = MEMORY[0x24951D378](&unk_244A59D2C, &type metadata for TrustedCloudComputeError.ServerErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2A20);
  }
  return result;
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;

  v24 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
  MEMORY[0x24BDAC7A8]();
  v25 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for TC2RopesResponseMetadata();
  MEMORY[0x24BDAC7A8]();
  v27 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A30);
  v5 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  v9 = MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 24)];
  v13 = sub_244A56C78();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v29 = v12;
  v14(v12, 1, 1, v13);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A18288();
  v15 = v30;
  sub_244A571D0();
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_244A1860C(v29);
  }
  else
  {
    v16 = v5;
    v33 = 0;
    sub_244A14624(&qword_2573C2A38, (uint64_t (*)(uint64_t))type metadata accessor for TC2RopesResponseMetadata, (uint64_t)&protocol conformance descriptor for TC2RopesResponseMetadata);
    v17 = v27;
    sub_244A57044();
    v18 = (uint64_t)v17;
    v19 = (uint64_t)v11;
    sub_244A1AAC0(v18, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TC2RopesResponseMetadata);
    v32 = 1;
    v11[*(int *)(v8 + 20)] = sub_244A57014() & 1;
    v31 = 2;
    sub_244A14624(&qword_2573C2840, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v20 = (uint64_t)v25;
    v21 = v28;
    sub_244A56FFC();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v21);
    sub_244A17DA4(v20, v29);
    sub_244A1581C(v19, v24, type metadata accessor for TrustedCloudComputeError.ServerErrorInfo);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_244A15860(v19, type metadata accessor for TrustedCloudComputeError.ServerErrorInfo);
  }
}

uint64_t sub_244A1860C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244A1864C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrustedCloudComputeError.ServerErrorInfo.init(from:)(a1, a2);
}

uint64_t sub_244A18660(_QWORD *a1)
{
  return TrustedCloudComputeError.ServerErrorInfo.encode(to:)(a1);
}

uint64_t TrustedCloudComputeError.InternalErrorInfo.message.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeError.InternalErrorInfo.message.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TrustedCloudComputeError.InternalErrorInfo.message.modify())()
{
  return nullsub_1;
}

void TrustedCloudComputeError.InternalErrorInfo.reason.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *TrustedCloudComputeError.InternalErrorInfo.reason.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*TrustedCloudComputeError.InternalErrorInfo.reason.modify())()
{
  return nullsub_1;
}

PrivateCloudCompute::TrustedCloudComputeError::InternalErrorInfo __swiftcall TrustedCloudComputeError.InternalErrorInfo.init(message:)(Swift::String message)
{
  uint64_t v1;
  PrivateCloudCompute::TrustedCloudComputeError::InternalErrorInfo result;

  *(Swift::String *)v1 = message;
  *(_BYTE *)(v1 + 16) = 0;
  result.message = message;
  return result;
}

PrivateCloudCompute::TrustedCloudComputeError::InternalErrorInfo __swiftcall TrustedCloudComputeError.InternalErrorInfo.init(message:reason:)(Swift::String message, PrivateCloudCompute::TrustedCloudComputeError::InternalErrorInfo::Reason reason)
{
  uint64_t v2;
  char v3;
  PrivateCloudCompute::TrustedCloudComputeError::InternalErrorInfo result;

  v3 = *(_BYTE *)reason;
  *(Swift::String *)v2 = message;
  *(_BYTE *)(v2 + 16) = v3;
  result.message = message;
  result.reason = reason;
  return result;
}

uint64_t sub_244A18728(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000018;
  else
    return 0x6E776F6E6B6E75;
}

uint64_t sub_244A18764()
{
  char *v0;

  return sub_244A18728(*v0);
}

uint64_t sub_244A1876C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A257DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A18790()
{
  sub_244A18A54();
  return sub_244A571E8();
}

uint64_t sub_244A187B8()
{
  sub_244A18A54();
  return sub_244A571F4();
}

uint64_t sub_244A187E0()
{
  sub_244A18ADC();
  return sub_244A571E8();
}

uint64_t sub_244A18808()
{
  sub_244A18ADC();
  return sub_244A571F4();
}

uint64_t sub_244A18830()
{
  sub_244A18A98();
  return sub_244A571E8();
}

uint64_t sub_244A18858()
{
  sub_244A18A98();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.InternalErrorInfo.Reason.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A40);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A48);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A50);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A18A54();
  sub_244A571DC();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_244A18A98();
    sub_244A57068();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_244A18ADC();
    sub_244A57068();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_244A18A54()
{
  unint64_t result;

  result = qword_2573C2A58;
  if (!qword_2573C2A58)
  {
    result = MEMORY[0x24951D378](&unk_244A59CDC, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2A58);
  }
  return result;
}

unint64_t sub_244A18A98()
{
  unint64_t result;

  result = qword_2573C2A60;
  if (!qword_2573C2A60)
  {
    result = MEMORY[0x24951D378](&unk_244A59C8C, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.XpcConnectionInterruptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2A60);
  }
  return result;
}

unint64_t sub_244A18ADC()
{
  unint64_t result;

  result = qword_2573C2A68;
  if (!qword_2573C2A68)
  {
    result = MEMORY[0x24951D378](&unk_244A59C3C, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2A68);
  }
  return result;
}

uint64_t _s19PrivateCloudCompute07TrustedbC5ErrorO07TimeoutE4InfoV6ReasonO9hashValueSivg_0()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

uint64_t TrustedCloudComputeError.InternalErrorInfo.Reason.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A70);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8]();
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A78);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A80);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A18A54();
  v11 = v33;
  sub_244A571D0();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_244A5705C();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_244A56F3C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C0);
    *v21 = &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason;
    sub_244A56FCC();
    sub_244A56F30();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_244A18A98();
    sub_244A56FC0();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_244A18ADC();
    v22 = v6;
    sub_244A56FC0();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_244A18EC0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E6F73616572;
  else
    return 0x6567617373656DLL;
}

uint64_t sub_244A18EF4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return TrustedCloudComputeError.InternalErrorInfo.Reason.init(from:)(a1, a2);
}

uint64_t sub_244A18F08(_QWORD *a1)
{
  return TrustedCloudComputeError.InternalErrorInfo.Reason.encode(to:)(a1);
}

uint64_t sub_244A18F1C()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

uint64_t sub_244A18F5C()
{
  char *v0;

  return sub_244A18EC0(*v0);
}

uint64_t sub_244A18F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A258C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A18F88()
{
  sub_244A19120();
  return sub_244A571E8();
}

uint64_t sub_244A18FB0()
{
  sub_244A19120();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.InternalErrorInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A88);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A19120();
  sub_244A571DC();
  v13 = 0;
  sub_244A570A4();
  if (!v2)
  {
    v12 = v10;
    v11 = 1;
    sub_244A19164();
    sub_244A570E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

unint64_t sub_244A19120()
{
  unint64_t result;

  result = qword_2573C2A90;
  if (!qword_2573C2A90)
  {
    result = MEMORY[0x24951D378](&unk_244A59BEC, &type metadata for TrustedCloudComputeError.InternalErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2A90);
  }
  return result;
}

unint64_t sub_244A19164()
{
  unint64_t result;

  result = qword_2573C2A98;
  if (!qword_2573C2A98)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InternalErrorInfo.Reason, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2A98);
  }
  return result;
}

uint64_t TrustedCloudComputeError.InternalErrorInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A19120();
  sub_244A571D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = 0;
  v9 = sub_244A57008();
  v11 = v10;
  v15 = 1;
  sub_244A19348();
  swift_bridgeObjectRetain();
  sub_244A57044();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v16;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_244A19348()
{
  unint64_t result;

  result = qword_2573C2AA8;
  if (!qword_2573C2AA8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InternalErrorInfo.Reason, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2AA8);
  }
  return result;
}

uint64_t sub_244A1938C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrustedCloudComputeError.InternalErrorInfo.init(from:)(a1, a2);
}

uint64_t sub_244A193A0(_QWORD *a1)
{
  return TrustedCloudComputeError.InternalErrorInfo.encode(to:)(a1);
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.domain.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.domain.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TrustedCloudComputeError.NetworkErrorInfo.domain.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.code.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.code.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*TrustedCloudComputeError.NetworkErrorInfo.code.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.message.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.message.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*TrustedCloudComputeError.NetworkErrorInfo.message.modify())()
{
  return nullsub_1;
}

void __swiftcall TrustedCloudComputeError.NetworkErrorInfo.init(domain:code:message:)(PrivateCloudCompute::TrustedCloudComputeError::NetworkErrorInfo *__return_ptr retstr, Swift::String domain, Swift::Int code, Swift::String message)
{
  retstr->domain = domain;
  retstr->code = code;
  retstr->message = message;
}

uint64_t sub_244A194C4(char a1)
{
  return *(_QWORD *)&aDomain_1[8 * a1];
}

uint64_t sub_244A194E4()
{
  char *v0;

  return sub_244A194C4(*v0);
}

uint64_t sub_244A194EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A259A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A19510()
{
  sub_244A196C4();
  return sub_244A571E8();
}

uint64_t sub_244A19538()
{
  sub_244A196C4();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  char v11;
  char v12;
  char v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AB0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v10[1] = v1[3];
  v10[2] = v7;
  v10[0] = v1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A196C4();
  sub_244A571DC();
  v13 = 0;
  v8 = v10[3];
  sub_244A570A4();
  if (!v8)
  {
    v12 = 1;
    sub_244A570C8();
    v11 = 2;
    sub_244A570A4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_244A196C4()
{
  unint64_t result;

  result = qword_2573C2AB8;
  if (!qword_2573C2AB8)
  {
    result = MEMORY[0x24951D378](&unk_244A59B9C, &type metadata for TrustedCloudComputeError.NetworkErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2AB8);
  }
  return result;
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AC0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A196C4();
  sub_244A571D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v22 = 0;
  v9 = sub_244A57008();
  v11 = v10;
  v21 = 1;
  swift_bridgeObjectRetain();
  v19 = sub_244A5702C();
  v20 = 2;
  v12 = sub_244A57008();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17 = v12;
  v16(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v19;
  a2[3] = v17;
  a2[4] = v15;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A198DC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A19918 + 4 * byte_244A576EC[a1]))(0xD000000000000014, 0x8000000244A5E510);
}

uint64_t sub_244A19918()
{
  uint64_t v0;

  return v0 + 6;
}

unint64_t sub_244A19954()
{
  return 0xD000000000000011;
}

uint64_t sub_244A19970()
{
  return 0x7245726576726573;
}

uint64_t sub_244A19990()
{
  return 0x6C616E7265746E69;
}

uint64_t sub_244A199D4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return TrustedCloudComputeError.NetworkErrorInfo.init(from:)(a1, a2);
}

uint64_t sub_244A199E8(_QWORD *a1)
{
  return TrustedCloudComputeError.NetworkErrorInfo.encode(to:)(a1);
}

uint64_t sub_244A199FC()
{
  unsigned __int8 *v0;

  return sub_244A198DC(*v0);
}

uint64_t sub_244A19A04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25ACC(a1, a2);
  *a3 = result;
  return result;
}

void sub_244A19A28(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_244A19A34()
{
  sub_244A1A96C();
  return sub_244A571E8();
}

uint64_t sub_244A19A5C()
{
  sub_244A1A96C();
  return sub_244A571F4();
}

unint64_t sub_244A19A84()
{
  return 0xD000000000000010;
}

uint64_t sub_244A19AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25E18(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A19AC8()
{
  sub_244A1AC9C();
  return sub_244A571E8();
}

uint64_t sub_244A19AF0()
{
  sub_244A1AC9C();
  return sub_244A571F4();
}

uint64_t sub_244A19B1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25E9C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A19B44()
{
  sub_244A1ACE0();
  return sub_244A571E8();
}

uint64_t sub_244A19B6C()
{
  sub_244A1ACE0();
  return sub_244A571F4();
}

unint64_t sub_244A19B94()
{
  return 0xD000000000000011;
}

uint64_t sub_244A19BB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25F5C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A19BD8()
{
  sub_244A1AA38();
  return sub_244A571E8();
}

uint64_t sub_244A19C00()
{
  sub_244A1AA38();
  return sub_244A571F4();
}

unint64_t sub_244A19C28()
{
  return 0xD000000000000017;
}

uint64_t sub_244A19C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A25FE0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A19C6C()
{
  sub_244A1ABD0();
  return sub_244A571E8();
}

uint64_t sub_244A19C94()
{
  sub_244A1ABD0();
  return sub_244A571F4();
}

unint64_t sub_244A19CBC()
{
  return 0xD000000000000010;
}

uint64_t sub_244A19CD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A26064(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A19D00()
{
  sub_244A1A9B0();
  return sub_244A571E8();
}

uint64_t sub_244A19D28()
{
  sub_244A1A9B0();
  return sub_244A571F4();
}

uint64_t sub_244A19D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A260E8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A19D7C()
{
  sub_244A1AB04();
  return sub_244A571E8();
}

uint64_t sub_244A19DA4()
{
  sub_244A1AB04();
  return sub_244A571F4();
}

unint64_t sub_244A19DCC()
{
  return 0xD000000000000010;
}

uint64_t sub_244A19DE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A261A8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A19E10()
{
  sub_244A1AC58();
  return sub_244A571E8();
}

uint64_t sub_244A19E38()
{
  sub_244A1AC58();
  return sub_244A571F4();
}

uint64_t sub_244A19E60()
{
  return sub_244A571A0();
}

uint64_t sub_244A19E84()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

unint64_t sub_244A19EC0()
{
  return 0xD000000000000015;
}

uint64_t sub_244A19EDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A2622C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A19F04()
{
  sub_244A1AB48();
  return sub_244A571E8();
}

uint64_t sub_244A19F2C()
{
  sub_244A1AB48();
  return sub_244A571F4();
}

void TrustedCloudComputeError.encode(to:)(_QWORD *a1)
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
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AC8);
  v49 = *(_QWORD *)(v2 - 8);
  v50 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v48 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AD0);
  v46 = *(_QWORD *)(v4 - 8);
  v47 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v45 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AD8);
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v42 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  MEMORY[0x24BDAC7A8](v40);
  v41 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AE0);
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v37 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AE8);
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v34 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AF0);
  v32 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v31 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
  MEMORY[0x24BDAC7A8](v29);
  v30 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2AF8);
  v27 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v26 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2B00);
  v22[1] = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v15 = type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
  MEMORY[0x24BDAC7A8](v15);
  v16 = type metadata accessor for TrustedCloudComputeError(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2B08);
  v51 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v20 = (char *)v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A1A96C();
  v52 = v20;
  sub_244A571DC();
  sub_244A1581C(v54, (uint64_t)v18, type metadata accessor for TrustedCloudComputeError);
  v21 = (char *)sub_244A1A3B0 + 4 * word_244A576F4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_244A1A3B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_244A1AAC0(v1, v0, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
  *(_BYTE *)(v3 - 128) = 0;
  sub_244A1ACE0();
  v5 = *(_QWORD *)(v3 - 152);
  v4 = *(_QWORD *)(v3 - 144);
  sub_244A57068();
  sub_244A14624(&qword_2573C2B90, type metadata accessor for TrustedCloudComputeError.RateLimitInfo, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError.RateLimitInfo);
  v6 = *(_QWORD *)(v3 - 384);
  sub_244A570E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 392) + 8))(v2, v6);
  sub_244A15860(v0, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 160) + 8))(v5, v4);
}

uint64_t type metadata accessor for TrustedCloudComputeError(uint64_t a1)
{
  return sub_244A1A938(a1, qword_2573C2CC0);
}

uint64_t sub_244A1A938(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_244A1A96C()
{
  unint64_t result;

  result = qword_2573C2B10;
  if (!qword_2573C2B10)
  {
    result = MEMORY[0x24951D378](&unk_244A59B4C, &type metadata for TrustedCloudComputeError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B10);
  }
  return result;
}

unint64_t sub_244A1A9B0()
{
  unint64_t result;

  result = qword_2573C2B18;
  if (!qword_2573C2B18)
  {
    result = MEMORY[0x24951D378](&unk_244A59AFC, &type metadata for TrustedCloudComputeError.NetworkErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B18);
  }
  return result;
}

unint64_t sub_244A1A9F4()
{
  unint64_t result;

  result = qword_2573C2B20;
  if (!qword_2573C2B20)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.NetworkErrorInfo, &type metadata for TrustedCloudComputeError.NetworkErrorInfo);
    atomic_store(result, (unint64_t *)&qword_2573C2B20);
  }
  return result;
}

unint64_t sub_244A1AA38()
{
  unint64_t result;

  result = qword_2573C2B28;
  if (!qword_2573C2B28)
  {
    result = MEMORY[0x24951D378](&unk_244A59AAC, &type metadata for TrustedCloudComputeError.InternalErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B28);
  }
  return result;
}

unint64_t sub_244A1AA7C()
{
  unint64_t result;

  result = qword_2573C2B30;
  if (!qword_2573C2B30)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InternalErrorInfo, &type metadata for TrustedCloudComputeError.InternalErrorInfo);
    atomic_store(result, (unint64_t *)&qword_2573C2B30);
  }
  return result;
}

uint64_t sub_244A1AAC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_244A1AB04()
{
  unint64_t result;

  result = qword_2573C2B38;
  if (!qword_2573C2B38)
  {
    result = MEMORY[0x24951D378](&unk_244A59A5C, &type metadata for TrustedCloudComputeError.ServerErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B38);
  }
  return result;
}

unint64_t sub_244A1AB48()
{
  unint64_t result;

  result = qword_2573C2B48;
  if (!qword_2573C2B48)
  {
    result = MEMORY[0x24951D378](&unk_244A59A0C, &type metadata for TrustedCloudComputeError.UnauthorizedErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B48);
  }
  return result;
}

unint64_t sub_244A1AB8C()
{
  unint64_t result;

  result = qword_2573C2B50;
  if (!qword_2573C2B50)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.UnauthorizedErrorInfo, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo);
    atomic_store(result, (unint64_t *)&qword_2573C2B50);
  }
  return result;
}

unint64_t sub_244A1ABD0()
{
  unint64_t result;

  result = qword_2573C2B58;
  if (!qword_2573C2B58)
  {
    result = MEMORY[0x24951D378](&unk_244A599BC, &type metadata for TrustedCloudComputeError.InvalidRequestErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B58);
  }
  return result;
}

unint64_t sub_244A1AC14()
{
  unint64_t result;

  result = qword_2573C2B60;
  if (!qword_2573C2B60)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InvalidRequestErrorInfo, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo);
    atomic_store(result, (unint64_t *)&qword_2573C2B60);
  }
  return result;
}

unint64_t sub_244A1AC58()
{
  unint64_t result;

  result = qword_2573C2B68;
  if (!qword_2573C2B68)
  {
    result = MEMORY[0x24951D378](&unk_244A5996C, &type metadata for TrustedCloudComputeError.TimeoutErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B68);
  }
  return result;
}

unint64_t sub_244A1AC9C()
{
  unint64_t result;

  result = qword_2573C2B78;
  if (!qword_2573C2B78)
  {
    result = MEMORY[0x24951D378](&unk_244A5991C, &type metadata for TrustedCloudComputeError.DeniedDueToAvailabilityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B78);
  }
  return result;
}

unint64_t sub_244A1ACE0()
{
  unint64_t result;

  result = qword_2573C2B88;
  if (!qword_2573C2B88)
  {
    result = MEMORY[0x24951D378](&unk_244A598CC, &type metadata for TrustedCloudComputeError.DeniedDueToRateLimitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2B88);
  }
  return result;
}

uint64_t TrustedCloudComputeError.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD v41[10];
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
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;

  v60 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2B98);
  v54 = *(_QWORD *)(v3 - 8);
  v55 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v67 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2BA0);
  v52 = *(_QWORD *)(v53 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v59 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2BA8);
  v50 = *(_QWORD *)(v51 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v58 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2BB0);
  v48 = *(_QWORD *)(v49 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v65 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2BB8);
  v46 = *(_QWORD *)(v47 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v57 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2BC0);
  v44 = *(_QWORD *)(v45 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v56 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2BC8);
  v41[8] = *(_QWORD *)(v43 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v64 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2BD0);
  v41[9] = *(_QWORD *)(v42 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v63 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2BD8);
  v62 = *(_QWORD *)(v68 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = type metadata accessor for TrustedCloudComputeError(0);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v41[6] = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v41[5] = (char *)v41 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v41[7] = (char *)v41 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v41[4] = (char *)v41 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v41 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)v41 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)v41 - v30;
  v32 = a1[3];
  v69 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v32);
  sub_244A1A96C();
  v66 = v13;
  v33 = v70;
  sub_244A571D0();
  if (!v33)
  {
    v41[2] = v28;
    v41[1] = v24;
    v70 = 0;
    v41[3] = v31;
    v34 = v66;
    v35 = sub_244A5705C();
    if (*(_QWORD *)(v35 + 16) == 1)
      __asm { BR              X10 }
    v36 = sub_244A56F3C();
    swift_allocError();
    v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C0);
    *v38 = v61;
    v39 = v68;
    sub_244A56FCC();
    sub_244A56F30();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x24BEE26D0], v36);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v34, v39);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
}

unint64_t sub_244A1BB7C()
{
  unint64_t result;

  result = qword_2573C2BE0;
  if (!qword_2573C2BE0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.NetworkErrorInfo, &type metadata for TrustedCloudComputeError.NetworkErrorInfo);
    atomic_store(result, (unint64_t *)&qword_2573C2BE0);
  }
  return result;
}

unint64_t sub_244A1BBC0()
{
  unint64_t result;

  result = qword_2573C2BE8;
  if (!qword_2573C2BE8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InternalErrorInfo, &type metadata for TrustedCloudComputeError.InternalErrorInfo);
    atomic_store(result, (unint64_t *)&qword_2573C2BE8);
  }
  return result;
}

unint64_t sub_244A1BC04()
{
  unint64_t result;

  result = qword_2573C2BF8;
  if (!qword_2573C2BF8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.UnauthorizedErrorInfo, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo);
    atomic_store(result, (unint64_t *)&qword_2573C2BF8);
  }
  return result;
}

unint64_t sub_244A1BC48()
{
  unint64_t result;

  result = qword_2573C2C00;
  if (!qword_2573C2C00)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InvalidRequestErrorInfo, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo);
    atomic_store(result, (unint64_t *)&qword_2573C2C00);
  }
  return result;
}

uint64_t sub_244A1BC9C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrustedCloudComputeError.init(from:)(a1, a2);
}

void sub_244A1BCB0(_QWORD *a1)
{
  TrustedCloudComputeError.encode(to:)(a1);
}

uint64_t TrustedCloudComputeError.init(file:line:)@<X0>(uint64_t a1@<X8>)
{
  sub_244A56F0C();
  swift_bridgeObjectRelease();
  sub_244A56F24();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  sub_244A56D68();
  sub_244A570F8();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = 0xD000000000000014;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5E1A0;
  *(_BYTE *)(a1 + 16) = 0;
  type metadata accessor for TrustedCloudComputeError(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t TrustedCloudComputeError.init(file:line:message:)@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  sub_244A56F0C();
  swift_bridgeObjectRelease();
  sub_244A56D68();
  sub_244A56F24();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  sub_244A56D68();
  sub_244A570F8();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 0;
  type metadata accessor for TrustedCloudComputeError(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t TrustedCloudComputeError.init(file:line:error:)@<X0>(void *a1@<X4>, uint64_t a2@<X8>)
{
  sub_244A56F0C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543FB420);
  sub_244A56F54();
  sub_244A56D68();
  sub_244A56F24();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  sub_244A56D68();
  sub_244A570F8();
  sub_244A56D68();
  swift_bridgeObjectRelease();

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0xE000000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  type metadata accessor for TrustedCloudComputeError(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t static TrustedCloudComputeError.xpcConnectionInterrupted.getter@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000016;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5E1C0;
  *(_BYTE *)(a1 + 16) = 1;
  type metadata accessor for TrustedCloudComputeError(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t TrustedCloudComputeError.init(responseMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  _BYTE *v32;
  unsigned __int8 *v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
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
  _BYTE *v53;
  _BYTE *v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  _BYTE *v58;
  _BYTE *v59;
  _BYTE *v60;
  unsigned __int8 *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  unsigned __int8 *v70;
  uint64_t v71;

  v71 = a2;
  v65 = type metadata accessor for TC2RopesResponseMetadata();
  MEMORY[0x24BDAC7A8](v65);
  v70 = (unsigned __int8 *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
  MEMORY[0x24BDAC7A8](v64);
  v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244A56C78();
  v66 = *(_QWORD *)(v6 - 8);
  v67 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v63 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v62 = (char *)&v62 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v62 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v62 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v62 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v62 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v62 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v62 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v62 - v29;
  v69 = type metadata accessor for TrustedCloudComputeError(0);
  MEMORY[0x24BDAC7A8](v69);
  v68 = (char *)&v62 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*(_BYTE *)(a1 + 2))
  {
    case 2:
      v32 = v68;
      *v68 = 0;
      goto LABEL_41;
    case 0x10:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v35 = v66;
        v36 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v13, a1 + *(int *)(v65 + 60), v67);
        v32 = v68;
      }
      else
      {
        sub_244A56C54();
        v36 = v67;
        v32 = v68;
        v35 = v66;
      }
      *v32 = 0;
      v53 = &v32[*(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20)];
      (*(void (**)(_BYTE *, char *, uint64_t))(v35 + 32))(v53, v13, v36);
      goto LABEL_41;
    case 0x11:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v37 = v66;
        v38 = v62;
        v39 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v62, a1 + *(int *)(v65 + 60), v67);
        v32 = v68;
      }
      else
      {
        v38 = v62;
        sub_244A56C54();
        v39 = v67;
        v32 = v68;
        v37 = v66;
      }
      *v32 = 1;
      v54 = &v32[*(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20)];
      (*(void (**)(_BYTE *, char *, uint64_t))(v37 + 32))(v54, v38, v39);
      goto LABEL_41;
    case 0x13:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v40 = v66;
        v41 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v30, a1 + *(int *)(v65 + 60), v67);
        v42 = 0;
      }
      else
      {
        v42 = *(_QWORD *)(a1 + 40);
        sub_244A56C54();
        v40 = v66;
        v41 = v67;
      }
      *((_OWORD *)v5 + 1) = 0u;
      *((_OWORD *)v5 + 2) = 0u;
      *(_OWORD *)v5 = 0u;
      *((_QWORD *)v5 + 6) = MEMORY[0x24BEE4AF8];
      *((_QWORD *)v5 + 7) = 0;
      *((_QWORD *)v5 + 8) = v42;
      (*(void (**)(char *, char *, uint64_t))(v40 + 32))(&v5[*(int *)(v64 + 40)], v30, v41);
      v55 = (uint64_t)v5;
      v32 = v68;
      sub_244A1AAC0(v55, (uint64_t)v68, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
      goto LABEL_41;
    case 0x15:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v43 = v66;
        v44 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v28, a1 + *(int *)(v65 + 60), v67);
        v32 = v68;
      }
      else
      {
        sub_244A56C54();
        v44 = v67;
        v32 = v68;
        v43 = v66;
      }
      *v32 = 0;
      v56 = &v32[*(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20)];
      (*(void (**)(_BYTE *, char *, uint64_t))(v43 + 32))(v56, v28, v44);
      goto LABEL_41;
    case 0x16:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v45 = v66;
        v46 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v25, a1 + *(int *)(v65 + 60), v67);
        v32 = v68;
      }
      else
      {
        sub_244A56C54();
        v46 = v67;
        v32 = v68;
        v45 = v66;
      }
      *v32 = 1;
      v57 = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
      goto LABEL_36;
    case 0x17:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v47 = v66;
        v48 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v22, a1 + *(int *)(v65 + 60), v67);
        v32 = v68;
      }
      else
      {
        sub_244A56C54();
        v48 = v67;
        v32 = v68;
        v47 = v66;
      }
      *v32 = 2;
      v58 = &v32[*(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20)];
      (*(void (**)(_BYTE *, char *, uint64_t))(v47 + 32))(v58, v22, v48);
      goto LABEL_41;
    case 0x1A:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v45 = v66;
        v25 = v63;
        v46 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v63, a1 + *(int *)(v65 + 60), v67);
        v32 = v68;
      }
      else
      {
        v25 = v63;
        sub_244A56C54();
        v46 = v67;
        v32 = v68;
        v45 = v66;
      }
      *v32 = 2;
      v57 = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
LABEL_36:
      (*(void (**)(_BYTE *, char *, uint64_t))(v45 + 32))(&v32[*(int *)(v57 + 20)], v25, v46);
      goto LABEL_41;
    case 0x1B:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v49 = v66;
        v50 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v16, a1 + *(int *)(v65 + 60), v67);
        v32 = v68;
      }
      else
      {
        sub_244A56C54();
        v50 = v67;
        v32 = v68;
        v49 = v66;
      }
      *v32 = 4;
      v59 = &v32[*(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20)];
      (*(void (**)(_BYTE *, char *, uint64_t))(v49 + 32))(v59, v16, v50);
      goto LABEL_41;
    case 0x1F:
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v51 = v66;
        v52 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v19, a1 + *(int *)(v65 + 60), v67);
        v32 = v68;
      }
      else
      {
        sub_244A56C54();
        v52 = v67;
        v32 = v68;
        v51 = v66;
      }
      *v32 = 3;
      v60 = &v32[*(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20)];
      (*(void (**)(_BYTE *, char *, uint64_t))(v51 + 32))(v60, v19, v52);
LABEL_41:
      swift_storeEnumTagMultiPayload();
      v61 = v70;
      sub_244A1581C(a1, (uint64_t)v70, (uint64_t (*)(_QWORD))type metadata accessor for TC2RopesResponseMetadata);
      TrustedCloudComputeError.ServerErrorInfo.init(responseMetadata:)(v61, v71);
      sub_244A15860(a1, (uint64_t (*)(_QWORD))type metadata accessor for TC2RopesResponseMetadata);
      swift_storeEnumTagMultiPayload();
      result = sub_244A15860((uint64_t)v32, type metadata accessor for TrustedCloudComputeError);
      break;
    default:
      v33 = v70;
      sub_244A1581C(a1, (uint64_t)v70, (uint64_t (*)(_QWORD))type metadata accessor for TC2RopesResponseMetadata);
      TrustedCloudComputeError.ServerErrorInfo.init(responseMetadata:)(v33, v71);
      sub_244A15860(a1, (uint64_t (*)(_QWORD))type metadata accessor for TC2RopesResponseMetadata);
      result = swift_storeEnumTagMultiPayload();
      break;
  }
  return result;
}

void TrustedCloudComputeError.retryable.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for TrustedCloudComputeError(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_244A1581C(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)sub_244A1C8D8 + 4 * byte_244A5772A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_244A1C8D8()
{
  uint64_t v0;

  sub_244A15860(v0, type metadata accessor for TrustedCloudComputeError);
  return 0;
}

void TrustedCloudComputeError.retryAfterDate.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD);
  char *v8;
  _QWORD v9[2];

  v9[1] = a1;
  v9[0] = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  MEMORY[0x24BDAC7A8](v9[0]);
  v2 = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
  MEMORY[0x24BDAC7A8](v3);
  v4 = type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for TrustedCloudComputeError(0);
  MEMORY[0x24BDAC7A8](v5);
  sub_244A1581C(v1, (uint64_t)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v8 = (char *)sub_244A1CAE4 + 4 * byte_244A57732[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_244A1CAE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_244A15860(v0, type metadata accessor for TrustedCloudComputeError);
  v2 = sub_244A56C78();
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(*(_QWORD *)(v1 - 88), 1, 1, v2);
}

uint64_t TrustedCloudComputeError.description.getter()
{
  uint64_t countAndFlagsBits;
  uint64_t v1;

  countAndFlagsBits = TrustedCloudComputeError.errorCaseString()()._countAndFlagsBits;
  sub_244A1CF28();
  sub_244A1D2C4();
  if (v1)
  {
    sub_244A56D68();
    sub_244A56D68();
    swift_bridgeObjectRelease();
  }
  sub_244A56D68();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  return countAndFlagsBits;
}

Swift::String __swiftcall TrustedCloudComputeError.errorCaseString()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;
  Swift::String result;
  uint64_t v6;

  v1 = type metadata accessor for TrustedCloudComputeError(0);
  MEMORY[0x24BDAC7A8](v1);
  sub_244A1581C(v0, (uint64_t)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v4 = (char *)sub_244A1CDEC + 4 * byte_244A5773A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
  return result;
}

uint64_t sub_244A1CDEC()
{
  uint64_t v0;
  uint64_t v1;

  sub_244A15860(v0, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
  return v1 + 3;
}

void sub_244A1CF28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  uint64_t v8;

  v1 = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
  MEMORY[0x24BDAC7A8](v3);
  v4 = type metadata accessor for TrustedCloudComputeError(0);
  MEMORY[0x24BDAC7A8](v4);
  sub_244A1581C(v0, (uint64_t)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v7 = (char *)sub_244A1D04C + 4 * byte_244A57742[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

unint64_t sub_244A1D04C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  sub_244A1AAC0(v0, v1, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
  v2 = TrustedCloudComputeError.RateLimitInfo.message.getter();
  sub_244A15860(v1, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
  return v2;
}

void sub_244A1D2C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD);
  char *v8;
  uint64_t v9;

  v1 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
  MEMORY[0x24BDAC7A8](v3);
  v4 = type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for TrustedCloudComputeError(0);
  MEMORY[0x24BDAC7A8](v5);
  sub_244A1581C(v0, (uint64_t)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v8 = (char *)sub_244A1D428 + 4 * byte_244A5774F[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_244A1D428()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_244A1AAC0(v0, v1, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
  v2 = TrustedCloudComputeError.RateLimitInfo.description.getter();
  sub_244A15860(v1, type metadata accessor for TrustedCloudComputeError.RateLimitInfo);
  return v2;
}

unint64_t TrustedCloudComputeError.RateLimitInfo.message.getter()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 56))
    return 0xD00000000000003ALL;
  sub_244A56F0C();
  sub_244A56D68();
  sub_244A570F8();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  sub_244A56D68();
  sub_244A56E58();
  sub_244A56D68();
  return 0;
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.message.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A1D724 + 4 * byte_244A57757[*v0]))(0xD000000000000010, 0x8000000244A5E340);
}

uint64_t sub_244A1D724(uint64_t a1)
{
  return a1 + 2;
}

unint64_t TrustedCloudComputeError.TimeoutErrorInfo.message.getter()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v2;

  v1 = *v0;
  v2 = 0xD000000000000020;
  if ((v1 & 1) != 0)
    v2 = 0xD000000000000022;
  if (v1 == 2)
    return 0xD000000000000015;
  else
    return v2;
}

uint64_t TrustedCloudComputeError.InvalidRequestErrorInfo.message.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x2064696C61766E69;
  else
    return 0xD000000000000010;
}

uint64_t TrustedCloudComputeError.UnauthorizedErrorInfo.message.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x726F687475616E75;
  else
    return 0xD000000000000021;
}

unint64_t TrustedCloudComputeError.ServerErrorInfo.message.getter()
{
  return 0xD000000000000015;
}

uint64_t TrustedCloudComputeError.RateLimitInfo.description.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];

  v1 = v0;
  v2 = sub_244A56C3C();
  v72 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244A56C24();
  v69 = *(_QWORD *)(v5 - 8);
  v70 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v71 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_244A56C0C();
  v65 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v68 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244A56C18();
  v59 = *(_QWORD *)(v8 - 8);
  v60 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v66 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_244A56CB4();
  MEMORY[0x24BDAC7A8](v10);
  v62 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_244A56C48();
  v63 = *(_QWORD *)(v12 - 8);
  v64 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v61 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v0[1])
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!v0[3])
      goto LABEL_12;
    goto LABEL_7;
  }
  strcpy((char *)v74, "bundleID=");
  WORD1(v74[1]) = 0;
  HIDWORD(v74[1]) = -385875968;
  sub_244A56D68();
  v14 = v74[0];
  v15 = v74[1];
  v16 = sub_244A1F524(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v18 = v16[2];
  v17 = v16[3];
  if (v18 >= v17 >> 1)
    v16 = sub_244A1F524((_QWORD *)(v17 > 1), v18 + 1, 1, v16);
  v16[2] = v18 + 1;
  v19 = &v16[2 * v18];
  v19[4] = v14;
  v19[5] = v15;
  if (v1[3])
  {
LABEL_7:
    strcpy((char *)v74, "featureID=");
    BYTE3(v74[1]) = 0;
    HIDWORD(v74[1]) = -369098752;
    sub_244A56D68();
    v20 = v74[0];
    v21 = v74[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v16 = sub_244A1F524(0, v16[2] + 1, 1, v16);
    v23 = v16[2];
    v22 = v16[3];
    if (v23 >= v22 >> 1)
      v16 = sub_244A1F524((_QWORD *)(v22 > 1), v23 + 1, 1, v16);
    v16[2] = v23 + 1;
    v24 = &v16[2 * v23];
    v24[4] = v20;
    v24[5] = v21;
  }
LABEL_12:
  if (v1[5])
  {
    strcpy((char *)v74, "workloadType=");
    HIWORD(v74[1]) = -4864;
    sub_244A56D68();
    v25 = v74[0];
    v26 = v74[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v16 = sub_244A1F524(0, v16[2] + 1, 1, v16);
    v28 = v16[2];
    v27 = v16[3];
    if (v28 >= v27 >> 1)
      v16 = sub_244A1F524((_QWORD *)(v27 > 1), v28 + 1, 1, v16);
    v16[2] = v28 + 1;
    v29 = &v16[2 * v28];
    v29[4] = v25;
    v29[5] = v26;
  }
  v30 = *(_QWORD *)(v1[6] + 16);
  if (v30)
  {
    v56 = v1;
    v57 = v4;
    v58 = v2;
    v55 = swift_bridgeObjectRetain();
    v31 = v55 + 56;
    do
    {
      v74[0] = 0;
      v74[1] = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_244A56F0C();
      swift_bridgeObjectRelease();
      v74[0] = 0x64616F6C6B726F77;
      v74[1] = 0xEF283D6D61726150;
      swift_bridgeObjectRetain();
      sub_244A56D68();
      swift_bridgeObjectRelease();
      sub_244A56D68();
      swift_bridgeObjectRetain();
      sub_244A56D68();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      sub_244A56D68();
      v32 = v74[0];
      v33 = v74[1];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = sub_244A1F524(0, v16[2] + 1, 1, v16);
      v35 = v16[2];
      v34 = v16[3];
      if (v35 >= v34 >> 1)
        v16 = sub_244A1F524((_QWORD *)(v34 > 1), v35 + 1, 1, v16);
      v31 += 32;
      v16[2] = v35 + 1;
      v36 = &v16[2 * v35];
      v36[4] = v32;
      v36[5] = v33;
      --v30;
    }
    while (v30);
    swift_bridgeObjectRelease();
    v4 = v57;
    v2 = v58;
    v1 = v56;
  }
  v74[0] = 0x3D746E756F63;
  v74[1] = 0xE600000000000000;
  v73 = v1[7];
  sub_244A570F8();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  v37 = v74[0];
  v38 = v74[1];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v16 = sub_244A1F524(0, v16[2] + 1, 1, v16);
  v40 = v16[2];
  v39 = v16[3];
  if (v40 >= v39 >> 1)
    v16 = sub_244A1F524((_QWORD *)(v39 > 1), v40 + 1, 1, v16);
  v16[2] = v40 + 1;
  v41 = &v16[2 * v40];
  v41[4] = v37;
  v41[5] = v38;
  v74[0] = 0;
  v74[1] = 0xE000000000000000;
  sub_244A56D68();
  sub_244A56E58();
  v42 = v74[0];
  v43 = v74[1];
  v45 = v16[2];
  v44 = v16[3];
  if (v45 >= v44 >> 1)
    v16 = sub_244A1F524((_QWORD *)(v44 > 1), v45 + 1, 1, v16);
  v16[2] = v45 + 1;
  v46 = &v16[2 * v45];
  v46[4] = v42;
  v46[5] = v43;
  type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0);
  sub_244A56CA8();
  (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v66, *MEMORY[0x24BDCE368], v60);
  (*(void (**)(char *, _QWORD, uint64_t))(v65 + 104))(v68, *MEMORY[0x24BDCE348], v67);
  (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v71, *MEMORY[0x24BDCE388], v70);
  (*(void (**)(char *, _QWORD, uint64_t))(v72 + 104))(v4, *MEMORY[0x24BDCE3D0], v2);
  v47 = v61;
  sub_244A56C30();
  sub_244A56C00();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v47, v64);
  v74[0] = 0;
  v74[1] = 0xE000000000000000;
  sub_244A56F0C();
  swift_bridgeObjectRelease();
  v74[0] = 0x7466417972746572;
  v74[1] = 0xEF3D657461447265;
  sub_244A56D68();
  swift_bridgeObjectRelease();
  v48 = v74[0];
  v49 = v74[1];
  v51 = v16[2];
  v50 = v16[3];
  if (v51 >= v50 >> 1)
    v16 = sub_244A1F524((_QWORD *)(v50 > 1), v51 + 1, 1, v16);
  v16[2] = v51 + 1;
  v52 = &v16[2 * v51];
  v52[4] = v48;
  v52[5] = v49;
  v74[0] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
  sub_244A1F630();
  v53 = sub_244A56D20();
  swift_bridgeObjectRelease();
  return v53;
}

uint64_t TrustedCloudComputeError.AvailabilityInfo.description.getter()
{
  unsigned __int8 *v0;
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;

  v41 = sub_244A56C3C();
  v39 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_244A56C24();
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244A56C0C();
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244A56C18();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_244A56CB4();
  MEMORY[0x24BDAC7A8](v12);
  v13 = sub_244A56C48();
  v33 = *(_QWORD *)(v13 - 8);
  v34 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *v0;
  if (v16 == 4)
  {
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v32 = v0;
    v43 = 0;
    v44 = 0xE000000000000000;
    sub_244A56D68();
    v42 = v16;
    sub_244A56F54();
    v30 = v44;
    v31 = v43;
    v17 = sub_244A1F524(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v19 = v17[2];
    v18 = v17[3];
    if (v19 >= v18 >> 1)
      v17 = sub_244A1F524((_QWORD *)(v18 > 1), v19 + 1, 1, v17);
    v17[2] = v19 + 1;
    v20 = &v17[2 * v19];
    v21 = v30;
    v20[4] = v31;
    v20[5] = v21;
  }
  type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
  sub_244A56CA8();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDCE368], v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v7, *MEMORY[0x24BDCE348], v36);
  (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v4, *MEMORY[0x24BDCE388], v38);
  (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v40, *MEMORY[0x24BDCE3D0], v41);
  sub_244A56C30();
  sub_244A56C00();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v34);
  v43 = 0;
  v44 = 0xE000000000000000;
  sub_244A56F0C();
  swift_bridgeObjectRelease();
  v43 = 0x7466417972746572;
  v44 = 0xEF3D657461447265;
  sub_244A56D68();
  swift_bridgeObjectRelease();
  v22 = v43;
  v23 = v44;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v17 = sub_244A1F524(0, v17[2] + 1, 1, v17);
  v25 = v17[2];
  v24 = v17[3];
  if (v25 >= v24 >> 1)
    v17 = sub_244A1F524((_QWORD *)(v24 > 1), v25 + 1, 1, v17);
  v17[2] = v25 + 1;
  v26 = &v17[2 * v25];
  v26[4] = v22;
  v26[5] = v23;
  v43 = (uint64_t)v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
  sub_244A1F630();
  v27 = sub_244A56D20();
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t TrustedCloudComputeError.TimeoutErrorInfo.description.getter()
{
  unsigned __int8 *v0;
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  _QWORD *v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char v44;
  uint64_t v45;
  unint64_t v46;

  v1 = sub_244A56C3C();
  v42 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v43 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_244A56C24();
  v40 = *(_QWORD *)(v3 - 8);
  v41 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244A56C0C();
  v38 = *(_QWORD *)(v6 - 8);
  v39 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244A56C18();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_244A56CB4();
  MEMORY[0x24BDAC7A8](v13);
  v14 = sub_244A56C48();
  v36 = *(_QWORD *)(v14 - 8);
  v37 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *v0;
  if (v17 == 2)
  {
    v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v34 = v0;
    v35 = v1;
    v45 = 0;
    v46 = 0xE000000000000000;
    v19 = v17 & 1;
    sub_244A56D68();
    v44 = v19;
    sub_244A56F54();
    v32 = v46;
    v33 = v45;
    v18 = sub_244A1F524(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v21 = v18[2];
    v20 = v18[3];
    if (v21 >= v20 >> 1)
      v18 = sub_244A1F524((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
    v18[2] = v21 + 1;
    v22 = &v18[2 * v21];
    v23 = v32;
    v22[4] = v33;
    v22[5] = v23;
    v1 = v35;
  }
  type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
  sub_244A56CA8();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDCE368], v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v38 + 104))(v8, *MEMORY[0x24BDCE348], v39);
  (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v5, *MEMORY[0x24BDCE388], v41);
  (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v43, *MEMORY[0x24BDCE3D0], v1);
  sub_244A56C30();
  sub_244A56C00();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v37);
  v45 = 0;
  v46 = 0xE000000000000000;
  sub_244A56F0C();
  swift_bridgeObjectRelease();
  v45 = 0x7466417972746572;
  v46 = 0xEF3D657461447265;
  sub_244A56D68();
  swift_bridgeObjectRelease();
  v24 = v45;
  v25 = v46;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v18 = sub_244A1F524(0, v18[2] + 1, 1, v18);
  v27 = v18[2];
  v26 = v18[3];
  if (v27 >= v26 >> 1)
    v18 = sub_244A1F524((_QWORD *)(v26 > 1), v27 + 1, 1, v18);
  v18[2] = v27 + 1;
  v28 = &v18[2 * v27];
  v28[4] = v24;
  v28[5] = v25;
  v45 = (uint64_t)v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
  sub_244A1F630();
  v29 = sub_244A56D20();
  swift_bridgeObjectRelease();
  return v29;
}

uint64_t TrustedCloudComputeError.InvalidRequestErrorInfo.description.getter()
{
  return sub_244A1E910();
}

uint64_t TrustedCloudComputeError.UnauthorizedErrorInfo.description.getter()
{
  return sub_244A1E910();
}

uint64_t sub_244A1E910()
{
  _BYTE *v0;
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  if ((*v0 & 1) == 0)
  {
    sub_244A56D68();
    sub_244A56F54();
    v1 = sub_244A1F524(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v3 = v1[2];
    v2 = v1[3];
    if (v3 >= v2 >> 1)
      v1 = sub_244A1F524((_QWORD *)(v2 > 1), v3 + 1, 1, v1);
    v1[2] = v3 + 1;
    v4 = &v1[2 * v3];
    v4[4] = 0;
    v4[5] = 0xE000000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
  sub_244A1F630();
  v5 = sub_244A56D20();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t TrustedCloudComputeError.ServerErrorInfo.description.getter()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unsigned int v51;
  _QWORD *v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  unsigned __int8 *v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  _QWORD v98[2];

  v1 = v0;
  v2 = sub_244A56C3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v82 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244A56C24();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v81 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244A56C0C();
  v89 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_244A56C18();
  v83 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v80 = (char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_244A56CB4();
  MEMORY[0x24BDAC7A8](v13);
  v85 = (char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_244A56C48();
  v87 = *(_QWORD *)(v15 - 8);
  v88 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v86 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_244A56C78();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v79 = (char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *v1;
  v95 = v3;
  v96 = v20;
  v93 = v2;
  v94 = v5;
  v91 = v10;
  v92 = v6;
  v90 = v8;
  if ((_DWORD)v20 == 47)
  {
    v21 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v98[0] = 0;
    v98[1] = 0xE000000000000000;
    v22 = v20;
    sub_244A56F0C();
    sub_244A56D68();
    v97 = v22;
    sub_244A56F54();
    v23 = v98[0];
    v24 = v98[1];
    v21 = sub_244A1F524(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v26 = v21[2];
    v25 = v21[3];
    if (v26 >= v25 >> 1)
      v21 = sub_244A1F524((_QWORD *)(v25 > 1), v26 + 1, 1, v21);
    v21[2] = v26 + 1;
    v27 = &v21[2 * v26];
    v27[4] = v23;
    v27[5] = v24;
  }
  v28 = v1[1];
  v84 = v11;
  if (v28 != 17)
  {
    v29 = v17;
    v98[0] = 0;
    v98[1] = 0xE000000000000000;
    sub_244A56D68();
    v97 = v28;
    sub_244A56F54();
    v30 = v98[0];
    v31 = v98[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v21 = sub_244A1F524(0, v21[2] + 1, 1, v21);
    v33 = v21[2];
    v32 = v21[3];
    if (v33 >= v32 >> 1)
      v21 = sub_244A1F524((_QWORD *)(v32 > 1), v33 + 1, 1, v21);
    v21[2] = v33 + 1;
    v34 = &v21[2 * v33];
    v34[4] = v30;
    v34[5] = v31;
    v17 = v29;
  }
  v35 = v1[2];
  v36 = v17;
  if (v35 != 38)
  {
    v98[0] = 0;
    v98[1] = 0xE000000000000000;
    sub_244A56D68();
    v97 = v35;
    sub_244A56F54();
    v38 = v98[0];
    v37 = v98[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v21 = sub_244A1F524(0, v21[2] + 1, 1, v21);
    v40 = v21[2];
    v39 = v21[3];
    if (v40 >= v39 >> 1)
      v21 = sub_244A1F524((_QWORD *)(v39 > 1), v40 + 1, 1, v21);
    v21[2] = v40 + 1;
    v41 = &v21[2 * v40];
    v41[4] = v38;
    v41[5] = v37;
  }
  if (*((_QWORD *)v1 + 2))
  {
    strcpy((char *)v98, "description=");
    BYTE5(v98[1]) = 0;
    HIWORD(v98[1]) = -5120;
    sub_244A56D68();
    v42 = v98[0];
    v43 = v98[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v21 = sub_244A1F524(0, v21[2] + 1, 1, v21);
    v45 = v21[2];
    v44 = v21[3];
    if (v45 >= v44 >> 1)
      v21 = sub_244A1F524((_QWORD *)(v44 > 1), v45 + 1, 1, v21);
    v21[2] = v45 + 1;
    v46 = &v21[2 * v45];
    v46[4] = v42;
    v46[5] = v43;
  }
  if (*((_QWORD *)v1 + 4))
  {
    v98[0] = 0x3D6573756163;
    v98[1] = 0xE600000000000000;
    sub_244A56D68();
    v47 = v98[0];
    v48 = v98[1];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v21 = sub_244A1F524(0, v21[2] + 1, 1, v21);
    v50 = v21[2];
    v49 = v21[3];
    v51 = v96;
    if (v50 >= v49 >> 1)
    {
      v76 = sub_244A1F524((_QWORD *)(v49 > 1), v50 + 1, 1, v21);
      v51 = v96;
      v21 = v76;
    }
    v21[2] = v50 + 1;
    v52 = &v21[2 * v50];
    v52[4] = v47;
    v52[5] = v48;
  }
  else
  {
    v51 = v96;
  }
  v53 = v1[48];
  if (v53 != 1
    || v35 <= 0x22 && ((1 << v35) & 0x78CEB0000) != 0
    || v28 <= 0xE && ((1 << v28) & 0x4110) != 0
    || v51 <= 0x2C && ((1 << v51) & 0x108002000000) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v21 = sub_244A1F524(0, v21[2] + 1, 1, v21);
    v59 = v94;
    v60 = v95;
    v62 = v21[2];
    v61 = v21[3];
    if (v62 >= v61 >> 1)
      v21 = sub_244A1F524((_QWORD *)(v61 > 1), v62 + 1, 1, v21);
    v21[2] = v62 + 1;
    v63 = (char *)&v21[2 * v62];
    strcpy(v63 + 32, "retryable=yes");
    *((_WORD *)v63 + 23) = -4864;
    v64 = &v1[*(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60)];
    v78 = v18;
    v65 = v79;
    if ((v53 & 1) != 0)
      (*(void (**)(char *, unsigned __int8 *, uint64_t))(v18 + 16))(v79, v64, v36);
    else
      sub_244A56C54();
    v67 = v81;
    v66 = v82;
    v68 = v80;
    sub_244A56CA8();
    (*(void (**)(char *, _QWORD, uint64_t))(v83 + 104))(v68, *MEMORY[0x24BDCE368], v84);
    (*(void (**)(char *, _QWORD, uint64_t))(v89 + 104))(v91, *MEMORY[0x24BDCE348], v90);
    (*(void (**)(char *, _QWORD, uint64_t))(v92 + 104))(v67, *MEMORY[0x24BDCE388], v59);
    (*(void (**)(char *, _QWORD, uint64_t))(v60 + 104))(v66, *MEMORY[0x24BDCE3D0], v93);
    v69 = v86;
    sub_244A56C30();
    sub_244A56C00();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v69, v88);
    (*(void (**)(char *, uint64_t))(v78 + 8))(v65, v36);
    v98[0] = 0;
    v98[1] = 0xE000000000000000;
    sub_244A56F0C();
    swift_bridgeObjectRelease();
    v98[0] = 0x7466417972746572;
    v98[1] = 0xEF3D657461447265;
    sub_244A56D68();
    swift_bridgeObjectRelease();
    v70 = v98[0];
    v58 = v98[1];
    v72 = v21[2];
    v71 = v21[3];
    if (v72 >= v71 >> 1)
      v21 = sub_244A1F524((_QWORD *)(v71 > 1), v72 + 1, 1, v21);
    v21[2] = v72 + 1;
    v73 = &v21[2 * v72];
    v73[4] = v70;
    v57 = v73 + 4;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v21 = sub_244A1F524(0, v21[2] + 1, 1, v21);
    v55 = v21[2];
    v54 = v21[3];
    if (v55 >= v54 >> 1)
      v21 = sub_244A1F524((_QWORD *)(v54 > 1), v55 + 1, 1, v21);
    v21[2] = v55 + 1;
    v56 = &v21[2 * v55];
    v56[4] = 0x6C62617972746572;
    v57 = v56 + 4;
    v58 = 0xEC0000006F6E3D65;
  }
  v57[1] = v58;
  v98[0] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
  sub_244A1F630();
  v74 = sub_244A56D20();
  swift_bridgeObjectRelease();
  return v74;
}

uint64_t TrustedCloudComputeError.InternalErrorInfo.description.getter()
{
  sub_244A56D68();
  sub_244A56F54();
  return 0;
}

uint64_t TrustedCloudComputeError.NetworkErrorInfo.description.getter()
{
  sub_244A56F0C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  sub_244A56D68();
  sub_244A570F8();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  return 0x3D6E69616D6F64;
}

_QWORD *sub_244A1F524(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3190);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244A262B0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_244A1F630()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573C2C20;
  if (!qword_2573C2C20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543FB3A8);
    result = MEMORY[0x24951D378](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2573C2C20);
  }
  return result;
}

unint64_t sub_244A1F680()
{
  unint64_t result;

  result = qword_2573C2C28;
  if (!qword_2573C2C28)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.AvailabilityInfo.Reason, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2C28);
  }
  return result;
}

unint64_t sub_244A1F6C8()
{
  unint64_t result;

  result = qword_2573C2C30;
  if (!qword_2573C2C30)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.TimeoutErrorInfo.Reason, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2C30);
  }
  return result;
}

unint64_t sub_244A1F710()
{
  unint64_t result;

  result = qword_2573C2C38;
  if (!qword_2573C2C38)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2C38);
  }
  return result;
}

unint64_t sub_244A1F758()
{
  unint64_t result;

  result = qword_2573C2C40;
  if (!qword_2573C2C40)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2C40);
  }
  return result;
}

unint64_t sub_244A1F7A0()
{
  unint64_t result;

  result = qword_2573C2C48;
  if (!qword_2573C2C48)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeError.InternalErrorInfo.Reason, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason);
    atomic_store(result, (unint64_t *)&qword_2573C2C48);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for TrustedCloudComputeError(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
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
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v15 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = *((_QWORD *)a2 + 1);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = v7;
        v8 = *((_QWORD *)a2 + 3);
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = v8;
        v9 = *((_QWORD *)a2 + 5);
        *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
        *((_QWORD *)a1 + 5) = v9;
        *((_QWORD *)a1 + 6) = *((_QWORD *)a2 + 6);
        *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
        v10 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
        v11 = &a1[v10];
        v12 = &a2[v10];
        v13 = sub_244A56C78();
        v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v14(v11, v12, v13);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        *a1 = *a2;
        v17 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
        v18 = &a1[v17];
        v19 = &a2[v17];
        v20 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        *a1 = *a2;
        v21 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
        v22 = &a1[v21];
        v23 = &a2[v21];
        v24 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        *a1 = *a2;
        *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
        v25 = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
        *((_QWORD *)a1 + 2) = v25;
        v26 = *((_QWORD *)a2 + 4);
        *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
        *((_QWORD *)a1 + 4) = v26;
        *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
        a1[48] = a2[48];
        v27 = *((_QWORD *)a2 + 8);
        *((_QWORD *)a1 + 7) = *((_QWORD *)a2 + 7);
        *((_QWORD *)a1 + 8) = v27;
        v28 = *((_QWORD *)a2 + 10);
        *((_QWORD *)a1 + 9) = *((_QWORD *)a2 + 9);
        *((_QWORD *)a1 + 10) = v28;
        v29 = *((_QWORD *)a2 + 12);
        *((_QWORD *)a1 + 11) = *((_QWORD *)a2 + 11);
        *((_QWORD *)a1 + 12) = v29;
        v30 = *((_QWORD *)a2 + 14);
        *((_QWORD *)a1 + 13) = *((_QWORD *)a2 + 13);
        *((_QWORD *)a1 + 14) = v30;
        v31 = *((_QWORD *)a2 + 16);
        *((_QWORD *)a1 + 15) = *((_QWORD *)a2 + 15);
        *((_QWORD *)a1 + 16) = v31;
        v32 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
        v43 = &a2[v32];
        v44 = &a1[v32];
        v33 = sub_244A56C78();
        v34 = *(_QWORD *)(v33 - 8);
        v35 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v35(v44, v43, v33);
        v36 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
        a1[*(int *)(v36 + 20)] = a2[*(int *)(v36 + 20)];
        v37 = *(int *)(v36 + 24);
        v38 = &a1[v37];
        v39 = &a2[v37];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v39, 1, v33))
        {
          v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
          memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
        }
        else
        {
          v35(v38, v39, v33);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v38, 0, 1, v33);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        v41 = *((_QWORD *)a2 + 1);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = v41;
        a1[16] = a2[16];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        v42 = *((_QWORD *)a2 + 1);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = v42;
        *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
        *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for TrustedCloudComputeError(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
      goto LABEL_6;
    case 1:
      v4 = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
      goto LABEL_5;
    case 2:
      v4 = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
LABEL_5:
      v3 = *(int *)(v4 + 20);
LABEL_6:
      v5 = a1 + v3;
      v6 = sub_244A56C78();
      v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
      v8 = v5;
      goto LABEL_7;
    case 5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v9 = a1 + *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
      v10 = sub_244A56C78();
      v11 = *(_QWORD *)(v10 - 8);
      v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v13(v9, v10);
      v12 = a1 + *(int *)(type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0) + 24);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10);
      if ((_DWORD)result)
        return result;
      v8 = v12;
      v6 = v10;
      v7 = (uint64_t (*)(uint64_t, uint64_t))v13;
LABEL_7:
      result = v7(v8, v6);
      break;
    case 6:
      goto LABEL_11;
    case 7:
      swift_bridgeObjectRelease();
LABEL_11:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

char *initializeWithCopy for TrustedCloudComputeError(char *a1, char *a2, uint64_t a3)
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
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
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
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v41;
  char *v42;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v6;
      v7 = *((_QWORD *)a2 + 3);
      *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
      *((_QWORD *)a1 + 3) = v7;
      v8 = *((_QWORD *)a2 + 5);
      *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
      *((_QWORD *)a1 + 5) = v8;
      *((_QWORD *)a1 + 6) = *((_QWORD *)a2 + 6);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      v9 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = sub_244A56C78();
      v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13(v10, v11, v12);
      goto LABEL_11;
    case 1u:
      *a1 = *a2;
      v14 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
      v15 = &a1[v14];
      v16 = &a2[v14];
      v17 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
      goto LABEL_11;
    case 2u:
      *a1 = *a2;
      v18 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
      v19 = &a1[v18];
      v20 = &a2[v18];
      v21 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
      goto LABEL_11;
    case 5u:
      *a1 = *a2;
      *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
      v22 = *((_QWORD *)a2 + 2);
      *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
      *((_QWORD *)a1 + 2) = v22;
      v23 = *((_QWORD *)a2 + 4);
      *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
      *((_QWORD *)a1 + 4) = v23;
      *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
      a1[48] = a2[48];
      v24 = *((_QWORD *)a2 + 8);
      *((_QWORD *)a1 + 7) = *((_QWORD *)a2 + 7);
      *((_QWORD *)a1 + 8) = v24;
      v25 = *((_QWORD *)a2 + 10);
      *((_QWORD *)a1 + 9) = *((_QWORD *)a2 + 9);
      *((_QWORD *)a1 + 10) = v25;
      v26 = *((_QWORD *)a2 + 12);
      *((_QWORD *)a1 + 11) = *((_QWORD *)a2 + 11);
      *((_QWORD *)a1 + 12) = v26;
      v27 = *((_QWORD *)a2 + 14);
      *((_QWORD *)a1 + 13) = *((_QWORD *)a2 + 13);
      *((_QWORD *)a1 + 14) = v27;
      v28 = *((_QWORD *)a2 + 16);
      *((_QWORD *)a1 + 15) = *((_QWORD *)a2 + 15);
      *((_QWORD *)a1 + 16) = v28;
      v29 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
      v41 = &a2[v29];
      v42 = &a1[v29];
      v30 = sub_244A56C78();
      v31 = *(_QWORD *)(v30 - 8);
      v32 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v32(v42, v41, v30);
      v33 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
      a1[*(int *)(v33 + 20)] = a2[*(int *)(v33 + 20)];
      v34 = *(int *)(v33 + 24);
      v35 = &a1[v34];
      v36 = &a2[v34];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v36, 1, v30))
      {
        v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
        memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      }
      else
      {
        v32(v35, v36, v30);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v35, 0, 1, v30);
      }
      goto LABEL_11;
    case 6u:
      v38 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v38;
      a1[16] = a2[16];
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 7u:
      v39 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v39;
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *assignWithCopy for TrustedCloudComputeError(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v30;
  char *v31;

  if (a1 != a2)
  {
    sub_244A15860((uint64_t)a1, type metadata accessor for TrustedCloudComputeError);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        a1[7] = a2[7];
        a1[8] = a2[8];
        v6 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
        v7 = (char *)a1 + v6;
        v8 = (char *)a2 + v6;
        v9 = sub_244A56C78();
        v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v10(v7, v8, v9);
        goto LABEL_12;
      case 1u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v11 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
        v12 = (char *)a1 + v11;
        v13 = (char *)a2 + v11;
        v14 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
        goto LABEL_12;
      case 2u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v15 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
        v16 = (char *)a1 + v15;
        v17 = (char *)a2 + v15;
        v18 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
        goto LABEL_12;
      case 5u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *((_BYTE *)a1 + 1) = *((_BYTE *)a2 + 1);
        *((_BYTE *)a1 + 2) = *((_BYTE *)a2 + 2);
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        v19 = a2[5];
        *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
        a1[5] = v19;
        a1[7] = a2[7];
        a1[8] = a2[8];
        a1[9] = a2[9];
        a1[10] = a2[10];
        a1[11] = a2[11];
        a1[12] = a2[12];
        a1[13] = a2[13];
        a1[14] = a2[14];
        a1[15] = a2[15];
        a1[16] = a2[16];
        v20 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
        v30 = (char *)a2 + v20;
        v31 = (char *)a1 + v20;
        v21 = sub_244A56C78();
        v22 = *(_QWORD *)(v21 - 8);
        v23 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v23(v31, v30, v21);
        v24 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
        *((_BYTE *)a1 + *(int *)(v24 + 20)) = *((_BYTE *)a2 + *(int *)(v24 + 20));
        v25 = *(int *)(v24 + 24);
        v26 = (char *)a1 + v25;
        v27 = (char *)a2 + v25;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v27, 1, v21))
        {
          v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
          memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
        }
        else
        {
          v23(v26, v27, v21);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v26, 0, 1, v21);
        }
        goto LABEL_12;
      case 6u:
        *a1 = *a2;
        a1[1] = a2[1];
        *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
        swift_bridgeObjectRetain();
        goto LABEL_12;
      case 7u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_12:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

char *initializeWithTake for TrustedCloudComputeError(char *a1, char *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v6;
      v7 = *((_OWORD *)a2 + 3);
      *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
      *((_OWORD *)a1 + 3) = v7;
      *((_QWORD *)a1 + 8) = *((_QWORD *)a2 + 8);
      v8 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
      v9 = &a1[v8];
      v10 = &a2[v8];
      v11 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      goto LABEL_9;
    case 1u:
      *a1 = *a2;
      v12 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
      v13 = &a1[v12];
      v14 = &a2[v12];
      v15 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
      goto LABEL_9;
    case 2u:
      *a1 = *a2;
      v16 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
      v17 = &a1[v16];
      v18 = &a2[v16];
      v19 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
      goto LABEL_9;
    case 5u:
      *a1 = *a2;
      *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
      a1[48] = a2[48];
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
      v20 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
      v21 = &a1[v20];
      v22 = &a2[v20];
      v23 = sub_244A56C78();
      v24 = *(_QWORD *)(v23 - 8);
      v25 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
      v25(v21, v22, v23);
      v26 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
      a1[*(int *)(v26 + 20)] = a2[*(int *)(v26 + 20)];
      v27 = *(int *)(v26 + 24);
      v28 = &a1[v27];
      v29 = &a2[v27];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v29, 1, v23))
      {
        v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
        memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
      }
      else
      {
        v25(v28, v29, v23);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v28, 0, 1, v23);
      }
LABEL_9:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

char *assignWithTake for TrustedCloudComputeError(char *a1, char *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;

  if (a1 != a2)
  {
    sub_244A15860((uint64_t)a1, type metadata accessor for TrustedCloudComputeError);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v6 = *((_OWORD *)a2 + 1);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((_OWORD *)a1 + 1) = v6;
        v7 = *((_OWORD *)a2 + 3);
        *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
        *((_OWORD *)a1 + 3) = v7;
        *((_QWORD *)a1 + 8) = *((_QWORD *)a2 + 8);
        v8 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
        v9 = &a1[v8];
        v10 = &a2[v8];
        v11 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
        goto LABEL_10;
      case 1u:
        *a1 = *a2;
        v12 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
        v13 = &a1[v12];
        v14 = &a2[v12];
        v15 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
        goto LABEL_10;
      case 2u:
        *a1 = *a2;
        v16 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
        v17 = &a1[v16];
        v18 = &a2[v16];
        v19 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
        goto LABEL_10;
      case 5u:
        *a1 = *a2;
        *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
        *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
        a1[48] = a2[48];
        *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
        *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
        *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
        v20 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
        v21 = &a1[v20];
        v22 = &a2[v20];
        v23 = sub_244A56C78();
        v24 = *(_QWORD *)(v23 - 8);
        v25 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
        v25(v21, v22, v23);
        v26 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
        a1[*(int *)(v26 + 20)] = a2[*(int *)(v26 + 20)];
        v27 = *(int *)(v26 + 24);
        v28 = &a1[v27];
        v29 = &a2[v27];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v29, 1, v23))
        {
          v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
          memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
        }
        else
        {
          v25(v28, v29, v23);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v28, 0, 1, v23);
        }
LABEL_10:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_244A20A3C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_244A20A4C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  result = type metadata accessor for TrustedCloudComputeError.RateLimitInfo(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(319);
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(319);
      if (v3 <= 0x3F)
      {
        result = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(319);
        if (v4 <= 0x3F)
        {
          swift_initEnumMetadataMultiPayload();
          return 0;
        }
      }
    }
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for TrustedCloudComputeError.RateLimitInfo(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
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
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = a2[6];
    v8 = *(int *)(a3 + 40);
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    v11 = sub_244A56C78();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  return v3;
}

uint64_t destroy for TrustedCloudComputeError.RateLimitInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 40);
  v5 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for TrustedCloudComputeError.RateLimitInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = *(int *)(a3 + 40);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v10 = sub_244A56C78();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

_QWORD *assignWithCopy for TrustedCloudComputeError.RateLimitInfo(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  v6 = *(int *)(a3 + 40);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for TrustedCloudComputeError.RateLimitInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v6 = *(int *)(a3 + 40);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_244A56C78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

_QWORD *assignWithTake for TrustedCloudComputeError.RateLimitInfo(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  v9 = *(int *)(a3 + 40);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.RateLimitInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A20F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_244A56C78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.RateLimitInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A20FB4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 48) = (a2 - 1);
  }
  else
  {
    v7 = sub_244A56C78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t sub_244A21028()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244A56C78();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for TrustedCloudComputeError.RateLimitInfo.WorkloadTag()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TrustedCloudComputeError.RateLimitInfo.WorkloadTag(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TrustedCloudComputeError.RateLimitInfo.WorkloadTag(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for TrustedCloudComputeError.RateLimitInfo.WorkloadTag(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.RateLimitInfo.WorkloadTag(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.RateLimitInfo.WorkloadTag(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.RateLimitInfo.WorkloadTag()
{
  return &type metadata for TrustedCloudComputeError.RateLimitInfo.WorkloadTag;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.AvailabilityInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A21298(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 251)
  {
    if (*a1 <= 4u)
      v4 = 4;
    else
      v4 = *a1;
    v5 = v4 - 4;
    if (*a1 >= 4u)
      return v5;
    else
      return 0;
  }
  else
  {
    v9 = sub_244A56C78();
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.AvailabilityInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_244A21324(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 251)
  {
    *result = a2 + 4;
  }
  else
  {
    v7 = sub_244A56C78();
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_244A21394()
{
  return sub_244A2170C();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.AvailabilityInfo.Reason()
{
  return &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason;
}

uint64_t *_s19PrivateCloudCompute24TrustedCloudComputeErrorO16AvailabilityInfoVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
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
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_244A56C78();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t _s19PrivateCloudCompute24TrustedCloudComputeErrorO16AvailabilityInfoVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_BYTE *_s19PrivateCloudCompute24TrustedCloudComputeErrorO16AvailabilityInfoVwcp_0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_244A56C78();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_BYTE *_s19PrivateCloudCompute24TrustedCloudComputeErrorO16AvailabilityInfoVwca_0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_244A56C78();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_BYTE *_s19PrivateCloudCompute24TrustedCloudComputeErrorO16AvailabilityInfoVwtk_0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_244A56C78();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_BYTE *_s19PrivateCloudCompute24TrustedCloudComputeErrorO16AvailabilityInfoVwta_0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_244A56C78();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.TimeoutErrorInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A21604(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 253)
  {
    if (*a1 <= 2u)
      v4 = 2;
    else
      v4 = *a1;
    v5 = v4 - 2;
    if (*a1 >= 2u)
      return v5;
    else
      return 0;
  }
  else
  {
    v9 = sub_244A56C78();
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.TimeoutErrorInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_244A21690(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 253)
  {
    *result = a2 + 2;
  }
  else
  {
    v7 = sub_244A56C78();
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_244A21700()
{
  return sub_244A2170C();
}

uint64_t sub_244A2170C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244A56C78();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo.Reason()
{
  return &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InvalidRequestErrorInfo()
{
  return &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo;
}

uint64_t sub_244A217AC()
{
  return 0;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason()
{
  return &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.UnauthorizedErrorInfo()
{
  return &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason()
{
  return &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason;
}

_QWORD *initializeBufferWithCopyOfBuffer for TrustedCloudComputeError.ServerErrorInfo(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  char *v25;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_WORD *)(a1 + 1) = *(_WORD *)((char *)a2 + 1);
    v7 = a2[2];
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_QWORD *)(a1 + 16) = v7;
    v8 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v9 = a2[8];
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v9;
    v10 = a2[10];
    *(_QWORD *)(a1 + 72) = a2[9];
    *(_QWORD *)(a1 + 80) = v10;
    v11 = a2[12];
    *(_QWORD *)(a1 + 88) = a2[11];
    *(_QWORD *)(a1 + 96) = v11;
    v12 = a2[14];
    *(_QWORD *)(a1 + 104) = a2[13];
    *(_QWORD *)(a1 + 112) = v12;
    v13 = a2[16];
    *(_QWORD *)(a1 + 120) = a2[15];
    *(_QWORD *)(a1 + 128) = v13;
    v14 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
    v24 = (uint64_t)a2 + v14;
    v25 = (char *)v4 + v14;
    v15 = sub_244A56C78();
    v16 = *(_QWORD *)(v15 - 8);
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23(v25, v24, v15);
    v17 = *(int *)(a3 + 24);
    *((_BYTE *)v4 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v18 = (char *)v4 + v17;
    v19 = (char *)a2 + v17;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v19, 1, v15))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      v23(v18, (uint64_t)v19, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v15);
    }
  }
  return v4;
}

uint64_t destroy for TrustedCloudComputeError.ServerErrorInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void (*v9)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
  v5 = sub_244A56C78();
  v6 = *(_QWORD *)(v5 - 8);
  v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v9(v4, v5);
  v7 = a1 + *(int *)(a2 + 24);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v5);
  return result;
}

uint64_t initializeWithCopy for TrustedCloudComputeError.ServerErrorInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void *, const void *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  const void *v21;
  void *v22;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  v10 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v10;
  v11 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v11;
  v12 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
  v21 = (const void *)(a2 + v12);
  v22 = (void *)(a1 + v12);
  v13 = sub_244A56C78();
  v14 = *(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v15 = *(_QWORD *)(v13 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v22, v21, v13);
  v16 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v17 = (void *)(a1 + v16);
  v18 = (const void *)(a2 + v16);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v18, 1, v13))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v14(v17, v18, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v17, 0, 1, v13);
  }
  return a1;
}

uint64_t assignWithCopy for TrustedCloudComputeError.ServerErrorInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void *, const void *, uint64_t);
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t (*v16)(const void *, uint64_t, uint64_t);
  int v17;
  uint64_t v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_244A56C78();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(void *, const void *, uint64_t))(v11 + 24);
  v12(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v13 = *(int *)(a3 + 24);
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  LODWORD(v8) = v16((const void *)(a1 + v13), 1, v10);
  v17 = v16(v15, 1, v10);
  if (!(_DWORD)v8)
  {
    if (!v17)
    {
      v12(v14, v15, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v14, v10);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v14, v15, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for TrustedCloudComputeError.ServerErrorInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *, const void *, uint64_t);
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  v6 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_244A56C78();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 32);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for TrustedCloudComputeError.ServerErrorInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(void *, const void *, uint64_t);
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t (*v22)(const void *, uint64_t, uint64_t);
  int v23;
  uint64_t v24;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v12;
  swift_bridgeObjectRelease();
  v13 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_244A56C78();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(void (**)(void *, const void *, uint64_t))(v17 + 40);
  v18(v14, v15, v16);
  v19 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  v22 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v14) = v22((const void *)(a1 + v19), 1, v16);
  v23 = v22(v21, 1, v16);
  if (!(_DWORD)v14)
  {
    if (!v23)
    {
      v18(v20, v21, v16);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v20, v16);
    goto LABEL_6;
  }
  if (v23)
  {
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v20, v21, v16);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v20, 0, 1, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.ServerErrorInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A22188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unsigned int v11;

  v6 = type metadata accessor for TC2RopesResponseMetadata();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 254)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 2)
    return ((v11 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.ServerErrorInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A2224C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for TC2RopesResponseMetadata();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_244A222F0()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for TC2RopesResponseMetadata();
  if (v0 <= 0x3F)
  {
    sub_244A2237C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_244A2237C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2573C2E80)
  {
    sub_244A56C78();
    v0 = sub_244A56EB8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2573C2E80);
  }
}

uint64_t destroy for TrustedCloudComputeError.InternalErrorInfo()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s19PrivateCloudCompute24TrustedCloudComputeErrorO17InternalErrorInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TrustedCloudComputeError.InternalErrorInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for TrustedCloudComputeError.InternalErrorInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.InternalErrorInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.InternalErrorInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InternalErrorInfo()
{
  return &type metadata for TrustedCloudComputeError.InternalErrorInfo;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InternalErrorInfo.Reason()
{
  return &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason;
}

uint64_t initializeBufferWithCopyOfBuffer for TrustedCloudComputeError.NetworkErrorInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrustedCloudComputeError.NetworkErrorInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TrustedCloudComputeError.NetworkErrorInfo(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for TrustedCloudComputeError.NetworkErrorInfo(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for TrustedCloudComputeError.NetworkErrorInfo(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.NetworkErrorInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.NetworkErrorInfo(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.NetworkErrorInfo()
{
  return &type metadata for TrustedCloudComputeError.NetworkErrorInfo;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A22848 + 4 * byte_244A5778D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_244A2287C + 4 * byte_244A57788[v4]))();
}

uint64_t sub_244A2287C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A22884(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A2288CLL);
  return result;
}

uint64_t sub_244A22898(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A228A0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_244A228A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A228AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.DeniedDueToRateLimitCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.DeniedDueToRateLimitCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.DeniedDueToAvailabilityCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.DeniedDueToAvailabilityCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.TimeoutErrorCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.TimeoutErrorCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InvalidRequestErrorCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InvalidRequestErrorCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.UnauthorizedErrorCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.UnauthorizedErrorCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.ServerErrorCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.ServerErrorCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InternalErrorCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InternalErrorCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.NetworkErrorCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.NetworkErrorCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.NetworkErrorInfo.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.NetworkErrorInfo.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InternalErrorInfo.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InternalErrorInfo.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InternalErrorInfo.Reason.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InternalErrorInfo.Reason.UnknownCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InternalErrorInfo.Reason.XpcConnectionInterruptedCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.XpcConnectionInterruptedCodingKeys;
}

uint64_t _s19PrivateCloudCompute24TrustedCloudComputeErrorO16NetworkErrorInfoV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s19PrivateCloudCompute24TrustedCloudComputeErrorO16NetworkErrorInfoV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A22A7C + 4 * byte_244A57797[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244A22AB0 + 4 * byte_244A57792[v4]))();
}

uint64_t sub_244A22AB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A22AB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A22AC0);
  return result;
}

uint64_t sub_244A22ACC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A22AD4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244A22AD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A22AE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A22AEC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_244A22AF4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.ServerErrorInfo.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.ServerErrorInfo.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.UnauthorizedErrorInfo.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.SoftwareBlockedCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.SoftwareBlockedCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InvalidRequestErrorInfo.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Prefetch.Response.Node.ValidationResult.InvalidCodingKeys(unsigned int *a1, int a2)
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

uint64_t _s19PrivateCloudCompute24TrustedCloudComputeErrorO23InvalidRequestErrorInfoV6ReasonOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244A22BDC + 4 * byte_244A5779C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244A22BFC + 4 * byte_244A577A1[v4]))();
}

_BYTE *sub_244A22BDC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244A22BFC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244A22C04(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244A22C0C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244A22C14(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244A22C1C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.InvalidWorkloadCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.InvalidWorkloadCodingKeys;
}

_BYTE *sub_244A22C48(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo.Reason.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo.Reason.SetupRequestTimeoutCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.SetupRequestTimeoutCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo.Reason.DecryptionKeyTimeoutCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.DecryptionKeyTimeoutCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.AvailabilityInfo.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.AvailabilityInfo.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TC2RequestState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s19PrivateCloudCompute24TrustedCloudComputeErrorO16AvailabilityInfoV6ReasonOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A22D80 + 4 * byte_244A577AB[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244A22DB4 + 4 * byte_244A577A6[v4]))();
}

uint64_t sub_244A22DB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A22DBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A22DC4);
  return result;
}

uint64_t sub_244A22DD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A22DD8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244A22DDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A22DE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.AvailabilityInfo.Reason.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.CodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.AvailabilityInfo.Reason.UnknownWorkloadCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.UnknownWorkloadCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.AvailabilityInfo.Reason.NoNodesAvailableCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NoNodesAvailableCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.AvailabilityInfo.Reason.NodesBusyCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NodesBusyCodingKeys;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.AvailabilityInfo.Reason.NodeAttestationChangedCodingKeys()
{
  return &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NodeAttestationChangedCodingKeys;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeError.RateLimitInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeError.RateLimitInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A22F1C + 4 * byte_244A577B5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_244A22F50 + 4 * byte_244A577B0[v4]))();
}

uint64_t sub_244A22F50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A22F58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A22F60);
  return result;
}

uint64_t sub_244A22F6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A22F74);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_244A22F78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A22F80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.RateLimitInfo.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.RateLimitInfo.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeRateLimit.WorkloadParameter.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s19PrivateCloudCompute24TrustedCloudComputeErrorO16TimeoutErrorInfoV6ReasonOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A23078 + 4 * byte_244A577BF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244A230AC + 4 * byte_244A577BA[v4]))();
}

uint64_t sub_244A230AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A230B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A230BCLL);
  return result;
}

uint64_t sub_244A230C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A230D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244A230D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A230DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeError.RateLimitInfo.WorkloadTag.CodingKeys()
{
  return &type metadata for TrustedCloudComputeError.RateLimitInfo.WorkloadTag.CodingKeys;
}

unint64_t sub_244A230FC()
{
  unint64_t result;

  result = qword_2573C2EB8;
  if (!qword_2573C2EB8)
  {
    result = MEMORY[0x24951D378](&unk_244A585B4, &type metadata for TrustedCloudComputeError.RateLimitInfo.WorkloadTag.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2EB8);
  }
  return result;
}

unint64_t sub_244A23144()
{
  unint64_t result;

  result = qword_2573C2EC0;
  if (!qword_2573C2EC0)
  {
    result = MEMORY[0x24951D378](&unk_244A5866C, &type metadata for TrustedCloudComputeError.RateLimitInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2EC0);
  }
  return result;
}

unint64_t sub_244A2318C()
{
  unint64_t result;

  result = qword_2573C2EC8;
  if (!qword_2573C2EC8)
  {
    result = MEMORY[0x24951D378](&unk_244A58864, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2EC8);
  }
  return result;
}

unint64_t sub_244A231D4()
{
  unint64_t result;

  result = qword_2573C2ED0;
  if (!qword_2573C2ED0)
  {
    result = MEMORY[0x24951D378](&unk_244A5891C, &type metadata for TrustedCloudComputeError.AvailabilityInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2ED0);
  }
  return result;
}

unint64_t sub_244A2321C()
{
  unint64_t result;

  result = qword_2573C2ED8;
  if (!qword_2573C2ED8)
  {
    result = MEMORY[0x24951D378](&unk_244A58A74, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2ED8);
  }
  return result;
}

unint64_t sub_244A23264()
{
  unint64_t result;

  result = qword_2573C2EE0;
  if (!qword_2573C2EE0)
  {
    result = MEMORY[0x24951D378](&unk_244A58B2C, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2EE0);
  }
  return result;
}

unint64_t sub_244A232AC()
{
  unint64_t result;

  result = qword_2573C2EE8;
  if (!qword_2573C2EE8)
  {
    result = MEMORY[0x24951D378](&unk_244A58C34, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2EE8);
  }
  return result;
}

unint64_t sub_244A232F4()
{
  unint64_t result;

  result = qword_2573C2EF0;
  if (!qword_2573C2EF0)
  {
    result = MEMORY[0x24951D378](&unk_244A58CEC, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2EF0);
  }
  return result;
}

unint64_t sub_244A2333C()
{
  unint64_t result;

  result = qword_2573C2EF8;
  if (!qword_2573C2EF8)
  {
    result = MEMORY[0x24951D378](&unk_244A58DF4, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2EF8);
  }
  return result;
}

unint64_t sub_244A23384()
{
  unint64_t result;

  result = qword_2573C2F00;
  if (!qword_2573C2F00)
  {
    result = MEMORY[0x24951D378](&unk_244A58EAC, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F00);
  }
  return result;
}

unint64_t sub_244A233CC()
{
  unint64_t result;

  result = qword_2573C2F08;
  if (!qword_2573C2F08)
  {
    result = MEMORY[0x24951D378](&unk_244A58F64, &type metadata for TrustedCloudComputeError.ServerErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F08);
  }
  return result;
}

unint64_t sub_244A23414()
{
  unint64_t result;

  result = qword_2573C2F10;
  if (!qword_2573C2F10)
  {
    result = MEMORY[0x24951D378](&unk_244A590BC, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F10);
  }
  return result;
}

unint64_t sub_244A2345C()
{
  unint64_t result;

  result = qword_2573C2F18;
  if (!qword_2573C2F18)
  {
    result = MEMORY[0x24951D378](&unk_244A59174, &type metadata for TrustedCloudComputeError.InternalErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F18);
  }
  return result;
}

unint64_t sub_244A234A4()
{
  unint64_t result;

  result = qword_2573C2F20;
  if (!qword_2573C2F20)
  {
    result = MEMORY[0x24951D378](&unk_244A5922C, &type metadata for TrustedCloudComputeError.NetworkErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F20);
  }
  return result;
}

unint64_t sub_244A234EC()
{
  unint64_t result;

  result = qword_2573C2F28;
  if (!qword_2573C2F28)
  {
    result = MEMORY[0x24951D378](&unk_244A592E4, &type metadata for TrustedCloudComputeError.NetworkErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F28);
  }
  return result;
}

unint64_t sub_244A23534()
{
  unint64_t result;

  result = qword_2573C2F30;
  if (!qword_2573C2F30)
  {
    result = MEMORY[0x24951D378](&unk_244A5939C, &type metadata for TrustedCloudComputeError.InternalErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F30);
  }
  return result;
}

unint64_t sub_244A2357C()
{
  unint64_t result;

  result = qword_2573C2F38;
  if (!qword_2573C2F38)
  {
    result = MEMORY[0x24951D378](&unk_244A59454, &type metadata for TrustedCloudComputeError.ServerErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F38);
  }
  return result;
}

unint64_t sub_244A235C4()
{
  unint64_t result;

  result = qword_2573C2F40;
  if (!qword_2573C2F40)
  {
    result = MEMORY[0x24951D378](&unk_244A5950C, &type metadata for TrustedCloudComputeError.UnauthorizedErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F40);
  }
  return result;
}

unint64_t sub_244A2360C()
{
  unint64_t result;

  result = qword_2573C2F48;
  if (!qword_2573C2F48)
  {
    result = MEMORY[0x24951D378](&unk_244A595C4, &type metadata for TrustedCloudComputeError.InvalidRequestErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F48);
  }
  return result;
}

unint64_t sub_244A23654()
{
  unint64_t result;

  result = qword_2573C2F50;
  if (!qword_2573C2F50)
  {
    result = MEMORY[0x24951D378](&unk_244A5967C, &type metadata for TrustedCloudComputeError.TimeoutErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F50);
  }
  return result;
}

unint64_t sub_244A2369C()
{
  unint64_t result;

  result = qword_2573C2F58;
  if (!qword_2573C2F58)
  {
    result = MEMORY[0x24951D378](&unk_244A59734, &type metadata for TrustedCloudComputeError.DeniedDueToAvailabilityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F58);
  }
  return result;
}

unint64_t sub_244A236E4()
{
  unint64_t result;

  result = qword_2573C2F60;
  if (!qword_2573C2F60)
  {
    result = MEMORY[0x24951D378](&unk_244A597EC, &type metadata for TrustedCloudComputeError.DeniedDueToRateLimitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F60);
  }
  return result;
}

unint64_t sub_244A2372C()
{
  unint64_t result;

  result = qword_2573C2F68;
  if (!qword_2573C2F68)
  {
    result = MEMORY[0x24951D378](&unk_244A598A4, &type metadata for TrustedCloudComputeError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F68);
  }
  return result;
}

unint64_t sub_244A23774()
{
  unint64_t result;

  result = qword_2573C2F70;
  if (!qword_2573C2F70)
  {
    result = MEMORY[0x24951D378](&unk_244A5975C, &type metadata for TrustedCloudComputeError.DeniedDueToRateLimitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F70);
  }
  return result;
}

unint64_t sub_244A237BC()
{
  unint64_t result;

  result = qword_2573C2F78;
  if (!qword_2573C2F78)
  {
    result = MEMORY[0x24951D378](&unk_244A59784, &type metadata for TrustedCloudComputeError.DeniedDueToRateLimitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F78);
  }
  return result;
}

unint64_t sub_244A23804()
{
  unint64_t result;

  result = qword_2573C2F80;
  if (!qword_2573C2F80)
  {
    result = MEMORY[0x24951D378](&unk_244A596A4, &type metadata for TrustedCloudComputeError.DeniedDueToAvailabilityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F80);
  }
  return result;
}

unint64_t sub_244A2384C()
{
  unint64_t result;

  result = qword_2573C2F88;
  if (!qword_2573C2F88)
  {
    result = MEMORY[0x24951D378](&unk_244A596CC, &type metadata for TrustedCloudComputeError.DeniedDueToAvailabilityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F88);
  }
  return result;
}

unint64_t sub_244A23894()
{
  unint64_t result;

  result = qword_2573C2F90;
  if (!qword_2573C2F90)
  {
    result = MEMORY[0x24951D378](&unk_244A595EC, &type metadata for TrustedCloudComputeError.TimeoutErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F90);
  }
  return result;
}

unint64_t sub_244A238DC()
{
  unint64_t result;

  result = qword_2573C2F98;
  if (!qword_2573C2F98)
  {
    result = MEMORY[0x24951D378](&unk_244A59614, &type metadata for TrustedCloudComputeError.TimeoutErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2F98);
  }
  return result;
}

unint64_t sub_244A23924()
{
  unint64_t result;

  result = qword_2573C2FA0;
  if (!qword_2573C2FA0)
  {
    result = MEMORY[0x24951D378](&unk_244A59534, &type metadata for TrustedCloudComputeError.InvalidRequestErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FA0);
  }
  return result;
}

unint64_t sub_244A2396C()
{
  unint64_t result;

  result = qword_2573C2FA8;
  if (!qword_2573C2FA8)
  {
    result = MEMORY[0x24951D378](&unk_244A5955C, &type metadata for TrustedCloudComputeError.InvalidRequestErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FA8);
  }
  return result;
}

unint64_t sub_244A239B4()
{
  unint64_t result;

  result = qword_2573C2FB0;
  if (!qword_2573C2FB0)
  {
    result = MEMORY[0x24951D378](&unk_244A5947C, &type metadata for TrustedCloudComputeError.UnauthorizedErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FB0);
  }
  return result;
}

unint64_t sub_244A239FC()
{
  unint64_t result;

  result = qword_2573C2FB8;
  if (!qword_2573C2FB8)
  {
    result = MEMORY[0x24951D378](&unk_244A594A4, &type metadata for TrustedCloudComputeError.UnauthorizedErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FB8);
  }
  return result;
}

unint64_t sub_244A23A44()
{
  unint64_t result;

  result = qword_2573C2FC0;
  if (!qword_2573C2FC0)
  {
    result = MEMORY[0x24951D378](&unk_244A593C4, &type metadata for TrustedCloudComputeError.ServerErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FC0);
  }
  return result;
}

unint64_t sub_244A23A8C()
{
  unint64_t result;

  result = qword_2573C2FC8;
  if (!qword_2573C2FC8)
  {
    result = MEMORY[0x24951D378](&unk_244A593EC, &type metadata for TrustedCloudComputeError.ServerErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FC8);
  }
  return result;
}

unint64_t sub_244A23AD4()
{
  unint64_t result;

  result = qword_2573C2FD0;
  if (!qword_2573C2FD0)
  {
    result = MEMORY[0x24951D378](&unk_244A5930C, &type metadata for TrustedCloudComputeError.InternalErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FD0);
  }
  return result;
}

unint64_t sub_244A23B1C()
{
  unint64_t result;

  result = qword_2573C2FD8;
  if (!qword_2573C2FD8)
  {
    result = MEMORY[0x24951D378](&unk_244A59334, &type metadata for TrustedCloudComputeError.InternalErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FD8);
  }
  return result;
}

unint64_t sub_244A23B64()
{
  unint64_t result;

  result = qword_2573C2FE0;
  if (!qword_2573C2FE0)
  {
    result = MEMORY[0x24951D378](&unk_244A59254, &type metadata for TrustedCloudComputeError.NetworkErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FE0);
  }
  return result;
}

unint64_t sub_244A23BAC()
{
  unint64_t result;

  result = qword_2573C2FE8;
  if (!qword_2573C2FE8)
  {
    result = MEMORY[0x24951D378](&unk_244A5927C, &type metadata for TrustedCloudComputeError.NetworkErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FE8);
  }
  return result;
}

unint64_t sub_244A23BF4()
{
  unint64_t result;

  result = qword_2573C2FF0;
  if (!qword_2573C2FF0)
  {
    result = MEMORY[0x24951D378](&unk_244A59814, &type metadata for TrustedCloudComputeError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FF0);
  }
  return result;
}

unint64_t sub_244A23C3C()
{
  unint64_t result;

  result = qword_2573C2FF8;
  if (!qword_2573C2FF8)
  {
    result = MEMORY[0x24951D378](&unk_244A5983C, &type metadata for TrustedCloudComputeError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C2FF8);
  }
  return result;
}

unint64_t sub_244A23C84()
{
  unint64_t result;

  result = qword_2573C3000;
  if (!qword_2573C3000)
  {
    result = MEMORY[0x24951D378](&unk_244A5919C, &type metadata for TrustedCloudComputeError.NetworkErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3000);
  }
  return result;
}

unint64_t sub_244A23CCC()
{
  unint64_t result;

  result = qword_2573C3008;
  if (!qword_2573C3008)
  {
    result = MEMORY[0x24951D378](&unk_244A591C4, &type metadata for TrustedCloudComputeError.NetworkErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3008);
  }
  return result;
}

unint64_t sub_244A23D14()
{
  unint64_t result;

  result = qword_2573C3010;
  if (!qword_2573C3010)
  {
    result = MEMORY[0x24951D378](&unk_244A590E4, &type metadata for TrustedCloudComputeError.InternalErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3010);
  }
  return result;
}

unint64_t sub_244A23D5C()
{
  unint64_t result;

  result = qword_2573C3018;
  if (!qword_2573C3018)
  {
    result = MEMORY[0x24951D378](&unk_244A5910C, &type metadata for TrustedCloudComputeError.InternalErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3018);
  }
  return result;
}

unint64_t sub_244A23DA4()
{
  unint64_t result;

  result = qword_2573C3020;
  if (!qword_2573C3020)
  {
    result = MEMORY[0x24951D378](&unk_244A58FDC, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3020);
  }
  return result;
}

unint64_t sub_244A23DEC()
{
  unint64_t result;

  result = qword_2573C3028;
  if (!qword_2573C3028)
  {
    result = MEMORY[0x24951D378](&unk_244A59004, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3028);
  }
  return result;
}

unint64_t sub_244A23E34()
{
  unint64_t result;

  result = qword_2573C3030;
  if (!qword_2573C3030)
  {
    result = MEMORY[0x24951D378](&unk_244A58F8C, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.XpcConnectionInterruptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3030);
  }
  return result;
}

unint64_t sub_244A23E7C()
{
  unint64_t result;

  result = qword_2573C3038;
  if (!qword_2573C3038)
  {
    result = MEMORY[0x24951D378](&unk_244A58FB4, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.XpcConnectionInterruptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3038);
  }
  return result;
}

unint64_t sub_244A23EC4()
{
  unint64_t result;

  result = qword_2573C3040;
  if (!qword_2573C3040)
  {
    result = MEMORY[0x24951D378](&unk_244A5902C, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3040);
  }
  return result;
}

unint64_t sub_244A23F0C()
{
  unint64_t result;

  result = qword_2573C3048;
  if (!qword_2573C3048)
  {
    result = MEMORY[0x24951D378](&unk_244A59054, &type metadata for TrustedCloudComputeError.InternalErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3048);
  }
  return result;
}

unint64_t sub_244A23F54()
{
  unint64_t result;

  result = qword_2573C3050;
  if (!qword_2573C3050)
  {
    result = MEMORY[0x24951D378](&unk_244A58ED4, &type metadata for TrustedCloudComputeError.ServerErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3050);
  }
  return result;
}

unint64_t sub_244A23F9C()
{
  unint64_t result;

  result = qword_2573C3058;
  if (!qword_2573C3058)
  {
    result = MEMORY[0x24951D378](&unk_244A58EFC, &type metadata for TrustedCloudComputeError.ServerErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3058);
  }
  return result;
}

unint64_t sub_244A23FE4()
{
  unint64_t result;

  result = qword_2573C3060;
  if (!qword_2573C3060)
  {
    result = MEMORY[0x24951D378](&unk_244A58E1C, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3060);
  }
  return result;
}

unint64_t sub_244A2402C()
{
  unint64_t result;

  result = qword_2573C3068;
  if (!qword_2573C3068)
  {
    result = MEMORY[0x24951D378](&unk_244A58E44, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3068);
  }
  return result;
}

unint64_t sub_244A24074()
{
  unint64_t result;

  result = qword_2573C3070;
  if (!qword_2573C3070)
  {
    result = MEMORY[0x24951D378](&unk_244A58D14, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.SoftwareBlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3070);
  }
  return result;
}

unint64_t sub_244A240BC()
{
  unint64_t result;

  result = qword_2573C3078;
  if (!qword_2573C3078)
  {
    result = MEMORY[0x24951D378](&unk_244A58D3C, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.SoftwareBlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3078);
  }
  return result;
}

unint64_t sub_244A24104()
{
  unint64_t result;

  result = qword_2573C3080;
  if (!qword_2573C3080)
  {
    result = MEMORY[0x24951D378](&unk_244A58D64, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3080);
  }
  return result;
}

unint64_t sub_244A2414C()
{
  unint64_t result;

  result = qword_2573C3088;
  if (!qword_2573C3088)
  {
    result = MEMORY[0x24951D378](&unk_244A58D8C, &type metadata for TrustedCloudComputeError.UnauthorizedErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3088);
  }
  return result;
}

unint64_t sub_244A24194()
{
  unint64_t result;

  result = qword_2573C3090;
  if (!qword_2573C3090)
  {
    result = MEMORY[0x24951D378](&unk_244A58C5C, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3090);
  }
  return result;
}

unint64_t sub_244A241DC()
{
  unint64_t result;

  result = qword_2573C3098;
  if (!qword_2573C3098)
  {
    result = MEMORY[0x24951D378](&unk_244A58C84, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3098);
  }
  return result;
}

unint64_t sub_244A24224()
{
  unint64_t result;

  result = qword_2573C30A0;
  if (!qword_2573C30A0)
  {
    result = MEMORY[0x24951D378](&unk_244A58B54, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.InvalidWorkloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30A0);
  }
  return result;
}

unint64_t sub_244A2426C()
{
  unint64_t result;

  result = qword_2573C30A8;
  if (!qword_2573C30A8)
  {
    result = MEMORY[0x24951D378](&unk_244A58B7C, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.InvalidWorkloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30A8);
  }
  return result;
}

unint64_t sub_244A242B4()
{
  unint64_t result;

  result = qword_2573C30B0;
  if (!qword_2573C30B0)
  {
    result = MEMORY[0x24951D378](&unk_244A58BA4, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30B0);
  }
  return result;
}

unint64_t sub_244A242FC()
{
  unint64_t result;

  result = qword_2573C30B8;
  if (!qword_2573C30B8)
  {
    result = MEMORY[0x24951D378](&unk_244A58BCC, &type metadata for TrustedCloudComputeError.InvalidRequestErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30B8);
  }
  return result;
}

unint64_t sub_244A24344()
{
  unint64_t result;

  result = qword_2573C30C0;
  if (!qword_2573C30C0)
  {
    result = MEMORY[0x24951D378](&unk_244A58A9C, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30C0);
  }
  return result;
}

unint64_t sub_244A2438C()
{
  unint64_t result;

  result = qword_2573C30C8;
  if (!qword_2573C30C8)
  {
    result = MEMORY[0x24951D378](&unk_244A58AC4, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30C8);
  }
  return result;
}

unint64_t sub_244A243D4()
{
  unint64_t result;

  result = qword_2573C30D0;
  if (!qword_2573C30D0)
  {
    result = MEMORY[0x24951D378](&unk_244A58994, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.SetupRequestTimeoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30D0);
  }
  return result;
}

unint64_t sub_244A2441C()
{
  unint64_t result;

  result = qword_2573C30D8;
  if (!qword_2573C30D8)
  {
    result = MEMORY[0x24951D378](&unk_244A589BC, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.SetupRequestTimeoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30D8);
  }
  return result;
}

unint64_t sub_244A24464()
{
  unint64_t result;

  result = qword_2573C30E0;
  if (!qword_2573C30E0)
  {
    result = MEMORY[0x24951D378](&unk_244A58944, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.DecryptionKeyTimeoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30E0);
  }
  return result;
}

unint64_t sub_244A244AC()
{
  unint64_t result;

  result = qword_2573C30E8;
  if (!qword_2573C30E8)
  {
    result = MEMORY[0x24951D378](&unk_244A5896C, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.DecryptionKeyTimeoutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30E8);
  }
  return result;
}

unint64_t sub_244A244F4()
{
  unint64_t result;

  result = qword_2573C30F0;
  if (!qword_2573C30F0)
  {
    result = MEMORY[0x24951D378](&unk_244A589E4, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30F0);
  }
  return result;
}

unint64_t sub_244A2453C()
{
  unint64_t result;

  result = qword_2573C30F8;
  if (!qword_2573C30F8)
  {
    result = MEMORY[0x24951D378](&unk_244A58A0C, &type metadata for TrustedCloudComputeError.TimeoutErrorInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C30F8);
  }
  return result;
}

unint64_t sub_244A24584()
{
  unint64_t result;

  result = qword_2573C3100;
  if (!qword_2573C3100)
  {
    result = MEMORY[0x24951D378](&unk_244A5888C, &type metadata for TrustedCloudComputeError.AvailabilityInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3100);
  }
  return result;
}

unint64_t sub_244A245CC()
{
  unint64_t result;

  result = qword_2573C3108;
  if (!qword_2573C3108)
  {
    result = MEMORY[0x24951D378](&unk_244A588B4, &type metadata for TrustedCloudComputeError.AvailabilityInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3108);
  }
  return result;
}

unint64_t sub_244A24614()
{
  unint64_t result;

  result = qword_2573C3110;
  if (!qword_2573C3110)
  {
    result = MEMORY[0x24951D378](&unk_244A58784, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.UnknownWorkloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3110);
  }
  return result;
}

unint64_t sub_244A2465C()
{
  unint64_t result;

  result = qword_2573C3118;
  if (!qword_2573C3118)
  {
    result = MEMORY[0x24951D378](&unk_244A587AC, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.UnknownWorkloadCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3118);
  }
  return result;
}

unint64_t sub_244A246A4()
{
  unint64_t result;

  result = qword_2573C3120;
  if (!qword_2573C3120)
  {
    result = MEMORY[0x24951D378](&unk_244A58734, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NoNodesAvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3120);
  }
  return result;
}

unint64_t sub_244A246EC()
{
  unint64_t result;

  result = qword_2573C3128;
  if (!qword_2573C3128)
  {
    result = MEMORY[0x24951D378](&unk_244A5875C, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NoNodesAvailableCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3128);
  }
  return result;
}

unint64_t sub_244A24734()
{
  unint64_t result;

  result = qword_2573C3130;
  if (!qword_2573C3130)
  {
    result = MEMORY[0x24951D378](&unk_244A586E4, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NodesBusyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3130);
  }
  return result;
}

unint64_t sub_244A2477C()
{
  unint64_t result;

  result = qword_2573C3138;
  if (!qword_2573C3138)
  {
    result = MEMORY[0x24951D378](&unk_244A5870C, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NodesBusyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3138);
  }
  return result;
}

unint64_t sub_244A247C4()
{
  unint64_t result;

  result = qword_2573C3140;
  if (!qword_2573C3140)
  {
    result = MEMORY[0x24951D378](&unk_244A58694, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NodeAttestationChangedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3140);
  }
  return result;
}

unint64_t sub_244A2480C()
{
  unint64_t result;

  result = qword_2573C3148;
  if (!qword_2573C3148)
  {
    result = MEMORY[0x24951D378](&unk_244A586BC, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.NodeAttestationChangedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3148);
  }
  return result;
}

unint64_t sub_244A24854()
{
  unint64_t result;

  result = qword_2573C3150;
  if (!qword_2573C3150)
  {
    result = MEMORY[0x24951D378](&unk_244A587D4, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3150);
  }
  return result;
}

unint64_t sub_244A2489C()
{
  unint64_t result;

  result = qword_2573C3158;
  if (!qword_2573C3158)
  {
    result = MEMORY[0x24951D378](&unk_244A587FC, &type metadata for TrustedCloudComputeError.AvailabilityInfo.Reason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3158);
  }
  return result;
}

unint64_t sub_244A248E4()
{
  unint64_t result;

  result = qword_2573C3160;
  if (!qword_2573C3160)
  {
    result = MEMORY[0x24951D378](&unk_244A585DC, &type metadata for TrustedCloudComputeError.RateLimitInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3160);
  }
  return result;
}

unint64_t sub_244A2492C()
{
  unint64_t result;

  result = qword_2573C3168;
  if (!qword_2573C3168)
  {
    result = MEMORY[0x24951D378](&unk_244A58604, &type metadata for TrustedCloudComputeError.RateLimitInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3168);
  }
  return result;
}

unint64_t sub_244A24974()
{
  unint64_t result;

  result = qword_2573C3170;
  if (!qword_2573C3170)
  {
    result = MEMORY[0x24951D378](&unk_244A58524, &type metadata for TrustedCloudComputeError.RateLimitInfo.WorkloadTag.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3170);
  }
  return result;
}

unint64_t sub_244A249BC()
{
  unint64_t result;

  result = qword_2573C3178;
  if (!qword_2573C3178)
  {
    result = MEMORY[0x24951D378](&unk_244A5854C, &type metadata for TrustedCloudComputeError.RateLimitInfo.WorkloadTag.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3178);
  }
  return result;
}

_QWORD *sub_244A24A00(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3188);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244A263A0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_244A24B0C(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3180);
  v10 = *(_QWORD *)(type metadata accessor for TrustedRequestHistory.Request() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_244A56F6C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for TrustedRequestHistory.Request() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_244A26490(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_244A24D14(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
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
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_244A24DE4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4965727574616566 && a2 == 0xE900000000000044 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64616F6C6B726F77 && a2 == 0xEC00000065707954 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64616F6C6B726F77 && a2 == 0xEC00000073676154 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7466417972746572 && a2 == 0xEE00657461447265)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_244A250C8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x576E776F6E6B6E75 && a2 == 0xEF64616F6C6B726FLL;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5E450 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7375427365646F6ELL && a2 == 0xE900000000000079 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000244A5E470)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_244A25284(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000244A5E490 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000244A5E4B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_244A2536C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E6F73616572 && a2 == 0xE600000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7466417972746572 && a2 == 0xEE00657461447265)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_244A25464(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x5764696C61766E69 && a2 == 0xEF64616F6C6B726FLL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_244A25500()
{
  return 0x5764696C61766E69;
}

uint64_t sub_244A25524(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6572617774666F73 && a2 == 0xEF64656B636F6C42)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_244A255C0()
{
  return 0x6572617774666F73;
}

uint64_t sub_244A255E4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_244A25660()
{
  return 0x6E6F73616572;
}

uint64_t sub_244A25674(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5E4D0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C62617972746572 && a2 == 0xE900000000000065 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7466417972746572 && a2 == 0xEE00657461447265)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_244A257DC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000244A5E4F0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_244A258C0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6567617373656DLL && a2 == 0xE700000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_244A259A0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701080931 && a2 == 0xE400000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_244A25ACC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000014 && a2 == 0x8000000244A5E510 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000244A5E530 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4574756F656D6974 && a2 == 0xEC000000726F7272 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000244A5E550 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000244A5E570 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7245726576726573 && a2 == 0xEB00000000726F72 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C616E7265746E69 && a2 == 0xED0000726F727245 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x456B726F7774656ELL && a2 == 0xEC000000726F7272)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v5 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_244A25E18(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5E630)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_244A25E9C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x696D694C65746172 && a2 == 0xED00006F666E4974)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_244A25F38()
{
  return 0x696D694C65746172;
}

uint64_t sub_244A25F5C(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000244A5E5B0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_244A25FE0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000017 && a2 == 0x8000000244A5E5F0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_244A26064(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5E590)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_244A260E8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7245726576726573 && a2 == 0xEF6F666E49726F72)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_244A26184()
{
  return 0x7245726576726573;
}

uint64_t sub_244A261A8(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5E610)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_244A2622C(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000015 && a2 == 0x8000000244A5E5D0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_244A262B0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244A56FA8();
  __break(1u);
  return result;
}

uint64_t sub_244A263A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244A56FA8();
  __break(1u);
  return result;
}

uint64_t sub_244A26490(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for TrustedRequestHistory.Request() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_244A56FA8();
  __break(1u);
  return result;
}

void sub_244A265FC()
{
  uint64_t v0;
  uint64_t v1;

  sub_244A56F0C();
  sub_244A56D68();
  sub_244A56F54();
  sub_244A56D68();
  v1 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_buffer;
  swift_beginAccess();
  __asm { BR              X13 }
}

uint64_t sub_244A266EC()
{
  uint64_t v1;

  sub_244A570F8();
  sub_244A56D68();
  swift_bridgeObjectRelease();
  sub_244A56D68();
  return v1;
}

uint64_t TC2UInt32PrefixedStreamingMessageDeframer.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  type metadata accessor for TC2StreamingMessageBuffer();
  v1 = swift_allocObject();
  sub_244A56CCC();
  *(_OWORD *)(v1 + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_buffer) = xmmword_244A5A3C0;
  *(_QWORD *)(v0 + 16) = v1;
  *(_DWORD *)(v0 + 24) = 0;
  *(_BYTE *)(v0 + 28) = 1;
  return v0;
}

uint64_t TC2UInt32PrefixedStreamingMessageDeframer.init()()
{
  uint64_t v0;
  uint64_t v1;

  type metadata accessor for TC2StreamingMessageBuffer();
  v1 = swift_allocObject();
  sub_244A56CCC();
  *(_OWORD *)(v1 + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_buffer) = xmmword_244A5A3C0;
  *(_QWORD *)(v0 + 16) = v1;
  *(_DWORD *)(v0 + 24) = 0;
  *(_BYTE *)(v0 + 28) = 1;
  return v0;
}

_QWORD *sub_244A268D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v3 = v2;
  sub_244A503A0(a1, a2);
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((*(_BYTE *)(v2 + 28) & 1) != 0)
  {
LABEL_2:
    sub_244A505D8(4);
    if (v5 >> 60 != 15)
      __asm { BR              X9 }
  }
  else
  {
    while (1)
    {
      v6 = sub_244A505D8(*(unsigned int *)(v3 + 24));
      if (v7 >> 60 == 15)
        break;
      v8 = v6;
      v9 = v7;
      *(_DWORD *)(v3 + 24) = 0;
      *(_BYTE *)(v3 + 28) = 1;
      sub_244A26DC4(v6, v7);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_244A24A00(0, v4[2] + 1, 1, v4);
      v11 = v4[2];
      v10 = v4[3];
      if (v11 >= v10 >> 1)
        v4 = sub_244A24A00((_QWORD *)(v10 > 1), v11 + 1, 1, v4);
      v4[2] = v11 + 1;
      v12 = &v4[2 * v11];
      v12[4] = v8;
      v12[5] = v9;
      sub_244A26E08(v8, v9);
      if ((*(_BYTE *)(v3 + 28) & 1) != 0)
        goto LABEL_2;
    }
  }
  return v4;
}

void sub_244A26B18()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_buffer;
  swift_beginAccess();
  __asm { BR              X12 }
}

uint64_t sub_244A26B78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  BOOL v5;
  int v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (BYTE6(v1))
  {
    v4 = *(unsigned __int8 *)(v3 + 28);
    if (v4 != 1)
    {
      v8 = *(_DWORD *)(v3 + 24);
      sub_244A26E60();
      swift_allocError();
      *(_DWORD *)v9 = v8;
LABEL_13:
      *(_BYTE *)(v9 + 4) = v4 ^ 1;
      swift_willThrow();
      return MEMORY[0x24BEE4AF8];
    }
    if (!v2)
    {
      LODWORD(v7) = BYTE6(v1);
LABEL_12:
      sub_244A26E60();
      swift_allocError();
      *(_DWORD *)v9 = v7;
      goto LABEL_13;
    }
    if (v2 == 1)
    {
      v5 = __OFSUB__(HIDWORD(a1), (_DWORD)a1);
      v6 = HIDWORD(a1) - a1;
      if (!v5)
      {
        v7 = v6;
LABEL_10:
        if ((v7 & 0x8000000000000000) == 0 && !HIDWORD(v7))
          goto LABEL_12;
LABEL_17:
        sub_244A56F6C();
        __break(1u);
        JUMPOUT(0x244A26D04);
      }
      __break(1u);
    }
    else
    {
      v12 = a1 + 16;
      v10 = *(_QWORD *)(a1 + 16);
      v11 = *(_QWORD *)(v12 + 8);
      v7 = v11 - v10;
      if (!__OFSUB__(v11, v10))
        goto LABEL_10;
    }
    __break(1u);
    goto LABEL_17;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t TC2UInt32PrefixedStreamingMessageDeframer.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t TC2UInt32PrefixedStreamingMessageDeframer.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

_QWORD *sub_244A26D54(uint64_t a1, unint64_t a2)
{
  return sub_244A268D0(a1, a2);
}

uint64_t sub_244A26D7C()
{
  sub_244A26B18();
  return MEMORY[0x24BEE4AF8];
}

void sub_244A26DA4()
{
  sub_244A265FC();
}

uint64_t sub_244A26DC4(uint64_t a1, unint64_t a2)
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

uint64_t sub_244A26E08(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_244A26E1C(a1, a2);
  return a1;
}

uint64_t sub_244A26E1C(uint64_t a1, unint64_t a2)
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

unint64_t sub_244A26E60()
{
  unint64_t result;

  result = qword_2573C3198;
  if (!qword_2573C3198)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2UInt32PrefixedStreamingMessageDeframer.DeframingError, &type metadata for TC2UInt32PrefixedStreamingMessageDeframer.DeframingError);
    atomic_store(result, (unint64_t *)&qword_2573C3198);
  }
  return result;
}

uint64_t type metadata accessor for TC2UInt32PrefixedStreamingMessageDeframer()
{
  return objc_opt_self();
}

uint64_t method lookup function for TC2UInt32PrefixedStreamingMessageDeframer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TC2UInt32PrefixedStreamingMessageDeframer.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of TC2UInt32PrefixedStreamingMessageDeframer.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of TC2UInt32PrefixedStreamingMessageDeframer.receive(bytes:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of TC2UInt32PrefixedStreamingMessageDeframer.finish()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TC2UInt32PrefixedStreamingMessageDeframer.DeframingError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2UInt32PrefixedStreamingMessageDeframer.DeframingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = -(char)a2;
  }
  return result;
}

uint64_t sub_244A26FAC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4);
}

uint64_t sub_244A26FB4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 4) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TC2UInt32PrefixedStreamingMessageDeframer.DeframingError()
{
  return &type metadata for TC2UInt32PrefixedStreamingMessageDeframer.DeframingError;
}

uint64_t getEnumTagSinglePayload for TC2UInt32PrefixedStreamingMessageDeframer.State(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TC2UInt32PrefixedStreamingMessageDeframer.State(uint64_t result, int a2, int a3)
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

uint64_t sub_244A2701C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_244A27038(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TC2UInt32PrefixedStreamingMessageDeframer.State()
{
  return &type metadata for TC2UInt32PrefixedStreamingMessageDeframer.State;
}

uint64_t TC2RopesResponseMetadata.retryable.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;
  unsigned int v2;
  uint64_t result;
  BOOL v4;
  int v5;
  unsigned int v7;
  BOOL v8;
  unint64_t v9;

  if (v0[48] != 1)
    return 1;
  v1 = v0[2] - 16;
  if (v1 < 0x13 && ((0x78CEBu >> v1) & 1) != 0)
    return 1;
  v2 = v0[1];
  result = 1;
  v4 = v2 > 0xE;
  v5 = (1 << v2) & 0x4110;
  if (v4 || v5 == 0)
  {
    v7 = *v0;
    v8 = v7 >= 0x2D;
    v9 = (0x108002000000uLL >> v7) & 1;
    if (v8)
      return 0;
    else
      return v9;
  }
  return result;
}

uint64_t TC2RopesResponseMetadata.retryAfterDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)(v1 + 48) & 1) != 0)
  {
    v3 = v1 + *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
    v4 = sub_244A56C78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  }
  else
  {
    type metadata accessor for TC2RopesResponseMetadata();
    return sub_244A56C54();
  }
}

uint64_t type metadata accessor for TC2RopesResponseMetadata()
{
  uint64_t result;

  result = qword_2573C3340;
  if (!qword_2573C3340)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TC2RopesResponseMetadata.isError.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v11;

  v1 = type metadata accessor for TC2RopesResponseMetadata();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - v5;
  v7 = *v0;
  sub_244A28AC4((uint64_t)v0, (uint64_t)&v11 - v5);
  if (v7 == 4)
  {
    v8 = v6[1];
    sub_244A28B08((uint64_t)v6);
    sub_244A28AC4((uint64_t)v0, (uint64_t)v4);
    if (!v8)
    {
      v9 = v4[2];
      sub_244A28B08((uint64_t)v4);
      __asm { BR              X11 }
    }
  }
  else
  {
    sub_244A28B08((uint64_t)v6);
    sub_244A28AC4((uint64_t)v0, (uint64_t)v4);
  }
  sub_244A28B08((uint64_t)v4);
  return 1;
}

void TC2RopesResponseMetadata.code.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *TC2RopesResponseMetadata.code.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.code.modify())()
{
  return nullsub_1;
}

void TC2RopesResponseMetadata.status.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

_BYTE *TC2RopesResponseMetadata.status.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = *result;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.status.modify())()
{
  return nullsub_1;
}

void TC2RopesResponseMetadata.errorCode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 2);
}

_BYTE *TC2RopesResponseMetadata.errorCode.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = *result;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.errorCode.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.errorDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2RopesResponseMetadata.errorDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.errorDescription.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.cause.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2RopesResponseMetadata.cause.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.cause.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.retryAfter.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t TC2RopesResponseMetadata.retryAfter.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = result;
  *(_BYTE *)(v2 + 48) = a2 & 1;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.retryAfter.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.ttrTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2RopesResponseMetadata.ttrTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.ttrTitle.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.ttrDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2RopesResponseMetadata.ttrDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.ttrDescription.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.ttrComponentID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2RopesResponseMetadata.ttrComponentID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.ttrComponentID.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.ttrComponentName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2RopesResponseMetadata.ttrComponentName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 104) = a1;
  *(_QWORD *)(v2 + 112) = a2;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.ttrComponentName.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.ttrComponentVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2RopesResponseMetadata.ttrComponentVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  return result;
}

uint64_t (*TC2RopesResponseMetadata.ttrComponentVersion.modify())()
{
  return nullsub_1;
}

uint64_t TC2RopesResponseMetadata.init(now:code:)@<X0>(Swift::Int rawValue@<X1>, uint64_t a2@<X0>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char v8;

  *(_WORD *)(a3 + 1) = 9745;
  *(_OWORD *)(a3 + 8) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_QWORD *)(a3 + 40) = 0;
  *(_BYTE *)(a3 + 48) = 1;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  *(_OWORD *)(a3 + 120) = 0u;
  TC2RopesResponseMetadata.Code.init(rawValue:)(rawValue);
  *(_BYTE *)a3 = v8;
  v5 = a3 + *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
  v6 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a2, v6);
}

PrivateCloudCompute::TC2RopesResponseMetadata::Code_optional __swiftcall TC2RopesResponseMetadata.Code.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 29;
  switch(rawValue)
  {
    case 100:
      goto LABEL_31;
    case 101:
      v2 = 1;
      goto LABEL_31;
    case 102:
      v2 = 2;
      goto LABEL_31;
    case 103:
      v2 = 3;
      goto LABEL_31;
    case 200:
      v2 = 4;
      goto LABEL_31;
    case 201:
      v2 = 5;
      goto LABEL_31;
    case 202:
      v2 = 6;
      goto LABEL_31;
    case 203:
      v2 = 7;
      goto LABEL_31;
    case 204:
      v2 = 8;
      goto LABEL_31;
    case 205:
      v2 = 9;
      goto LABEL_31;
    case 206:
      v2 = 10;
      goto LABEL_31;
    case 300:
      v2 = 11;
      goto LABEL_31;
    case 301:
      v2 = 12;
      goto LABEL_31;
    case 302:
      v2 = 13;
      goto LABEL_31;
    case 303:
      v2 = 14;
      goto LABEL_31;
    case 304:
      v2 = 15;
      goto LABEL_31;
    case 307:
      v2 = 16;
      goto LABEL_31;
    case 308:
      v2 = 17;
      goto LABEL_31;
    case 400:
      v2 = 18;
      goto LABEL_31;
    case 401:
      v2 = 19;
      goto LABEL_31;
    case 403:
      v2 = 20;
      goto LABEL_31;
    case 404:
      v2 = 21;
      goto LABEL_31;
    case 405:
      v2 = 22;
      goto LABEL_31;
    case 406:
      v2 = 23;
      goto LABEL_31;
    case 407:
      v2 = 24;
      goto LABEL_31;
    case 408:
      v2 = 25;
      goto LABEL_31;
    case 409:
      v2 = 26;
      goto LABEL_31;
    case 410:
      v2 = 27;
      goto LABEL_31;
    case 411:
      v2 = 28;
LABEL_31:
      v3 = v2;
      goto LABEL_32;
    case 412:
LABEL_32:
      *v1 = v3;
      break;
    case 413:
      *v1 = 30;
      break;
    case 414:
      *v1 = 31;
      break;
    case 415:
      *v1 = 32;
      break;
    case 416:
      *v1 = 33;
      break;
    case 417:
      *v1 = 34;
      break;
    case 421:
      *v1 = 35;
      break;
    case 422:
      *v1 = 36;
      break;
    case 426:
      *v1 = 37;
      break;
    case 428:
      *v1 = 38;
      break;
    case 429:
      *v1 = 39;
      break;
    case 431:
      *v1 = 40;
      break;
    case 500:
      *v1 = 41;
      break;
    case 501:
      *v1 = 42;
      break;
    case 502:
      *v1 = 43;
      break;
    case 503:
      *v1 = 44;
      break;
    case 504:
      *v1 = 45;
      break;
    case 505:
      *v1 = 46;
      break;
    default:
      *v1 = 47;
      break;
  }
  return (PrivateCloudCompute::TC2RopesResponseMetadata::Code_optional)rawValue;
}

Swift::Void __swiftcall TC2RopesResponseMetadata.set(value:for:)(Swift::String value, Swift::String a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t object;
  uint64_t countAndFlagsBits;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  Swift::Int v13;
  char v14;
  char v15;
  Swift::Int v16;
  char v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  int v33;
  _BYTE *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = v2;
  object = (unint64_t)value._object;
  countAndFlagsBits = value._countAndFlagsBits;
  v8 = a2._countAndFlagsBits == 0x737574617473 && a2._object == (void *)0xE600000000000000;
  if (v8 || (v3 = a2._object, v4 = a2._countAndFlagsBits, (sub_244A5711C() & 1) != 0))
  {
    v9 = HIBYTE(object) & 0xF;
    v10 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if ((object & 0x2000000000000000) != 0)
      v11 = HIBYTE(object) & 0xF;
    else
      v11 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (!v11)
    {
LABEL_51:
      *(_BYTE *)(v5 + 1) = 17;
      return;
    }
    if ((object & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v13 = (Swift::Int)sub_244A295FC(countAndFlagsBits, object, 10);
      v15 = v36;
      swift_bridgeObjectRelease();
      goto LABEL_49;
    }
    if ((object & 0x2000000000000000) == 0)
    {
      if ((countAndFlagsBits & 0x1000000000000000) != 0)
        v12 = (unsigned __int8 *)((object & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v12 = (unsigned __int8 *)sub_244A56F48();
      v13 = (Swift::Int)sub_244A296E0(v12, v10, 10);
      v15 = v14 & 1;
LABEL_49:
      if ((v15 & 1) == 0)
      {
        TC2RopesResponseMetadata.StatusCode.init(rawValue:)(v13);
        *(_BYTE *)(v5 + 1) = v37;
        return;
      }
      goto LABEL_51;
    }
    v37 = countAndFlagsBits;
    v38 = object & 0xFFFFFFFFFFFFFFLL;
    if (countAndFlagsBits == 43)
    {
      if (!v9)
      {
LABEL_103:
        __break(1u);
LABEL_104:
        if (v4 == 0xD000000000000010 && v3 == (void *)0x8000000244A5ED00 || (sub_244A5711C() & 1) != 0)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(_QWORD *)(v2 + 88) = countAndFlagsBits;
          *(_QWORD *)(v2 + 96) = object;
        }
        else if (v4 == 0xD000000000000012 && v3 == (void *)0x8000000244A5ED20 || (sub_244A5711C() & 1) != 0)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(_QWORD *)(v2 + 104) = countAndFlagsBits;
          *(_QWORD *)(v2 + 112) = object;
        }
        else if (v4 == 0xD000000000000015 && v3 == (void *)0x8000000244A5ED40 || (sub_244A5711C() & 1) != 0)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(_QWORD *)(v2 + 120) = countAndFlagsBits;
          *(_QWORD *)(v2 + 128) = object;
        }
        return;
      }
      if (v9 != 1 && (BYTE1(countAndFlagsBits) - 48) <= 9u)
      {
        v13 = (BYTE1(countAndFlagsBits) - 48);
        if (v9 == 2)
          goto LABEL_48;
        if ((BYTE2(countAndFlagsBits) - 48) <= 9u)
        {
          v13 = 10 * (BYTE1(countAndFlagsBits) - 48)
              + (BYTE2(countAndFlagsBits) - 48);
          v18 = v9 - 3;
          if (v18)
          {
            v19 = (unsigned __int8 *)&v37 + 3;
            while (1)
            {
              v20 = *v19 - 48;
              if (v20 > 9)
                goto LABEL_41;
              v21 = 10 * v13;
              if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                goto LABEL_41;
              v13 = v21 + v20;
              if (__OFADD__(v21, v20))
                goto LABEL_41;
              v15 = 0;
              ++v19;
              if (!--v18)
                goto LABEL_49;
            }
          }
          goto LABEL_48;
        }
      }
    }
    else
    {
      if (countAndFlagsBits == 45)
      {
        if (v9)
        {
          if (v9 == 1 || (BYTE1(countAndFlagsBits) - 48) > 9u)
            goto LABEL_41;
          if (v9 == 2)
          {
            v15 = 0;
            v13 = -(uint64_t)(BYTE1(countAndFlagsBits) - 48);
            goto LABEL_49;
          }
          if ((BYTE2(countAndFlagsBits) - 48) > 9u)
            goto LABEL_41;
          v13 = -10 * (BYTE1(countAndFlagsBits) - 48)
              - (BYTE2(countAndFlagsBits) - 48);
          v26 = v9 - 3;
          if (v26)
          {
            v27 = (unsigned __int8 *)&v37 + 3;
            while (1)
            {
              v28 = *v27 - 48;
              if (v28 > 9)
                goto LABEL_41;
              v29 = 10 * v13;
              if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                goto LABEL_41;
              v13 = v29 - v28;
              if (__OFSUB__(v29, v28))
                goto LABEL_41;
              v15 = 0;
              ++v27;
              if (!--v26)
                goto LABEL_49;
            }
          }
LABEL_48:
          v15 = 0;
          goto LABEL_49;
        }
        __break(1u);
        goto LABEL_103;
      }
      if (v9 && (countAndFlagsBits - 48) <= 9u)
      {
        v13 = (countAndFlagsBits - 48);
        if (v9 == 1)
          goto LABEL_48;
        if ((BYTE1(countAndFlagsBits) - 48) <= 9u)
        {
          v13 = 10 * (countAndFlagsBits - 48) + (BYTE1(countAndFlagsBits) - 48);
          v22 = v9 - 2;
          if (v22)
          {
            v23 = (unsigned __int8 *)&v37 + 2;
            while (1)
            {
              v24 = *v23 - 48;
              if (v24 > 9)
                goto LABEL_41;
              v25 = 10 * v13;
              if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63)
                goto LABEL_41;
              v13 = v25 + v24;
              if (__OFADD__(v25, v24))
                goto LABEL_41;
              v15 = 0;
              ++v23;
              if (!--v22)
                goto LABEL_49;
            }
          }
          goto LABEL_48;
        }
      }
    }
LABEL_41:
    v13 = 0;
    v15 = 1;
    goto LABEL_49;
  }
  if (v4 == 0x6F632D726F727265 && v3 == (void *)0xEA00000000006564 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v16 = sub_244A2814C(countAndFlagsBits, object);
    if ((v17 & 1) != 0)
    {
      *(_BYTE *)(v2 + 2) = 38;
    }
    else
    {
      TC2RopesResponseMetadata.ErrorCode.init(rawValue:)(v16);
      *(_BYTE *)(v2 + 2) = v37;
    }
    return;
  }
  if (v4 == 0x7470697263736564 && v3 == (void *)0xEB000000006E6F69 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 8) = countAndFlagsBits;
    *(_QWORD *)(v2 + 16) = object;
    return;
  }
  if (v4 == 0x6573756163 && v3 == (void *)0xE500000000000000 || (v30 = sub_244A5711C(), (v30 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 24) = countAndFlagsBits;
    *(_QWORD *)(v2 + 32) = object;
    return;
  }
  if (v4 != 0x66612D7972746572 || v3 != (void *)0xEB00000000726574)
  {
    v30 = sub_244A5711C();
    if ((v30 & 1) == 0)
    {
      if (v4 == 0x6C7469742D727474 && v3 == (void *)0xE900000000000065 || (sub_244A5711C() & 1) != 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v2 + 56) = countAndFlagsBits;
        *(_QWORD *)(v2 + 64) = object;
        return;
      }
      if (v4 == 0x637365642D727474 && v3 == (void *)0xEF6E6F6974706972 || (sub_244A5711C() & 1) != 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v2 + 72) = countAndFlagsBits;
        *(_QWORD *)(v2 + 80) = object;
        return;
      }
      goto LABEL_104;
    }
  }
  v39 = 0;
  MEMORY[0x24BDAC7A8](v30);
  if ((object & 0x1000000000000000) != 0
    || !(object & 0x2000000000000000 | countAndFlagsBits & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_244A56F00();
    swift_bridgeObjectRelease();
    v33 = v37;
    goto LABEL_93;
  }
  if ((object & 0x2000000000000000) == 0)
  {
    if ((countAndFlagsBits & 0x1000000000000000) != 0)
    {
      v31 = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
      swift_bridgeObjectRetain();
    }
    else
    {
      v31 = sub_244A56F48();
      swift_bridgeObjectRetain();
      if (!v31)
      {
        v32 = 0;
        goto LABEL_82;
      }
    }
    v32 = (_BYTE *)v31;
LABEL_82:
    sub_244A29E18(v32, (BOOL *)&v37);
    v33 = v37;
    swift_bridgeObjectRelease();
    goto LABEL_93;
  }
  v37 = countAndFlagsBits;
  v38 = object & 0xFFFFFFFFFFFFFFLL;
  swift_bridgeObjectRetain();
  v33 = (countAndFlagsBits >= 0x21u || ((0x100003E01uLL >> countAndFlagsBits) & 1) == 0)
     && (v34 = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0
     && *v34 == 0;
  swift_bridgeObjectRelease();
LABEL_93:
  v35 = v39;
  if (!v33)
    v35 = 0;
  *(_QWORD *)(v5 + 40) = v35;
  *(_BYTE *)(v5 + 48) = v33 ^ 1;
}

uint64_t sub_244A2814C(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_244A56F48();
      v7 = (uint64_t)sub_244A296E0(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_244A295FC(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

PrivateCloudCompute::TC2RopesResponseMetadata::StatusCode_optional __swiftcall TC2RopesResponseMetadata.StatusCode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 17;
  if ((unint64_t)rawValue < 0x11)
    v2 = rawValue;
  *v1 = v2;
  return (PrivateCloudCompute::TC2RopesResponseMetadata::StatusCode_optional)rawValue;
}

PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional __swiftcall TC2RopesResponseMetadata.ErrorCode.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;

  if (rawValue <= 2999)
  {
    if (rawValue <= 1999)
    {
      switch(rawValue)
      {
        case 1000:
          *v1 = 1;
          break;
        case 1001:
          *v1 = 2;
          break;
        case 1002:
          *v1 = 3;
          break;
        case 1003:
          *v1 = 4;
          break;
        case 1004:
          *v1 = 5;
          break;
        case 1005:
          *v1 = 6;
          break;
        case 1006:
          *v1 = 7;
          break;
        case 1007:
          *v1 = 8;
          break;
        case 1008:
          *v1 = 9;
          break;
        case 1009:
          *v1 = 10;
          break;
        case 1010:
          *v1 = 11;
          break;
        case 1011:
          *v1 = 12;
          break;
        case 1012:
          *v1 = 13;
          break;
        case 1013:
          *v1 = 14;
          break;
        case 1014:
          *v1 = 15;
          break;
        default:
          if (rawValue)
            goto LABEL_29;
          *v1 = 0;
          break;
      }
      return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
    }
    switch(rawValue)
    {
      case 2000:
        *v1 = 16;
        return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
      case 2001:
        *v1 = 17;
        return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
      case 2002:
        *v1 = 18;
        return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
    }
LABEL_29:
    *v1 = 38;
    return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
  }
  if (rawValue > 5999)
  {
    switch(rawValue)
    {
      case 7000:
        *v1 = 31;
        break;
      case 7001:
        *v1 = 32;
        break;
      case 7002:
        *v1 = 33;
        break;
      case 7003:
        *v1 = 34;
        break;
      case 7004:
        *v1 = 35;
        break;
      case 7005:
        *v1 = 36;
        break;
      case 7006:
        *v1 = 37;
        break;
      default:
        if (rawValue == 6000)
        {
          *v1 = 29;
        }
        else
        {
          if (rawValue != 6001)
            goto LABEL_29;
          *v1 = 30;
        }
        break;
    }
  }
  else
  {
    if (rawValue <= 4000)
    {
      switch(rawValue)
      {
        case 3000:
          *v1 = 19;
          return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
        case 3001:
          *v1 = 20;
          return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
        case 4000:
          *v1 = 21;
          return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
      }
      goto LABEL_29;
    }
    switch(rawValue)
    {
      case 5002:
        *v1 = 24;
        return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
      case 5003:
        *v1 = 25;
        return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
      case 5004:
        *v1 = 26;
        return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
      case 5005:
      case 5006:
      case 5007:
      case 5009:
      case 5010:
      case 5011:
      case 5012:
        goto LABEL_29;
      case 5008:
        *v1 = 27;
        return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
      case 5013:
        *v1 = 28;
        return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
      default:
        if (rawValue == 4001)
        {
          *v1 = 22;
        }
        else
        {
          if (rawValue != 4002)
            goto LABEL_29;
          *v1 = 23;
        }
        break;
    }
  }
  return (PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional)rawValue;
}

uint64_t TC2RopesResponseMetadata.isAvailabilityConcern.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;
  int v2;
  int v5;
  _BOOL4 v7;

  v1 = v0[2] - 19;
  if (v1 < 5 && ((0x1Du >> v1) & 1) != 0)
    return 1;
  v2 = v0[1];
  if (v2 == 8 || v2 == 14)
    return 1;
  v5 = *v0;
  v7 = v5 == 44 || v5 == 39;
  return v5 != 47 && v7;
}

uint64_t TC2RopesResponseMetadata.StatusCode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

PrivateCloudCompute::TC2RopesResponseMetadata::StatusCode_optional sub_244A286CC(Swift::Int *a1)
{
  return TC2RopesResponseMetadata.StatusCode.init(rawValue:)(*a1);
}

void sub_244A286D4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_244A286E0()
{
  sub_244A2B440();
  return sub_244A56DE0();
}

uint64_t sub_244A2873C()
{
  sub_244A2B440();
  return sub_244A56DD4();
}

uint64_t TC2RopesResponseMetadata.ErrorCode.rawValue.getter()
{
  char *v0;

  return qword_244A5AD98[*v0];
}

BOOL sub_244A2879C(char *a1, char *a2)
{
  return qword_244A5AD98[*a1] == qword_244A5AD98[*a2];
}

uint64_t sub_244A287C0()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

uint64_t sub_244A2880C()
{
  return sub_244A571A0();
}

uint64_t sub_244A28840()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

PrivateCloudCompute::TC2RopesResponseMetadata::ErrorCode_optional sub_244A28888(Swift::Int *a1)
{
  return TC2RopesResponseMetadata.ErrorCode.init(rawValue:)(*a1);
}

void sub_244A28890(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_244A5AD98[*v1];
}

uint64_t sub_244A288A8()
{
  sub_244A2B3FC();
  return sub_244A56DE0();
}

uint64_t sub_244A28904()
{
  sub_244A2B3FC();
  return sub_244A56DD4();
}

uint64_t TC2RopesResponseMetadata.Code.rawValue.getter()
{
  char *v0;

  return qword_244A5AEC8[*v0];
}

uint64_t sub_244A28964(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A2899C + 4 * byte_244A5A69F[a1]))(0xD000000000000010, 0x8000000244A5ED60);
}

uint64_t sub_244A2899C()
{
  return 1701080931;
}

uint64_t sub_244A289AC()
{
  return 0x737574617473;
}

uint64_t sub_244A289C0()
{
  return 0x646F43726F727265;
}

uint64_t sub_244A289DC()
{
  return 0x6573756163;
}

uint64_t sub_244A289F0()
{
  return 0x7466417972746572;
}

uint64_t sub_244A28A0C()
{
  return 0x656C746954727474;
}

uint64_t sub_244A28A24()
{
  return 0x7263736544727474;
}

uint64_t sub_244A28A48()
{
  return 0x6F706D6F43727474;
}

uint64_t sub_244A28A90()
{
  return 7827310;
}

BOOL sub_244A28AA0(char *a1, char *a2)
{
  return qword_244A5AEC8[*a1] == qword_244A5AEC8[*a2];
}

uint64_t sub_244A28AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TC2RopesResponseMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244A28B08(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TC2RopesResponseMetadata();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244A28B44()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

uint64_t sub_244A28B90()
{
  return sub_244A571A0();
}

uint64_t sub_244A28BC4()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

PrivateCloudCompute::TC2RopesResponseMetadata::Code_optional sub_244A28C0C(Swift::Int *a1)
{
  return TC2RopesResponseMetadata.Code.init(rawValue:)(*a1);
}

void sub_244A28C14(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_244A5AEC8[*v1];
}

uint64_t sub_244A28C2C()
{
  sub_244A2B3B8();
  return sub_244A56DE0();
}

uint64_t sub_244A28C88()
{
  sub_244A2B3B8();
  return sub_244A56DD4();
}

uint64_t sub_244A28CD4()
{
  unsigned __int8 *v0;

  return sub_244A28964(*v0);
}

uint64_t sub_244A28CDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A2AF2C(a1, a2);
  *a3 = result;
  return result;
}

void sub_244A28D00(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_244A28D0C()
{
  sub_244A29E84();
  return sub_244A571E8();
}

uint64_t sub_244A28D34()
{
  sub_244A29E84();
  return sub_244A571F4();
}

uint64_t TC2RopesResponseMetadata.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3288);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A29E84();
  sub_244A571DC();
  v10[15] = *v3;
  v10[14] = 0;
  sub_244A29EC8();
  sub_244A57098();
  if (!v2)
  {
    v10[13] = v3[1];
    v10[12] = 1;
    sub_244A29F0C();
    sub_244A57098();
    v10[11] = v3[2];
    v10[10] = 2;
    sub_244A29F50();
    sub_244A57098();
    v10[9] = 3;
    sub_244A57074();
    v10[8] = 4;
    sub_244A57074();
    v10[7] = 5;
    sub_244A57080();
    v10[6] = 6;
    sub_244A57074();
    v10[5] = 7;
    sub_244A57074();
    v10[4] = 8;
    sub_244A57074();
    v10[3] = 9;
    sub_244A57074();
    v10[2] = 10;
    sub_244A57074();
    type metadata accessor for TC2RopesResponseMetadata();
    v10[1] = 11;
    sub_244A56C78();
    sub_244A2A060(&qword_2573C2820, MEMORY[0x24BDCE920]);
    sub_244A570E0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t TC2RopesResponseMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;

  v31 = a2;
  v32 = sub_244A56C78();
  v3 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C32B0);
  v6 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TC2RopesResponseMetadata();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_WORD *)(v11 + 1) = 9745;
  *(_OWORD *)(v11 + 8) = 0u;
  *(_OWORD *)(v11 + 24) = 0u;
  *((_QWORD *)v11 + 5) = 0;
  v11[48] = 1;
  *(_OWORD *)(v11 + 56) = 0u;
  *(_OWORD *)(v11 + 72) = 0u;
  *(_OWORD *)(v11 + 88) = 0u;
  *(_OWORD *)(v11 + 104) = 0u;
  *(_OWORD *)(v11 + 120) = 0u;
  v12 = a1[3];
  v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_244A29E84();
  v33 = v8;
  v13 = v36;
  sub_244A571D0();
  if (v13)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v14 = v9;
    v15 = v6;
    v16 = v5;
    v17 = v3;
    v50 = 0;
    sub_244A29F94();
    sub_244A56FFC();
    *v11 = v51;
    v48 = 1;
    sub_244A29FD8();
    sub_244A56FFC();
    v11[1] = v49;
    v46 = 2;
    sub_244A2A01C();
    sub_244A56FFC();
    v11[2] = v47;
    v45 = 3;
    *((_QWORD *)v11 + 1) = sub_244A56FD8();
    *((_QWORD *)v11 + 2) = v18;
    v44 = 4;
    *((_QWORD *)v11 + 3) = sub_244A56FD8();
    *((_QWORD *)v11 + 4) = v19;
    v43 = 5;
    *((_QWORD *)v11 + 5) = sub_244A56FE4();
    v11[48] = v20 & 1;
    v42 = 6;
    *((_QWORD *)v11 + 7) = sub_244A56FD8();
    *((_QWORD *)v11 + 8) = v21;
    v41 = 7;
    *((_QWORD *)v11 + 9) = sub_244A56FD8();
    *((_QWORD *)v11 + 10) = v22;
    v40 = 8;
    *((_QWORD *)v11 + 11) = sub_244A56FD8();
    *((_QWORD *)v11 + 12) = v23;
    v39 = 9;
    *((_QWORD *)v11 + 13) = sub_244A56FD8();
    *((_QWORD *)v11 + 14) = v24;
    v38 = 10;
    *((_QWORD *)v11 + 15) = sub_244A56FD8();
    *((_QWORD *)v11 + 16) = v25;
    v37 = 11;
    sub_244A2A060(&qword_2573C2840, MEMORY[0x24BDCE960]);
    v26 = v33;
    v27 = v34;
    sub_244A57044();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v26, v27);
    v28 = (uint64_t)v35;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v11[*(int *)(v14 + 60)], v16, v32);
    sub_244A28AC4((uint64_t)v11, v31);
    __swift_destroy_boxed_opaque_existential_1(v28);
    return sub_244A28B08((uint64_t)v11);
  }
}

uint64_t sub_244A294F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TC2RopesResponseMetadata.init(from:)(a1, a2);
}

uint64_t sub_244A2950C(_QWORD *a1)
{
  return TC2RopesResponseMetadata.encode(to:)(a1);
}

_QWORD *sub_244A29520(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB1A8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_244A29584(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_244A56DB0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24951CBD4](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unsigned __int8 *sub_244A295FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_244A56DBC();
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
  v5 = sub_244A2995C();
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
    v7 = (unsigned __int8 *)sub_244A56F48();
  }
LABEL_7:
  v11 = sub_244A296E0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_244A296E0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_244A2995C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_244A56DC8();
  v4 = sub_244A299D8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_244A299D8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_244A29B1C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_244A29520(v9, 0);
      v12 = sub_244A29C08((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x24951CB98](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24951CB98);
LABEL_9:
      sub_244A56F48();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24951CB98]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_244A29B1C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_244A29584(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_244A29584(a2, a3, a4);
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
    return sub_244A56D98();
  }
  __break(1u);
  return result;
}

unint64_t sub_244A29C08(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_244A29584(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_244A56DA4();
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
          result = sub_244A56F48();
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
    result = sub_244A29584(v12, a6, a7);
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
    v12 = sub_244A56D80();
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

_BYTE *sub_244A29E18@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

unint64_t sub_244A29E84()
{
  unint64_t result;

  result = qword_2573C3290;
  if (!qword_2573C3290)
  {
    result = MEMORY[0x24951D378](&unk_244A5AD44, &type metadata for TC2RopesResponseMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3290);
  }
  return result;
}

unint64_t sub_244A29EC8()
{
  unint64_t result;

  result = qword_2573C3298;
  if (!qword_2573C3298)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.Code, &type metadata for TC2RopesResponseMetadata.Code);
    atomic_store(result, (unint64_t *)&qword_2573C3298);
  }
  return result;
}

unint64_t sub_244A29F0C()
{
  unint64_t result;

  result = qword_2573C32A0;
  if (!qword_2573C32A0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.StatusCode, &type metadata for TC2RopesResponseMetadata.StatusCode);
    atomic_store(result, (unint64_t *)&qword_2573C32A0);
  }
  return result;
}

unint64_t sub_244A29F50()
{
  unint64_t result;

  result = qword_2573C32A8;
  if (!qword_2573C32A8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.ErrorCode, &type metadata for TC2RopesResponseMetadata.ErrorCode);
    atomic_store(result, (unint64_t *)&qword_2573C32A8);
  }
  return result;
}

unint64_t sub_244A29F94()
{
  unint64_t result;

  result = qword_2573C32B8;
  if (!qword_2573C32B8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.Code, &type metadata for TC2RopesResponseMetadata.Code);
    atomic_store(result, (unint64_t *)&qword_2573C32B8);
  }
  return result;
}

unint64_t sub_244A29FD8()
{
  unint64_t result;

  result = qword_2573C32C0;
  if (!qword_2573C32C0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.StatusCode, &type metadata for TC2RopesResponseMetadata.StatusCode);
    atomic_store(result, (unint64_t *)&qword_2573C32C0);
  }
  return result;
}

unint64_t sub_244A2A01C()
{
  unint64_t result;

  result = qword_2573C32C8;
  if (!qword_2573C32C8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.ErrorCode, &type metadata for TC2RopesResponseMetadata.ErrorCode);
    atomic_store(result, (unint64_t *)&qword_2573C32C8);
  }
  return result;
}

uint64_t sub_244A2A060(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_244A56C78();
    result = MEMORY[0x24951D378](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244A2A0A4()
{
  unint64_t result;

  result = qword_2573C32D0;
  if (!qword_2573C32D0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.StatusCode, &type metadata for TC2RopesResponseMetadata.StatusCode);
    atomic_store(result, (unint64_t *)&qword_2573C32D0);
  }
  return result;
}

unint64_t sub_244A2A0EC()
{
  unint64_t result;

  result = qword_2573C32D8;
  if (!qword_2573C32D8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.ErrorCode, &type metadata for TC2RopesResponseMetadata.ErrorCode);
    atomic_store(result, (unint64_t *)&qword_2573C32D8);
  }
  return result;
}

unint64_t sub_244A2A134()
{
  unint64_t result;

  result = qword_2573C32E0;
  if (!qword_2573C32E0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.Code, &type metadata for TC2RopesResponseMetadata.Code);
    atomic_store(result, (unint64_t *)&qword_2573C32E0);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for TC2RopesResponseMetadata(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_WORD *)(a1 + 1) = *(_WORD *)((char *)a2 + 1);
    v5 = a2[2];
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_QWORD *)(a1 + 16) = v5;
    v6 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v6;
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v7 = a2[8];
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v7;
    v8 = a2[10];
    *(_QWORD *)(a1 + 72) = a2[9];
    *(_QWORD *)(a1 + 80) = v8;
    v9 = a2[12];
    *(_QWORD *)(a1 + 88) = a2[11];
    *(_QWORD *)(a1 + 96) = v9;
    v10 = a2[14];
    *(_QWORD *)(a1 + 104) = a2[13];
    *(_QWORD *)(a1 + 112) = v10;
    v11 = a2[16];
    v12 = *(int *)(a3 + 60);
    v17 = a1 + v12;
    v18 = (uint64_t)a2 + v12;
    *(_QWORD *)(a1 + 120) = a2[15];
    *(_QWORD *)(a1 + 128) = v11;
    v13 = sub_244A56C78();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v17, v18, v13);
  }
  return v3;
}

uint64_t destroy for TC2RopesResponseMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 60);
  v5 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for TC2RopesResponseMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  v10 = *(_QWORD *)(a2 + 128);
  v11 = *(int *)(a3 + 60);
  v15 = a1 + v11;
  v16 = a2 + v11;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v10;
  v12 = sub_244A56C78();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v15, v16, v12);
  return a1;
}

uint64_t assignWithCopy for TC2RopesResponseMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 60);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244A56C78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for TC2RopesResponseMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  v4 = *(int *)(a3 + 60);
  v5 = a1 + v4;
  v6 = a2 + v4;
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  v7 = sub_244A56C78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for TC2RopesResponseMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v12;
  swift_bridgeObjectRelease();
  v13 = *(int *)(a3 + 60);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_244A56C78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for TC2RopesResponseMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A2A734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_244A56C78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 60), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for TC2RopesResponseMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A2A7C8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 16) = a2;
  }
  else
  {
    v7 = sub_244A56C78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 60), a2, a2, v7);
  }
  return result;
}

uint64_t sub_244A2A83C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244A56C78();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TC2RopesResponseMetadata.StatusCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF0)
    goto LABEL_17;
  if (a2 + 16 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 16) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 16;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 16;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 16;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x11;
  v8 = v6 - 17;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2RopesResponseMetadata.StatusCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 16 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 16) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEF)
    return ((uint64_t (*)(void))((char *)&loc_244A2A9C0 + 4 * byte_244A5A6B0[v4]))();
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_244A2A9F4 + 4 * byte_244A5A6AB[v4]))();
}

uint64_t sub_244A2A9F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A2A9FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A2AA04);
  return result;
}

uint64_t sub_244A2AA10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A2AA18);
  *(_BYTE *)result = a2 + 16;
  return result;
}

uint64_t sub_244A2AA1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A2AA24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2RopesResponseMetadata.StatusCode()
{
  return &type metadata for TC2RopesResponseMetadata.StatusCode;
}

uint64_t getEnumTagSinglePayload for TC2RopesResponseMetadata.ErrorCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDB)
    goto LABEL_17;
  if (a2 + 37 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 37) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 37;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 37;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 37;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x26;
  v8 = v6 - 38;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2RopesResponseMetadata.ErrorCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 37 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 37) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDA)
    return ((uint64_t (*)(void))((char *)&loc_244A2AB1C + 4 * byte_244A5A6BA[v4]))();
  *a1 = a2 + 37;
  return ((uint64_t (*)(void))((char *)sub_244A2AB50 + 4 * byte_244A5A6B5[v4]))();
}

uint64_t sub_244A2AB50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A2AB58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A2AB60);
  return result;
}

uint64_t sub_244A2AB6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A2AB74);
  *(_BYTE *)result = a2 + 37;
  return result;
}

uint64_t sub_244A2AB78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A2AB80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2RopesResponseMetadata.ErrorCode()
{
  return &type metadata for TC2RopesResponseMetadata.ErrorCode;
}

uint64_t getEnumTagSinglePayload for TC2RopesResponseMetadata.Code(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xD2)
    goto LABEL_17;
  if (a2 + 46 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 46) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 46;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 46;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 46;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x2F;
  v8 = v6 - 47;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2RopesResponseMetadata.Code(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 46 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 46) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD1)
    return ((uint64_t (*)(void))((char *)&loc_244A2AC78 + 4 * byte_244A5A6C4[v4]))();
  *a1 = a2 + 46;
  return ((uint64_t (*)(void))((char *)sub_244A2ACAC + 4 * byte_244A5A6BF[v4]))();
}

uint64_t sub_244A2ACAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A2ACB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A2ACBCLL);
  return result;
}

uint64_t sub_244A2ACC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A2ACD0);
  *(_BYTE *)result = a2 + 46;
  return result;
}

uint64_t sub_244A2ACD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A2ACDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2RopesResponseMetadata.Code()
{
  return &type metadata for TC2RopesResponseMetadata.Code;
}

uint64_t getEnumTagSinglePayload for TC2RopesResponseMetadata.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2RopesResponseMetadata.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_244A2ADD4 + 4 * byte_244A5A6CE[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_244A2AE08 + 4 * byte_244A5A6C9[v4]))();
}

uint64_t sub_244A2AE08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A2AE10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A2AE18);
  return result;
}

uint64_t sub_244A2AE24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A2AE2CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_244A2AE30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A2AE38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2RopesResponseMetadata.CodingKeys()
{
  return &type metadata for TC2RopesResponseMetadata.CodingKeys;
}

unint64_t sub_244A2AE58()
{
  unint64_t result;

  result = qword_2573C33A0;
  if (!qword_2573C33A0)
  {
    result = MEMORY[0x24951D378](&unk_244A5AD1C, &type metadata for TC2RopesResponseMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C33A0);
  }
  return result;
}

unint64_t sub_244A2AEA0()
{
  unint64_t result;

  result = qword_2573C33A8;
  if (!qword_2573C33A8)
  {
    result = MEMORY[0x24951D378](&unk_244A5AC8C, &type metadata for TC2RopesResponseMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C33A8);
  }
  return result;
}

unint64_t sub_244A2AEE8()
{
  unint64_t result;

  result = qword_2573C33B0;
  if (!qword_2573C33B0)
  {
    result = MEMORY[0x24951D378](&unk_244A5ACB4, &type metadata for TC2RopesResponseMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C33B0);
  }
  return result;
}

uint64_t sub_244A2AF2C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701080931 && a2 == 0xE400000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737574617473 && a2 == 0xE600000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5ED60 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6573756163 && a2 == 0xE500000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7466417972746572 && a2 == 0xEA00000000007265 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656C746954727474 && a2 == 0xE800000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x7263736544727474 && a2 == 0xEE006E6F69747069 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6F706D6F43727474 && a2 == 0xEE004449746E656ELL || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5ED80 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000244A5EDA0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 7827310 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

unint64_t sub_244A2B3B8()
{
  unint64_t result;

  result = qword_2573C33B8;
  if (!qword_2573C33B8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.Code, &type metadata for TC2RopesResponseMetadata.Code);
    atomic_store(result, (unint64_t *)&qword_2573C33B8);
  }
  return result;
}

unint64_t sub_244A2B3FC()
{
  unint64_t result;

  result = qword_2573C33C0;
  if (!qword_2573C33C0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.ErrorCode, &type metadata for TC2RopesResponseMetadata.ErrorCode);
    atomic_store(result, (unint64_t *)&qword_2573C33C0);
  }
  return result;
}

unint64_t sub_244A2B440()
{
  unint64_t result;

  result = qword_2573C33C8;
  if (!qword_2573C33C8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RopesResponseMetadata.StatusCode, &type metadata for TC2RopesResponseMetadata.StatusCode);
    atomic_store(result, (unint64_t *)&qword_2573C33C8);
  }
  return result;
}

uint64_t sub_244A2B484@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2B828(a1, a2, &qword_2573C3530, type metadata accessor for TrustedCloudComputeError, &qword_2573C3538, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError, a3);
}

uint64_t sub_244A2B4A8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_244A2C3E8(a1, a2, (void (*)(void))sub_244A2EC70, a3);
}

uint64_t sub_244A2B4BC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v6;

  v4 = sub_244A56CD8();
  MEMORY[0x24BDAC7A8](v4);
  sub_244A56B40();
  swift_allocObject();
  sub_244A56B34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3548);
  sub_244A2EBF4();
  sub_244A56B28();
  swift_release();
  sub_244A26E1C(a1, a2);
  return v6;
}

uint64_t sub_244A2B804@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2B828(a1, a2, &qword_2573C3520, (uint64_t (*)(uint64_t))type metadata accessor for TrustedCloudComputeRateLimit, &qword_2573C3528, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeRateLimit, a3);
}

uint64_t sub_244A2B828@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t (*a4)(uint64_t)@<X3>, unint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  void (*v21)(char *, _QWORD, uint64_t, uint64_t);
  _QWORD v23[5];

  v14 = sub_244A56CD8();
  v23[3] = *(_QWORD *)(v14 - 8);
  v23[4] = v14;
  MEMORY[0x24BDAC7A8](v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a3);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244A56B40();
  swift_allocObject();
  sub_244A56B34();
  v18 = a4(0);
  v19 = a5;
  v20 = v18;
  sub_244A14624(v19, a4, a6);
  sub_244A56B28();
  swift_release();
  v21 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v21(v17, 0, 1, v20);
  sub_244A26E1C(a1, a2);
  sub_244A1AAC0((uint64_t)v17, a7, a4);
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v21)(a7, 0, 1, v20);
}

double sub_244A2BC88@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  double result;
  uint64_t v8;
  __int128 v9;

  v6 = sub_244A56CD8();
  MEMORY[0x24BDAC7A8](v6);
  sub_244A56B40();
  swift_allocObject();
  sub_244A56B34();
  sub_244A2EB6C();
  sub_244A56B28();
  swift_release();
  sub_244A26E1C(a1, a2);
  *(_QWORD *)a3 = v8;
  result = *(double *)&v9;
  *(_OWORD *)(a3 + 8) = v9;
  return result;
}

uint64_t sub_244A2BFFC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v11[128];
  _OWORD v12[6];
  _OWORD v13[2];
  _QWORD v14[17];

  v6 = sub_244A56CD8();
  MEMORY[0x24BDAC7A8](v6);
  sub_244A56B40();
  swift_allocObject();
  sub_244A56B34();
  sub_244A2EAC4();
  sub_244A56B28();
  swift_release();
  nullsub_1(v14);
  sub_244A26E1C(a1, a2);
  sub_244A2EB24((uint64_t)v14, (uint64_t)v11);
  sub_244A2EB24((uint64_t)v11, (uint64_t)v12);
  v7 = v12[5];
  a3[4] = v12[4];
  a3[5] = v7;
  a3[6] = v13[0];
  *(_OWORD *)((char *)a3 + 105) = *(_OWORD *)((char *)v13 + 9);
  v8 = v12[1];
  *a3 = v12[0];
  a3[1] = v8;
  v9 = v12[3];
  a3[2] = v12[2];
  a3[3] = v9;
  return nullsub_1(a3);
}

uint64_t sub_244A2C3B0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2B828(a1, a2, &qword_2573C34F8, (uint64_t (*)(uint64_t))type metadata accessor for TC2TrustedRequestMetadata, &qword_2573C3500, (uint64_t)&protocol conformance descriptor for TC2TrustedRequestMetadata, a3);
}

uint64_t sub_244A2C3D4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_244A2C3E8(a1, a2, (void (*)(void))sub_244A2EA80, a3);
}

uint64_t sub_244A2C3E8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void (*a3)(void)@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v8 = sub_244A56CD8();
  MEMORY[0x24BDAC7A8](v8);
  sub_244A56B40();
  swift_allocObject();
  sub_244A56B34();
  a3();
  sub_244A56B28();
  swift_release();
  result = sub_244A26E1C(a1, a2);
  *a4 = v10;
  return result;
}

uint64_t sub_244A2C74C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2B828(a1, a2, &qword_2573C34E0, (uint64_t (*)(uint64_t))type metadata accessor for TC2RequestState, &qword_2573C34E8, (uint64_t)&protocol conformance descriptor for TC2RequestState, a3);
}

uint64_t TC2Client.__allocating_init(userID:)(unint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  type metadata accessor for XPCWrapper();
  swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_244A40F70(a1 | ((HIDWORD(a1) & 1) << 32));
  return v2;
}

uint64_t TC2Client.init(userID:)(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1;
  type metadata accessor for XPCWrapper();
  swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_244A40F70(a1 | ((HIDWORD(a1) & 1) << 32));
  return v2;
}

uint64_t TC2Client.deinit()
{
  uint64_t v0;

  sub_244A40194();
  swift_release();
  return v0;
}

uint64_t TC2Client.__deallocating_deinit()
{
  sub_244A40194();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_244A2C8A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_244A2C8BC()
{
  _QWORD *v0;
  uint64_t v1;

  v0[5] = *(_QWORD *)(v0[4] + 16);
  type metadata accessor for XPCWrapper();
  v0[6] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[7] = sub_244A56DF8();
  v0[8] = v1;
  return swift_task_switch();
}

void sub_244A2C93C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[5];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[9] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[10] = v4;
    *v4 = v0;
    v4[1] = sub_244A2CA04;
    sub_244A57140();
  }
}

uint64_t sub_244A2CA04()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2CA70()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_244A2CA7C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xE000000000000000);
}

uint64_t TC2Client.requestMetadata()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = v1;
  return swift_task_switch();
}

uint64_t sub_244A2CAD8()
{
  _QWORD *v0;
  uint64_t v1;

  v0[6] = *(_QWORD *)(v0[5] + 16);
  type metadata accessor for XPCWrapper();
  v0[7] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[8] = sub_244A56DF8();
  v0[9] = v1;
  return swift_task_switch();
}

void sub_244A2CB58()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[6];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[10] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[11] = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
    *v4 = v0;
    v4[1] = sub_244A2CC28;
    sub_244A57140();
  }
}

uint64_t sub_244A2CC28()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2CC94()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 104) = *(_OWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_244A2CCB0()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  if (v1 >> 60 == 15)
    **(_QWORD **)(v0 + 32) = 0;
  else
    sub_244A2C3E8(*(_QWORD *)(v0 + 104), v1, (void (*)(void))sub_244A2EC70, *(_QWORD **)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A2CD10()
{
  uint64_t v0;

  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2CD58()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 32) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TC2Client.prefetch(request:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = v1;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_244A2CD90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v2;
  *v2 = v0;
  v2[1] = sub_244A2CDF4;
  return sub_244A40364(v0 + 16, v3);
}

uint64_t sub_244A2CDF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 80) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_244A2CE68()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TC2Client.prewarm(request:bundleIdentifier:featureIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 40) = a5;
  *(_QWORD *)(v6 + 48) = v5;
  *(_QWORD *)(v6 + 24) = a3;
  *(_QWORD *)(v6 + 32) = a4;
  *(_QWORD *)(v6 + 16) = a2;
  *(_OWORD *)(v6 + 56) = *(_OWORD *)a1;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_244A2CEA4()
{
  _QWORD *v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = v0[9];
  v0[10] = *(_QWORD *)(v0[6] + 16);
  if (v1)
    v2 = v1;
  else
    v2 = sub_244A2D130(MEMORY[0x24BEE4AF8]);
  v0[11] = v2;
  type metadata accessor for XPCWrapper();
  v0[12] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  swift_bridgeObjectRetain();
  v0[13] = sub_244A56DF8();
  v0[14] = v3;
  return swift_task_switch();
}

void sub_244A2CF58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;
  __int128 v9;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 88);
    v4 = *(_QWORD *)(v0 + 40);
    v8 = *(_OWORD *)(v0 + 56);
    v9 = *(_OWORD *)(v0 + 24);
    v5 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v6 = swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v6;
    *(_QWORD *)(v6 + 16) = v1;
    *(_QWORD *)(v6 + 24) = v2;
    *(_OWORD *)(v6 + 32) = v8;
    *(_QWORD *)(v6 + 48) = v3;
    *(_QWORD *)(v6 + 56) = v5;
    *(_OWORD *)(v6 + 64) = v9;
    *(_QWORD *)(v6 + 80) = v4;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v7;
    *v7 = v0;
    v7[1] = sub_244A2D04C;
    sub_244A57140();
  }
}

uint64_t sub_244A2D04C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2D0B8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A2D0E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_244A2D130(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3558);
  v2 = (_QWORD *)sub_244A56F9C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_244A46BF0(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

uint64_t TC2Client.prefetchParametersCache()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_244A2D268()
{
  _QWORD *v0;
  uint64_t v1;

  v0[4] = *(_QWORD *)(v0[3] + 16);
  type metadata accessor for XPCWrapper();
  v0[5] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[6] = sub_244A56DF8();
  v0[7] = v1;
  return swift_task_switch();
}

void sub_244A2D2E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[8] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[9] = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
    *v4 = v0;
    v4[1] = sub_244A2D3B8;
    sub_244A57140();
  }
}

uint64_t sub_244A2D3B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t TC2Client.prefetchParametersCacheSavedState()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_244A2D43C()
{
  _QWORD *v0;
  uint64_t v1;

  v0[4] = *(_QWORD *)(v0[3] + 16);
  type metadata accessor for XPCWrapper();
  v0[5] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[6] = sub_244A56DF8();
  v0[7] = v1;
  return swift_task_switch();
}

void sub_244A2D4BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[8] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[9] = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
    *v4 = v0;
    v4[1] = sub_244A2D3B8;
    sub_244A57140();
  }
}

uint64_t TC2Client.prefetchCacheReset()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_244A2D5A4()
{
  _QWORD *v0;
  uint64_t v1;

  v0[3] = *(_QWORD *)(v0[2] + 16);
  type metadata accessor for XPCWrapper();
  v0[4] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[5] = sub_244A56DF8();
  v0[6] = v1;
  return swift_task_switch();
}

void sub_244A2D624()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[3];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[7] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[8] = v4;
    *v4 = v0;
    v4[1] = sub_244A2D6EC;
    sub_244A57140();
  }
}

uint64_t sub_244A2D6EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2D758()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 80));
}

uint64_t sub_244A2D764()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t TC2Client.prefetchCache()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_244A2D7BC()
{
  _QWORD *v0;
  uint64_t v1;

  v0[4] = *(_QWORD *)(v0[3] + 16);
  type metadata accessor for XPCWrapper();
  v0[5] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[6] = sub_244A56DF8();
  v0[7] = v1;
  return swift_task_switch();
}

void sub_244A2D83C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[8] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[9] = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
    *v4 = v0;
    v4[1] = sub_244A2D914;
    sub_244A57140();
  }
}

uint64_t sub_244A2D914()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2D980()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_244A2D988()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t TC2Client.knownRateLimits(bundleIdentifier:featureIdentifier:skipFetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 56) = a4;
  *(_QWORD *)(v6 + 64) = v5;
  *(_BYTE *)(v6 + 144) = a5;
  *(_QWORD *)(v6 + 40) = a2;
  *(_QWORD *)(v6 + 48) = a3;
  *(_QWORD *)(v6 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_244A2D9F0()
{
  _QWORD *v0;
  uint64_t v1;

  v0[9] = *(_QWORD *)(v0[8] + 16);
  type metadata accessor for XPCWrapper();
  v0[10] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[11] = sub_244A56DF8();
  v0[12] = v1;
  return swift_task_switch();
}

void sub_244A2DA70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *(_BYTE *)(v0 + 144);
    v5 = *(_QWORD *)(v0 + 48);
    v4 = *(_QWORD *)(v0 + 56);
    v8 = *(_OWORD *)(v0 + 32);
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v6 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v6;
    *(_QWORD *)(v6 + 16) = v1;
    *(_QWORD *)(v6 + 24) = v2;
    *(_OWORD *)(v6 + 32) = v8;
    *(_QWORD *)(v6 + 48) = v5;
    *(_QWORD *)(v6 + 56) = v4;
    *(_BYTE *)(v6 + 64) = v3;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
    *v7 = v0;
    v7[1] = sub_244A2DB70;
    sub_244A57140();
  }
}

uint64_t sub_244A2DB70()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2DBDC()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t TC2Client.listRateLimits(bundleIdentifier:featureIdentifier:fetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 56) = a4;
  *(_QWORD *)(v6 + 64) = v5;
  *(_BYTE *)(v6 + 144) = a5;
  *(_QWORD *)(v6 + 40) = a2;
  *(_QWORD *)(v6 + 48) = a3;
  *(_QWORD *)(v6 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_244A2DC1C()
{
  _QWORD *v0;
  uint64_t v1;

  v0[9] = *(_QWORD *)(v0[8] + 16);
  type metadata accessor for XPCWrapper();
  v0[10] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[11] = sub_244A56DF8();
  v0[12] = v1;
  return swift_task_switch();
}

void sub_244A2DC9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *(_BYTE *)(v0 + 144);
    v5 = *(_QWORD *)(v0 + 48);
    v4 = *(_QWORD *)(v0 + 56);
    v8 = *(_OWORD *)(v0 + 32);
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v6 = swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v6;
    *(_QWORD *)(v6 + 16) = v1;
    *(_QWORD *)(v6 + 24) = v2;
    *(_OWORD *)(v6 + 32) = v8;
    *(_QWORD *)(v6 + 48) = v5;
    *(_QWORD *)(v6 + 56) = v4;
    *(_BYTE *)(v6 + 64) = v3;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
    *v7 = v0;
    v7[1] = sub_244A2DD9C;
    sub_244A57140();
  }
}

uint64_t sub_244A2DD9C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2DE08()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 128) = *(_OWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_244A2DE24()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1 >> 60 != 15)
  {
    v3 = *(_QWORD *)(v0 + 128);
    sub_244A26DC4(v3, *(_QWORD *)(v0 + 136));
    v4 = sub_244A2B4BC(v3, v1);
    sub_244A26E08(v3, v1);
    if (v4)
      v2 = v4;
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_244A2DEA4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t TC2Client.addRateLimit(bundleIdentifier:featureIdentifier:workloadType:count:duration:ttl:jitter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v11 + 96) = v10;
  *(double *)(v11 + 80) = a9;
  *(double *)(v11 + 88) = a10;
  *(double *)(v11 + 72) = a8;
  *(_QWORD *)(v11 + 56) = a6;
  *(_QWORD *)(v11 + 64) = a7;
  *(_QWORD *)(v11 + 40) = a4;
  *(_QWORD *)(v11 + 48) = a5;
  *(_QWORD *)(v11 + 24) = a2;
  *(_QWORD *)(v11 + 32) = a3;
  *(_QWORD *)(v11 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_244A2DF18()
{
  _QWORD *v0;
  uint64_t v1;

  v0[13] = *(_QWORD *)(v0[12] + 16);
  type metadata accessor for XPCWrapper();
  v0[14] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[15] = sub_244A56DF8();
  v0[16] = v1;
  return swift_task_switch();
}

void sub_244A2DF98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 88);
    v4 = *(_QWORD *)(v0 + 64);
    v9 = *(_OWORD *)(v0 + 48);
    v10 = *(_OWORD *)(v0 + 72);
    v7 = *(_OWORD *)(v0 + 16);
    v8 = *(_OWORD *)(v0 + 32);
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v5 = swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v5;
    *(_QWORD *)(v5 + 16) = v1;
    *(_QWORD *)(v5 + 24) = v2;
    *(_OWORD *)(v5 + 32) = v7;
    *(_OWORD *)(v5 + 48) = v8;
    *(_OWORD *)(v5 + 64) = v9;
    *(_QWORD *)(v5 + 80) = v4;
    *(_OWORD *)(v5 + 88) = v10;
    *(_QWORD *)(v5 + 104) = v3;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v6;
    *v6 = v0;
    v6[1] = sub_244A2E0A4;
    sub_244A57140();
  }
}

uint64_t sub_244A2E0A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2E110()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A2E118()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TC2Client.resetRateLimits()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_244A2E16C()
{
  _QWORD *v0;
  uint64_t v1;

  v0[3] = *(_QWORD *)(v0[2] + 16);
  type metadata accessor for XPCWrapper();
  v0[4] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[5] = sub_244A56DF8();
  v0[6] = v1;
  return swift_task_switch();
}

void sub_244A2E1EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[3];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[7] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[8] = v4;
    *v4 = v0;
    v4[1] = sub_244A2E2A4;
    sub_244A57140();
  }
}

uint64_t sub_244A2E2A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2E310()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TC2Client.fetchServerDrivenConfiguration()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_244A2E364()
{
  _QWORD *v0;
  uint64_t v1;

  v0[5] = *(_QWORD *)(v0[4] + 16);
  type metadata accessor for XPCWrapper();
  v0[6] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[7] = sub_244A56DF8();
  v0[8] = v1;
  return swift_task_switch();
}

void sub_244A2E3E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[5];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[9] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[10] = v4;
    *v4 = v0;
    v4[1] = sub_244A2E4AC;
    sub_244A57140();
  }
}

uint64_t sub_244A2E4AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t TC2Client.listServerDrivenConfiguration()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_244A2E530()
{
  _QWORD *v0;
  uint64_t v1;

  v0[5] = *(_QWORD *)(v0[4] + 16);
  type metadata accessor for XPCWrapper();
  v0[6] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[7] = sub_244A56DF8();
  v0[8] = v1;
  return swift_task_switch();
}

void sub_244A2E5B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[5];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v3 = swift_task_alloc();
    v0[9] = v3;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = (_QWORD *)swift_task_alloc();
    v0[10] = v4;
    *v4 = v0;
    v4[1] = sub_244A2E678;
    sub_244A57140();
  }
}

uint64_t sub_244A2E678()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2E6E4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xC000000000000000);
}

uint64_t TC2Client.setServerDrivenConfiguration(json:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return swift_task_switch();
}

uint64_t sub_244A2E744()
{
  _QWORD *v0;
  uint64_t v1;

  v0[7] = *(_QWORD *)(v0[6] + 16);
  type metadata accessor for XPCWrapper();
  v0[8] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v0[9] = sub_244A56DF8();
  v0[10] = v1;
  return swift_task_switch();
}

void sub_244A2E7C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = v0[7];
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v4 = v0[4];
    v3 = v0[5];
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v5 = (_QWORD *)swift_task_alloc();
    v0[11] = v5;
    v5[2] = v1;
    v5[3] = v2;
    v5[4] = v4;
    v5[5] = v3;
    v6 = (_QWORD *)swift_task_alloc();
    v0[12] = v6;
    *v6 = v0;
    v6[1] = sub_244A2E89C;
    sub_244A57140();
  }
}

uint64_t sub_244A2E89C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A2E908()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xC000000000000000);
}

uint64_t sub_244A2E94C(uint64_t a1)
{
  uint64_t v1;

  return sub_244A42E20(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_244A2E954(uint64_t a1)
{
  uint64_t v1;

  sub_244A43708(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(void **)(v1 + 64));
}

uint64_t sub_244A2E988(uint64_t a1)
{
  uint64_t v1;

  return sub_244A43D60(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244A2E990(uint64_t a1)
{
  uint64_t v1;

  return sub_244A44158(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244A2E998(uint64_t a1)
{
  uint64_t v1;

  return sub_244A442EC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244A2E9A0(uint64_t a1)
{
  uint64_t v1;

  return sub_244A43B74(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244A2E9A8(uint64_t a1)
{
  return sub_244A2E9C0(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_244A44720);
}

uint64_t sub_244A2E9B4(uint64_t a1)
{
  return sub_244A2E9C0(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_244A44764);
}

uint64_t sub_244A2E9C0(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(unsigned __int8 *)(v2 + 64));
}

void sub_244A2E9D8(uint64_t a1)
{
  uint64_t v1;

  sub_244A449AC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(double *)(v1 + 88), *(double *)(v1 + 96), *(double *)(v1 + 104), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40), *(_QWORD *)(v1 + 48), *(void **)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80));
}

uint64_t sub_244A2EA14(uint64_t a1)
{
  uint64_t v1;

  return sub_244A44E54(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244A2EA1C(uint64_t a1)
{
  uint64_t v1;

  return sub_244A44FE8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244A2EA24(uint64_t a1)
{
  uint64_t v1;

  return sub_244A451EC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_244A2EA2C(uint64_t a1)
{
  uint64_t v1;

  sub_244A455EC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t type metadata accessor for TC2Client()
{
  return objc_opt_self();
}

uint64_t method lookup function for TC2Client()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TC2Client.__allocating_init(userID:)(unint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t))(v1 + 88))(a1 | ((HIDWORD(a1) & 1) << 32));
}

unint64_t sub_244A2EA80()
{
  unint64_t result;

  result = qword_2573C34F0;
  if (!qword_2573C34F0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2TrustedRequestFactoryMetadata, &type metadata for TC2TrustedRequestFactoryMetadata);
    atomic_store(result, (unint64_t *)&qword_2573C34F0);
  }
  return result;
}

unint64_t sub_244A2EAC4()
{
  unint64_t result;

  result = qword_2573C3508;
  if (!qword_2573C3508)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2TrustedRequestEndpointMetadata, &type metadata for TC2TrustedRequestEndpointMetadata);
    atomic_store(result, (unint64_t *)&qword_2573C3508);
  }
  return result;
}

double sub_244A2EB08(_OWORD *a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)a1 + 105) = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_244A2EB24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_244A2EB6C()
{
  unint64_t result;

  result = qword_2573C3518;
  if (!qword_2573C3518)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RequestParameters, &type metadata for TC2RequestParameters);
    atomic_store(result, (unint64_t *)&qword_2573C3518);
  }
  return result;
}

uint64_t sub_244A2EBB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_244A2EBEC(uint64_t a1)
{
  uint64_t v1;

  return sub_244A429CC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_244A2EBF4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2573C3550;
  if (!qword_2573C3550)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573C3548);
    v2 = sub_244A14624(&qword_2573C3528, (uint64_t (*)(uint64_t))type metadata accessor for TrustedCloudComputeRateLimit, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeRateLimit);
    result = MEMORY[0x24951D378](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2573C3550);
  }
  return result;
}

unint64_t sub_244A2EC70()
{
  unint64_t result;

  result = qword_2573C3560;
  if (!qword_2573C3560)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2TrustedRequestFactoriesMetadata, &type metadata for TC2TrustedRequestFactoriesMetadata);
    atomic_store(result, (unint64_t *)&qword_2573C3560);
  }
  return result;
}

unint64_t sub_244A2ECB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB400);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB418);
    v7 = (_QWORD *)sub_244A56F9C();
    v8 = (uint64_t)v5 + *(int *)(v2 + 48);
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_244A2EE18(v9, (uint64_t)v5);
      v11 = *v5;
      result = sub_244A46C54(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v7[6] + 8 * result) = v11;
      v15 = v7[7];
      v16 = type metadata accessor for XPCWrapper.Continuation();
      result = sub_244A1AAC0(v8, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
      v17 = v7[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_10;
      v7[2] = v19;
      v9 += v10;
      if (!--v6)
        return (unint64_t)v7;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t sub_244A2EE18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t TrustedCloudComputeRateLimit.bundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeRateLimit.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TrustedCloudComputeRateLimit.bundleIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeRateLimit.featureIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeRateLimit.featureIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TrustedCloudComputeRateLimit.featureIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeRateLimit.workloadType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeRateLimit.workloadType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*TrustedCloudComputeRateLimit.workloadType.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeRateLimit.WorkloadParameter.key.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeRateLimit.WorkloadParameter.key.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TrustedCloudComputeRateLimit.WorkloadParameter.key.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeRateLimit.WorkloadParameter.value.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedCloudComputeRateLimit.WorkloadParameter.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TrustedCloudComputeRateLimit.WorkloadParameter.value.modify())()
{
  return nullsub_1;
}

PrivateCloudCompute::TrustedCloudComputeRateLimit::WorkloadParameter __swiftcall TrustedCloudComputeRateLimit.WorkloadParameter.init(key:value:)(Swift::String key, Swift::String value)
{
  Swift::String *v2;
  PrivateCloudCompute::TrustedCloudComputeRateLimit::WorkloadParameter result;

  *v2 = key;
  v2[1] = value;
  result.value = value;
  result.key = key;
  return result;
}

uint64_t TrustedCloudComputeRateLimit.WorkloadParameter.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244A56D5C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A2F128()
{
  sub_244A30398();
  return sub_244A571E8();
}

uint64_t sub_244A2F150()
{
  sub_244A30398();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeRateLimit.WorkloadParameter.encode(to:)(_QWORD *a1)
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3568);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v9[1] = *(_QWORD *)(v1 + 24);
  v9[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A30398();
  sub_244A571DC();
  v12 = 0;
  sub_244A570A4();
  if (!v2)
  {
    v11 = 1;
    sub_244A570A4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t TrustedCloudComputeRateLimit.WorkloadParameter.hashValue.getter()
{
  sub_244A57194();
  sub_244A56D5C();
  sub_244A56D5C();
  return sub_244A571C4();
}

uint64_t TrustedCloudComputeRateLimit.WorkloadParameter.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3578);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A30398();
  sub_244A571D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = 0;
  v9 = sub_244A57008();
  v11 = v10;
  v19 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_244A57008();
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

uint64_t sub_244A2F4B0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return TrustedCloudComputeRateLimit.WorkloadParameter.init(from:)(a1, a2);
}

uint64_t sub_244A2F4C4(_QWORD *a1)
{
  return TrustedCloudComputeRateLimit.WorkloadParameter.encode(to:)(a1);
}

uint64_t sub_244A2F4D8()
{
  sub_244A57194();
  sub_244A56D5C();
  sub_244A56D5C();
  return sub_244A571C4();
}

uint64_t sub_244A2F53C()
{
  sub_244A56D5C();
  return sub_244A56D5C();
}

uint64_t sub_244A2F578()
{
  sub_244A57194();
  sub_244A56D5C();
  sub_244A56D5C();
  return sub_244A571C4();
}

uint64_t TrustedCloudComputeRateLimit.workloadParameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TrustedCloudComputeRateLimit.workloadParameters.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*TrustedCloudComputeRateLimit.workloadParameters.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeRateLimit.count.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t TrustedCloudComputeRateLimit.count.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

uint64_t (*TrustedCloudComputeRateLimit.count.modify())()
{
  return nullsub_1;
}

double TrustedCloudComputeRateLimit.duration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void TrustedCloudComputeRateLimit.duration.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 64) = a1;
}

uint64_t (*TrustedCloudComputeRateLimit.duration.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeRateLimit.loggedCountSoFar.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t TrustedCloudComputeRateLimit.loggedCountSoFar.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = result;
  return result;
}

uint64_t (*TrustedCloudComputeRateLimit.loggedCountSoFar.modify())()
{
  return nullsub_1;
}

uint64_t TrustedCloudComputeRateLimit.ttlExpiration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TrustedCloudComputeRateLimit() + 44);
  v4 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TrustedCloudComputeRateLimit.ttlExpiration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TrustedCloudComputeRateLimit() + 44);
  v4 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*TrustedCloudComputeRateLimit.ttlExpiration.modify())()
{
  type metadata accessor for TrustedCloudComputeRateLimit();
  return nullsub_1;
}

uint64_t TrustedCloudComputeRateLimit.init(bundleIdentifier:featureIdentifier:workloadType:workloadParameters:count:duration:jitter:ttlExpiration:loggedCountSoFar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(double *)(a9 + 64) = a10;
  v13 = a9 + *(int *)(type metadata accessor for TrustedCloudComputeRateLimit() + 44);
  v14 = sub_244A56C78();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v13, a11, v14);
  *(_QWORD *)(a9 + 72) = a12;
  return result;
}

uint64_t TrustedCloudComputeRateLimit.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (v0[1])
  {
    sub_244A571AC();
    swift_bridgeObjectRetain();
    sub_244A56D5C();
    swift_bridgeObjectRelease();
    if (v0[3])
      goto LABEL_3;
LABEL_6:
    sub_244A571AC();
    if (v0[5])
      goto LABEL_4;
    goto LABEL_7;
  }
  sub_244A571AC();
  if (!v0[3])
    goto LABEL_6;
LABEL_3:
  sub_244A571AC();
  swift_bridgeObjectRetain();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  if (v0[5])
  {
LABEL_4:
    sub_244A571AC();
    swift_bridgeObjectRetain();
    sub_244A56D5C();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  sub_244A571AC();
LABEL_8:
  v1 = v0[6];
  sub_244A571A0();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    v3 = v1 + 56;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_244A56D5C();
      sub_244A56D5C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 += 32;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  sub_244A571A0();
  sub_244A571B8();
  sub_244A571A0();
  type metadata accessor for TrustedCloudComputeRateLimit();
  sub_244A56C78();
  sub_244A14624(&qword_2573C3580, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  return sub_244A56D14();
}

uint64_t sub_244A2F9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (uint64_t *)(a2 + 56);
    for (i = (uint64_t *)(a1 + 56); ; i += 4)
    {
      v5 = *(i - 1);
      v6 = *i;
      v7 = *(v3 - 1);
      v8 = *v3;
      v9 = *(i - 3) == *(v3 - 3) && *(i - 2) == *(v3 - 2);
      if (!v9 && (sub_244A5711C() & 1) == 0)
        break;
      v10 = v5 == v7 && v6 == v8;
      if (!v10 && (sub_244A5711C() & 1) == 0)
        break;
      v3 += 4;
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_244A2FA78(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A2FAB0 + 4 * byte_244A5B090[a1]))(0xD000000000000010, 0x8000000244A5F080);
}

uint64_t sub_244A2FAB0(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_244A2FB30()
{
  return 0x72697078456C7474;
}

uint64_t sub_244A2FB54()
{
  unsigned __int8 *v0;

  return sub_244A2FA78(*v0);
}

uint64_t sub_244A2FB5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A31084(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A2FB80()
{
  sub_244A3054C();
  return sub_244A571E8();
}

uint64_t sub_244A2FBA8()
{
  sub_244A3054C();
  return sub_244A571F4();
}

uint64_t TrustedCloudComputeRateLimit.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[8];
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3588);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A3054C();
  sub_244A571DC();
  LOBYTE(v11) = 0;
  sub_244A57074();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_244A57074();
    LOBYTE(v11) = 2;
    sub_244A57074();
    v11 = *(_QWORD *)(v3 + 48);
    v10[7] = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3598);
    sub_244A305D4(&qword_2573C35A0, (uint64_t (*)(void))sub_244A30590, MEMORY[0x24BEE12A0]);
    sub_244A570E0();
    LOBYTE(v11) = 4;
    sub_244A570D4();
    LOBYTE(v11) = 5;
    sub_244A570BC();
    LOBYTE(v11) = 6;
    sub_244A570D4();
    type metadata accessor for TrustedCloudComputeRateLimit();
    LOBYTE(v11) = 7;
    sub_244A56C78();
    sub_244A14624(&qword_2573C2820, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_244A570E0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t TrustedCloudComputeRateLimit.hashValue.getter()
{
  sub_244A57194();
  TrustedCloudComputeRateLimit.hash(into:)();
  return sub_244A571C4();
}

uint64_t TrustedCloudComputeRateLimit.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v23 = a2;
  v24 = sub_244A56C78();
  v3 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C35B0);
  v6 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TrustedCloudComputeRateLimit();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  v26 = a1;
  v27 = v11;
  *(_OWORD *)v11 = 0u;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A3054C();
  v12 = v28;
  sub_244A571D0();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v28 = v9;
    v13 = v24;
    v14 = v25;
    LOBYTE(v30) = 0;
    v15 = sub_244A56FD8();
    v16 = v27;
    *v27 = v15;
    v16[1] = v17;
    LOBYTE(v30) = 1;
    v16[2] = sub_244A56FD8();
    v16[3] = v18;
    LOBYTE(v30) = 2;
    v16[4] = sub_244A56FD8();
    v16[5] = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3598);
    v29 = 3;
    sub_244A305D4(&qword_2573C35B8, (uint64_t (*)(void))sub_244A3063C, MEMORY[0x24BEE12D0]);
    sub_244A57044();
    v16[6] = v30;
    LOBYTE(v30) = 4;
    v16[7] = sub_244A57038();
    LOBYTE(v30) = 5;
    sub_244A57020();
    v16[8] = v20;
    LOBYTE(v30) = 6;
    v16[9] = sub_244A57038();
    LOBYTE(v30) = 7;
    sub_244A14624(&qword_2573C2840, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_244A57044();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))((char *)v16 + *(int *)(v28 + 44), v5, v13);
    sub_244A30680((uint64_t)v16, v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    return sub_244A306C4((uint64_t)v16);
  }
}

uint64_t sub_244A30264@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TrustedCloudComputeRateLimit.init(from:)(a1, a2);
}

uint64_t sub_244A30278(_QWORD *a1)
{
  return TrustedCloudComputeRateLimit.encode(to:)(a1);
}

uint64_t sub_244A3028C()
{
  sub_244A57194();
  TrustedCloudComputeRateLimit.hash(into:)();
  return sub_244A571C4();
}

uint64_t sub_244A302CC()
{
  sub_244A57194();
  TrustedCloudComputeRateLimit.hash(into:)();
  return sub_244A571C4();
}

uint64_t _s19PrivateCloudCompute07TrustedbC9RateLimitV17WorkloadParameterV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_244A5711C(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
      return 1;
    else
      return sub_244A5711C();
  }
  return result;
}

unint64_t sub_244A30398()
{
  unint64_t result;

  result = qword_2573C3570;
  if (!qword_2573C3570)
  {
    result = MEMORY[0x24951D378](&unk_244A5B4A0, &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3570);
  }
  return result;
}

uint64_t type metadata accessor for TrustedCloudComputeRateLimit()
{
  uint64_t result;

  result = qword_2573C3630;
  if (!qword_2573C3630)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t _s19PrivateCloudCompute07TrustedbC9RateLimitV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = *(_QWORD *)a1 == *(_QWORD *)a2 && v4 == v5;
    if (!v6 && (sub_244A5711C() & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a2 + 24);
  if (v7)
  {
    if (!v8 || (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16) || v7 != v8) && (sub_244A5711C() & 1) == 0)
      return 0;
  }
  else if (v8)
  {
    return 0;
  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a2 + 40);
  if (v9)
  {
    if (!v10 || (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32) || v9 != v10) && (sub_244A5711C() & 1) == 0)
      return 0;
  }
  else if (v10)
  {
    return 0;
  }
  if ((sub_244A2F9B4(*(_QWORD *)(a1 + 48), *(_QWORD *)(a2 + 48)) & 1) != 0
    && *(_QWORD *)(a1 + 56) == *(_QWORD *)(a2 + 56)
    && *(double *)(a1 + 64) == *(double *)(a2 + 64)
    && *(_QWORD *)(a1 + 72) == *(_QWORD *)(a2 + 72))
  {
    type metadata accessor for TrustedCloudComputeRateLimit();
    return sub_244A56C60();
  }
  return 0;
}

unint64_t sub_244A3054C()
{
  unint64_t result;

  result = qword_2573C3590;
  if (!qword_2573C3590)
  {
    result = MEMORY[0x24951D378](&unk_244A5B450, &type metadata for TrustedCloudComputeRateLimit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3590);
  }
  return result;
}

unint64_t sub_244A30590()
{
  unint64_t result;

  result = qword_2573C35A8;
  if (!qword_2573C35A8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeRateLimit.WorkloadParameter, &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter);
    atomic_store(result, (unint64_t *)&qword_2573C35A8);
  }
  return result;
}

uint64_t sub_244A305D4(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573C3598);
    v8 = a2();
    result = MEMORY[0x24951D378](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244A3063C()
{
  unint64_t result;

  result = qword_2573C35C0;
  if (!qword_2573C35C0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeRateLimit.WorkloadParameter, &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter);
    atomic_store(result, (unint64_t *)&qword_2573C35C0);
  }
  return result;
}

uint64_t sub_244A30680(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TrustedCloudComputeRateLimit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244A306C4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TrustedCloudComputeRateLimit();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_244A30704()
{
  unint64_t result;

  result = qword_2573C35C8;
  if (!qword_2573C35C8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedCloudComputeRateLimit.WorkloadParameter, &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter);
    atomic_store(result, (unint64_t *)&qword_2573C35C8);
  }
  return result;
}

uint64_t sub_244A30748()
{
  return sub_244A14624(&qword_2573C35D0, (uint64_t (*)(uint64_t))type metadata accessor for TrustedCloudComputeRateLimit, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeRateLimit);
}

_QWORD *initializeBufferWithCopyOfBuffer for TrustedCloudComputeRateLimit(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
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
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    v8 = *(int *)(a3 + 44);
    v9 = (uint64_t)a2 + v8;
    v10 = a1 + v8;
    *(_QWORD *)(a1 + 72) = a2[9];
    v11 = sub_244A56C78();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for TrustedCloudComputeRateLimit(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 44);
  v5 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for TrustedCloudComputeRateLimit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v7 = *(int *)(a3 + 44);
  v8 = a2 + v7;
  v9 = a1 + v7;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v10 = sub_244A56C78();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

_QWORD *assignWithCopy for TrustedCloudComputeRateLimit(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  v6 = *(int *)(a3 + 44);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for TrustedCloudComputeRateLimit(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  v6 = *(int *)(a3 + 44);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

_QWORD *assignWithTake for TrustedCloudComputeRateLimit(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  v9 = *(int *)(a3 + 44);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedCloudComputeRateLimit()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A30B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_244A56C78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeRateLimit()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A30C20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 48) = (a2 - 1);
  }
  else
  {
    v7 = sub_244A56C78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 44), a2, a2, v7);
  }
  return result;
}

uint64_t sub_244A30C94()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244A56C78();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeRateLimit.WorkloadParameter()
{
  return &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter;
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeRateLimit.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A30D88 + 4 * byte_244A5B09D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_244A30DBC + 4 * byte_244A5B098[v4]))();
}

uint64_t sub_244A30DBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A30DC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A30DCCLL);
  return result;
}

uint64_t sub_244A30DD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A30DE0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_244A30DE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A30DEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeRateLimit.CodingKeys()
{
  return &type metadata for TrustedCloudComputeRateLimit.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for TrustedCloudComputeRateLimit.WorkloadParameter.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A30E54 + 4 * byte_244A5B0A7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244A30E88 + 4 * byte_244A5B0A2[v4]))();
}

uint64_t sub_244A30E88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A30E90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A30E98);
  return result;
}

uint64_t sub_244A30EA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A30EACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244A30EB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A30EB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeRateLimit.WorkloadParameter.CodingKeys()
{
  return &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter.CodingKeys;
}

unint64_t sub_244A30ED8()
{
  unint64_t result;

  result = qword_2573C3680;
  if (!qword_2573C3680)
  {
    result = MEMORY[0x24951D378](&unk_244A5B370, &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3680);
  }
  return result;
}

unint64_t sub_244A30F20()
{
  unint64_t result;

  result = qword_2573C3688;
  if (!qword_2573C3688)
  {
    result = MEMORY[0x24951D378](&unk_244A5B428, &type metadata for TrustedCloudComputeRateLimit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3688);
  }
  return result;
}

unint64_t sub_244A30F68()
{
  unint64_t result;

  result = qword_2573C3690;
  if (!qword_2573C3690)
  {
    result = MEMORY[0x24951D378](&unk_244A5B398, &type metadata for TrustedCloudComputeRateLimit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3690);
  }
  return result;
}

unint64_t sub_244A30FB0()
{
  unint64_t result;

  result = qword_2573C3698;
  if (!qword_2573C3698)
  {
    result = MEMORY[0x24951D378](&unk_244A5B3C0, &type metadata for TrustedCloudComputeRateLimit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3698);
  }
  return result;
}

unint64_t sub_244A30FF8()
{
  unint64_t result;

  result = qword_2573C36A0;
  if (!qword_2573C36A0)
  {
    result = MEMORY[0x24951D378]("y", &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C36A0);
  }
  return result;
}

unint64_t sub_244A31040()
{
  unint64_t result;

  result = qword_2573C36A8;
  if (!qword_2573C36A8)
  {
    result = MEMORY[0x24951D378](&unk_244A5B308, &type metadata for TrustedCloudComputeRateLimit.WorkloadParameter.CodingKeys);
    atomic_store(result, &qword_2573C36A8);
  }
  return result;
}

uint64_t sub_244A31084(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5F080 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000244A5F0A0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64616F6C6B726F77 && a2 == 0xEC00000065707954 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244A5F0C0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5F0E0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x72697078456C7474 && a2 == 0xED00006E6F697461)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v5 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t destroy for XPCRequestProxy()
{
  swift_unknownObjectRelease();
  return swift_release();
}

_QWORD *_s19PrivateCloudCompute15XPCRequestProxyVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for XPCRequestProxy(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
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

uint64_t assignWithTake for XPCRequestProxy(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCRequestProxy(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCRequestProxy(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCRequestProxy()
{
  return &type metadata for XPCRequestProxy;
}

uint64_t sub_244A3156C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2543FB1B0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244A56E40();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = a3;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  swift_unknownObjectRetain();
  swift_retain();
  if ((_DWORD)a1 == 1)
  {
    sub_244A31938((uint64_t)v8);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    sub_244A56E34();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_244A56DF8();
      v13 = v14;
      swift_unknownObjectRelease();
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
  if (v13 | v12)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v12;
    v16[3] = v13;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_244A31730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v8;

  *(_QWORD *)(v5 + 16) = a1;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v8;
  *v8 = v5;
  v8[1] = sub_244A31794;
  return sub_244A40664(a4, a5);
}

uint64_t sub_244A31794(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (v2)
    return (*(uint64_t (**)(void))(v7 + 8))();
  *(_QWORD *)(v6 + 32) = a2;
  *(_QWORD *)(v6 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_244A31814()
{
  uint64_t v0;

  *(int8x16_t *)*(_QWORD *)(v0 + 16) = vextq_s8(*(int8x16_t *)(v0 + 32), *(int8x16_t *)(v0 + 32), 8uLL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A31830()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244A31864(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_244A318F0;
  v6[2] = a1;
  v7 = (_QWORD *)swift_task_alloc();
  v6[3] = v7;
  *v7 = v6;
  v7[1] = sub_244A31794;
  return sub_244A40664(v4, v5);
}

uint64_t sub_244A318F0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244A31938(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2543FB1B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_244A31978()
{
  strcpy((char *)&qword_2573CF5B0, "PCCErrorDomain");
  algn_2573CF5B8[7] = -18;
}

PCCServerEnvironment __swiftcall PCCServerEnvironment.init()()
{
  return (PCCServerEnvironment)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id PCCServerEnvironment.init()()
{
  objc_super v1;

  v1.super_class = (Class)PCCServerEnvironment;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t PCCServerEnvironment.selectedEnvironmentName()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_2573C36C8 + dword_2573C36C8);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_244A31A8C;
  return v3();
}

uint64_t sub_244A31A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_244A31C0C(const void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = _Block_copy(a1);
  v4 = (uint64_t (__cdecl *)())((char *)&dword_2573C36C8 + dword_2573C36C8);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_244A31C6C;
  return v4();
}

uint64_t sub_244A31C6C()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    v5 = sub_244A56B94();

    v6 = 0;
    v7 = (void *)v5;
  }
  else
  {
    v6 = sub_244A56D2C();
    swift_bridgeObjectRelease();
    v5 = 0;
    v7 = (void *)v6;
  }
  v8 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 16);
  v8[2](v8, v6, v5);

  _Block_release(v8);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_244A31D34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_244A324B0;
  return v6();
}

uint64_t sub_244A31D88(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_244A324B0;
  return v7();
}

uint64_t sub_244A31DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_244A56E40();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_244A56E34();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_244A31938(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_244A56DF8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_244A31F20(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_244A31F84;
  return v6(a1);
}

uint64_t sub_244A31F84()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244A31FD0()
{
  return swift_task_switch();
}

uint64_t sub_244A31FE4()
{
  uint64_t v0;
  uint64_t inited;
  _QWORD *v2;

  type metadata accessor for TC2Client();
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 40) = inited;
  type metadata accessor for XPCWrapper();
  swift_allocObject();
  *(_QWORD *)(inited + 16) = sub_244A40F70(0x100000000);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *v2 = v0;
  v2[1] = sub_244A32080;
  return sub_244A2C8A4();
}

uint64_t sub_244A32080(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 56) = a1;
  *(_QWORD *)(v3 + 64) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A320DC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 56) & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0)
    v2 = HIBYTE(v1) & 0xF;
  if (v2)
  {
    swift_setDeallocating();
    sub_244A40194();
    swift_release();
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_2573C27B8 != -1)
      swift_once();
    v4 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    swift_bridgeObjectRetain();
    v5 = (void *)sub_244A56D2C();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, 2001, 0);

    swift_willThrow();
    swift_setDeallocating();
    sub_244A40194();
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

unint64_t type metadata accessor for PCCServerEnvironment()
{
  unint64_t result;

  result = qword_2573C36D0;
  if (!qword_2573C36D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2573C36D0);
  }
  return result;
}

uint64_t sub_244A3225C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_244A32288()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  _QWORD *v3;

  v2 = *(const void **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_244A324B0;
  return ((uint64_t (*)(const void *))((char *)&dword_2573C36D8 + dword_2573C36D8))(v2);
}

uint64_t sub_244A322F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_244A324B0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2573C36E8 + dword_2573C36E8))(v2, v3, v4);
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244A32398(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_244A318F0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2573C36F8 + dword_2573C36F8))(a1, v4, v5, v6);
}

uint64_t sub_244A3241C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244A32440(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_244A318F0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2573C3708 + dword_2573C3708))(a1, v4);
}

Swift::Int_optional __swiftcall Int.init(defaultsDomain:name:)(Swift::String defaultsDomain, Swift::String name)
{
  __CFString *v2;
  __CFString *v3;
  CFIndex AppIntegerValue;
  Swift::Bool v5;
  Swift::Int v6;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v8;
  Swift::Int_optional result;

  v8 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  v2 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v3 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  AppIntegerValue = CFPreferencesGetAppIntegerValue(v2, v3, &keyExistsAndHasValidFormat);

  v5 = keyExistsAndHasValidFormat == 0;
  if (keyExistsAndHasValidFormat)
    v6 = AppIntegerValue;
  else
    v6 = 0;
  result.value = v6;
  result.is_nil = v5;
  return result;
}

void sub_244A32574(uint64_t a1@<X8>)
{
  __CFString *v2;
  __CFString *v3;
  CFIndex AppIntegerValue;
  BOOL v5;
  CFIndex v6;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  v2 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v3 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  AppIntegerValue = CFPreferencesGetAppIntegerValue(v2, v3, &keyExistsAndHasValidFormat);

  v5 = keyExistsAndHasValidFormat == 0;
  if (keyExistsAndHasValidFormat)
    v6 = AppIntegerValue;
  else
    v6 = 0;
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v5;
}

uint64_t sub_244A3264C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _sSb19PrivateCloudComputeE14defaultsDomain4nameSbSgSS_SStcfC_0();
  *a1 = result;
  return result;
}

void __swiftcall Float.init(defaultsDomain:name:)(Swift::Float_optional *__return_ptr retstr, Swift::String defaultsDomain, Swift::String name)
{
  sub_244A32BBC();
}

unint64_t sub_244A32698@<X0>(uint64_t a1@<X8>)
{
  unint64_t result;

  result = sub_244A32BBC();
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = BYTE4(result) & 1;
  return result;
}

Swift::Double_optional __swiftcall Double.init(defaultsDomain:name:)(Swift::String defaultsDomain, Swift::String name)
{
  char v2;
  double v3;
  Swift::Double_optional result;

  v2 = sub_244A32C88();
  result.value = v3;
  result.is_nil = v2;
  return result;
}

uint64_t sub_244A326DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_244A32C88();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_244A3270C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _sSS19PrivateCloudComputeE14defaultsDomain4nameSSSgSS_SStcfC_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t Optional<A>.init(defaultsDomain:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_244A32754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v9 + 16);
  Optional<A>.init(defaultsDomain:name:)(v6, v11, v12, v13, v10, v14);
  v15 = *(_QWORD *)(v10 - 8);
  v16 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v10) != 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(a3, v8, v10);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a3, 0, 1, v10);
    v16 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a3, v16, 1, a2);
}

Swift::Void __swiftcall String.defaultsWrite(defaultsDomain:name:)(Swift::String defaultsDomain, Swift::String name)
{
  __CFString *v2;
  void *v3;
  __CFString *v4;

  v2 = (__CFString *)sub_244A56D2C();
  v3 = (void *)sub_244A56D2C();
  v4 = (__CFString *)sub_244A56D2C();
  CFPreferencesSetAppValue(v2, v3, v4);

}

void sub_244A328C8()
{
  __CFString *v0;
  void *v1;
  __CFString *v2;

  v0 = (__CFString *)sub_244A56D2C();
  v1 = (void *)sub_244A56D2C();
  v2 = (__CFString *)sub_244A56D2C();
  CFPreferencesSetAppValue(v0, v1, v2);

}

void Optional<A>.defaultsWrite(defaultsDomain:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  const void *v20;
  __CFString *v21;
  uint64_t v22;

  v6 = *(_QWORD *)(a5 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v10 + 16);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v16, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, a5);
    v17 = (__CFString *)sub_244A56D2C();
    v18 = (__CFString *)sub_244A56D2C();
    CFPreferencesSetAppValue(v17, 0, v18);

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v9, v11);
    v19 = (__CFString *)sub_244A56D2C();
    v20 = (const void *)sub_244A57110();
    v21 = (__CFString *)sub_244A56D2C();
    CFPreferencesSetAppValue(v19, v20, v21);

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t _sSb19PrivateCloudComputeE14defaultsDomain4nameSbSgSS_SStcfC_0()
{
  __CFString *v0;
  __CFString *v1;
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  v0 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v1 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v0, v1, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat)
    return AppBooleanValue != 0;
  else
    return 2;
}

unint64_t sub_244A32BBC()
{
  __CFString *v0;
  __CFString *v1;
  CFPropertyListRef v2;
  unsigned __int8 v3;
  uint64_t v4;
  unsigned int v6;

  v0 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v1 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v2 = CFPreferencesCopyAppValue(v0, v1);

  if (v2 && swift_dynamicCast())
  {
    v3 = 0;
    v4 = v6;
  }
  else
  {
    v4 = 0;
    v3 = 1;
  }
  return v4 | ((unint64_t)v3 << 32);
}

uint64_t sub_244A32C88()
{
  __CFString *v0;
  __CFString *v1;
  CFPropertyListRef v2;
  uint64_t v4;

  v0 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v1 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v2 = CFPreferencesCopyAppValue(v0, v1);

  if (v2 && swift_dynamicCast())
    return v4;
  else
    return 0;
}

uint64_t _sSS19PrivateCloudComputeE14defaultsDomain4nameSSSgSS_SStcfC_0()
{
  __CFString *v0;
  __CFString *v1;
  CFPropertyListRef v2;
  uint64_t v4;

  v0 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v1 = (__CFString *)sub_244A56D2C();
  swift_bridgeObjectRelease();
  v2 = CFPreferencesCopyAppValue(v0, v1);

  if (v2 && (swift_dynamicCast() & 1) != 0)
    return v4;
  else
    return 0;
}

uint64_t dispatch thunk of DefaultsReadable.init(defaultsDomain:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of DefaultsWritable.defaultsWrite(defaultsDomain:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t TrustedRequest.init(id:workloadType:workloadParameters:featureIdentifier:sessionIdentifier:bundleIdentifierOverride:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  int *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
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

  v37 = a8;
  v38 = a6;
  v35 = a7;
  v36 = a5;
  v33 = a3;
  v34 = a4;
  v39 = a1;
  v31 = a2;
  v32 = a10;
  v13 = sub_244A56C9C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  v17(a9, a1, v13);
  v17((uint64_t)v16, a7, v13);
  v18 = (int *)type metadata accessor for TrustedRequest();
  v30 = v18[6];
  v19 = (_QWORD *)(a9 + v18[7]);
  v20 = (_QWORD *)(a9 + v18[8]);
  *v20 = 0;
  v20[1] = 0;
  v21 = (_QWORD *)(a9 + v18[9]);
  v22 = a9 + v18[10];
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v23(v22, 1, 1, v13);
  v24 = (_QWORD *)(a9 + v18[5]);
  v25 = v33;
  *v24 = v31;
  v24[1] = v25;
  *(_QWORD *)(a9 + v30) = v34;
  v26 = v32;
  *v19 = v37;
  v19[1] = v26;
  v27 = v38;
  *v21 = v36;
  v21[1] = v27;
  sub_244A32FB0(v22);
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v22, v16, v13);
  v23(v22, 0, 1, v13);
  swift_bridgeObjectRelease();
  *v20 = 0;
  v20[1] = 0;
  v28 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v28(v35, v13);
  return ((uint64_t (*)(uint64_t, uint64_t))v28)(v39, v13);
}

uint64_t sub_244A32FB0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244A32FF4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A33030 + 4 * byte_244A5B600[a1]))(0xD000000000000018, 0x8000000244A5F150);
}

uint64_t sub_244A33030()
{
  return 0x64696C6176;
}

uint64_t sub_244A33044()
{
  return 0x64696C61766E69;
}

uint64_t sub_244A3305C()
{
  uint64_t v0;

  return v0 + 1;
}

unint64_t sub_244A330A8()
{
  return 0xD000000000000012;
}

uint64_t sub_244A330C4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x797269707865;
  else
    return 0x654B63696C627570;
}

uint64_t sub_244A330FC()
{
  unsigned __int8 *v0;

  return sub_244A32FF4(*v0);
}

uint64_t sub_244A33104@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A38508(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A33128()
{
  sub_244A360F4();
  return sub_244A571E8();
}

uint64_t sub_244A33150()
{
  sub_244A360F4();
  return sub_244A571F4();
}

uint64_t sub_244A33178()
{
  sub_244A361C0();
  return sub_244A571E8();
}

uint64_t sub_244A331A0()
{
  sub_244A361C0();
  return sub_244A571F4();
}

uint64_t sub_244A331CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A387C4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A331F4()
{
  sub_244A3628C();
  return sub_244A571E8();
}

uint64_t sub_244A3321C()
{
  sub_244A3628C();
  return sub_244A571F4();
}

uint64_t sub_244A33244()
{
  sub_244A36138();
  return sub_244A571E8();
}

uint64_t sub_244A3326C()
{
  sub_244A36138();
  return sub_244A571F4();
}

uint64_t sub_244A33294()
{
  sub_244A36248();
  return sub_244A571E8();
}

uint64_t sub_244A332BC()
{
  sub_244A36248();
  return sub_244A571F4();
}

uint64_t sub_244A332E4()
{
  char *v0;

  return sub_244A330C4(*v0);
}

uint64_t sub_244A332EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A38854(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A33310()
{
  sub_244A362D0();
  return sub_244A571E8();
}

uint64_t sub_244A33338()
{
  sub_244A362D0();
  return sub_244A571F4();
}

uint64_t sub_244A33360()
{
  sub_244A3617C();
  return sub_244A571E8();
}

uint64_t sub_244A33388()
{
  sub_244A3617C();
  return sub_244A571F4();
}

uint64_t sub_244A333B0()
{
  sub_244A36204();
  return sub_244A571E8();
}

uint64_t sub_244A333D8()
{
  sub_244A36204();
  return sub_244A571F4();
}

void Prefetch.Response.Node.ValidationResult.encode(to:)(_QWORD *a1)
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
  char *v13;
  char *v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3720);
  v32 = *(_QWORD *)(v2 - 8);
  v33 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v31 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3728);
  v29 = *(_QWORD *)(v4 - 8);
  v30 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v27 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3730);
  v22 = *(_QWORD *)(v6 - 8);
  v23 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v21 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3738);
  v19 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v18 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3740);
  v15[2] = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3748);
  v15[1] = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3750);
  v26 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v24 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_244A56C78();
  v25 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v35 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3758);
  v36 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A360F4();
  sub_244A571DC();
  sub_244A1581C(v37, (uint64_t)v13, type metadata accessor for Prefetch.Response.Node.ValidationResult);
  v14 = (char *)sub_244A3373C + 4 * byte_244A5B607[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_244A3373C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = *v1;
  v4 = v1[1];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798);
  v6 = *(_QWORD *)(v2 - 224);
  (*(void (**)(_QWORD, char *, _QWORD))(v6 + 32))(*(_QWORD *)(v2 - 144), (char *)v1 + *(int *)(v5 + 48), *(_QWORD *)(v2 - 152));
  *(_BYTE *)(v2 - 104) = 0;
  sub_244A362D0();
  v7 = *(_QWORD *)(v2 - 232);
  v8 = *(_QWORD *)(v2 - 112);
  sub_244A57068();
  *(_QWORD *)(v2 - 104) = v3;
  *(_QWORD *)(v2 - 96) = v4;
  *(_BYTE *)(v2 - 65) = 0;
  sub_244A36314();
  v9 = *(_QWORD *)(v2 - 200);
  v10 = *(_QWORD *)(v2 - 128);
  sub_244A570E0();
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 216) + 8))(v7, v9);
    (*(void (**)(_QWORD, _QWORD))(v6 + 8))(*(_QWORD *)(v2 - 144), *(_QWORD *)(v2 - 152));
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 136) + 8))(v0, v8);
    return sub_244A26E1C(v3, v4);
  }
  else
  {
    *(_BYTE *)(v2 - 104) = 1;
    sub_244A14624(&qword_2573C2820, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    v12 = *(_QWORD *)(v2 - 152);
    sub_244A570E0();
    sub_244A26E1C(v3, v4);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 216) + 8))(v7, v9);
    (*(void (**)(_QWORD, uint64_t))(v6 + 8))(*(_QWORD *)(v2 - 144), v12);
    return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 136) + 8))(v0, *(_QWORD *)(v2 - 112));
  }
}

uint64_t Prefetch.Response.Node.ValidationResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v32[4];
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
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  _QWORD *v55;
  uint64_t v56;

  v51 = a2;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37B0);
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v54 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37B8);
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v50 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37C0);
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37C8);
  v35 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v48 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37D0);
  v32[3] = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v46 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37D8);
  v44 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v47 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37E0);
  v45 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v52 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37E8);
  v53 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v32 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v32 - v21;
  v23 = a1[3];
  v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_244A360F4();
  v24 = v56;
  sub_244A571D0();
  if (!v24)
  {
    v32[0] = v17;
    v32[1] = v20;
    v56 = v14;
    v32[2] = v22;
    v25 = v53;
    v26 = sub_244A5705C();
    if (*(_QWORD *)(v26 + 16) == 1)
      __asm { BR              X10 }
    v27 = sub_244A56F3C();
    swift_allocError();
    v28 = v11;
    v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C0);
    *v30 = v56;
    sub_244A56FCC();
    sub_244A56F30();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v30, *MEMORY[0x24BEE26D0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v28);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
}

void sub_244A34260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 - 65) = 6;
  sub_244A36138();
  sub_244A56FC0();
  if (!v3)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 224) + 8))(v1, *(_QWORD *)(v5 - 208));
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v4, v0);
    JUMPOUT(0x244A34338);
  }
  JUMPOUT(0x244A34220);
}

uint64_t sub_244A34480@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Prefetch.Response.Node.ValidationResult.init(from:)(a1, a2);
}

void sub_244A34494(_QWORD *a1)
{
  Prefetch.Response.Node.ValidationResult.encode(to:)(a1);
}

uint64_t Prefetch.Response.Node.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Prefetch.Response.Node.identifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Prefetch.Response.Node.identifier.modify())()
{
  return nullsub_1;
}

uint64_t Prefetch.Response.Node.cloudOSVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Prefetch.Response.Node.cloudOSVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*Prefetch.Response.Node.cloudOSVersion.modify())()
{
  return nullsub_1;
}

uint64_t Prefetch.Response.Node.cloudOSReleaseType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Prefetch.Response.Node.cloudOSReleaseType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*Prefetch.Response.Node.cloudOSReleaseType.modify())()
{
  return nullsub_1;
}

uint64_t Prefetch.Response.Node.validationResult.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Prefetch.Response.Node(0);
  return sub_244A1581C(v1 + *(int *)(v3 + 28), a1, type metadata accessor for Prefetch.Response.Node.ValidationResult);
}

uint64_t Prefetch.Response.Node.validationResult.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for Prefetch.Response.Node(0) + 28);
  return sub_244A363F4(a1, v3);
}

uint64_t (*Prefetch.Response.Node.validationResult.modify())()
{
  type metadata accessor for Prefetch.Response.Node(0);
  return nullsub_1;
}

uint64_t Prefetch.Response.Node.savedToCache.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Prefetch.Response.Node(0) + 32));
}

uint64_t Prefetch.Response.Node.savedToCache.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Prefetch.Response.Node(0);
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*Prefetch.Response.Node.savedToCache.modify())()
{
  type metadata accessor for Prefetch.Response.Node(0);
  return nullsub_1;
}

uint64_t Prefetch.Response.Node.uniqueNodeIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Prefetch.Response.Node(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Prefetch.Response.Node.uniqueNodeIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for Prefetch.Response.Node(0) + 36));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Prefetch.Response.Node.uniqueNodeIdentifier.modify())()
{
  type metadata accessor for Prefetch.Response.Node(0);
  return nullsub_1;
}

uint64_t Prefetch.Response.Node.init(identifier:cloudOSVersion:cloudOSReleaseType:validationResult:savedToCache:uniqueNodeIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  int *v14;
  uint64_t result;
  _QWORD *v16;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  v14 = (int *)type metadata accessor for Prefetch.Response.Node(0);
  result = sub_244A36358(a7, (uint64_t)a9 + v14[7]);
  *((_BYTE *)a9 + v14[8]) = a8;
  v16 = (_QWORD *)((char *)a9 + v14[9]);
  *v16 = a10;
  v16[1] = a11;
  return result;
}

uint64_t sub_244A34824(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A34860 + 4 * byte_244A5B61C[a1]))(0xD000000000000012, 0x8000000244A5F1D0);
}

uint64_t sub_244A34860()
{
  return 0x696669746E656469;
}

uint64_t sub_244A3487C()
{
  return 0x56534F64756F6C63;
}

unint64_t sub_244A348A0()
{
  return 0xD000000000000010;
}

uint64_t sub_244A348BC()
{
  return 0x436F546465766173;
}

uint64_t sub_244A348DC()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_244A348F4()
{
  unsigned __int8 *v0;

  return sub_244A34824(*v0);
}

uint64_t sub_244A348FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A3893C(a1, a2);
  *a3 = result;
  return result;
}

void sub_244A34920(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_244A3492C()
{
  sub_244A36554();
  return sub_244A571E8();
}

uint64_t sub_244A34954()
{
  sub_244A36554();
  return sub_244A571F4();
}

uint64_t Prefetch.Response.Node.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C37F8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A36554();
  sub_244A571DC();
  v8[15] = 0;
  sub_244A570A4();
  if (!v1)
  {
    v8[14] = 1;
    sub_244A570A4();
    v8[13] = 2;
    sub_244A570A4();
    type metadata accessor for Prefetch.Response.Node(0);
    v8[12] = 3;
    type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
    sub_244A14624(&qword_2573C3808, type metadata accessor for Prefetch.Response.Node.ValidationResult, (uint64_t)&protocol conformance descriptor for Prefetch.Response.Node.ValidationResult);
    sub_244A570E0();
    v8[11] = 4;
    sub_244A570B0();
    v8[10] = 5;
    sub_244A570A4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t Prefetch.Response.Node.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  char *v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;

  v28 = a2;
  v3 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3810);
  v6 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for Prefetch.Response.Node(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = a1[3];
  v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_244A36554();
  v30 = v8;
  v13 = v32;
  sub_244A571D0();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  v32 = v5;
  v14 = v6;
  v38 = 0;
  v15 = v29;
  *v11 = sub_244A57008();
  v11[1] = v16;
  v37 = 1;
  v11[2] = sub_244A57008();
  v11[3] = v17;
  v36 = 2;
  v11[4] = sub_244A57008();
  v11[5] = v18;
  v35 = 3;
  sub_244A14624(&qword_2573C3818, type metadata accessor for Prefetch.Response.Node.ValidationResult, (uint64_t)&protocol conformance descriptor for Prefetch.Response.Node.ValidationResult);
  v19 = (uint64_t)v32;
  sub_244A57044();
  sub_244A36358(v19, (uint64_t)v11 + v9[7]);
  v34 = 4;
  v20 = v30;
  *((_BYTE *)v11 + v9[8]) = sub_244A57014() & 1;
  v33 = 5;
  v21 = sub_244A57008();
  v32 = v22;
  v24 = v21;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v15);
  v25 = (uint64_t *)((char *)v11 + v9[9]);
  v26 = v32;
  *v25 = v24;
  v25[1] = (uint64_t)v26;
  sub_244A1581C((uint64_t)v11, v28, type metadata accessor for Prefetch.Response.Node);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return sub_244A15860((uint64_t)v11, type metadata accessor for Prefetch.Response.Node);
}

uint64_t sub_244A34F28@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Prefetch.Response.Node.init(from:)(a1, a2);
}

uint64_t sub_244A34F3C(_QWORD *a1)
{
  return Prefetch.Response.Node.encode(to:)(a1);
}

uint64_t Prefetch.Response.nodes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Prefetch.Response.nodes.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*Prefetch.Response.nodes.modify())()
{
  return nullsub_1;
}

uint64_t Prefetch.Response.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Prefetch.Response(0) + 20);
  v4 = sub_244A56C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t Prefetch.Response.id.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Prefetch.Response(0) + 20);
  v4 = sub_244A56C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*Prefetch.Response.id.modify())()
{
  type metadata accessor for Prefetch.Response(0);
  return nullsub_1;
}

uint64_t Prefetch.Response.init(id:nodes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  char *v6;
  uint64_t v7;
  uint64_t result;

  v6 = (char *)a3 + *(int *)(type metadata accessor for Prefetch.Response(0) + 20);
  v7 = sub_244A56C9C();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a1, v7);
  *a3 = a2;
  return result;
}

uint64_t sub_244A350AC(char a1)
{
  if ((a1 & 1) != 0)
    return 25705;
  else
    return 0x7365646F6ELL;
}

uint64_t sub_244A350D4()
{
  char *v0;

  return sub_244A350AC(*v0);
}

uint64_t sub_244A350DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A38BB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A35100()
{
  sub_244A365AC();
  return sub_244A571E8();
}

uint64_t sub_244A35128()
{
  sub_244A365AC();
  return sub_244A571F4();
}

uint64_t Prefetch.Response.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[8];
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3820);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A365AC();
  sub_244A571DC();
  v11 = *v3;
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3830);
  sub_244A365F0(&qword_2573C3838, &qword_2573C3840, (uint64_t)&protocol conformance descriptor for Prefetch.Response.Node, MEMORY[0x24BEE12A0]);
  sub_244A570E0();
  if (!v2)
  {
    type metadata accessor for Prefetch.Response(0);
    v10[6] = 1;
    sub_244A56C9C();
    sub_244A14624(&qword_2573C3848, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_244A570E0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t Prefetch.Response.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  char v24;
  char v25;
  uint64_t v26;

  v19 = a2;
  v20 = sub_244A56C9C();
  v18 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3850);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Prefetch.Response(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A365AC();
  v21 = v7;
  v11 = (uint64_t)v23;
  sub_244A571D0();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v23 = a1;
  v12 = v10;
  v13 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3830);
  v25 = 0;
  sub_244A365F0(&qword_2573C3858, &qword_2573C3860, (uint64_t)&protocol conformance descriptor for Prefetch.Response.Node, MEMORY[0x24BEE12D0]);
  v14 = v22;
  v15 = v21;
  sub_244A57044();
  *(_QWORD *)v12 = v26;
  v24 = 1;
  sub_244A14624(&qword_2573C3868, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  sub_244A57044();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v14);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v12[*(int *)(v8 + 20)], v4, v13);
  sub_244A1581C((uint64_t)v12, v19, type metadata accessor for Prefetch.Response);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return sub_244A15860((uint64_t)v12, type metadata accessor for Prefetch.Response);
}

uint64_t sub_244A35584@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Prefetch.Response.init(from:)(a1, a2);
}

uint64_t sub_244A35598(_QWORD *a1)
{
  return Prefetch.Response.encode(to:)(a1);
}

uint64_t Prefetch.workloadType.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Prefetch.workloadType.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Prefetch.workloadType.modify())()
{
  return nullsub_1;
}

uint64_t Prefetch.workloadParameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Prefetch.workloadParameters.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*Prefetch.workloadParameters.modify())()
{
  return nullsub_1;
}

uint64_t Prefetch.init(workloadType:workloadParameters:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void sub_244A35668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_244A356C8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x244A358ACLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_244A358D0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_244A3592C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_244A35668((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_244A26E1C(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_244A35AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_244A56B70();
  v11 = result;
  if (result)
  {
    result = sub_244A56B88();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_244A56B7C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_244A35668(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_244A35BA8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_244A35BEC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_244A35C20 + *((int *)qword_244A35CE0 + (v0 >> 62))))();
}

uint64_t sub_244A35C30@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_244A26DC4(v2, v1);
      sub_244A358D0(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

void _s19PrivateCloudCompute8PrefetchV8ResponseV4NodeV16ValidationResultO2eeoiySbAI_AItFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  _QWORD v14[2];

  v4 = sub_244A56C78();
  v5 = *(_QWORD *)(v4 - 8);
  v14[0] = v4;
  v14[1] = v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v6);
  v7 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3B10);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v14 + *(int *)(v10 + 48) - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244A1581C(a1, (uint64_t)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for Prefetch.Response.Node.ValidationResult);
  sub_244A1581C(a2, (uint64_t)v12, type metadata accessor for Prefetch.Response.Node.ValidationResult);
  v13 = (char *)sub_244A35E50 + 4 * byte_244A5B622[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_244A35E50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(uint64_t, char *, uint64_t);
  char *v16;
  unint64_t v17;
  char v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v21)(uint64_t, uint64_t);

  sub_244A1581C(v0, (uint64_t)v4, type metadata accessor for Prefetch.Response.Node.ValidationResult);
  v7 = *v4;
  v6 = v4[1];
  v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
  v9 = (char *)v4 + v8;
  if (swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(char *, _QWORD))(*(_QWORD *)(v5 - 88) + 8))(v9, *(_QWORD *)(v5 - 96));
    sub_244A26E1C(v7, v6);
    sub_244A38C80(v0);
  }
  else
  {
    v12 = *v3;
    v11 = v3[1];
    v13 = (char *)v3 + v8;
    v14 = *(_QWORD *)(v5 - 96);
    v15 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v5 - 88) + 32);
    v16 = v9;
    v17 = v11;
    v15(v1, v16, v14);
    v15(v2, v13, v14);
    sub_244A35BA8(v7, v6);
    if ((v18 & 1) != 0)
    {
      v10 = sub_244A56C60();
      sub_244A26E1C(v12, v17);
      sub_244A26E1C(v7, v6);
      v19 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 88) + 8);
      v19(v2, v14);
      v19(v1, v14);
      sub_244A15860(v0, type metadata accessor for Prefetch.Response.Node.ValidationResult);
      return v10 & 1;
    }
    sub_244A26E1C(v12, v17);
    sub_244A26E1C(v7, v6);
    v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 88) + 8);
    v21(v2, v14);
    v21(v1, v14);
    sub_244A15860(v0, type metadata accessor for Prefetch.Response.Node.ValidationResult);
  }
  v10 = 0;
  return v10 & 1;
}

uint64_t type metadata accessor for Prefetch.Response.Node.ValidationResult(uint64_t a1)
{
  return sub_244A1A938(a1, qword_2573C3A10);
}

unint64_t sub_244A360F4()
{
  unint64_t result;

  result = qword_2573C3760;
  if (!qword_2573C3760)
  {
    result = MEMORY[0x24951D378](&unk_244A5C168, &type metadata for Prefetch.Response.Node.ValidationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3760);
  }
  return result;
}

unint64_t sub_244A36138()
{
  unint64_t result;

  result = qword_2573C3768;
  if (!qword_2573C3768)
  {
    result = MEMORY[0x24951D378](&unk_244A5C118, &type metadata for Prefetch.Response.Node.ValidationResult.NoUniqueIdentifierCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3768);
  }
  return result;
}

unint64_t sub_244A3617C()
{
  unint64_t result;

  result = qword_2573C3770;
  if (!qword_2573C3770)
  {
    result = MEMORY[0x24951D378](&unk_244A5C0C8, &type metadata for Prefetch.Response.Node.ValidationResult.ValidatedExpiryTooLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3770);
  }
  return result;
}

unint64_t sub_244A361C0()
{
  unint64_t result;

  result = qword_2573C3778;
  if (!qword_2573C3778)
  {
    result = MEMORY[0x24951D378](&unk_244A5C078, &type metadata for Prefetch.Response.Node.ValidationResult.ExpiryTooLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3778);
  }
  return result;
}

unint64_t sub_244A36204()
{
  unint64_t result;

  result = qword_2573C3780;
  if (!qword_2573C3780)
  {
    result = MEMORY[0x24951D378](&unk_244A5C028, &type metadata for Prefetch.Response.Node.ValidationResult.ValidationNotNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3780);
  }
  return result;
}

unint64_t sub_244A36248()
{
  unint64_t result;

  result = qword_2573C3788;
  if (!qword_2573C3788)
  {
    result = MEMORY[0x24951D378](&unk_244A5BFD8, &type metadata for Prefetch.Response.Node.ValidationResult.NodeAlreadyExistsInBatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3788);
  }
  return result;
}

unint64_t sub_244A3628C()
{
  unint64_t result;

  result = qword_2573C3790;
  if (!qword_2573C3790)
  {
    result = MEMORY[0x24951D378](&unk_244A5BF88, &type metadata for Prefetch.Response.Node.ValidationResult.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3790);
  }
  return result;
}

unint64_t sub_244A362D0()
{
  unint64_t result;

  result = qword_2573C37A0;
  if (!qword_2573C37A0)
  {
    result = MEMORY[0x24951D378](&unk_244A5BF38, &type metadata for Prefetch.Response.Node.ValidationResult.ValidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C37A0);
  }
  return result;
}

unint64_t sub_244A36314()
{
  unint64_t result;

  result = qword_2573C37A8;
  if (!qword_2573C37A8)
  {
    result = MEMORY[0x24951D378](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2573C37A8);
  }
  return result;
}

uint64_t sub_244A36358(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_244A3639C()
{
  unint64_t result;

  result = qword_2573C37F0;
  if (!qword_2573C37F0)
  {
    result = MEMORY[0x24951D378](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2573C37F0);
  }
  return result;
}

uint64_t type metadata accessor for Prefetch.Response.Node(uint64_t a1)
{
  return sub_244A1A938(a1, qword_2573C3958);
}

uint64_t sub_244A363F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t _s19PrivateCloudCompute8PrefetchV8ResponseV4NodeV2eeoiySbAG_AGtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  BOOL v7;
  char v8;
  char v9;
  int *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_244A5711C(), result = 0, (v5 & 1) != 0))
  {
    v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_244A5711C(), result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_244A5711C(), result = 0, (v9 & 1) != 0))
      {
        v10 = (int *)type metadata accessor for Prefetch.Response.Node(0);
        _s19PrivateCloudCompute8PrefetchV8ResponseV4NodeV16ValidationResultO2eeoiySbAI_AItFZ_0((uint64_t)a1 + v10[7], (uint64_t)a2 + v10[7]);
        if ((v11 & 1) != 0 && *((unsigned __int8 *)a1 + v10[8]) == *((unsigned __int8 *)a2 + v10[8]))
        {
          v12 = v10[9];
          v13 = *(_QWORD *)((char *)a1 + v12);
          v14 = *(_QWORD *)((char *)a1 + v12 + 8);
          v15 = (_QWORD *)((char *)a2 + v12);
          if (v13 == *v15 && v14 == v15[1])
            return 1;
          else
            return sub_244A5711C();
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

unint64_t sub_244A36554()
{
  unint64_t result;

  result = qword_2573C3800;
  if (!qword_2573C3800)
  {
    result = MEMORY[0x24951D378](&unk_244A5BEE8, &type metadata for Prefetch.Response.Node.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3800);
  }
  return result;
}

uint64_t type metadata accessor for Prefetch.Response(uint64_t a1)
{
  return sub_244A1A938(a1, qword_2573C38C8);
}

unint64_t sub_244A365AC()
{
  unint64_t result;

  result = qword_2573C3828;
  if (!qword_2573C3828)
  {
    result = MEMORY[0x24951D378](&unk_244A5BE98, &type metadata for Prefetch.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3828);
  }
  return result;
}

uint64_t sub_244A365F0(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573C3830);
    v10 = sub_244A14624(a2, type metadata accessor for Prefetch.Response.Node, a3);
    result = MEMORY[0x24951D378](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for Prefetch()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s19PrivateCloudCompute8PrefetchVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Prefetch(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Prefetch(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Prefetch()
{
  return &type metadata for Prefetch;
}

uint64_t *initializeBufferWithCopyOfBuffer for Prefetch.Response(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v9 = sub_244A56C9C();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for Prefetch.Response(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_244A56C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for Prefetch.Response(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v7 = sub_244A56C9C();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for Prefetch.Response(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v9 = sub_244A56C9C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *initializeWithTake for Prefetch.Response(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_244A56C9C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for Prefetch.Response(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v9 = sub_244A56C9C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Prefetch.Response()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A36A2C(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_244A56C9C();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Prefetch.Response()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_244A36AB4(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_244A56C9C();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_244A36B28()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244A56C9C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for Prefetch.Response.Node(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  int EnumCaseMultiPayload;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
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
    v10 = a3[7];
    v11 = (_QWORD *)((char *)a1 + v10);
    v12 = (_QWORD *)((char *)a2 + v10);
    a1[4] = a2[4];
    a1[5] = v9;
    v13 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v22 = v12[1];
      *v11 = *v12;
      v11[1] = v22;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v15 = *v12;
      v16 = v12[1];
      sub_244A26DC4(*v12, v16);
      *v11 = v15;
      v11[1] = v16;
      v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
      v18 = (char *)v11 + v17;
      v19 = (char *)v12 + v17;
      v20 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      swift_storeEnumTagMultiPayload();
    }
    v23 = a3[9];
    *((_BYTE *)v4 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    v24 = (_QWORD *)((char *)v4 + v23);
    v25 = (_QWORD *)((char *)a2 + v23);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for Prefetch.Response.Node(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!EnumCaseMultiPayload)
  {
    sub_244A26E1C(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
    v6 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
    v7 = sub_244A56C78();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for Prefetch.Response.Node(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int EnumCaseMultiPayload;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  v9 = a3[7];
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  a1[4] = a2[4];
  a1[5] = v8;
  v12 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v20 = v11[1];
    *v10 = *v11;
    v10[1] = v20;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v14 = *v11;
    v15 = v11[1];
    sub_244A26DC4(*v11, v15);
    *v10 = v14;
    v10[1] = v15;
    v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
    v17 = (char *)v10 + v16;
    v18 = (char *)v11 + v16;
    v19 = sub_244A56C78();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    swift_storeEnumTagMultiPayload();
  }
  v21 = a3[9];
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Prefetch.Response.Node(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  int EnumCaseMultiPayload;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;

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
  if (a1 != a2)
  {
    v6 = a3[7];
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    sub_244A15860((uint64_t)a1 + v6, type metadata accessor for Prefetch.Response.Node.ValidationResult);
    v9 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *v7 = *v8;
      v7[1] = v8[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v11 = *v8;
      v12 = v8[1];
      sub_244A26DC4(*v8, v12);
      *v7 = v11;
      v7[1] = v12;
      v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
      v14 = (char *)v7 + v13;
      v15 = (char *)v8 + v13;
      v16 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
      swift_storeEnumTagMultiPayload();
    }
  }
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  v17 = a3[9];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for Prefetch.Response.Node(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = a3[7];
  v8 = (_OWORD *)((char *)a1 + v7);
  v9 = (_OWORD *)((char *)a2 + v7);
  v10 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    *v8 = *v9;
    v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
    v12 = (char *)v8 + v11;
    v13 = (char *)v9 + v11;
    v14 = sub_244A56C78();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
    swift_storeEnumTagMultiPayload();
  }
  v15 = a3[9];
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v15) = *(_OWORD *)((char *)a2 + v15);
  return a1;
}

_QWORD *assignWithTake for Prefetch.Response.Node(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

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
  if (a1 != a2)
  {
    v9 = a3[7];
    v10 = (_OWORD *)((char *)a1 + v9);
    v11 = (_OWORD *)((char *)a2 + v9);
    sub_244A15860((uint64_t)a1 + v9, type metadata accessor for Prefetch.Response.Node.ValidationResult);
    v12 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      *v10 = *v11;
      v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
      v14 = (char *)v10 + v13;
      v15 = (char *)v11 + v13;
      v16 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
      swift_storeEnumTagMultiPayload();
    }
  }
  v17 = a3[9];
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Prefetch.Response.Node()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A37334(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Prefetch.Response.Node()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A373BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for Prefetch.Response.Node.ValidationResult(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_244A37430()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Prefetch.Response.Node.ValidationResult(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Prefetch.Response.Node.ValidationResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = *a2;
      v9 = a2[1];
      sub_244A26DC4(*a2, v9);
      *a1 = v8;
      a1[1] = v9;
      v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
      v11 = (char *)a1 + v10;
      v12 = (char *)a2 + v10;
      v13 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for Prefetch.Response.Node.ValidationResult(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    sub_244A26E1C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
    v4 = sub_244A56C78();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  return result;
}

_QWORD *initializeWithCopy for Prefetch.Response.Node.ValidationResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_244A26DC4(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_244A56C78();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *assignWithCopy for Prefetch.Response.Node.ValidationResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_244A15860((uint64_t)a1, type metadata accessor for Prefetch.Response.Node.ValidationResult);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = *a2;
      v8 = a2[1];
      sub_244A26DC4(*a2, v8);
      *a1 = v7;
      a1[1] = v8;
      v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_OWORD *initializeWithTake for Prefetch.Response.Node.ValidationResult(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_244A56C78();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for Prefetch.Response.Node.ValidationResult(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_244A15860((uint64_t)a1, type metadata accessor for Prefetch.Response.Node.ValidationResult);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573C3798) + 48);
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = sub_244A56C78();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_244A3798C()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  result = sub_244A56C78();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[4] = v2;
    v2[5] = &unk_244A5B7F0;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Prefetch.Response.CodingKeys()
{
  return &type metadata for Prefetch.Response.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Prefetch.Response.Node.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Prefetch.Response.Node.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A37AFC + 4 * byte_244A5B62E[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_244A37B30 + 4 * byte_244A5B629[v4]))();
}

uint64_t sub_244A37B30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A37B38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A37B40);
  return result;
}

uint64_t sub_244A37B4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A37B54);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_244A37B58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A37B60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.CodingKeys()
{
  return &type metadata for Prefetch.Response.Node.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for Prefetch.Response.Node.ValidationResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A37BC8 + 4 * byte_244A5B638[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_244A37BFC + 4 * byte_244A5B633[v4]))();
}

uint64_t sub_244A37BFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A37C04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A37C0CLL);
  return result;
}

uint64_t sub_244A37C18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A37C20);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_244A37C24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A37C2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.ValidationResult.CodingKeys()
{
  return &type metadata for Prefetch.Response.Node.ValidationResult.CodingKeys;
}

uint64_t _s19PrivateCloudCompute8PrefetchV8ResponseV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A37C94 + 4 * byte_244A5B642[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244A37CC8 + 4 * byte_244A5B63D[v4]))();
}

uint64_t sub_244A37CC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A37CD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A37CD8);
  return result;
}

uint64_t sub_244A37CE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A37CECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244A37CF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A37CF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.ValidationResult.ValidCodingKeys()
{
  return &type metadata for Prefetch.Response.Node.ValidationResult.ValidCodingKeys;
}

uint64_t storeEnumTagSinglePayload for Prefetch.Response.Node.ValidationResult.InvalidCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244A37D54 + 4 * byte_244A5B647[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244A37D74 + 4 * byte_244A5B64C[v4]))();
}

_BYTE *sub_244A37D54(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244A37D74(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244A37D7C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244A37D84(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244A37D8C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244A37D94(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.ValidationResult.InvalidCodingKeys()
{
  return &type metadata for Prefetch.Response.Node.ValidationResult.InvalidCodingKeys;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.ValidationResult.NodeAlreadyExistsInBatchCodingKeys()
{
  return &type metadata for Prefetch.Response.Node.ValidationResult.NodeAlreadyExistsInBatchCodingKeys;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.ValidationResult.ValidationNotNeededCodingKeys()
{
  return &type metadata for Prefetch.Response.Node.ValidationResult.ValidationNotNeededCodingKeys;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.ValidationResult.ExpiryTooLargeCodingKeys()
{
  return &type metadata for Prefetch.Response.Node.ValidationResult.ExpiryTooLargeCodingKeys;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.ValidationResult.ValidatedExpiryTooLargeCodingKeys()
{
  return &type metadata for Prefetch.Response.Node.ValidationResult.ValidatedExpiryTooLargeCodingKeys;
}

ValueMetadata *type metadata accessor for Prefetch.Response.Node.ValidationResult.NoUniqueIdentifierCodingKeys()
{
  return &type metadata for Prefetch.Response.Node.ValidationResult.NoUniqueIdentifierCodingKeys;
}

unint64_t sub_244A37E04()
{
  unint64_t result;

  result = qword_2573C3A48;
  if (!qword_2573C3A48)
  {
    result = MEMORY[0x24951D378](&unk_244A5BB90, &type metadata for Prefetch.Response.Node.ValidationResult.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A48);
  }
  return result;
}

unint64_t sub_244A37E4C()
{
  unint64_t result;

  result = qword_2573C3A50;
  if (!qword_2573C3A50)
  {
    result = MEMORY[0x24951D378](&unk_244A5BC48, &type metadata for Prefetch.Response.Node.ValidationResult.ValidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A50);
  }
  return result;
}

unint64_t sub_244A37E94()
{
  unint64_t result;

  result = qword_2573C3A58;
  if (!qword_2573C3A58)
  {
    result = MEMORY[0x24951D378](&unk_244A5BD00, &type metadata for Prefetch.Response.Node.ValidationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A58);
  }
  return result;
}

unint64_t sub_244A37EDC()
{
  unint64_t result;

  result = qword_2573C3A60;
  if (!qword_2573C3A60)
  {
    result = MEMORY[0x24951D378](&unk_244A5BDB8, &type metadata for Prefetch.Response.Node.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A60);
  }
  return result;
}

unint64_t sub_244A37F24()
{
  unint64_t result;

  result = qword_2573C3A68;
  if (!qword_2573C3A68)
  {
    result = MEMORY[0x24951D378](&unk_244A5BE70, &type metadata for Prefetch.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A68);
  }
  return result;
}

unint64_t sub_244A37F6C()
{
  unint64_t result;

  result = qword_2573C3A70;
  if (!qword_2573C3A70)
  {
    result = MEMORY[0x24951D378](&unk_244A5BDE0, &type metadata for Prefetch.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A70);
  }
  return result;
}

unint64_t sub_244A37FB4()
{
  unint64_t result;

  result = qword_2573C3A78;
  if (!qword_2573C3A78)
  {
    result = MEMORY[0x24951D378](&unk_244A5BE08, &type metadata for Prefetch.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A78);
  }
  return result;
}

unint64_t sub_244A37FFC()
{
  unint64_t result;

  result = qword_2573C3A80;
  if (!qword_2573C3A80)
  {
    result = MEMORY[0x24951D378](&unk_244A5BD28, &type metadata for Prefetch.Response.Node.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A80);
  }
  return result;
}

unint64_t sub_244A38044()
{
  unint64_t result;

  result = qword_2573C3A88;
  if (!qword_2573C3A88)
  {
    result = MEMORY[0x24951D378](&unk_244A5BD50, &type metadata for Prefetch.Response.Node.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A88);
  }
  return result;
}

unint64_t sub_244A3808C()
{
  unint64_t result;

  result = qword_2573C3A90;
  if (!qword_2573C3A90)
  {
    result = MEMORY[0x24951D378](&unk_244A5BBB8, &type metadata for Prefetch.Response.Node.ValidationResult.ValidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A90);
  }
  return result;
}

unint64_t sub_244A380D4()
{
  unint64_t result;

  result = qword_2573C3A98;
  if (!qword_2573C3A98)
  {
    result = MEMORY[0x24951D378](&unk_244A5BBE0, &type metadata for Prefetch.Response.Node.ValidationResult.ValidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3A98);
  }
  return result;
}

unint64_t sub_244A3811C()
{
  unint64_t result;

  result = qword_2573C3AA0;
  if (!qword_2573C3AA0)
  {
    result = MEMORY[0x24951D378](&unk_244A5BB00, &type metadata for Prefetch.Response.Node.ValidationResult.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AA0);
  }
  return result;
}

unint64_t sub_244A38164()
{
  unint64_t result;

  result = qword_2573C3AA8;
  if (!qword_2573C3AA8)
  {
    result = MEMORY[0x24951D378](&unk_244A5BB28, &type metadata for Prefetch.Response.Node.ValidationResult.InvalidCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AA8);
  }
  return result;
}

unint64_t sub_244A381AC()
{
  unint64_t result;

  result = qword_2573C3AB0;
  if (!qword_2573C3AB0)
  {
    result = MEMORY[0x24951D378](&unk_244A5BAB0, &type metadata for Prefetch.Response.Node.ValidationResult.NodeAlreadyExistsInBatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AB0);
  }
  return result;
}

unint64_t sub_244A381F4()
{
  unint64_t result;

  result = qword_2573C3AB8;
  if (!qword_2573C3AB8)
  {
    result = MEMORY[0x24951D378](&unk_244A5BAD8, &type metadata for Prefetch.Response.Node.ValidationResult.NodeAlreadyExistsInBatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AB8);
  }
  return result;
}

unint64_t sub_244A3823C()
{
  unint64_t result;

  result = qword_2573C3AC0;
  if (!qword_2573C3AC0)
  {
    result = MEMORY[0x24951D378](&unk_244A5BA60, &type metadata for Prefetch.Response.Node.ValidationResult.ValidationNotNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AC0);
  }
  return result;
}

unint64_t sub_244A38284()
{
  unint64_t result;

  result = qword_2573C3AC8;
  if (!qword_2573C3AC8)
  {
    result = MEMORY[0x24951D378](&unk_244A5BA88, &type metadata for Prefetch.Response.Node.ValidationResult.ValidationNotNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AC8);
  }
  return result;
}

unint64_t sub_244A382CC()
{
  unint64_t result;

  result = qword_2573C3AD0;
  if (!qword_2573C3AD0)
  {
    result = MEMORY[0x24951D378](&unk_244A5BA10, &type metadata for Prefetch.Response.Node.ValidationResult.ExpiryTooLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AD0);
  }
  return result;
}

unint64_t sub_244A38314()
{
  unint64_t result;

  result = qword_2573C3AD8;
  if (!qword_2573C3AD8)
  {
    result = MEMORY[0x24951D378](&unk_244A5BA38, &type metadata for Prefetch.Response.Node.ValidationResult.ExpiryTooLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AD8);
  }
  return result;
}

unint64_t sub_244A3835C()
{
  unint64_t result;

  result = qword_2573C3AE0;
  if (!qword_2573C3AE0)
  {
    result = MEMORY[0x24951D378](&unk_244A5B9C0, &type metadata for Prefetch.Response.Node.ValidationResult.ValidatedExpiryTooLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AE0);
  }
  return result;
}

unint64_t sub_244A383A4()
{
  unint64_t result;

  result = qword_2573C3AE8;
  if (!qword_2573C3AE8)
  {
    result = MEMORY[0x24951D378](&unk_244A5B9E8, &type metadata for Prefetch.Response.Node.ValidationResult.ValidatedExpiryTooLargeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AE8);
  }
  return result;
}

unint64_t sub_244A383EC()
{
  unint64_t result;

  result = qword_2573C3AF0;
  if (!qword_2573C3AF0)
  {
    result = MEMORY[0x24951D378]("1", &type metadata for Prefetch.Response.Node.ValidationResult.NoUniqueIdentifierCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AF0);
  }
  return result;
}

unint64_t sub_244A38434()
{
  unint64_t result;

  result = qword_2573C3AF8;
  if (!qword_2573C3AF8)
  {
    result = MEMORY[0x24951D378](&unk_244A5B998, &type metadata for Prefetch.Response.Node.ValidationResult.NoUniqueIdentifierCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3AF8);
  }
  return result;
}

unint64_t sub_244A3847C()
{
  unint64_t result;

  result = qword_2573C3B00;
  if (!qword_2573C3B00)
  {
    result = MEMORY[0x24951D378](&unk_244A5BC70, &type metadata for Prefetch.Response.Node.ValidationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3B00);
  }
  return result;
}

unint64_t sub_244A384C4()
{
  unint64_t result;

  result = qword_2573C3B08;
  if (!qword_2573C3B08)
  {
    result = MEMORY[0x24951D378](&unk_244A5BC98, &type metadata for Prefetch.Response.Node.ValidationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3B08);
  }
  return result;
}

uint64_t sub_244A38508(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x64696C6176 && a2 == 0xE500000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64696C61766E69 && a2 == 0xE700000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000244A5F150 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000244A5F170 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6F54797269707865 && a2 == 0xEE00656772614C6FLL || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000244A5F190 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244A5F1B0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_244A387C4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_244A38840()
{
  return 0x726F727265;
}

uint64_t sub_244A38854(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x654B63696C627570 && a2 == 0xE900000000000079;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x797269707865 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_244A3893C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x56534F64756F6C63 && a2 == 0xEE006E6F69737265 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244A5F1D0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5F1F0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x436F546465766173 && a2 == 0xEC00000065686361 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000244A5F210)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_244A38BB8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7365646F6ELL && a2 == 0xE500000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_244A38C80(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3B10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t TrustedRequestHistory.Request.Node.state.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.Node.state.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.state.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.Node.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.identifier.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.ohttpContext.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t TrustedRequestHistory.Request.Node.ohttpContext.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.ohttpContext.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.hasReceivedSummary.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t TrustedRequestHistory.Request.Node.hasReceivedSummary.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = result;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.hasReceivedSummary.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.dataReceived.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t TrustedRequestHistory.Request.Node.dataReceived.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = result;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.dataReceived.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.cloudOSVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.Node.cloudOSVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.cloudOSVersion.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.cloudOSReleaseType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.Node.cloudOSReleaseType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.cloudOSReleaseType.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.maybeValidatedCellID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.Node.maybeValidatedCellID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.maybeValidatedCellID.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.ensembleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.Node.ensembleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 104) = a1;
  *(_QWORD *)(v2 + 112) = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.ensembleID.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.Node.isFromCache.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 120);
}

uint64_t TrustedRequestHistory.Request.Node.isFromCache.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 120) = result;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.Node.isFromCache.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.request.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_244A38FEC(v1, a1);
}

uint64_t sub_244A38FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TrustedRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t TrustedRequestHistory.Request.request.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_244A39038(a1, v1);
}

uint64_t sub_244A39038(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TrustedRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TrustedRequestHistory.Request.request.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.clientConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  int *v4;
  int v5;

  result = type metadata accessor for TrustedRequestHistory.Request();
  v4 = (int *)(v1 + *(int *)(result + 20));
  v5 = *v4;
  LOBYTE(v4) = *((_BYTE *)v4 + 4);
  *(_DWORD *)a1 = v5;
  *(_BYTE *)(a1 + 4) = (_BYTE)v4;
  return result;
}

uint64_t type metadata accessor for TrustedRequestHistory.Request()
{
  uint64_t result;

  result = qword_2573C3B70;
  if (!qword_2573C3B70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TrustedRequestHistory.Request.clientConfiguration.setter(int *a1)
{
  uint64_t v1;
  int v2;
  char v3;
  uint64_t result;
  uint64_t v5;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 4);
  result = type metadata accessor for TrustedRequestHistory.Request();
  v5 = v1 + *(int *)(result + 20);
  *(_DWORD *)v5 = v2;
  *(_BYTE *)(v5 + 4) = v3;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.clientConfiguration.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 24);
  v4 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TrustedRequestHistory.Request.creationDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 24);
  v4 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*TrustedRequestHistory.Request.creationDate.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.bundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.bundleIdentifier.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.qos.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.qos.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.qos.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.state.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.state.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 36));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.state.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.payloadTransportState.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.payloadTransportState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 40));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.payloadTransportState.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.responseState.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.responseState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 44));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.responseState.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.responseCode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 48));
}

uint64_t TrustedRequestHistory.Request.responseCode.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for TrustedRequestHistory.Request();
  v6 = v2 + *(int *)(result + 48);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.responseCode.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.environment.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.environment.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 52));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.environment.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.ropesVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequestHistory.Request.ropesVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 56));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.ropesVersion.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.Request.nodes.getter()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return swift_bridgeObjectRetain();
}

uint64_t TrustedRequestHistory.Request.nodes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for TrustedRequestHistory.Request() + 60);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*TrustedRequestHistory.Request.nodes.modify())()
{
  type metadata accessor for TrustedRequestHistory.Request();
  return nullsub_1;
}

uint64_t TrustedRequestHistory.requests.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TrustedRequestHistory.requests.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*TrustedRequestHistory.requests.modify())()
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for TrustedRequestHistory()
{
  return &type metadata for TrustedRequestHistory;
}

uint64_t *initializeBufferWithCopyOfBuffer for TrustedRequestHistory.Request(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
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
  char *v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  void (*v71)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v72;
  char *__dst;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244A56C9C();
    v8 = *(_QWORD *)(v7 - 8);
    v71 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v71(a1, a2, v7);
    v9 = (int *)type metadata accessor for TrustedRequest();
    v10 = v9[5];
    v11 = (uint64_t *)((char *)a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    v14 = *v12;
    v13 = v12[1];
    *v11 = v14;
    v11[1] = v13;
    *(uint64_t *)((char *)a1 + v9[6]) = *(uint64_t *)((char *)a2 + v9[6]);
    v15 = v9[7];
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = v9[8];
    v20 = (uint64_t *)((char *)a1 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = v9[9];
    v24 = (uint64_t *)((char *)a1 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = v9[10];
    v72 = v8;
    __dst = (char *)a1 + v27;
    v28 = (char *)a2 + v27;
    v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29(v28, 1, v7))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
      memcpy(__dst, v28, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      v71((uint64_t *)__dst, (uint64_t *)v28, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v72 + 56))(__dst, 0, 1, v7);
    }
    v32 = a3[5];
    v33 = a3[6];
    v34 = (char *)a1 + v32;
    v35 = (char *)a2 + v32;
    *(_DWORD *)v34 = *(_DWORD *)v35;
    v34[4] = v35[4];
    v36 = (char *)a1 + v33;
    v37 = (char *)a2 + v33;
    v38 = sub_244A56C78();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v36, v37, v38);
    v39 = a3[7];
    v40 = a3[8];
    v41 = (uint64_t *)((char *)a1 + v39);
    v42 = (uint64_t *)((char *)a2 + v39);
    v43 = v42[1];
    *v41 = *v42;
    v41[1] = v43;
    v44 = (uint64_t *)((char *)a1 + v40);
    v45 = (uint64_t *)((char *)a2 + v40);
    v46 = v45[1];
    *v44 = *v45;
    v44[1] = v46;
    v47 = a3[9];
    v48 = a3[10];
    v49 = (uint64_t *)((char *)a1 + v47);
    v50 = (uint64_t *)((char *)a2 + v47);
    v51 = v50[1];
    *v49 = *v50;
    v49[1] = v51;
    v52 = (uint64_t *)((char *)a1 + v48);
    v53 = (uint64_t *)((char *)a2 + v48);
    v54 = v53[1];
    *v52 = *v53;
    v52[1] = v54;
    v55 = a3[11];
    v56 = a3[12];
    v57 = (uint64_t *)((char *)a1 + v55);
    v58 = (uint64_t *)((char *)a2 + v55);
    v59 = v58[1];
    *v57 = *v58;
    v57[1] = v59;
    v60 = (char *)a1 + v56;
    v61 = (char *)a2 + v56;
    *(_QWORD *)v60 = *(_QWORD *)v61;
    v60[8] = v61[8];
    v62 = a3[13];
    v63 = a3[14];
    v64 = (uint64_t *)((char *)a1 + v62);
    v65 = (uint64_t *)((char *)a2 + v62);
    v66 = v65[1];
    *v64 = *v65;
    v64[1] = v66;
    v67 = (uint64_t *)((char *)a1 + v63);
    v68 = (uint64_t *)((char *)a2 + v63);
    v69 = v68[1];
    *v67 = *v68;
    v67[1] = v69;
    *(uint64_t *)((char *)a1 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TrustedRequestHistory.Request(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_244A56C9C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = type metadata accessor for TrustedRequest();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = a1 + *(int *)(v7 + 40);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
    v6(v8, v4);
  v9 = a1 + *(int *)(a2 + 24);
  v10 = sub_244A56C78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for TrustedRequestHistory.Request(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unsigned int (*v28)(const void *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  void (*v69)(void *, const void *, uint64_t);
  uint64_t v70;
  char *__dst;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v69 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v69(a1, a2, v6);
  v8 = (int *)type metadata accessor for TrustedRequest();
  v9 = v8[5];
  v10 = &a1[v9];
  v11 = (uint64_t *)&a2[v9];
  v13 = *v11;
  v12 = v11[1];
  *(_QWORD *)v10 = v13;
  *((_QWORD *)v10 + 1) = v12;
  *(_QWORD *)&a1[v8[6]] = *(_QWORD *)&a2[v8[6]];
  v14 = v8[7];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = v17;
  v18 = v8[8];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = *((_QWORD *)v20 + 1);
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *((_QWORD *)v19 + 1) = v21;
  v22 = v8[9];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = *((_QWORD *)v24 + 1);
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *((_QWORD *)v23 + 1) = v25;
  v26 = v8[10];
  v70 = v7;
  __dst = &a1[v26];
  v27 = &a2[v26];
  v28 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v28(v27, 1, v6))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(__dst, v27, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    v69(__dst, v27, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v70 + 56))(__dst, 0, 1, v6);
  }
  v30 = a3[5];
  v31 = a3[6];
  v32 = &a1[v30];
  v33 = &a2[v30];
  *(_DWORD *)v32 = *(_DWORD *)v33;
  v32[4] = v33[4];
  v34 = &a1[v31];
  v35 = &a2[v31];
  v36 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
  v37 = a3[7];
  v38 = a3[8];
  v39 = &a1[v37];
  v40 = &a2[v37];
  v41 = *((_QWORD *)v40 + 1);
  *(_QWORD *)v39 = *(_QWORD *)v40;
  *((_QWORD *)v39 + 1) = v41;
  v42 = &a1[v38];
  v43 = &a2[v38];
  v44 = *((_QWORD *)v43 + 1);
  *(_QWORD *)v42 = *(_QWORD *)v43;
  *((_QWORD *)v42 + 1) = v44;
  v45 = a3[9];
  v46 = a3[10];
  v47 = &a1[v45];
  v48 = &a2[v45];
  v49 = *((_QWORD *)v48 + 1);
  *(_QWORD *)v47 = *(_QWORD *)v48;
  *((_QWORD *)v47 + 1) = v49;
  v50 = &a1[v46];
  v51 = &a2[v46];
  v52 = *((_QWORD *)v51 + 1);
  *(_QWORD *)v50 = *(_QWORD *)v51;
  *((_QWORD *)v50 + 1) = v52;
  v53 = a3[11];
  v54 = a3[12];
  v55 = &a1[v53];
  v56 = &a2[v53];
  v57 = *((_QWORD *)v56 + 1);
  *(_QWORD *)v55 = *(_QWORD *)v56;
  *((_QWORD *)v55 + 1) = v57;
  v58 = &a1[v54];
  v59 = &a2[v54];
  *(_QWORD *)v58 = *(_QWORD *)v59;
  v58[8] = v59[8];
  v60 = a3[13];
  v61 = a3[14];
  v62 = &a1[v60];
  v63 = &a2[v60];
  v64 = *((_QWORD *)v63 + 1);
  *(_QWORD *)v62 = *(_QWORD *)v63;
  *((_QWORD *)v62 + 1) = v64;
  v65 = &a1[v61];
  v66 = &a2[v61];
  v67 = *((_QWORD *)v66 + 1);
  *(_QWORD *)v65 = *(_QWORD *)v66;
  *((_QWORD *)v65 + 1) = v67;
  *(_QWORD *)&a1[a3[15]] = *(_QWORD *)&a2[a3[15]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for TrustedRequestHistory.Request(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t (*v25)(const void *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  int v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for TrustedRequest();
  v10 = v9[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[v9[6]] = *(_QWORD *)&a2[v9[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = v9[7];
  v14 = &a1[v13];
  v15 = &a2[v13];
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = v9[8];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = v9[9];
  v20 = &a1[v19];
  v21 = &a2[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22 = v9[10];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v26 = v25(&a1[v22], 1, v6);
  v27 = v25(v24, 1, v6);
  if (!v26)
  {
    if (!v27)
    {
      v8(v23, v24, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v23, v6);
    goto LABEL_6;
  }
  if (v27)
  {
LABEL_6:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v23, v24, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v23, 0, 1, v6);
LABEL_7:
  v29 = a3[5];
  v30 = &a1[v29];
  v31 = &a2[v29];
  v32 = *(_DWORD *)v31;
  v30[4] = v31[4];
  *(_DWORD *)v30 = v32;
  v33 = a3[6];
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 24))(v34, v35, v36);
  v37 = a3[7];
  v38 = &a1[v37];
  v39 = &a2[v37];
  *(_QWORD *)v38 = *(_QWORD *)v39;
  *((_QWORD *)v38 + 1) = *((_QWORD *)v39 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = a3[8];
  v41 = &a1[v40];
  v42 = &a2[v40];
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v43 = a3[9];
  v44 = &a1[v43];
  v45 = &a2[v43];
  *(_QWORD *)v44 = *(_QWORD *)v45;
  *((_QWORD *)v44 + 1) = *((_QWORD *)v45 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v46 = a3[10];
  v47 = &a1[v46];
  v48 = &a2[v46];
  *(_QWORD *)v47 = *(_QWORD *)v48;
  *((_QWORD *)v47 + 1) = *((_QWORD *)v48 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v49 = a3[11];
  v50 = &a1[v49];
  v51 = &a2[v49];
  *(_QWORD *)v50 = *(_QWORD *)v51;
  *((_QWORD *)v50 + 1) = *((_QWORD *)v51 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v52 = a3[12];
  v53 = &a1[v52];
  v54 = &a2[v52];
  v55 = *(_QWORD *)v54;
  v53[8] = v54[8];
  *(_QWORD *)v53 = v55;
  v56 = a3[13];
  v57 = &a1[v56];
  v58 = &a2[v56];
  *(_QWORD *)v57 = *(_QWORD *)v58;
  *((_QWORD *)v57 + 1) = *((_QWORD *)v58 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v59 = a3[14];
  v60 = &a1[v59];
  v61 = &a2[v59];
  *(_QWORD *)v60 = *(_QWORD *)v61;
  *((_QWORD *)v60 + 1) = *((_QWORD *)v61 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[15]] = *(_QWORD *)&a2[a3[15]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for TrustedRequestHistory.Request(char *a1, char *a2, int *a3)
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
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for TrustedRequest();
  *(_OWORD *)&a1[v9[5]] = *(_OWORD *)&a2[v9[5]];
  *(_QWORD *)&a1[v9[6]] = *(_QWORD *)&a2[v9[6]];
  *(_OWORD *)&a1[v9[7]] = *(_OWORD *)&a2[v9[7]];
  *(_OWORD *)&a1[v9[8]] = *(_OWORD *)&a2[v9[8]];
  *(_OWORD *)&a1[v9[9]] = *(_OWORD *)&a2[v9[9]];
  v10 = v9[10];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v10], 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  v14 = a3[5];
  v15 = a3[6];
  v16 = &a1[v14];
  v17 = &a2[v14];
  *(_DWORD *)v16 = *(_DWORD *)v17;
  v16[4] = v17[4];
  v18 = &a1[v15];
  v19 = &a2[v15];
  v20 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v21 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  v22 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v22] = *(_OWORD *)&a2[v22];
  v23 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  v24 = &a1[v23];
  v25 = &a2[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  v24[8] = v25[8];
  v26 = a3[14];
  *(_OWORD *)&a1[a3[13]] = *(_OWORD *)&a2[a3[13]];
  *(_OWORD *)&a1[v26] = *(_OWORD *)&a2[v26];
  *(_QWORD *)&a1[a3[15]] = *(_QWORD *)&a2[a3[15]];
  return a1;
}

char *assignWithTake for TrustedRequestHistory.Request(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t (*v33)(const void *, uint64_t, uint64_t);
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for TrustedRequest();
  v10 = v9[5];
  v11 = &a1[v10];
  v12 = (uint64_t *)&a2[v10];
  v14 = *v12;
  v13 = v12[1];
  *(_QWORD *)v11 = v14;
  *((_QWORD *)v11 + 1) = v13;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[v9[6]] = *(_QWORD *)&a2[v9[6]];
  swift_bridgeObjectRelease();
  v15 = v9[7];
  v16 = &a1[v15];
  v17 = (uint64_t *)&a2[v15];
  v19 = *v17;
  v18 = v17[1];
  *(_QWORD *)v16 = v19;
  *((_QWORD *)v16 + 1) = v18;
  swift_bridgeObjectRelease();
  v20 = v9[8];
  v21 = &a1[v20];
  v22 = (uint64_t *)&a2[v20];
  v24 = *v22;
  v23 = v22[1];
  *(_QWORD *)v21 = v24;
  *((_QWORD *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  v25 = v9[9];
  v26 = &a1[v25];
  v27 = (uint64_t *)&a2[v25];
  v29 = *v27;
  v28 = v27[1];
  *(_QWORD *)v26 = v29;
  *((_QWORD *)v26 + 1) = v28;
  swift_bridgeObjectRelease();
  v30 = v9[10];
  v31 = &a1[v30];
  v32 = &a2[v30];
  v33 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v34 = v33(&a1[v30], 1, v6);
  v35 = v33(v32, 1, v6);
  if (!v34)
  {
    if (!v35)
    {
      v8(v31, v32, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v31, v6);
    goto LABEL_6;
  }
  if (v35)
  {
LABEL_6:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v31, v32, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v31, 0, 1, v6);
LABEL_7:
  v37 = a3[5];
  v38 = a3[6];
  v39 = &a1[v37];
  v40 = &a2[v37];
  *(_DWORD *)v39 = *(_DWORD *)v40;
  v39[4] = v40[4];
  v41 = &a1[v38];
  v42 = &a2[v38];
  v43 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 40))(v41, v42, v43);
  v44 = a3[7];
  v45 = &a1[v44];
  v46 = (uint64_t *)&a2[v44];
  v48 = *v46;
  v47 = v46[1];
  *(_QWORD *)v45 = v48;
  *((_QWORD *)v45 + 1) = v47;
  swift_bridgeObjectRelease();
  v49 = a3[8];
  v50 = &a1[v49];
  v51 = (uint64_t *)&a2[v49];
  v53 = *v51;
  v52 = v51[1];
  *(_QWORD *)v50 = v53;
  *((_QWORD *)v50 + 1) = v52;
  swift_bridgeObjectRelease();
  v54 = a3[9];
  v55 = &a1[v54];
  v56 = (uint64_t *)&a2[v54];
  v58 = *v56;
  v57 = v56[1];
  *(_QWORD *)v55 = v58;
  *((_QWORD *)v55 + 1) = v57;
  swift_bridgeObjectRelease();
  v59 = a3[10];
  v60 = &a1[v59];
  v61 = (uint64_t *)&a2[v59];
  v63 = *v61;
  v62 = v61[1];
  *(_QWORD *)v60 = v63;
  *((_QWORD *)v60 + 1) = v62;
  swift_bridgeObjectRelease();
  v64 = a3[11];
  v65 = &a1[v64];
  v66 = (uint64_t *)&a2[v64];
  v68 = *v66;
  v67 = v66[1];
  *(_QWORD *)v65 = v68;
  *((_QWORD *)v65 + 1) = v67;
  swift_bridgeObjectRelease();
  v69 = a3[12];
  v70 = a3[13];
  v71 = &a1[v69];
  v72 = &a2[v69];
  *(_QWORD *)v71 = *(_QWORD *)v72;
  v71[8] = v72[8];
  v73 = &a1[v70];
  v74 = (uint64_t *)&a2[v70];
  v76 = *v74;
  v75 = v74[1];
  *(_QWORD *)v73 = v76;
  *((_QWORD *)v73 + 1) = v75;
  swift_bridgeObjectRelease();
  v77 = a3[14];
  v78 = &a1[v77];
  v79 = (uint64_t *)&a2[v77];
  v81 = *v79;
  v80 = v79[1];
  *(_QWORD *)v78 = v81;
  *((_QWORD *)v78 + 1) = v80;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[15]] = *(_QWORD *)&a2[a3[15]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedRequestHistory.Request()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A3A774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = type metadata accessor for TrustedRequest();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_244A56C78();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedRequestHistory.Request()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A3A82C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for TrustedRequest();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_244A56C78();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_244A3A8D4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for TrustedRequest();
  if (v1 <= 0x3F)
  {
    result = sub_244A56C78();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t destroy for TrustedRequestHistory.Request.Node()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TrustedRequestHistory.Request.Node(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TrustedRequestHistory.Request.Node(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  return a1;
}

__n128 __swift_memcpy121_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_OWORD *)(a1 + 105) = *(__int128 *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for TrustedRequestHistory.Request.Node(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v8;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedRequestHistory.Request.Node(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 121))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedRequestHistory.Request.Node(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 120) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 121) = 1;
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
    *(_BYTE *)(result + 121) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedRequestHistory.Request.Node()
{
  return &type metadata for TrustedRequestHistory.Request.Node;
}

uint64_t TC2RequestParameters.pipelineKind.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2RequestParameters.pipelineArguments.getter()
{
  return swift_bridgeObjectRetain();
}

PrivateCloudCompute::TC2RequestParameters __swiftcall TC2RequestParameters.init(pipelineKind:pipelineArguments:)(Swift::String pipelineKind, Swift::OpaquePointer pipelineArguments)
{
  uint64_t v2;
  PrivateCloudCompute::TC2RequestParameters result;

  *(Swift::String *)v2 = pipelineKind;
  *(Swift::OpaquePointer *)(v2 + 16) = pipelineArguments;
  result.pipelineKind = pipelineKind;
  result.pipelineArguments = pipelineArguments;
  return result;
}

uint64_t static TC2RequestParameters.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_244A5711C() & 1) != 0)
    return sub_244A3ADBC(v2, v3);
  else
    return 0;
}

uint64_t sub_244A3ADBC(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  _QWORD *v24;
  char v26;
  int64_t v27;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v27)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v27)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
        {
          v4 = v11 + 3;
          if (v11 + 3 >= v27)
            return 1;
          v12 = *(_QWORD *)(v5 + 8 * v4);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    v14 = 16 * v10;
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v14);
    v16 = *v15;
    v17 = v15[1];
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v14);
    v20 = *v18;
    v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_244A46BF0(v16, v17);
    v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v24 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v26 = sub_244A5711C();
      result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
        return 0;
    }
  }
  v13 = v11 + 4;
  if (v13 >= v27)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_24;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t TC2RequestParameters.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244A3B6B0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A3B03C(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000011;
  else
    return 0x656E696C65706970;
}

uint64_t sub_244A3B080()
{
  char *v0;

  return sub_244A3B03C(*v0);
}

uint64_t sub_244A3B088@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A3BB78(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A3B0AC()
{
  sub_244A3B874();
  return sub_244A571E8();
}

uint64_t sub_244A3B0D4()
{
  sub_244A3B874();
  return sub_244A571F4();
}

uint64_t TC2RequestParameters.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3BD0);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A3B874();
  sub_244A571DC();
  v13 = 0;
  sub_244A570A4();
  if (!v2)
  {
    v11 = v9;
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3BE0);
    sub_244A3B8B8(&qword_2573C3BE8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    sub_244A570E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t TC2RequestParameters.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 16);
  sub_244A57194();
  swift_bridgeObjectRetain();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244A3B6B0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_244A571C4();
}

uint64_t TC2RequestParameters.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  _QWORD v14[2];
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3BF0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A3B874();
  sub_244A571D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v16 = 0;
  v9 = sub_244A57008();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3BE0);
  v15 = 1;
  sub_244A3B8B8(&qword_2573C3BF8, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
  swift_bridgeObjectRetain();
  sub_244A57044();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A3B4C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return TC2RequestParameters.init(from:)(a1, a2);
}

uint64_t sub_244A3B4DC(_QWORD *a1)
{
  return TC2RequestParameters.encode(to:)(a1);
}

uint64_t sub_244A3B4F0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_244A5711C() & 1) != 0)
    return sub_244A3ADBC(v2, v3);
  else
    return 0;
}

uint64_t sub_244A3B550()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 16);
  sub_244A57194();
  swift_bridgeObjectRetain();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244A3B6B0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_244A571C4();
}

uint64_t sub_244A3B5D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244A3B6B0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A3B634()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 16);
  sub_244A57194();
  swift_bridgeObjectRetain();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_244A3B6B0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_244A571C4();
}

uint64_t sub_244A3B6B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;

  v12 = a2 + 64;
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v8 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v9 >= v5)
      goto LABEL_19;
    v10 = *(_QWORD *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      v8 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_19;
      v10 = *(_QWORD *)(v12 + 8 * v8);
      if (!v10)
        break;
    }
LABEL_18:
    v4 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_244A56D5C();
    swift_bridgeObjectRelease();
    sub_244A56D5C();
    swift_bridgeObjectRelease();
    result = sub_244A571C4();
    v7 ^= result;
  }
  v11 = v9 + 2;
  if (v11 >= v5)
  {
LABEL_19:
    swift_release();
    return sub_244A571A0();
  }
  v10 = *(_QWORD *)(v12 + 8 * v11);
  if (v10)
  {
    v8 = v11;
    goto LABEL_18;
  }
  while (1)
  {
    v8 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v8 >= v5)
      goto LABEL_19;
    v10 = *(_QWORD *)(v12 + 8 * v8);
    ++v11;
    if (v10)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

unint64_t sub_244A3B874()
{
  unint64_t result;

  result = qword_2573C3BD8;
  if (!qword_2573C3BD8)
  {
    result = MEMORY[0x24951D378](&unk_244A5C498, &type metadata for TC2RequestParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3BD8);
  }
  return result;
}

uint64_t sub_244A3B8B8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573C3BE0);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x24951D378](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_244A3B91C()
{
  unint64_t result;

  result = qword_2543FB098[0];
  if (!qword_2543FB098[0])
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RequestParameters, &type metadata for TC2RequestParameters);
    atomic_store(result, qword_2543FB098);
  }
  return result;
}

_QWORD *assignWithCopy for TC2RequestParameters(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for TC2RequestParameters()
{
  return &type metadata for TC2RequestParameters;
}

uint64_t storeEnumTagSinglePayload for TC2RequestParameters.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A3BA20 + 4 * byte_244A5C2E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244A3BA54 + 4 * asc_244A5C2E0[v4]))();
}

uint64_t sub_244A3BA54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A3BA5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A3BA64);
  return result;
}

uint64_t sub_244A3BA70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A3BA78);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244A3BA7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A3BA84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2RequestParameters.CodingKeys()
{
  return &type metadata for TC2RequestParameters.CodingKeys;
}

unint64_t sub_244A3BAA4()
{
  unint64_t result;

  result = qword_2573C3C00;
  if (!qword_2573C3C00)
  {
    result = MEMORY[0x24951D378](&unk_244A5C470, &type metadata for TC2RequestParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3C00);
  }
  return result;
}

unint64_t sub_244A3BAEC()
{
  unint64_t result;

  result = qword_2573C3C08;
  if (!qword_2573C3C08)
  {
    result = MEMORY[0x24951D378](&unk_244A5C3E0, &type metadata for TC2RequestParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3C08);
  }
  return result;
}

unint64_t sub_244A3BB34()
{
  unint64_t result;

  result = qword_2573C3C10;
  if (!qword_2573C3C10)
  {
    result = MEMORY[0x24951D378](&unk_244A5C408, &type metadata for TC2RequestParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3C10);
  }
  return result;
}

uint64_t sub_244A3BB78(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656E696C65706970 && a2 == 0xEC000000646E694BLL;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000244A5F230)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_244A3BC6C()
{
  sub_244A56D5C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A3BCAC()
{
  sub_244A57194();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  return sub_244A571C4();
}

const char *TC2EnvironmentFlags.domain.getter()
{
  return "PrivateCloudCompute";
}

const char *TC2EnvironmentFlags.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "productionEnvironmentAvailable";
  else
    return "enforceEnvironment";
}

BOOL static TC2EnvironmentFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TC2EnvironmentFlags.hash(into:)()
{
  return sub_244A571A0();
}

uint64_t TC2EnvironmentFlags.hashValue.getter()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

const char *sub_244A3BDD8()
{
  return "PrivateCloudCompute";
}

const char *sub_244A3BDEC()
{
  _BYTE *v0;

  if (*v0)
    return "productionEnvironmentAvailable";
  else
    return "enforceEnvironment";
}

PrivateCloudCompute::TC2EnvironmentNames_optional __swiftcall TC2EnvironmentNames.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PrivateCloudCompute::TC2EnvironmentNames_optional result;
  char v5;

  v2 = v1;
  v3 = sub_244A56FB4();
  result.value = swift_bridgeObjectRelease();
  v5 = 7;
  if (v3 < 7)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t TC2EnvironmentNames.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aProducticarry[8 * *v0];
}

uint64_t sub_244A3BE98(char *a1, char *a2)
{
  return sub_244A53FE0(*a1, *a2);
}

uint64_t sub_244A3BEA4()
{
  return sub_244A3BCAC();
}

uint64_t sub_244A3BEB0()
{
  return sub_244A3BC6C();
}

uint64_t sub_244A3BEB8()
{
  return sub_244A3BCAC();
}

PrivateCloudCompute::TC2EnvironmentNames_optional sub_244A3BEC0(Swift::String *a1)
{
  return TC2EnvironmentNames.init(rawValue:)(*a1);
}

uint64_t sub_244A3BECC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = TC2EnvironmentNames.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

PrivateCloudCompute::TC2Environment_optional __swiftcall TC2Environment.init(name:)(Swift::String name)
{
  char *v1;
  void *object;
  char *v3;
  BOOL v4;
  uint64_t countAndFlagsBits;
  PrivateCloudCompute::TC2Environment_optional result;
  char v7;
  char v8;

  object = name._object;
  v3 = v1;
  v4 = name._countAndFlagsBits == 0x69746375646F7270 && name._object == (void *)0xEA00000000006E6FLL;
  if (v4 || (countAndFlagsBits = name._countAndFlagsBits, (sub_244A5711C() & 1) != 0))
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else if (countAndFlagsBits == 0x7972726163 && object == (void *)0xE500000000000000 || (sub_244A5711C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 1;
  }
  else if (countAndFlagsBits == 0x676E6967617473 && object == (void *)0xE700000000000000
         || (sub_244A5711C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 2;
  }
  else if (countAndFlagsBits == 24945 && object == (void *)0xE200000000000000 || (sub_244A5711C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 3;
  }
  else if (countAndFlagsBits == 1718773104 && object == (void *)0xE400000000000000 || (sub_244A5711C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 4;
  }
  else if (countAndFlagsBits == 7759204 && object == (void *)0xE300000000000000 || (sub_244A5711C() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 5;
  }
  else if (countAndFlagsBits == 0x6172656D65687065 && object == (void *)0xE90000000000006CLL)
  {
    result.value = swift_bridgeObjectRelease();
    v7 = 6;
  }
  else
  {
    v8 = sub_244A5711C();
    result.value = swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
      v7 = 6;
    else
      v7 = 7;
  }
  *v3 = v7;
  return result;
}

uint64_t TC2Environment.name.getter()
{
  char *v0;

  return *(_QWORD *)&aProducticarry[8 * *v0];
}

uint64_t TC2Environment.ropesHostname.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A3C1E0 + 4 * byte_244A5C4F0[*v0]))(0xD00000000000001CLL, 0x8000000244A5F310);
}

uint64_t sub_244A3C1E0()
{
  return 0x70612E7365706F72;
}

unint64_t sub_244A3C204()
{
  return 0xD000000000000017;
}

uint64_t sub_244A3C220@<X0>(uint64_t a1@<X8>)
{
  return a1 + 2;
}

void TC2Environment.ropesUrl.getter()
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3C18);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  __asm { BR              X10 }
}

uint64_t sub_244A3C374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_244A56BA0();
  v2 = sub_244A56BAC();
  v3 = *(_QWORD *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    __break(1u);
    JUMPOUT(0x244A3C638);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v0, v1, v2);
}

void TC2Environment.configUrl.getter()
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3C18);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  __asm { BR              X10 }
}

uint64_t sub_244A3C788()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_244A56BA0();
  v2 = sub_244A56BAC();
  v3 = *(_QWORD *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    __break(1u);
    JUMPOUT(0x244A3CA4CLL);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v0, v1, v2);
}

BOOL TC2Environment.forceOHTTP.getter()
{
  unsigned __int8 *v0;

  return *v0 < 2u;
}

BOOL static TC2Environment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TC2Environment.hash(into:)()
{
  return sub_244A571A0();
}

uint64_t TC2Environment.hashValue.getter()
{
  sub_244A57194();
  sub_244A571A0();
  return sub_244A571C4();
}

unint64_t sub_244A3CB14()
{
  unint64_t result;

  result = qword_2573C3C20;
  if (!qword_2573C3C20)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2EnvironmentFlags, &type metadata for TC2EnvironmentFlags);
    atomic_store(result, (unint64_t *)&qword_2573C3C20);
  }
  return result;
}

unint64_t sub_244A3CB5C()
{
  unint64_t result;

  result = qword_2573C3C28;
  if (!qword_2573C3C28)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2EnvironmentNames, &type metadata for TC2EnvironmentNames);
    atomic_store(result, (unint64_t *)&qword_2573C3C28);
  }
  return result;
}

unint64_t sub_244A3CBA4()
{
  unint64_t result;

  result = qword_2573C3C30;
  if (!qword_2573C3C30)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2Environment, &type metadata for TC2Environment);
    atomic_store(result, (unint64_t *)&qword_2573C3C30);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TC2EnvironmentFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A3CC34 + 4 * byte_244A5C4FC[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244A3CC68 + 4 * byte_244A5C4F7[v4]))();
}

uint64_t sub_244A3CC68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A3CC70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A3CC78);
  return result;
}

uint64_t sub_244A3CC84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A3CC8CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244A3CC90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A3CC98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2EnvironmentFlags()
{
  return &type metadata for TC2EnvironmentFlags;
}

ValueMetadata *type metadata accessor for TC2EnvironmentNames()
{
  return &type metadata for TC2EnvironmentNames;
}

uint64_t _s19PrivateCloudCompute19TC2EnvironmentNamesOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A3CD18 + 4 * byte_244A5C506[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_244A3CD4C + 4 * byte_244A5C501[v4]))();
}

uint64_t sub_244A3CD4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A3CD54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A3CD5CLL);
  return result;
}

uint64_t sub_244A3CD68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A3CD70);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_244A3CD74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A3CD7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2Environment()
{
  return &type metadata for TC2Environment;
}

PrivateCloudCompute::TC2LogCategory_optional __swiftcall TC2LogCategory.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PrivateCloudCompute::TC2LogCategory_optional result;
  char v5;

  v2 = v1;
  v3 = sub_244A57134();
  result.value = swift_bridgeObjectRelease();
  v5 = 18;
  if (v3 < 0x12)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t TC2LogCategory.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A3CE30 + 4 * byte_244A5C7C0[*v0]))(0xD000000000000016, 0x8000000244A5DCB0);
}

uint64_t sub_244A3CE30()
{
  return 0x6E6F6D656144;
}

uint64_t sub_244A3CE44()
{
  return 0x5264657473757254;
}

uint64_t sub_244A3CE68()
{
  return 0x746E65696C43;
}

uint64_t sub_244A3CE7C()
{
  return 0x72756769666E6F43;
}

uint64_t sub_244A3CEA0()
{
  return 1819242324;
}

uint64_t sub_244A3CEB0()
{
  return 0x656C756465686353;
}

uint64_t sub_244A3CED4()
{
  return 0x6B726F7774654ELL;
}

unint64_t sub_244A3CEEC()
{
  return 0xD000000000000010;
}

uint64_t sub_244A3CFBC@<X0>(uint64_t a1@<X8>)
{
  return a1 + 2;
}

void sub_244A3CFCC()
{
  JUMPOUT(0x244A3CFD8);
}

uint64_t sub_244A3CFE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244A54064(*a1, *a2);
}

uint64_t sub_244A3CFF0()
{
  sub_244A57194();
  TC2LogCategory.rawValue.getter();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  return sub_244A571C4();
}

uint64_t sub_244A3D054()
{
  TC2LogCategory.rawValue.getter();
  sub_244A56D5C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A3D0A4()
{
  sub_244A57194();
  TC2LogCategory.rawValue.getter();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  return sub_244A571C4();
}

PrivateCloudCompute::TC2LogCategory_optional sub_244A3D104(Swift::String *a1)
{
  return TC2LogCategory.init(rawValue:)(*a1);
}

uint64_t sub_244A3D110@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = TC2LogCategory.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t tc2Logger(forCategory:)()
{
  TC2LogCategory.rawValue.getter();
  return sub_244A56CCC();
}

unint64_t sub_244A3D190()
{
  unint64_t result;

  result = qword_2573C3C38;
  if (!qword_2573C3C38)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2LogCategory, &type metadata for TC2LogCategory);
    atomic_store(result, (unint64_t *)&qword_2573C3C38);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TC2LogCategory(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEF)
    goto LABEL_17;
  if (a2 + 17 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 17) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 17;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 17;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 17;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x12;
  v8 = v6 - 18;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2LogCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 17 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 17) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEE)
    return ((uint64_t (*)(void))((char *)&loc_244A3D2B0 + 4 * byte_244A5C7D7[v4]))();
  *a1 = a2 + 17;
  return ((uint64_t (*)(void))((char *)sub_244A3D2E4 + 4 * byte_244A5C7D2[v4]))();
}

uint64_t sub_244A3D2E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A3D2EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A3D2F4);
  return result;
}

uint64_t sub_244A3D300(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A3D308);
  *(_BYTE *)result = a2 + 17;
  return result;
}

uint64_t sub_244A3D30C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A3D314(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2LogCategory()
{
  return &type metadata for TC2LogCategory;
}

uint64_t sub_244A3D330()
{
  uint64_t v0;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  type metadata accessor for TrustedCloudComputeError(0);
  sub_244A14624(&qword_2573C3DB8, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
  v0 = sub_244A56B4C();
  swift_release();
  return v0;
}

uint64_t sub_244A3D4AC()
{
  uint64_t v0;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  type metadata accessor for TrustedCloudComputeRateLimit();
  sub_244A14624(&qword_2573C3DB0, (uint64_t (*)(uint64_t))type metadata accessor for TrustedCloudComputeRateLimit, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeRateLimit);
  v0 = sub_244A56B4C();
  swift_release();
  return v0;
}

uint64_t sub_244A3D628()
{
  uint64_t v0;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3548);
  sub_244A3FE90();
  v0 = sub_244A56B4C();
  swift_release();
  return v0;
}

uint64_t sub_244A3D790()
{
  uint64_t v0;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  sub_244A4011C();
  v0 = sub_244A56B4C();
  swift_release();
  return v0;
}

uint64_t sub_244A3D8F4()
{
  uint64_t v0;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  sub_244A3FE4C();
  v0 = sub_244A56B4C();
  swift_release();
  return v0;
}

uint64_t sub_244A3DA74()
{
  uint64_t v0;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  type metadata accessor for TC2TrustedRequestMetadata();
  sub_244A14624(&qword_2573C3D98, (uint64_t (*)(uint64_t))type metadata accessor for TC2TrustedRequestMetadata, (uint64_t)&protocol conformance descriptor for TC2TrustedRequestMetadata);
  v0 = sub_244A56B4C();
  swift_release();
  return v0;
}

uint64_t sub_244A3DBF0(uint64_t a1)
{
  return sub_244A3DC48(a1, (void (*)(void))sub_244A3FE08);
}

uint64_t sub_244A3DC1C(uint64_t a1)
{
  return sub_244A3DC48(a1, (void (*)(void))sub_244A3FDC4);
}

uint64_t sub_244A3DC48(uint64_t a1, void (*a2)(void))
{
  uint64_t v3;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  a2();
  v3 = sub_244A56B4C();
  swift_release();
  return v3;
}

uint64_t sub_244A3DDAC()
{
  uint64_t v0;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  type metadata accessor for TC2RequestState();
  sub_244A14624(&qword_2573C3D80, (uint64_t (*)(uint64_t))type metadata accessor for TC2RequestState, (uint64_t)&protocol conformance descriptor for TC2RequestState);
  v0 = sub_244A56B4C();
  swift_release();
  return v0;
}

uint64_t TrustedCloudComputeClient.__allocating_init(configuration:)(unsigned int *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  TrustedCloudComputeClient.init(configuration:)(a1);
  return v2;
}

uint64_t TrustedCloudComputeClient.init(configuration:)(unsigned int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v2 = v1;
  v4 = sub_244A56CD8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *((_BYTE *)a1 + 4);
  v9 = *a1;
  sub_244A56CCC();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v5 + 32))(v2 + OBJC_IVAR____TtC19PrivateCloudCompute25TrustedCloudComputeClient_logger, v7, v4);
  type metadata accessor for TC2Client();
  v10 = swift_allocObject();
  type metadata accessor for XPCWrapper();
  swift_allocObject();
  v13[12] = v8;
  *(_QWORD *)(v10 + 16) = sub_244A40F70(v9 | ((unint64_t)v8 << 32));
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19PrivateCloudCompute25TrustedCloudComputeClient_client) = v10;
  v11 = v2 + OBJC_IVAR____TtC19PrivateCloudCompute25TrustedCloudComputeClient_configuration;
  *(_DWORD *)v11 = v9;
  *(_BYTE *)(v11 + 4) = v8;
  return v2;
}

uint64_t TrustedCloudComputeClient.withTrustedRequest<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v5[17] = type metadata accessor for TrustedRequest();
  v5[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244A3E120()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;

  sub_244A1581C(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 144), (uint64_t (*)(_QWORD))type metadata accessor for TrustedRequest);
  v1 = sub_244A56CC0();
  v2 = sub_244A56E70();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 144);
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v19 = v5;
    *(_DWORD *)v4 = 136315138;
    sub_244A56C9C();
    sub_244A14624(&qword_2573C3C60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v6 = sub_244A570F8();
    *(_QWORD *)(v0 + 88) = sub_244A564F0(v6, v7, &v19);
    sub_244A56EC4();
    swift_bridgeObjectRelease();
    sub_244A15860(v3, (uint64_t (*)(_QWORD))type metadata accessor for TrustedRequest);
    _os_log_impl(&dword_244A12000, v1, v2, "%s starting trusted request", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951D420](v5, -1, -1);
    MEMORY[0x24951D420](v4, -1, -1);

  }
  else
  {
    v8 = *(_QWORD *)(v0 + 144);

    sub_244A15860(v8, (uint64_t (*)(_QWORD))type metadata accessor for TrustedRequest);
  }
  v9 = *(int **)(v0 + 136);
  v10 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 152) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 128)
                                                + OBJC_IVAR____TtC19PrivateCloudCompute25TrustedCloudComputeClient_client)
                                    + 16);
  if (*(_QWORD *)(v10 + v9[6]))
  {
    swift_retain();
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    swift_bridgeObjectRetain();
    sub_244A2D130(MEMORY[0x24BEE4AF8]);
    v9 = *(int **)(v0 + 136);
    v10 = *(_QWORD *)(v0 + 104);
  }
  swift_bridgeObjectRetain();
  v11 = sub_244A3D790();
  v13 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 160) = v11;
  *(_QWORD *)(v0 + 168) = v13;
  v14 = (_QWORD *)(v10 + v9[7]);
  *(_QWORD *)(v0 + 176) = *v14;
  *(_QWORD *)(v0 + 184) = v14[1];
  v15 = (_QWORD *)(v10 + v9[8]);
  *(_QWORD *)(v0 + 192) = *v15;
  *(_QWORD *)(v0 + 200) = v15[1];
  v16 = (_QWORD *)(v10 + v9[9]);
  *(_QWORD *)(v0 + 208) = *v16;
  *(_QWORD *)(v0 + 216) = v16[1];
  *(_DWORD *)(v0 + 312) = v9[10];
  type metadata accessor for XPCWrapper();
  *(_QWORD *)(v0 + 224) = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  *(_QWORD *)(v0 + 232) = sub_244A56DF8();
  *(_QWORD *)(v0 + 240) = v17;
  return swift_task_switch();
}

void sub_244A3E41C()
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
  _QWORD *v10;
  __int128 v11;
  __int128 v12;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 216);
    v4 = *(_QWORD *)(v0 + 208);
    v11 = *(_OWORD *)(v0 + 176);
    v12 = *(_OWORD *)(v0 + 192);
    v6 = *(_QWORD *)(v0 + 160);
    v5 = *(_QWORD *)(v0 + 168);
    v7 = *(_QWORD *)(v0 + 104);
    v8 = v7 + *(int *)(v0 + 312);
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v9 = swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v9;
    *(_QWORD *)(v9 + 16) = v1;
    *(_QWORD *)(v9 + 24) = v2;
    *(_QWORD *)(v9 + 32) = v6;
    *(_QWORD *)(v9 + 40) = v5;
    *(_QWORD *)(v9 + 48) = v7;
    *(_OWORD *)(v9 + 56) = v11;
    *(_OWORD *)(v9 + 72) = v12;
    *(_QWORD *)(v9 + 88) = v4;
    *(_QWORD *)(v9 + 96) = v3;
    *(_QWORD *)(v9 + 104) = v8;
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB388);
    *v10 = v0;
    v10[1] = sub_244A3E53C;
    sub_244A57140();
  }
}

uint64_t sub_244A3E53C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 264) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A3E5A8()
{
  _QWORD *v0;
  uint64_t v1;

  sub_244A26E1C(v0[20], v0[21]);
  v1 = v0[10];
  v0[34] = v0[9];
  v0[35] = v1;
  return swift_task_switch();
}

uint64_t sub_244A3E5EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  _QWORD *v6;
  int *v8;

  v1 = v0[34];
  v2 = v0[35];
  v3 = v0[19];
  v4 = (int *)v0[14];
  sub_244A56B40();
  swift_allocObject();
  swift_retain();
  swift_unknownObjectRetain();
  v5 = sub_244A56B34();
  v0[2] = v2;
  v0[36] = v5;
  v0[3] = v1;
  v0[4] = v3;
  v0[6] = v2;
  v0[5] = v5;
  v0[7] = v1;
  v0[8] = v3;
  v8 = (int *)((char *)v4 + *v4);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = (_QWORD *)swift_task_alloc();
  v0[37] = v6;
  *v6 = v0;
  v6[1] = sub_244A3E6D4;
  return ((uint64_t (*)(_QWORD, _QWORD *, _QWORD *))v8)(v0[12], v0 + 2, v0 + 6);
}

uint64_t sub_244A3E6D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A3E738()
{
  uint64_t v0;

  sub_244A26E1C(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A3E78C()
{
  uint64_t v0;

  sub_244A3E874(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
  swift_unknownObjectRelease_n();
  swift_release_n();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A3E800()
{
  uint64_t v0;

  sub_244A3E874(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
  swift_unknownObjectRelease_n();
  swift_release_n();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_244A3E874(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = type metadata accessor for TrustedRequest();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244A1581C(a2, (uint64_t)v5, v6);
  v7 = sub_244A56CC0();
  v8 = sub_244A56E70();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    sub_244A56C9C();
    sub_244A14624(&qword_2573C3C60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v11 = sub_244A570F8();
    v13 = sub_244A564F0(v11, v12, &v14);
    sub_244A56EC4();
    swift_bridgeObjectRelease();
    sub_244A15860((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for TrustedRequest);
    _os_log_impl(&dword_244A12000, v7, v8, "%s finished trusted request", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951D420](v10, -1, -1);
    MEMORY[0x24951D420](v9, -1, -1);

  }
  else
  {

    sub_244A15860((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for TrustedRequest);
  }
}

uint64_t TrustedCloudComputeClient.trustedRequestHistory()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[3] = a1;
  v2[4] = v1;
  v2[5] = *(_QWORD *)(type metadata accessor for TC2TrustedRequestMetadata() - 8);
  v2[6] = swift_task_alloc();
  v2[7] = *(_QWORD *)(type metadata accessor for TrustedRequestHistory.Request() - 8);
  v2[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244A3EADC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_244A3EB40;
  return TC2Client.requestMetadata()(v0 + 16);
}

uint64_t sub_244A3EB40()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A3EB94()
{
  _QWORD *v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  unint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  char v23;

  result = v0[2];
  if (!result)
  {
    type metadata accessor for TrustedCloudComputeError(0);
    sub_244A14624(&qword_2573C3C70, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
    swift_allocError();
    TrustedCloudComputeError.init(file:line:message:)(0xD00000000000001DLL, 0x8000000244A5F6D0, v14);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  v20 = *(_QWORD *)(result + 16);
  if (!v20)
  {
    v4 = MEMORY[0x24BEE4AF8];
LABEL_16:
    v16 = (unint64_t *)v0[3];
    swift_bridgeObjectRelease();
    *v16 = v4;
    swift_task_dealloc();
    swift_task_dealloc();
    v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  v2 = 0;
  v3 = v0[7];
  v17 = v0[5];
  v4 = MEMORY[0x24BEE4AF8];
  v19 = result + 32;
  v18 = v0[2];
  while (v2 < *(_QWORD *)(result + 16))
  {
    v5 = *(_QWORD *)(v19 + 8 * v2);
    v6 = *(_QWORD *)(v5 + 16);
    if (v6)
    {
      v21 = v2;
      v7 = v5 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
      swift_bridgeObjectRetain();
      v8 = *(_QWORD *)(v17 + 72);
      do
      {
        v9 = v0[8];
        v10 = v0[6];
        sub_244A1581C(v7, v10, (uint64_t (*)(_QWORD))type metadata accessor for TC2TrustedRequestMetadata);
        v22 = 0;
        v23 = 1;
        sub_244A3EE24(v10, &v22, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_244A24B0C(0, *(_QWORD *)(v4 + 16) + 1, 1, v4);
        v12 = *(_QWORD *)(v4 + 16);
        v11 = *(_QWORD *)(v4 + 24);
        if (v12 >= v11 >> 1)
          v4 = sub_244A24B0C(v11 > 1, v12 + 1, 1, v4);
        v13 = v0[8];
        *(_QWORD *)(v4 + 16) = v12 + 1;
        sub_244A1AAC0(v13, v4+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v12, (uint64_t (*)(_QWORD))type metadata accessor for TrustedRequestHistory.Request);
        v7 += v8;
        --v6;
      }
      while (v6);
      swift_bridgeObjectRelease();
      result = v18;
      v2 = v21;
    }
    if (++v2 == v20)
      goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_244A3EE24@<X0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  int v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int64_t v65;
  uint64_t result;
  uint64_t v67;
  unsigned __int8 *v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int64_t v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  int v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  int *v94;
  uint64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD *v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  int64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[7];
  uint64_t v147;

  v115 = a3;
  v5 = sub_244A56C78();
  v132 = *(_QWORD *)(v5 - 8);
  v133 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v131 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v145 = v9;
  v10 = sub_244A56C9C();
  v11 = *(_QWORD *)(v10 - 8);
  v140 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v109 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v144 = v13;
  v14 = (int *)type metadata accessor for TrustedRequest();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v109 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v130 = (uint64_t)&v109 - v18;
  v113 = *a2;
  v112 = *((unsigned __int8 *)a2 + 4);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v19 = (int *)type metadata accessor for TC2TrustedRequestMetadata();
  v20 = (_QWORD *)(a1 + v19[11]);
  *(_QWORD *)&v143 = *v20;
  v22 = v20[1];
  v21 = v20[2];
  v141 = v22;
  *(_QWORD *)&v142 = v21;
  v23 = v19[8];
  v24 = (uint64_t *)(a1 + v19[7]);
  v25 = *v24;
  v136 = v24[1];
  v137 = v25;
  v26 = a1 + v23;
  v27 = *(_QWORD *)(a1 + v23);
  v138 = *(_QWORD *)(v26 + 8);
  v139 = v27;
  sub_244A3FF0C(a1 + v19[9], (uint64_t)v9);
  v135 = v14[6];
  v28 = &v17[v14[7]];
  v29 = &v17[v14[8]];
  *(_QWORD *)v29 = 0;
  *((_QWORD *)v29 + 1) = 0;
  v30 = &v17[v14[9]];
  v31 = (uint64_t)&v17[v14[10]];
  v32 = v11;
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v34 = v140;
  v33(v31, 1, 1, v140);
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 32))(v17, v144, v34);
  v35 = &v17[v14[5]];
  v36 = v141;
  v37 = v142;
  *(_QWORD *)v35 = v143;
  *((_QWORD *)v35 + 1) = v36;
  v38 = v136;
  *(_QWORD *)&v17[v135] = v37;
  v39 = v138;
  *(_QWORD *)v28 = v137;
  *((_QWORD *)v28 + 1) = v38;
  *(_QWORD *)v30 = v139;
  *((_QWORD *)v30 + 1) = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_244A3FF54(v145, v31);
  sub_244A1AAC0((uint64_t)v17, v130, (uint64_t (*)(_QWORD))type metadata accessor for TrustedRequest);
  (*(void (**)(char *, uint64_t, uint64_t))(v132 + 16))(v131, a1 + v19[6], v133);
  v40 = *v24;
  v41 = v24[1];
  v42 = (uint64_t *)(a1 + v19[10]);
  v43 = *v42;
  v44 = v42[1];
  v45 = (uint64_t *)(a1 + v19[12]);
  v46 = *v45;
  v47 = v45[1];
  v48 = (uint64_t *)(a1 + v19[13]);
  v49 = *v48;
  v50 = v48[1];
  v51 = (uint64_t *)(a1 + v19[14]);
  v52 = *v51;
  v53 = v51[1];
  v54 = (uint64_t *)(a1 + v19[15]);
  v55 = *v54;
  v56 = *((unsigned __int8 *)v54 + 8);
  v57 = (uint64_t *)(a1 + v19[5]);
  v58 = *v57;
  v59 = v57[1];
  v60 = v19[17];
  v61 = (uint64_t *)(a1 + v19[16]);
  v62 = *v61;
  v63 = v61[1];
  v114 = a1;
  v64 = *(_QWORD *)(a1 + v60);
  v65 = *(_QWORD *)(v64 + 16);
  v129 = v40;
  v128 = v43;
  v127 = v50;
  v126 = v56;
  v125 = v58;
  v124 = v59;
  v123 = v49;
  v122 = v55;
  v121 = v47;
  v120 = v53;
  v119 = v63;
  v118 = v46;
  v117 = v52;
  v116 = v62;
  if (v65)
  {
    v147 = MEMORY[0x24BEE4AF8];
    v111 = v41;
    swift_bridgeObjectRetain();
    v110 = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_244A3FF9C(0, v65, 0);
    v67 = v147;
    v109 = v64;
    v68 = (unsigned __int8 *)(v64 + 152);
    while (1)
    {
      v69 = *((_QWORD *)v68 - 11);
      v70 = *(_OWORD *)(v68 - 72);
      if ((*((_QWORD *)v68 - 9) | v69) < 0)
        break;
      v135 = v65;
      v145 = v70;
      v71 = *((_QWORD *)v68 - 14);
      v139 = *((_QWORD *)v68 - 15);
      v72 = *((_QWORD *)v68 - 12);
      v137 = *((_QWORD *)v68 - 13);
      v138 = v71;
      LODWORD(v140) = *(v68 - 80);
      v73 = *(_OWORD *)(v68 - 56);
      v74 = *(_OWORD *)(v68 - 40);
      v75 = *(_OWORD *)(v68 - 24);
      v76 = *((_QWORD *)v68 - 1);
      LODWORD(v141) = *v68;
      v143 = v74;
      v144 = v73;
      v142 = v75;
      v77 = *(_QWORD *)(v67 + 16);
      v134 = *(_QWORD *)(v67 + 24);
      v147 = v67;
      v78 = v67;
      swift_bridgeObjectRetain();
      v136 = v72;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRetain();
      v67 = v78;
      if (v77 >= v134 >> 1)
      {
        result = sub_244A3FF9C(v134 > 1, v77 + 1, 1);
        v67 = v147;
      }
      v68 += 128;
      *(_QWORD *)(v67 + 16) = v77 + 1;
      v79 = v67 + (v77 << 7);
      v80 = v138;
      *(_QWORD *)(v79 + 32) = v139;
      *(_QWORD *)(v79 + 40) = v80;
      v82 = v135;
      v81 = v136;
      *(_QWORD *)(v79 + 48) = v137;
      *(_QWORD *)(v79 + 56) = v81;
      *(_QWORD *)(v79 + 64) = v69;
      *(_BYTE *)(v79 + 72) = v140;
      LODWORD(v81) = *(_DWORD *)&v146[3];
      *(_DWORD *)(v79 + 73) = *(_DWORD *)v146;
      *(_DWORD *)(v79 + 76) = v81;
      v83 = v144;
      *(_OWORD *)(v79 + 80) = v145;
      *(_OWORD *)(v79 + 96) = v83;
      v84 = v142;
      *(_OWORD *)(v79 + 112) = v143;
      *(_OWORD *)(v79 + 128) = v84;
      *(_QWORD *)(v79 + 144) = v76;
      *(_BYTE *)(v79 + 152) = v141;
      v65 = v82 - 1;
      if (!v65)
      {
        v85 = v115;
        v87 = v132;
        v86 = v133;
        v88 = v131;
        v89 = v114;
        v90 = v113;
        v91 = v112;
        v92 = v130;
        v41 = v111;
        v93 = v110;
        *(_QWORD *)&v145 = v67;
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    *(_QWORD *)&v145 = MEMORY[0x24BEE4AF8];
    v93 = v44;
    v85 = v115;
    v87 = v132;
    v86 = v133;
    v88 = v131;
    v89 = v114;
    v90 = v113;
    v91 = v112;
    v92 = v130;
LABEL_9:
    sub_244A15860(v89, (uint64_t (*)(_QWORD))type metadata accessor for TC2TrustedRequestMetadata);
    swift_bridgeObjectRelease();
    sub_244A1AAC0(v92, v85, (uint64_t (*)(_QWORD))type metadata accessor for TrustedRequest);
    v94 = (int *)type metadata accessor for TrustedRequestHistory.Request();
    v95 = v85 + v94[5];
    *(_DWORD *)v95 = v90;
    *(_BYTE *)(v95 + 4) = v91;
    result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v87 + 32))(v85 + v94[6], v88, v86);
    v96 = (_QWORD *)(v85 + v94[7]);
    *v96 = v129;
    v96[1] = v41;
    v97 = (_QWORD *)(v85 + v94[8]);
    *v97 = v128;
    v97[1] = v93;
    v98 = (_QWORD *)(v85 + v94[9]);
    v99 = v121;
    *v98 = v118;
    v98[1] = v99;
    v100 = (_QWORD *)(v85 + v94[10]);
    v101 = v127;
    *v100 = v123;
    v100[1] = v101;
    v102 = (_QWORD *)(v85 + v94[11]);
    v103 = v120;
    *v102 = v117;
    v102[1] = v103;
    v104 = v85 + v94[12];
    *(_QWORD *)v104 = v122;
    *(_BYTE *)(v104 + 8) = v126;
    v105 = (_QWORD *)(v85 + v94[13]);
    v106 = v124;
    *v105 = v125;
    v105[1] = v106;
    v107 = (_QWORD *)(v85 + v94[14]);
    v108 = v119;
    *v107 = v116;
    v107[1] = v108;
    *(_QWORD *)(v85 + v94[15]) = v145;
  }
  return result;
}

uint64_t TrustedCloudComputeClient.prefetchRequest(workloadType:workloadParameters:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  return swift_task_switch();
}

uint64_t sub_244A3F5C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[7];
  v2 = v0[6];
  v0[2] = v0[5];
  v0[3] = v2;
  v0[4] = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[9] = v3;
  *v3 = v0;
  v3[1] = sub_244A3F664;
  return TC2Client.prewarm(request:bundleIdentifier:featureIdentifier:)((uint64_t)(v0 + 2), 0, 0, 0xD000000000000017, 0x8000000244A5F6F0);
}

uint64_t sub_244A3F664()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(1);
}

uint64_t TrustedCloudComputeClient.prewarm(workloadType:workloadParameters:bundleIdentifierOverride:featureIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[11] = a7;
  v8[12] = v7;
  v8[9] = a5;
  v8[10] = a6;
  v8[7] = a3;
  v8[8] = a4;
  v8[5] = a1;
  v8[6] = a2;
  return swift_task_switch();
}

uint64_t sub_244A3F6EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[6];
  v0[2] = v0[5];
  v2 = v0[7];
  v0[3] = v1;
  v0[4] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[13] = v3;
  *v3 = v0;
  v3[1] = sub_244A3F77C;
  return TC2Client.prewarm(request:bundleIdentifier:featureIdentifier:)((uint64_t)(v0 + 2), v0[8], v0[9], v0[10], v0[11]);
}

uint64_t sub_244A3F77C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t TrustedCloudComputeClient.prefetch(request:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = v1;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_244A3F800()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v2;
  *v2 = v0;
  v2[1] = sub_244A2CDF4;
  return sub_244A40364(v0 + 16, v3);
}

uint64_t TrustedCloudComputeClient.prefetchParametersCache()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_244A3F888()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_244A40160;
  return TC2Client.prefetchParametersCache()();
}

uint64_t TrustedCloudComputeClient.prefetchParametersCacheSavedState()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_244A3F8F8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_244A40160;
  return TC2Client.prefetchParametersCacheSavedState()();
}

uint64_t TrustedCloudComputeClient.prefetchCacheReset()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_244A3F968()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_244A3F9C0;
  return TC2Client.prefetchCacheReset()();
}

uint64_t sub_244A3F9C0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t TrustedCloudComputeClient.prefetchCache()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_244A3FA28()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_244A3F9C0;
  return TC2Client.prefetchCache()();
}

uint64_t TrustedCloudComputeClient.knownRateLimits(bundleIdentifier:featureIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_244A3FAA0()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_244A3FB08;
  return TC2Client.knownRateLimits(bundleIdentifier:featureIdentifier:skipFetch:)(v0[2], v0[3], v0[4], v0[5], 0);
}

uint64_t sub_244A3FB08(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t TrustedCloudComputeClient.knownRateLimits(bundleIdentifier:featureIdentifier:skipFetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 40) = a4;
  *(_QWORD *)(v6 + 48) = v5;
  *(_BYTE *)(v6 + 64) = a5;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_244A3FB7C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_244A3FB08;
  return TC2Client.knownRateLimits(bundleIdentifier:featureIdentifier:skipFetch:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 64));
}

uint64_t TrustedCloudComputeClient.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19PrivateCloudCompute25TrustedCloudComputeClient_logger;
  v2 = sub_244A56CD8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t TrustedCloudComputeClient.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19PrivateCloudCompute25TrustedCloudComputeClient_logger;
  v2 = sub_244A56CD8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

void sub_244A3FC98(uint64_t a1)
{
  uint64_t v1;

  sub_244A41CBC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(void **)(v1 + 64), *(_QWORD *)(v1 + 72), *(void **)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

uint64_t sub_244A3FCD8()
{
  return type metadata accessor for TrustedCloudComputeClient();
}

uint64_t type metadata accessor for TrustedCloudComputeClient()
{
  uint64_t result;

  result = qword_2573C3CE8;
  if (!qword_2573C3CE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_244A3FD1C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244A56CD8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for TrustedCloudComputeClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TrustedCloudComputeClient.__allocating_init(configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

unint64_t sub_244A3FDC4()
{
  unint64_t result;

  result = qword_2573C3D88;
  if (!qword_2573C3D88)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2TrustedRequestFactoriesMetadata, &type metadata for TC2TrustedRequestFactoriesMetadata);
    atomic_store(result, (unint64_t *)&qword_2573C3D88);
  }
  return result;
}

unint64_t sub_244A3FE08()
{
  unint64_t result;

  result = qword_2573C3D90;
  if (!qword_2573C3D90)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2TrustedRequestFactoryMetadata, &type metadata for TC2TrustedRequestFactoryMetadata);
    atomic_store(result, (unint64_t *)&qword_2573C3D90);
  }
  return result;
}

unint64_t sub_244A3FE4C()
{
  unint64_t result;

  result = qword_2573C3DA0;
  if (!qword_2573C3DA0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2TrustedRequestEndpointMetadata, &type metadata for TC2TrustedRequestEndpointMetadata);
    atomic_store(result, (unint64_t *)&qword_2573C3DA0);
  }
  return result;
}

unint64_t sub_244A3FE90()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2573C3DA8;
  if (!qword_2573C3DA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573C3548);
    v2 = sub_244A14624(&qword_2573C3DB0, (uint64_t (*)(uint64_t))type metadata accessor for TrustedCloudComputeRateLimit, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeRateLimit);
    result = MEMORY[0x24951D378](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2573C3DA8);
  }
  return result;
}

uint64_t sub_244A3FF0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244A3FF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_244A3FF9C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244A3FFB8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244A3FFB8(char a1, int64_t a2, char a3, char *a4)
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
  size_t v15;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DC0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 95;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 7);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = v8 << 7;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244A56FA8();
  __break(1u);
  return result;
}

unint64_t sub_244A4011C()
{
  unint64_t result;

  result = qword_2573C3DC8;
  if (!qword_2573C3DC8)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2RequestParameters, &type metadata for TC2RequestParameters);
    atomic_store(result, (unint64_t *)&qword_2573C3DC8);
  }
  return result;
}

uint64_t dispatch thunk of TC2StreamingMessageDeframer.receive(bytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of TC2StreamingMessageDeframer.finish()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_244A40194()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_244A56CE4();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244A56CFC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(_QWORD *)(v1 + 32);
  aBlock[4] = sub_244A47BC8;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A41C18;
  aBlock[3] = &block_descriptor_117;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_244A56CF0();
  v13[1] = MEMORY[0x24BEE4AF8];
  sub_244A47C4C(&qword_2543FB390, 255, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB398);
  sub_244A47C8C(&qword_2543FB3A0, &qword_2543FB398);
  sub_244A56EE8();
  MEMORY[0x24951CCD0](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_244A40364(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 40) = v2;
  *(_OWORD *)(v3 + 48) = *(_OWORD *)a1;
  *(_QWORD *)(v3 + 64) = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v3 + 72) = sub_244A47C4C(&qword_2543FB378, a2, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  *(_QWORD *)(v3 + 80) = sub_244A56DF8();
  *(_QWORD *)(v3 + 88) = v4;
  return swift_task_switch();
}

void sub_244A403E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v1 + 16);
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 64);
    v6 = *(_OWORD *)(v0 + 48);
    *(_QWORD *)(v1 + 16) = v2 + 1;
    v4 = swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v4;
    *(_QWORD *)(v4 + 16) = v1;
    *(_QWORD *)(v4 + 24) = v2;
    *(_OWORD *)(v4 + 32) = v6;
    *(_QWORD *)(v4 + 48) = v3;
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
    *v5 = v0;
    v5[1] = sub_244A404D0;
    sub_244A57140();
  }
}

uint64_t sub_244A404D0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A4053C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >> 60 == 15)
  {
    v2 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 16);
    v4 = *(_QWORD *)(v0 + 112);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3E18);
    sub_244A26DC4(v3, v1);
    sub_244A47AC8();
    sub_244A56B28();
    sub_244A26E08(v3, v1);
    sub_244A26E08(v3, v1);
    if (v4)
      return (*(uint64_t (**)(void))(v0 + 8))();
    v2 = *(_QWORD *)(v0 + 32);
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_244A40630()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A40664(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = sub_244A47C4C(&qword_2543FB378, a2, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  v3[8] = sub_244A56DF8();
  v3[9] = v4;
  return swift_task_switch();
}

void sub_244A406D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 48);
  if (*(_QWORD *)(v1 + 56) == *(_QWORD *)(v0 + 32))
  {
    v2 = *(_QWORD *)(v1 + 16);
    if (__OFADD__(v2, 1))
    {
      __break(1u);
    }
    else
    {
      v3 = *(_QWORD *)(v0 + 40);
      *(_QWORD *)(v1 + 16) = v2 + 1;
      v4 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 80) = v4;
      v4[2] = v1;
      v4[3] = v2;
      v4[4] = v3;
      v5 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v5;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
      *v5 = v0;
      v5[1] = sub_244A40870;
      sub_244A57140();
    }
  }
  else
  {
    type metadata accessor for TrustedCloudComputeError(0);
    sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
    swift_allocError();
    *(_QWORD *)v6 = 0xD000000000000016;
    *(_QWORD *)(v6 + 8) = 0x8000000244A5E1C0;
    *(_BYTE *)(v6 + 16) = 1;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(void))(v0 + 8))();
  }
}

uint64_t sub_244A40870()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A408DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_244A408EC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A40920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 40) = a4;
  *(_QWORD *)(v6 + 48) = v5;
  *(_BYTE *)(v6 + 104) = a5;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 56) = sub_244A47C4C(&qword_2543FB378, a2, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
  *(_QWORD *)(v6 + 64) = sub_244A56DF8();
  *(_QWORD *)(v6 + 72) = v7;
  return swift_task_switch();
}

void sub_244A4099C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;

  v1 = *(_QWORD *)(v0 + 48);
  if (*(_QWORD *)(v1 + 56) == *(_QWORD *)(v0 + 16))
  {
    v2 = *(_QWORD *)(v1 + 16);
    if (__OFADD__(v2, 1))
    {
      __break(1u);
    }
    else
    {
      v3 = *(_BYTE *)(v0 + 104);
      v4 = *(_QWORD *)(v0 + 40);
      v8 = *(_OWORD *)(v0 + 24);
      *(_QWORD *)(v1 + 16) = v2 + 1;
      v5 = swift_task_alloc();
      *(_QWORD *)(v0 + 80) = v5;
      *(_QWORD *)(v5 + 16) = v1;
      *(_QWORD *)(v5 + 24) = v2;
      *(_OWORD *)(v5 + 32) = v8;
      *(_QWORD *)(v5 + 48) = v4;
      *(_BYTE *)(v5 + 56) = v3;
      v6 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v6;
      *v6 = v0;
      v6[1] = sub_244A40B3C;
      sub_244A57140();
    }
  }
  else
  {
    type metadata accessor for TrustedCloudComputeError(0);
    sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
    swift_allocError();
    *(_QWORD *)v7 = 0xD000000000000016;
    *(_QWORD *)(v7 + 8) = 0x8000000244A5E1C0;
    *(_BYTE *)(v7 + 16) = 1;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(void))(v0 + 8))();
  }
}

uint64_t sub_244A40B3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A40BA8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_244A40BB4(uint64_t a1)
{
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
  uint64_t (*v14)(_QWORD);
  char *v15;
  _QWORD v16[16];

  v16[14] = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF8);
  v16[11] = *(_QWORD *)(v1 - 8);
  v16[12] = v1;
  MEMORY[0x24BDAC7A8](v1);
  v16[10] = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF0);
  v16[8] = *(_QWORD *)(v3 - 8);
  v16[9] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v16[7] = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3D8);
  v16[5] = *(_QWORD *)(v5 - 8);
  v16[6] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v16[4] = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE8);
  v16[2] = *(_QWORD *)(v7 - 8);
  v16[3] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v16[1] = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE0);
  v16[0] = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD8);
  MEMORY[0x24BDAC7A8](v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD0);
  MEMORY[0x24BDAC7A8](v11);
  v12 = type metadata accessor for XPCWrapper.Continuation();
  MEMORY[0x24BDAC7A8](v12);
  sub_244A1581C(v16[13], (uint64_t)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  v15 = (char *)sub_244A40E04 + 4 * byte_244A5C980[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_244A40E04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v0, v2, v1);
  *(_QWORD *)(v4 - 88) = *(_QWORD *)(v4 - 96);
  MEMORY[0x24951D2DC]();
  sub_244A56E04();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
}

uint64_t sub_244A40F70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  _QWORD aBlock[7];

  v2 = v1;
  v21 = sub_244A56E7C();
  v4 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244A56E94();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_244A56CFC();
  MEMORY[0x24BDAC7A8](v9);
  *(_OWORD *)(v1 + 16) = xmmword_244A5CA40;
  sub_244A56B40();
  swift_allocObject();
  *(_QWORD *)(v1 + 40) = sub_244A56B34();
  *(_QWORD *)(v1 + 56) = 0;
  v10 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 80) = sub_244A2ECB4(MEMORY[0x24BEE4AF8]);
  *(_DWORD *)(v2 + 48) = a1;
  *(_BYTE *)(v2 + 52) = BYTE4(a1) & 1;
  sub_244A47C10();
  sub_244A56CF0();
  aBlock[0] = v10;
  sub_244A47C4C(&qword_2543FB408, 255, v8, MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3B0);
  sub_244A47C8C(&qword_2543FB3B8, &qword_2543FB3B0);
  sub_244A56EE8();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5758], v21);
  *(_QWORD *)(v2 + 32) = sub_244A56EA0();
  v11 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v12 = (void *)sub_244A56D2C();
  v13 = objc_msgSend(v11, sel_initWithMachServiceName_options_, v12, 0);

  objc_msgSend(v13, sel__setQueue_, *(_QWORD *)(v2 + 32));
  v14 = (void *)objc_opt_self();
  v15 = objc_msgSend(v14, sel_interfaceWithProtocol_, &unk_2573D17D0);
  v16 = objc_msgSend(v14, sel_interfaceWithProtocol_, &unk_2573D1770);
  objc_msgSend(v15, sel_setInterface_forSelector_argumentIndex_ofReply_, v16, sel_trustedRequestWithParameters_requestID_bundleIdentifier_originatingBundleIdentifier_featureIdentifier_sessionIdentifier_completion_, 0, 1);

  objc_msgSend(v13, sel_setRemoteObjectInterface_, v15);
  *(_QWORD *)(v2 + 64) = v13;
  v17 = v13;
  v18 = objc_msgSend(v17, sel_remoteObjectProxy);
  sub_244A56EDC();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB380);
  swift_dynamicCast();
  *(_QWORD *)(v2 + 72) = aBlock[6];
  aBlock[4] = sub_244A47CCC;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A41C18;
  aBlock[3] = &block_descriptor_120;
  v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_setInterruptionHandler_, v19);
  _Block_release(v19);
  objc_msgSend(v17, sel_resume);

  return v2;
}

void sub_244A41370()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  BOOL v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  int64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _QWORD aBlock[6];

  v1 = type metadata accessor for XPCWrapper.Continuation();
  v50 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3E30);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v44 - v8;
  v46 = (uint64_t *)(v0 + 80);
  swift_beginAccess();
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_QWORD *)(v10 + 64);
  v47 = v0;
  v48 = v10 + 64;
  v12 = 1 << *(_BYTE *)(v10 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v49 = (unint64_t)(v12 + 63) >> 6;
  v45 = v49 - 1;
  swift_bridgeObjectRetain();
  v15 = 0;
  v51 = 0x8000000244A5E1C0;
  if (!v14)
    goto LABEL_8;
LABEL_6:
  v18 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  v19 = v18 | (v15 << 6);
LABEL_7:
  v20 = *(_QWORD *)(v10 + 56);
  *v7 = *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v19);
  v21 = v20 + *(_QWORD *)(v50 + 72) * v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3E38);
  sub_244A1581C(v21, (uint64_t)v7 + *(int *)(v22 + 48), (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v7, 0, 1, v22);
  while (1)
  {
    sub_244A47D14((uint64_t)v7, (uint64_t)v9);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3E38);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v9, 1, v27) == 1)
      break;
    sub_244A1AAC0((uint64_t)&v9[*(int *)(v27 + 48)], (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    type metadata accessor for TrustedCloudComputeError(0);
    sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
    v16 = (void *)swift_allocError();
    *(_QWORD *)v17 = 0xD000000000000016;
    *(_QWORD *)(v17 + 8) = v51;
    *(_BYTE *)(v17 + 16) = 1;
    swift_storeEnumTagMultiPayload();
    sub_244A40BB4((uint64_t)v16);
    sub_244A15860((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);

    if (v14)
      goto LABEL_6;
LABEL_8:
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v23 < v49)
    {
      v24 = *(_QWORD *)(v48 + 8 * v23);
      if (v24)
        goto LABEL_11;
      v25 = v15 + 2;
      ++v15;
      if (v23 + 1 < v49)
      {
        v24 = *(_QWORD *)(v48 + 8 * v25);
        if (v24)
          goto LABEL_14;
        v15 = v23 + 1;
        if (v23 + 2 < v49)
        {
          v24 = *(_QWORD *)(v48 + 8 * (v23 + 2));
          if (v24)
          {
            v23 += 2;
            goto LABEL_11;
          }
          v25 = v23 + 3;
          v15 = v23 + 2;
          if (v23 + 3 < v49)
          {
            v24 = *(_QWORD *)(v48 + 8 * v25);
            if (!v24)
            {
              while (1)
              {
                v23 = v25 + 1;
                if (__OFADD__(v25, 1))
                  break;
                if (v23 >= v49)
                {
                  v15 = v45;
                  goto LABEL_25;
                }
                v24 = *(_QWORD *)(v48 + 8 * v23);
                ++v25;
                if (v24)
                  goto LABEL_11;
              }
LABEL_36:
              __break(1u);
              return;
            }
LABEL_14:
            v23 = v25;
LABEL_11:
            v14 = (v24 - 1) & v24;
            v19 = __clz(__rbit64(v24)) + (v23 << 6);
            v15 = v23;
            goto LABEL_7;
          }
        }
      }
    }
LABEL_25:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3E38);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v7, 1, 1, v26);
    v14 = 0;
  }
  swift_release();
  v28 = v46;
  swift_beginAccess();
  if (*(_QWORD *)(*v28 + 16))
  {
    swift_isUniquelyReferenced_nonNull_native();
    v52 = *v28;
    *v28 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3E40);
    sub_244A56F60();
    *v28 = v52;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  v29 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v30 = (void *)sub_244A56D2C();
  v31 = objc_msgSend(v29, sel_initWithMachServiceName_options_, v30, 0);

  v32 = v47;
  objc_msgSend(v31, sel__setQueue_, *(_QWORD *)(v47 + 32));
  v33 = (void *)objc_opt_self();
  v34 = objc_msgSend(v33, sel_interfaceWithProtocol_, &unk_2573D17D0);
  v35 = objc_msgSend(v33, sel_interfaceWithProtocol_, &unk_2573D1770);
  objc_msgSend(v34, sel_setInterface_forSelector_argumentIndex_ofReply_, v35, sel_trustedRequestWithParameters_requestID_bundleIdentifier_originatingBundleIdentifier_featureIdentifier_sessionIdentifier_completion_, 0, 1);

  objc_msgSend(v31, sel_setRemoteObjectInterface_, v34);
  aBlock[4] = sub_244A47D5C;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A41C18;
  aBlock[3] = &block_descriptor_123;
  v36 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v31, sel_setInterruptionHandler_, v36);
  _Block_release(v36);
  objc_msgSend(v31, sel_resume);
  v37 = *(void **)(v32 + 64);
  *(_QWORD *)(v32 + 64) = v31;
  v38 = *(_QWORD *)(v32 + 24);
  v39 = __OFADD__(v38, 1);
  v40 = v31;
  if (v39)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v41 = v40;
  *(_QWORD *)(v32 + 24) = v38 + 1;
  *(_QWORD *)(v32 + 56) = v38;
  v42 = objc_msgSend(v40, sel_remoteObjectProxy);
  sub_244A56EDC();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB380);
  swift_dynamicCast();
  *(_QWORD *)(v32 + 72) = v52;
  swift_unknownObjectRelease();
  objc_msgSend(v37, sel_setInterruptionHandler_, 0);
  objc_msgSend(v37, sel_setInvalidationHandler_, 0);
  objc_msgSend(v37, sel_invalidate);
  v43 = objc_msgSend(*(id *)(v32 + 64), sel_remoteObjectProxy);
  sub_244A56EDC();

  swift_unknownObjectRelease();
  swift_dynamicCast();
  *(_QWORD *)(v32 + 72) = v52;
  swift_unknownObjectRelease();
}

uint64_t sub_244A41A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char isEscapingClosureAtFileLocation;

  sub_244A56EAC();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    goto LABEL_6;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_244A46BD0;
  *(_QWORD *)(v6 + 24) = v5;
  swift_retain();
  sub_244A46BD0();
  if (v2)
  {
    swift_release();
    return swift_release();
  }
  swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_6:
    sub_244A56F0C();
    sub_244A56D68();
    sub_244A56F54();
    sub_244A56D68();
    result = sub_244A56F78();
    __break(1u);
  }
  return result;
}

id sub_244A41C1C(uint64_t a1)
{
  id result;

  result = (id)swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 80) + 16))
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), sel_invalidate);
    return objc_msgSend(*(id *)(a1 + 64), sel_setInterruptionHandler_, 0);
  }
  return result;
}

uint64_t sub_244A41C90(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_244A41CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  _QWORD aBlock[6];

  v36[1] = a7;
  v17 = a10;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v36 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v23, a1, v24);
  v25 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v23, 0, 1, v25);
  swift_beginAccess();
  v38 = a3;
  sub_244A460B8((uint64_t)v23, a3);
  swift_endAccess();
  v26 = *(void **)(a2 + 72);
  swift_unknownObjectRetain();
  v37 = sub_244A56BD0();
  v27 = (void *)sub_244A56C84();
  if (a8)
    a8 = (void *)sub_244A56D2C();
  if (a10)
    v17 = (void *)sub_244A56D2C();
  if (a12)
    v28 = (void *)sub_244A56D2C();
  else
    v28 = 0;
  sub_244A3FF0C(a13, (uint64_t)v20);
  v29 = sub_244A56C9C();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v20, 1, v29) != 1)
  {
    v31 = (void *)sub_244A56C84();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v29);
  }
  v32 = swift_allocObject();
  v33 = v38;
  *(_QWORD *)(v32 + 16) = a2;
  *(_QWORD *)(v32 + 24) = v33;
  aBlock[4] = sub_244A477CC;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A4292C;
  aBlock[3] = &block_descriptor_22;
  v34 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v35 = (void *)v37;
  objc_msgSend(v26, sel_trustedRequestWithParameters_requestID_bundleIdentifier_originatingBundleIdentifier_featureIdentifier_sessionIdentifier_completion_, v37, v27, a8, v17, v28, v31, v34);
  _Block_release(v34);
  swift_unknownObjectRelease();

}

void sub_244A41FB4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3530);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TrustedCloudComputeError(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v28 - v17;
  if (a3 >> 60 == 15)
  {
    if (a5)
    {
      v19 = *(_QWORD *)(a1 + 56);
      swift_unknownObjectRetain();
      sub_244A426E0(v29, a5, v19);
      swift_unknownObjectRelease();
      return;
    }
    v21 = 0x8000000244A5FB60;
    v22 = (uint64_t)v16;
    v20 = 0xD000000000000037;
    goto LABEL_8;
  }
  sub_244A26DC4(a2, a3);
  sub_244A2B484(a2, a3, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_244A2EBB0((uint64_t)v11, &qword_2573C3530);
    v20 = 0xD00000000000003FLL;
    v21 = 0x8000000244A5FA80;
    v22 = (uint64_t)v16;
LABEL_8:
    TrustedCloudComputeError.init(file:line:message:)(v20, v21, v22);
    sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
    v26 = swift_allocError();
    sub_244A1581C((uint64_t)v16, v27, type metadata accessor for TrustedCloudComputeError);
    sub_244A42268(v29, v26);
    sub_244A15860((uint64_t)v16, type metadata accessor for TrustedCloudComputeError);
    v25 = (void *)v26;
    goto LABEL_9;
  }
  sub_244A1AAC0((uint64_t)v11, (uint64_t)v18, type metadata accessor for TrustedCloudComputeError);
  sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
  v23 = swift_allocError();
  sub_244A1581C((uint64_t)v18, v24, type metadata accessor for TrustedCloudComputeError);
  sub_244A42268(v29, v23);
  sub_244A15860((uint64_t)v18, type metadata accessor for TrustedCloudComputeError);
  v25 = (void *)v23;
LABEL_9:

}

uint64_t sub_244A42268(uint64_t a1, uint64_t a2)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v24;
  _QWORD v25[2];
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v42 = a2;
  v43 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF8);
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF0);
  v37 = *(_QWORD *)(v4 - 8);
  v38 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v36 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE8);
  v34 = *(_QWORD *)(v6 - 8);
  v35 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v33 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3D8);
  v31 = *(_QWORD *)(v8 - 8);
  v32 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v30 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE0);
  v28 = *(_QWORD *)(v10 - 8);
  v29 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v27 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD8);
  v25[1] = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD0);
  MEMORY[0x24BDAC7A8](v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for XPCWrapper.Continuation();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v25 - v21;
  swift_beginAccess();
  sub_244A46290(v43, (uint64_t)v15);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
  {
    sub_244A1AAC0((uint64_t)v15, (uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    sub_244A1581C((uint64_t)v22, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    v24 = (char *)&loc_244A42584 + 4 * byte_244A5C987[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return sub_244A2EBB0((uint64_t)v15, &qword_2543FB370);
}

uint64_t sub_244A426E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v20 = a3;
  v21 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for XPCWrapper.Continuation();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v19 - v16;
  swift_beginAccess();
  sub_244A46290(a1, (uint64_t)v10);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return sub_244A2EBB0((uint64_t)v10, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v10, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v17, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload() <= 5)
  {
    sub_244A15860((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v15, v4);
    v22 = v21;
    v23 = v20;
    swift_unknownObjectRetain();
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return sub_244A15860((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  return result;
}

uint64_t sub_244A4292C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void (*v5)(uint64_t, void *, unint64_t);
  id v6;
  unint64_t v7;
  unint64_t v8;

  v3 = a3;
  v5 = *(void (**)(uint64_t, void *, unint64_t))(a1 + 32);
  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain();
    v6 = v3;
    v3 = (void *)sub_244A56BDC();
    v8 = v7;

  }
  else
  {
    swift_retain();
    swift_unknownObjectRetain();
    v8 = 0xF000000000000000;
  }
  v5(a2, v3, v8);
  swift_unknownObjectRelease();
  sub_244A26E08((uint64_t)v3, v8);
  return swift_release();
}

uint64_t sub_244A429CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3D8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A47848;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A42DCC;
  aBlock[3] = &block_descriptor_28;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_currentEnvironmentWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A42B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v22 = a4;
  v20 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3D8);
  v21 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for XPCWrapper.Continuation();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v20 - v16;
  swift_beginAccess();
  sub_244A46290(a2, (uint64_t)v10);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return sub_244A2EBB0((uint64_t)v10, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v10, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v17, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    v19 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v7, v15, v5);
    v23 = v20;
    v24 = v22;
    swift_bridgeObjectRetain();
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
    return sub_244A15860((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  else
  {
    sub_244A15860((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  return result;
}

uint64_t sub_244A42DCC(uint64_t a1)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = sub_244A56D38();
  v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A42E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A47B58;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A43200;
  aBlock[3] = &block_descriptor_114;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_requestMetadataWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A42FB4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v20 = a2;
  v21 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for XPCWrapper.Continuation();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v19 - v16;
  swift_beginAccess();
  sub_244A46290(a1, (uint64_t)v10);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return sub_244A2EBB0((uint64_t)v10, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v10, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v17, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v15, v4);
    v22 = v20;
    v23 = v21;
    sub_244A476E4(v20, v21);
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return sub_244A15860((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  else
  {
    sub_244A15860((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  return result;
}

uint64_t sub_244A43200(uint64_t a1, void *a2)
{
  void *v2;
  void (*v3)(void *, unint64_t);
  id v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a2;
  v3 = *(void (**)(void *, unint64_t))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v4 = v2;
    v2 = (void *)sub_244A56BDC();
    v6 = v5;

  }
  else
  {
    swift_retain();
    v6 = 0xF000000000000000;
  }
  v3(v2, v6);
  sub_244A26E08((uint64_t)v2, v6);
  return swift_release();
}

void sub_244A43280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[6];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, a1, v13);
  v14 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 0, 1, v14);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v12, a3);
  swift_endAccess();
  v15 = *(void **)(a2 + 72);
  swift_unknownObjectRetain();
  v16 = (void *)sub_244A56D2C();
  if (!a6)
    sub_244A2D130(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRetain();
  v17 = (void *)sub_244A56D08();
  swift_bridgeObjectRelease();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = a3;
  aBlock[4] = sub_244A47B48;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A43200;
  aBlock[3] = &block_descriptor_108;
  v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_prefetchRequestWithWorkloadType_workloadParameters_completion_, v16, v17, v19);
  _Block_release(v19);
  swift_unknownObjectRelease();

}

uint64_t sub_244A4349C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v22 = a4;
  v20 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE8);
  v21 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for XPCWrapper.Continuation();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v20 - v16;
  swift_beginAccess();
  sub_244A46290(a2, (uint64_t)v10);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return sub_244A2EBB0((uint64_t)v10, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v10, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v17, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v19 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v7, v15, v5);
    v23 = v20;
    v24 = v22;
    sub_244A476E4(v20, v22);
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
    return sub_244A15860((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  else
  {
    sub_244A15860((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  return result;
}

void sub_244A43708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD aBlock[6];

  v23[1] = a7;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v14, a1, v15);
  v16 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v14, 0, 1, v16);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v14, a3);
  swift_endAccess();
  v17 = *(void **)(a2 + 72);
  swift_unknownObjectRetain();
  v18 = (void *)sub_244A56D2C();
  v19 = (void *)sub_244A56D08();
  if (a8)
    a8 = (void *)sub_244A56D2C();
  v20 = (void *)sub_244A56D2C();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a2;
  *(_QWORD *)(v21 + 24) = a3;
  aBlock[4] = sub_244A47A54;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A41C18;
  aBlock[3] = &block_descriptor_100;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_prewarmRequestWithWorkloadType_workloadParameters_bundleIdentifier_featureIdentifier_completion_, v18, v19, a8, v20, v22);
  _Block_release(v22);
  swift_unknownObjectRelease();

}

uint64_t sub_244A43940(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t result;
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for XPCWrapper.Continuation();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v17 - v14;
  swift_beginAccess();
  sub_244A46290(a1, (uint64_t)v8);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_244A2EBB0((uint64_t)v8, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v8, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v15, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_244A15860((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v13, v2);
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return sub_244A15860((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  return result;
}

uint64_t sub_244A43B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A47934;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A43D08;
  aBlock[3] = &block_descriptor_76;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_prefetchCacheWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A43D08(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_244A56DEC();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A43D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A479E8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A43D08;
  aBlock[3] = &block_descriptor_94;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_prefetchParametersCacheWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A43EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v20 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF0);
  v21 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v19 - v15;
  swift_beginAccess();
  sub_244A46290(a2, (uint64_t)v9);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    return sub_244A2EBB0((uint64_t)v9, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v9, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v16, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    v18 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v6, v14, v4);
    v22 = v20;
    swift_bridgeObjectRetain();
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v4);
    return sub_244A15860((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  else
  {
    sub_244A15860((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  return result;
}

uint64_t sub_244A44158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DF0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A479D8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A43D08;
  aBlock[3] = &block_descriptor_88;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_prefetchParametersCacheSavedStateWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A442EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A4795C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A446E4;
  aBlock[3] = &block_descriptor_82;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_prefetchCacheResetWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A44480(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char v22;

  v21 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD8);
  v20 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v19 - v15;
  swift_beginAccess();
  sub_244A46290(a2, (uint64_t)v9);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    return sub_244A2EBB0((uint64_t)v9, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v9, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v16, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = v20;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v6, v14, v4);
    v22 = v21 & 1;
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v4);
    return sub_244A15860((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  else
  {
    sub_244A15860((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  return result;
}

uint64_t sub_244A446E4(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_244A44720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, int a8)
{
  sub_244A447A8(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_2515AC350, (uint64_t)sub_244A47924, (uint64_t)&block_descriptor_70, (SEL *)&selRef_knownRateLimitsWithBundleIdentifier_featureIdentifier_skipFetch_completion_);
}

void sub_244A44764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, int a8)
{
  sub_244A447A8(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_2515AC300, (uint64_t)sub_244A478F8, (uint64_t)&block_descriptor_64, (SEL *)&selRef_listRateLimitsWithBundleIdentifier_featureIdentifier_fetch_completion_);
}

void sub_244A447A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, SEL *a12)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  _QWORD aBlock[6];

  v28 = a8;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v19, a1, v20);
  v21 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v19, 0, 1, v21);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v19, a3);
  swift_endAccess();
  v22 = *(void **)(a2 + 72);
  if (!a5)
  {
    swift_unknownObjectRetain();
    v24 = a10;
    v23 = a11;
    if (!a7)
      goto LABEL_4;
    goto LABEL_3;
  }
  swift_unknownObjectRetain();
  a5 = (void *)sub_244A56D2C();
  v24 = a10;
  v23 = a11;
  if (a7)
LABEL_3:
    a7 = (void *)sub_244A56D2C();
LABEL_4:
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = a2;
  *(_QWORD *)(v25 + 24) = a3;
  aBlock[4] = v24;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A43200;
  aBlock[3] = v23;
  v26 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v22, *a12, a5, a7, v28 & 1, v26);
  _Block_release(v26);
  swift_unknownObjectRelease();

}

void sub_244A449AC(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, uint64_t a7, void *a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD aBlock[6];

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)aBlock - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v23, a1, v24);
  v25 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v23, 0, 1, v25);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v23, a3);
  swift_endAccess();
  v26 = *(void **)(a2 + 72);
  if (a8)
  {
    swift_unknownObjectRetain();
    a8 = (void *)sub_244A56D2C();
    v28 = a12;
    v27 = a13;
    if (!a10)
      goto LABEL_4;
    goto LABEL_3;
  }
  swift_unknownObjectRetain();
  v28 = a12;
  v27 = a13;
  if (a10)
LABEL_3:
    a10 = (void *)sub_244A56D2C();
LABEL_4:
  if (v28)
    v29 = (void *)sub_244A56D2C();
  else
    v29 = 0;
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = a2;
  *(_QWORD *)(v30 + 24) = a3;
  aBlock[4] = sub_244A478D0;
  aBlock[5] = v30;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A41C18;
  aBlock[3] = &block_descriptor_58;
  v31 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v26, sel_addRateLimitWithBundleIdentifier_featureIdentifier_workloadType_count_duration_ttl_jitter_completion_, a8, a10, v29, v27, v31, a4, a5, a6);
  _Block_release(v31);
  swift_unknownObjectRelease();

}

uint64_t sub_244A44C08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t result;
  uint64_t v17;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD0);
  v18 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for XPCWrapper.Continuation();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  swift_beginAccess();
  sub_244A46290(a2, (uint64_t)v8);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_244A2EBB0((uint64_t)v8, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v8, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v15, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_244A15860((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  else
  {
    v17 = v18;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v5, v13, v3);
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v3);
    return sub_244A15860((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  return result;
}

uint64_t sub_244A44E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A478C0;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A41C18;
  aBlock[3] = &block_descriptor_52;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_resetRateLimitsWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A44FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A478B0;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A4517C;
  aBlock[3] = &block_descriptor_46;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_fetchServerDrivenConfigurationWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A4517C(uint64_t a1, void *a2)
{
  void (*v3)(uint64_t, unint64_t);
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = sub_244A56BDC();
  v7 = v6;

  v3(v5, v7);
  sub_244A26E1C(v5, v7);
  return swift_release();
}

uint64_t sub_244A451EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_244A478A0;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A4517C;
  aBlock[3] = &block_descriptor_40;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_listServerDrivenConfigurationWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_244A45380(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v22 = a4;
  v20 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE0);
  v21 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for XPCWrapper.Continuation();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v20 - v16;
  swift_beginAccess();
  sub_244A46290(a2, (uint64_t)v10);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return sub_244A2EBB0((uint64_t)v10, &qword_2543FB370);
  sub_244A1AAC0((uint64_t)v10, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  sub_244A1581C((uint64_t)v17, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v19 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v7, v15, v5);
    v23 = v20;
    v24 = v22;
    sub_244A26DC4(v20, v22);
    sub_244A56E10();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
    return sub_244A15860((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  else
  {
    sub_244A15860((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    result = sub_244A56F78();
    __break(1u);
  }
  return result;
}

void sub_244A455EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v8, a3);
  swift_endAccess();
  v11 = *(void **)(a2 + 72);
  swift_unknownObjectRetain();
  v12 = (void *)sub_244A56BD0();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  aBlock[4] = sub_244A47874;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A4517C;
  aBlock[3] = &block_descriptor_34;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_setServerDrivenConfigurationWithJson_completion_, v12, v14);
  _Block_release(v14);
  swift_unknownObjectRelease();

}

void sub_244A457A8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[6];

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DD0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v14, a1, v15);
  v16 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v14, 0, 1, v16);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v14, a3);
  swift_endAccess();
  v17 = (void *)sub_244A56BD0();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = a3;
  aBlock[4] = sub_244A4773C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A43200;
  aBlock[3] = &block_descriptor_14;
  v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(a4, sel_sendWithData_isComplete_completion_, v17, a7 & 1, v19);
  _Block_release(v19);

}

void sub_244A45964(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3530);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TrustedCloudComputeError(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v22 - v15;
  if (a3 >> 60 == 15)
  {
    sub_244A43940(a4);
  }
  else
  {
    v22 = v14;
    v23 = a4;
    v24 = a1;
    sub_244A26DC4(a2, a3);
    sub_244A2B484(a2, a3, (uint64_t)v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      sub_244A2EBB0((uint64_t)v10, &qword_2573C3530);
      v17 = v22;
      TrustedCloudComputeError.init(file:line:message:)(0xD00000000000003FLL, 0x8000000244A5FA80, v22);
      sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
      v18 = (void *)swift_allocError();
      sub_244A1581C(v17, v19, type metadata accessor for TrustedCloudComputeError);
      sub_244A42268(v23, (uint64_t)v18);
      v20 = v17;
    }
    else
    {
      sub_244A1AAC0((uint64_t)v10, (uint64_t)v16, type metadata accessor for TrustedCloudComputeError);
      sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
      v18 = (void *)swift_allocError();
      sub_244A1581C((uint64_t)v16, v21, type metadata accessor for TrustedCloudComputeError);
      sub_244A42268(v23, (uint64_t)v18);
      v20 = (uint64_t)v16;
    }
    sub_244A15860(v20, type metadata accessor for TrustedCloudComputeError);

  }
}

void sub_244A45BCC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[6];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3DE8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, a1, v11);
  v12 = type metadata accessor for XPCWrapper.Continuation();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  swift_beginAccess();
  sub_244A460B8((uint64_t)v10, a3);
  swift_endAccess();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  aBlock[4] = sub_244A46B24;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244A45FC8;
  aBlock[3] = &block_descriptor;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(a4, sel_nextWithCompletion_, v14);
  _Block_release(v14);
}

void sub_244A45D58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v25 = a6;
  v24 = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3530);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TrustedCloudComputeError(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v23 - v16;
  if (a3 >> 60 == 15)
  {
    sub_244A42FB4(a4, v24, v25);
  }
  else
  {
    v23 = v15;
    v24 = a4;
    sub_244A26DC4(a2, a3);
    sub_244A2B484(a2, a3, (uint64_t)v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      sub_244A2EBB0((uint64_t)v11, &qword_2573C3530);
      v18 = v23;
      TrustedCloudComputeError.init(file:line:message:)(0xD00000000000003FLL, 0x8000000244A5FA80, v23);
      sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
      v19 = (void *)swift_allocError();
      sub_244A1581C(v18, v20, type metadata accessor for TrustedCloudComputeError);
      sub_244A42268(v24, (uint64_t)v19);
      v21 = v18;
    }
    else
    {
      sub_244A1AAC0((uint64_t)v11, (uint64_t)v17, type metadata accessor for TrustedCloudComputeError);
      sub_244A47C4C(&qword_2573C3C70, 255, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
      v19 = (void *)swift_allocError();
      sub_244A1581C((uint64_t)v17, v22, type metadata accessor for TrustedCloudComputeError);
      sub_244A42268(v24, (uint64_t)v19);
      v21 = (uint64_t)v17;
    }
    sub_244A15860(v21, type metadata accessor for TrustedCloudComputeError);

  }
}

uint64_t sub_244A45FC8(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *, unint64_t);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *, unint64_t))(a1 + 32);
  if (!a2)
  {
    swift_retain();
    v8 = 0xF000000000000000;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v11 = 0xF000000000000000;
    goto LABEL_6;
  }
  swift_retain();
  v6 = v4;
  v4 = (void *)sub_244A56BDC();
  v8 = v7;

  if (!a3)
    goto LABEL_5;
LABEL_3:
  v9 = a3;
  a3 = (void *)sub_244A56BDC();
  v11 = v10;

LABEL_6:
  v5(v4, v8, a3, v11);
  sub_244A26E08((uint64_t)a3, v11);
  sub_244A26E08((uint64_t)v4, v8);
  return swift_release();
}

void sub_244A46090()
{
  sub_244A41370();
}

uint64_t sub_244A460B8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB370);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for XPCWrapper.Continuation();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_244A2EBB0(a1, &qword_2543FB370);
    v13 = sub_244A46C54(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_244A47494();
        v17 = v22;
      }
      sub_244A1AAC0(*(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
      sub_244A47130(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_244A2EBB0((uint64_t)v8, &qword_2543FB370);
  }
  else
  {
    sub_244A1AAC0(a1, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_244A472EC((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_244A46290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v5 = sub_244A46C54(a1);
  if ((v6 & 1) != 0)
  {
    v7 = v5;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v2;
    v15 = *v3;
    *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_244A47494();
      v9 = v15;
    }
    v10 = *(_QWORD *)(v9 + 56);
    v11 = type metadata accessor for XPCWrapper.Continuation();
    v12 = *(_QWORD *)(v11 - 8);
    sub_244A1AAC0(v10 + *(_QWORD *)(v12 + 72) * v7, a2, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    sub_244A47130(v7, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a2, 0, 1, v11);
  }
  else
  {
    v14 = type metadata accessor for XPCWrapper.Continuation();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a2, 1, 1, v14);
  }
}

uint64_t sub_244A46388()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCWrapper()
{
  return objc_opt_self();
}

uint64_t sub_244A463EC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_244A4643C + 4 * byte_244A5C98E[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t sub_244A465DC(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if (result <= 6)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(off_2515AC638[(int)result]);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

uint64_t sub_244A46630(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = __swift_instantiateConcreteTypeFromMangledName(off_2515AC638[EnumCaseMultiPayload]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_244A466A8(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_244A15860(a1, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5 = __swift_instantiateConcreteTypeFromMangledName(off_2515AC638[EnumCaseMultiPayload]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for XPCWrapper.Continuation()
{
  uint64_t result;

  result = qword_2543FB360;
  if (!qword_2543FB360)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_244A46774(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = __swift_instantiateConcreteTypeFromMangledName(off_2515AC638[EnumCaseMultiPayload]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_244A467EC(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_244A15860(a1, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5 = __swift_instantiateConcreteTypeFromMangledName(off_2515AC638[EnumCaseMultiPayload]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_244A4687C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  sub_244A469FC(319, &qword_2543FB3F8);
  if (v0 <= 0x3F)
  {
    sub_244A469FC(319, &qword_2543FB3F0);
    if (v1 <= 0x3F)
    {
      sub_244A469FC(319, &qword_2543FB3C8);
      if (v2 <= 0x3F)
      {
        sub_244A46A64(319, &qword_2543FB3C0, &qword_2543FB358);
        if (v3 <= 0x3F)
        {
          sub_244A469FC(319, &qword_2543FB3E0);
          if (v4 <= 0x3F)
          {
            sub_244A46A64(319, &qword_2543FB3E8, &qword_2543FB3A8);
            if (v5 <= 0x3F)
            {
              sub_244A46A64(319, &qword_2543FB3D0, &qword_2543FB388);
              if (v6 <= 0x3F)
                swift_initEnumMetadataMultiPayload();
            }
          }
        }
      }
    }
  }
}

void sub_244A469FC(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2543FB420);
    v3 = sub_244A56E1C();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_244A46A64(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2543FB420);
    v4 = sub_244A56E1C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_244A46AD4()
{
  return sub_244A56EAC();
}

void sub_244A46AF4(uint64_t a1)
{
  uint64_t v1;

  sub_244A45BCC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_244A46B00()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244A46B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[8];

  v5 = *(_QWORD *)(v4 + 24);
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = v5;
  v7[5] = a1;
  v7[6] = a2;
  return sub_244A41A4C((uint64_t)sub_244A46BA0, (uint64_t)v7);
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

void sub_244A46BA0(uint64_t a1)
{
  uint64_t v1;

  sub_244A45D58(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_244A46BC0()
{
  return swift_deallocObject();
}

uint64_t sub_244A46BD0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_244A46BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_244A57194();
  sub_244A56D5C();
  v4 = sub_244A571C4();
  return sub_244A46C84(a1, a2, v4);
}

unint64_t sub_244A46C54(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244A57188();
  return sub_244A46D64(a1, v2);
}

unint64_t sub_244A46C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_244A5711C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_244A5711C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_244A46D64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_244A46E00(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t v38;
  int v39;

  v3 = v2;
  v5 = type metadata accessor for XPCWrapper.Continuation();
  v38 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB418);
  v39 = a2;
  result = sub_244A56F90();
  v10 = result;
  if (*(_QWORD *)(v8 + 16))
  {
    v35 = v3;
    v11 = 0;
    v12 = *(_QWORD *)(v8 + 64);
    v37 = (_QWORD *)(v8 + 64);
    v13 = 1 << *(_BYTE *)(v8 + 32);
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v15 = v14 & v12;
    v36 = (unint64_t)(v13 + 63) >> 6;
    v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        v18 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v19 = v18 | (v11 << 6);
      }
      else
      {
        v20 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        result = (uint64_t)v37;
        if (v20 >= v36)
          goto LABEL_34;
        v21 = v37[v20];
        ++v11;
        if (!v21)
        {
          v11 = v20 + 1;
          if (v20 + 1 >= v36)
            goto LABEL_34;
          v21 = v37[v11];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v36)
            {
LABEL_34:
              if ((v39 & 1) == 0)
              {
                result = swift_release();
                v3 = v35;
                goto LABEL_41;
              }
              v33 = 1 << *(_BYTE *)(v8 + 32);
              if (v33 >= 64)
                bzero(v37, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v37 = -1 << v33;
              v3 = v35;
              *(_QWORD *)(v8 + 16) = 0;
              break;
            }
            v21 = v37[v22];
            if (!v21)
            {
              while (1)
              {
                v11 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_43;
                if (v11 >= v36)
                  goto LABEL_34;
                v21 = v37[v11];
                ++v22;
                if (v21)
                  goto LABEL_21;
              }
            }
            v11 = v22;
          }
        }
LABEL_21:
        v15 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v11 << 6);
      }
      v23 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v19);
      v24 = *(_QWORD *)(v38 + 72);
      v25 = *(_QWORD *)(v8 + 56) + v24 * v19;
      if ((v39 & 1) != 0)
        sub_244A1AAC0(v25, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
      else
        sub_244A1581C(v25, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
      result = sub_244A57188();
      v26 = -1 << *(_BYTE *)(v10 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v17) = v23;
      result = sub_244A1AAC0((uint64_t)v7, *(_QWORD *)(v10 + 56) + v24 * v17, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
      ++*(_QWORD *)(v10 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v10;
  return result;
}

unint64_t sub_244A47130(unint64_t result, uint64_t a2)
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
    result = sub_244A56EF4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_244A57188();
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
        v16 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for XPCWrapper.Continuation() - 8) + 72);
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

uint64_t sub_244A472EC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_244A46C54(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = v17 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for XPCWrapper.Continuation() - 8) + 72) * v10;
        return sub_244A476F8(a1, v18);
      }
      return sub_244A47408(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_244A47494();
      goto LABEL_7;
    }
    sub_244A46E00(v13, a3 & 1);
    v20 = sub_244A46C54(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_244A47408(v10, a2, a1, v16);
    }
  }
  result = sub_244A5714C();
  __break(1u);
  return result;
}

uint64_t sub_244A47408(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = type metadata accessor for XPCWrapper.Continuation();
  result = sub_244A1AAC0(a3, v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

void *sub_244A47494()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v1 = v0;
  v2 = type metadata accessor for XPCWrapper.Continuation();
  v27 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB418);
  v5 = *v0;
  v6 = sub_244A56F84();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v25 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v26 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v15)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v21);
    ++v11;
    if (!v22)
    {
      v11 = v21 + 1;
      if (v21 + 1 >= v15)
        goto LABEL_26;
      v22 = *(_QWORD *)(v26 + 8 * v11);
      if (!v22)
        break;
    }
LABEL_25:
    v14 = (v22 - 1) & v22;
    v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_12:
    v18 = 8 * v17;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
    v20 = *(_QWORD *)(v27 + 72) * v17;
    sub_244A1581C(*(_QWORD *)(v5 + 56) + v20, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v19;
    result = (void *)sub_244A1AAC0((uint64_t)v4, *(_QWORD *)(v7 + 56) + v20, (uint64_t (*)(_QWORD))type metadata accessor for XPCWrapper.Continuation);
  }
  v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v26 + 8 * v23);
  if (v22)
  {
    v11 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v11);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_244A476C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244A476E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_244A26DC4(a1, a2);
  return a1;
}

uint64_t sub_244A476F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCWrapper.Continuation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_244A4773C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v3 = *(_QWORD *)(v2 + 24);
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = v3;
  return sub_244A41A4C((uint64_t)sub_244A4779C, (uint64_t)v5);
}

void sub_244A4779C(uint64_t a1)
{
  uint64_t v1;

  sub_244A45964(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

void sub_244A477B8(uint64_t a1)
{
  uint64_t v1;

  sub_244A457A8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_BYTE *)(v1 + 56));
}

uint64_t sub_244A477CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[8];

  v4 = *(_QWORD *)(v3 + 24);
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = v4;
  v6[5] = a1;
  return sub_244A41A4C((uint64_t)sub_244A4782C, (uint64_t)v6);
}

void sub_244A4782C(uint64_t a1)
{
  uint64_t v1;

  sub_244A41FB4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_244A47848(uint64_t a1, uint64_t a2)
{
  return sub_244A47B68(a1, a2, (uint64_t)sub_244A47858);
}

uint64_t sub_244A47858(uint64_t a1)
{
  uint64_t *v1;

  return sub_244A42B60(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_244A47874(uint64_t a1, uint64_t a2)
{
  return sub_244A47B68(a1, a2, (uint64_t)sub_244A47884);
}

uint64_t sub_244A47884(uint64_t a1)
{
  uint64_t v1;

  return sub_244A45380(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_244A478A0(uint64_t a1, uint64_t a2)
{
  return sub_244A47B68(a1, a2, (uint64_t)sub_244A47EB0);
}

uint64_t sub_244A478B0(uint64_t a1, uint64_t a2)
{
  return sub_244A47B68(a1, a2, (uint64_t)sub_244A47EB0);
}

uint64_t sub_244A478C0()
{
  return sub_244A47A64((uint64_t)sub_244A47ED8);
}

uint64_t sub_244A478D0()
{
  return sub_244A47A64((uint64_t)sub_244A478E0);
}

uint64_t sub_244A478E0(uint64_t a1)
{
  uint64_t v1;

  return sub_244A44C08(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_244A478F8(uint64_t a1, uint64_t a2)
{
  return sub_244A47B68(a1, a2, (uint64_t)sub_244A47908);
}

uint64_t sub_244A47908(uint64_t a1)
{
  uint64_t v1;

  return sub_244A4349C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_244A47924(uint64_t a1, uint64_t a2)
{
  return sub_244A47B68(a1, a2, (uint64_t)sub_244A47EC4);
}

uint64_t sub_244A47934(uint64_t a1)
{
  return sub_244A479F8(a1, (uint64_t)sub_244A47944);
}

uint64_t sub_244A47944(uint64_t a1)
{
  uint64_t v1;

  return sub_244A43EF4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_244A4795C(char a1)
{
  uint64_t v1;
  _QWORD v3[3];
  char v4;

  v3[2] = *(_QWORD *)(v1 + 24);
  v4 = a1;
  return sub_244A41A4C((uint64_t)sub_244A479BC, (uint64_t)v3);
}

uint64_t sub_244A479BC(uint64_t a1)
{
  uint64_t v1;

  return sub_244A44480(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t sub_244A479D8(uint64_t a1)
{
  return sub_244A479F8(a1, (uint64_t)sub_244A47E4C);
}

uint64_t sub_244A479E8(uint64_t a1)
{
  return sub_244A479F8(a1, (uint64_t)sub_244A47E4C);
}

uint64_t sub_244A479F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[6];

  v4[2] = *(_QWORD *)(v2 + 24);
  v4[3] = a1;
  return sub_244A41A4C(a2, (uint64_t)v4);
}

uint64_t sub_244A47A54()
{
  return sub_244A47A64((uint64_t)sub_244A47ED8);
}

uint64_t sub_244A47A64(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];

  v3[2] = *(_QWORD *)(v1 + 24);
  return sub_244A41A4C(a1, (uint64_t)v3);
}

void sub_244A47AB8(uint64_t a1)
{
  uint64_t *v1;

  sub_244A43280(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

unint64_t sub_244A47AC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2573C3E20;
  if (!qword_2573C3E20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573C3E18);
    v2 = sub_244A47C4C(&qword_2573C3E28, 255, type metadata accessor for Prefetch.Response, (uint64_t)&protocol conformance descriptor for Prefetch.Response);
    result = MEMORY[0x24951D378](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2573C3E20);
  }
  return result;
}

uint64_t sub_244A47B48(uint64_t a1, uint64_t a2)
{
  return sub_244A47B68(a1, a2, (uint64_t)sub_244A47EC4);
}

uint64_t sub_244A47B58(uint64_t a1, uint64_t a2)
{
  return sub_244A47B68(a1, a2, (uint64_t)sub_244A47EC4);
}

uint64_t sub_244A47B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[6];

  v5[2] = *(_QWORD *)(v3 + 24);
  v5[3] = a1;
  v5[4] = a2;
  return sub_244A41A4C(a3, (uint64_t)v5);
}

uint64_t sub_244A47BC8()
{
  return sub_244A41A4C((uint64_t)sub_244A41C1C, 0);
}

unint64_t sub_244A47C10()
{
  unint64_t result;

  result = qword_2543FB410;
  if (!qword_2543FB410)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543FB410);
  }
  return result;
}

uint64_t sub_244A47C4C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x24951D378](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244A47C8C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24951D378](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244A47CCC()
{
  return sub_244A41A4C((uint64_t)sub_244A47DA4, 0);
}

uint64_t sub_244A47D14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244A47D5C()
{
  return sub_244A41A4C((uint64_t)sub_244A46090, 0);
}

void sub_244A47DA4()
{
  sub_244A46090();
}

uint64_t sub_244A47E4C(uint64_t a1)
{
  return sub_244A47944(a1);
}

uint64_t sub_244A47EB0(uint64_t a1)
{
  return sub_244A47884(a1);
}

uint64_t sub_244A47EC4(uint64_t a1)
{
  return sub_244A47908(a1);
}

uint64_t sub_244A47ED8(uint64_t a1)
{
  return sub_244A478E0(a1);
}

uint64_t TrustedRequest.init(id:workloadType:workloadParameters:featureIdentifier:sessionIdentifier:bundleIdentifierOverride:originatingBundleIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t, uint64_t);
  _QWORD *v23;
  uint64_t result;

  v13 = (int *)type metadata accessor for TrustedRequest();
  v14 = v13[6];
  v15 = (_QWORD *)(a9 + v13[7]);
  v16 = (_QWORD *)(a9 + v13[8]);
  *v16 = 0;
  v16[1] = 0;
  v17 = (_QWORD *)(a9 + v13[9]);
  v18 = a9 + v13[10];
  v19 = sub_244A56C9C();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
  v21(v18, 1, 1, v19);
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32);
  v22(a9, a1, v19);
  v23 = (_QWORD *)(a9 + v13[5]);
  *v23 = a2;
  v23[1] = a3;
  *(_QWORD *)(a9 + v14) = a4;
  *v15 = a8;
  v15[1] = a10;
  *v17 = a5;
  v17[1] = a6;
  sub_244A2EBB0(v18, &qword_2573C3718);
  v22(v18, a7, v19);
  v21(v18, 0, 1, v19);
  result = swift_bridgeObjectRelease();
  *v16 = a11;
  v16[1] = a12;
  return result;
}

uint64_t type metadata accessor for TrustedRequest()
{
  uint64_t result;

  result = qword_2573C3F10;
  if (!qword_2573C3F10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TrustedRequest.init(id:workloadType:workloadParameters:bundleIdentifier:featureIdentifier:sessionIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  int *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v13 = (int *)type metadata accessor for TrustedRequest();
  v14 = v13[6];
  v15 = (_QWORD *)(a9 + v13[7]);
  v16 = (_QWORD *)(a9 + v13[8]);
  *v16 = 0;
  v16[1] = 0;
  v17 = (_QWORD *)(a9 + v13[9]);
  v18 = a9 + v13[10];
  v19 = sub_244A56C9C();
  v20 = *(_QWORD *)(v19 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(a9, a1, v19);
  v21 = (_QWORD *)(a9 + v13[5]);
  *v21 = a2;
  v21[1] = a3;
  *(_QWORD *)(a9 + v14) = a4;
  *v15 = a5;
  v15[1] = a6;
  *v17 = a7;
  v17[1] = a8;
  return sub_244A3FF54(a10, v18);
}

uint64_t TrustedRequest.Writer.write<A>(contentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 40) = *(_QWORD *)(a2 - 8);
  v5 = swift_task_alloc();
  v6 = *v3;
  *(_QWORD *)(v4 + 48) = v5;
  *(_QWORD *)(v4 + 56) = v6;
  *(_OWORD *)(v4 + 64) = *(_OWORD *)(v3 + 1);
  *(_QWORD *)(v4 + 80) = v3[3];
  return swift_task_switch();
}

{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = *v3;
  *(_QWORD *)(v4 + 32) = a3;
  *(_QWORD *)(v4 + 40) = v5;
  *(_OWORD *)(v4 + 48) = *(_OWORD *)(v3 + 1);
  *(_QWORD *)(v4 + 64) = v3[3];
  return swift_task_switch();
}

uint64_t sub_244A481E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  v2 = v0[9];
  v1 = v0[10];
  v4 = v0[7];
  v3 = v0[8];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[5] + 16))(v0[6], v0[2], v0[3]);
  v5 = sub_244A56BF4();
  v7 = v6;
  v0[11] = v5;
  v0[12] = v6;
  v8 = (_QWORD *)swift_task_alloc();
  v0[13] = v8;
  v8[2] = v4;
  v8[3] = v3;
  v8[4] = v2;
  v8[5] = v1;
  v8[6] = v5;
  v8[7] = v7;
  v9 = (_QWORD *)swift_task_alloc();
  v0[14] = v9;
  v9[2] = v4;
  v9[3] = v3;
  v9[4] = v2;
  v9[5] = v1;
  v10 = (_QWORD *)swift_task_alloc();
  v0[15] = v10;
  *v10 = v0;
  v10[1] = sub_244A482E8;
  return sub_244A57128();
}

uint64_t sub_244A482E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_244A4835C()
{
  uint64_t v0;

  sub_244A26E1C(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A4839C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_244A26E1C(v2, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TrustedRequest.Writer.write(data:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  *(_QWORD *)(v3 + 32) = *(_QWORD *)v2;
  *(_OWORD *)(v3 + 40) = *(_OWORD *)(v2 + 8);
  *(_QWORD *)(v3 + 56) = *(_QWORD *)(v2 + 24);
  return swift_task_switch();
}

uint64_t sub_244A4842C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = v0[6];
  v1 = v0[7];
  v4 = v0[4];
  v3 = v0[5];
  v6 = v0[2];
  v5 = v0[3];
  v7 = (_QWORD *)swift_task_alloc();
  v0[8] = v7;
  v7[2] = v4;
  v7[3] = v3;
  v7[4] = v2;
  v7[5] = v1;
  v7[6] = v6;
  v7[7] = v5;
  v8 = (_QWORD *)swift_task_alloc();
  v0[9] = v8;
  v8[2] = v4;
  v8[3] = v3;
  v8[4] = v2;
  v8[5] = v1;
  v9 = (_QWORD *)swift_task_alloc();
  v0[10] = v9;
  *v9 = v0;
  v9[1] = sub_244A484F8;
  return sub_244A57128();
}

uint64_t sub_244A484F8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_244A4856C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A485A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v12;

  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v12;
  *v12 = v7;
  v12[1] = sub_244A318F0;
  return sub_244A40920(a2, a3, a6, a7, 1);
}

uint64_t sub_244A48628()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_244A324B0;
  v7 = (_QWORD *)swift_task_alloc();
  v6[2] = v7;
  *v7 = v6;
  v7[1] = sub_244A318F0;
  return sub_244A40920(v2, v3, v5, v4, 1);
}

uint64_t sub_244A486C0()
{
  uint64_t *v0;

  return sub_244A49240(v0[2], v0[3], v0[4]);
}

uint64_t sub_244A4871C()
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

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v6;
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v6 + 32) = v5;
  *(_QWORD *)(v6 + 40) = v4;
  *(_QWORD *)(v6 + 48) = v3;
  *(_QWORD *)(v6 + 56) = v2;
  *(_QWORD *)(v6 + 64) = v1;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v7;
  v7[2] = v4;
  v7[3] = v3;
  v7[4] = v2;
  v7[5] = v1;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v8;
  *v8 = v0;
  v8[1] = sub_244A487E8;
  return sub_244A57128();
}

uint64_t sub_244A487E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_244A4885C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A48898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;

  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a4;
  v8[7] = a5;
  v8[4] = a2;
  v8[5] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[10] = AssociatedTypeWitness;
  v8[11] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  v8[14] = *(_QWORD *)(a7 - 8);
  v8[15] = swift_task_alloc();
  v11 = swift_getAssociatedTypeWitness();
  v8[16] = v11;
  v8[17] = *(_QWORD *)(v11 - 8);
  v8[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244A48994()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[14] + 16))(v0[15], v0[4], v0[8]);
  sub_244A56E4C();
  v0[19] = swift_getAssociatedConformanceWitness();
  v1 = (_QWORD *)swift_task_alloc();
  v0[20] = v1;
  *v1 = v0;
  v1[1] = sub_244A48A68;
  return sub_244A56E28();
}

uint64_t sub_244A48A68()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A48ACC()
{
  _QWORD *v0;
  unint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = v0[3];
  v0[21] = v0[2];
  v0[22] = v1;
  if (v1 >> 60 == 15)
  {
    (*(void (**)(_QWORD, _QWORD))(v0[17] + 8))(v0[18], v0[16]);
    v2 = (_QWORD *)swift_task_alloc();
    v0[23] = v2;
    *v2 = v0;
    v2[1] = sub_244A48BB0;
    return sub_244A40920(v0[5], v0[6], 0, 0xC000000000000000, 1);
  }
  else
  {
    type metadata accessor for XPCWrapper();
    v0[25] = sub_244A14624(&qword_2543FB378, (uint64_t (*)(uint64_t))type metadata accessor for XPCWrapper, (uint64_t)&unk_244A5CA10);
    v0[26] = sub_244A56DF8();
    v0[27] = v4;
    return swift_task_switch();
  }
}

uint64_t sub_244A48BB0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 192) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244A48C54()
{
  uint64_t v0;

  sub_244A3156C(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_244A48CD8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[7];
  if (*(_QWORD *)(v1 + 56) == v0[5])
  {
    v2 = *(_QWORD *)(v1 + 16);
    if (__OFADD__(v2, 1))
    {
      __break(1u);
    }
    else
    {
      v4 = v0[21];
      v3 = v0[22];
      v5 = v0[6];
      *(_QWORD *)(v1 + 16) = v2 + 1;
      v6 = swift_task_alloc();
      v0[28] = v6;
      *(_QWORD *)(v6 + 16) = v1;
      *(_QWORD *)(v6 + 24) = v2;
      *(_QWORD *)(v6 + 32) = v5;
      *(_QWORD *)(v6 + 40) = v4;
      *(_QWORD *)(v6 + 48) = v3;
      *(_BYTE *)(v6 + 56) = 0;
      v7 = (_QWORD *)swift_task_alloc();
      v0[29] = v7;
      *v7 = v0;
      v7[1] = sub_244A48E74;
      sub_244A57140();
    }
  }
  else
  {
    type metadata accessor for TrustedCloudComputeError(0);
    sub_244A14624(&qword_2573C3C70, type metadata accessor for TrustedCloudComputeError, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
    v8 = swift_allocError();
    *(_QWORD *)v9 = 0xD000000000000016;
    *(_QWORD *)(v9 + 8) = 0x8000000244A5E1C0;
    *(_BYTE *)(v9 + 16) = 1;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    v0[31] = v8;
    swift_task_switch();
  }
}

uint64_t sub_244A48E74()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244A48EE0()
{
  return swift_task_switch();
}

uint64_t sub_244A48EF4()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_244A26E08(v0[21], v0[22]);
  v0[19] = swift_getAssociatedConformanceWitness();
  v1 = (_QWORD *)swift_task_alloc();
  v0[20] = v1;
  *v1 = v0;
  v1[1] = sub_244A48A68;
  return sub_244A56E28();
}

uint64_t sub_244A48F94()
{
  uint64_t v0;

  swift_task_dealloc();
  *(_QWORD *)(v0 + 248) = *(_QWORD *)(v0 + 240);
  return swift_task_switch();
}

uint64_t sub_244A48FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  sub_244A26E08(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 176));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_244A3156C(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A4907C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 88) + 32);
  v1(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
  swift_getAssociatedConformanceWitness();
  v2 = sub_244A57104();
  v3 = *(_QWORD *)(v0 + 96);
  if (v2)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 80);
    swift_allocError();
    v1(v5, v3, v4);
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  sub_244A3156C(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A491AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_244A318F0;
  return sub_244A48898(a1, v6, v7, v8, v9, v10, v4, v5);
}

uint64_t sub_244A49240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2543FB1B0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244A56E40();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = a3;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  swift_unknownObjectRetain();
  swift_retain();
  if ((_DWORD)a1 == 1)
  {
    sub_244A2EBB0((uint64_t)v8, qword_2543FB1B0);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    sub_244A56E34();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_244A56DF8();
      v13 = v14;
      swift_unknownObjectRelease();
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
  if (v13 | v12)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v12;
    v16[3] = v13;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_244A49414()
{
  uint64_t *v0;

  return sub_244A49240(v0[2], v0[3], v0[4]);
}

uint64_t TrustedRequest.Response.makeAsyncIterator()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *v1;
  v3 = v1[1];
  v5 = v1[2];
  sub_244A56B40();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  result = sub_244A56B34();
  *a1 = v4;
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = result;
  return result;
}

uint64_t TrustedRequest.Response.AsyncIterator.next()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_244A494C0()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v1 = (uint64_t *)v0[4];
  v2 = swift_task_alloc();
  v0[5] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v4 = *v1;
  v3 = v1[1];
  v0[6] = v3;
  v5 = v1[2];
  v0[7] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v0[8] = v6;
  v6[2] = v4;
  v6[3] = v3;
  v6[4] = v5;
  swift_unknownObjectRetain();
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[9] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
  *v7 = v0;
  v7[1] = sub_244A495A8;
  return sub_244A57128();
}

uint64_t sub_244A495A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_unknownObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_244A49638()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A49690(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_244A496A8()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (uint64_t *)v0[3];
  v3 = *v1;
  v2 = v1[1];
  v0[4] = v2;
  v0[5] = v1[2];
  swift_unknownObjectRetain();
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_244A49728;
  return sub_244A40664(v3, v2);
}

uint64_t sub_244A49728(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 56) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    swift_unknownObjectRelease();
    swift_release();
    *(_QWORD *)(v6 + 64) = a2;
    *(_QWORD *)(v6 + 72) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_244A497B0()
{
  uint64_t v0;

  *(int8x16_t *)*(_QWORD *)(v0 + 16) = vextq_s8(*(int8x16_t *)(v0 + 64), *(int8x16_t *)(v0 + 64), 8uLL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A497CC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244A49808(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_244A324B0;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t sub_244A4986C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2543FB1B0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244A56E40();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = a3;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  swift_unknownObjectRetain();
  swift_retain();
  if ((_DWORD)a1 == 1)
  {
    sub_244A2EBB0((uint64_t)v8, qword_2543FB1B0);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    sub_244A56E34();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_244A56DF8();
      v13 = v14;
      swift_unknownObjectRelease();
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB358);
  if (v13 | v12)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v12;
    v16[3] = v13;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_244A49A38()
{
  uint64_t *v0;

  return sub_244A4986C(v0[2], v0[3], v0[4]);
}

uint64_t sub_244A49A44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_244A49AA4;
  v3[4] = v1;
  return swift_task_switch();
}

uint64_t sub_244A49AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (!v2)
  {
    v8 = *(_QWORD **)(v6 + 16);
    *v8 = a1;
    v8[1] = a2;
  }
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_244A49B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v5[5] = a3;
  v5[6] = a4;
  v5[3] = a1;
  v5[4] = a2;
  v6 = (_QWORD *)swift_task_alloc();
  v5[7] = v6;
  *v6 = v5;
  v6[1] = sub_244A49B68;
  v6[4] = v4;
  return swift_task_switch();
}

uint64_t sub_244A49B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v3;
  *(_QWORD *)(v6 + 64) = v2;
  swift_task_dealloc();
  if (v2)
  {
    if (*(_QWORD *)(v6 + 32))
    {
      swift_getObjectType();
      sub_244A56DF8();
    }
    return swift_task_switch();
  }
  else
  {
    v7 = *(_QWORD **)(v6 + 24);
    *v7 = a1;
    v7[1] = a2;
    return (*(uint64_t (**)(void))(v6 + 8))();
  }
}

uint64_t sub_244A49C1C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD **)(v0 + 48);
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543FB420);
  swift_willThrowTypedImpl();
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

__n128 sub_244A49C84@<Q0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  __n128 result;

  v3 = *v1;
  sub_244A56B40();
  swift_allocObject();
  v4 = sub_244A56B34();
  *(_QWORD *)a1 = v3;
  result = *(__n128 *)(v1 + 1);
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = v4;
  return result;
}

uint64_t TrustedRequest.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_244A56C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TrustedRequest.id.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_244A56C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*TrustedRequest.id.modify())()
{
  return nullsub_1;
}

uint64_t TrustedRequest.workloadType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequest() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequest.workloadType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequest() + 20));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequest.workloadType.modify())()
{
  type metadata accessor for TrustedRequest();
  return nullsub_1;
}

uint64_t TrustedRequest.workloadParameters.getter()
{
  type metadata accessor for TrustedRequest();
  return swift_bridgeObjectRetain();
}

uint64_t TrustedRequest.workloadParameters.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for TrustedRequest() + 24);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*TrustedRequest.workloadParameters.modify())()
{
  type metadata accessor for TrustedRequest();
  return nullsub_1;
}

uint64_t TrustedRequest.bundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequest() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequest.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequest() + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequest.bundleIdentifier.modify())()
{
  type metadata accessor for TrustedRequest();
  return nullsub_1;
}

uint64_t TrustedRequest.originatingBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequest() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequest.originatingBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequest() + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequest.originatingBundleIdentifier.modify())()
{
  type metadata accessor for TrustedRequest();
  return nullsub_1;
}

uint64_t TrustedRequest.featureIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TrustedRequest() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrustedRequest.featureIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TrustedRequest() + 36));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TrustedRequest.featureIdentifier.modify())()
{
  type metadata accessor for TrustedRequest();
  return nullsub_1;
}

uint64_t TrustedRequest.sessionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TrustedRequest() + 40);
  return sub_244A3FF0C(v3, a1);
}

uint64_t TrustedRequest.sessionIdentifier.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TrustedRequest() + 40);
  return sub_244A3FF54(a1, v3);
}

uint64_t (*TrustedRequest.sessionIdentifier.modify())()
{
  type metadata accessor for TrustedRequest();
  return nullsub_1;
}

uint64_t sub_244A4A108()
{
  return MEMORY[0x24BEE3F20];
}

unint64_t sub_244A4A118()
{
  unint64_t result;

  result = qword_2573C3EB0;
  if (!qword_2573C3EB0)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TrustedRequest.Response.AsyncIterator, &type metadata for TrustedRequest.Response.AsyncIterator);
    atomic_store(result, (unint64_t *)&qword_2573C3EB0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TrustedRequest(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void (*v33)(uint64_t *, uint64_t *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244A56C9C();
    v8 = *(_QWORD *)(v7 - 8);
    v33 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v33(a1, a2, v7);
    v9 = a3[5];
    v10 = a3[6];
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    v14 = a3[7];
    v15 = a3[8];
    v16 = (uint64_t *)((char *)a1 + v14);
    v17 = (uint64_t *)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = (uint64_t *)((char *)a1 + v15);
    v20 = (uint64_t *)((char *)a2 + v15);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = a3[9];
    v23 = a3[10];
    v24 = (uint64_t *)((char *)a1 + v22);
    v25 = (uint64_t *)((char *)a2 + v22);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = (char *)a1 + v23;
    v28 = (char *)a2 + v23;
    v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29(v28, 1, v7))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      v33((uint64_t *)v27, (uint64_t *)v28, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v27, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for TrustedRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void (*v8)(uint64_t, uint64_t);

  v4 = sub_244A56C9C();
  v5 = *(_QWORD *)(v4 - 8);
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 40);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v4);
  return result;
}

char *initializeWithCopy for TrustedRequest(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  unsigned int (*v28)(const void *, uint64_t, uint64_t);
  uint64_t v29;
  void (*v31)(void *, const void *, uint64_t);

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v31 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v31(a1, a2, v6);
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *((_QWORD *)v11 + 1);
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = v12;
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  v13 = a3[7];
  v14 = a3[8];
  v15 = &a1[v13];
  v16 = &a2[v13];
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = v17;
  v18 = &a1[v14];
  v19 = &a2[v14];
  v20 = *((_QWORD *)v19 + 1);
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *((_QWORD *)v18 + 1) = v20;
  v21 = a3[9];
  v22 = a3[10];
  v23 = &a1[v21];
  v24 = &a2[v21];
  v25 = *((_QWORD *)v24 + 1);
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *((_QWORD *)v23 + 1) = v25;
  v26 = &a1[v22];
  v27 = &a2[v22];
  v28 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v28(v27, 1, v6))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    v31(v26, v27, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for TrustedRequest(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t (*v24)(const void *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t v27;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = *((_QWORD *)v11 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = &a1[v12];
  v14 = &a2[v12];
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = a3[8];
  v16 = &a1[v15];
  v17 = &a2[v15];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[9];
  v19 = &a1[v18];
  v20 = &a2[v18];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[10];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v25 = v24(&a1[v21], 1, v6);
  v26 = v24(v23, 1, v6);
  if (!v25)
  {
    if (!v26)
    {
      v8(v22, v23, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v22, v6);
    goto LABEL_6;
  }
  if (v26)
  {
LABEL_6:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v22, v23, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v22, 0, 1, v6);
  return a1;
}

char *initializeWithTake for TrustedRequest(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  v10 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  v11 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  v12 = &a1[v11];
  v13 = &a2[v11];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v8(v12, v13, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for TrustedRequest(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t (*v32)(const void *, uint64_t, uint64_t);
  int v33;
  int v34;
  uint64_t v35;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = (uint64_t *)&a2[v9];
  v13 = *v11;
  v12 = v11[1];
  *(_QWORD *)v10 = v13;
  *((_QWORD *)v10 + 1) = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  v14 = a3[7];
  v15 = &a1[v14];
  v16 = (uint64_t *)&a2[v14];
  v18 = *v16;
  v17 = v16[1];
  *(_QWORD *)v15 = v18;
  *((_QWORD *)v15 + 1) = v17;
  swift_bridgeObjectRelease();
  v19 = a3[8];
  v20 = &a1[v19];
  v21 = (uint64_t *)&a2[v19];
  v23 = *v21;
  v22 = v21[1];
  *(_QWORD *)v20 = v23;
  *((_QWORD *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  v24 = a3[9];
  v25 = &a1[v24];
  v26 = (uint64_t *)&a2[v24];
  v28 = *v26;
  v27 = v26[1];
  *(_QWORD *)v25 = v28;
  *((_QWORD *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  v29 = a3[10];
  v30 = &a1[v29];
  v31 = &a2[v29];
  v32 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v33 = v32(&a1[v29], 1, v6);
  v34 = v32(v31, 1, v6);
  if (!v33)
  {
    if (!v34)
    {
      v8(v30, v31, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v30, v6);
    goto LABEL_6;
  }
  if (v34)
  {
LABEL_6:
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v30, v31, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v30, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A4A9B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    v10 = a1 + *(int *)(a3 + 40);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A4AA6C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_244A56C9C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    v12 = a1 + *(int *)(a4 + 40);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_244A4AB18()
{
  unint64_t v0;
  unint64_t v1;

  sub_244A56C9C();
  if (v0 <= 0x3F)
  {
    sub_244A4ABBC();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_244A4ABBC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2573C3F20)
  {
    sub_244A56C9C();
    v0 = sub_244A56EB8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2573C3F20);
  }
}

ValueMetadata *type metadata accessor for TrustedRequest.Writer()
{
  return &type metadata for TrustedRequest.Writer;
}

ValueMetadata *type metadata accessor for TrustedRequest.Response()
{
  return &type metadata for TrustedRequest.Response;
}

uint64_t _s19PrivateCloudCompute14TrustedRequestV6WriterVwxx_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_release();
}

_QWORD *_s19PrivateCloudCompute14TrustedRequestV6WriterVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *_s19PrivateCloudCompute14TrustedRequestV6WriterVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s19PrivateCloudCompute14TrustedRequestV6WriterVwta_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for TrustedRequest.Response.AsyncIterator()
{
  return &type metadata for TrustedRequest.Response.AsyncIterator;
}

uint64_t sub_244A4ADAC(uint64_t a1)
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
  v8[1] = sub_244A324B0;
  return sub_244A31730(a1, v4, v5, v6, v7);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244A4AE68()
{
  uint64_t v0;

  v0 = sub_244A56CD8();
  __swift_allocate_value_buffer(v0, qword_2543FB188);
  __swift_project_value_buffer(v0, (uint64_t)qword_2543FB188);
  return sub_244A56CCC();
}

unint64_t privateCloudComputeOsVariantSubsystem.getter()
{
  return 0xD00000000000001DLL;
}

uint64_t TC2DefaultConfiguration.subscript.getter@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t *, char *, uint64_t);
  uint64_t *v46;
  char *v47;
  char *v48;
  char *v49;
  NSObject *v50;
  os_log_type_t v51;
  int v52;
  uint64_t v53;
  char *v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  void (*v58)(uint64_t *, uint64_t);
  unint64_t v59;
  uint64_t v60;
  char *v61;
  void (*v62)(char *, char *, uint64_t);
  uint64_t v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t *, char *, uint64_t);
  uint64_t *v73;
  char *v74;
  char *v75;
  char *v76;
  NSObject *v77;
  os_log_type_t v78;
  int v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  void (*v84)(uint64_t *, uint64_t);
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  void (*v94)(uint64_t *, uint64_t);
  void (*v95)(uint64_t *, uint64_t);
  uint64_t v96;
  char *v97;
  uint64_t *v98;
  uint64_t *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;

  v9 = type metadata accessor for TC2ConfigurationIndex(0, a2, a3, a4);
  v107 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v106 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v101 = (char *)&v96 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v99 = (uint64_t *)((char *)&v96 - v15);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v100 = (char *)&v96 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v98 = (uint64_t *)((char *)&v96 - v18);
  v19 = sub_244A56EB8();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v96 - v22;
  v24 = *(_QWORD *)(a2 - 8);
  v25 = MEMORY[0x24BDAC7A8](v21);
  v27 = (char *)&v96 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v104 = (char *)&v96 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v105 = (char *)&v96 - v30;
  if ((a1[*(int *)(v9 + 36)] & 1) == 0 && !os_variant_allows_internal_security_policies())
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 16))(a5, &a1[*(int *)(v9 + 32)], a2);
  v97 = v27;
  v108 = a2;
  v109 = v9;
  v103 = a5;
  v31 = *(_QWORD *)a1;
  v32 = *((_QWORD *)a1 + 1);
  v33 = a1;
  v34 = v24;
  v35 = *((_QWORD *)v33 + 2);
  v36 = *((_QWORD *)v33 + 3);
  v102 = v33;
  v37 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v38 = v35;
  v39 = v34;
  v40 = v36;
  v41 = v108;
  v37(v31, v32, v38, v40, v108, a3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v23, 1, v41) == 1)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    v42 = v109;
    v43 = v107;
    if (qword_2543FB1A0 != -1)
      swift_once();
    v44 = sub_244A56CD8();
    __swift_project_value_buffer(v44, (uint64_t)qword_2543FB188);
    v45 = *(void (**)(uint64_t *, char *, uint64_t))(v43 + 16);
    v46 = v99;
    v47 = v102;
    v45(v99, v102, v42);
    v48 = v101;
    v45((uint64_t *)v101, v47, v42);
    v49 = v106;
    v45((uint64_t *)v106, v47, v42);
    v50 = sub_244A56CC0();
    v51 = sub_244A56E70();
    v52 = v51;
    if (os_log_type_enabled(v50, v51))
    {
      v53 = swift_slowAlloc();
      v105 = (char *)swift_slowAlloc();
      v111 = v105;
      *(_DWORD *)v53 = 136315650;
      v96 = v39;
      v54 = v48;
      LODWORD(v104) = v52;
      v55 = v46;
      v56 = *v46;
      v57 = v46[1];
      swift_bridgeObjectRetain();
      v110 = sub_244A564F0(v56, v57, (uint64_t *)&v111);
      sub_244A56EC4();
      swift_bridgeObjectRelease();
      v58 = *(void (**)(uint64_t *, uint64_t))(v43 + 8);
      v58(v55, v109);
      *(_WORD *)(v53 + 12) = 2080;
      v60 = *((_QWORD *)v54 + 2);
      v59 = *((_QWORD *)v54 + 3);
      swift_bridgeObjectRetain();
      v110 = sub_244A564F0(v60, v59, (uint64_t *)&v111);
      sub_244A56EC4();
      swift_bridgeObjectRelease();
      v58((uint64_t *)v54, v109);
      *(_WORD *)(v53 + 22) = 2080;
      v61 = v106;
      v62 = *(void (**)(char *, char *, uint64_t))(v96 + 16);
      v62(v97, &v106[*(int *)(v109 + 32)], v108);
      v63 = sub_244A56D44();
      v110 = sub_244A564F0(v63, v64, (uint64_t *)&v111);
      sub_244A56EC4();
      swift_bridgeObjectRelease();
      v58((uint64_t *)v61, v109);
      v41 = v108;
      _os_log_impl(&dword_244A12000, v50, (os_log_type_t)v104, "TC2Configuration defaultValue %s %s = %s", (uint8_t *)v53, 0x20u);
      v65 = v105;
      swift_arrayDestroy();
      MEMORY[0x24951D420](v65, -1, -1);
      v66 = v53;
      v42 = v109;
      MEMORY[0x24951D420](v66, -1, -1);

    }
    else
    {
      v94 = *(void (**)(uint64_t *, uint64_t))(v43 + 8);
      v94(v46, v42);
      v94((uint64_t *)v48, v42);
      v94((uint64_t *)v49, v42);

      v62 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
    }
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v62)(v103, &v47[*(int *)(v42 + 32)], v41);
  }
  else
  {
    v67 = *(char **)(v34 + 32);
    v68 = v105;
    v106 = v67;
    ((void (*)(char *, char *, uint64_t))v67)(v105, v23, v41);
    v69 = v109;
    v70 = v107;
    if (qword_2543FB1A0 != -1)
      swift_once();
    v71 = sub_244A56CD8();
    __swift_project_value_buffer(v71, (uint64_t)qword_2543FB188);
    v72 = *(void (**)(uint64_t *, char *, uint64_t))(v70 + 16);
    v73 = v98;
    v74 = v102;
    v72(v98, v102, v69);
    v75 = v100;
    v72((uint64_t *)v100, v74, v69);
    v76 = v104;
    v102 = *(char **)(v39 + 16);
    ((void (*)(char *, char *, uint64_t))v102)(v104, v68, v41);
    v77 = sub_244A56CC0();
    v78 = sub_244A56E70();
    v79 = v78;
    if (os_log_type_enabled(v77, v78))
    {
      v80 = swift_slowAlloc();
      v101 = (char *)swift_slowAlloc();
      v111 = v101;
      *(_DWORD *)v80 = 136315650;
      v96 = v39;
      v81 = v75;
      v82 = *v73;
      v83 = v73[1];
      swift_bridgeObjectRetain();
      v110 = sub_244A564F0(v82, v83, (uint64_t *)&v111);
      LODWORD(v99) = v79;
      sub_244A56EC4();
      swift_bridgeObjectRelease();
      v84 = *(void (**)(uint64_t *, uint64_t))(v70 + 8);
      v84(v73, v69);
      *(_WORD *)(v80 + 12) = 2080;
      v85 = *((_QWORD *)v81 + 2);
      v86 = *((_QWORD *)v81 + 3);
      swift_bridgeObjectRetain();
      v87 = v85;
      v41 = v108;
      v110 = sub_244A564F0(v87, v86, (uint64_t *)&v111);
      sub_244A56EC4();
      swift_bridgeObjectRelease();
      v84((uint64_t *)v81, v69);
      *(_WORD *)(v80 + 22) = 2080;
      v88 = v104;
      ((void (*)(char *, char *, uint64_t))v102)(v97, v104, v41);
      v89 = sub_244A56D44();
      v110 = sub_244A564F0(v89, v90, (uint64_t *)&v111);
      sub_244A56EC4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v88, v41);
      _os_log_impl(&dword_244A12000, v77, (os_log_type_t)v99, "TC2Configuration read %s %s = %s", (uint8_t *)v80, 0x20u);
      v91 = v101;
      swift_arrayDestroy();
      MEMORY[0x24951D420](v91, -1, -1);
      v92 = v80;
      v68 = v105;
      MEMORY[0x24951D420](v92, -1, -1);
    }
    else
    {
      v95 = *(void (**)(uint64_t *, uint64_t))(v70 + 8);
      v95(v73, v69);
      v95((uint64_t *)v75, v69);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v76, v41);
    }

    return ((uint64_t (*)(uint64_t, char *, uint64_t))v106)(v103, v68, v41);
  }
}

uint64_t sub_244A4B734@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return TC2DefaultConfiguration.subscript.getter(a1, a2, a3, a4, a5);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t dispatch thunk of TC2Configuration.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

ValueMetadata *type metadata accessor for TC2DefaultConfiguration()
{
  return &type metadata for TC2DefaultConfiguration;
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

void TrustedCloudComputeClient.Configuration.init()(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
}

unint64_t TrustedCloudComputeClient.Configuration.userID.getter()
{
  unsigned int *v0;

  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

uint64_t TrustedCloudComputeClient.Configuration.userID.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)v1 = result;
  *(_BYTE *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t (*TrustedCloudComputeClient.Configuration.userID.modify())()
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for TrustedCloudComputeClient.Configuration()
{
  return &type metadata for TrustedCloudComputeClient.Configuration;
}

uint64_t TC2TrustedRequestEndpointMetadata.nodeState.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestEndpointMetadata.nodeIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestEndpointMetadata.ohttpContext.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t TC2TrustedRequestEndpointMetadata.hasReceivedSummary.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t TC2TrustedRequestEndpointMetadata.dataReceived.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t TC2TrustedRequestEndpointMetadata.cloudOSVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestEndpointMetadata.cloudOSReleaseType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestEndpointMetadata.maybeValidatedCellID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestEndpointMetadata.ensembleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestEndpointMetadata.isFromCache.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 120);
}

__n128 TC2TrustedRequestEndpointMetadata.init(nodeState:nodeIdentifier:ohttpContext:hasReceivedSummary:dataReceived:cloudOSVersion:cloudOSReleaseType:maybeValidatedCellID:ensembleID:isFromCache:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __n128 a12, uint64_t a13, char a14)
{
  __n128 result;

  result = a12;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_BYTE *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(__n128 *)(a9 + 96) = a12;
  *(_QWORD *)(a9 + 112) = a13;
  *(_BYTE *)(a9 + 120) = a14;
  return result;
}

uint64_t sub_244A4B978(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A4B9B0 + 4 * byte_244A5CC20[a1]))(0xD000000000000012, 0x8000000244A5FC50);
}

uint64_t sub_244A4B9B0()
{
  return 0x7461745365646F6ELL;
}

uint64_t sub_244A4B9CC()
{
  return 0x6E65644965646F6ELL;
}

uint64_t sub_244A4B9F0()
{
  return 0x6E6F43707474686FLL;
}

uint64_t sub_244A4BA10()
{
  return 0x6563655261746164;
}

uint64_t sub_244A4BA30()
{
  return 0x56534F64756F6C63;
}

uint64_t sub_244A4BA78()
{
  return 0x656C626D65736E65;
}

uint64_t sub_244A4BA94()
{
  return 0x61436D6F72467369;
}

uint64_t sub_244A4BAB4()
{
  unsigned __int8 *v0;

  return sub_244A4B978(*v0);
}

uint64_t sub_244A4BABC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A4F96C(a1, a2);
  *a3 = result;
  return result;
}

void sub_244A4BAE0(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_244A4BAEC()
{
  sub_244A4BDEC();
  return sub_244A571E8();
}

uint64_t sub_244A4BB14()
{
  sub_244A4BDEC();
  return sub_244A571F4();
}

uint64_t TC2TrustedRequestEndpointMetadata.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3F78);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v26 = *(_QWORD *)(v1 + 24);
  v27 = v7;
  v25 = *(_QWORD *)(v1 + 32);
  v24 = *(unsigned __int8 *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v22 = *(_QWORD *)(v1 + 56);
  v23 = v8;
  v9 = *(_QWORD *)(v1 + 64);
  v10 = *(_QWORD *)(v1 + 72);
  v20 = *(_QWORD *)(v1 + 80);
  v21 = v9;
  v11 = *(_QWORD *)(v1 + 88);
  v18 = *(_QWORD *)(v1 + 96);
  v19 = v10;
  v15 = *(_QWORD *)(v1 + 104);
  v16 = *(_QWORD *)(v1 + 112);
  v17 = v11;
  v14[1] = *(unsigned __int8 *)(v1 + 120);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A4BDEC();
  sub_244A571DC();
  v38 = 0;
  v12 = v28;
  sub_244A570A4();
  if (!v12)
  {
    v37 = 1;
    sub_244A570A4();
    v36 = 2;
    sub_244A570EC();
    v35 = 3;
    sub_244A570B0();
    v34 = 4;
    sub_244A570EC();
    v33 = 5;
    sub_244A57074();
    v32 = 6;
    sub_244A57074();
    v31 = 7;
    sub_244A57074();
    v30 = 8;
    sub_244A57074();
    v29 = 9;
    sub_244A570B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_244A4BDEC()
{
  unint64_t result;

  result = qword_2573C3F80;
  if (!qword_2573C3F80)
  {
    result = MEMORY[0x24951D378](&unk_244A5D360, &type metadata for TC2TrustedRequestEndpointMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3F80);
  }
  return result;
}

uint64_t TC2TrustedRequestEndpointMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
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
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[2];
  _QWORD v52[5];
  char v53;
  _BYTE v54[7];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  _DWORD v66[3];
  _QWORD *v67;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3F88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v67 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_244A4BDEC();
  sub_244A571D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
  v44 = v6;
  LOBYTE(v52[0]) = 0;
  v10 = sub_244A57008();
  v12 = v11;
  LOBYTE(v52[0]) = 1;
  swift_bridgeObjectRetain();
  v13 = sub_244A57008();
  v15 = v14;
  v42 = v13;
  v43 = v12;
  LOBYTE(v52[0]) = 2;
  swift_bridgeObjectRetain();
  v16 = v15;
  v41 = sub_244A57050();
  LOBYTE(v52[0]) = 3;
  v40 = sub_244A57014();
  LOBYTE(v52[0]) = 4;
  v39 = sub_244A57050();
  LOBYTE(v52[0]) = 5;
  v37 = sub_244A56FD8();
  LOBYTE(v52[0]) = 6;
  v18 = v17;
  swift_bridgeObjectRetain();
  v19 = sub_244A56FD8();
  v38 = v20;
  v33 = v19;
  LOBYTE(v52[0]) = 7;
  swift_bridgeObjectRetain();
  v35 = 0;
  v32 = sub_244A56FD8();
  LOBYTE(v52[0]) = 8;
  v36 = v21;
  swift_bridgeObjectRetain();
  v31 = sub_244A56FD8();
  v65 = 9;
  v34 = v22;
  swift_bridgeObjectRetain();
  LOBYTE(v15) = sub_244A57014();
  v40 &= 1u;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v5);
  LODWORD(v44) = v15 & 1;
  *(_QWORD *)&v45 = v10;
  *((_QWORD *)&v45 + 1) = v43;
  *(_QWORD *)&v46 = v42;
  *((_QWORD *)&v46 + 1) = v16;
  v23 = v16;
  *(_QWORD *)&v47 = v41;
  BYTE8(v47) = v40;
  v24 = v38;
  v25 = v36;
  *(_QWORD *)&v48 = v39;
  *((_QWORD *)&v48 + 1) = v37;
  v26 = v34;
  *(_QWORD *)&v49 = v18;
  *((_QWORD *)&v49 + 1) = v33;
  *(_QWORD *)&v50 = v38;
  *((_QWORD *)&v50 + 1) = v32;
  *(_QWORD *)&v51[0] = v36;
  *((_QWORD *)&v51[0] + 1) = v31;
  *(_QWORD *)&v51[1] = v34;
  BYTE8(v51[1]) = v44;
  sub_244A4C480((uint64_t)&v45);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v27 = v50;
  a2[4] = v49;
  a2[5] = v27;
  a2[6] = v51[0];
  *(_OWORD *)((char *)a2 + 105) = *(_OWORD *)((char *)v51 + 9);
  v28 = v46;
  *a2 = v45;
  a2[1] = v28;
  v29 = v48;
  a2[2] = v47;
  a2[3] = v29;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
  v52[0] = v10;
  v52[1] = v43;
  v52[2] = v42;
  v52[3] = v23;
  v52[4] = v41;
  v53 = v40;
  *(_DWORD *)v54 = v66[0];
  *(_DWORD *)&v54[3] = *(_DWORD *)((char *)v66 + 3);
  v55 = v39;
  v56 = v37;
  v57 = v18;
  v58 = v33;
  v59 = v24;
  v60 = v32;
  v61 = v25;
  v62 = v31;
  v63 = v26;
  v64 = v44;
  return sub_244A4C4F4((uint64_t)v52);
}

uint64_t sub_244A4C480(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244A4C4F4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244A4C568@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return TC2TrustedRequestEndpointMetadata.init(from:)(a1, a2);
}

uint64_t sub_244A4C57C(_QWORD *a1)
{
  return TC2TrustedRequestEndpointMetadata.encode(to:)(a1);
}

uint64_t TC2TrustedRequestMetadata.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_244A56C9C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TC2TrustedRequestMetadata.environment.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for TC2TrustedRequestMetadata()
{
  uint64_t result;

  result = qword_2573C4078;
  if (!qword_2573C4078)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TC2TrustedRequestMetadata.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 24);
  v4 = sub_244A56C78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TC2TrustedRequestMetadata.bundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestMetadata.featureIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestMetadata.sessionIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 36);
  return sub_244A3FF0C(v3, a1);
}

uint64_t TC2TrustedRequestMetadata.qos.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestMetadata.parameters.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)(v1 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 44));
  v4 = v3[1];
  v5 = v3[2];
  *a1 = *v3;
  a1[1] = v4;
  a1[2] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t TC2TrustedRequestMetadata.state.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestMetadata.payloadTransportState.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestMetadata.responseState.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestMetadata.responseCode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 60));
}

uint64_t TC2TrustedRequestMetadata.ropesVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TC2TrustedRequestMetadata() + 64));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2TrustedRequestMetadata.endpoints.getter()
{
  type metadata accessor for TC2TrustedRequestMetadata();
  return swift_bridgeObjectRetain();
}

__n128 TC2TrustedRequestMetadata.init(id:environment:creationDate:bundleIdentifier:featureIdentifier:sessionIdentifier:qos:parameters:state:payloadTransportState:responseState:responseCode:ropesVersion:endpoints:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v29;
  uint64_t v30;
  int *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  __n128 result;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  __n128 v45;

  v29 = *a13;
  v30 = sub_244A56C9C();
  v45 = *(__n128 *)(a13 + 1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(a9, a1, v30);
  v31 = (int *)type metadata accessor for TC2TrustedRequestMetadata();
  v32 = (_QWORD *)(a9 + v31[5]);
  *v32 = a2;
  v32[1] = a3;
  v33 = a9 + v31[6];
  v34 = sub_244A56C78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v33, a4, v34);
  v35 = (_QWORD *)(a9 + v31[7]);
  *v35 = a5;
  v35[1] = a6;
  v36 = (_QWORD *)(a9 + v31[8]);
  *v36 = a7;
  v36[1] = a8;
  sub_244A4CAE0(a10, a9 + v31[9]);
  v37 = (_QWORD *)(a9 + v31[10]);
  *v37 = a11;
  v37[1] = a12;
  v38 = a9 + v31[11];
  *(_QWORD *)v38 = v29;
  result = v45;
  *(__n128 *)(v38 + 8) = v45;
  v40 = (_QWORD *)(a9 + v31[12]);
  *v40 = a14;
  v40[1] = a15;
  v41 = (_QWORD *)(a9 + v31[13]);
  *v41 = a16;
  v41[1] = a17;
  v42 = (_QWORD *)(a9 + v31[14]);
  *v42 = a18;
  v42[1] = a19;
  v43 = a9 + v31[15];
  *(_QWORD *)v43 = a20;
  *(_BYTE *)(v43 + 8) = a21 & 1;
  v44 = (_QWORD *)(a9 + v31[16]);
  *v44 = a22;
  v44[1] = a23;
  *(_QWORD *)(a9 + v31[17]) = a24;
  return result;
}

uint64_t sub_244A4CAE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244A4CB28(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A4CB64 + 4 * byte_244A5CC2A[a1]))(0xD000000000000010, 0x8000000244A5F080);
}

uint64_t sub_244A4CB64()
{
  return 25705;
}

uint64_t sub_244A4CB70()
{
  return 0x6D6E6F7269766E65;
}

uint64_t sub_244A4CB90()
{
  return 0x6E6F697461657263;
}

unint64_t sub_244A4CBB0()
{
  return 0xD000000000000011;
}

uint64_t sub_244A4CBD8()
{
  return 7565169;
}

uint64_t sub_244A4CBE8()
{
  return 0x6574656D61726170;
}

uint64_t sub_244A4CC04()
{
  return 0x6574617473;
}

uint64_t sub_244A4CC18()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_244A4CC30()
{
  return 0x65736E6F70736572;
}

uint64_t sub_244A4CC64()
{
  return 0x7265567365706F72;
}

uint64_t sub_244A4CC84()
{
  return 0x746E696F70646E65;
}

uint64_t sub_244A4CCA0()
{
  unsigned __int8 *v0;

  return sub_244A4CB28(*v0);
}

uint64_t sub_244A4CCA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A4FDA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_244A4CCCC(_BYTE *a1@<X8>)
{
  *a1 = 14;
}

uint64_t sub_244A4CCD8()
{
  sub_244A4D178();
  return sub_244A571E8();
}

uint64_t sub_244A4CD00()
{
  sub_244A4D178();
  return sub_244A571F4();
}

uint64_t TC2TrustedRequestMetadata.encode(to:)(_QWORD *a1)
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
  uint64_t *v11;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  char v16;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3F90);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A4D178();
  sub_244A571DC();
  LOBYTE(v14) = 0;
  sub_244A56C9C();
  sub_244A14624(&qword_2573C3848, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_244A570E0();
  if (!v2)
  {
    v9 = type metadata accessor for TC2TrustedRequestMetadata();
    LOBYTE(v14) = 1;
    sub_244A570A4();
    v13 = v3;
    LOBYTE(v14) = 2;
    sub_244A56C78();
    sub_244A14624(&qword_2573C2820, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_244A570E0();
    v10 = v13;
    LOBYTE(v14) = 3;
    sub_244A570A4();
    LOBYTE(v14) = 4;
    sub_244A57074();
    LOBYTE(v14) = 5;
    sub_244A57098();
    LOBYTE(v14) = 6;
    sub_244A570A4();
    v11 = (uint64_t *)(v10 + *(int *)(v9 + 44));
    v14 = *v11;
    v15 = *(_OWORD *)(v11 + 1);
    v16 = 7;
    sub_244A4011C();
    sub_244A570E0();
    LOBYTE(v14) = 8;
    sub_244A570A4();
    LOBYTE(v14) = 9;
    sub_244A570A4();
    LOBYTE(v14) = 10;
    sub_244A570A4();
    LOBYTE(v14) = 11;
    sub_244A5708C();
    LOBYTE(v14) = 12;
    sub_244A57074();
    v14 = *(_QWORD *)(v13 + *(int *)(v9 + 68));
    v16 = 13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3FA0);
    sub_244A4DA98(&qword_2573C3FA8, &qword_2573C3FA0, (uint64_t (*)(void))sub_244A3FE4C, MEMORY[0x24BEE12A0]);
    sub_244A570E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_244A4D178()
{
  unint64_t result;

  result = qword_2573C3F98;
  if (!qword_2573C3F98)
  {
    result = MEMORY[0x24951D378](&unk_244A5D310, &type metadata for TC2TrustedRequestMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3F98);
  }
  return result;
}

uint64_t TC2TrustedRequestMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int *v20;
  uint64_t *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  char *v64;
  int *v65;
  uint64_t v66;
  __int128 v67;
  char v68;

  v56 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244A56C78();
  v59 = *(_QWORD *)(v6 - 8);
  v60 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244A56C9C();
  v61 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3FB0);
  v12 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = (int *)type metadata accessor for TC2TrustedRequestMetadata();
  MEMORY[0x24BDAC7A8](v65);
  v64 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1[3];
  v62 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_244A4D178();
  v57 = v14;
  v17 = v63;
  sub_244A571D0();
  if (v17)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  v54 = v5;
  v55 = v8;
  v63 = v12;
  LOBYTE(v66) = 0;
  sub_244A14624(&qword_2573C3868, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  sub_244A57044();
  v18 = v64;
  (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v64, v11, v9);
  LOBYTE(v66) = 1;
  v19 = sub_244A57008();
  v20 = v65;
  v21 = (uint64_t *)&v18[v65[5]];
  *v21 = v19;
  v21[1] = v22;
  LOBYTE(v66) = 2;
  sub_244A14624(&qword_2573C2840, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v23 = v55;
  v24 = v60;
  sub_244A57044();
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(&v18[v20[6]], v23, v24);
  LOBYTE(v66) = 3;
  v25 = sub_244A57008();
  v26 = (uint64_t *)&v18[v20[7]];
  *v26 = v25;
  v26[1] = v27;
  LOBYTE(v66) = 4;
  v28 = sub_244A56FD8();
  v29 = (uint64_t *)&v18[v20[8]];
  *v29 = v28;
  v29[1] = v30;
  LOBYTE(v66) = 5;
  v31 = (uint64_t)v54;
  sub_244A56FFC();
  sub_244A4CAE0(v31, (uint64_t)&v18[v20[9]]);
  LOBYTE(v66) = 6;
  v32 = sub_244A57008();
  v33 = (uint64_t *)&v18[v20[10]];
  *v33 = v32;
  v33[1] = v34;
  v68 = 7;
  sub_244A2EB6C();
  sub_244A57044();
  v35 = &v18[v20[11]];
  *(_QWORD *)v35 = v66;
  *(_OWORD *)(v35 + 8) = v67;
  LOBYTE(v66) = 8;
  v36 = sub_244A57008();
  v37 = (uint64_t *)&v18[v20[12]];
  *v37 = v36;
  v37[1] = v38;
  LOBYTE(v66) = 9;
  v39 = sub_244A57008();
  v40 = (uint64_t *)&v64[v65[13]];
  *v40 = v39;
  v40[1] = v41;
  LOBYTE(v66) = 10;
  v42 = sub_244A57008();
  v43 = (uint64_t *)&v64[v65[14]];
  *v43 = v42;
  v43[1] = v44;
  LOBYTE(v66) = 11;
  v45 = sub_244A56FF0();
  v46 = &v64[v65[15]];
  *(_QWORD *)v46 = v45;
  v46[8] = v47 & 1;
  LOBYTE(v66) = 12;
  v48 = sub_244A56FD8();
  v49 = (uint64_t *)&v64[v65[16]];
  *v49 = v48;
  v49[1] = v50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3FA0);
  v68 = 13;
  sub_244A4DA98(&qword_2573C3FB8, &qword_2573C3FA0, (uint64_t (*)(void))sub_244A2EAC4, MEMORY[0x24BEE12D0]);
  sub_244A57044();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v57, v58);
  v51 = (uint64_t)v64;
  *(_QWORD *)&v64[v65[17]] = v66;
  sub_244A4DAFC(v51, v56);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  return sub_244A4DB40(v51);
}

uint64_t sub_244A4DA98(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24951D378](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244A4DAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TC2TrustedRequestMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244A4DB40(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TC2TrustedRequestMetadata();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244A4DB7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TC2TrustedRequestMetadata.init(from:)(a1, a2);
}

uint64_t sub_244A4DB90(_QWORD *a1)
{
  return TC2TrustedRequestMetadata.encode(to:)(a1);
}

uint64_t TC2TrustedRequestFactoryMetadata.requests.getter()
{
  return swift_bridgeObjectRetain();
}

PrivateCloudCompute::TC2TrustedRequestFactoryMetadata __swiftcall TC2TrustedRequestFactoryMetadata.init(requests:)(PrivateCloudCompute::TC2TrustedRequestFactoryMetadata requests)
{
  PrivateCloudCompute::TC2TrustedRequestFactoryMetadata *v1;

  v1->requests._rawValue = requests.requests._rawValue;
  return requests;
}

uint64_t sub_244A4DBB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A50310(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_244A4DBE0()
{
  sub_244A4DD58();
  return sub_244A571E8();
}

uint64_t sub_244A4DC08()
{
  sub_244A4DD58();
  return sub_244A571F4();
}

uint64_t TC2TrustedRequestFactoryMetadata.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3FC0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A4DD58();
  sub_244A571DC();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3FD0);
  sub_244A4DD9C(&qword_2573C3FD8, &qword_2573C3D98, (uint64_t)&protocol conformance descriptor for TC2TrustedRequestMetadata, MEMORY[0x24BEE12A0]);
  sub_244A570E0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_244A4DD58()
{
  unint64_t result;

  result = qword_2573C3FC8;
  if (!qword_2573C3FC8)
  {
    result = MEMORY[0x24951D378](&unk_244A5D2C0, &type metadata for TC2TrustedRequestFactoryMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3FC8);
  }
  return result;
}

uint64_t sub_244A4DD9C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573C3FD0);
    v10 = sub_244A14624(a2, (uint64_t (*)(uint64_t))type metadata accessor for TC2TrustedRequestMetadata, a3);
    result = MEMORY[0x24951D378](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t TC2TrustedRequestFactoryMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3FE0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A4DD58();
  sub_244A571D0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3FD0);
    sub_244A4DD9C(&qword_2573C3FE8, &qword_2573C3500, (uint64_t)&protocol conformance descriptor for TC2TrustedRequestMetadata, MEMORY[0x24BEE12D0]);
    sub_244A57044();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_244A4DF68@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return TC2TrustedRequestFactoryMetadata.init(from:)(a1, a2);
}

uint64_t sub_244A4DF7C(_QWORD *a1)
{
  return TC2TrustedRequestFactoryMetadata.encode(to:)(a1);
}

uint64_t sub_244A4DF90()
{
  sub_244A4E108();
  return sub_244A571E8();
}

uint64_t sub_244A4DFB8()
{
  sub_244A4E108();
  return sub_244A571F4();
}

uint64_t TC2TrustedRequestFactoriesMetadata.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3FF0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A4E108();
  sub_244A571DC();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4000);
  sub_244A4DA98(&qword_2573C4008, &qword_2573C4000, (uint64_t (*)(void))sub_244A3FE08, MEMORY[0x24BEE12A0]);
  sub_244A570E0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_244A4E108()
{
  unint64_t result;

  result = qword_2573C3FF8;
  if (!qword_2573C3FF8)
  {
    result = MEMORY[0x24951D378](&unk_244A5D270, &type metadata for TC2TrustedRequestFactoriesMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C3FF8);
  }
  return result;
}

uint64_t TC2TrustedRequestFactoriesMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4010);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A4E108();
  sub_244A571D0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4000);
    sub_244A4DA98(&qword_2573C4018, &qword_2573C4000, (uint64_t (*)(void))sub_244A2EA80, MEMORY[0x24BEE12D0]);
    sub_244A57044();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_244A4E294@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return TC2TrustedRequestFactoriesMetadata.init(from:)(a1, a2);
}

uint64_t sub_244A4E2A8(_QWORD *a1)
{
  return TC2TrustedRequestFactoriesMetadata.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for TC2TrustedRequestEndpointMetadata()
{
  return &type metadata for TC2TrustedRequestEndpointMetadata;
}

uint64_t *initializeBufferWithCopyOfBuffer for TC2TrustedRequestMetadata(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  void (*v61)(uint64_t *, uint64_t *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244A56C9C();
    v8 = *(_QWORD *)(v7 - 8);
    v61 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v61(a1, a2, v7);
    v9 = a3[5];
    v10 = a3[6];
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (char *)a1 + v10;
    v15 = (char *)a2 + v10;
    v16 = sub_244A56C78();
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    swift_bridgeObjectRetain();
    v17(v14, v15, v16);
    v18 = a3[7];
    v19 = a3[8];
    v20 = (uint64_t *)((char *)a1 + v18);
    v21 = (uint64_t *)((char *)a2 + v18);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = (uint64_t *)((char *)a1 + v19);
    v24 = (uint64_t *)((char *)a2 + v19);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = a3[9];
    v27 = (char *)a1 + v26;
    v28 = (char *)a2 + v26;
    v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29(v28, 1, v7))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      v61((uint64_t *)v27, (uint64_t *)v28, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v27, 0, 1, v7);
    }
    v32 = a3[10];
    v33 = a3[11];
    v34 = (uint64_t *)((char *)a1 + v32);
    v35 = (uint64_t *)((char *)a2 + v32);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = (uint64_t *)((char *)a1 + v33);
    v38 = (uint64_t *)((char *)a2 + v33);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    v37[2] = v38[2];
    v40 = a3[12];
    v41 = a3[13];
    v42 = (uint64_t *)((char *)a1 + v40);
    v43 = (uint64_t *)((char *)a2 + v40);
    v44 = v43[1];
    *v42 = *v43;
    v42[1] = v44;
    v45 = (uint64_t *)((char *)a1 + v41);
    v46 = (uint64_t *)((char *)a2 + v41);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    v48 = a3[14];
    v49 = a3[15];
    v50 = (uint64_t *)((char *)a1 + v48);
    v51 = (uint64_t *)((char *)a2 + v48);
    v52 = v51[1];
    *v50 = *v51;
    v50[1] = v52;
    v53 = (char *)a1 + v49;
    v54 = (char *)a2 + v49;
    *(_QWORD *)v53 = *(_QWORD *)v54;
    v53[8] = v54[8];
    v55 = a3[16];
    v56 = a3[17];
    v57 = (uint64_t *)((char *)a1 + v55);
    v58 = (uint64_t *)((char *)a2 + v55);
    v59 = v58[1];
    *v57 = *v58;
    v57[1] = v59;
    *(uint64_t *)((char *)a1 + v56) = *(uint64_t *)((char *)a2 + v56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TC2TrustedRequestMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_244A56C9C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(a2 + 24);
  v8 = sub_244A56C78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = a1 + *(int *)(a2 + 36);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4))
    v6(v9, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for TC2TrustedRequestMetadata(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  unsigned int (*v28)(const void *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void (*v59)(void *, const void *, uint64_t);

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v59 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v59(a1, a2, v6);
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *((_QWORD *)v11 + 1);
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = v12;
  v13 = &a1[v9];
  v14 = &a2[v9];
  v15 = sub_244A56C78();
  v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  v16(v13, v14, v15);
  v17 = a3[7];
  v18 = a3[8];
  v19 = &a1[v17];
  v20 = &a2[v17];
  v21 = *((_QWORD *)v20 + 1);
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *((_QWORD *)v19 + 1) = v21;
  v22 = &a1[v18];
  v23 = &a2[v18];
  v24 = *((_QWORD *)v23 + 1);
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *((_QWORD *)v22 + 1) = v24;
  v25 = a3[9];
  v26 = &a1[v25];
  v27 = &a2[v25];
  v28 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v28(v27, 1, v6))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    v59(v26, v27, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v6);
  }
  v30 = a3[10];
  v31 = a3[11];
  v32 = &a1[v30];
  v33 = &a2[v30];
  v34 = *((_QWORD *)v33 + 1);
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *((_QWORD *)v32 + 1) = v34;
  v35 = &a1[v31];
  v36 = &a2[v31];
  v37 = *((_QWORD *)v36 + 1);
  *(_QWORD *)v35 = *(_QWORD *)v36;
  *((_QWORD *)v35 + 1) = v37;
  *((_QWORD *)v35 + 2) = *((_QWORD *)v36 + 2);
  v38 = a3[12];
  v39 = a3[13];
  v40 = &a1[v38];
  v41 = &a2[v38];
  v42 = *((_QWORD *)v41 + 1);
  *(_QWORD *)v40 = *(_QWORD *)v41;
  *((_QWORD *)v40 + 1) = v42;
  v43 = &a1[v39];
  v44 = &a2[v39];
  v45 = *((_QWORD *)v44 + 1);
  *(_QWORD *)v43 = *(_QWORD *)v44;
  *((_QWORD *)v43 + 1) = v45;
  v46 = a3[14];
  v47 = a3[15];
  v48 = &a1[v46];
  v49 = &a2[v46];
  v50 = *((_QWORD *)v49 + 1);
  *(_QWORD *)v48 = *(_QWORD *)v49;
  *((_QWORD *)v48 + 1) = v50;
  v51 = &a1[v47];
  v52 = &a2[v47];
  *(_QWORD *)v51 = *(_QWORD *)v52;
  v51[8] = v52[8];
  v53 = a3[16];
  v54 = a3[17];
  v55 = &a1[v53];
  v56 = &a2[v53];
  v57 = *((_QWORD *)v56 + 1);
  *(_QWORD *)v55 = *(_QWORD *)v56;
  *((_QWORD *)v55 + 1) = v57;
  *(_QWORD *)&a1[v54] = *(_QWORD *)&a2[v54];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for TC2TrustedRequestMetadata(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t (*v25)(const void *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = *((_QWORD *)v11 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[7];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a3[8];
  v20 = &a1[v19];
  v21 = &a2[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22 = a3[9];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v26 = v25(&a1[v22], 1, v6);
  v27 = v25(v24, 1, v6);
  if (!v26)
  {
    if (!v27)
    {
      v8(v23, v24, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v23, v6);
    goto LABEL_6;
  }
  if (v27)
  {
LABEL_6:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v23, v24, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v23, 0, 1, v6);
LABEL_7:
  v29 = a3[10];
  v30 = &a1[v29];
  v31 = &a2[v29];
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *((_QWORD *)v30 + 1) = *((_QWORD *)v31 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32 = a3[11];
  v33 = &a1[v32];
  v34 = &a2[v32];
  *(_QWORD *)v33 = *(_QWORD *)&a2[v32];
  *((_QWORD *)v33 + 1) = *(_QWORD *)&a2[v32 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v33 + 2) = *((_QWORD *)v34 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = a3[12];
  v36 = &a1[v35];
  v37 = &a2[v35];
  *(_QWORD *)v36 = *(_QWORD *)v37;
  *((_QWORD *)v36 + 1) = *((_QWORD *)v37 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v38 = a3[13];
  v39 = &a1[v38];
  v40 = &a2[v38];
  *(_QWORD *)v39 = *(_QWORD *)v40;
  *((_QWORD *)v39 + 1) = *((_QWORD *)v40 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41 = a3[14];
  v42 = &a1[v41];
  v43 = &a2[v41];
  *(_QWORD *)v42 = *(_QWORD *)v43;
  *((_QWORD *)v42 + 1) = *((_QWORD *)v43 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v44 = a3[15];
  v45 = &a1[v44];
  v46 = &a2[v44];
  v47 = *(_QWORD *)v46;
  v45[8] = v46[8];
  *(_QWORD *)v45 = v47;
  v48 = a3[16];
  v49 = &a1[v48];
  v50 = &a2[v48];
  *(_QWORD *)v49 = *(_QWORD *)v50;
  *((_QWORD *)v49 + 1) = *((_QWORD *)v50 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[17]] = *(_QWORD *)&a2[a3[17]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for TC2TrustedRequestMetadata(char *a1, char *a2, int *a3)
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
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  v14 = a3[9];
  v15 = &a1[v14];
  v16 = &a2[v14];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v14], 1, v6))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v8(v15, v16, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  v18 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  v19 = &a1[v18];
  v20 = &a2[v18];
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
  v21 = a3[13];
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  v22 = a3[15];
  *(_OWORD *)&a1[a3[14]] = *(_OWORD *)&a2[a3[14]];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v23[8] = v24[8];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v25 = a3[17];
  *(_OWORD *)&a1[a3[16]] = *(_OWORD *)&a2[a3[16]];
  *(_QWORD *)&a1[v25] = *(_QWORD *)&a2[v25];
  return a1;
}

char *assignWithTake for TC2TrustedRequestMetadata(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t (*v31)(const void *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = (uint64_t *)&a2[v9];
  v13 = *v11;
  v12 = v11[1];
  *(_QWORD *)v10 = v13;
  *((_QWORD *)v10 + 1) = v12;
  swift_bridgeObjectRelease();
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_244A56C78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  v18 = a3[7];
  v19 = &a1[v18];
  v20 = (uint64_t *)&a2[v18];
  v22 = *v20;
  v21 = v20[1];
  *(_QWORD *)v19 = v22;
  *((_QWORD *)v19 + 1) = v21;
  swift_bridgeObjectRelease();
  v23 = a3[8];
  v24 = &a1[v23];
  v25 = (uint64_t *)&a2[v23];
  v27 = *v25;
  v26 = v25[1];
  *(_QWORD *)v24 = v27;
  *((_QWORD *)v24 + 1) = v26;
  swift_bridgeObjectRelease();
  v28 = a3[9];
  v29 = &a1[v28];
  v30 = &a2[v28];
  v31 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v32 = v31(&a1[v28], 1, v6);
  v33 = v31(v30, 1, v6);
  if (!v32)
  {
    if (!v33)
    {
      v8(v29, v30, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v29, v6);
    goto LABEL_6;
  }
  if (v33)
  {
LABEL_6:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v29, v30, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v29, 0, 1, v6);
LABEL_7:
  v35 = a3[10];
  v36 = &a1[v35];
  v37 = (uint64_t *)&a2[v35];
  v39 = *v37;
  v38 = v37[1];
  *(_QWORD *)v36 = v39;
  *((_QWORD *)v36 + 1) = v38;
  swift_bridgeObjectRelease();
  v40 = a3[11];
  v41 = &a1[v40];
  v42 = &a2[v40];
  v43 = *(_QWORD *)&a2[v40 + 8];
  *(_QWORD *)v41 = *(_QWORD *)&a2[v40];
  *((_QWORD *)v41 + 1) = v43;
  swift_bridgeObjectRelease();
  *((_QWORD *)v41 + 2) = *((_QWORD *)v42 + 2);
  swift_bridgeObjectRelease();
  v44 = a3[12];
  v45 = &a1[v44];
  v46 = (uint64_t *)&a2[v44];
  v48 = *v46;
  v47 = v46[1];
  *(_QWORD *)v45 = v48;
  *((_QWORD *)v45 + 1) = v47;
  swift_bridgeObjectRelease();
  v49 = a3[13];
  v50 = &a1[v49];
  v51 = (uint64_t *)&a2[v49];
  v53 = *v51;
  v52 = v51[1];
  *(_QWORD *)v50 = v53;
  *((_QWORD *)v50 + 1) = v52;
  swift_bridgeObjectRelease();
  v54 = a3[14];
  v55 = &a1[v54];
  v56 = (uint64_t *)&a2[v54];
  v58 = *v56;
  v57 = v56[1];
  *(_QWORD *)v55 = v58;
  *((_QWORD *)v55 + 1) = v57;
  swift_bridgeObjectRelease();
  v59 = a3[15];
  v60 = a3[16];
  v61 = &a1[v59];
  v62 = &a2[v59];
  *(_QWORD *)v61 = *(_QWORD *)v62;
  v61[8] = v62[8];
  v63 = &a1[v60];
  v64 = (uint64_t *)&a2[v60];
  v66 = *v64;
  v65 = v64[1];
  *(_QWORD *)v63 = v66;
  *((_QWORD *)v63 + 1) = v65;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[17]] = *(_QWORD *)&a2[a3[17]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TC2TrustedRequestMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A4EFEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_244A56C9C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v13 = sub_244A56C78();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == (_DWORD)a2)
    {
      v8 = v13;
      v15 = a3[6];
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
      v14 = *(_QWORD *)(v8 - 8);
      v15 = a3[9];
    }
    v10 = a1 + v15;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[5] + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2TrustedRequestMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A4F0CC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = sub_244A56C9C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[5] + 8) = (a2 - 1);
      return result;
    }
    v13 = sub_244A56C78();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[6];
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3718);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[9];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_244A4F19C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_244A56C9C();
  if (v0 <= 0x3F)
  {
    sub_244A56C78();
    if (v1 <= 0x3F)
    {
      sub_244A4ABBC();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for TC2TrustedRequestFactoryMetadata()
{
  return &type metadata for TC2TrustedRequestFactoryMetadata;
}

ValueMetadata *type metadata accessor for TC2TrustedRequestFactoriesMetadata()
{
  return &type metadata for TC2TrustedRequestFactoriesMetadata;
}

ValueMetadata *type metadata accessor for TC2TrustedRequestFactoriesMetadata.CodingKeys()
{
  return &type metadata for TC2TrustedRequestFactoriesMetadata.CodingKeys;
}

uint64_t _s19PrivateCloudCompute34TC2TrustedRequestFactoriesMetadataV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244A4F2F8 + 4 * byte_244A5CC38[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244A4F318 + 4 * byte_244A5CC3D[v4]))();
}

_BYTE *sub_244A4F2F8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244A4F318(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244A4F320(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244A4F328(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244A4F330(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244A4F338(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TC2TrustedRequestFactoryMetadata.CodingKeys()
{
  return &type metadata for TC2TrustedRequestFactoryMetadata.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TC2TrustedRequestMetadata.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2TrustedRequestMetadata.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_244A4F430 + 4 * byte_244A5CC47[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_244A4F464 + 4 * byte_244A5CC42[v4]))();
}

uint64_t sub_244A4F464(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A4F46C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A4F474);
  return result;
}

uint64_t sub_244A4F480(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A4F488);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_244A4F48C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A4F494(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2TrustedRequestMetadata.CodingKeys()
{
  return &type metadata for TC2TrustedRequestMetadata.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TC2TrustedRequestEndpointMetadata.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2TrustedRequestEndpointMetadata.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A4F58C + 4 * byte_244A5CC51[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_244A4F5C0 + 4 * byte_244A5CC4C[v4]))();
}

uint64_t sub_244A4F5C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A4F5C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A4F5D0);
  return result;
}

uint64_t sub_244A4F5DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A4F5E4);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_244A4F5E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A4F5F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2TrustedRequestEndpointMetadata.CodingKeys()
{
  return &type metadata for TC2TrustedRequestEndpointMetadata.CodingKeys;
}

unint64_t sub_244A4F610()
{
  unint64_t result;

  result = qword_2573C40E0;
  if (!qword_2573C40E0)
  {
    result = MEMORY[0x24951D378](&unk_244A5D020, &type metadata for TC2TrustedRequestEndpointMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C40E0);
  }
  return result;
}

unint64_t sub_244A4F658()
{
  unint64_t result;

  result = qword_2573C40E8;
  if (!qword_2573C40E8)
  {
    result = MEMORY[0x24951D378](&unk_244A5D0D8, &type metadata for TC2TrustedRequestMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C40E8);
  }
  return result;
}

unint64_t sub_244A4F6A0()
{
  unint64_t result;

  result = qword_2573C40F0;
  if (!qword_2573C40F0)
  {
    result = MEMORY[0x24951D378](&unk_244A5D190, &type metadata for TC2TrustedRequestFactoryMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C40F0);
  }
  return result;
}

unint64_t sub_244A4F6E8()
{
  unint64_t result;

  result = qword_2573C40F8;
  if (!qword_2573C40F8)
  {
    result = MEMORY[0x24951D378](&unk_244A5D248, &type metadata for TC2TrustedRequestFactoriesMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C40F8);
  }
  return result;
}

unint64_t sub_244A4F730()
{
  unint64_t result;

  result = qword_2573C4100;
  if (!qword_2573C4100)
  {
    result = MEMORY[0x24951D378](&unk_244A5D1B8, &type metadata for TC2TrustedRequestFactoriesMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4100);
  }
  return result;
}

unint64_t sub_244A4F778()
{
  unint64_t result;

  result = qword_2573C4108;
  if (!qword_2573C4108)
  {
    result = MEMORY[0x24951D378](&unk_244A5D1E0, &type metadata for TC2TrustedRequestFactoriesMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4108);
  }
  return result;
}

unint64_t sub_244A4F7C0()
{
  unint64_t result;

  result = qword_2573C4110;
  if (!qword_2573C4110)
  {
    result = MEMORY[0x24951D378](&unk_244A5D100, &type metadata for TC2TrustedRequestFactoryMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4110);
  }
  return result;
}

unint64_t sub_244A4F808()
{
  unint64_t result;

  result = qword_2573C4118;
  if (!qword_2573C4118)
  {
    result = MEMORY[0x24951D378](&unk_244A5D128, &type metadata for TC2TrustedRequestFactoryMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4118);
  }
  return result;
}

unint64_t sub_244A4F850()
{
  unint64_t result;

  result = qword_2573C4120;
  if (!qword_2573C4120)
  {
    result = MEMORY[0x24951D378](&unk_244A5D048, &type metadata for TC2TrustedRequestMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4120);
  }
  return result;
}

unint64_t sub_244A4F898()
{
  unint64_t result;

  result = qword_2573C4128;
  if (!qword_2573C4128)
  {
    result = MEMORY[0x24951D378](&unk_244A5D070, &type metadata for TC2TrustedRequestMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4128);
  }
  return result;
}

unint64_t sub_244A4F8E0()
{
  unint64_t result;

  result = qword_2573C4130;
  if (!qword_2573C4130)
  {
    result = MEMORY[0x24951D378](&unk_244A5CF90, &type metadata for TC2TrustedRequestEndpointMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4130);
  }
  return result;
}

unint64_t sub_244A4F928()
{
  unint64_t result;

  result = qword_2573C4138;
  if (!qword_2573C4138)
  {
    result = MEMORY[0x24951D378](&unk_244A5CFB8, &type metadata for TC2TrustedRequestEndpointMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4138);
  }
  return result;
}

uint64_t sub_244A4F96C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7461745365646F6ELL && a2 == 0xE900000000000065;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65644965646F6ELL && a2 == 0xEE00726569666974 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F43707474686FLL && a2 == 0xEC00000074786574 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244A5FC50 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6563655261746164 && a2 == 0xEC00000064657669 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x56534F64756F6C63 && a2 == 0xEE006E6F69737265 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000244A5F1D0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000244A5FC70 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x656C626D65736E65 && a2 == 0xEA00000000004449 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x61436D6F72467369 && a2 == 0xEB00000000656863)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

uint64_t sub_244A4FDA0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6E6F7269766E65 && a2 == 0xEB00000000746E65 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000244A5F080 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000244A5F0A0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000244A5FC90 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 7565169 && a2 == 0xE300000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000244A5FCB0 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xED00006574617453 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F43 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x7265567365706F72 && a2 == 0xEC0000006E6F6973 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x746E696F70646E65 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 13;
    else
      return 14;
  }
}

uint64_t sub_244A502F8()
{
  return 0x7374736575716572;
}

uint64_t sub_244A50310(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7374736575716572 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_244A5711C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_244A503A0(uint64_t a1, unint64_t a2)
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12[3];

  sub_244A26DC4(a1, a2);
  sub_244A26DC4(a1, a2);
  v4 = sub_244A56CC0();
  v5 = sub_244A56E70();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v12[0] = v11;
    *(_DWORD *)v6 = 136315394;
    sub_244A564F0(0x6574796228646461, 0xEB00000000293A73, v12);
    sub_244A56EC4();
    *(_WORD *)(v6 + 12) = 2080;
    sub_244A26DC4(a1, a2);
    v7 = sub_244A56BB8();
    v9 = v8;
    sub_244A26E1C(a1, a2);
    sub_244A564F0(v7, v9, v12);
    sub_244A56EC4();
    swift_bridgeObjectRelease();
    sub_244A26E1C(a1, a2);
    sub_244A26E1C(a1, a2);
    _os_log_impl(&dword_244A12000, v4, v5, "%s: adding %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24951D420](v11, -1, -1);
    MEMORY[0x24951D420](v6, -1, -1);

  }
  else
  {

    sub_244A26E1C(a1, a2);
    sub_244A26E1C(a1, a2);
  }
  swift_beginAccess();
  sub_244A56BE8();
  return swift_endAccess();
}

uint64_t sub_244A505D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9[3];

  if (a1)
  {
    v2 = v1;
    swift_retain();
    v3 = sub_244A56CC0();
    v4 = sub_244A56E70();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = swift_slowAlloc();
      v9[0] = swift_slowAlloc();
      *(_DWORD *)v5 = 136315650;
      sub_244A564F0(0xD000000000000011, 0x8000000244A5FD10, v9);
      sub_244A56EC4();
      *(_WORD *)(v5 + 12) = 2048;
      sub_244A56EC4();
      *(_WORD *)(v5 + 22) = 2048;
      v6 = v2 + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_buffer;
      swift_beginAccess();
      __asm { BR              X13 }
    }
    swift_release();

    v7 = v2 + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_buffer;
    swift_beginAccess();
    __asm { BR              X10 }
  }
  return 0;
}

void sub_244A508F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X9 }
  __break(1u);
  JUMPOUT(0x244A50A40);
}

uint64_t sub_244A50A74(uint64_t result)
{
  if (result)
  {
    if ((result & 0x8000000000000000) == 0)
      __asm { BR              X9 }
    __break(1u);
    JUMPOUT(0x244A50B80);
  }
  return result;
}

uint64_t sub_244A50BA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_logger;
  v2 = sub_244A56CD8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_244A26E1C(*(_QWORD *)(v0 + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_buffer), *(_QWORD *)(v0 + OBJC_IVAR____TtC19PrivateCloudCompute25TC2StreamingMessageBuffer_buffer + 8));
  return swift_deallocClassInstance();
}

uint64_t sub_244A50C0C()
{
  return type metadata accessor for TC2StreamingMessageBuffer();
}

uint64_t type metadata accessor for TC2StreamingMessageBuffer()
{
  uint64_t result;

  result = qword_2573C4168;
  if (!qword_2573C4168)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_244A50C50()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244A56CD8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_244A50CC4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4;
  uint64_t v5;

  v4 = __OFADD__(a1, a2);
  v5 = a1 + a2;
  if (v4)
  {
    __break(1u);
    JUMPOUT(0x244A50D24);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_244A50CDC + *((int *)qword_244A50D28 + (a4 >> 62))))(v5);
}

uint64_t sub_244A50D38(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_244A50D48 + *((int *)qword_244A50DF0 + (a4 >> 62))))();
}

uint64_t sub_244A50D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, unsigned int a3@<W8>)
{
  if (BYTE6(a2) < a1 || a1 < 0)
  {
    __break(1u);
    JUMPOUT(0x244A50DE8);
  }
  return ((uint64_t (*)(void))((char *)&loc_244A50D98 + *((int *)qword_244A50E00 + a3)))();
}

uint64_t sub_244A50E10(char a1)
{
  return *(_QWORD *)&aWaiting_0[8 * a1];
}

uint64_t sub_244A50E30()
{
  char *v0;

  return sub_244A50E10(*v0);
}

uint64_t sub_244A50E38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_244A53E50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A50E5C()
{
  sub_244A51428();
  return sub_244A571E8();
}

uint64_t sub_244A50E84()
{
  sub_244A51428();
  return sub_244A571F4();
}

uint64_t sub_244A50EAC()
{
  sub_244A514B0();
  return sub_244A571E8();
}

uint64_t sub_244A50ED4()
{
  sub_244A514B0();
  return sub_244A571F4();
}

uint64_t sub_244A50EFC()
{
  sub_244A51530();
  return sub_244A571E8();
}

uint64_t sub_244A50F24()
{
  sub_244A51530();
  return sub_244A571F4();
}

uint64_t sub_244A50F4C()
{
  sub_244A51574();
  return sub_244A571E8();
}

uint64_t sub_244A50F74()
{
  sub_244A51574();
  return sub_244A571F4();
}

uint64_t sub_244A50F9C()
{
  sub_244A515B8();
  return sub_244A571E8();
}

uint64_t sub_244A50FC4()
{
  sub_244A515B8();
  return sub_244A571F4();
}

void TC2RequestState.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4230);
  v18 = *(_QWORD *)(v2 - 8);
  v19 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v17 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TrustedCloudComputeError(0);
  MEMORY[0x24BDAC7A8](v15);
  v16 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4238);
  v23 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v22 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4240);
  v20 = *(_QWORD *)(v7 - 8);
  v21 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4248);
  MEMORY[0x24BDAC7A8](v14);
  v8 = type metadata accessor for TC2RequestState();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4250);
  v25 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244A51428();
  sub_244A571DC();
  sub_244A5146C(v26, (uint64_t)v10);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  v13 = (char *)sub_244A51240
      + 4
      * byte_244A5D3F0[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v10, 3, v12)];
  __asm { BR              X10 }
}

uint64_t sub_244A51240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v3 - 176);
  sub_244A1AAC0(v2, v4, type metadata accessor for TrustedCloudComputeError);
  *(_BYTE *)(v3 - 65) = 3;
  sub_244A514B0();
  v5 = *(_QWORD *)(v3 - 168);
  sub_244A57068();
  sub_244A51C30(&qword_2573C3DB8, (uint64_t)&protocol conformance descriptor for TrustedCloudComputeError);
  v6 = *(_QWORD *)(v3 - 152);
  sub_244A570E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 160) + 8))(v5, v6);
  sub_244A514F4(v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 104) + 8))(v1, v0);
}

uint64_t type metadata accessor for TC2RequestState()
{
  uint64_t result;

  result = qword_2573C4320;
  if (!qword_2573C4320)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_244A51428()
{
  unint64_t result;

  result = qword_2573C4258;
  if (!qword_2573C4258)
  {
    result = MEMORY[0x24951D378](&unk_244A5D8F4, &type metadata for TC2RequestState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4258);
  }
  return result;
}

uint64_t sub_244A5146C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TC2RequestState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_244A514B0()
{
  unint64_t result;

  result = qword_2573C4268;
  if (!qword_2573C4268)
  {
    result = MEMORY[0x24951D378](&unk_244A5D8A4, &type metadata for TC2RequestState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4268);
  }
  return result;
}

uint64_t sub_244A514F4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TrustedCloudComputeError(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_244A51530()
{
  unint64_t result;

  result = qword_2573C4270;
  if (!qword_2573C4270)
  {
    result = MEMORY[0x24951D378](&unk_244A5D854, &type metadata for TC2RequestState.FinishedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4270);
  }
  return result;
}

unint64_t sub_244A51574()
{
  unint64_t result;

  result = qword_2573C4278;
  if (!qword_2573C4278)
  {
    result = MEMORY[0x24951D378](&unk_244A5D804, &type metadata for TC2RequestState.ReadyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4278);
  }
  return result;
}

unint64_t sub_244A515B8()
{
  unint64_t result;

  result = qword_2573C4280;
  if (!qword_2573C4280)
  {
    result = MEMORY[0x24951D378](&unk_244A5D7B4, &type metadata for TC2RequestState.WaitingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4280);
  }
  return result;
}

uint64_t TC2RequestState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD v27[15];
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;

  v27[13] = a2;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4288);
  v27[9] = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v27[12] = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4290);
  v27[7] = *(_QWORD *)(v4 - 8);
  v27[8] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v27[11] = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4298);
  v27[5] = *(_QWORD *)(v6 - 8);
  v27[6] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v27[14] = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C42A0);
  v27[3] = *(_QWORD *)(v8 - 8);
  v27[4] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v27[10] = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C42A8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TC2RequestState();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v27 - v18;
  v20 = a1[3];
  v29 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_244A51428();
  v21 = v30;
  sub_244A571D0();
  if (!v21)
  {
    v27[1] = v17;
    v27[2] = v19;
    v30 = v11;
    v22 = sub_244A5705C();
    if (*(_QWORD *)(v22 + 16) == 1)
      __asm { BR              X10 }
    v23 = sub_244A56F3C();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573C28C0);
    *v25 = v14;
    sub_244A56FCC();
    sub_244A56F30();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v10);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

uint64_t sub_244A51C30(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for TrustedCloudComputeError(255);
    result = MEMORY[0x24951D378](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_244A51C70@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TC2RequestState.init(from:)(a1, a2);
}

void sub_244A51C84(_QWORD *a1)
{
  TC2RequestState.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for TC2RequestState(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
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
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v44;
  char *v45;
  char *v46;
  char *v47;

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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = type metadata accessor for TrustedCloudComputeError(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
          v11 = a2[1];
          *a1 = *a2;
          a1[1] = v11;
          v12 = a2[3];
          a1[2] = a2[2];
          a1[3] = v12;
          v13 = a2[5];
          a1[4] = a2[4];
          a1[5] = v13;
          a1[6] = a2[6];
          *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
          v14 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
          v46 = (char *)a2 + v14;
          v47 = (char *)a1 + v14;
          v15 = sub_244A56C78();
          v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v16(v47, v46, v15);
          goto LABEL_15;
        case 1u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          v17 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
          v18 = (char *)a1 + v17;
          v19 = (char *)a2 + v17;
          v20 = sub_244A56C78();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
          goto LABEL_15;
        case 2u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          v21 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
          v22 = (char *)a1 + v21;
          v23 = (char *)a2 + v21;
          v24 = sub_244A56C78();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
          goto LABEL_15;
        case 5u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          *(_WORD *)((char *)a1 + 1) = *(_WORD *)((char *)a2 + 1);
          v25 = a2[2];
          a1[1] = a2[1];
          a1[2] = v25;
          v26 = a2[4];
          a1[3] = a2[3];
          a1[4] = v26;
          a1[5] = a2[5];
          *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
          v27 = a2[8];
          a1[7] = a2[7];
          a1[8] = v27;
          v28 = a2[10];
          a1[9] = a2[9];
          a1[10] = v28;
          v29 = a2[12];
          a1[11] = a2[11];
          a1[12] = v29;
          v30 = a2[14];
          a1[13] = a2[13];
          a1[14] = v30;
          v31 = a2[16];
          a1[15] = a2[15];
          a1[16] = v31;
          v32 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
          v44 = (char *)a2 + v32;
          v45 = (char *)a1 + v32;
          v33 = sub_244A56C78();
          v34 = *(_QWORD *)(v33 - 8);
          v35 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v35(v45, v44, v33);
          v36 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
          *((_BYTE *)a1 + *(int *)(v36 + 20)) = *((_BYTE *)a2 + *(int *)(v36 + 20));
          v37 = *(int *)(v36 + 24);
          v38 = (char *)a1 + v37;
          v39 = (char *)a2 + v37;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v39, 1, v33))
          {
            v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
            memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
          }
          else
          {
            v35(v38, v39, v33);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v38, 0, 1, v33);
          }
          goto LABEL_15;
        case 6u:
          v41 = a2[1];
          *a1 = *a2;
          a1[1] = v41;
          *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
          swift_bridgeObjectRetain();
          goto LABEL_15;
        case 7u:
          v42 = a2[1];
          *a1 = *a2;
          a1[1] = v42;
          *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
          a1[4] = a2[4];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
LABEL_15:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
          break;
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for TC2RequestState(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
  if (!(_DWORD)result)
  {
    type metadata accessor for TrustedCloudComputeError(0);
    result = swift_getEnumCaseMultiPayload();
    switch((int)result)
    {
      case 0:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v4 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
        goto LABEL_8;
      case 1:
        v5 = type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0);
        goto LABEL_7;
      case 2:
        v5 = type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0);
LABEL_7:
        v4 = *(int *)(v5 + 20);
LABEL_8:
        v6 = a1 + v4;
        v7 = sub_244A56C78();
        v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
        v9 = v6;
        goto LABEL_9;
      case 5:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v10 = a1 + *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
        v11 = sub_244A56C78();
        v12 = *(_QWORD *)(v11 - 8);
        v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
        v14(v10, v11);
        v13 = a1 + *(int *)(type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0) + 24);
        result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11);
        if ((_DWORD)result)
          return result;
        v9 = v13;
        v7 = v11;
        v8 = (uint64_t (*)(uint64_t, uint64_t))v14;
LABEL_9:
        result = v8(v9, v7);
        break;
      case 6:
        goto LABEL_13;
      case 7:
        swift_bridgeObjectRelease();
LABEL_13:
        result = swift_bridgeObjectRelease();
        break;
      default:
        return result;
    }
  }
  return result;
}

_QWORD *initializeWithCopy for TC2RequestState(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
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
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v42;
  char *v43;
  char *v44;
  char *v45;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = type metadata accessor for TrustedCloudComputeError(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v9 = a2[1];
        *a1 = *a2;
        a1[1] = v9;
        v10 = a2[3];
        a1[2] = a2[2];
        a1[3] = v10;
        v11 = a2[5];
        a1[4] = a2[4];
        a1[5] = v11;
        a1[6] = a2[6];
        *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
        v12 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
        v44 = (char *)a2 + v12;
        v45 = (char *)a1 + v12;
        v13 = sub_244A56C78();
        v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v14(v45, v44, v13);
        goto LABEL_13;
      case 1u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v15 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
        v16 = (char *)a1 + v15;
        v17 = (char *)a2 + v15;
        v18 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
        goto LABEL_13;
      case 2u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v19 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
        v20 = (char *)a1 + v19;
        v21 = (char *)a2 + v19;
        v22 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
        goto LABEL_13;
      case 5u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_WORD *)((char *)a1 + 1) = *(_WORD *)((char *)a2 + 1);
        v23 = a2[2];
        a1[1] = a2[1];
        a1[2] = v23;
        v24 = a2[4];
        a1[3] = a2[3];
        a1[4] = v24;
        a1[5] = a2[5];
        *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
        v25 = a2[8];
        a1[7] = a2[7];
        a1[8] = v25;
        v26 = a2[10];
        a1[9] = a2[9];
        a1[10] = v26;
        v27 = a2[12];
        a1[11] = a2[11];
        a1[12] = v27;
        v28 = a2[14];
        a1[13] = a2[13];
        a1[14] = v28;
        v29 = a2[16];
        a1[15] = a2[15];
        a1[16] = v29;
        v30 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
        v42 = (char *)a2 + v30;
        v43 = (char *)a1 + v30;
        v31 = sub_244A56C78();
        v32 = *(_QWORD *)(v31 - 8);
        v33 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v33(v43, v42, v31);
        v34 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
        *((_BYTE *)a1 + *(int *)(v34 + 20)) = *((_BYTE *)a2 + *(int *)(v34 + 20));
        v35 = *(int *)(v34 + 24);
        v36 = (char *)a1 + v35;
        v37 = (char *)a2 + v35;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v37, 1, v31))
        {
          v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
          memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
        }
        else
        {
          v33(v36, v37, v31);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v36, 0, 1, v31);
        }
        goto LABEL_13;
      case 6u:
        v39 = a2[1];
        *a1 = *a2;
        a1[1] = v39;
        *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
        swift_bridgeObjectRetain();
        goto LABEL_13;
      case 7u:
        v40 = a2[1];
        *a1 = *a2;
        a1[1] = v40;
        *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
        a1[4] = a2[4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_13:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
        break;
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

uint64_t assignWithCopy for TC2RequestState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
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
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const void *v38;
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
  void (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const void *v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (v9)
  {
    if (!v10)
    {
      v11 = type metadata accessor for TrustedCloudComputeError(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
          *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
          *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
          v12 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
          v63 = a2 + v12;
          v64 = a1 + v12;
          v13 = sub_244A56C78();
          v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v14(v64, v63, v13);
          goto LABEL_27;
        case 1u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          v22 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
          v23 = a1 + v22;
          v24 = a2 + v22;
          v25 = sub_244A56C78();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
          goto LABEL_27;
        case 2u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          v26 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
          v27 = a1 + v26;
          v28 = a2 + v26;
          v29 = sub_244A56C78();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
          goto LABEL_27;
        case 5u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
          *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
          *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          v30 = *(_QWORD *)(a2 + 40);
          *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
          *(_QWORD *)(a1 + 40) = v30;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
          *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
          *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
          *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
          *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
          *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
          *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
          *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
          *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
          v31 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
          v59 = a2 + v31;
          v60 = a1 + v31;
          v32 = sub_244A56C78();
          v33 = *(_QWORD *)(v32 - 8);
          v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v34(v60, v59, v32);
          v35 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
          *(_BYTE *)(a1 + *(int *)(v35 + 20)) = *(_BYTE *)(a2 + *(int *)(v35 + 20));
          v36 = *(int *)(v35 + 24);
          v37 = (void *)(a1 + v36);
          v38 = (const void *)(a2 + v36);
          if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v33 + 48))(v38, 1, v32))
          {
            v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
            memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
          }
          else
          {
            v34((uint64_t)v37, (uint64_t)v38, v32);
            (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v37, 0, 1, v32);
          }
          goto LABEL_27;
        case 6u:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
          swift_bridgeObjectRetain();
          goto LABEL_27;
        case 7u:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
          *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
LABEL_27:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
          break;
      }
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
      return a1;
    }
    goto LABEL_7;
  }
  if (v10)
  {
    sub_244A52EC4(a1);
LABEL_7:
    v15 = *(_QWORD *)(a3 - 8);
LABEL_8:
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(v15 + 64));
    return a1;
  }
  if (a1 != a2)
  {
    sub_244A514F4(a1);
    v16 = type metadata accessor for TrustedCloudComputeError(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
        *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
        *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
        *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
        *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
        v17 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
        v18 = a1 + v17;
        v19 = a2 + v17;
        v20 = sub_244A56C78();
        v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v21(v18, v19, v20);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v40 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
        v41 = a1 + v40;
        v42 = a2 + v40;
        v43 = sub_244A56C78();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(v41, v42, v43);
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v44 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
        v45 = a1 + v44;
        v46 = a2 + v44;
        v47 = sub_244A56C78();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v45, v46, v47);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
        *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
        *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
        *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
        *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
        v48 = *(_QWORD *)(a2 + 40);
        *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
        *(_QWORD *)(a1 + 40) = v48;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
        *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
        *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
        *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
        *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
        *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
        *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
        v49 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
        v61 = a2 + v49;
        v62 = a1 + v49;
        v50 = sub_244A56C78();
        v51 = *(_QWORD *)(v50 - 8);
        v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v52(v62, v61, v50);
        v53 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
        *(_BYTE *)(a1 + *(int *)(v53 + 20)) = *(_BYTE *)(a2 + *(int *)(v53 + 20));
        v54 = *(int *)(v53 + 24);
        v55 = (void *)(a1 + v54);
        v56 = (const void *)(a2 + v54);
        if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v51 + 48))(v56, 1, v50))
        {
          v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
          memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
        }
        else
        {
          v52((uint64_t)v55, (uint64_t)v56, v50);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v51 + 56))(v55, 0, 1, v50);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
        *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
        *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
        *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        v15 = *(_QWORD *)(v16 - 8);
        goto LABEL_8;
    }
  }
  return a1;
}

uint64_t sub_244A52EC4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for TC2RequestState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = type metadata accessor for TrustedCloudComputeError(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v9 = a2[1];
        *a1 = *a2;
        a1[1] = v9;
        v10 = a2[3];
        a1[2] = a2[2];
        a1[3] = v10;
        *((_QWORD *)a1 + 8) = *((_QWORD *)a2 + 8);
        v11 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
        v12 = (char *)a1 + v11;
        v13 = (char *)a2 + v11;
        v14 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
        goto LABEL_11;
      case 1u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v15 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
        v16 = (char *)a1 + v15;
        v17 = (char *)a2 + v15;
        v18 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
        goto LABEL_11;
      case 2u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v19 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
        v20 = (char *)a1 + v19;
        v21 = (char *)a2 + v19;
        v22 = sub_244A56C78();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
        goto LABEL_11;
      case 5u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_WORD *)((char *)a1 + 1) = *(_WORD *)((char *)a2 + 1);
        *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
        *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
        *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
        *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
        *(_OWORD *)((char *)a1 + 56) = *(_OWORD *)((char *)a2 + 56);
        *(_OWORD *)((char *)a1 + 72) = *(_OWORD *)((char *)a2 + 72);
        *(_OWORD *)((char *)a1 + 88) = *(_OWORD *)((char *)a2 + 88);
        *(_OWORD *)((char *)a1 + 104) = *(_OWORD *)((char *)a2 + 104);
        *(_OWORD *)((char *)a1 + 120) = *(_OWORD *)((char *)a2 + 120);
        v23 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
        v24 = (char *)a1 + v23;
        v25 = (char *)a2 + v23;
        v26 = sub_244A56C78();
        v27 = *(_QWORD *)(v26 - 8);
        v28 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
        v28(v24, v25, v26);
        v29 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
        *((_BYTE *)a1 + *(int *)(v29 + 20)) = *((_BYTE *)a2 + *(int *)(v29 + 20));
        v30 = *(int *)(v29 + 24);
        v31 = (char *)a1 + v30;
        v32 = (char *)a2 + v30;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v32, 1, v26))
        {
          v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
          memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
        }
        else
        {
          v28(v31, v32, v26);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v31, 0, 1, v26);
        }
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
        break;
    }
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

uint64_t assignWithTake for TC2RequestState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
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
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const void *v43;
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
  void (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const void *v62;
  uint64_t v63;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (v9)
  {
    if (!v10)
    {
      v11 = type metadata accessor for TrustedCloudComputeError(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
          v12 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v12;
          v13 = *(_OWORD *)(a2 + 48);
          *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
          *(_OWORD *)(a1 + 48) = v13;
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
          v14 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
          v15 = a1 + v14;
          v16 = a2 + v14;
          v17 = sub_244A56C78();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
          goto LABEL_23;
        case 1u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          v26 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
          v27 = a1 + v26;
          v28 = a2 + v26;
          v29 = sub_244A56C78();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v27, v28, v29);
          goto LABEL_23;
        case 2u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          v30 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
          v31 = a1 + v30;
          v32 = a2 + v30;
          v33 = sub_244A56C78();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
          goto LABEL_23;
        case 5u:
          *(_BYTE *)a1 = *(_BYTE *)a2;
          *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
          *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
          *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
          *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
          *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
          *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
          *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
          *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
          *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
          v34 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
          v35 = a1 + v34;
          v36 = a2 + v34;
          v37 = sub_244A56C78();
          v38 = *(_QWORD *)(v37 - 8);
          v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32);
          v39(v35, v36, v37);
          v40 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
          *(_BYTE *)(a1 + *(int *)(v40 + 20)) = *(_BYTE *)(a2 + *(int *)(v40 + 20));
          v41 = *(int *)(v40 + 24);
          v42 = (void *)(a1 + v41);
          v43 = (const void *)(a2 + v41);
          if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v38 + 48))(v43, 1, v37))
          {
            v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
            memcpy(v42, v43, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
          }
          else
          {
            v39((uint64_t)v42, (uint64_t)v43, v37);
            (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v42, 0, 1, v37);
          }
LABEL_23:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
          break;
      }
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
      return a1;
    }
    goto LABEL_7;
  }
  if (v10)
  {
    sub_244A52EC4(a1);
LABEL_7:
    v18 = *(_QWORD *)(a3 - 8);
LABEL_8:
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(v18 + 64));
    return a1;
  }
  if (a1 != a2)
  {
    sub_244A514F4(a1);
    v19 = type metadata accessor for TrustedCloudComputeError(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v20 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v20;
        v21 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v21;
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
        v22 = *(int *)(type metadata accessor for TrustedCloudComputeError.RateLimitInfo(0) + 40);
        v23 = a1 + v22;
        v24 = a2 + v22;
        v25 = sub_244A56C78();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v45 = *(int *)(type metadata accessor for TrustedCloudComputeError.AvailabilityInfo(0) + 20);
        v46 = a1 + v45;
        v47 = a2 + v45;
        v48 = sub_244A56C78();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 32))(v46, v47, v48);
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v49 = *(int *)(type metadata accessor for TrustedCloudComputeError.TimeoutErrorInfo(0) + 20);
        v50 = a1 + v49;
        v51 = a2 + v49;
        v52 = sub_244A56C78();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v50, v51, v52);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
        *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
        *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
        *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
        *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
        *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
        v53 = *(int *)(type metadata accessor for TC2RopesResponseMetadata() + 60);
        v54 = a1 + v53;
        v55 = a2 + v53;
        v56 = sub_244A56C78();
        v57 = *(_QWORD *)(v56 - 8);
        v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32);
        v58(v54, v55, v56);
        v59 = type metadata accessor for TrustedCloudComputeError.ServerErrorInfo(0);
        *(_BYTE *)(a1 + *(int *)(v59 + 20)) = *(_BYTE *)(a2 + *(int *)(v59 + 20));
        v60 = *(int *)(v59 + 24);
        v61 = (void *)(a1 + v60);
        v62 = (const void *)(a2 + v60);
        if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v57 + 48))(v62, 1, v56))
        {
          v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C2A10);
          memcpy(v61, v62, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
        }
        else
        {
          v58((uint64_t)v61, (uint64_t)v62, v56);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v61, 0, 1, v56);
        }
        swift_storeEnumTagMultiPayload();
        break;
      default:
        v18 = *(_QWORD *)(v19 - 8);
        goto LABEL_8;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for TC2RequestState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A537D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4)
    return v5 - 3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TC2RequestState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244A5382C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 3);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_244A53884(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
}

uint64_t sub_244A538C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573C4260);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 3, v4);
}

uint64_t sub_244A53904()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for TrustedCloudComputeError(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TC2RequestState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_244A539A4 + 4 * byte_244A5D447[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244A539D8 + 4 * byte_244A5D442[v4]))();
}

uint64_t sub_244A539D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A539E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A539E8);
  return result;
}

uint64_t sub_244A539F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A539FCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244A53A00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A53A08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2RequestState.CodingKeys()
{
  return &type metadata for TC2RequestState.CodingKeys;
}

ValueMetadata *type metadata accessor for TC2RequestState.WaitingCodingKeys()
{
  return &type metadata for TC2RequestState.WaitingCodingKeys;
}

ValueMetadata *type metadata accessor for TC2RequestState.ReadyCodingKeys()
{
  return &type metadata for TC2RequestState.ReadyCodingKeys;
}

ValueMetadata *type metadata accessor for TC2RequestState.FinishedCodingKeys()
{
  return &type metadata for TC2RequestState.FinishedCodingKeys;
}

uint64_t storeEnumTagSinglePayload for TC2RequestState.FailedCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_244A53A94 + 4 * byte_244A5D44C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_244A53AB4 + 4 * byte_244A5D451[v4]))();
}

_BYTE *sub_244A53A94(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_244A53AB4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244A53ABC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244A53AC4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_244A53ACC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_244A53AD4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TC2RequestState.FailedCodingKeys()
{
  return &type metadata for TC2RequestState.FailedCodingKeys;
}

unint64_t sub_244A53AF4()
{
  unint64_t result;

  result = qword_2573C4330;
  if (!qword_2573C4330)
  {
    result = MEMORY[0x24951D378](&unk_244A5D5E4, &type metadata for TC2RequestState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4330);
  }
  return result;
}

unint64_t sub_244A53B3C()
{
  unint64_t result;

  result = qword_2573C4338;
  if (!qword_2573C4338)
  {
    result = MEMORY[0x24951D378](&unk_244A5D78C, &type metadata for TC2RequestState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4338);
  }
  return result;
}

unint64_t sub_244A53B84()
{
  unint64_t result;

  result = qword_2573C4340;
  if (!qword_2573C4340)
  {
    result = MEMORY[0x24951D378](&unk_244A5D6AC, &type metadata for TC2RequestState.WaitingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4340);
  }
  return result;
}

unint64_t sub_244A53BCC()
{
  unint64_t result;

  result = qword_2573C4348;
  if (!qword_2573C4348)
  {
    result = MEMORY[0x24951D378](&unk_244A5D6D4, &type metadata for TC2RequestState.WaitingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4348);
  }
  return result;
}

unint64_t sub_244A53C14()
{
  unint64_t result;

  result = qword_2573C4350;
  if (!qword_2573C4350)
  {
    result = MEMORY[0x24951D378](&unk_244A5D65C, &type metadata for TC2RequestState.ReadyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4350);
  }
  return result;
}

unint64_t sub_244A53C5C()
{
  unint64_t result;

  result = qword_2573C4358;
  if (!qword_2573C4358)
  {
    result = MEMORY[0x24951D378](&unk_244A5D684, &type metadata for TC2RequestState.ReadyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4358);
  }
  return result;
}

unint64_t sub_244A53CA4()
{
  unint64_t result;

  result = qword_2573C4360;
  if (!qword_2573C4360)
  {
    result = MEMORY[0x24951D378](&unk_244A5D60C, &type metadata for TC2RequestState.FinishedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4360);
  }
  return result;
}

unint64_t sub_244A53CEC()
{
  unint64_t result;

  result = qword_2573C4368;
  if (!qword_2573C4368)
  {
    result = MEMORY[0x24951D378](&unk_244A5D634, &type metadata for TC2RequestState.FinishedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4368);
  }
  return result;
}

unint64_t sub_244A53D34()
{
  unint64_t result;

  result = qword_2573C4370;
  if (!qword_2573C4370)
  {
    result = MEMORY[0x24951D378](&unk_244A5D554, &type metadata for TC2RequestState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4370);
  }
  return result;
}

unint64_t sub_244A53D7C()
{
  unint64_t result;

  result = qword_2573C4378;
  if (!qword_2573C4378)
  {
    result = MEMORY[0x24951D378](&unk_244A5D57C, &type metadata for TC2RequestState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4378);
  }
  return result;
}

unint64_t sub_244A53DC4()
{
  unint64_t result;

  result = qword_2573C4380;
  if (!qword_2573C4380)
  {
    result = MEMORY[0x24951D378](&unk_244A5D6FC, &type metadata for TC2RequestState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4380);
  }
  return result;
}

unint64_t sub_244A53E0C()
{
  unint64_t result;

  result = qword_2573C4388;
  if (!qword_2573C4388)
  {
    result = MEMORY[0x24951D378](&unk_244A5D724, &type metadata for TC2RequestState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2573C4388);
  }
  return result;
}

uint64_t sub_244A53E50(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x676E6974696177 && a2 == 0xE700000000000000;
  if (v3 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7964616572 && a2 == 0xE500000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656873696E6966 && a2 == 0xE800000000000000 || (sub_244A5711C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_244A5711C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_244A53FE0(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aProducticarry_0[8 * a1] == *(_QWORD *)&aProducticarry_0[8 * a2]
    && *(_QWORD *)&aEphemeraon_0[8 * a1 + 8] == *(_QWORD *)&aEphemeraon_0[8 * a2 + 8])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_244A5711C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_244A54064(uint64_t a1, uint64_t a2)
{
  return sub_244A54070(a1, a2, TC2LogCategory.rawValue.getter);
}

uint64_t sub_244A54070(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = sub_244A5711C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

unint64_t TC2ClientConfigurationKey.domain.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000024;
  else
    return 0xD00000000000001DLL;
}

PrivateCloudCompute::TC2ClientConfigurationKey_optional __swiftcall TC2ClientConfigurationKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  PrivateCloudCompute::TC2ClientConfigurationKey_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_244A57134();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 13;
  switch(v3)
  {
    case 0:
      goto LABEL_15;
    case 1:
      v5 = 1;
      goto LABEL_15;
    case 2:
      v5 = 2;
      goto LABEL_15;
    case 3:
      v5 = 3;
      goto LABEL_15;
    case 4:
      v5 = 4;
      goto LABEL_15;
    case 5:
      v5 = 5;
      goto LABEL_15;
    case 6:
      v5 = 6;
      goto LABEL_15;
    case 7:
      v5 = 7;
      goto LABEL_15;
    case 8:
      v5 = 8;
      goto LABEL_15;
    case 9:
      v5 = 9;
      goto LABEL_15;
    case 10:
      v5 = 10;
      goto LABEL_15;
    case 11:
      v5 = 11;
      goto LABEL_15;
    case 12:
      v5 = 12;
LABEL_15:
      v6 = v5;
      break;
    case 13:
      break;
    case 14:
      v6 = 14;
      break;
    case 15:
      v6 = 15;
      break;
    case 16:
      v6 = 16;
      break;
    case 17:
      v6 = 17;
      break;
    case 18:
      v6 = 18;
      break;
    case 19:
      v6 = 19;
      break;
    case 20:
      v6 = 20;
      break;
    case 21:
      v6 = 21;
      break;
    case 22:
      v6 = 22;
      break;
    case 23:
      v6 = 23;
      break;
    case 24:
      v6 = 24;
      break;
    case 25:
      v6 = 25;
      break;
    case 26:
      v6 = 26;
      break;
    case 27:
      v6 = 27;
      break;
    case 28:
      v6 = 28;
      break;
    case 29:
      v6 = 29;
      break;
    case 30:
      v6 = 30;
      break;
    default:
      v6 = 31;
      break;
  }
  *v2 = v6;
  return result;
}

void *static TC2ClientConfigurationKey.allCases.getter()
{
  return &unk_2515A9810;
}

uint64_t TC2ClientConfigurationKey.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_244A542F8 + 4 * byte_244A5D9AF[*v0]))(0xD000000000000014, 0x8000000244A5DDE0);
}

uint64_t sub_244A542F8()
{
  return 0x6D6E6F7269766E65;
}

uint64_t sub_244A54318@<X0>(uint64_t a1@<X8>)
{
  return a1 - 4;
}

uint64_t sub_244A5450C()
{
  return 0x6974704F74736574;
}

uint64_t sub_244A5452C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244A54070(*a1, *a2, TC2ClientConfigurationKey.rawValue.getter) & 1;
}

uint64_t sub_244A54554()
{
  sub_244A57194();
  TC2ClientConfigurationKey.rawValue.getter();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  return sub_244A571C4();
}

uint64_t sub_244A545B8()
{
  TC2ClientConfigurationKey.rawValue.getter();
  sub_244A56D5C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244A54608()
{
  sub_244A57194();
  TC2ClientConfigurationKey.rawValue.getter();
  sub_244A56D5C();
  swift_bridgeObjectRelease();
  return sub_244A571C4();
}

PrivateCloudCompute::TC2ClientConfigurationKey_optional sub_244A54668(Swift::String *a1)
{
  return TC2ClientConfigurationKey.init(rawValue:)(*a1);
}

uint64_t sub_244A54674@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = TC2ClientConfigurationKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_244A54698(_QWORD *a1@<X8>)
{
  *a1 = &unk_2515A9810;
}

uint64_t TC2ConfigurationIndex.domain.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2ConfigurationIndex.domain.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*TC2ConfigurationIndex.domain.modify())()
{
  return nullsub_1;
}

uint64_t TC2ConfigurationIndex.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TC2ConfigurationIndex.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*TC2ConfigurationIndex.name.modify())()
{
  return nullsub_1;
}

uint64_t TC2ConfigurationIndex.defaultValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 32));
}

uint64_t TC2ConfigurationIndex.defaultValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 40))(v2 + *(int *)(a2 + 32), a1);
}

uint64_t (*TC2ConfigurationIndex.defaultValue.modify())()
{
  return nullsub_1;
}

uint64_t TC2ConfigurationIndex.isAllowedOnCustomerBuilds.getter(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 36));
}

uint64_t TC2ConfigurationIndex.isAllowedOnCustomerBuilds.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + *(int *)(a2 + 36)) = result;
  return result;
}

uint64_t (*TC2ConfigurationIndex.isAllowedOnCustomerBuilds.modify())()
{
  return nullsub_1;
}

void static TC2ConfigurationIndex.environment.getter(uint64_t a1@<X8>)
{
  sub_244A550A0(0xD00000000000001DLL, 0x8000000244A5FC30, 0x6D6E6F7269766E65, 0xEB00000000746E65, a1);
}

void static TC2ConfigurationIndex.customEnvironmentURL.getter(uint64_t a1@<X8>)
{
  sub_244A550A0(0xD000000000000024, 0x8000000244A5FD30, 0xD000000000000014, 0x8000000244A5DDE0, a1);
}

void static TC2ConfigurationIndex.customEnvironmentHost.getter(uint64_t a1@<X8>)
{
  sub_244A550A0(0xD000000000000024, 0x8000000244A5FD30, 0xD000000000000015, 0x8000000244A5DE00, a1);
}

void static TC2ConfigurationIndex.ignoreCertificateErrors.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000017;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5DE20;
  *(_WORD *)(a1 + 32) = 0;
}

void static TC2ConfigurationIndex.rateLimitRequestTimeout.getter(uint64_t a1@<X8>)
{
  sub_244A54A0C(0xD000000000000017, 0x8000000244A5DE40, a1);
}

void static TC2ConfigurationIndex.rateLimitRequestPath.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000014;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5DE60;
  *(_QWORD *)(a1 + 32) = 0x6D696C657461722FLL;
  *(_QWORD *)(a1 + 40) = 0xEB00000000737469;
  *(_BYTE *)(a1 + 48) = 0;
}

void static TC2ConfigurationIndex.rateLimitRequestMinimumSpacing.getter(uint64_t a1@<X8>)
{
  sub_244A54D10(0xD00000000000001ELL, 0x8000000244A5DE80, a1);
}

void static TC2ConfigurationIndex.prefetchRequestTimeout.getter(uint64_t a1@<X8>)
{
  sub_244A54A0C(0xD000000000000016, 0x8000000244A5DEA0, a1);
}

void static TC2ConfigurationIndex.prefetchRequestPath.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000013;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5DEC0;
  *(_QWORD *)(a1 + 32) = 0x637465666572702FLL;
  *(_QWORD *)(a1 + 40) = 0xE900000000000068;
  *(_BYTE *)(a1 + 48) = 0;
}

void static TC2ConfigurationIndex.trustedRequestFirstPayloadChunkTimeout.getter(uint64_t a1@<X8>)
{
  sub_244A54A0C(0xD000000000000026, 0x8000000244A5DEE0, a1);
}

void sub_244A54A0C(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = 0xD000000000000024;
  *(_QWORD *)(a3 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  *(_QWORD *)(a3 + 32) = 30000;
  *(_BYTE *)(a3 + 40) = 0;
}

void static TC2ConfigurationIndex.trustedRequestPath.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000012;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5DF10;
  *(_QWORD *)(a1 + 32) = 0x656B6F766E692FLL;
  *(_QWORD *)(a1 + 40) = 0xE700000000000000;
  *(_BYTE *)(a1 + 48) = 0;
}

void static TC2ConfigurationIndex.forceAEADKey.getter(uint64_t a1@<X8>)
{
  sub_244A550A0(0xD000000000000024, 0x8000000244A5FD30, 0x4145416563726F66, 0xEC00000079654B44, a1);
}

void static TC2ConfigurationIndex.lttIssuer.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0x657573734974746CLL;
  *(_QWORD *)(a1 + 24) = 0xE900000000000072;
  *(_QWORD *)(a1 + 32) = 0xD000000000000016;
  *(_QWORD *)(a1 + 40) = 0x8000000244A5FD60;
  *(_BYTE *)(a1 + 48) = 0;
}

void static TC2ConfigurationIndex.ottIssuer.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0x657573734974746FLL;
  *(_QWORD *)(a1 + 24) = 0xE900000000000072;
  *(_QWORD *)(a1 + 32) = 0xD000000000000016;
  *(_QWORD *)(a1 + 40) = 0x8000000244A5FD80;
  *(_BYTE *)(a1 + 48) = 0;
}

void static TC2ConfigurationIndex.maxPrefetchedAttestations.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000019;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5DF50;
  *(_QWORD *)(a1 + 32) = 60;
  *(_BYTE *)(a1 + 40) = 0;
}

void static TC2ConfigurationIndex.maxTotalAttestations.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000014;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5DF70;
  *(_QWORD *)(a1 + 32) = 87;
  *(_BYTE *)(a1 + 40) = 0;
}

void static TC2ConfigurationIndex.maxInlineAttestations.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000015;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5DF90;
  *(_QWORD *)(a1 + 32) = 27;
  *(_BYTE *)(a1 + 40) = 0;
}

void static TC2ConfigurationIndex.prewarmAttestationsValidityInSeconds.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000024;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5DFB0;
  *(_QWORD *)(a1 + 32) = 0x409C200000000000;
  *(_BYTE *)(a1 + 40) = 0;
}

void static TC2ConfigurationIndex.maxPrefetchBatches.getter(uint64_t a1@<X8>)
{
  sub_244A54D5C(0xD000000000000012, 0x8000000244A5DFE0, a1);
}

void static TC2ConfigurationIndex.overrideCellID.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  strcpy((char *)(a1 + 16), "overrideCellID");
  *(_BYTE *)(a1 + 31) = -18;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = 1;
}

void static TC2ConfigurationIndex.rateLimiterSessionTimeout.getter(uint64_t a1@<X8>)
{
  sub_244A54D10(0xD000000000000019, 0x8000000244A5E010, a1);
}

void sub_244A54D10(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = 0xD000000000000024;
  *(_QWORD *)(a3 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  *(_QWORD *)(a3 + 32) = 0x404E000000000000;
  *(_BYTE *)(a3 + 40) = 0;
}

void static TC2ConfigurationIndex.rateLimiterSessionLengthForSoftening.getter(uint64_t a1@<X8>)
{
  sub_244A54D5C(0xD000000000000024, 0x8000000244A5E030, a1);
}

void sub_244A54D5C(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = 0xD000000000000024;
  *(_QWORD *)(a3 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  *(_QWORD *)(a3 + 32) = 5;
  *(_BYTE *)(a3 + 40) = 0;
}

void static TC2ConfigurationIndex.rateLimiterDefaultJitterFactor.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD00000000000001ELL;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5E060;
  *(_QWORD *)(a1 + 32) = 0x3FB999999999999ALL;
  *(_BYTE *)(a1 + 40) = 0;
}

void static TC2ConfigurationIndex.rateLimiterMaximumRateLimitTtl.getter(uint64_t a1@<X8>)
{
  sub_244A54E10(0xD00000000000001ELL, 0x8000000244A5E080, a1);
}

void static TC2ConfigurationIndex.rateLimiterMaximumRateLimitDuration.getter(uint64_t a1@<X8>)
{
  sub_244A54E10(0xD000000000000023, 0x8000000244A5E0A0, a1);
}

void sub_244A54E10(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = 0xD000000000000024;
  *(_QWORD *)(a3 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  *(_QWORD *)(a3 + 32) = 0x40F5180000000000;
  *(_BYTE *)(a3 + 40) = 0;
}

void static TC2ConfigurationIndex.testSignalHeader.getter(uint64_t a1@<X8>)
{
  sub_244A550A0(0xD000000000000024, 0x8000000244A5FD30, 0xD000000000000010, 0x8000000244A5E0D0, a1);
}

void static TC2ConfigurationIndex.testOptions.getter(uint64_t a1@<X8>)
{
  sub_244A550A0(0xD000000000000024, 0x8000000244A5FD30, 0x6974704F74736574, 0xEB00000000736E6FLL, a1);
}

uint64_t static TC2ConfigurationIndex.allowedWorkloadParameters.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2573C3190);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_244A5DC50;
  *(_QWORD *)(v2 + 32) = 0x6C65646F6DLL;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = 0x72657470616461;
  *(_QWORD *)(v2 + 56) = 0xE700000000000000;
  *(_QWORD *)(v2 + 64) = 0xD000000000000027;
  *(_QWORD *)(v2 + 72) = 0x8000000244A5FDA0;
  *(_QWORD *)(v2 + 80) = 0xD000000000000023;
  *(_QWORD *)(v2 + 88) = 0x8000000244A5FDD0;
  *(_QWORD *)(v2 + 96) = 0xD00000000000002FLL;
  *(_QWORD *)(v2 + 104) = 0x8000000244A5FE00;
  *(_QWORD *)(v2 + 112) = 0xD00000000000002BLL;
  *(_QWORD *)(v2 + 120) = 0x8000000244A5FE30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB3A8);
  sub_244A55128((unint64_t *)&qword_2573C2C20, &qword_2543FB3A8, MEMORY[0x24BEE12B0]);
  v3 = sub_244A56D20();
  v5 = v4;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = 0xD000000000000024;
  *(_QWORD *)(a1 + 8) = 0x8000000244A5FD30;
  *(_QWORD *)(a1 + 16) = 0xD000000000000019;
  *(_QWORD *)(a1 + 24) = 0x8000000244A5E110;
  *(_QWORD *)(a1 + 32) = v3;
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

void static TC2ConfigurationIndex.proposedLiveOnEnvironment.getter(uint64_t a1@<X8>)
{
  sub_244A550A0(0xD000000000000024, 0x8000000244A5FD30, 0xD000000000000019, 0x8000000244A5E130, a1);
}

void static TC2ConfigurationIndex.bootFixedLiveOnEnvironment.getter(uint64_t a1@<X8>)
{
  sub_244A550A0(0xD000000000000024, 0x8000000244A5FD30, 0xD00000000000001ALL, 0x8000000244A5E150, a1);
}

void sub_244A550A0(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = a3;
  *(_QWORD *)(a5 + 24) = a4;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_BYTE *)(a5 + 48) = 0;
}

unint64_t sub_244A550B8()
{
  unint64_t result;

  result = qword_2573C4390;
  if (!qword_2573C4390)
  {
    result = MEMORY[0x24951D378](&protocol conformance descriptor for TC2ClientConfigurationKey, &type metadata for TC2ClientConfigurationKey);
    atomic_store(result, (unint64_t *)&qword_2573C4390);
  }
  return result;
}

uint64_t sub_244A550FC()
{
  return sub_244A55128(&qword_2573C4398, (uint64_t *)&unk_2573C43A0, MEMORY[0x24BEE12E0]);
}

uint64_t sub_244A55128(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24951D378](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TC2ClientConfigurationKey(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE2)
    goto LABEL_17;
  if (a2 + 30 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 30) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 30;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 30;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 30;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1F;
  v8 = v6 - 31;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TC2ClientConfigurationKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 30 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 30) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE1)
    return ((uint64_t (*)(void))((char *)&loc_244A55244 + 4 * byte_244A5D9D3[v4]))();
  *a1 = a2 + 30;
  return ((uint64_t (*)(void))((char *)sub_244A55278 + 4 * byte_244A5D9CE[v4]))();
}

uint64_t sub_244A55278(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A55280(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244A55288);
  return result;
}

uint64_t sub_244A55294(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244A5529CLL);
  *(_BYTE *)result = a2 + 30;
  return result;
}

uint64_t sub_244A552A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244A552A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TC2ClientConfigurationKey()
{
  return &type metadata for TC2ClientConfigurationKey;
}

uint64_t sub_244A552C4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_244A552CC()
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

uint64_t *sub_244A5534C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || v7 + ((v6 + 32) & (unint64_t)~v6) + 1 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    v12 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    v13 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v12 = *v13;
    v12[1] = v13[1];
    v14 = ((unint64_t)v12 + v6 + 16) & ~v6;
    v15 = ((unint64_t)v13 + v6 + 16) & ~v6;
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16(v14, v15, v4);
    *(_BYTE *)(v14 + v7) = *(_BYTE *)(v15 + v7);
  }
  return a1;
}

uint64_t sub_244A5544C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_244A554A0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v5[1] = v6[1];
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)v5 + v9 + 16) & ~v9;
  v11 = ((unint64_t)v6 + v9 + 16) & ~v9;
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v11, v7);
  *(_BYTE *)(v10 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64));
  return a1;
}

_QWORD *sub_244A5554C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v6[1] = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)v6 + v9 + 16) & ~v9;
  v11 = ((unint64_t)v7 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v10, v11);
  *(_BYTE *)(v10 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64));
  return a1;
}

_OWORD *sub_244A55610(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)v4 + v7 + 16) & ~v7;
  v9 = ((unint64_t)v5 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v8, v9);
  *(_BYTE *)(v8 + *(_QWORD *)(v6 + 64)) = *(_BYTE *)(v9 + *(_QWORD *)(v6 + 64));
  return a1;
}

_QWORD *sub_244A55694(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)v7 + v10 + 16) & ~v10;
  v12 = ((unint64_t)v8 + v10 + 16) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 40))(v11, v12);
  *(_BYTE *)(v11 + *(_QWORD *)(v9 + 64)) = *(_BYTE *)(v12 + *(_QWORD *)(v9 + 64));
  return a1;
}

uint64_t sub_244A55740(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unint64_t v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = *(_QWORD *)(v4 + 64) + ((v7 + 32) & ~v7) + 1;
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + v7 + 16) & ~v7);
      v15 = *(_QWORD *)(a1 + 8);
      if (v15 >= 0xFFFFFFFF)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_244A55818 + 4 * byte_244A5D9D8[(v9 - 1)]))();
}

void sub_244A55890(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64)
     + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + 1;
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
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
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if (*(_DWORD *)(v5 + 64) + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~*(unsigned __int8 *)(v5 + 80)) != -1)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for TC2ConfigurationIndex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TC2ConfigurationIndex);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24951D318](a1, v6, a5);
}

void tc2UInt32PrefixedFrame(message:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_244A55B18(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char a9, uint64_t a10, int a11, int __src, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  unsigned int v24;
  _QWORD v25[9];

  v24 = bswap32(BYTE6(v21));
  v25[0] = sub_244A55C4C(&v24, v25);
  v25[1] = v22 & 0xFFFFFFFFFFFFFFLL;
  sub_244A56BE8();
  return v25[0];
}

uint64_t sub_244A55C4C(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

NSXPCInterface __swiftcall interfaceForTC2DaemonProtocol()()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_2573D17D0);
  v2 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_2573D1770);
  objc_msgSend(v1, sel_setInterface_forSelector_argumentIndex_ofReply_, v2, sel_trustedRequestWithParameters_requestID_bundleIdentifier_originatingBundleIdentifier_featureIdentifier_sessionIdentifier_completion_, 0, 1);

  return (NSXPCInterface)v1;
}

uint64_t TC2JSON<>.json.getter()
{
  uint64_t v0;

  sub_244A56B64();
  swift_allocObject();
  sub_244A56B58();
  v0 = sub_244A56B4C();
  swift_release();
  return v0;
}

uint64_t sub_244A55F18@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2B484(a1, a2, a3);
}

uint64_t TC2JSON<>.init(json:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, _QWORD, uint64_t, uint64_t);
  _QWORD v15[5];

  v8 = sub_244A56CD8();
  v15[3] = *(_QWORD *)(v8 - 8);
  v15[4] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_244A56EB8();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v15 - v10;
  sub_244A56B40();
  swift_allocObject();
  sub_244A56B34();
  sub_244A56B28();
  swift_release();
  v12 = *(_QWORD *)(a3 - 8);
  v13 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56);
  v13(v11, 0, 1, a3);
  sub_244A26E1C(a1, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a4, v11, a3);
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v13)(a4, 0, 1, a3);
}

uint64_t sub_244A5634C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2B804(a1, a2, a3);
}

uint64_t sub_244A56370()
{
  return sub_244A3D628();
}

uint64_t sub_244A56378@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = sub_244A2B4BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_244A563A4()
{
  return sub_244A3D790();
}

double sub_244A563B0@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2BC88(a1, a2, a3);
}

uint64_t sub_244A563D4()
{
  return sub_244A3D8F4();
}

uint64_t sub_244A56424@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  return sub_244A2BFFC(a1, a2, a3);
}

uint64_t sub_244A5644C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2C3B0(a1, a2, a3);
}

uint64_t sub_244A56470()
{
  uint64_t *v0;

  return sub_244A3DBF0(*v0);
}

uint64_t sub_244A56478@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_244A2C3D4(a1, a2, a3);
}

uint64_t sub_244A5649C()
{
  uint64_t *v0;

  return sub_244A3DC1C(*v0);
}

uint64_t sub_244A564A4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_244A2B4A8(a1, a2, a3);
}

uint64_t sub_244A564CC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_244A2C74C(a1, a2, a3);
}

uint64_t sub_244A564F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_244A565C0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244A56AEC((uint64_t)v12, *a3);
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
      sub_244A56AEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_244A565C0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_244A56ED0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_244A56778(a5, a6);
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
  v8 = sub_244A56F48();
  if (!v8)
  {
    sub_244A56F6C();
    __break(1u);
LABEL_17:
    result = sub_244A56FA8();
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

uint64_t sub_244A56778(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_244A5680C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_244A56980(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_244A56980(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_244A5680C(uint64_t a1, unint64_t a2)
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
      v3 = sub_244A29520(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_244A56F18();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_244A56F6C();
      __break(1u);
LABEL_10:
      v2 = sub_244A56D74();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_244A56FA8();
    __break(1u);
LABEL_14:
    result = sub_244A56F6C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_244A56980(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543FB1A8);
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
  result = sub_244A56FA8();
  __break(1u);
  return result;
}

uint64_t dispatch thunk of TC2JSON.json.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TC2JSON.init(json:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_244A56AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_244A56B28()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_244A56B34()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_244A56B40()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_244A56B4C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_244A56B58()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_244A56B64()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_244A56B70()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_244A56B7C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_244A56B88()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_244A56B94()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_244A56BA0()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_244A56BAC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_244A56BB8()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_244A56BC4()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_244A56BD0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_244A56BDC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_244A56BE8()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_244A56BF4()
{
  return MEMORY[0x24BDCDE68]();
}

uint64_t sub_244A56C00()
{
  return MEMORY[0x24BDCE2F0]();
}

uint64_t sub_244A56C0C()
{
  return MEMORY[0x24BDCE350]();
}

uint64_t sub_244A56C18()
{
  return MEMORY[0x24BDCE378]();
}

uint64_t sub_244A56C24()
{
  return MEMORY[0x24BDCE3A0]();
}

uint64_t sub_244A56C30()
{
  return MEMORY[0x24BDCE3B8]();
}

uint64_t sub_244A56C3C()
{
  return MEMORY[0x24BDCE3E8]();
}

uint64_t sub_244A56C48()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_244A56C54()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_244A56C60()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t _s19PrivateCloudCompute24TC2RopesResponseMetadataV3now4codeAC10Foundation4DateV_SitcfcfA__0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_244A56C78()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_244A56C84()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t _s19PrivateCloudCompute14TrustedRequestV2id12workloadType0G10Parameters16bundleIdentifier07featureK007sessionK0AC10Foundation4UUIDV_SSSDyS2SGSgSSSgAoLSgtcfcfA__0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_244A56C9C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_244A56CA8()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_244A56CB4()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_244A56CC0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244A56CCC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_244A56CD8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244A56CE4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_244A56CF0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_244A56CFC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_244A56D08()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_244A56D14()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_244A56D20()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_244A56D2C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_244A56D38()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244A56D44()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_244A56D50()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_244A56D5C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244A56D68()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244A56D74()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244A56D80()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_244A56D8C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_244A56D98()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_244A56DA4()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_244A56DB0()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_244A56DBC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_244A56DC8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_244A56DD4()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_244A56DE0()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_244A56DEC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_244A56DF8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_244A56E04()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_244A56E10()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_244A56E1C()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_244A56E28()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_244A56E34()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_244A56E40()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_244A56E4C()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_244A56E58()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_244A56E64()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244A56E70()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_244A56E7C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_244A56E88()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_244A56E94()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_244A56EA0()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_244A56EAC()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_244A56EB8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244A56EC4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244A56ED0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_244A56EDC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_244A56EE8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_244A56EF4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_244A56F00()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_244A56F0C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_244A56F18()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_244A56F24()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_244A56F30()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_244A56F3C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_244A56F48()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_244A56F54()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_244A56F60()
{
  return MEMORY[0x24BEE2E88]();
}

uint64_t sub_244A56F6C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244A56F78()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_244A56F84()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_244A56F90()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244A56F9C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_244A56FA8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244A56FB4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_244A56FC0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_244A56FCC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_244A56FD8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_244A56FE4()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_244A56FF0()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_244A56FFC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_244A57008()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_244A57014()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_244A57020()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_244A5702C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_244A57038()
{
  return MEMORY[0x24BEE3378]();
}

uint64_t sub_244A57044()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_244A57050()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_244A5705C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_244A57068()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_244A57074()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_244A57080()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_244A5708C()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_244A57098()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_244A570A4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_244A570B0()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_244A570BC()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_244A570C8()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_244A570D4()
{
  return MEMORY[0x24BEE34C8]();
}

uint64_t sub_244A570E0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_244A570EC()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_244A570F8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_244A57104()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_244A57110()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_244A5711C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_244A57128()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_244A57134()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_244A57140()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_244A5714C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244A57158()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_244A57164()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_244A57170()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_244A5717C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_244A57188()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_244A57194()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244A571A0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_244A571AC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_244A571B8()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_244A571C4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244A571D0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_244A571DC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_244A571E8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_244A571F4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_244A57200()
{
  return MEMORY[0x24BEE4A98]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

