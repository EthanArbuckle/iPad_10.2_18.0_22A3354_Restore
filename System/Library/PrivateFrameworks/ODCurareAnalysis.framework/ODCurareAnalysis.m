uint64_t variable initialization expression of BinomialTestResult.testType()
{
  return 0x6C61696D6F6E6942;
}

uint64_t variable initialization expression of ZTestResult.testType()
{
  return 0x747365545ALL;
}

uint64_t variable initialization expression of KSTestTwoSampleResult.testType()
{
  return 0x775474736554534BLL;
}

uint64_t variable initialization expression of MalformedTestResult.testType()
{
  return 0x656D726F666C614DLL;
}

uint64_t variable initialization expression of MalformedTestResult.testRan()
{
  return 0;
}

uint64_t variable initialization expression of MalformedTestResult.testSkippedReason()
{
  return 0;
}

uint64_t variable initialization expression of MalformedTestResult.nextLastRun@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_222C38968();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t destroy for Call()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s16ODCurareAnalysis4CallVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for Call(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Call(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Call(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Call(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Call()
{
  return &type metadata for Call;
}

uint64_t initializeBufferWithCopyOfBuffer for Test(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Test()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for Test(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Test(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Test(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Test(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Test(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Test()
{
  return &type metadata for Test;
}

uint64_t sub_222C23420(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  char v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  const char *v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  sub_222C23EA8(a1, (uint64_t)&v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557716E0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (*(_QWORD *)(v10 + 16)
      && (v3 = sub_222C2584C(0x6E6F6974636E7566, 0xE800000000000000), (v4 & 1) != 0)
      && (sub_222C23EA8(*(_QWORD *)(v10 + 56) + 32 * v3, (uint64_t)&v11), (swift_dynamicCast() & 1) != 0))
    {
      v1 = v10;
      if (*(_QWORD *)(v10 + 16) && (v5 = sub_222C2584C(0x746E656D75677261, 0xE900000000000073), (v6 & 1) != 0))
      {
        sub_222C23EA8(*(_QWORD *)(v10 + 56) + 32 * v5, (uint64_t)&v11);
      }
      else
      {
        v11 = 0u;
        v12 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v12 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          __swift_destroy_boxed_opaque_existential_0(a1);
          return v1;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_222C23FB4((uint64_t)&v11);
      }
      sub_222C23F24();
      swift_allocError();
      *(_QWORD *)v7 = 0xD000000000000032;
      v8 = "Call arguments must be represented as a dictionary";
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_222C23F24();
      swift_allocError();
      *(_QWORD *)v7 = 0xD000000000000032;
      v8 = "Call function name must be represented as a string";
    }
  }
  else
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v7 = 0xD000000000000036;
    v8 = "Call specification must be represented as a dictionary";
  }
  *(_QWORD *)(v7 + 8) = (unint64_t)(v8 - 32) | 0x8000000000000000;
  *(_BYTE *)(v7 + 16) = 0;
  swift_willThrow();
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v1;
}

uint64_t sub_222C23674@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  const char *v23;
  uint64_t result;
  uint64_t v25;
  _OWORD *v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _OWORD *v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  _QWORD v69[3];
  uint64_t v70;
  uint64_t v71;

  v3 = a1;
  sub_222C23EA8(a1, (uint64_t)v69);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557716E0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v22 = 0xD000000000000036;
    v23 = "Test specification must be represented as a dictionary";
LABEL_19:
    *(_QWORD *)(v22 + 8) = (unint64_t)(v23 - 32) | 0x8000000000000000;
    *(_BYTE *)(v22 + 16) = 0;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0(v3);
  }
  v5 = v68[0];
  if (!*(_QWORD *)(v68[0] + 16)
    || (v6 = sub_222C2584C(0x73646C656966, 0xE600000000000000), (v7 & 1) == 0)
    || (sub_222C23EA8(*(_QWORD *)(v68[0] + 56) + 32 * v6, (uint64_t)v69),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2557716F0),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v22 = 0xD000000000000036;
    v23 = "Test fields must be represented as an array of strings";
    goto LABEL_19;
  }
  if (!*(_QWORD *)(v68[0] + 16)
    || (v8 = sub_222C2584C(0xD000000000000012, 0x8000000222C398E0), (v9 & 1) == 0)
    || (sub_222C23EA8(*(_QWORD *)(v68[0] + 56) + 32 * v8, (uint64_t)v69),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2557716F8),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_21:
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v22 = 0xD000000000000023;
    v23 = "Failed to parse preprocessing steps";
    goto LABEL_19;
  }
  v67 = v68[0];
  v10 = *(_QWORD *)(v68[0] + 16);
  if (v10)
  {
    v60 = a2;
    v63 = v68[0];
    v64 = v3;
    v71 = MEMORY[0x24BEE4AF8];
    sub_222C322B8(0, v10, 0);
    v11 = v68[0] + 32;
    while (1)
    {
      sub_222C23EA8(v11, (uint64_t)v69);
      sub_222C23EA8((uint64_t)v69, (uint64_t)v68);
      v12 = sub_222C23420((uint64_t)v68);
      if (v2)
        break;
      v15 = v12;
      v16 = v13;
      v17 = v14;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v69);
      v18 = v71;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_222C322B8(0, *(_QWORD *)(v18 + 16) + 1, 1);
        v18 = v71;
      }
      v20 = *(_QWORD *)(v18 + 16);
      v19 = *(_QWORD *)(v18 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_222C322B8((char *)(v19 > 1), v20 + 1, 1);
        v18 = v71;
      }
      *(_QWORD *)(v18 + 16) = v20 + 1;
      v21 = (_QWORD *)(v18 + 24 * v20);
      v21[4] = v15;
      v21[5] = v16;
      v21[6] = v17;
      v11 += 32;
      if (!--v10)
      {
        v66 = v18;
        swift_bridgeObjectRelease();
        v5 = v63;
        v3 = v64;
        a2 = v60;
        goto LABEL_24;
      }
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v69);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    MEMORY[0x22767B0A8](v2);
    swift_bridgeObjectRelease();
    v3 = v64;
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  v66 = MEMORY[0x24BEE4AF8];
LABEL_24:
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
  v70 = v59;
  v25 = swift_allocObject();
  v26 = (_OWORD *)(v25 + 16);
  v69[0] = v25;
  if (*(_QWORD *)(v5 + 16) && (v27 = sub_222C2584C(0x6E697474696C7073, 0xED00007065745367), (v28 & 1) != 0))
  {
    sub_222C23EA8(*(_QWORD *)(v5 + 56) + 32 * v27, (uint64_t)v26);
  }
  else
  {
    *v26 = 0u;
    v26[1] = 0u;
  }
  v29 = sub_222C23420((uint64_t)v69);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x22767B0A8](v2);
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v22 = 0xD00000000000001ELL;
    v23 = "Failed to parse splitting step";
    goto LABEL_19;
  }
  v32 = v30;
  v33 = v31;
  v58 = v29;
  if (!*(_QWORD *)(v5 + 16)
    || (v34 = sub_222C2584C(0xD000000000000013, 0x8000000222C39950), (v35 & 1) == 0)
    || (sub_222C23EA8(*(_QWORD *)(v5 + 56) + 32 * v34, (uint64_t)v69), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v22 = 0xD000000000000024;
    v23 = "Failed to parse postprocessing steps";
    goto LABEL_19;
  }
  v62 = v32;
  v57 = v33;
  v36 = v68[0];
  v37 = *(_QWORD *)(v68[0] + 16);
  if (v37)
  {
    v61 = a2;
    v65 = v3;
    v71 = MEMORY[0x24BEE4AF8];
    sub_222C322B8(0, v37, 0);
    v38 = v36 + 32;
    do
    {
      sub_222C23EA8(v38, (uint64_t)v69);
      sub_222C23EA8((uint64_t)v69, (uint64_t)v68);
      v39 = sub_222C23420((uint64_t)v68);
      v41 = v40;
      v43 = v42;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v69);
      v44 = v71;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_222C322B8(0, *(_QWORD *)(v44 + 16) + 1, 1);
        v44 = v71;
      }
      v46 = *(_QWORD *)(v44 + 16);
      v45 = *(_QWORD *)(v44 + 24);
      if (v46 >= v45 >> 1)
      {
        sub_222C322B8((char *)(v45 > 1), v46 + 1, 1);
        v44 = v71;
      }
      *(_QWORD *)(v44 + 16) = v46 + 1;
      v47 = (_QWORD *)(v44 + 24 * v46);
      v47[4] = v39;
      v47[5] = v41;
      v47[6] = v43;
      v38 += 32;
      --v37;
    }
    while (v37);
    swift_bridgeObjectRelease();
    v3 = v65;
    a2 = v61;
  }
  else
  {
    swift_bridgeObjectRelease();
    v44 = MEMORY[0x24BEE4AF8];
  }
  v70 = v59;
  v48 = swift_allocObject();
  v49 = (_OWORD *)(v48 + 16);
  v69[0] = v48;
  if (*(_QWORD *)(v5 + 16) && (v50 = sub_222C2584C(0x7065745374736574, 0xE800000000000000), (v51 & 1) != 0))
  {
    sub_222C23EA8(*(_QWORD *)(v5 + 56) + 32 * v50, (uint64_t)v49);
  }
  else
  {
    *v49 = 0u;
    v49[1] = 0u;
  }
  swift_bridgeObjectRelease();
  v52 = sub_222C23420((uint64_t)v69);
  v54 = v53;
  v56 = v55;
  result = __swift_destroy_boxed_opaque_existential_0(v3);
  *a2 = v67;
  a2[1] = v66;
  a2[2] = v58;
  a2[3] = v62;
  a2[4] = v57;
  a2[5] = v44;
  a2[6] = v52;
  a2[7] = v54;
  a2[8] = v56;
  return result;
}

uint64_t sub_222C23EA8(uint64_t a1, uint64_t a2)
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
    result = MEMORY[0x22767B0F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_222C23F24()
{
  unint64_t result;

  result = qword_2557716E8;
  if (!qword_2557716E8)
  {
    result = MEMORY[0x22767B0FC](&unk_222C3933C, &type metadata for UsageError);
    atomic_store(result, (unint64_t *)&qword_2557716E8);
  }
  return result;
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

uint64_t sub_222C23F88()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_222C23FB4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_222C23FF4()
{
  unint64_t result;

  result = sub_222C32DCC((uint64_t)&unk_24EB52C48);
  qword_255771C68 = result;
  return result;
}

void sub_222C24018(double a1)
{
  double v3;
  double v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t i;
  char *v11;
  double v12;
  uint64_t v13;
  char v14;
  double v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  char *v20;

  if (a1 != 0.0 && a1 != 1.0 && a1 >= 0.0 && a1 <= 1.0)
  {
    v3 = 1.0 - a1;
    if (a1 >= 0.5)
      v4 = a1;
    else
      v4 = v3;
    if (qword_2557716D8 != -1)
      swift_once();
    v5 = qword_255771C68;
    swift_bridgeObjectRetain_n();
    v6 = (char *)sub_222C24310(v5);
    swift_bridgeObjectRelease();
    v20 = v6;
    sub_222C242A8(&v20);
    swift_bridgeObjectRelease();
    v7 = *((_QWORD *)v20 + 2);
    if (v7)
    {
      v8 = 0;
      v9 = 0;
      for (i = 0; i != v7; ++i)
      {
        if (*(double *)&v20[8 * i + 32] <= v4)
        {
          v8 = i + 1;
          v9 = i;
        }
      }
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    if (v9 >= v7)
    {
      __break(1u);
    }
    else
    {
      v11 = v20 + 32;
      v12 = *(double *)&v20[8 * v9 + 32];
      if (v4 != v12)
      {
        if (v8 != v7)
        {
          if (v8 >= v7)
          {
LABEL_39:
            __break(1u);
            goto LABEL_40;
          }
          v15 = *(double *)&v11[8 * v8];
          v16 = qword_255771C68;
          if (v4 == v15)
          {
            swift_release();
            if (!*(_QWORD *)(v16 + 16))
            {
LABEL_40:
              __break(1u);
              goto LABEL_41;
            }
            sub_222C258B0(v15);
            if ((v17 & 1) != 0)
              return;
            __break(1u);
          }
          if (!*(_QWORD *)(v16 + 16))
          {
LABEL_41:
            __break(1u);
            goto LABEL_42;
          }
          sub_222C258B0(v12);
          if ((v18 & 1) == 0)
          {
LABEL_42:
            __break(1u);
            goto LABEL_43;
          }
          sub_222C258B0(*(double *)&v11[8 * v8]);
          if ((v19 & 1) == 0)
          {
LABEL_43:
            __break(1u);
            swift_release();
            __break(1u);
            return;
          }
        }
        swift_release();
        return;
      }
      v13 = qword_255771C68;
      swift_release();
      if (*(_QWORD *)(v13 + 16))
      {
        sub_222C258B0(v12);
        if ((v14 & 1) != 0)
          return;
        goto LABEL_38;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
}

uint64_t sub_222C242A8(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_222C24E28((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_222C244D0(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_222C24310(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771708);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  v6 = sub_222C24E3C(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_222C24FD0();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_222C243F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      if (v4 != a3)
      {
LABEL_7:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2557716E0);
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255771718);
      v7 = (_QWORD *)swift_allocObject();
      v8 = _swift_stdlib_malloc_size(v7);
      v9 = v8 - 32;
      if (v8 < 32)
        v9 = v8 - 25;
      v7[2] = v5;
      v7[3] = 2 * (v9 >> 3);
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t sub_222C244D0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  double v24;
  uint64_t v25;
  double *v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  double v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double *v98;

  v2 = a1;
  v3 = a1[1];
  result = sub_222C38B18();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v78 = 0;
      v79 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v81 = *(double *)(v79 + 8 * i);
        v82 = v78;
        do
        {
          v83 = v79 + 8 * v82;
          if (v81 >= *(double *)v83)
            break;
          if (!v79)
            goto LABEL_141;
          *(_QWORD *)(v83 + 8) = *(_QWORD *)v83;
          *(double *)(v79 + 8 * v82--) = v81;
        }
        while (v82 != -1);
        ++v78;
      }
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_136;
    v95 = result;
    v96 = v3;
    if (v3 > 1)
    {
      v6 = v5 >> 1;
      result = sub_222C389F8();
      *(_QWORD *)(result + 16) = v6;
      v3 = v96;
      v94 = result;
      v98 = (double *)(result + 32);
LABEL_13:
      v8 = 0;
      v9 = *v2;
      v92 = v2;
      v93 = *v2 - 8;
      v10 = MEMORY[0x24BEE4AF8];
      v97 = *v2;
      while (1)
      {
        v12 = v8++;
        if (v8 < v3)
        {
          v13 = *(double *)(v9 + 8 * v8);
          v14 = *(double *)(v9 + 8 * v12);
          v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            v15 = v13;
            while (1)
            {
              v16 = v15;
              v15 = *(double *)(v9 + 8 * v8);
              if (v13 < v14 == v15 >= v16)
                break;
              if (v3 == ++v8)
              {
                v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12)
              goto LABEL_138;
            if (v12 < v8)
            {
              v17 = (uint64_t *)(v93 + 8 * v8);
              v18 = v8;
              v19 = v12;
              v20 = (uint64_t *)(v9 + 8 * v12);
              do
              {
                if (v19 != --v18)
                {
                  if (!v9)
                    goto LABEL_144;
                  v21 = *v20;
                  *v20 = *v17;
                  *v17 = v21;
                }
                ++v19;
                --v17;
                ++v20;
              }
              while (v19 < v18);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12))
            goto LABEL_135;
          if (v8 - v12 < v95)
          {
            v22 = v12 + v95;
            if (__OFADD__(v12, v95))
              goto LABEL_139;
            if (v22 >= v3)
              v22 = v3;
            if (v22 < v12)
            {
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
              return result;
            }
            if (v8 != v22)
            {
              v23 = (double *)(v93 + 8 * v8);
              do
              {
                v24 = *(double *)(v9 + 8 * v8);
                v25 = v12;
                v26 = v23;
                do
                {
                  v27 = *v26;
                  if (v24 >= *v26)
                    break;
                  if (!v9)
                    goto LABEL_142;
                  *v26 = v24;
                  v26[1] = v27;
                  --v26;
                  ++v25;
                }
                while (v8 != v25);
                ++v8;
                ++v23;
              }
              while (v8 != v22);
              v8 = v22;
            }
          }
        }
        if (v8 < v12)
          goto LABEL_130;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_222C24D1C(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
          v10 = result;
        }
        v29 = *(_QWORD *)(v10 + 16);
        v28 = *(_QWORD *)(v10 + 24);
        v11 = v29 + 1;
        v9 = v97;
        if (v29 >= v28 >> 1)
        {
          result = (uint64_t)sub_222C24D1C((char *)(v28 > 1), v29 + 1, 1, (char *)v10);
          v9 = v97;
          v10 = result;
        }
        *(_QWORD *)(v10 + 16) = v11;
        v30 = v10 + 32;
        v31 = (uint64_t *)(v10 + 32 + 16 * v29);
        *v31 = v12;
        v31[1] = v8;
        if (v29)
        {
          while (1)
          {
            v32 = v11 - 1;
            if (v11 >= 4)
            {
              v37 = v30 + 16 * v11;
              v38 = *(_QWORD *)(v37 - 64);
              v39 = *(_QWORD *)(v37 - 56);
              v43 = __OFSUB__(v39, v38);
              v40 = v39 - v38;
              if (v43)
                goto LABEL_119;
              v42 = *(_QWORD *)(v37 - 48);
              v41 = *(_QWORD *)(v37 - 40);
              v43 = __OFSUB__(v41, v42);
              v35 = v41 - v42;
              v36 = v43;
              if (v43)
                goto LABEL_120;
              v44 = v11 - 2;
              v45 = (uint64_t *)(v30 + 16 * (v11 - 2));
              v47 = *v45;
              v46 = v45[1];
              v43 = __OFSUB__(v46, v47);
              v48 = v46 - v47;
              if (v43)
                goto LABEL_121;
              v43 = __OFADD__(v35, v48);
              v49 = v35 + v48;
              if (v43)
                goto LABEL_123;
              if (v49 >= v40)
              {
                v67 = (uint64_t *)(v30 + 16 * v32);
                v69 = *v67;
                v68 = v67[1];
                v43 = __OFSUB__(v68, v69);
                v70 = v68 - v69;
                if (v43)
                  goto LABEL_129;
                v60 = v35 < v70;
                goto LABEL_83;
              }
            }
            else
            {
              if (v11 != 3)
              {
                v61 = *(_QWORD *)(v10 + 32);
                v62 = *(_QWORD *)(v10 + 40);
                v43 = __OFSUB__(v62, v61);
                v54 = v62 - v61;
                v55 = v43;
                goto LABEL_77;
              }
              v34 = *(_QWORD *)(v10 + 32);
              v33 = *(_QWORD *)(v10 + 40);
              v43 = __OFSUB__(v33, v34);
              v35 = v33 - v34;
              v36 = v43;
            }
            if ((v36 & 1) != 0)
              goto LABEL_122;
            v44 = v11 - 2;
            v50 = (uint64_t *)(v30 + 16 * (v11 - 2));
            v52 = *v50;
            v51 = v50[1];
            v53 = __OFSUB__(v51, v52);
            v54 = v51 - v52;
            v55 = v53;
            if (v53)
              goto LABEL_124;
            v56 = (uint64_t *)(v30 + 16 * v32);
            v58 = *v56;
            v57 = v56[1];
            v43 = __OFSUB__(v57, v58);
            v59 = v57 - v58;
            if (v43)
              goto LABEL_126;
            if (__OFADD__(v54, v59))
              goto LABEL_128;
            if (v54 + v59 >= v35)
            {
              v60 = v35 < v59;
LABEL_83:
              if (v60)
                v32 = v44;
              goto LABEL_85;
            }
LABEL_77:
            if ((v55 & 1) != 0)
              goto LABEL_125;
            v63 = (uint64_t *)(v30 + 16 * v32);
            v65 = *v63;
            v64 = v63[1];
            v43 = __OFSUB__(v64, v65);
            v66 = v64 - v65;
            if (v43)
              goto LABEL_127;
            if (v66 < v54)
              goto LABEL_15;
LABEL_85:
            v71 = v32 - 1;
            if (v32 - 1 >= v11)
            {
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
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
              goto LABEL_140;
            }
            if (!v9)
              goto LABEL_143;
            v72 = (uint64_t *)(v30 + 16 * v71);
            v73 = *v72;
            v74 = v30;
            v75 = (_QWORD *)(v30 + 16 * v32);
            v76 = v75[1];
            result = sub_222C24B1C((double *)(v9 + 8 * *v72), (double *)(v9 + 8 * *v75), v9 + 8 * v76, v98);
            if (v1)
              goto LABEL_113;
            if (v76 < v73)
              goto LABEL_116;
            if (v32 > *(_QWORD *)(v10 + 16))
              goto LABEL_117;
            *v72 = v73;
            *(_QWORD *)(v74 + 16 * v71 + 8) = v76;
            v77 = *(_QWORD *)(v10 + 16);
            if (v32 >= v77)
              goto LABEL_118;
            v11 = v77 - 1;
            result = (uint64_t)memmove(v75, v75 + 2, 16 * (v77 - 1 - v32));
            v30 = v74;
            *(_QWORD *)(v10 + 16) = v77 - 1;
            v9 = v97;
            if (v77 <= 2)
              goto LABEL_15;
          }
        }
        v11 = 1;
LABEL_15:
        v3 = v96;
        if (v8 >= v96)
        {
          v7 = v94;
          v2 = v92;
          goto LABEL_102;
        }
      }
    }
    v7 = MEMORY[0x24BEE4AF8];
    v98 = (double *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 == 1)
    {
      v94 = MEMORY[0x24BEE4AF8];
      goto LABEL_13;
    }
    v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v10 = MEMORY[0x24BEE4AF8];
LABEL_102:
    v94 = v7;
    if (v11 >= 2)
    {
      v84 = *v2;
      do
      {
        v85 = v11 - 2;
        if (v11 < 2)
          goto LABEL_131;
        if (!v84)
          goto LABEL_145;
        v86 = v10;
        v87 = v10 + 32;
        v88 = *(_QWORD *)(v10 + 32 + 16 * v85);
        v89 = *(_QWORD *)(v10 + 32 + 16 * (v11 - 1) + 8);
        result = sub_222C24B1C((double *)(v84 + 8 * v88), (double *)(v84 + 8 * *(_QWORD *)(v87 + 16 * (v11 - 1))), v84 + 8 * v89, v98);
        if (v1)
          break;
        if (v89 < v88)
          goto LABEL_132;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_222C24E14(v86);
          v86 = result;
        }
        if (v85 >= *(_QWORD *)(v86 + 16))
          goto LABEL_133;
        v90 = (_QWORD *)(v86 + 32 + 16 * v85);
        *v90 = v88;
        v90[1] = v89;
        v91 = *(_QWORD *)(v86 + 16);
        if (v11 > v91)
          goto LABEL_134;
        result = (uint64_t)memmove((void *)(v86 + 32 + 16 * (v11 - 1)), (const void *)(v86 + 32 + 16 * v11), 16 * (v91 - v11));
        v10 = v86;
        *(_QWORD *)(v86 + 16) = v91 - 1;
        v11 = v91 - 1;
      }
      while (v91 > 2);
    }
LABEL_113:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v94 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_222C24B1C(double *__dst, double *__src, unint64_t a3, double *a4)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double v15;
  BOOL v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  int64_t v23;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = (char *)__src - (char *)__dst;
  v9 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0)
    v9 = (char *)__src - (char *)__dst;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[v13] <= a4)
      memmove(a4, __src, 8 * v13);
    v14 = &v4[v13];
    if (v7 >= v6 || v11 < 8)
      goto LABEL_39;
    v17 = (double *)(a3 - 8);
    v18 = v6;
    while (1)
    {
      v19 = v17 + 1;
      v20 = *--v18;
      v21 = v20;
      if (*(v14 - 1) < v20)
        break;
      v21 = *(v14 - 1);
      v18 = v6;
      if (v19 != v14)
      {
        --v14;
LABEL_35:
        *v17 = v21;
        goto LABEL_36;
      }
      if (v17 >= v14--)
        goto LABEL_35;
LABEL_36:
      if (v18 > v7)
      {
        --v17;
        v6 = v18;
        if (v14 > v4)
          continue;
      }
      v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6)
      goto LABEL_36;
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[v10] <= a4)
    memmove(a4, __dst, 8 * v10);
  v14 = &v4[v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      v15 = *v6;
      if (*v6 >= *v4)
        break;
      v16 = v7 == v6++;
      if (!v16)
        goto LABEL_16;
LABEL_17:
      ++v7;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v15 = *v4;
    v16 = v7 == v4++;
    if (v16)
      goto LABEL_17;
LABEL_16:
    *v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  v6 = v7;
LABEL_39:
  v23 = (char *)v14 - (char *)v4 + ((char *)v14 - (char *)v4 < 0 ? 7uLL : 0);
  if (v6 != v4 || v6 >= (double *)((char *)v4 + (v23 & 0xFFFFFFFFFFFFFFF8)))
    memmove(v6, v4, 8 * (v23 >> 3));
  return 1;
}

char *sub_222C24D1C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771710);
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

char *sub_222C24E14(uint64_t a1)
{
  return sub_222C24D1C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_222C24E28(uint64_t a1)
{
  return sub_222C32494(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_222C24E3C(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_222C24FD0()
{
  return swift_release();
}

uint64_t runPostprocessingSteps(_:steps:lastRun:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t *i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  const char *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return result;
  v4 = (uint64_t *)result;
  swift_bridgeObjectRetain();
  for (i = (uint64_t *)(a2 + 48); ; i += 3)
  {
    v8 = *(i - 2);
    v7 = *(i - 1);
    v9 = *i;
    v10 = v8 == 0x786966667573 && v7 == 0xE600000000000000;
    if (v10 || (sub_222C38B24() & 1) != 0)
    {
      v11 = *(_QWORD *)(v9 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v11
        || (v12 = sub_222C2584C(0x74676E654C78616DLL, 0xE900000000000068), (v13 & 1) == 0)
        || (sub_222C23EA8(*(_QWORD *)(v9 + 56) + 32 * v12, (uint64_t)&v21), (swift_dynamicCast() & 1) == 0))
      {
        swift_bridgeObjectRelease();
        sub_222C23F24();
        swift_allocError();
        *(_QWORD *)v17 = 0xD000000000000025;
        v18 = "Suffix expects arguments: (maxLength)";
LABEL_24:
        v19 = (unint64_t)(v18 - 32) | 0x8000000000000000;
        goto LABEL_25;
      }
      v6 = sub_222C25394(v23, *v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *v4 = v6;
      goto LABEL_4;
    }
    if ((v8 != 0xD000000000000010 || v7 != 0x8000000222C39A80) && (sub_222C38B24() & 1) == 0)
      break;
    v14 = *(_QWORD *)(v9 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v14
      || (v15 = sub_222C2584C(0xD000000000000011, 0x8000000222C39AC0), (v16 & 1) == 0)
      || (sub_222C23EA8(*(_QWORD *)(v9 + 56) + 32 * v15, (uint64_t)&v21), (swift_dynamicCast() & 1) == 0))
    {
      swift_bridgeObjectRelease();
      sub_222C23F24();
      swift_allocError();
      *(_QWORD *)v17 = 0xD000000000000037;
      v18 = "EnsureTwoSamples expects arguments: (minimumSampleSize)";
      goto LABEL_24;
    }
    sub_222C256C0((uint64_t)v4, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_4:
    if (!--v2)
      return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = 0;
  v22 = 0xE000000000000000;
  sub_222C38A64();
  swift_bridgeObjectRelease();
  v21 = 0xD00000000000001DLL;
  v22 = 0x8000000222C39AA0;
  swift_bridgeObjectRetain();
  sub_222C389C8();
  swift_bridgeObjectRelease();
  v20 = v21;
  v19 = v22;
  sub_222C23F24();
  swift_allocError();
  *(_QWORD *)v17 = v20;
LABEL_25:
  *(_QWORD *)(v17 + 8) = v19;
  *(_BYTE *)(v17 + 16) = 0;
  swift_willThrow();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_222C25394(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  unint64_t v17;
  _QWORD *v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  if (result < 0)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v3 = result;
  if (!result)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  if (*(_QWORD *)(a2 + 16) >= result)
    v4 = result;
  else
    v4 = *(_QWORD *)(a2 + 16);
  v26 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v24 = a2;
  sub_222C322D4(0, v4, 0);
  v5 = v24;
  v6 = v26;
  if (!*(_QWORD *)(v24 + 16))
    goto LABEL_31;
  v23 = *(_QWORD *)(v24 + 16);
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v8 = 0;
  do
  {
LABEL_8:
    if (v8 >= *(_QWORD *)(v5 + 16))
      goto LABEL_39;
    v9 = (uint64_t *)(v24 + 32 + 32 * v8);
    v10 = *v9;
    v11 = v9[1];
    v12 = v9[2];
    v13 = v9[3];
    v14 = v26[2];
    if ((uint64_t)v14 < v3)
    {
      ++v8;
LABEL_22:
      v17 = v26[3];
      v22 = v14 + 1;
      result = swift_unknownObjectRetain();
      if (v14 >= v17 >> 1)
        result = (uint64_t)sub_222C322D4((_QWORD *)(v17 > 1), v22, 1);
      v26[2] = v22;
      v18 = &v26[4 * v14];
      v18[4] = v10;
      v18[5] = v11;
      v18[6] = v12;
      v18[7] = v13;
    }
    else
    {
      result = swift_unknownObjectRetain();
      if (v7 >= v14)
        goto LABEL_40;
      v15 = &v26[4 * v7 + 4];
      result = swift_unknownObjectRelease();
      *v15 = v10;
      v15[1] = v11;
      v15[2] = v12;
      v15[3] = v13;
      if ((uint64_t)++v7 >= v3)
      {
        v5 = v24;
        if (v8 + 1 == v23)
        {
LABEL_30:
          swift_bridgeObjectRelease();
          goto LABEL_31;
        }
        v16 = (uint64_t *)(v24 + 88 + 32 * v8);
        v8 += 2;
        while (v8 - 1 < *(_QWORD *)(v24 + 16))
        {
          v10 = *(v16 - 3);
          v11 = *(v16 - 2);
          v12 = *(v16 - 1);
          v13 = *v16;
          v14 = v26[2];
          if ((uint64_t)v14 < v3)
          {
            v7 = 0;
            goto LABEL_22;
          }
          swift_unknownObjectRetain();
          result = swift_unknownObjectRelease();
          v26[4] = v10;
          v26[5] = v11;
          v26[6] = v12;
          v26[7] = v13;
          if (v3 > 1)
          {
            v7 = 1;
            if (v8 != v23)
              goto LABEL_8;
            swift_bridgeObjectRelease();
            v7 = 1;
            goto LABEL_34;
          }
          ++v8;
          v16 += 4;
          if (v8 - v23 == 1)
            goto LABEL_30;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      ++v8;
    }
    v5 = v24;
  }
  while (v8 != v23);
  swift_bridgeObjectRelease();
  if (!v7)
  {
LABEL_31:
    swift_bridgeObjectRelease();
    return (uint64_t)v6;
  }
LABEL_34:
  v19 = v26[2];
  v25 = MEMORY[0x24BEE4AF8];
  result = (uint64_t)sub_222C322D4(0, v19, 0);
  if (v19 < (uint64_t)v7)
    goto LABEL_42;
  if ((v7 & 0x8000000000000000) == 0)
  {
    v20 = v26[2];
    if (v20 >= v7 && v20 >= v19)
    {
      v21 = swift_retain();
      sub_222C25A5C(v21, (uint64_t)(v26 + 4), v7, (2 * v19) | 1);
      swift_bridgeObjectRelease();
      swift_release();
      sub_222C25A5C((uint64_t)v26, (uint64_t)(v26 + 4), 0, (2 * v7) | 1);
      swift_release();
      return v25;
    }
    goto LABEL_44;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_222C256C0(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  BOOL v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v2 = (_QWORD *)result;
  v3 = *(_QWORD **)result;
  v4 = *(_QWORD *)(*(_QWORD *)result + 16);
  if (v4 == 1)
  {
    v8 = v3[4];
    v9 = v3[5];
    v11 = v3[6];
    v10 = v3[7];
    swift_unknownObjectRetain();
    result = swift_bridgeObjectRelease();
    v12 = v10 >> 1;
    v13 = (v10 >> 1) - v11;
    if (__OFSUB__(v10 >> 1, v11))
    {
      __break(1u);
    }
    else
    {
      v14 = __OFSUB__(v13, a2);
      v15 = v13 - a2;
      if (!v14)
      {
        v16 = v15 & ~(v15 >> 63);
        if (!__OFSUB__(v16, a2))
        {
          v17 = (v16 - a2) & ~((uint64_t)(v16 - a2) >> 63);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255771728);
          result = swift_allocObject();
          *(_OWORD *)(result + 16) = xmmword_222C39300;
          if (v16 >= v17)
          {
            if (v12 >= v17)
            {
              if ((uint64_t)v17 >= v11)
              {
                if (v12 >= v16)
                {
                  if ((uint64_t)v16 >= v11)
                  {
                    *(_QWORD *)(result + 32) = v8;
                    *(_QWORD *)(result + 40) = v9;
                    *(_QWORD *)(result + 48) = v17;
                    *(_QWORD *)(result + 56) = v10 & 1 | (2 * v16);
                    if ((uint64_t)v12 >= v11)
                    {
                      *(_QWORD *)(result + 64) = v8;
                      *(_QWORD *)(result + 72) = v9;
                      *(_QWORD *)(result + 80) = v16;
                      *(_QWORD *)(result + 88) = v10;
                      *v2 = result;
                      return swift_unknownObjectRetain();
                    }
                    goto LABEL_23;
                  }
LABEL_22:
                  __break(1u);
LABEL_23:
                  __break(1u);
                  return result;
                }
LABEL_21:
                __break(1u);
                goto LABEL_22;
              }
LABEL_20:
              __break(1u);
              goto LABEL_21;
            }
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
LABEL_18:
          __break(1u);
          goto LABEL_19;
        }
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
    }
    __break(1u);
    goto LABEL_17;
  }
  if (!v4)
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771728);
    result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_222C39300;
    v5 = MEMORY[0x24BEE4AF8];
    v6 = MEMORY[0x24BEE4AF8] + 32;
    *(_QWORD *)(result + 32) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(result + 40) = v6;
    *(_OWORD *)(result + 48) = xmmword_222C39310;
    *(_QWORD *)(result + 64) = v5;
    *(_QWORD *)(result + 72) = v6;
    *(_OWORD *)(result + 80) = xmmword_222C39310;
    *v2 = result;
  }
  return result;
}

unint64_t sub_222C2584C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_222C38B90();
  sub_222C389BC();
  v4 = sub_222C38B9C();
  return sub_222C258E4(a1, a2, v4);
}

unint64_t sub_222C258B0(double a1)
{
  uint64_t v2;

  v2 = sub_222C38B84();
  return sub_222C259C4(v2, a1);
}

unint64_t sub_222C258E4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_222C38B24() & 1) == 0)
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
      while (!v14 && (sub_222C38B24() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_222C259C4(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a1 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = *(_QWORD *)(v2 + 48);
    if (*(double *)(v6 + 8 * result) != a2)
    {
      v7 = ~v4;
      for (result = (result + 1) & v7;
            ((*(_QWORD *)(v3 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v7)
      {
        if (*(double *)(v6 + 8 * result) == a2)
          break;
      }
    }
  }
  return result;
}

void sub_222C25A5C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_18;
  }
  v7 = *v4;
  v8 = *(_QWORD *)(*v4 + 16);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v4 = v7;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v7 + 24) >> 1)
    goto LABEL_8;
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9)
        v12 = v8 + v6;
      else
        v12 = v8;
      isUniquelyReferenced_nonNull_native = sub_222C322D4(isUniquelyReferenced_nonNull_native, v12, 1);
      v7 = *v4;
      if (v5 != a3)
        goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  if ((*(_QWORD *)(v7 + 24) >> 1) - *(_QWORD *)(v7 + 16) < v6)
    goto LABEL_19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771720);
  swift_arrayInitWithCopy();
  if (v6 <= 0)
  {
LABEL_16:
    *v4 = v7;
    return;
  }
  v13 = *(_QWORD *)(v7 + 16);
  v14 = __OFADD__(v13, v6);
  v15 = v13 + v6;
  if (!v14)
  {
    *(_QWORD *)(v7 + 16) = v15;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
}

uint64_t sub_222C25B6C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for UsageError(uint64_t a1)
{
  return sub_222C25B94(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_222C25B94(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16ODCurareAnalysis10UsageErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_222C25B6C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for UsageError(uint64_t a1, uint64_t a2)
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
  sub_222C25B6C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_222C25B94(v6, v7, v8);
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

uint64_t assignWithTake for UsageError(uint64_t a1, uint64_t a2)
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
  sub_222C25B94(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_222C25D2C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_222C25D48(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UsageError()
{
  return &type metadata for UsageError;
}

uint64_t Binomial.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Binomial.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Binomial()
{
  return objc_opt_self();
}

void sub_222C25DB8(uint64_t a1, uint64_t a2, double a3)
{
  double v3;

  if (a1 != -1 && a1 != a2)
  {
    v3 = 1.0 - a3;
    if (a1)
    {
      if (__OFSUB__(a2, a1))
      {
        __break(1u);
      }
      else if (!__OFADD__(a1, 1))
      {
        sub_222C26804(v3, (double)(a2 - a1), (double)(a1 + 1));
        return;
      }
      __break(1u);
    }
    else
    {
      pow(v3, (double)a2);
    }
  }
}

void sub_222C25E50(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE900000000000064;
  v4 = 0xE400000000000000;
  v5 = 1936942412;
  if (v2 != 1)
  {
    v5 = 0x72657461657247;
    v4 = 0xE700000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x65646953206F7754;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

void sub_222C25EAC(uint64_t a1, unint64_t a2, unsigned __int8 a3, long double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  unint64_t v9;
  long double v10;
  char v12;
  char v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  long double v19;
  long double v20;
  double v21;
  double v22;
  long double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  long double v29;
  double v30;
  double v31;
  long double v32;
  long double v33;
  long double v34;
  double v35;
  BOOL v36;
  double v37;
  long double v38;
  long double v39;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  long double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  long double v51;
  long double v52;
  long double v53;
  double v54;
  double v55;
  double v56;
  long double v57;
  double v58;
  long double v59;
  long double v60;
  double v61;
  uint64_t v62;
  double __x;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double __y;

  if (a1 < 0)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v7 = 0xD00000000000001FLL;
    *(_QWORD *)(v7 + 8) = 0x8000000222C39C10;
LABEL_13:
    *(_BYTE *)(v7 + 16) = 0;
    swift_willThrow();
    return;
  }
  v5 = a2;
  if ((a2 & 0x8000000000000000) != 0)
  {
    sub_222C23F24();
    swift_allocError();
    v8 = "numberOfPositive was less than 0.";
    v9 = 0xD000000000000021;
    goto LABEL_12;
  }
  if (a1 < a2)
  {
    sub_222C23F24();
    swift_allocError();
    v8 = "numberOfPositive was greater than numberOfTrials.";
    v9 = 0xD000000000000031;
LABEL_12:
    *(_QWORD *)v7 = v9;
    *(_QWORD *)(v7 + 8) = (unint64_t)(v8 - 32) | 0x8000000000000000;
    goto LABEL_13;
  }
  v10 = a4;
  if (a4 < 0.0 || a4 > 1.0)
  {
    sub_222C23F24();
    swift_allocError();
    v8 = "probability was not within the range [0.0, 1.0]";
    v9 = 0xD00000000000002FLL;
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
LABEL_16:
    if (a1 == v5)
      return;
    if (!v5)
    {
      pow(1.0 - v10, (double)a1);
      return;
    }
    if (!__OFADD__(v5, 1))
    {
      sub_222C26804(1.0 - v10, (double)(a1 - v5), (double)(v5 + 1));
      return;
    }
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  v12 = sub_222C38B24();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
    goto LABEL_16;
  if (a3 > 1u)
  {
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  v13 = sub_222C38B24();
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
  {
LABEL_28:
    sub_222C25DB8(v5 - 1, a1, v10);
    return;
  }
  v14 = (double)v5;
  __y = (double)a1;
  v15 = (double)a1 * v10;
  if (v15 > (double)v5)
  {
    v16 = a1 - v5;
    if (a1 == v5)
    {
      v17 = 1.0 - v10;
    }
    else
    {
LABEL_50:
      if (v5)
      {
        if (__OFADD__(v5, 1))
        {
LABEL_96:
          __break(1u);
LABEL_97:
          __break(1u);
          goto LABEL_98;
        }
        v17 = 1.0 - v10;
        sub_222C26804(1.0 - v10, (double)v16, (double)(v5 + 1));
        if (v4)
          return;
      }
      else
      {
        v17 = 1.0 - v10;
        pow(1.0 - v10, __y);
      }
    }
    v65 = __y + 1.0;
    v37 = sub_222C35B44(__y + 1.0);
    v38 = v37 - sub_222C35B44(v14 + 1.0);
    v39 = v38 - sub_222C35B44(__y - v14 + 1.0);
    v73 = log(v10);
    v71 = log(v17);
    v69 = exp(v73 * v14 + v71 * (__y - v14) + v39);
    v40 = ceil(v15);
    if ((~*(_QWORD *)&v40 & 0x7FF0000000000000) != 0)
    {
      if (v40 > -9.22337204e18)
      {
        v41 = __y + 1.0;
        if (v40 < 9.22337204e18)
        {
          v42 = (uint64_t)v40;
          if ((uint64_t)v40 <= a1)
          {
            v43 = v65 + -1.0;
            v44 = v43 * log(v65 + -1.0) - v43;
            v45 = 0;
            v67 = v44 + 0.572364943 + log(v43 * (v43 * 4.0 * (v43 + v43 + 1.0) + 1.0) + 0.0333333333) * 0.166666667;
            v46 = 3.0;
            while (1)
            {
              v47 = v67;
              if (v41 <= v46)
                v47 = sub_222C35BD8(v41);
              v48 = (double)v42;
              v49 = (double)v42 + 1.0;
              if (v49 <= v46)
              {
                v54 = sub_222C35BD8(v49);
              }
              else
              {
                v50 = v49 + -1.0;
                v51 = v50 * log(v49 + -1.0) - v50;
                v52 = log(v50 * (v50 * 4.0 * (v50 + v50 + 1.0) + 1.0) + 0.0333333333);
                v53 = v51 + 0.572364943;
                v46 = 3.0;
                v54 = v53 + v52 * 0.166666667;
              }
              v55 = __y - v48 + 1.0;
              if (v55 <= v46)
              {
                v61 = sub_222C35BD8(v55);
              }
              else
              {
                v56 = v55 + -1.0;
                v57 = v56 * log(v55 + -1.0) - v56;
                v58 = v56 * (v56 * 4.0 * (v56 + v56 + 1.0) + 1.0);
                v46 = 3.0;
                v59 = log(v58 + 0.0333333333);
                v60 = v57 + 0.572364943;
                v41 = __y + 1.0;
                v61 = v60 + v59 * 0.166666667;
              }
              if (exp(v73 * v48 + v71 * (__y - v48) + v47 - v54 - v61) <= v69)
              {
                v36 = __OFADD__(v45++, 1);
                if (v36)
                {
                  __break(1u);
                  goto LABEL_89;
                }
              }
              if (a1 == v42)
                break;
              v36 = __OFADD__(v42++, 1);
              if (v36)
              {
                __break(1u);
                break;
              }
            }
            if (!v45)
              return;
            if (!__OFSUB__(a1, v45))
            {
              sub_222C25DB8(a1 - v45, a1, v10);
              return;
            }
            goto LABEL_95;
          }
LABEL_94:
          __break(1u);
LABEL_95:
          __break(1u);
          goto LABEL_96;
        }
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
LABEL_92:
      __break(1u);
      goto LABEL_93;
    }
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  if (v15 >= (double)v5)
    return;
  sub_222C25DB8(v5 - 1, a1, v10);
  if (v4)
    return;
  v64 = __y + 1.0;
  v18 = sub_222C35B44(__y + 1.0);
  v19 = v18 - sub_222C35B44(v14 + 1.0);
  v20 = v19 - sub_222C35B44(__y - v14 + 1.0);
  v72 = log(v10);
  __x = 1.0 - v10;
  v70 = log(1.0 - v10);
  v68 = exp(v72 * v14 + v70 * (__y - v14) + v20);
  v21 = floor(v15);
  if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) == 0)
    goto LABEL_97;
  if (v21 <= -9.22337204e18)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  v14 = __y + 1.0;
  if (v21 >= 9.22337204e18)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  v5 = (uint64_t)v21;
  if (((uint64_t)v21 & 0x8000000000000000) == 0)
  {
    v22 = v64 + -1.0;
    v23 = v22 * log(v64 + -1.0) - v22;
    v24 = 0;
    v25 = 0;
    v66 = v23 + 0.572364943 + log(v22 * (v22 * 4.0 * (v22 + v22 + 1.0) + 1.0) + 0.0333333333) * 0.166666667;
    while (1)
    {
      v15 = v66;
      if (v14 <= 3.0)
        v15 = sub_222C35BD8(v14);
      v26 = (double)v24;
      v27 = (double)v24 + 1.0;
      if (v27 <= 3.0)
      {
        v10 = sub_222C35BD8(v27);
      }
      else
      {
        v28 = v27 + -1.0;
        v29 = v28 * log(v27 + -1.0) - v28;
        v10 = v29 + 0.572364943 + log(v28 * (v28 * 4.0 * (v28 + v28 + 1.0) + 1.0) + 0.0333333333) * 0.166666667;
      }
      v30 = __y - v26 + 1.0;
      if (v30 <= 3.0)
      {
        v35 = sub_222C35BD8(v30);
      }
      else
      {
        v31 = v30 + -1.0;
        v32 = v31 * log(v30 + -1.0) - v31;
        v33 = log(v31 * (v31 * 4.0 * (v31 + v31 + 1.0) + 1.0) + 0.0333333333);
        v34 = v32 + 0.572364943;
        v14 = __y + 1.0;
        v35 = v34 + v33 * 0.166666667;
      }
      if (exp(v72 * v26 + v70 * (__y - v26) + v15 - v10 - v35) <= v68)
      {
        v36 = __OFADD__(v25++, 1);
        if (v36)
          break;
      }
      if (v5 == v24)
      {
        if (!v25)
          return;
        v62 = v25 - 1;
        if (__OFSUB__(v25, 1))
          goto LABEL_101;
        if (v62 == a1)
          return;
        if (v25 == 1)
        {
          pow(__x, __y);
          return;
        }
        if (__OFSUB__(a1, v62))
          goto LABEL_102;
        if (!__OFADD__(v62, 1))
        {
          sub_222C26804(__x, (double)(a1 - v62), (double)v25);
          return;
        }
        goto LABEL_103;
      }
      v36 = __OFADD__(v24++, 1);
      if (v36)
      {
        __break(1u);
        goto LABEL_50;
      }
    }
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
LABEL_100:
  __break(1u);
LABEL_101:
  __break(1u);
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
}

void sub_222C26804(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  long double v19;
  long double v20;
  double v21;

  if (a1 < 0.0 || a1 > 1.0)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v6 = 0xD000000000000032;
    v7 = "Probability was less than 0.0 or greater than 1.0.";
LABEL_23:
    *(_QWORD *)(v6 + 8) = (unint64_t)(v7 - 32) | 0x8000000000000000;
    *(_BYTE *)(v6 + 16) = 0;
    swift_willThrow();
    return;
  }
  if (a2 <= 0.0 || a3 <= 0.0)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v6 = 0xD00000000000005ALL;
    v7 = "Either 'a' or 'b' was less than or equal to 0.0, which is undefined for the beta function.";
    goto LABEL_23;
  }
  if (a1 != 0.0 && a1 != 1.0)
  {
    v21 = log(a1);
    v10 = log(1.0 - a1);
    v11 = sub_222C35B44(a2);
    v12 = sub_222C35B44(a3);
    v13 = sub_222C35B44(a2 + a3);
    if (a2 > a3)
      v14 = a2;
    else
      v14 = a3;
    v15 = ceil(sqrt(v14));
    if ((~*(_QWORD *)&v15 & 0x7FF0000000000000) != 0)
    {
      if (v15 > -9.22337204e18)
      {
        if (v15 < 9.22337204e18)
        {
          v16 = v21 * a2 + v10 * a3;
          v17 = v11 + v12 - v13;
          if ((uint64_t)v15 <= 100)
            v18 = 100;
          else
            v18 = (uint64_t)v15;
          if ((a2 + 1.0) / (a2 + a3 + 2.0) <= a1)
          {
            sub_222C26A68(v18, 1.0 - a1, a3, a2);
            if (!v3)
            {
              v20 = log(a3);
              exp(v16 - v17 - v20);
            }
          }
          else
          {
            sub_222C26A68(v18, a1, a2, a3);
            if (!v3)
            {
              v19 = log(a2);
              exp(v16 - v17 - v19);
            }
          }
          return;
        }
LABEL_29:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_29;
  }
}

uint64_t sub_222C26A68(uint64_t result, double a2, double a3, double a4)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;

  if (result < 1)
  {
LABEL_20:
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v23 = 0;
    *(_QWORD *)(v23 + 8) = 0;
    *(_BYTE *)(v23 + 16) = 3;
    return swift_willThrow();
  }
  else
  {
    v4 = (a3 + a4) * a2 / (a3 + 1.0);
    if (vabdd_f64(1.0, v4) >= 1.0e-30)
      v5 = 1.0 / (1.0 - v4);
    else
      v5 = 1.0e30;
    v6 = 1;
    v7 = v5;
    v8 = 1.0;
    while (1)
    {
      v9 = (double)v6;
      v10 = v9 + v9 + a3;
      v11 = (a4 - (double)v6) * (double)v6 * a2 / (v10 * (v10 + -1.0));
      v12 = v11 / v8 + 1.0;
      v13 = v7 * v11 + 1.0;
      if (fabs(v12) >= 1.0e-30)
        v14 = v12;
      else
        v14 = 1.0e-30;
      v15 = fabs(v13);
      v16 = 1.0 / v13;
      if (v15 < 1.0e-30)
        v16 = 1.0e30;
      v17 = -((v9 + a3) * (a3 + a4 + v9)) * a2 / (v10 * (v10 + 1.0));
      v18 = v17 * v16 + 1.0;
      v8 = fabs(v17 / v14 + 1.0) >= 1.0e-30 ? v17 / v14 + 1.0 : 1.0e-30;
      v19 = fabs(v18);
      v20 = 1.0 / v18;
      v21 = v5 * (v14 * v16);
      v7 = v19 >= 1.0e-30 ? v20 : 1.0e30;
      v5 = v21 * (v8 * v7);
      if (fabs(v8 * v7 + -1.0) < 0.000457247371)
        break;
      v22 = v6 + 1;
      if (__OFADD__(v6, 1))
      {
        __break(1u);
        return result;
      }
      ++v6;
      if (v22 > result)
        goto LABEL_20;
    }
  }
  return result;
}

void runSplittingStep(_:step:lastRun:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  uint64_t v11;

  v10 = (void *)MEMORY[0x22767ADF0]();
  sub_222C26C78(a2, a3, a4, a1, a5, &v11);
  objc_autoreleasePoolPop(v10);
}

uint64_t sub_222C26C78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  BOOL v10;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  const char *v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];

  v10 = a1 == 1937334628 && a2 == 0xE400000000000000;
  if (v10 || (sub_222C38B24() & 1) != 0)
  {
    if (*(_QWORD *)(a3 + 16))
    {
      v14 = sub_222C2584C(0x6C656946656D6974, 0xE900000000000064);
      if ((v15 & 1) != 0)
      {
        sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v14, (uint64_t)v29);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v16 = v27;
          v17 = v28;
          goto LABEL_10;
        }
      }
    }
    sub_222C23F24();
    swift_allocError();
    v21 = "Days expects arguments: (timeField)";
    v22 = 0xD000000000000023;
    goto LABEL_13;
  }
  if ((a1 != 0x736B656577 || a2 != 0xE500000000000000) && (sub_222C38B24() & 1) == 0)
  {
    if ((a1 != 0x6E75527473616CLL || a2 != 0xE700000000000000) && (sub_222C38B24() & 1) == 0)
    {
      sub_222C38A64();
      swift_bridgeObjectRelease();
      v29[0] = 0xD000000000000018;
      v29[1] = 0x8000000222C39CD0;
      swift_bridgeObjectRetain();
      sub_222C389C8();
      swift_bridgeObjectRelease();
      sub_222C23F24();
      swift_allocError();
      *(_QWORD *)v20 = 0xD000000000000018;
      *(_QWORD *)(v20 + 8) = 0x8000000222C39CD0;
      goto LABEL_14;
    }
    if (*(_QWORD *)(a3 + 16))
    {
      v25 = sub_222C2584C(0x6C656946656D6974, 0xE900000000000064);
      if ((v26 & 1) != 0)
      {
        sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v25, (uint64_t)v29);
        if (swift_dynamicCast())
        {
          v18 = sub_222C27908(a4, v27, v28, a5);
          result = swift_bridgeObjectRelease();
          if (!v6)
            goto LABEL_11;
          return result;
        }
      }
    }
    sub_222C23F24();
    swift_allocError();
    v21 = "LastRun expects arguments: (timeField)";
    v22 = 0xD000000000000026;
LABEL_13:
    *(_QWORD *)v20 = v22;
    *(_QWORD *)(v20 + 8) = (unint64_t)(v21 - 32) | 0x8000000000000000;
LABEL_14:
    *(_BYTE *)(v20 + 16) = 0;
    return swift_willThrow();
  }
  if (!*(_QWORD *)(a3 + 16)
    || (v23 = sub_222C2584C(0x6C656946656D6974, 0xE900000000000064), (v24 & 1) == 0)
    || (sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v23, (uint64_t)v29), (swift_dynamicCast() & 1) == 0))
  {
    sub_222C23F24();
    swift_allocError();
    v21 = "Weeks expects arguments: (timeField)";
    v22 = 0xD000000000000024;
    goto LABEL_13;
  }
  v16 = v27;
  v17 = v28;
LABEL_10:
  v18 = sub_222C27074(a4, v16, v17);
  result = swift_bridgeObjectRelease();
  if (!v6)
LABEL_11:
    *a6 = v18;
  return result;
}

uint64_t sub_222C27074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  int v40;
  char v41;
  void (*v42)(char *, uint64_t);
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  char v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  unsigned int (*v71)(char *, uint64_t, uint64_t);
  void (*v72)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  __int128 v81;
  __int128 v82;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v61 - v10;
  v12 = sub_222C38968();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v80 = (char *)&v61 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v79 = (char *)&v61 - v19;
  v20 = *(_QWORD *)(a1 + 16);
  if (!v20)
    return MEMORY[0x24BEE4AF8];
  v77 = a1 + 32;
  v78 = a1;
  v21 = *(_QWORD *)(a1 + 32 + 8 * (v20 - 1));
  if (!*(_QWORD *)(v21 + 16))
  {
    v81 = 0u;
    v82 = 0u;
    goto LABEL_11;
  }
  v76 = v20 - 1;
  v73 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22 = sub_222C2584C(a2, a3);
  if ((v23 & 1) == 0)
  {
    v81 = 0u;
    v82 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_222C23EA8(*(_QWORD *)(v21 + 56) + 32 * v22, (uint64_t)&v81);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v82 + 1))
  {
LABEL_11:
    sub_222C280C8((uint64_t)&v81, &qword_255771700);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_12;
  }
  v24 = MEMORY[0x24BEE4AD8];
  v25 = swift_dynamicCast();
  v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v72(v11, v25 ^ 1u, 1, v12);
  v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v71(v11, 1, v12) == 1)
  {
LABEL_12:
    sub_222C280C8((uint64_t)v11, &qword_2557717E8);
    *(_QWORD *)&v81 = 0;
    *((_QWORD *)&v81 + 1) = 0xE000000000000000;
    sub_222C38A64();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v81 = 0xD00000000000002CLL;
    *((_QWORD *)&v81 + 1) = 0x8000000222C39D80;
    sub_222C389C8();
    v32 = *((_QWORD *)&v81 + 1);
    v33 = v81;
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v34 = v33;
    *(_QWORD *)(v34 + 8) = v32;
    *(_BYTE *)(v34 + 16) = 1;
    swift_willThrow();
    return v32;
  }
  v69 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v69(v79, v11, v12);
  v26 = swift_bridgeObjectRetain();
  v27 = sub_222C27BEC(v26);
  v28 = *(_QWORD *)(v27 + 16);
  v61 = v3;
  v68 = v28;
  if (v28)
  {
    v70 = v27 + 32;
    v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v67 = v24 + 8;
    v30 = 0;
    v31 = v27;
    v63 = v13;
    v65 = a2;
    v66 = a3;
    v64 = v9;
    v62 = v27;
    while (v30 < *(_QWORD *)(v31 + 16))
    {
      v75 = v30;
      v36 = (unint64_t *)(v70 + 16 * v30);
      v37 = v36[1];
      if (!*(_QWORD *)(v37 + 16))
      {
        v81 = 0u;
        v82 = 0u;
LABEL_43:
        sub_222C280C8((uint64_t)&v81, &qword_255771700);
        v72(v9, 1, 1, v12);
LABEL_44:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_222C280C8((uint64_t)v9, &qword_2557717E8);
        sub_222C38A64();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v81 = 0xD00000000000002CLL;
        *((_QWORD *)&v81 + 1) = 0x8000000222C39D80;
        sub_222C389C8();
        v55 = *((_QWORD *)&v81 + 1);
        v32 = v81;
        sub_222C23F24();
        swift_allocError();
        *(_QWORD *)v56 = v32;
        *(_QWORD *)(v56 + 8) = v55;
        *(_BYTE *)(v56 + 16) = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v13 + 8))(v79, v12);
        return v32;
      }
      v74 = *v36;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v38 = sub_222C2584C(a2, a3);
      if ((v39 & 1) != 0)
      {
        sub_222C23EA8(*(_QWORD *)(v37 + 56) + 32 * v38, (uint64_t)&v81);
      }
      else
      {
        v81 = 0u;
        v82 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v82 + 1))
        goto LABEL_43;
      v40 = swift_dynamicCast();
      v72(v9, v40 ^ 1u, 1, v12);
      if (v71(v9, 1, v12) == 1)
        goto LABEL_44;
      v69(v80, v9, v12);
      sub_222C38944();
      sub_222C28104();
      v41 = sub_222C38998();
      v42 = *(void (**)(char *, uint64_t))(v13 + 8);
      v42(v16, v12);
      if ((v41 & 1) == 0)
      {
        v13 = v74 + 1;
        if (__OFADD__(v74, 1))
          goto LABEL_54;
        v31 = v76 + 1;
        a2 = v78;
        if (__OFADD__(v76, 1))
          goto LABEL_55;
        if (v31 < v13)
          goto LABEL_56;
        if (v73 < v13)
          goto LABEL_57;
        if (v13 < 0)
          goto LABEL_58;
        if (v73 < v31)
          goto LABEL_59;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v29 = sub_222C35308(0, v29[2] + 1, 1, v29);
        v44 = v29[2];
        v43 = v29[3];
        v45 = v44 + 1;
        if (v44 >= v43 >> 1)
        {
          v76 = v44 + 1;
          v54 = sub_222C35308((_QWORD *)(v43 > 1), v44 + 1, 1, v29);
          v45 = v76;
          v29 = v54;
        }
        v29[2] = v45;
        v46 = &v29[4 * v44];
        v47 = v77;
        v46[4] = a2;
        v46[5] = v47;
        v46[6] = v13;
        v46[7] = (2 * v31) | 1;
        sub_222C38950();
        sub_222C38944();
        v48 = sub_222C38998();
        v42(v16, v12);
        if ((v48 & 1) == 0)
        {
          do
          {
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v29 = sub_222C35308(0, v29[2] + 1, 1, v29);
            v50 = v29[2];
            v49 = v29[3];
            if (v50 >= v49 >> 1)
              v29 = sub_222C35308((_QWORD *)(v49 > 1), v50 + 1, 1, v29);
            v29[2] = v50 + 1;
            v51 = &v29[4 * v50];
            v52 = v77;
            v51[4] = v78;
            v51[5] = v52;
            v51[6] = v13;
            v51[7] = (2 * v13) | 1;
            sub_222C38950();
            sub_222C38944();
            v53 = sub_222C38998();
            v42(v16, v12);
          }
          while ((v53 & 1) == 0);
        }
        v76 = v74;
        v13 = v63;
        v31 = v62;
      }
      v30 = v75 + 1;
      v42(v80, v12);
      a2 = v65;
      a3 = v66;
      v9 = v64;
      if (v30 == v68)
      {
        swift_bridgeObjectRelease();
        goto LABEL_46;
      }
    }
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
    goto LABEL_60;
  }
  swift_bridgeObjectRelease();
  v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_46:
  v31 = v76 + 1;
  a2 = v78;
  if (__OFADD__(v76, 1))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (v31 < 0)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  if (v73 < v31)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_63:
    v29 = sub_222C35308(0, v29[2] + 1, 1, v29);
  v58 = v29[2];
  v57 = v29[3];
  if (v58 >= v57 >> 1)
    v29 = sub_222C35308((_QWORD *)(v57 > 1), v58 + 1, 1, v29);
  v29[2] = v58 + 1;
  v59 = &v29[4 * v58];
  v60 = v77;
  v59[4] = a2;
  v59[5] = v60;
  v59[6] = 0;
  v59[7] = (2 * v31) | 1;
  v32 = sub_222C27D1C((uint64_t)v29);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v79, v12);
  return v32;
}

uint64_t sub_222C27908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_222C38968();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222C282D8(a4, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_222C280C8((uint64_t)v11, &qword_2557717E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771728);
    a3 = swift_allocObject();
    *(_OWORD *)(a3 + 16) = xmmword_222C393C0;
    v16 = (2 * *(_QWORD *)(a1 + 16)) | 1;
    *(_QWORD *)(a3 + 32) = a1;
    *(_QWORD *)(a3 + 40) = a1 + 32;
    *(_QWORD *)(a3 + 48) = 0;
    *(_QWORD *)(a3 + 56) = v16;
    swift_bridgeObjectRetain();
    return a3;
  }
  v32 = v13;
  v17 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v30 = v12;
  v17(v15, v11, v12);
  v31 = &v29;
  v18 = *(_QWORD *)(a1 + 16);
  v29 = a1;
  if (v18)
  {
    v19 = 0;
    v20 = a1 + 32;
    while (1)
    {
      v33 = *(_QWORD *)(v20 + 8 * v19);
      swift_bridgeObjectRetain();
      v21 = sub_222C27E5C(&v33, a2, a3);
      swift_bridgeObjectRelease();
      if (v4)
        goto LABEL_10;
      if ((v21 & 1) != 0)
      {
        v22 = v29;
        goto LABEL_13;
      }
      if (v18 == ++v19)
        goto LABEL_11;
    }
  }
  if (v4)
  {
LABEL_10:
    (*(void (**)(char *, uint64_t))(v32 + 8))(v15, v30);
    return a3;
  }
LABEL_11:
  v22 = v29;
  v19 = *(_QWORD *)(v29 + 16);
LABEL_13:
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771728);
  v23 = v32;
  if (!v19)
  {
    a3 = swift_allocObject();
    *(_OWORD *)(a3 + 16) = xmmword_222C393C0;
    v27 = (2 * *(_QWORD *)(v22 + 16)) | 1;
    *(_QWORD *)(a3 + 32) = v22;
    *(_QWORD *)(a3 + 40) = v22 + 32;
    *(_QWORD *)(a3 + 48) = 0;
    *(_QWORD *)(a3 + 56) = v27;
    v28 = *(void (**)(char *, uint64_t))(v23 + 8);
    swift_bridgeObjectRetain();
    v28(v15, v30);
    return a3;
  }
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_222C39300;
  v25 = *(_QWORD *)(v22 + 16);
  if (v25 >= v19)
  {
    a3 = result;
    *(_QWORD *)(result + 32) = v22;
    *(_QWORD *)(result + 40) = v22 + 32;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = (2 * v19) | 1;
    *(_QWORD *)(result + 64) = v22;
    *(_QWORD *)(result + 72) = v22 + 32;
    *(_QWORD *)(result + 80) = v19;
    *(_QWORD *)(result + 88) = (2 * v25) | 1;
    v26 = *(void (**)(char *, uint64_t))(v23 + 8);
    swift_bridgeObjectRetain_n();
    v26(v15, v30);
    return a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_222C27BEC(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;

  v1 = (_QWORD *)sub_222C2814C(a1);
  v2 = v1[2];
  result = swift_bridgeObjectRelease();
  if (v2 < 2)
    return (uint64_t)v1;
  v4 = 0;
  v5 = v2 >> 1;
  v6 = v2 - 1;
  v7 = 2 * v2;
  v8 = 5;
  v16 = v2 >> 1;
  while (1)
  {
    if (v4 == v6)
      goto LABEL_4;
    v9 = v1[2];
    if (v4 >= v9)
      break;
    if (v6 >= v9)
      goto LABEL_13;
    v11 = v1[v8 - 1];
    v10 = v1[v8];
    v13 = v1[v7 + 2];
    v12 = v1[v7 + 3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v1 = sub_222C352E0(v1);
    v14 = &v1[v8];
    result = swift_bridgeObjectRelease();
    *(v14 - 1) = v13;
    *v14 = v12;
    if (v6 >= v1[2])
      goto LABEL_14;
    v15 = &v1[v7];
    result = swift_bridgeObjectRelease();
    v15[2] = v11;
    v15[3] = v10;
    v5 = v16;
LABEL_4:
    ++v4;
    v8 += 2;
    --v6;
    v7 -= 2;
    if (v5 == v4)
      return (uint64_t)v1;
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_222C27D1C(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(result + 16);
  if (v2 < 2)
    return (uint64_t)v1;
  v3 = 0;
  v4 = 0;
  v5 = v2 >> 1;
  v6 = v2 - 1;
  v7 = 4 * v2;
  v15 = v2 >> 1;
  while (1)
  {
    if (v4 == v6)
      goto LABEL_4;
    v8 = v1[2];
    if (v4 >= v8)
      break;
    if (v6 >= v8)
      goto LABEL_13;
    v9 = v1[v3 + 6];
    v10 = v1[v3 + 7];
    v16 = *(_OWORD *)&v1[v3 + 4];
    v17 = *(_OWORD *)&v1[v7];
    v11 = v1[v7 + 2];
    v12 = v1[v7 + 3];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v1 = sub_222C352CC(v1);
    v13 = &v1[v3];
    result = swift_unknownObjectRelease();
    *((_OWORD *)v13 + 2) = v17;
    v13[6] = v11;
    v13[7] = v12;
    if (v6 >= v1[2])
      goto LABEL_14;
    v14 = &v1[v7];
    result = swift_unknownObjectRelease();
    *(_OWORD *)v14 = v16;
    v14[2] = v9;
    v14[3] = v10;
    v5 = v15;
LABEL_4:
    ++v4;
    --v6;
    v7 -= 4;
    v3 += 4;
    if (v5 == v4)
      return (uint64_t)v1;
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_222C27E5C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  if (!*(_QWORD *)(v13 + 16))
  {
    v21 = 0u;
    v22 = 0u;
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  v14 = sub_222C2584C(a2, a3);
  if ((v15 & 1) == 0)
  {
    v21 = 0u;
    v22 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_222C23EA8(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v21);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v22 + 1))
  {
LABEL_8:
    sub_222C280C8((uint64_t)&v21, &qword_255771700);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_9;
  }
  v16 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, v16 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_9:
    sub_222C280C8((uint64_t)v8, &qword_2557717E8);
    *(_QWORD *)&v21 = 0;
    *((_QWORD *)&v21 + 1) = 0xE000000000000000;
    sub_222C38A64();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v21 = 0xD00000000000002CLL;
    *((_QWORD *)&v21 + 1) = 0x8000000222C39D80;
    sub_222C389C8();
    v18 = *((_QWORD *)&v21 + 1);
    v17 = v21;
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v19 = v17;
    *(_QWORD *)(v19 + 8) = v18;
    *(_BYTE *)(v19 + 16) = 1;
    swift_willThrow();
    return v17 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  LOBYTE(v17) = sub_222C38938();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17 & 1;
}

uint64_t sub_222C280C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_222C28104()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557717F0;
  if (!qword_2557717F0)
  {
    v1 = sub_222C38968();
    result = MEMORY[0x22767B0FC](MEMORY[0x24BDCE948], v1);
    atomic_store(result, (unint64_t *)&qword_2557717F0);
  }
  return result;
}

uint64_t sub_222C2814C(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(result + 16);
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v3 = result;
    result = swift_bridgeObjectRetain();
    v4 = 0;
    v5 = 0;
    v6 = v2 + 4;
    while (1)
    {
      v7 = *(_QWORD *)(v3 + 8 * v5 + 32);
      if (v4)
      {
        result = swift_bridgeObjectRetain();
        v8 = __OFSUB__(v4--, 1);
        if (v8)
          goto LABEL_30;
      }
      else
      {
        v9 = v2[3];
        if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_31;
        v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
        if (v10 <= 1)
          v11 = 1;
        else
          v11 = v10;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2557717F8);
        v12 = (_QWORD *)swift_allocObject();
        v13 = _swift_stdlib_malloc_size(v12);
        v14 = v13 - 32;
        if (v13 < 32)
          v14 = v13 - 17;
        v15 = v14 >> 4;
        v12[2] = v11;
        v12[3] = 2 * (v14 >> 4);
        v16 = v12 + 4;
        v17 = v2[3] >> 1;
        v6 = &v12[2 * v17 + 4];
        v18 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - v17;
        if (v2[2])
        {
          if (v12 != v2 || v16 >= &v2[2 * v17 + 4])
            memmove(v16, v2 + 4, 16 * v17);
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        result = swift_release();
        v2 = v12;
        v8 = __OFSUB__(v18, 1);
        v4 = v18 - 1;
        if (v8)
        {
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
      }
      *v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        result = swift_bridgeObjectRelease();
        goto LABEL_26;
      }
    }
  }
  v4 = 0;
LABEL_26:
  v20 = v2[3];
  if (v20 >= 2)
  {
    v21 = v20 >> 1;
    v8 = __OFSUB__(v21, v4);
    v22 = v21 - v4;
    if (v8)
      goto LABEL_32;
    v2[2] = v22;
  }
  return (uint64_t)v2;
}

uint64_t sub_222C282D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_222C28320(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xE900000000000064;
  v3 = 0x65646953206F7754;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 1936942412;
    else
      v5 = 0x72657461657247;
    if (v4 == 1)
      v6 = 0xE400000000000000;
    else
      v6 = 0xE700000000000000;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x65646953206F7754;
  v6 = 0xE900000000000064;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 1936942412;
    else
      v3 = 0x72657461657247;
    if (v7 == 1)
      v2 = 0xE400000000000000;
    else
      v2 = 0xE700000000000000;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_222C38B24();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_222C28428(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000018;
  else
    v3 = 0xD000000000000025;
  if (v2)
    v4 = 0x8000000222C39810;
  else
    v4 = 0x8000000222C39840;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000018;
  else
    v5 = 0xD000000000000025;
  if ((a2 & 1) != 0)
    v6 = 0x8000000222C39840;
  else
    v6 = 0x8000000222C39810;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_222C38B24();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_222C284D0()
{
  sub_222C38B90();
  sub_222C389BC();
  swift_bridgeObjectRelease();
  return sub_222C38B9C();
}

uint64_t sub_222C28554()
{
  sub_222C38B90();
  sub_222C389BC();
  swift_bridgeObjectRelease();
  return sub_222C38B9C();
}

ODCurareAnalysis::TestSkippedReason_optional __swiftcall TestSkippedReason.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  ODCurareAnalysis::TestSkippedReason_optional v2;

  v1 = sub_222C38B0C();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = ODCurareAnalysis_TestSkippedReason_SmallSampleSize;
  else
    v2.value = ODCurareAnalysis_TestSkippedReason_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

unint64_t TestSkippedReason.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000018;
  else
    return 0xD000000000000025;
}

uint64_t sub_222C28660(char *a1, char *a2)
{
  return sub_222C28428(*a1, *a2);
}

unint64_t sub_222C28670()
{
  unint64_t result;

  result = qword_255771800;
  if (!qword_255771800)
  {
    result = MEMORY[0x22767B0FC](&protocol conformance descriptor for TestSkippedReason, &type metadata for TestSkippedReason);
    atomic_store(result, (unint64_t *)&qword_255771800);
  }
  return result;
}

uint64_t sub_222C286B4()
{
  return sub_222C284D0();
}

uint64_t sub_222C286BC()
{
  sub_222C389BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_222C2871C()
{
  return sub_222C28554();
}

uint64_t sub_222C28724@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_222C38B0C();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_222C28780(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD000000000000018;
  else
    v2 = 0xD000000000000025;
  v3 = 0x8000000222C39810;
  if (*v1)
    v3 = 0x8000000222C39840;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_222C287C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  _BYTE v14[32];
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE v18[32];

  v2 = sub_222C38968();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v14[-v7];
  sub_222C23EA8(a1, (uint64_t)v18);
  sub_222C23EA8((uint64_t)v18, (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
  swift_dynamicCast();
  if (!v17)
  {
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
LABEL_5:
    v10 = (uint64_t)v9;
    goto LABEL_8;
  }
  sub_222C23FB4((uint64_t)&v15);
  if ((swift_dynamicCast() & 1) != 0 || swift_dynamicCast())
  {
    v10 = sub_222C389A4();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  if (swift_dynamicCast())
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_222C2DFE8(0, &qword_255771AF8);
    sub_222C38920();
    v10 = sub_222C38A1C();
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
    goto LABEL_8;
  }
  if (swift_dynamicCast())
  {
    sub_222C2DFE8(0, &qword_255771AF8);
    v9 = (id)sub_222C38A34();
    goto LABEL_5;
  }
  if (swift_dynamicCast())
  {
    sub_222C2DFE8(0, &qword_255771AF8);
    v9 = (id)sub_222C38A1C();
    goto LABEL_5;
  }
  if (swift_dynamicCast())
  {
    sub_222C2DFE8(0, &qword_255771AF8);
    v9 = (id)sub_222C38A28();
    goto LABEL_5;
  }
  sub_222C2DFE8(0, &qword_255771AF0);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    v16 = 0xE000000000000000;
    sub_222C38A64();
    sub_222C389C8();
    sub_222C38AC4();
    v10 = v15;
    v12 = v16;
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v13 = v10;
    *(_QWORD *)(v13 + 8) = v12;
    *(_BYTE *)(v13 + 16) = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
    return v10;
  }
  v10 = v15;
LABEL_8:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  return v10;
}

uint64_t sub_222C28BC8(uint64_t (*a1)(_QWORD), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _BYTE v21[16];
  uint64_t v22;
  char *v23;
  char v24;
  uint64_t v25;
  char *v26;
  char v27;
  uint64_t v28;
  uint64_t v29[6];

  v29[5] = a4;
  v9 = v4;
  v10 = sub_222C38BC0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v21[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29[3] = a1(0);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v29);
  sub_222C2E020(v4, (uint64_t)boxed_opaque_existential_0, a1);
  sub_222C38BA8();
  v15 = sub_222C38BB4();
  v28 = v9;
  v25 = a2;
  v26 = &v27;
  v22 = a3;
  v23 = &v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771AD8);
  v16 = sub_222C38AB8();
  if (v5)
  {
    v29[0] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771AE0);
    swift_willThrowTypedImpl();
    swift_release();
    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    v17 = v16;
    swift_release();
    if (*(_QWORD *)(v17 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255771AE8);
      v18 = sub_222C38B00();
    }
    else
    {
      v18 = MEMORY[0x24BEE4B00];
    }
    v29[0] = v18;
    v19 = (_QWORD *)swift_bridgeObjectRetain();
    sub_222C2D22C(v19, 1, v29);
    swift_bridgeObjectRelease();
    v15 = v29[0];
    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  }
  return v15;
}

unint64_t sub_222C28DB4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;

  if (!a2)
    goto LABEL_4;
  swift_bridgeObjectRetain();
  sub_222C287C4(a3);
  if (v3)
  {
    MEMORY[0x22767B0A8](v3);
    swift_bridgeObjectRelease();
LABEL_4:
    sub_222C38A64();
    sub_222C389C8();
    swift_bridgeObjectRetain();
    sub_222C389C8();
    swift_bridgeObjectRelease();
    sub_222C389C8();
    sub_222C38AC4();
    sub_222C389C8();
    a1 = 0xE000000000000000;
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(v6 + 8) = 0xE000000000000000;
    *(_BYTE *)(v6 + 16) = 1;
    swift_willThrow();
  }
  return a1;
}

uint64_t sub_222C28F38()
{
  return sub_222C28BC8(type metadata accessor for BinomialTestResult, (uint64_t)sub_222C2E0E0, (uint64_t)sub_222C2D218, (uint64_t)sub_222C2E0F4);
}

uint64_t sub_222C28F6C@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11)
{
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  void (*v25)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;

  *(_QWORD *)a9 = 0x747365545ALL;
  *(_QWORD *)(a9 + 8) = 0xE500000000000000;
  v19 = (int *)type metadata accessor for ZTestResult(0);
  v20 = a9 + v19[8];
  *(double *)v20 = a10;
  *(_BYTE *)(v20 + 8) = 0;
  *(_BYTE *)(a9 + v19[9]) = a1;
  *(_QWORD *)(a9 + v19[10]) = a2;
  *(_QWORD *)(a9 + v19[11]) = a3;
  v21 = a9 + v19[12];
  v22 = sub_222C38968();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32);
  v24(v21, a4, v22);
  v25 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56);
  v25(v21, 0, 1, v22);
  v26 = a9 + v19[13];
  v24(v26, a5, v22);
  v25(v26, 0, 1, v22);
  *(_QWORD *)(a9 + v19[14]) = a6;
  *(_QWORD *)(a9 + v19[15]) = a7;
  v27 = a9 + v19[16];
  v24(v27, a8, v22);
  v25(v27, 0, 1, v22);
  v28 = a9 + v19[17];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v28, a11, v22);
  v25(v28, 0, 1, v22);
  v29 = a9 + v19[7];
  v24(v29, a11, v22);
  result = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v25)(v29, 0, 1, v22);
  *(_WORD *)(a9 + 16) = 513;
  return result;
}

uint64_t sub_222C29134()
{
  return sub_222C28BC8(type metadata accessor for ZTestResult, (uint64_t)sub_222C2E0E0, (uint64_t)sub_222C2D218, (uint64_t)sub_222C2E0F4);
}

uint64_t sub_222C29168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  void (*v20)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;

  *(_QWORD *)a7 = 0x775474736554534BLL;
  *(_QWORD *)(a7 + 8) = 0xEF656C706D61536FLL;
  v14 = (int *)type metadata accessor for KSTestTwoSampleResult(0);
  v15 = a7 + v14[8];
  *(double *)v15 = a8;
  *(_BYTE *)(v15 + 8) = 0;
  *(_QWORD *)(a7 + v14[9]) = a1;
  v16 = a7 + v14[10];
  v17 = sub_222C38968();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
  v19(v16, a2, v17);
  v20 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v20(v16, 0, 1, v17);
  v21 = a7 + v14[11];
  v19(v21, a3, v17);
  v20(v21, 0, 1, v17);
  *(_QWORD *)(a7 + v14[12]) = a4;
  v22 = a7 + v14[13];
  v19(v22, a5, v17);
  v20(v22, 0, 1, v17);
  v23 = a7 + v14[14];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v23, a6, v17);
  v20(v23, 0, 1, v17);
  v24 = a7 + v14[7];
  v19(v24, a6, v17);
  result = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v20)(v24, 0, 1, v17);
  *(_WORD *)(a7 + 16) = 513;
  return result;
}

uint64_t sub_222C29320()
{
  return sub_222C28BC8(type metadata accessor for KSTestTwoSampleResult, (uint64_t)sub_222C2E064, (uint64_t)sub_222C2D218, (uint64_t)sub_222C2E0F4);
}

uint64_t sub_222C29354()
{
  return sub_222C28BC8(type metadata accessor for MalformedTestResult, (uint64_t)sub_222C2E0E0, (uint64_t)sub_222C2D218, (uint64_t)sub_222C2DFD0);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TestSkippedReason(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TestSkippedReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_222C29474 + 4 * byte_222C393D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_222C294A8 + 4 * byte_222C393D0[v4]))();
}

uint64_t sub_222C294A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_222C294B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x222C294B8);
  return result;
}

uint64_t sub_222C294C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x222C294CCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_222C294D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222C294D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_222C294E4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_222C294EC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TestSkippedReason()
{
  return &type metadata for TestSkippedReason;
}

_QWORD *initializeBufferWithCopyOfBuffer for BinomialTestResult(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    v8 = a3[7];
    v9 = (void *)(a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = sub_222C38968();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[8];
    v17 = a3[9];
    v18 = (char *)v4 + v16;
    v19 = (uint64_t)a2 + v16;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = *(_BYTE *)(v19 + 8);
    *((_BYTE *)v4 + v17) = *((_BYTE *)a2 + v17);
    v20 = a3[11];
    *(_QWORD *)((char *)v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    *(_QWORD *)((char *)v4 + v20) = *(uint64_t *)((char *)a2 + v20);
    v21 = a3[12];
    v22 = (char *)v4 + v21;
    v23 = (char *)a2 + v21;
    if (v13((char *)a2 + v21, 1, v11))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v22, v23, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v22, 0, 1, v11);
    }
    v25 = a3[13];
    v26 = (char *)v4 + v25;
    v27 = (char *)a2 + v25;
    if (v13(v27, 1, v11))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v26, v27, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v26, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for BinomialTestResult(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = sub_222C38968();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + a2[12];
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  v9 = a1 + a2[13];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v9, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return result;
}

uint64_t initializeWithCopy for BinomialTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_222C38968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[8];
  v15 = a3[9];
  v16 = a1 + v14;
  v17 = a2 + v14;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v18 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);
  v19 = a3[12];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  if (v12((const void *)(a2 + v19), 1, v10))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v20, v21, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
  }
  v23 = a3[13];
  v24 = (void *)(a1 + v23);
  v25 = (const void *)(a2 + v23);
  if (v12(v25, 1, v10))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v24, v25, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v24, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for BinomialTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  uint64_t v30;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = (uint64_t *)(a2 + v15);
  v18 = *v17;
  *(_BYTE *)(v16 + 8) = *((_BYTE *)v17 + 8);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v19 = a3[12];
  v20 = (void *)(a1 + v19);
  v21 = (void *)(a2 + v19);
  v22 = v11((void *)(a1 + v19), 1, v9);
  v23 = v11(v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v20, v21, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v20, v21, v9);
LABEL_13:
  v25 = a3[13];
  v26 = (void *)(a1 + v25);
  v27 = (void *)(a2 + v25);
  v28 = v11((void *)(a1 + v25), 1, v9);
  v29 = v11(v27, 1, v9);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v26, v27, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
    goto LABEL_18;
  }
  if (v29)
  {
LABEL_18:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v26, v27, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for BinomialTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(const void *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[8];
  v14 = a3[9];
  v15 = a1 + v13;
  v16 = a2 + v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  v17 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  v18 = a3[12];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  if (v11((const void *)(a2 + v18), 1, v9))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v19, v20, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  }
  v22 = a3[13];
  v23 = (void *)(a1 + v22);
  v24 = (const void *)(a2 + v22);
  if (v11(v24, 1, v9))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v23, v24, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for BinomialTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_222C38968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[8];
  v17 = a3[9];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  v20 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  v21 = a3[12];
  v22 = (void *)(a1 + v21);
  v23 = (void *)(a2 + v21);
  v24 = v12((void *)(a1 + v21), 1, v10);
  v25 = v12(v23, 1, v10);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v22, v23, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v22, v10);
LABEL_12:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v22, v23, v10);
LABEL_13:
  v27 = a3[13];
  v28 = (void *)(a1 + v27);
  v29 = (void *)(a2 + v27);
  v30 = v12((void *)(a1 + v27), 1, v10);
  v31 = v12(v29, 1, v10);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v28, v29, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v28, v10);
    goto LABEL_18;
  }
  if (v31)
  {
LABEL_18:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v28, v29, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinomialTestResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for BinomialTestResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for BinomialTestResult(uint64_t a1)
{
  return sub_222C2D118(a1, (uint64_t *)&unk_255771860);
}

void sub_222C2A1E4()
{
  unint64_t v0;

  sub_222C2A28C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_222C2A28C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255771870)
  {
    sub_222C38968();
    v0 = sub_222C38A4C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255771870);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for ZTestResult(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    v8 = a3[7];
    v9 = (void *)(a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = sub_222C38968();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[8];
    v17 = a3[9];
    v18 = (char *)v4 + v16;
    v19 = (uint64_t)a2 + v16;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = *(_BYTE *)(v19 + 8);
    *((_BYTE *)v4 + v17) = *((_BYTE *)a2 + v17);
    v20 = a3[11];
    *(_QWORD *)((char *)v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    *(_QWORD *)((char *)v4 + v20) = *(uint64_t *)((char *)a2 + v20);
    v21 = a3[12];
    v22 = (char *)v4 + v21;
    v23 = (char *)a2 + v21;
    if (v13((char *)a2 + v21, 1, v11))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v22, v23, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v22, 0, 1, v11);
    }
    v25 = a3[13];
    v26 = (char *)v4 + v25;
    v27 = (char *)a2 + v25;
    if (v13((char *)a2 + v25, 1, v11))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v26, v27, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v26, 0, 1, v11);
    }
    v29 = a3[15];
    *(_QWORD *)((char *)v4 + a3[14]) = *(uint64_t *)((char *)a2 + a3[14]);
    *(_QWORD *)((char *)v4 + v29) = *(uint64_t *)((char *)a2 + v29);
    v30 = a3[16];
    v31 = (char *)v4 + v30;
    v32 = (char *)a2 + v30;
    if (v13((char *)a2 + v30, 1, v11))
    {
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v31, v32, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v31, 0, 1, v11);
    }
    v34 = a3[17];
    v35 = (char *)v4 + v34;
    v36 = (char *)a2 + v34;
    if (v13(v36, 1, v11))
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v35, v36, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v35, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for ZTestResult(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = sub_222C38968();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + a2[12];
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  v9 = a1 + a2[13];
  if (!v7(v9, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  v10 = a1 + a2[16];
  if (!v7(v10, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v5);
  v11 = a1 + a2[17];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v11, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v11, v5);
  return result;
}

uint64_t initializeWithCopy for ZTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_222C38968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[8];
  v15 = a3[9];
  v16 = a1 + v14;
  v17 = a2 + v14;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v18 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);
  v19 = a3[12];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  if (v12((const void *)(a2 + v19), 1, v10))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v20, v21, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
  }
  v23 = a3[13];
  v24 = (void *)(a1 + v23);
  v25 = (const void *)(a2 + v23);
  if (v12((const void *)(a2 + v23), 1, v10))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v24, v25, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v24, 0, 1, v10);
  }
  v27 = a3[15];
  *(_QWORD *)(a1 + a3[14]) = *(_QWORD *)(a2 + a3[14]);
  *(_QWORD *)(a1 + v27) = *(_QWORD *)(a2 + v27);
  v28 = a3[16];
  v29 = (void *)(a1 + v28);
  v30 = (const void *)(a2 + v28);
  if (v12((const void *)(a2 + v28), 1, v10))
  {
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v29, v30, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v29, 0, 1, v10);
  }
  v32 = a3[17];
  v33 = (void *)(a1 + v32);
  v34 = (const void *)(a2 + v32);
  if (v12(v34, 1, v10))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v33, v34, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v33, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for ZTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = (uint64_t *)(a2 + v15);
  v18 = *v17;
  *(_BYTE *)(v16 + 8) = *((_BYTE *)v17 + 8);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v19 = a3[12];
  v20 = (void *)(a1 + v19);
  v21 = (void *)(a2 + v19);
  v22 = v11((void *)(a1 + v19), 1, v9);
  v23 = v11(v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v20, v21, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v20, v21, v9);
LABEL_13:
  v25 = a3[13];
  v26 = (void *)(a1 + v25);
  v27 = (void *)(a2 + v25);
  v28 = v11((void *)(a1 + v25), 1, v9);
  v29 = v11(v27, 1, v9);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v26, v27, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
LABEL_18:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v26, v27, v9);
LABEL_19:
  *(_QWORD *)(a1 + a3[14]) = *(_QWORD *)(a2 + a3[14]);
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  v31 = a3[16];
  v32 = (void *)(a1 + v31);
  v33 = (void *)(a2 + v31);
  v34 = v11((void *)(a1 + v31), 1, v9);
  v35 = v11(v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v32, v33, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v32, v9);
LABEL_24:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v32, v33, v9);
LABEL_25:
  v37 = a3[17];
  v38 = (void *)(a1 + v37);
  v39 = (void *)(a2 + v37);
  v40 = v11((void *)(a1 + v37), 1, v9);
  v41 = v11(v39, 1, v9);
  if (!v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v38, v39, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v38, v9);
    goto LABEL_30;
  }
  if (v41)
  {
LABEL_30:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v38, v39, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v38, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for ZTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(const void *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  uint64_t v34;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[8];
  v14 = a3[9];
  v15 = a1 + v13;
  v16 = a2 + v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  v17 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  v18 = a3[12];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  if (v11((const void *)(a2 + v18), 1, v9))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v19, v20, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  }
  v22 = a3[13];
  v23 = (void *)(a1 + v22);
  v24 = (const void *)(a2 + v22);
  if (v11((const void *)(a2 + v22), 1, v9))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v23, v24, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  }
  v26 = a3[15];
  *(_QWORD *)(a1 + a3[14]) = *(_QWORD *)(a2 + a3[14]);
  *(_QWORD *)(a1 + v26) = *(_QWORD *)(a2 + v26);
  v27 = a3[16];
  v28 = (void *)(a1 + v27);
  v29 = (const void *)(a2 + v27);
  if (v11((const void *)(a2 + v27), 1, v9))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v28, v29, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v28, 0, 1, v9);
  }
  v31 = a3[17];
  v32 = (void *)(a1 + v31);
  v33 = (const void *)(a2 + v31);
  if (v11(v33, 1, v9))
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v32, v33, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for ZTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_222C38968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[8];
  v17 = a3[9];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  v20 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  v21 = a3[12];
  v22 = (void *)(a1 + v21);
  v23 = (void *)(a2 + v21);
  v24 = v12((void *)(a1 + v21), 1, v10);
  v25 = v12(v23, 1, v10);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v22, v23, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v22, v10);
LABEL_12:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v22, v23, v10);
LABEL_13:
  v27 = a3[13];
  v28 = (void *)(a1 + v27);
  v29 = (void *)(a2 + v27);
  v30 = v12((void *)(a1 + v27), 1, v10);
  v31 = v12(v29, 1, v10);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v28, v29, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v28, v10);
LABEL_18:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v28, v29, v10);
LABEL_19:
  v33 = a3[15];
  *(_QWORD *)(a1 + a3[14]) = *(_QWORD *)(a2 + a3[14]);
  *(_QWORD *)(a1 + v33) = *(_QWORD *)(a2 + v33);
  v34 = a3[16];
  v35 = (void *)(a1 + v34);
  v36 = (void *)(a2 + v34);
  v37 = v12((void *)(a1 + v34), 1, v10);
  v38 = v12(v36, 1, v10);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v35, v36, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v35, 0, 1, v10);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v38)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v35, v10);
LABEL_24:
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v35, v36, v10);
LABEL_25:
  v40 = a3[17];
  v41 = (void *)(a1 + v40);
  v42 = (void *)(a2 + v40);
  v43 = v12((void *)(a1 + v40), 1, v10);
  v44 = v12(v42, 1, v10);
  if (!v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v41, v42, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v41, v10);
    goto LABEL_30;
  }
  if (v44)
  {
LABEL_30:
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v41, v42, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v41, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ZTestResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ZTestResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for ZTestResult(uint64_t a1)
{
  return sub_222C2D118(a1, qword_255771918);
}

void sub_222C2B5EC()
{
  unint64_t v0;

  sub_222C2A28C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for KSTestTwoSampleResult(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    v8 = a3[7];
    v9 = (void *)(a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = sub_222C38968();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[8];
    v17 = a3[9];
    v18 = (char *)v4 + v16;
    v19 = (uint64_t)a2 + v16;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v20 = *(uint64_t *)((char *)a2 + v17);
    v18[8] = *(_BYTE *)(v19 + 8);
    *(_QWORD *)((char *)v4 + v17) = v20;
    v21 = a3[10];
    v22 = (char *)v4 + v21;
    v23 = (char *)a2 + v21;
    if (v13((char *)a2 + v21, 1, v11))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v22, v23, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v22, 0, 1, v11);
    }
    v25 = a3[11];
    v26 = (char *)v4 + v25;
    v27 = (char *)a2 + v25;
    if (v13((char *)a2 + v25, 1, v11))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v26, v27, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v26, 0, 1, v11);
    }
    v29 = a3[13];
    *(_QWORD *)((char *)v4 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    v30 = (char *)v4 + v29;
    v31 = (char *)a2 + v29;
    if (v13((char *)a2 + v29, 1, v11))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v30, v31, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v30, 0, 1, v11);
    }
    v33 = a3[14];
    v34 = (char *)v4 + v33;
    v35 = (char *)a2 + v33;
    if (v13(v35, 1, v11))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v34, v35, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v34, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for KSTestTwoSampleResult(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = sub_222C38968();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + a2[10];
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  v9 = a1 + a2[11];
  if (!v7(v9, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  v10 = a1 + a2[13];
  if (!v7(v10, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v5);
  v11 = a1 + a2[14];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v11, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v11, v5);
  return result;
}

uint64_t initializeWithCopy for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  uint64_t v34;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_222C38968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[8];
  v15 = a3[9];
  v16 = a1 + v14;
  v17 = a2 + v14;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  v18 = *(_QWORD *)(a2 + v15);
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  *(_QWORD *)(a1 + v15) = v18;
  v19 = a3[10];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  if (v12((const void *)(a2 + v19), 1, v10))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v20, v21, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
  }
  v23 = a3[11];
  v24 = (void *)(a1 + v23);
  v25 = (const void *)(a2 + v23);
  if (v12((const void *)(a2 + v23), 1, v10))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v24, v25, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v24, 0, 1, v10);
  }
  v27 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v28 = (void *)(a1 + v27);
  v29 = (const void *)(a2 + v27);
  if (v12((const void *)(a2 + v27), 1, v10))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v28, v29, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
  }
  v31 = a3[14];
  v32 = (void *)(a1 + v31);
  v33 = (const void *)(a2 + v31);
  if (v12(v33, 1, v10))
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v32, v33, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v32, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = (uint64_t *)(a2 + v15);
  v18 = *v17;
  *(_BYTE *)(v16 + 8) = *((_BYTE *)v17 + 8);
  *(_QWORD *)v16 = v18;
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  v19 = a3[10];
  v20 = (void *)(a1 + v19);
  v21 = (void *)(a2 + v19);
  v22 = v11((void *)(a1 + v19), 1, v9);
  v23 = v11(v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v20, v21, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v20, v21, v9);
LABEL_13:
  v25 = a3[11];
  v26 = (void *)(a1 + v25);
  v27 = (void *)(a2 + v25);
  v28 = v11((void *)(a1 + v25), 1, v9);
  v29 = v11(v27, 1, v9);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v26, v27, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
LABEL_18:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v26, v27, v9);
LABEL_19:
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v31 = a3[13];
  v32 = (void *)(a1 + v31);
  v33 = (void *)(a2 + v31);
  v34 = v11((void *)(a1 + v31), 1, v9);
  v35 = v11(v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v32, v33, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v32, v9);
LABEL_24:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v32, v33, v9);
LABEL_25:
  v37 = a3[14];
  v38 = (void *)(a1 + v37);
  v39 = (void *)(a2 + v37);
  v40 = v11((void *)(a1 + v37), 1, v9);
  v41 = v11(v39, 1, v9);
  if (!v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v38, v39, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v38, v9);
    goto LABEL_30;
  }
  if (v41)
  {
LABEL_30:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v38, v39, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v38, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(const void *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const void *v32;
  uint64_t v33;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[8];
  v14 = a3[9];
  v15 = a1 + v13;
  v16 = a2 + v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v17 = *(_QWORD *)(a2 + v14);
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  *(_QWORD *)(a1 + v14) = v17;
  v18 = a3[10];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  if (v11((const void *)(a2 + v18), 1, v9))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v19, v20, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  }
  v22 = a3[11];
  v23 = (void *)(a1 + v22);
  v24 = (const void *)(a2 + v22);
  if (v11((const void *)(a2 + v22), 1, v9))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v23, v24, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  }
  v26 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v27 = (void *)(a1 + v26);
  v28 = (const void *)(a2 + v26);
  if (v11((const void *)(a2 + v26), 1, v9))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v27, v28, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v27, 0, 1, v9);
  }
  v30 = a3[14];
  v31 = (void *)(a1 + v30);
  v32 = (const void *)(a2 + v30);
  if (v11(v32, 1, v9))
  {
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v31, v32, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v31, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  uint64_t v44;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_222C38968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[8];
  v17 = a3[9];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v20 = *(_QWORD *)(a2 + v17);
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_QWORD *)(a1 + v17) = v20;
  v21 = a3[10];
  v22 = (void *)(a1 + v21);
  v23 = (void *)(a2 + v21);
  v24 = v12((void *)(a1 + v21), 1, v10);
  v25 = v12(v23, 1, v10);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v22, v23, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v22, v10);
LABEL_12:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v22, v23, v10);
LABEL_13:
  v27 = a3[11];
  v28 = (void *)(a1 + v27);
  v29 = (void *)(a2 + v27);
  v30 = v12((void *)(a1 + v27), 1, v10);
  v31 = v12(v29, 1, v10);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v28, v29, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v28, v10);
LABEL_18:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v28, v29, v10);
LABEL_19:
  v33 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  v34 = (void *)(a1 + v33);
  v35 = (void *)(a2 + v33);
  v36 = v12((void *)(a1 + v33), 1, v10);
  v37 = v12(v35, 1, v10);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v34, v35, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v34, 0, 1, v10);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v37)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v34, v10);
LABEL_24:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v34, v35, v10);
LABEL_25:
  v39 = a3[14];
  v40 = (void *)(a1 + v39);
  v41 = (void *)(a2 + v39);
  v42 = v12((void *)(a1 + v39), 1, v10);
  v43 = v12(v41, 1, v10);
  if (!v42)
  {
    if (!v43)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v40, v41, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v40, v10);
    goto LABEL_30;
  }
  if (v43)
  {
LABEL_30:
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v40, v41, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v40, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for KSTestTwoSampleResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for KSTestTwoSampleResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for KSTestTwoSampleResult(uint64_t a1)
{
  return sub_222C2D118(a1, qword_2557719D8);
}

void sub_222C2C904()
{
  unint64_t v0;

  sub_222C2A28C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for MalformedTestResult(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    v8 = *(int *)(a3 + 28);
    v9 = (void *)(a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = sub_222C38968();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = *(int *)(a3 + 32);
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MalformedTestResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_222C38968();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v7 = *(int *)(a3 + 28);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_222C38968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = *(int *)(a3 + 32);
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v6 = *(int *)(a3 + 28);
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = *(int *)(a3 + 32);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v6 = *(int *)(a3 + 28);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_222C38968();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t assignWithTake for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = *(int *)(a3 + 28);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_222C38968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = *(int *)(a3 + 32);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MalformedTestResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MalformedTestResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for MalformedTestResult(uint64_t a1)
{
  return sub_222C2D118(a1, qword_255771A90);
}

uint64_t sub_222C2D118(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_222C2D14C()
{
  unint64_t v0;

  sub_222C2A28C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t sub_222C2D218@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_222C2E07C(a1, a2, a3);
}

uint64_t sub_222C2D22C(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void **i;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (!a1[2])
    return swift_bridgeObjectRelease();
  v43 = a1[2];
  v7 = a1[4];
  v6 = a1[5];
  v8 = (void *)a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v10 = v8;
  v12 = sub_222C2584C(v7, v6);
  v13 = v9[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
    goto LABEL_23;
  v16 = v11;
  if (v9[3] >= v15)
  {
    if ((a2 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_222C2D5B8();
      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v21 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    v22 = (uint64_t *)(v21[6] + 16 * v12);
    *v22 = v7;
    v22[1] = v6;
    *(_QWORD *)(v21[7] + 8 * v12) = v10;
    v23 = v21[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    v26 = v43 - 1;
    if (v43 == 1)
      return swift_bridgeObjectRelease_n();
    for (i = (void **)(a1 + 9); ; i += 3)
    {
      v29 = (uint64_t)*(i - 2);
      v28 = (uint64_t)*(i - 1);
      v30 = *i;
      v31 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v10 = v30;
      v32 = sub_222C2584C(v29, v28);
      v34 = v31[2];
      v35 = (v33 & 1) == 0;
      v24 = __OFADD__(v34, v35);
      v36 = v34 + v35;
      if (v24)
        break;
      v37 = v33;
      if (v31[3] < v36)
      {
        sub_222C2D94C(v36, 1);
        v32 = sub_222C2584C(v29, v28);
        if ((v37 & 1) != (v38 & 1))
          goto LABEL_25;
      }
      if ((v37 & 1) != 0)
        goto LABEL_10;
      v39 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      v40 = (uint64_t *)(v39[6] + 16 * v32);
      *v40 = v29;
      v40[1] = v28;
      *(_QWORD *)(v39[7] + 8 * v32) = v10;
      v41 = v39[2];
      v24 = __OFADD__(v41, 1);
      v42 = v41 + 1;
      if (v24)
        goto LABEL_24;
      v39[2] = v42;
      if (!--v26)
        return swift_bridgeObjectRelease_n();
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_222C2D94C(v15, a2 & 1);
  v17 = sub_222C2584C(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    v12 = v17;
    if ((v16 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v20 = swift_allocError();
    swift_willThrow();
    MEMORY[0x22767B0B4](v20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771AE0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      return MEMORY[0x22767B0A8](v20);
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_222C38B3C();
  __break(1u);
LABEL_26:
  sub_222C38A64();
  sub_222C389C8();
  sub_222C38AC4();
  sub_222C389C8();
  result = sub_222C38AD0();
  __break(1u);
  return result;
}

id sub_222C2D5B8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771AE8);
  v2 = *v0;
  v3 = sub_222C38AE8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_222C2D768()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B00);
  v2 = *v0;
  v3 = sub_222C38AE8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_222C23EA8(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_222C2E0D0(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_222C2D94C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771AE8);
  v38 = a2;
  v6 = sub_222C38AF4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_222C38B90();
    sub_222C389BC();
    result = sub_222C38B9C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_222C2DC58(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B00);
  v6 = sub_222C38AF4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_222C2E0D0(v24, v35);
      }
      else
      {
        sub_222C23EA8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_222C38B90();
      sub_222C389BC();
      result = sub_222C38B9C();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_222C2E0D0(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

__n128 sub_222C2DF54@<Q0>(uint64_t a1@<X0>, void (*a2)(uint64_t *__return_ptr, uint64_t, uint64_t *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  __n128 result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;

  a2(&v9, a1, &v8);
  if (v3)
  {
    v5 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771AE0);
    swift_allocError();
    *v7 = v5;
  }
  else
  {
    result = v10;
    *(_QWORD *)a3 = v9;
    *(__n128 *)(a3 + 8) = result;
  }
  return result;
}

double sub_222C2DFD0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;

  *(_QWORD *)&result = sub_222C2DF54(a1, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t *))*(_QWORD *)(v2 + 16), a2).n128_u64[0];
  return result;
}

uint64_t sub_222C2DFE8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_222C2E020(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_222C2E064(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_222C28DB4(a1, a2, a3);
}

uint64_t sub_222C2E07C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD *))(v3 + 16))(*a1, a1[1], a1 + 2);
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    *a3 = result;
    a3[1] = v8;
    a3[2] = v9;
  }
  return result;
}

_OWORD *sub_222C2E0D0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_222C2E0E0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_222C2E064(a1, a2, a3);
}

double sub_222C2E0F4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_222C2DFD0(a1, a2);
}

unint64_t sub_222C2E108(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771AE8);
  v2 = (_QWORD *)sub_222C38B00();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_222C2584C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_222C2E220(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B00);
  v2 = sub_222C38B00();
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
    sub_222C32EA0(v6, (uint64_t)&v15, &qword_255771BA8);
    v7 = v15;
    v8 = v16;
    result = sub_222C2584C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_222C2E0D0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_222C2E354(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
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
  uint64_t *v23;
  uint64_t *v24;
  void (*v25)(char *, unint64_t, unint64_t);
  uint64_t v26;
  void (*v27)(char *, uint64_t, unint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t inited;
  uint64_t v33;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(unint64_t, uint64_t, uint64_t);
  unint64_t v48;
  void (*v49)(char *, unint64_t, uint64_t);
  char *v50;
  _QWORD *v51;
  char *v52;
  uint64_t v53;
  void **v54;
  void *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  id v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t result;
  unint64_t v66;
  void **v67;
  _QWORD *v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;
  __int128 v72;
  char *v73;
  uint64_t v74;
  uint64_t **v75;
  char *v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v4 = v2;
  v84 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (unint64_t)&v66 - v10;
  v12 = sub_222C38968();
  v81 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v76 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&v66 - v15;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_255771B80);
  v16 = MEMORY[0x24BDAC7A8](v79);
  v75 = (uint64_t **)((char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = MEMORY[0x24BDAC7A8](v16);
  v68 = (unint64_t *)((char *)&v66 - v19);
  MEMORY[0x24BDAC7A8](v18);
  v67 = (void **)((char *)&v66 - v20);
  v71 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    v21 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_3;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    v21 = sub_222C38ADC();
    swift_bridgeObjectRelease();
LABEL_3:
    v83 = *(_QWORD *)(v84 + 16);
    if (v83 >= v21)
      v22 = v21;
    else
      v22 = v83;
    v86 = MEMORY[0x24BEE4AF8];
    v23 = &v86;
    *(_QWORD *)&v77 = v22 & ~(v22 >> 63);
    sub_222C322F0(0, v77, 0);
    if (v22 < 0)
    {
      __break(1u);
LABEL_59:
      v26 = (uint64_t)v73;
      (*(void (**)(char *, uint64_t, uint64_t, unint64_t))(a1 + 56))(v73, 1, 1, v3);
LABEL_60:

      result = sub_222C280C8(v26, &qword_2557717E8);
      __break(1u);
      return result;
    }
    v78 = a1;
    v66 = v4;
    v70 = v11;
    if (!v22)
      break;
    v73 = v9;
    v9 = (char *)(a1 & 0xFFFFFFFFFFFFFF8);
    if (v71)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v74 = sub_222C38ADC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v74 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v11 = 0;
    v82 = a1 & 0xC000000000000001;
    v72 = xmmword_222C39300;
    v80 = a1 & 0xFFFFFFFFFFFFFF8;
    v85 = v22;
    while (1)
    {
      v4 = v83;
      if ((_QWORD)v77 == v11)
        break;
      if (v74 == v11)
        goto LABEL_52;
      if (v82)
      {
        v24 = (uint64_t *)MEMORY[0x22767AC88](v11, a1);
      }
      else
      {
        if (v11 >= *((_QWORD *)v9 + 2))
          goto LABEL_56;
        v24 = (uint64_t *)*(id *)(a1 + 8 * v11 + 32);
      }
      v23 = v24;
      v3 = v12;
      a1 = v81;
      if (v4 == v11)
        goto LABEL_59;
      v25 = *(void (**)(char *, unint64_t, unint64_t))(v81 + 16);
      v26 = (uint64_t)v73;
      v25(v73, v84+ ((*(unsigned __int8 *)(v81 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80))+ *(_QWORD *)(v81 + 72) * v11, v3);
      (*(void (**)(uint64_t, _QWORD, uint64_t, unint64_t))(a1 + 56))(v26, 0, 1, v3);
      if ((*(unsigned int (**)(uint64_t, uint64_t, unint64_t))(a1 + 48))(v26, 1, v3) == 1)
        goto LABEL_60;
      v27 = *(void (**)(char *, uint64_t, unint64_t))(a1 + 32);
      v28 = v76;
      v27(v76, v26, v3);
      v29 = *(int *)(v79 + 48);
      v30 = (uint64_t)v75;
      v31 = (char *)v75 + v29;
      *v75 = v23;
      v27((char *)(v30 + v29), (uint64_t)v28, v3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255771B28);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v72;
      *(_QWORD *)(inited + 32) = 1635017060;
      *(_QWORD *)(inited + 40) = 0xE400000000000000;
      v33 = sub_222C2DFE8(0, &qword_255771AF8);
      *(_QWORD *)(inited + 48) = v23;
      *(_QWORD *)(inited + 72) = v33;
      *(_QWORD *)(inited + 80) = 0x6D617473656D6974;
      *(_QWORD *)(inited + 88) = 0xE900000000000070;
      *(_QWORD *)(inited + 120) = v3;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 96));
      v25((char *)boxed_opaque_existential_0, (unint64_t)v31, v3);
      v35 = v23;
      v36 = sub_222C2E220(inited);
      sub_222C280C8(v30, &qword_255771B80);
      v37 = v86;
      v12 = v3;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_222C322F0(0, *(_QWORD *)(v37 + 16) + 1, 1);
        v37 = v86;
      }
      v4 = *(_QWORD *)(v37 + 16);
      v38 = *(_QWORD *)(v37 + 24);
      if (v4 >= v38 >> 1)
      {
        sub_222C322F0((_QWORD *)(v38 > 1), v4 + 1, 1);
        v37 = v86;
      }
      ++v11;
      *(_QWORD *)(v37 + 16) = v4 + 1;
      *(_QWORD *)(v37 + 8 * v4 + 32) = v36;
      v22 = v85;
      a1 = v78;
      v9 = (char *)v80;
      if (v85 == v11)
      {
        v11 = v70;
        goto LABEL_27;
      }
    }
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
  }
  v9 = (char *)(a1 & 0xFFFFFFFFFFFFFF8);
  v82 = a1 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_27:
  v3 = v83;
  if (a1 < 0)
    v39 = (char *)a1;
  else
    v39 = v9;
  v76 = v39;
  v77 = xmmword_222C39300;
  v80 = (uint64_t)v9;
  if (v71)
  {
    while (1)
    {
      swift_bridgeObjectRetain();
      v40 = sub_222C38ADC();
      swift_bridgeObjectRelease();
      if (v22 == v40)
        break;
LABEL_34:
      if (v82)
      {
        v41 = (id)MEMORY[0x22767AC88](v22, a1);
      }
      else
      {
        if ((unint64_t)v22 >= *((_QWORD *)v9 + 2))
          goto LABEL_53;
        v41 = *(id *)(a1 + 8 * v22 + 32);
      }
      v42 = v41;
      if (__OFADD__(v22, 1))
        goto LABEL_54;
      if (v3 == v22)
      {
        (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v81 + 56))(v11, 1, 1, v12);
LABEL_49:

        sub_222C280C8(v11, &qword_2557717E8);
        break;
      }
      if (v22 >= v3)
        goto LABEL_55;
      v43 = v81;
      v44 = v84 + ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80));
      v45 = *(_QWORD *)(v81 + 72);
      v85 = v22;
      v46 = v44 + v45 * v22;
      v47 = *(void (**)(unint64_t, uint64_t, uint64_t))(v81 + 16);
      v47(v11, v46, v12);
      (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v43 + 56))(v11, 0, 1, v12);
      if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v43 + 48))(v11, 1, v12) == 1)
        goto LABEL_49;
      v48 = v11;
      v49 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 32);
      v50 = v69;
      v49(v69, v48, v12);
      v4 = v79;
      v51 = v68;
      v52 = (char *)v68 + *(int *)(v79 + 48);
      *v68 = v42;
      v49(v52, (unint64_t)v50, v12);
      v53 = (uint64_t)v51;
      v54 = v67;
      sub_222C32D1C(v53, (uint64_t)v67);
      v55 = *v54;
      v56 = (char *)v54 + *(int *)(v4 + 48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255771B28);
      v57 = swift_initStackObject();
      *(_OWORD *)(v57 + 16) = v77;
      *(_QWORD *)(v57 + 32) = 1635017060;
      *(_QWORD *)(v57 + 40) = 0xE400000000000000;
      v58 = sub_222C2DFE8(0, &qword_255771AF8);
      *(_QWORD *)(v57 + 48) = v55;
      *(_QWORD *)(v57 + 72) = v58;
      *(_QWORD *)(v57 + 80) = 0x6D617473656D6974;
      *(_QWORD *)(v57 + 88) = 0xE900000000000070;
      *(_QWORD *)(v57 + 120) = v12;
      v59 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v57 + 96));
      v47((unint64_t)v59, (uint64_t)v56, v12);
      v60 = v55;
      v61 = sub_222C2E220(v57);
      sub_222C280C8((uint64_t)v54, &qword_255771B80);
      v62 = v86;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_222C322F0(0, *(_QWORD *)(v62 + 16) + 1, 1);
        v62 = v86;
      }
      v9 = (char *)v80;
      v64 = *(_QWORD *)(v62 + 16);
      v63 = *(_QWORD *)(v62 + 24);
      v3 = v83;
      if (v64 >= v63 >> 1)
      {
        sub_222C322F0((_QWORD *)(v63 > 1), v64 + 1, 1);
        v62 = v86;
      }
      *(_QWORD *)(v62 + 16) = v64 + 1;
      *(_QWORD *)(v62 + 8 * v64 + 32) = v61;
      v22 = v85 + 1;
      a1 = v78;
      v11 = v70;
      if (!v71)
        goto LABEL_31;
    }
  }
  else
  {
LABEL_31:
    if (v22 != *((_QWORD *)v9 + 2))
      goto LABEL_34;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v86;
}

uint64_t Timeseries.runChangeDetection(events:test:lastRun:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[3];
  uint64_t v8;
  uint64_t v9;

  sub_222C2EED4(a1, a2, a3, v7);
  v3 = v8;
  v4 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

uint64_t sub_222C2EED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _QWORD v9[4];
  _QWORD v10[9];

  v9[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255771BB0);
  v9[0] = a2;
  swift_bridgeObjectRetain();
  sub_222C23674((uint64_t)v9, v10);
  sub_222C2F024(a1, v10, a3, a4);
  return sub_222C32EE4((uint64_t)v10);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_222C2F024@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t *v24;
  char *v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t *boxed_opaque_existential_0;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;

  v8 = sub_222C2F388(a1);
  if (v8)
  {
    sub_222C2FAC4(v8, a2, a3, (uint64_t)a4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_222C2F4CC(a1);
    if (v10)
    {
      v11 = v10;
      v12 = *a2;
      v13 = *(_QWORD *)(*a2 + 16);
      if (v13)
      {
        v38 = a4;
        v35 = a2;
        if (v10 >> 62)
        {
LABEL_27:
          swift_bridgeObjectRetain();
          v14 = sub_222C38ADC();
        }
        else
        {
          v14 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        v15 = 0;
        v16 = v12 + 32;
        v39 = v12;
        v36 = v12 + 32;
        v37 = v13;
        do
        {
          if (v15 == v13)
            goto LABEL_26;
          if (v14)
          {
            v17 = (uint64_t *)(v16 + 16 * v15);
            v13 = *v17;
            v12 = v17[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v18 = 4;
            while (1)
            {
              v19 = (v11 & 0xC000000000000001) != 0
                  ? (id)MEMORY[0x22767AC88](v18 - 4, v11)
                  : *(id *)(v11 + 8 * v18);
              v20 = v19;
              v21 = v18 - 3;
              if (__OFADD__(v18 - 4, 1))
                break;
              swift_bridgeObjectRetain();
              v22 = objc_msgSend(v20, sel_respondsToSelector_, sub_222C38974());

              if (!v22)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                v30 = type metadata accessor for MalformedTestResult(0);
                v38[3] = v30;
                v38[4] = (uint64_t)&off_24EB534D0;
                boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v38);
                *boxed_opaque_existential_0 = 0x656D726F666C614DLL;
                boxed_opaque_existential_0[1] = 0xE900000000000064;
                *((_WORD *)boxed_opaque_existential_0 + 8) = 0;
                v32 = (char *)boxed_opaque_existential_0 + *(int *)(v30 + 28);
                v33 = sub_222C38968();
                result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 1, 1, v33);
                v27 = (unint64_t *)((char *)boxed_opaque_existential_0 + *(int *)(v30 + 32));
                v28 = 0xD000000000000028;
                v29 = "Cannot parse required field from events.";
                goto LABEL_21;
              }
              ++v18;
              if (v21 == v14)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v12 = v39;
                v16 = v36;
                v13 = v37;
                goto LABEL_8;
              }
            }
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
LABEL_8:
          ++v15;
        }
        while (v15 != v13);
        swift_bridgeObjectRelease();
        a4 = v38;
        a2 = v35;
      }
      swift_bridgeObjectRetain();
      v34 = sub_222C32B58(v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_222C2FAC4((uint64_t)v34, a2, a3, (uint64_t)a4);
      return swift_bridgeObjectRelease();
    }
    else
    {
      v23 = type metadata accessor for MalformedTestResult(0);
      a4[3] = v23;
      a4[4] = (uint64_t)&off_24EB534D0;
      v24 = __swift_allocate_boxed_opaque_existential_0(a4);
      *v24 = 0x656D726F666C614DLL;
      v24[1] = 0xE900000000000064;
      *((_WORD *)v24 + 8) = 0;
      v25 = (char *)v24 + *(int *)(v23 + 28);
      v26 = sub_222C38968();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 1, 1, v26);
      v27 = (unint64_t *)((char *)v24 + *(int *)(v23 + 32));
      v28 = 0xD00000000000001FLL;
      v29 = "Unrecognized format for events.";
LABEL_21:
      *v27 = v28;
      v27[1] = (unint64_t)(v29 - 32) | 0x8000000000000000;
    }
  }
  return result;
}

uint64_t sub_222C2F388(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  _BYTE v9[32];
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  sub_222C322F0(0, v2, 0);
  v3 = v10;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_222C23EA8(i, (uint64_t)v9);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2557716E0);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_222C322F0(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v10;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_222C322F0((_QWORD *)(v5 > 1), v6 + 1, 1);
        v3 = v10;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      *(_QWORD *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_222C2F4CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_222C38A94();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_222C23EA8(i, (uint64_t)v5);
    sub_222C2DFE8(0, &qword_255771AF0);
    if (!swift_dynamicCast())
      break;
    sub_222C38A7C();
    sub_222C38AA0();
    sub_222C38AAC();
    sub_222C38A88();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

uint64_t sub_222C2F5E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  int v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v22;
  _BYTE v23[32];
  uint64_t v24;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v23[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = sub_222C38968();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v23[-v10 - 8];
  v12 = *(_QWORD *)(a1 + 16);
  v24 = MEMORY[0x24BEE4AF8];
  sub_222C32328(0, v12, 0);
  if (!v12)
    return v24;
  v13 = a1 + 32;
  v22 = v9;
  while (1)
  {
    sub_222C32EA0(v13, (uint64_t)v23, &qword_255771700);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
    v14 = swift_dynamicCast();
    v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    if (!v14)
      break;
    v15(v4, 0, 1, v5);
    v16 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v16(v11, v4, v5);
    v16(v9, v11, v5);
    v17 = v24;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_222C32328(0, *(_QWORD *)(v17 + 16) + 1, 1);
      v17 = v24;
    }
    v19 = *(_QWORD *)(v17 + 16);
    v18 = *(_QWORD *)(v17 + 24);
    if (v19 >= v18 >> 1)
    {
      sub_222C32328(v18 > 1, v19 + 1, 1);
      v17 = v24;
    }
    *(_QWORD *)(v17 + 16) = v19 + 1;
    v20 = v17
        + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
        + *(_QWORD *)(v6 + 72) * v19;
    v9 = v22;
    v16((char *)v20, v22, v5);
    v24 = v17;
    v13 += 32;
    if (!--v12)
      return v17;
  }
  v15(v4, 1, 1, v5);
  swift_release();
  sub_222C280C8((uint64_t)v4, &qword_2557717E8);
  return 0;
}

uint64_t sub_222C2F834(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  _BYTE v9[32];
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  sub_222C32344(0, v2, 0);
  v3 = v10;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_222C32EA0(i, (uint64_t)v9, &qword_255771700);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_222C32344(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v10;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_222C32344((char *)(v5 > 1), v6 + 1, 1);
        v3 = v10;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      *(_QWORD *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2)
        return v3;
    }
    swift_release();
    return 0;
  }
  return v3;
}

uint64_t sub_222C2F978(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  _BYTE v9[32];
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  sub_222C32360(0, v2, 0);
  v3 = v10;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_222C32EA0(i, (uint64_t)v9, &qword_255771700);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_222C32360(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v10;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_222C32360((char *)(v5 > 1), v6 + 1, 1);
        v3 = v10;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      *(_QWORD *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2)
        return v3;
    }
    swift_release();
    return 0;
  }
  return v3;
}

uint64_t sub_222C2FAC4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a1;
  v30 = a1;
  v8 = a2[1];
  v31 = v8;
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    sub_222C32D64((uint64_t)&v31);
    v10 = (uint64_t *)(v8 + 48);
    do
    {
      v11 = *(v10 - 1);
      v12 = *v10;
      v13 = *(v10 - 2);
      swift_bridgeObjectRetain();
      v14 = swift_bridgeObjectRetain();
      v15 = (void *)MEMORY[0x22767ADF0](v14);
      sub_222C33468(v13, v11, v12, &v30);
      objc_autoreleasePoolPop(v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v10 += 3;
      --v9;
    }
    while (v9);
    v16 = sub_222C32D8C((uint64_t)&v31);
    v6 = v30;
  }
  else
  {
    v16 = swift_bridgeObjectRetain();
  }
  v17 = a2[2];
  v18 = a2[3];
  v19 = a2[4];
  v20 = (void *)MEMORY[0x22767ADF0](v16);
  sub_222C26C78(v17, v18, v19, v6, a3, (uint64_t *)v28);
  objc_autoreleasePoolPop(v20);
  swift_bridgeObjectRelease();
  v29 = *(_QWORD *)&v28[0];
  v21 = runPostprocessingSteps(_:steps:lastRun:)((uint64_t)&v29, a2[5]);
  v22 = v29;
  v23 = a2[6];
  v24 = a2[7];
  v25 = a2[8];
  v26 = (void *)MEMORY[0x22767ADF0](v21);
  sub_222C35EEC(v23, v24, v25, v22, (uint64_t *)v28);
  objc_autoreleasePoolPop(v26);
  swift_bridgeObjectRelease();
  return sub_222C32DB4(v28, a4);
}

uint64_t Timeseries.runBinomialTestTimeseries(samples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:pHypothesis:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v8;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t inited;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  unint64_t v59;
  int *v60;
  int v61;
  void (*v62)(char *, uint64_t, uint64_t, int *);
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t result;
  int v67;
  uint64_t v68;
  __CFString *v69;
  int v70;
  int v71;
  char v72;
  char v73;
  __CFString **v74;
  __CFString *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  _QWORD v91[2];
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  __int128 v102;
  uint64_t v103;
  void *v104;
  void *v105;
  int *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109[63];
  _QWORD v110[6];
  _WORD v111[8];
  unint64_t v112;

  v104 = a7;
  v105 = a8;
  v107 = a6;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v100 = (uint64_t)v91 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v99 = (uint64_t)v91 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v101 = (char *)v91 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v108 = (uint64_t)v91 - v21;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255771B18);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)v91 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = (int *)type metadata accessor for BinomialTestResult(0);
  v25 = MEMORY[0x24BDAC7A8](v106);
  v26 = MEMORY[0x24BDAC7A8](v25);
  MEMORY[0x24BDAC7A8](v26);
  v103 = (uint64_t)v91 - v30;
  if (a1 >> 62)
  {
    v96 = v27;
    v97 = v28;
    v98 = v29;
    swift_bridgeObjectRetain();
    v31 = sub_222C38ADC();
    swift_bridgeObjectRelease();
    v28 = v97;
    v29 = v98;
    v27 = v96;
  }
  else
  {
    v31 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v31 != *(_QWORD *)(a2 + 16))
  {
    sub_222C23F24();
    swift_allocError();
    v35 = 0;
    *(_QWORD *)v34 = 0xD000000000000036;
    v36 = "samples and sampleTimestamps should be the same length";
LABEL_41:
    *(_QWORD *)(v34 + 8) = (unint64_t)(v36 - 32) | 0x8000000000000000;
    *(_BYTE *)(v34 + 16) = v35;
    swift_willThrow();
    return v35;
  }
  v97 = v28;
  v98 = v29;
  v96 = v27;
  v32 = a3 == 0x736B6E756863 && a4 == 0xE600000000000000;
  v33 = v32;
  if (!v32)
  {
    if ((sub_222C38B24() & 1) == 0)
    {
      if (a3 == 1937334628 && a4 == 0xE400000000000000)
      {
LABEL_17:
        if ((sub_222C38B24() & 1) == 0)
          goto LABEL_20;
        goto LABEL_18;
      }
      if ((sub_222C38B24() & 1) == 0)
      {
        sub_222C23F24();
        swift_allocError();
        v35 = 0;
        *(_QWORD *)v34 = 0xD000000000000024;
        v36 = "chunkMethod should be chunks or days";
        goto LABEL_41;
      }
    }
    if ((v33 & 1) != 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_18:
  if (!a5 || (uint64_t)objc_msgSend(a5, sel_integerValue) <= 0)
  {
    sub_222C23F24();
    swift_allocError();
    v35 = 0;
    *(_QWORD *)v34 = 0xD00000000000004CLL;
    v36 = "minimumSampleSize should be in range (0, Int.max) when chunkMethod is chunks";
    goto LABEL_41;
  }
LABEL_20:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v94 = sub_222C2E354(a1, a2);
  v91[1] = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B20);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_222C39300;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B28);
  inited = swift_initStackObject();
  v102 = xmmword_222C393C0;
  *(_OWORD *)(inited + 16) = xmmword_222C393C0;
  *(_QWORD *)(inited + 32) = 0x73646C656966;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_2557716F0);
  *(_QWORD *)(inited + 48) = &unk_24EB530C0;
  v39 = sub_222C2E220(inited);
  *(_QWORD *)(v37 + 32) = 0x6148657275736E65;
  *(_QWORD *)(v37 + 40) = 0xEF73646C65694673;
  *(_QWORD *)(v37 + 48) = v39;
  v40 = swift_initStackObject();
  *(_OWORD *)(v40 + 16) = v102;
  *(_QWORD *)(v40 + 32) = 0x646C656966;
  *(_QWORD *)(v40 + 40) = 0xE500000000000000;
  *(_QWORD *)(v40 + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v40 + 48) = 0x6D617473656D6974;
  *(_QWORD *)(v40 + 56) = 0xE900000000000070;
  v41 = sub_222C2E220(v40);
  *(_QWORD *)(v37 + 56) = 0xD000000000000012;
  *(_QWORD *)(v37 + 64) = 0x8000000222C39F70;
  *(_QWORD *)(v37 + 72) = v41;
  v95 = 1937334628;
  if (a3 == 1937334628 && a4 == 0xE400000000000000)
  {
    v93 = 0xE400000000000000;
  }
  else
  {
    v42 = sub_222C38B24();
    v43 = 1937334628;
    if ((v42 & 1) == 0)
      v43 = 0x6E75527473616CLL;
    v95 = v43;
    if ((v42 & 1) != 0)
      v44 = 0xE400000000000000;
    else
      v44 = 0xE700000000000000;
    v93 = v44;
  }
  v45 = swift_initStackObject();
  *(_OWORD *)(v45 + 16) = v102;
  *(_QWORD *)(v45 + 32) = 0x6C656946656D6974;
  *(_QWORD *)(v45 + 40) = 0xE900000000000064;
  *(_QWORD *)(v45 + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v45 + 48) = 0x6D617473656D6974;
  *(_QWORD *)(v45 + 56) = 0xE900000000000070;
  v92 = sub_222C2E220(v45);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = v102;
  v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = v102;
  *(_QWORD *)(v47 + 32) = 0x74676E654C78616DLL;
  *(_QWORD *)(v47 + 40) = 0xE900000000000068;
  *(_QWORD *)(v47 + 72) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v47 + 48) = 1;
  v48 = sub_222C2E220(v47);
  *(_QWORD *)(v46 + 32) = 0x786966667573;
  *(_QWORD *)(v46 + 40) = 0xE600000000000000;
  *(_QWORD *)(v46 + 48) = v48;
  v49 = swift_initStackObject();
  if (a5)
  {
    *(_OWORD *)(v49 + 16) = xmmword_222C39610;
    *(_QWORD *)(v49 + 32) = 0x6C65694661746164;
    *(_QWORD *)(v49 + 40) = 0xE900000000000064;
    *(_QWORD *)(v49 + 48) = 1635017060;
    *(_QWORD *)(v49 + 56) = 0xE400000000000000;
    v50 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v49 + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v49 + 80) = 0x6C656946656D6974;
    *(_QWORD *)(v49 + 88) = 0xE900000000000064;
    *(_QWORD *)(v49 + 96) = 0x6D617473656D6974;
    *(_QWORD *)(v49 + 104) = 0xE900000000000070;
    *(_QWORD *)(v49 + 120) = v50;
    *(_QWORD *)(v49 + 128) = 0xD000000000000011;
    *(_QWORD *)(v49 + 136) = 0x8000000222C39AC0;
    v51 = sub_222C2DFE8(0, &qword_255771AF8);
    *(_QWORD *)(v49 + 144) = a5;
    *(_QWORD *)(v49 + 168) = v51;
    *(_QWORD *)(v49 + 176) = 0xD000000000000011;
    v52 = v104;
    v53 = v105;
    *(_QWORD *)(v49 + 184) = 0x8000000222C39F90;
    *(_QWORD *)(v49 + 192) = v52;
    *(_QWORD *)(v49 + 216) = v51;
    *(_QWORD *)(v49 + 224) = 0x6568746F70794870;
    *(_QWORD *)(v49 + 264) = v51;
    *(_QWORD *)(v49 + 232) = 0xEB00000000736973;
    *(_QWORD *)(v49 + 240) = v53;
    v54 = v52;
  }
  else
  {
    *(_OWORD *)(v49 + 16) = xmmword_222C39620;
    *(_QWORD *)(v49 + 32) = 0x6C65694661746164;
    *(_QWORD *)(v49 + 40) = 0xE900000000000064;
    *(_QWORD *)(v49 + 48) = 1635017060;
    *(_QWORD *)(v49 + 56) = 0xE400000000000000;
    v55 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v49 + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v49 + 80) = 0x6C656946656D6974;
    *(_QWORD *)(v49 + 88) = 0xE900000000000064;
    *(_QWORD *)(v49 + 96) = 0x6D617473656D6974;
    *(_QWORD *)(v49 + 104) = 0xE900000000000070;
    *(_QWORD *)(v49 + 120) = v55;
    *(_QWORD *)(v49 + 128) = 0xD000000000000011;
    *(_QWORD *)(v49 + 136) = 0x8000000222C39F90;
    v56 = sub_222C2DFE8(0, &qword_255771AF8);
    v53 = v104;
    a5 = v105;
    *(_QWORD *)(v49 + 144) = v104;
    *(_QWORD *)(v49 + 168) = v56;
    *(_QWORD *)(v49 + 176) = 0x6568746F70794870;
    *(_QWORD *)(v49 + 216) = v56;
    *(_QWORD *)(v49 + 184) = 0xEB00000000736973;
    *(_QWORD *)(v49 + 192) = a5;
  }
  v57 = v53;
  v58 = a5;
  v59 = sub_222C2E220(v49);
  v110[0] = &unk_24EB53100;
  v110[1] = v37;
  v110[2] = v95;
  v110[3] = v93;
  v110[4] = v92;
  v110[5] = v46;
  strcpy((char *)v111, "BinomialTest");
  HIBYTE(v111[6]) = 0;
  v111[7] = -5120;
  v112 = v59;
  sub_222C2FAC4(v94, v110, (uint64_t)v107, (uint64_t)v109);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B30);
  v60 = v106;
  v61 = swift_dynamicCast();
  v62 = *(void (**)(char *, uint64_t, uint64_t, int *))(v98 + 56);
  if (!v61)
  {
    v35 = 1;
    v62(v24, 1, 1, v60);
    sub_222C280C8((uint64_t)v24, &qword_255771B18);
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v34 = 0xD000000000000027;
    v36 = "Failed to produce binomial test results";
    goto LABEL_41;
  }
  v62(v24, 0, 1, v60);
  v63 = v103;
  sub_222C32054((uint64_t)v24, v103, type metadata accessor for BinomialTestResult);
  v64 = *(unsigned __int8 *)(v63 + 17);
  v65 = v97;
  result = sub_222C2E020(v63, v97, type metadata accessor for BinomialTestResult);
  if (v64 == 2)
  {
    sub_222C32098(v65, type metadata accessor for BinomialTestResult);
    goto LABEL_36;
  }
  v70 = *(unsigned __int8 *)(v65 + 17);
  if (v70 == 2)
  {
    __break(1u);
    goto LABEL_67;
  }
  if ((v70 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_222C32098(v97, type metadata accessor for BinomialTestResult);
LABEL_51:
    v74 = testError;
    goto LABEL_54;
  }
  v73 = sub_222C38B24();
  swift_bridgeObjectRelease();
  sub_222C32098(v97, type metadata accessor for BinomialTestResult);
  if ((v73 & 1) != 0)
    goto LABEL_51;
LABEL_36:
  v67 = *(unsigned __int8 *)(v63 + 17);
  v68 = v96;
  result = sub_222C2E020(v63, v96, type metadata accessor for BinomialTestResult);
  if (v67 == 2)
  {
    sub_222C32098(v68, type metadata accessor for BinomialTestResult);
    v69 = 0;
LABEL_55:
    v76 = (uint64_t)v101;
    v77 = *(unsigned __int8 *)(v63 + 16);
    if (v77 == 1)
    {
      sub_222C32EA0(v63 + v60[12], v108, &qword_2557717E8);
      v78 = v63 + v60[7];
    }
    else
    {
      v79 = sub_222C38968();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 56))(v108, 1, 1, v79);
      v78 = (uint64_t)v107;
    }
    sub_222C32EA0(v78, v76, &qword_2557717E8);
    if ((*(_BYTE *)(v63 + v60[8] + 8) & 1) != 0)
      v107 = 0;
    else
      v107 = (void *)sub_222C38A10();
    v80 = *(unsigned __int8 *)(v63 + v60[9]);
    LODWORD(v105) = v77;
    if (v80 == 2)
      v81 = 0;
    else
      v81 = (void *)sub_222C38A04();
    v82 = v60[11];
    v83 = *(_QWORD *)(v63 + v60[10]);
    v84 = *(_QWORD *)(v63 + v82);
    v85 = v99;
    sub_222C32EA0(v108, v99, &qword_2557717E8);
    v86 = v76;
    v87 = v76;
    v88 = v100;
    sub_222C32EA0(v86, v100, &qword_2557717E8);
    objc_allocWithZone((Class)TestResult);
    v106 = v69;
    v89 = sub_222C31F2C((char)v105, v69, v107, v81, v83, v84, v85, v88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771B38);
    v90 = swift_allocObject();
    *(_OWORD *)(v90 + 16) = xmmword_222C39630;
    *(_QWORD *)(v90 + 32) = v89;
    v109[0] = v90;
    sub_222C389EC();
    v35 = v109[0];

    sub_222C280C8(v87, &qword_2557717E8);
    sub_222C280C8(v108, &qword_2557717E8);
    sub_222C32098(v103, type metadata accessor for BinomialTestResult);
    return v35;
  }
  v71 = *(unsigned __int8 *)(v68 + 17);
  if (v71 != 2)
  {
    if ((v71 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_222C32098(v96, type metadata accessor for BinomialTestResult);
    }
    else
    {
      v72 = sub_222C38B24();
      swift_bridgeObjectRelease();
      sub_222C32098(v96, type metadata accessor for BinomialTestResult);
      if ((v72 & 1) == 0)
      {
        v69 = 0;
        goto LABEL_55;
      }
    }
    v74 = &smallSampleSize;
LABEL_54:
    v69 = *v74;
    v75 = *v74;
    goto LABEL_55;
  }
LABEL_67:
  __break(1u);
  return result;
}

uint64_t Timeseries.runZTestBinomialProportionsTimeseries(samples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  uint64_t v7;
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t inited;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  id v66;
  unint64_t v67;
  int *v68;
  int v69;
  void (*v70)(char *, uint64_t, uint64_t, int *);
  uint64_t v71;
  int v72;
  unsigned __int8 *v73;
  uint64_t result;
  int v75;
  uint64_t v76;
  __CFString *v77;
  int v78;
  int v79;
  char v80;
  char v81;
  __CFString **v82;
  __CFString *v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  _QWORD v102[2];
  __int128 v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned __int8 *v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  uint64_t v117;
  void *v118;
  int *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124[57];
  _QWORD v125[10];

  v118 = a7;
  v120 = a6;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v114 = (uint64_t)v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v112 = (uint64_t)v102 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v113 = (uint64_t)v102 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v111 = (uint64_t)v102 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v115 = (uint64_t)v102 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v123 = (uint64_t)v102 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v122 = (uint64_t)v102 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v121 = (uint64_t)v102 - v28;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255771B40);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)v102 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = (int *)type metadata accessor for ZTestResult(0);
  v32 = MEMORY[0x24BDAC7A8](v119);
  v33 = MEMORY[0x24BDAC7A8](v32);
  MEMORY[0x24BDAC7A8](v33);
  v117 = (uint64_t)v102 - v37;
  if (a1 >> 62)
  {
    v108 = v34;
    v109 = v35;
    v110 = v36;
    swift_bridgeObjectRetain();
    v38 = sub_222C38ADC();
    swift_bridgeObjectRelease();
    v35 = v109;
    v36 = v110;
    v34 = v108;
  }
  else
  {
    v38 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v38 != *(_QWORD *)(a2 + 16))
  {
    sub_222C23F24();
    swift_allocError();
    v42 = 0;
    *(_QWORD *)v41 = 0xD000000000000036;
    v43 = "samples and sampleTimestamps should be the same length";
    goto LABEL_37;
  }
  v109 = v35;
  v110 = v36;
  v108 = v34;
  v39 = a3 == 0x736B6E756863 && a4 == 0xE600000000000000;
  v40 = v39;
  if (v39)
  {
LABEL_18:
    if (a5 && (uint64_t)objc_msgSend(a5, sel_integerValue) > 0)
      goto LABEL_20;
    sub_222C23F24();
    swift_allocError();
    v42 = 0;
    *(_QWORD *)v41 = 0xD00000000000004CLL;
    v43 = "minimumSampleSize should be in range (0, Int.max) when chunkMethod is chunks";
LABEL_37:
    *(_QWORD *)(v41 + 8) = (unint64_t)(v43 - 32) | 0x8000000000000000;
    *(_BYTE *)(v41 + 16) = v42;
    swift_willThrow();
    return v42;
  }
  if ((sub_222C38B24() & 1) == 0)
  {
    if (a3 == 1937334628 && a4 == 0xE400000000000000)
      goto LABEL_17;
    if ((sub_222C38B24() & 1) == 0)
    {
      sub_222C23F24();
      swift_allocError();
      v42 = 0;
      *(_QWORD *)v41 = 0xD000000000000024;
      v43 = "chunkMethod should be chunks or days";
      goto LABEL_37;
    }
  }
  if ((v40 & 1) != 0)
    goto LABEL_18;
LABEL_17:
  if ((sub_222C38B24() & 1) != 0)
    goto LABEL_18;
LABEL_20:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v104 = sub_222C2E354(a1, a2);
  v102[1] = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B20);
  v44 = swift_allocObject();
  v103 = xmmword_222C39300;
  *(_OWORD *)(v44 + 16) = xmmword_222C39300;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B28);
  inited = swift_initStackObject();
  v116 = xmmword_222C393C0;
  *(_OWORD *)(inited + 16) = xmmword_222C393C0;
  *(_QWORD *)(inited + 32) = 0x73646C656966;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_2557716F0);
  *(_QWORD *)(inited + 48) = &unk_24EB53140;
  v46 = sub_222C2E220(inited);
  *(_QWORD *)(v44 + 32) = 0x6148657275736E65;
  *(_QWORD *)(v44 + 40) = 0xEF73646C65694673;
  *(_QWORD *)(v44 + 48) = v46;
  v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = v116;
  *(_QWORD *)(v47 + 32) = 0x646C656966;
  *(_QWORD *)(v47 + 40) = 0xE500000000000000;
  v48 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v47 + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v47 + 48) = 0x6D617473656D6974;
  *(_QWORD *)(v47 + 56) = 0xE900000000000070;
  v49 = sub_222C2E220(v47);
  *(_QWORD *)(v44 + 56) = 0xD000000000000012;
  *(_QWORD *)(v44 + 64) = 0x8000000222C39F70;
  *(_QWORD *)(v44 + 72) = v49;
  v107 = 1937334628;
  if (a3 == 1937334628 && a4 == 0xE400000000000000 || (sub_222C38B24() & 1) != 0)
  {
    v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = v116;
    *(_QWORD *)(v50 + 32) = 0x6C656946656D6974;
    *(_QWORD *)(v50 + 40) = 0xE900000000000064;
    *(_QWORD *)(v50 + 72) = v48;
    *(_QWORD *)(v50 + 48) = 0x6D617473656D6974;
    *(_QWORD *)(v50 + 56) = 0xE900000000000070;
    v105 = sub_222C2E220(v50);
    v106 = 0xE400000000000000;
  }
  else
  {
    v51 = swift_initStackObject();
    *(_OWORD *)(v51 + 16) = v116;
    *(_QWORD *)(v51 + 32) = 0x6C656946656D6974;
    *(_QWORD *)(v51 + 40) = 0xE900000000000064;
    *(_QWORD *)(v51 + 72) = v48;
    *(_QWORD *)(v51 + 48) = 0x6D617473656D6974;
    *(_QWORD *)(v51 + 56) = 0xE900000000000070;
    v105 = sub_222C2E220(v51);
    v106 = 0xE700000000000000;
    v107 = 0x6E75527473616CLL;
  }
  v52 = swift_allocObject();
  if (a5)
  {
    *(_OWORD *)(v52 + 16) = v103;
    v53 = swift_initStackObject();
    *(_OWORD *)(v53 + 16) = v116;
    *(_QWORD *)(v53 + 32) = 0x74676E654C78616DLL;
    *(_QWORD *)(v53 + 40) = 0xE900000000000068;
    *(_QWORD *)(v53 + 72) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v53 + 48) = 2;
    v54 = sub_222C2E220(v53);
    *(_QWORD *)(v52 + 32) = 0x786966667573;
    *(_QWORD *)(v52 + 40) = 0xE600000000000000;
    *(_QWORD *)(v52 + 48) = v54;
    v55 = swift_initStackObject();
    *(_OWORD *)(v55 + 16) = v116;
    *(_QWORD *)(v55 + 32) = 0xD000000000000011;
    *(_QWORD *)(v55 + 40) = 0x8000000222C39AC0;
    v56 = sub_222C2DFE8(0, &qword_255771AF8);
    *(_QWORD *)(v55 + 72) = v56;
    *(_QWORD *)(v55 + 48) = a5;
    v57 = a5;
    v58 = sub_222C2E220(v55);
    *(_QWORD *)(v52 + 56) = 0xD000000000000010;
    *(_QWORD *)(v52 + 64) = 0x8000000222C39A80;
    *(_QWORD *)(v52 + 72) = v58;
    v59 = swift_initStackObject();
    *(_OWORD *)(v59 + 16) = xmmword_222C39620;
    *(_QWORD *)(v59 + 32) = 0x6C65694661746164;
    *(_QWORD *)(v59 + 40) = 0xE900000000000064;
    *(_QWORD *)(v59 + 48) = 1635017060;
    *(_QWORD *)(v59 + 56) = 0xE400000000000000;
    v60 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v59 + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v59 + 80) = 0x6C656946656D6974;
    *(_QWORD *)(v59 + 88) = 0xE900000000000064;
    *(_QWORD *)(v59 + 96) = 0x6D617473656D6974;
    *(_QWORD *)(v59 + 104) = 0xE900000000000070;
    *(_QWORD *)(v59 + 120) = v60;
    *(_QWORD *)(v59 + 128) = 0xD000000000000011;
    *(_QWORD *)(v59 + 136) = 0x8000000222C39AC0;
    *(_QWORD *)(v59 + 144) = v57;
    *(_QWORD *)(v59 + 168) = v56;
    *(_QWORD *)(v59 + 176) = 0xD000000000000011;
    *(_QWORD *)(v59 + 216) = v56;
    v61 = v118;
    *(_QWORD *)(v59 + 184) = 0x8000000222C39F90;
    *(_QWORD *)(v59 + 192) = v61;
    v62 = v57;
  }
  else
  {
    *(_OWORD *)(v52 + 16) = v116;
    v63 = swift_initStackObject();
    *(_OWORD *)(v63 + 16) = v116;
    *(_QWORD *)(v63 + 32) = 0x74676E654C78616DLL;
    *(_QWORD *)(v63 + 40) = 0xE900000000000068;
    *(_QWORD *)(v63 + 72) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v63 + 48) = 2;
    v64 = sub_222C2E220(v63);
    *(_QWORD *)(v52 + 32) = 0x786966667573;
    *(_QWORD *)(v52 + 40) = 0xE600000000000000;
    *(_QWORD *)(v52 + 48) = v64;
    v59 = swift_initStackObject();
    *(_OWORD *)(v59 + 16) = xmmword_222C39640;
    *(_QWORD *)(v59 + 32) = 0x6C65694661746164;
    *(_QWORD *)(v59 + 40) = 0xE900000000000064;
    *(_QWORD *)(v59 + 48) = 1635017060;
    *(_QWORD *)(v59 + 56) = 0xE400000000000000;
    v65 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v59 + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v59 + 80) = 0x6C656946656D6974;
    *(_QWORD *)(v59 + 88) = 0xE900000000000064;
    *(_QWORD *)(v59 + 96) = 0x6D617473656D6974;
    *(_QWORD *)(v59 + 104) = 0xE900000000000070;
    *(_QWORD *)(v59 + 120) = v65;
    *(_QWORD *)(v59 + 128) = 0xD000000000000011;
    *(_QWORD *)(v59 + 136) = 0x8000000222C39F90;
    *(_QWORD *)(v59 + 168) = sub_222C2DFE8(0, &qword_255771AF8);
    v61 = v118;
    *(_QWORD *)(v59 + 144) = v118;
  }
  v66 = v61;
  v67 = sub_222C2E220(v59);
  v125[0] = &unk_24EB53180;
  v125[1] = v44;
  v125[2] = v107;
  v125[3] = v106;
  v125[4] = v105;
  v125[5] = v52;
  v125[6] = 0x747365545ALL;
  v125[7] = 0xE500000000000000;
  v125[8] = v67;
  sub_222C2FAC4(v104, v125, v120, (uint64_t)v124);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B30);
  v68 = v119;
  v69 = swift_dynamicCast();
  v70 = (void (*)(char *, uint64_t, uint64_t, int *))v110[7];
  if (!v69)
  {
    v42 = 1;
    v70(v31, 1, 1, v68);
    sub_222C280C8((uint64_t)v31, &qword_255771B40);
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v41 = 0xD000000000000020;
    v43 = "Failed to produce Z test results";
    goto LABEL_37;
  }
  v70(v31, 0, 1, v68);
  v71 = v117;
  sub_222C32054((uint64_t)v31, v117, type metadata accessor for ZTestResult);
  v72 = *(unsigned __int8 *)(v71 + 17);
  v73 = v109;
  result = sub_222C2E020(v71, (uint64_t)v109, type metadata accessor for ZTestResult);
  if (v72 == 2)
  {
    sub_222C32098((uint64_t)v73, type metadata accessor for ZTestResult);
    goto LABEL_34;
  }
  v78 = v73[17];
  if (v78 == 2)
  {
    __break(1u);
    goto LABEL_66;
  }
  if ((v78 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_222C32098((uint64_t)v109, type metadata accessor for ZTestResult);
LABEL_47:
    v82 = testError;
    goto LABEL_50;
  }
  v81 = sub_222C38B24();
  swift_bridgeObjectRelease();
  sub_222C32098((uint64_t)v109, type metadata accessor for ZTestResult);
  if ((v81 & 1) != 0)
    goto LABEL_47;
LABEL_34:
  v75 = *(unsigned __int8 *)(v71 + 17);
  v76 = v108;
  result = sub_222C2E020(v71, v108, type metadata accessor for ZTestResult);
  if (v75 == 2)
  {
    sub_222C32098(v76, type metadata accessor for ZTestResult);
    v77 = 0;
LABEL_51:
    v84 = v115;
    v85 = *(unsigned __int8 *)(v71 + 16);
    LODWORD(v118) = v85;
    if (v85 == 1)
    {
      sub_222C32EA0(v71 + v68[12], v121, &qword_2557717E8);
      sub_222C32EA0(v71 + v68[13], v122, &qword_2557717E8);
      sub_222C32EA0(v71 + v68[16], v123, &qword_2557717E8);
      v86 = v71 + v68[7];
    }
    else
    {
      v87 = sub_222C38968();
      v88 = v84;
      v89 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56);
      v89(v121, 1, 1, v87);
      v89(v122, 1, 1, v87);
      v89(v123, 1, 1, v87);
      v84 = v88;
      v86 = v120;
    }
    sub_222C32EA0(v86, v84, &qword_2557717E8);
    if (*(uint64_t *)(v71 + v68[14]) < 1)
    {
      v91 = 0;
      v90 = 0;
    }
    else
    {
      v90 = *(_QWORD *)(v71 + v68[11]);
      v91 = *(_QWORD *)(v71 + v68[10]);
    }
    v92 = *(_BYTE *)(v71 + v68[8] + 8);
    v120 = *(_QWORD *)(v71 + v68[14]);
    v115 = v91;
    *(_QWORD *)&v116 = v90;
    if ((v92 & 1) != 0)
      v110 = 0;
    else
      v110 = (_QWORD *)sub_222C38A10();
    if (*(_BYTE *)(v71 + v68[9]) == 2)
      v109 = 0;
    else
      v109 = (unsigned __int8 *)sub_222C38A04();
    v93 = v111;
    sub_222C32EA0(v121, v111, &qword_2557717E8);
    v94 = v113;
    sub_222C32EA0(v122, v113, &qword_2557717E8);
    v95 = *(_QWORD *)(v71 + v68[15]);
    v96 = v112;
    sub_222C32EA0(v123, v112, &qword_2557717E8);
    v97 = v84;
    v98 = v84;
    v99 = v114;
    sub_222C32EA0(v97, v114, &qword_2557717E8);
    objc_allocWithZone((Class)TwoSampleTestResult);
    v119 = v77;
    v100 = sub_222C320D4((char)v118, v77, v110, v109, v115, v116, v93, v94, v120, v95, v96, v99);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771B38);
    v101 = swift_allocObject();
    *(_OWORD *)(v101 + 16) = xmmword_222C39630;
    *(_QWORD *)(v101 + 32) = v100;
    v124[0] = v101;
    sub_222C389EC();
    v42 = v124[0];

    sub_222C280C8(v98, &qword_2557717E8);
    sub_222C280C8(v123, &qword_2557717E8);
    sub_222C280C8(v122, &qword_2557717E8);
    sub_222C280C8(v121, &qword_2557717E8);
    sub_222C32098(v117, type metadata accessor for ZTestResult);
    return v42;
  }
  v79 = *(unsigned __int8 *)(v76 + 17);
  if (v79 != 2)
  {
    if ((v79 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_222C32098(v108, type metadata accessor for ZTestResult);
    }
    else
    {
      v80 = sub_222C38B24();
      swift_bridgeObjectRelease();
      sub_222C32098(v108, type metadata accessor for ZTestResult);
      if ((v80 & 1) == 0)
      {
        v77 = 0;
        goto LABEL_51;
      }
    }
    v82 = &smallSampleSize;
LABEL_50:
    v77 = *v82;
    v83 = *v82;
    goto LABEL_51;
  }
LABEL_66:
  __break(1u);
  return result;
}

id Timeseries.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id Timeseries.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Timeseries();
  return objc_msgSendSuper2(&v2, sel_init);
}

id Timeseries.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Timeseries();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_222C31F2C(char a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  void *v18;
  id v19;
  void *v21;

  v14 = sub_222C38968();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  v17 = 0;
  if (v16(a7, 1, v14) != 1)
  {
    v17 = (void *)sub_222C3892C();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a7, v14);
  }
  if (v16(a8, 1, v14) == 1)
  {
    v18 = 0;
  }
  else
  {
    v18 = (void *)sub_222C3892C();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a8, v14);
  }
  v19 = objc_msgSend(v21, sel_initWithTestRan_testSkippedReason_pValue_rejectNullHypothesis_sampleSize_numSuccesses_minTimestamp_maxTimestamp_, a1 & 1, a2, a3, a4, a5, a6, v17, v18);

  return v19;
}

uint64_t sub_222C32054(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_222C32098(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_222C320D4(char a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v24;

  v14 = sub_222C38968();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  v17 = 0;
  if (v16(a7, 1, v14) != 1)
  {
    v17 = (void *)sub_222C3892C();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a7, v14);
  }
  if (v16(a8, 1, v14) == 1)
  {
    v18 = 0;
  }
  else
  {
    v18 = (void *)sub_222C3892C();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a8, v14);
  }
  if (v16(a11, 1, v14) == 1)
  {
    v19 = 0;
  }
  else
  {
    v19 = (void *)sub_222C3892C();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a11, v14);
  }
  if (v16(a12, 1, v14) == 1)
  {
    v20 = 0;
  }
  else
  {
    v20 = (void *)sub_222C3892C();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a12, v14);
  }
  v21 = objc_msgSend(v24, sel_initWithTestRan_testSkippedReason_testStatistic_rejectNullHypothesis_sampleSize1_numSuccesses1_minTimestamp1_maxTimestamp1_sampleSize2_numSuccesses2_minTimestamp2_maxTimestamp2_, a1 & 1, a2, a3, a4, a5, a6, v17, v18, a9, a10, v19, v20);

  return v21;
}

uint64_t type metadata accessor for Timeseries()
{
  return objc_opt_self();
}

char *sub_222C322B8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_222C3237C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_222C322D4(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_222C3258C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_222C322F0(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_222C326AC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_222C3230C(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_222C327CC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_222C32328(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_222C328EC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

char *sub_222C32344(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_222C32A60(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_222C32360(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_222C32494(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_222C3237C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771B20);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_222C32494(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771708);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

_QWORD *sub_222C3258C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771728);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771720);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_222C326AC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771718);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557716E0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_222C327CC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771B90);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_222C328EC(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771B98);
  v10 = *(_QWORD *)(sub_222C38968() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_222C38968() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_222C32A60(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771B88);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

_QWORD *sub_222C32B58(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!v2)
      return (_QWORD *)v3;
    v15 = MEMORY[0x24BEE4AF8];
    result = sub_222C322F0(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v15;
    v14 = v1 & 0xC000000000000001;
    v6 = v1;
    while (v2 != v5)
    {
      if (v14)
        v7 = (id)MEMORY[0x22767AC88](v5, v1);
      else
        v7 = *(id *)(v1 + 8 * v5 + 32);
      v8 = v7;
      v9 = (void *)sub_222C389D4();
      v10 = objc_msgSend(v8, sel_dictionaryWithValuesForKeys_, v9);

      v11 = sub_222C3898C();
      v13 = *(_QWORD *)(v15 + 16);
      v12 = *(_QWORD *)(v15 + 24);
      if (v13 >= v12 >> 1)
        sub_222C322F0((_QWORD *)(v12 > 1), v13 + 1, 1);
      ++v5;
      *(_QWORD *)(v15 + 16) = v13 + 1;
      *(_QWORD *)(v15 + 8 * v13 + 32) = v11;
      v1 = v6;
      if (v2 == v5)
        return (_QWORD *)v3;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v2 = sub_222C38ADC();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_222C32D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255771B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_222C32D64(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_222C32D8C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_222C32DB4(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_222C32DCC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  double *i;
  double v5;
  double v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771BA0);
    v3 = (_QWORD *)sub_222C38B00();
    for (i = (double *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_222C258B0(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = 8 * result;
      *(double *)(v3[6] + v9) = v5;
      *(double *)(v3[7] + v9) = v6;
      v10 = v3[2];
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (v11)
        goto LABEL_10;
      v3[2] = v12;
      if (!--v1)
        return (unint64_t)v3;
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

uint64_t sub_222C32EA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_222C32EE4(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t Normal.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Normal.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Normal()
{
  return objc_opt_self();
}

void sub_222C32F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, unsigned __int8 a7, double a8)
{
  double v8;
  uint64_t v9;
  const char *v10;
  char v11;
  const char *v12;
  unint64_t v13;
  char v15;
  char v16;

  if (a1 < 0 || a2 < a1)
  {
    sub_222C23F24();
    swift_allocError();
    v11 = 0;
    *(_QWORD *)v9 = 0xD00000000000001BLL;
    v12 = "k1 must be in range [1, n1]";
LABEL_17:
    v13 = (unint64_t)(v12 - 32) | 0x8000000000000000;
LABEL_18:
    *(_QWORD *)(v9 + 8) = v13;
    *(_BYTE *)(v9 + 16) = v11;
    swift_willThrow();
    return;
  }
  if (a3 < 0 || a4 < a3)
  {
    sub_222C23F24();
    swift_allocError();
    v11 = 0;
    *(_QWORD *)v9 = 0xD00000000000001BLL;
    v12 = "k2 must be in range [1, n2]";
    goto LABEL_17;
  }
  v8 = a8;
  if (a8 >= 1.0 || a8 <= 0.0)
  {
    sub_222C23F24();
    swift_allocError();
    v11 = 0;
    *(_QWORD *)v9 = 0xD00000000000002ELL;
    v12 = "significance_level must be in range (0.0, 1.0)";
    goto LABEL_17;
  }
  if (a2 <= 0)
  {
    sub_222C23F24();
    swift_allocError();
    v11 = 0;
    *(_QWORD *)v9 = 0xD00000000000001FLL;
    v12 = "n1 must be in range (1, maxInt]";
    goto LABEL_17;
  }
  if (a4 <= 0)
  {
    sub_222C23F24();
    swift_allocError();
    v11 = 0;
    *(_QWORD *)v9 = 0xD00000000000001FLL;
    v12 = "n2 must be in range (1, maxInt]";
    goto LABEL_17;
  }
  if ((a5 & 1) == 0)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v9 = 0xD000000000000027;
    v10 = "Unpooled z test is not implemented yet.";
    goto LABEL_20;
  }
  if ((a6 & 1) != 0)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v9 = 0xD00000000000002DLL;
    v10 = "Continuity correction is not implemented yet.";
LABEL_20:
    v13 = (unint64_t)(v10 - 32) | 0x8000000000000000;
    v11 = 2;
    goto LABEL_18;
  }
  if (a7 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = sub_222C38B24();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      if (a7 > 1u)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v16 = sub_222C38B24();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0)
        {
          v8 = v8 * 0.5;
          goto LABEL_29;
        }
      }
      v8 = 1.0 - v8;
    }
  }
LABEL_29:
  sub_222C24018(v8);
}

uint64_t runPreprocessingSteps(_:steps:lastRun:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v5;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v5 = (uint64_t *)result;
    swift_bridgeObjectRetain();
    for (i = (uint64_t *)(a2 + 48); ; i += 3)
    {
      v7 = *(i - 1);
      v8 = *i;
      v9 = *(i - 2);
      swift_bridgeObjectRetain();
      v10 = swift_bridgeObjectRetain();
      v11 = (void *)MEMORY[0x22767ADF0](v10);
      sub_222C33468(v9, v7, v8, v5);
      if (v2)
        break;
      objc_autoreleasePoolPop(v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v3)
        return swift_bridgeObjectRelease();
    }
    objc_autoreleasePoolPop(v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_222C33468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  const char *v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  void (*v31)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[4];

  v6 = a1 == 0x6148657275736E65 && a2 == 0xEF73646C65694673;
  if (!v6 && (sub_222C38B24() & 1) == 0)
  {
    if (a1 == 0xD000000000000012 && a2 == 0x8000000222C39F70 || (sub_222C38B24() & 1) != 0)
    {
      if (*(_QWORD *)(a3 + 16))
      {
        v14 = sub_222C2584C(0x646C656966, 0xE500000000000000);
        if ((v15 & 1) != 0)
        {
          sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v14, (uint64_t)v57);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v16 = swift_bridgeObjectRetain();
            sub_222C34124(v16, v55, v56);
            goto LABEL_10;
          }
        }
      }
      sub_222C23F24();
      swift_allocError();
      v17 = "EnsureIsSortedDate expects arguments: (field)";
      v18 = 0xD00000000000002DLL;
      goto LABEL_87;
    }
    if (a1 == 0x6C694E746F6ELL && a2 == 0xE600000000000000 || (sub_222C38B24() & 1) != 0)
    {
      if (*(_QWORD *)(a3 + 16))
      {
        v19 = sub_222C2584C(0x6569467475706E69, 0xEA0000000000646CLL);
        if ((v20 & 1) != 0)
        {
          sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v19, (uint64_t)v57);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v22 = v55;
            v21 = v56;
            if (!*(_QWORD *)(a3 + 16)
              || (v23 = sub_222C2584C(0x694674757074756FLL, 0xEB00000000646C65), (v24 & 1) == 0))
            {
              v25 = 0;
              v26 = 0;
              goto LABEL_42;
            }
            sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v23, (uint64_t)v57);
            if (swift_dynamicCast())
            {
              v25 = v55;
              v26 = v56;
LABEL_42:
              v31 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_222C34D88;
LABEL_69:
              sub_222C34618((uint64_t)a4, v22, v21, v25, v26, v31);
              goto LABEL_10;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      sub_222C23F24();
      swift_allocError();
      v17 = "NotNil expects arguments: (inputField, outputField?)";
      v18 = 0xD000000000000034;
LABEL_87:
      *(_QWORD *)v13 = v18;
      *(_QWORD *)(v13 + 8) = (unint64_t)(v17 - 32) | 0x8000000000000000;
      goto LABEL_88;
    }
    if (a1 == 0x754E6F5465746164 && a2 == 0xED0000636972656DLL || (sub_222C38B24() & 1) != 0)
    {
      if (*(_QWORD *)(a3 + 16))
      {
        v27 = sub_222C2584C(0x6569467475706E69, 0xEA0000000000646CLL);
        if ((v28 & 1) != 0)
        {
          sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v27, (uint64_t)v57);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v22 = v55;
            v21 = v56;
            if (!*(_QWORD *)(a3 + 16)
              || (v29 = sub_222C2584C(0x694674757074756FLL, 0xEB00000000646C65), (v30 & 1) == 0))
            {
              v25 = 0;
              v26 = 0;
              goto LABEL_54;
            }
            sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v29, (uint64_t)v57);
            if (swift_dynamicCast())
            {
              v25 = v55;
              v26 = v56;
LABEL_54:
              v31 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_222C34A54;
              goto LABEL_69;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      sub_222C23F24();
      swift_allocError();
      v17 = "DateToNumeric expects arguments: (inputField, outputField?)";
LABEL_86:
      v18 = 0xD00000000000003BLL;
      goto LABEL_87;
    }
    if (a1 == 0x54636972656D756ELL && a2 == 0xED0000657461446FLL || (sub_222C38B24() & 1) != 0)
    {
      if (*(_QWORD *)(a3 + 16))
      {
        v32 = sub_222C2584C(0x6569467475706E69, 0xEA0000000000646CLL);
        if ((v33 & 1) != 0)
        {
          sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v32, (uint64_t)v57);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v22 = v55;
            v21 = v56;
            if (!*(_QWORD *)(a3 + 16)
              || (v34 = sub_222C2584C(0x694674757074756FLL, 0xEB00000000646C65), (v35 & 1) == 0))
            {
              v25 = 0;
              v26 = 0;
              goto LABEL_68;
            }
            sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v34, (uint64_t)v57);
            if (swift_dynamicCast())
            {
              v25 = v55;
              v26 = v56;
LABEL_68:
              v31 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_222C347E0;
              goto LABEL_69;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      sub_222C23F24();
      swift_allocError();
      v17 = "NumericToDate expects arguments: (inputField, outputField?)";
      goto LABEL_86;
    }
    if (a1 == 0xD000000000000011 && a2 == 0x8000000222C3A2A0 || (sub_222C38B24() & 1) != 0)
    {
      if (*(_QWORD *)(a3 + 16))
      {
        v36 = sub_222C2584C(0x6569467475706E69, 0xEA0000000000646CLL);
        if ((v37 & 1) != 0)
        {
          sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v36, (uint64_t)v57);
          if ((swift_dynamicCast() & 1) != 0)
          {
            if (!*(_QWORD *)(a3 + 16)
              || (v38 = sub_222C2584C(0x694674757074756FLL, 0xEB00000000646C65), (v39 & 1) == 0))
            {
              v40 = 0;
              v41 = 0;
              goto LABEL_83;
            }
            sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v38, (uint64_t)v57);
            if (swift_dynamicCast())
            {
              v40 = v55;
              v41 = v56;
LABEL_83:
              sub_222C346D4(a4, v55, v56, v40, v41);
              goto LABEL_10;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      sub_222C23F24();
      swift_allocError();
      v17 = "ComputeDifference expects arguments: (inputField, outputField?)";
      v18 = 0xD00000000000003FLL;
      goto LABEL_87;
    }
    if ((a1 != 0x73726946706F7264 || a2 != 0xE900000000000074) && (sub_222C38B24() & 1) == 0)
    {
      sub_222C38A64();
      swift_bridgeObjectRelease();
      v57[0] = 0xD00000000000001CLL;
      v57[1] = 0x8000000222C3A2C0;
      swift_bridgeObjectRetain();
      sub_222C389C8();
      swift_bridgeObjectRelease();
      sub_222C23F24();
      swift_allocError();
      *(_QWORD *)v13 = 0xD00000000000001CLL;
      *(_QWORD *)(v13 + 8) = 0x8000000222C3A2C0;
      goto LABEL_88;
    }
    if (!*(_QWORD *)(a3 + 16)
      || (v42 = sub_222C2584C(0x73706F72446D756ELL, 0xE800000000000000), (v43 & 1) == 0)
      || (sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v42, (uint64_t)v57), (swift_dynamicCast() & 1) == 0))
    {
      sub_222C23F24();
      swift_allocError();
      v17 = "DropFirst expects arguments: (numDrops)";
      v18 = 0xD000000000000027;
      goto LABEL_87;
    }
    v44 = sub_222C347A0(v55, *a4);
    v46 = v45;
    v48 = v47;
    v50 = v49;
    if ((v49 & 1) != 0)
    {
      sub_222C38B30();
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      v53 = swift_dynamicCastClass();
      if (!v53)
      {
        swift_unknownObjectRelease();
        v53 = MEMORY[0x24BEE4AF8];
      }
      v54 = *(_QWORD *)(v53 + 16);
      swift_release();
      if (__OFSUB__(v50 >> 1, v48))
      {
        __break(1u);
      }
      else if (v54 == (v50 >> 1) - v48)
      {
        v52 = swift_dynamicCastClass();
        if (!v52)
        {
          swift_unknownObjectRelease();
          v52 = MEMORY[0x24BEE4AF8];
        }
        goto LABEL_98;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    sub_222C243F4(v44, v46, v48, v50);
    v52 = v51;
LABEL_98:
    swift_unknownObjectRelease();
    *a4 = v52;
    return swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(a3 + 16))
  {
    v9 = sub_222C2584C(0x73646C656966, 0xE600000000000000);
    if ((v10 & 1) != 0)
    {
      sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v9, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2557716F0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v11 = swift_bridgeObjectRetain();
        sub_222C33F14(v11, v55);
LABEL_10:
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
    }
  }
  sub_222C23F24();
  swift_allocError();
  *(_QWORD *)v13 = 0xD00000000000002BLL;
  *(_QWORD *)(v13 + 8) = 0x8000000222C3A440;
LABEL_88:
  *(_BYTE *)(v13 + 16) = 0;
  return swift_willThrow();
}

uint64_t sub_222C33F14(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v4 = *(_QWORD *)(a2 + 16);
    v5 = result + 32;
    swift_bridgeObjectRetain();
    v6 = 0;
    v7 = (uint64_t *)(a2 + 40);
    v19 = v2;
    v15 = v5;
    v16 = v4;
    while (!v4)
    {
LABEL_3:
      if (++v6 == v2)
        return swift_bridgeObjectRelease();
    }
    v8 = *(_QWORD *)(v5 + 8 * v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    while (1)
    {
      v10 = *(v7 - 1);
      v9 = *v7;
      if (!*(_QWORD *)(v8 + 16))
        break;
      swift_bridgeObjectRetain_n();
      v11 = sub_222C2584C(v10, v9);
      if ((v12 & 1) != 0)
      {
        sub_222C23EA8(*(_QWORD *)(v8 + 56) + 32 * v11, (uint64_t)&v17);
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v18 + 1))
        goto LABEL_14;
      v7 += 2;
      swift_bridgeObjectRelease();
      sub_222C280C8((uint64_t)&v17, &qword_255771700);
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v2 = v19;
        v5 = v15;
        v4 = v16;
        v7 = (uint64_t *)(a2 + 40);
        goto LABEL_3;
      }
    }
    v17 = 0u;
    v18 = 0u;
    swift_bridgeObjectRetain();
LABEL_14:
    swift_bridgeObjectRelease();
    sub_222C280C8((uint64_t)&v17, &qword_255771700);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v17 = 0;
    *((_QWORD *)&v17 + 1) = 0xE000000000000000;
    sub_222C38A64();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v17 = 0xD000000000000028;
    *((_QWORD *)&v17 + 1) = 0x8000000222C3A470;
    sub_222C389C8();
    swift_bridgeObjectRelease();
    v13 = v17;
    sub_222C23F24();
    swift_allocError();
    *(_OWORD *)v14 = v13;
    *(_BYTE *)(v14 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_222C34124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  _QWORD v37[2];
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);

  v40 = a2;
  v6 = sub_222C38968();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v39 = (char *)v37 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v44 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v37 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v37 - v18;
  v45 = v7;
  v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v48((char *)v37 - v18, 1, 1, v6);
  v42 = *(_QWORD *)(a1 + 16);
  if (v42)
  {
    v37[1] = v3;
    v38 = v10;
    v20 = swift_bridgeObjectRetain();
    v21 = 0;
    v22 = v39;
    v43 = v20;
    v41 = a3;
    v23 = (uint64_t)v44;
    while (1)
    {
      v25 = *(_QWORD *)(v20 + 8 * v21 + 32);
      if (*(_QWORD *)(v25 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v26 = sub_222C2584C(v40, a3);
        if ((v27 & 1) != 0)
        {
          sub_222C23EA8(*(_QWORD *)(v25 + 56) + 32 * v26, (uint64_t)&v46);
        }
        else
        {
          v46 = 0u;
          v47 = 0u;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v46 = 0u;
        v47 = 0u;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
      if (!swift_dynamicCast())
      {
        v48(v17, 1, 1, v6);
        swift_bridgeObjectRelease();
        sub_222C280C8((uint64_t)v17, &qword_2557717E8);
        *(_QWORD *)&v46 = 0;
        *((_QWORD *)&v46 + 1) = 0xE000000000000000;
        sub_222C38A64();
        sub_222C389C8();
        sub_222C389C8();
        sub_222C389C8();
        sub_222C389C8();
        v31 = v46;
        sub_222C23F24();
        swift_allocError();
        *(_OWORD *)v32 = v31;
        *(_BYTE *)(v32 + 16) = 1;
        swift_willThrow();
        return sub_222C280C8((uint64_t)v19, &qword_2557717E8);
      }
      v48(v17, 0, 1, v6);
      v28 = v45;
      v29 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
      v29(v22, v17, v6);
      sub_222C32EA0((uint64_t)v19, v23, &qword_2557717E8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v23, 1, v6) == 1)
      {
        sub_222C280C8((uint64_t)v19, &qword_2557717E8);
        v24 = v23;
      }
      else
      {
        v30 = v38;
        v29(v38, (char *)v23, v6);
        sub_222C28104();
        if ((sub_222C38998() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          *(_QWORD *)&v46 = 0;
          *((_QWORD *)&v46 + 1) = 0xE000000000000000;
          sub_222C38A64();
          swift_bridgeObjectRelease();
          *(_QWORD *)&v46 = 0x6569662065746144;
          *((_QWORD *)&v46 + 1) = 0xEB0000000020646CLL;
          sub_222C389C8();
          sub_222C389C8();
          v33 = v46;
          sub_222C23F24();
          swift_allocError();
          *(_OWORD *)v34 = v33;
          *(_BYTE *)(v34 + 16) = 1;
          swift_willThrow();
          v35 = *(void (**)(char *, uint64_t))(v45 + 8);
          v35(v30, v6);
          v35(v39, v6);
          return sub_222C280C8((uint64_t)v19, &qword_2557717E8);
        }
        (*(void (**)(char *, uint64_t))(v45 + 8))(v30, v6);
        v24 = (uint64_t)v19;
        v22 = v39;
      }
      ++v21;
      sub_222C280C8(v24, &qword_2557717E8);
      v29(v19, v22, v6);
      v48(v19, 0, 1, v6);
      a3 = v41;
      v20 = v43;
      if (v42 == v21)
      {
        swift_bridgeObjectRelease();
        return sub_222C280C8((uint64_t)v19, &qword_2557717E8);
      }
    }
  }
  return sub_222C280C8((uint64_t)v19, &qword_2557717E8);
}

void sub_222C34618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  void *v14;

  v7 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v7)
  {
    v13 = 0;
    while (1)
    {
      v14 = (void *)MEMORY[0x22767ADF0]();
      a6(a1, v13, a2, a3, a4, a5);
      if (v6)
        break;
      ++v13;
      objc_autoreleasePoolPop(v14);
      if (v7 == v13)
        return;
    }
    objc_autoreleasePoolPop(v14);
  }
}

void sub_222C346D4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;

  v14 = 0;
  v15 = 1;
  v6 = *(_QWORD *)(*a1 + 16);
  if (v6)
  {
    v12 = 0;
    while (1)
    {
      v13 = (void *)MEMORY[0x22767ADF0](a1, a2);
      sub_222C35048(a1, v12, a2, a3, (uint64_t)&v14, a4, a5);
      if (v5)
        break;
      ++v12;
      objc_autoreleasePoolPop(v13);
      if (v6 == v12)
        return;
    }
    objc_autoreleasePoolPop(v13);
  }
}

uint64_t sub_222C347A0(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v2 >= result)
      v3 = result;
    else
      v3 = *(_QWORD *)(a2 + 16);
    if (result)
      v4 = v3;
    else
      v4 = 0;
    if (v2 >= v4)
      return a2;
  }
  __break(1u);
  return result;
}

uint64_t sub_222C347E0(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t result;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  v7 = a2;
  v8 = a1;
  if (*(_QWORD *)(*a1 + 16) <= a2)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    result = (uint64_t)sub_222C352F4(v9);
    v9 = (_QWORD *)result;
    *v8 = result;
    goto LABEL_13;
  }
  v6 = a5;
  v14 = *(_QWORD *)(*a1 + 8 * a2 + 32);
  if (*(_QWORD *)(v14 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = sub_222C2584C(a3, a4);
    if ((v16 & 1) != 0)
    {
      sub_222C23EA8(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)&v20);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
  if (!swift_dynamicCast())
  {
    *(_QWORD *)&v20 = 0;
    *((_QWORD *)&v20 + 1) = 0xE000000000000000;
    sub_222C38A64();
    sub_222C389C8();
    sub_222C389C8();
    sub_222C389C8();
    sub_222C389C8();
    v18 = v20;
    sub_222C23F24();
    swift_allocError();
    *(_OWORD *)v19 = v18;
    *(_BYTE *)(v19 + 16) = 1;
    return swift_willThrow();
  }
  v10 = a6;
  if (!a6)
  {
    swift_bridgeObjectRetain();
    v6 = a3;
    v10 = a4;
  }
  *((_QWORD *)&v21 + 1) = sub_222C38968();
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v20);
  swift_bridgeObjectRetain();
  sub_222C38914();
  v9 = (_QWORD *)*v8;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v8 = (uint64_t)v9;
  if ((result & 1) == 0)
    goto LABEL_18;
LABEL_13:
  if (v9[2] > v7)
    return sub_222C34F78((uint64_t)&v20, v6, v10);
  __break(1u);
  return result;
}

uint64_t sub_222C34A54(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6)
{
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  int v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t result;
  __int128 v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v26 = a6;
  v27 = a5;
  v30 = a3;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_222C38968();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)a1 + 16) > a2)
  {
    v17 = *(_QWORD *)(*(_QWORD *)a1 + 8 * a2 + 32);
    if (*(_QWORD *)(v17 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v18 = sub_222C2584C(v30, a4);
      if ((v19 & 1) != 0)
      {
        sub_222C23EA8(*(_QWORD *)(v17 + 56) + 32 * v18, (uint64_t)&v28);
      }
      else
      {
        v28 = 0u;
        v29 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
    v20 = swift_dynamicCast();
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    if (v20)
    {
      v21(v12, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
        v12 = v26;
        if (!v26)
        {
          swift_bridgeObjectRetain();
          v27 = v30;
          v12 = (char *)a4;
        }
        *((_QWORD *)&v29 + 1) = MEMORY[0x24BEE13C8];
        swift_bridgeObjectRetain();
        sub_222C38920();
        *(_QWORD *)&v28 = v22;
        v6 = *(_QWORD **)a1;
        result = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)a1 = v6;
        if ((result & 1) != 0)
          goto LABEL_14;
        goto LABEL_20;
      }
    }
    else
    {
      v21(v12, 1, 1, v13);
    }
    sub_222C280C8((uint64_t)v12, &qword_2557717E8);
    *(_QWORD *)&v28 = 0;
    *((_QWORD *)&v28 + 1) = 0xE000000000000000;
    sub_222C38A64();
    sub_222C389C8();
    sub_222C389C8();
    sub_222C389C8();
    sub_222C389C8();
    v24 = v28;
    sub_222C23F24();
    swift_allocError();
    *(_OWORD *)v25 = v24;
    *(_BYTE *)(v25 + 16) = 1;
    return swift_willThrow();
  }
  __break(1u);
LABEL_20:
  result = (uint64_t)sub_222C352F4(v6);
  v6 = (_QWORD *)result;
  *(_QWORD *)a1 = result;
LABEL_14:
  if (v6[2] <= a2)
  {
    __break(1u);
  }
  else
  {
    sub_222C34F78((uint64_t)&v28, v27, (uint64_t)v12);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  return result;
}

uint64_t sub_222C34D88(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t result;
  void *v18;
  _BYTE v19[24];
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[32];

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v9 = a2;
    v10 = a1;
    if (*(_QWORD *)(*a1 + 16) > a2)
    {
      v8 = a5;
      v7 = a4;
      v13 = *(_QWORD *)(*a1 + 8 * a2 + 32);
      if (*(_QWORD *)(v13 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v14 = sub_222C2584C(a3, v7);
        if ((v15 & 1) != 0)
        {
          sub_222C23EA8(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v21);
        }
        else
        {
          v21 = 0u;
          v22 = 0u;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v21 = 0u;
        v22 = 0u;
      }
      sub_222C35668((uint64_t)&v21, (uint64_t)v23);
      if (a6)
      {
        v7 = a6;
      }
      else
      {
        swift_bridgeObjectRetain();
        v8 = a3;
      }
      *((_QWORD *)&v22 + 1) = MEMORY[0x24BEE1768];
      sub_222C32EA0((uint64_t)v23, (uint64_t)v19, &qword_255771700);
      if (v20)
      {
        sub_222C356B0();
        swift_bridgeObjectRetain();
        if ((swift_dynamicCast() & 1) != 0)
        {

          v16 = 1;
          goto LABEL_17;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_222C280C8((uint64_t)v19, &qword_255771700);
      }
      v16 = 0;
LABEL_17:
      *(_QWORD *)&v21 = v16;
      v6 = (_QWORD *)*v10;
      result = swift_isUniquelyReferenced_nonNull_native();
      *v10 = (uint64_t)v6;
      if ((result & 1) != 0)
        goto LABEL_18;
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_22:
  result = (uint64_t)sub_222C352F4(v6);
  v6 = (_QWORD *)result;
  *v10 = result;
LABEL_18:
  if (v6[2] <= v9)
  {
    __break(1u);
  }
  else
  {
    sub_222C34F78((uint64_t)&v21, v8, v7);
    return sub_222C280C8((uint64_t)v23, &qword_255771700);
  }
  return result;
}

uint64_t sub_222C34F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_222C2E0D0((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_222C359AC(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_222C280C8(a1, &qword_255771700);
    sub_222C356EC(a2, a3, v9);
    sub_222C280C8((uint64_t)v9, &qword_255771700);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_222C35048(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t *v11;
  double v12;
  uint64_t v13;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t result;
  double v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  v10 = a2;
  v11 = a1;
  v13 = *a1;
  if (*(_QWORD *)(*a1 + 16) <= a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    result = (uint64_t)sub_222C352F4(v9);
    v9 = (_QWORD *)result;
    *v11 = result;
    goto LABEL_14;
  }
  v8 = a5;
  v29 = a7;
  v17 = *(_QWORD *)(v13 + 8 * a2 + 32);
  if (*(_QWORD *)(v17 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18 = sub_222C2584C(a3, a4);
    if ((v19 & 1) != 0)
    {
      sub_222C23EA8(*(_QWORD *)(v17 + 56) + 32 * v18, (uint64_t)&v27);
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
  v20 = MEMORY[0x24BEE13C8];
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *(_QWORD *)&v27 = 0;
    *((_QWORD *)&v27 + 1) = 0xE000000000000000;
    sub_222C38A64();
    sub_222C389C8();
    sub_222C389C8();
    sub_222C389C8();
    sub_222C389C8();
    v23 = v27;
    sub_222C23F24();
    swift_allocError();
    *(_OWORD *)v24 = v23;
    *(_BYTE *)(v24 + 16) = 1;
    return swift_willThrow();
  }
  v25 = a6;
  v12 = v26;
  if ((*(_BYTE *)(v8 + 8) & 1) != 0)
  {
LABEL_16:
    *(double *)v8 = v12;
    *(_BYTE *)(v8 + 8) = 0;
    return result;
  }
  v22 = *(double *)v8;
  v7 = v29;
  if (!v29)
  {
    swift_bridgeObjectRetain();
    v25 = a3;
    v7 = a4;
  }
  *((_QWORD *)&v28 + 1) = v20;
  *(double *)&v27 = v26 - v22;
  v9 = (_QWORD *)*v11;
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  *v11 = (uint64_t)v9;
  if ((result & 1) == 0)
    goto LABEL_20;
LABEL_14:
  if (v9[2] > v10)
  {
    result = sub_222C34F78((uint64_t)&v27, v25, v7);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

_QWORD *sub_222C352CC(_QWORD *a1)
{
  return sub_222C35308(0, a1[2], 0, a1);
}

_QWORD *sub_222C352E0(_QWORD *a1)
{
  return sub_222C35428(0, a1[2], 0, a1);
}

_QWORD *sub_222C352F4(_QWORD *a1)
{
  return sub_222C35548(0, a1[2], 0, a1);
}

_QWORD *sub_222C35308(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771728);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771720);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_222C35428(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557717F8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771C60);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_222C35548(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255771718);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557716E0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_222C35668(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255771700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_222C356B0()
{
  unint64_t result;

  result = qword_255771C58;
  if (!qword_255771C58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255771C58);
  }
  return result;
}

double sub_222C356EC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;
  _OWORD v14[2];

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_222C2584C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_222C2D768();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_222C2E0D0((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), v14);
    sub_222C357D8(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    sub_222C2E0D0(v14, a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_222C357D8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
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
    result = sub_222C38A58();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_222C38B90();
        swift_bridgeObjectRetain();
        sub_222C389BC();
        v10 = sub_222C38B9C();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
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

_OWORD *sub_222C359AC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_222C2584C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_222C2E0D0(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_222C2D768();
      goto LABEL_7;
    }
    sub_222C2DC58(v15, a4 & 1);
    v21 = sub_222C2584C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_222C35ADC(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_222C38B3C();
  __break(1u);
  return result;
}

_OWORD *sub_222C35ADC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_222C2E0D0(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

long double sub_222C35B44(double a1)
{
  double v1;
  long double v2;

  if (a1 <= 3.0)
    return sub_222C35BD8(a1);
  v1 = a1 + -1.0;
  v2 = v1 * log(a1 + -1.0) - v1;
  return v2 + 0.572364943 + log(v1 * (v1 * 4.0 * (v1 + v1 + 1.0) + 1.0) + 0.0333333333) * 0.166666667;
}

long double sub_222C35BD8(double a1)
{
  double v2;
  long double v3;

  v2 = 1.0
     + 0.0
     + 76.1800917 / (a1 + 1.0)
     + -86.5053203 / (a1 + 2.0)
     + 24.0140982 / (a1 + 3.0)
     + -1.23173957 / (a1 + 4.0)
     + 0.00120865097 / (a1 + 5.0)
     + -0.00000539523938 / (a1 + 6.0);
  v3 = (a1 + 0.5) * log(a1 + 5.5) - (a1 + 5.5) + 0.918938533;
  return v3 + log(v2 / a1);
}

uint64_t sub_222C35CB4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t result;
  uint64_t v32;
  char *v33;

  if (!*(_QWORD *)(a1 + 16) || !*(_QWORD *)(a2 + 16))
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v32 = 0xD000000000000022;
    *(_QWORD *)(v32 + 8) = 0x8000000222C3A7B0;
    *(_BYTE *)(v32 + 16) = 0;
    return swift_willThrow();
  }
  v33 = (char *)a1;
  swift_bridgeObjectRetain();
  sub_222C242A8(&v33);
  if (v3)
    goto LABEL_42;
  v6 = v33;
  v33 = (char *)a2;
  swift_bridgeObjectRetain();
  sub_222C242A8(&v33);
  v7 = *((_QWORD *)v6 + 2);
  if (!v7 || (v8 = *((_QWORD *)v33 + 2)) == 0)
  {
LABEL_37:
    swift_release();
    return swift_release();
  }
  v9 = 0;
  v10 = 0;
  v11 = v33 + 32;
  v12 = (double)v8;
  v13 = (double)v7;
  v14 = 0.0;
  while (v10 < (unint64_t)v7)
  {
    if (v9 >= (unint64_t)v8)
      goto LABEL_41;
    v15 = *(double *)&v6[8 * v10 + 32];
    v16 = *(double *)&v11[8 * v9];
    if (v16 >= v15)
      v17 = *(double *)&v6[8 * v10 + 32];
    else
      v17 = *(double *)&v11[8 * v9];
    if (v15 == v17)
    {
      v18 = v10;
      while (v7 - 1 != v18)
      {
        v10 = v18 + 1;
        v19 = *(double *)&v6[8 * v18++ + 40];
        if (v19 != v17)
          goto LABEL_16;
      }
      v20 = 0;
      if (v16 == v17)
      {
        v10 = *((_QWORD *)v6 + 2);
LABEL_20:
        if (v8 <= v9 + 1)
          v22 = v9 + 1;
        else
          v22 = *((_QWORD *)v33 + 2);
        do
        {
          v23 = v9 + 1;
          v21 = v9 + 1 < v8;
          if (v9 + 1 >= v8)
          {
            v9 = v22;
            goto LABEL_28;
          }
          v24 = *(double *)&v33[8 * v9++ + 40];
        }
        while (v24 == v17);
        v9 = v23;
        goto LABEL_28;
      }
      v21 = 1;
      v10 = *((_QWORD *)v6 + 2);
    }
    else
    {
LABEL_16:
      v20 = 1;
      if (v16 == v17)
        goto LABEL_20;
      v21 = 1;
    }
LABEL_28:
    v25 = (double)v10;
    v26 = (double)v9;
    if (a3)
    {
      v27 = v25 / v13;
      v28 = v26 / v12;
      v29 = v27 - v28;
      v30 = v28 - v27;
      if (a3 == 1)
        v30 = v29;
    }
    else
    {
      v30 = vabdd_f64(v25 / v13, v26 / v12);
    }
    if (v14 <= v30)
      v14 = v30;
    if (!v20 || !v21)
      goto LABEL_37;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_222C35EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  BOOL v9;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  char v36;
  uint64_t *v37;
  const char *v38;
  unint64_t v39;
  unint64_t v41;
  char v42;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  uint64_t v52;

  v9 = a1 == 0x6C61696D6F6E6942 && a2 == 0xEC00000074736554;
  if (!v9 && (sub_222C38B24() & 1) == 0)
  {
    if (a1 == 0x747365545ALL && a2 == 0xE500000000000000 || (sub_222C38B24() & 1) != 0)
    {
      if (!*(_QWORD *)(a3 + 16))
        goto LABEL_67;
      v18 = sub_222C2584C(0x6C65694661746164, 0xE900000000000064);
      if ((v19 & 1) == 0)
        goto LABEL_67;
      sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v18, (uint64_t)v51);
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_67;
      if (!*(_QWORD *)(a3 + 16)
        || (v20 = sub_222C2584C(0x6C656946656D6974, 0xE900000000000064), (v21 & 1) == 0)
        || (sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v20, (uint64_t)v51), (swift_dynamicCast() & 1) == 0))
      {
LABEL_66:
        swift_bridgeObjectRelease();
LABEL_67:
        sub_222C23F24();
        swift_allocError();
        v38 = "ZTest expects arguments: (dataField, timeField, minimumSampleSize?, significanceLevel)";
        v39 = 0xD000000000000056;
        goto LABEL_56;
      }
      if (*(_QWORD *)(a3 + 16))
      {
        v52 = v49;
        v22 = sub_222C2584C(0xD000000000000011, 0x8000000222C39AC0);
        v48 = v23;
        if ((v23 & 1) == 0)
        {
          v46 = 0;
          goto LABEL_59;
        }
        sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v22, (uint64_t)v51);
        if (swift_dynamicCast())
        {
          v46 = v49;
LABEL_59:
          if (*(_QWORD *)(a3 + 16))
          {
            v41 = sub_222C2584C(0xD000000000000011, 0x8000000222C39F90);
            if ((v42 & 1) != 0)
            {
              sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v41, (uint64_t)v51);
              if ((swift_dynamicCast() & 1) != 0)
              {
                a5[3] = type metadata accessor for ZTestResult(0);
                a5[4] = (uint64_t)&off_24EB53470;
                boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a5);
                sub_222C36F20(a4, v49, v50, v52, v50, v46, (v48 ^ 1) & 1, (uint64_t)boxed_opaque_existential_0, *(double *)&v49);
                if (v5)
                  __swift_deallocate_boxed_opaque_existential_1((uint64_t)a5);
                goto LABEL_71;
              }
            }
          }
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_66;
    }
    if ((a1 != 0x74736554534BLL || a2 != 0xE600000000000000) && (sub_222C38B24() & 1) == 0)
    {
      sub_222C38A64();
      swift_bridgeObjectRelease();
      strcpy((char *)v51, "Unknown test: ");
      HIBYTE(v51[1]) = -18;
      swift_bridgeObjectRetain();
      sub_222C389C8();
      swift_bridgeObjectRelease();
      v31 = v51[1];
      sub_222C23F24();
      swift_allocError();
      *(_QWORD *)v32 = v51[0];
      *(_QWORD *)(v32 + 8) = v31;
LABEL_57:
      *(_BYTE *)(v32 + 16) = 0;
      return swift_willThrow();
    }
    if (*(_QWORD *)(a3 + 16))
    {
      v24 = sub_222C2584C(0x6C65694661746164, 0xE900000000000064);
      if ((v25 & 1) != 0)
      {
        sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v24, (uint64_t)v51);
        if ((swift_dynamicCast() & 1) != 0)
        {
          if (*(_QWORD *)(a3 + 16))
          {
            v26 = sub_222C2584C(0x6C656946656D6974, 0xE900000000000064);
            if ((v27 & 1) != 0)
            {
              sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v26, (uint64_t)v51);
              if ((swift_dynamicCast() & 1) != 0)
              {
                if (!*(_QWORD *)(a3 + 16)
                  || (v28 = sub_222C2584C(0xD000000000000011, 0x8000000222C39AC0), (v29 & 1) == 0))
                {
                  v30 = 1;
LABEL_69:
                  a5[3] = type metadata accessor for KSTestTwoSampleResult(0);
                  a5[4] = (uint64_t)&off_24EB534A0;
                  v44 = __swift_allocate_boxed_opaque_existential_0(a5);
                  sub_222C379AC(a4, v49, v50, v49, v50, v30, (uint64_t)v44);
                  if (v5)
                    __swift_deallocate_boxed_opaque_existential_1((uint64_t)a5);
                  goto LABEL_71;
                }
                sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v28, (uint64_t)v51);
                if (swift_dynamicCast())
                {
                  v30 = 0;
                  goto LABEL_69;
                }
                swift_bridgeObjectRelease();
              }
            }
          }
          swift_bridgeObjectRelease();
        }
      }
    }
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v32 = 0xD000000000000039;
    *(_QWORD *)(v32 + 8) = 0x8000000222C3A510;
    goto LABEL_57;
  }
  if (!*(_QWORD *)(a3 + 16))
    goto LABEL_55;
  v12 = sub_222C2584C(0x6C65694661746164, 0xE900000000000064);
  if ((v13 & 1) == 0)
    goto LABEL_55;
  sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v12, (uint64_t)v51);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_55;
  if (!*(_QWORD *)(a3 + 16)
    || (v14 = sub_222C2584C(0x6C656946656D6974, 0xE900000000000064), (v15 & 1) == 0)
    || (sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v14, (uint64_t)v51), (swift_dynamicCast() & 1) == 0))
  {
LABEL_54:
    swift_bridgeObjectRelease();
LABEL_55:
    sub_222C23F24();
    swift_allocError();
    v38 = "BinomialTest expects arguments: (dataField, timeField, minimumSampleSize?, significanceLevel, pHypothesis)";
    v39 = 0xD00000000000006ALL;
LABEL_56:
    *(_QWORD *)v32 = v39;
    *(_QWORD *)(v32 + 8) = (unint64_t)(v38 - 32) | 0x8000000000000000;
    goto LABEL_57;
  }
  if (!*(_QWORD *)(a3 + 16))
    goto LABEL_53;
  v52 = v49;
  v16 = sub_222C2584C(0xD000000000000011, 0x8000000222C39AC0);
  v47 = v17;
  if ((v17 & 1) == 0)
  {
    v45 = 0;
    goto LABEL_44;
  }
  sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v16, (uint64_t)v51);
  if (!swift_dynamicCast())
  {
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  v45 = v49;
LABEL_44:
  if (!*(_QWORD *)(a3 + 16))
    goto LABEL_53;
  v33 = sub_222C2584C(0xD000000000000011, 0x8000000222C39F90);
  if ((v34 & 1) == 0)
    goto LABEL_53;
  sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v33, (uint64_t)v51);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_53;
  if (!*(_QWORD *)(a3 + 16))
    goto LABEL_53;
  v35 = sub_222C2584C(0x6568746F70794870, 0xEB00000000736973);
  if ((v36 & 1) == 0)
    goto LABEL_53;
  sub_222C23EA8(*(_QWORD *)(a3 + 56) + 32 * v35, (uint64_t)v51);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_53;
  a5[3] = type metadata accessor for BinomialTestResult(0);
  a5[4] = (uint64_t)&off_24EB53440;
  v37 = __swift_allocate_boxed_opaque_existential_0(a5);
  sub_222C367C4(a4, v49, v50, v52, v50, v45, (v47 ^ 1) & 1, (char *)v37, *(double *)&v49, *(long double *)&v49);
  if (v5)
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)a5);
LABEL_71:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_222C367C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, char a7@<W7>, char *a8@<X8>, double a9@<D0>, long double a10@<D1>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  int *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(char *, uint64_t, uint64_t);
  uint64_t v67;
  _QWORD *v68;
  int *v69;
  double *v70;
  char *v71;
  void (*v72)(char *, char *, uint64_t);
  void (*v73)(char *, _QWORD, uint64_t, uint64_t);
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v11 = v10;
  v84 = a2;
  v85 = a3;
  v83 = a8;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v76 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v76 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v76 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  MEMORY[0x24BDAC7A8](v30);
  if ((a7 & 1) == 0 && a6 <= 0)
  {
    sub_222C23F24();
    swift_allocError();
    v36 = "minimumSampleSize should be in range (0, Int.max)";
    v37 = 0xD000000000000031;
LABEL_11:
    v43 = (char *)(v36 - 32);
LABEL_12:
    *(_QWORD *)v35 = v37;
    *(_QWORD *)(v35 + 8) = (unint64_t)v43 | 0x8000000000000000;
    *(_BYTE *)(v35 + 16) = 0;
    return swift_willThrow();
  }
  if (a9 < 0.0 || a9 > 1.0)
  {
    sub_222C23F24();
    swift_allocError();
    v36 = "significanceLevel was not within the range [0.0, 1.0]";
    v37 = 0xD000000000000035;
    goto LABEL_11;
  }
  if (a10 < 0.0 || a10 > 1.0)
  {
    sub_222C23F24();
    swift_allocError();
    v37 = 0xD00000000000002FLL;
    v43 = "ata field to Equatable";
    goto LABEL_12;
  }
  v77 = v34;
  v79 = v33;
  v80 = (uint64_t)&v76 - v32;
  v38 = *(_QWORD *)(a1 + 16);
  if (v38)
  {
    v39 = (uint64_t *)(a1 + 32 * v38);
    v40 = v39[1];
    v81 = *v39;
    v82 = v40;
    v41 = v39[2];
    v42 = v39[3];
    swift_unknownObjectRetain();
  }
  else
  {
    v41 = 0;
    v81 = MEMORY[0x24BEE4AF8];
    v82 = MEMORY[0x24BEE4AF8] + 32;
    v42 = 1;
  }
  v78 = v41;
  v45 = sub_222C38278((uint64_t)v29, (uint64_t)v26, v31, v82, v41, v42, a4, a5);
  if (v11)
    return swift_unknownObjectRelease();
  v76 = v45;
  sub_222C388AC((uint64_t)v29, v80, &qword_2557717E8);
  sub_222C388AC((uint64_t)v26, v79, &qword_2557717E8);
  v86 = 1;
  v46 = v85;
  swift_bridgeObjectRetain();
  v48 = sub_222C38624(v82, v78, v42, v84, v46);
  swift_bridgeObjectRelease();
  v49 = sub_222C2F834(v48);
  v50 = swift_bridgeObjectRelease();
  if (!v49)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v54 = 0xD000000000000026;
    *(_QWORD *)(v54 + 8) = 0x8000000222C3A620;
    *(_BYTE *)(v54 + 16) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_222C38854(v79);
    v47 = v80;
    return sub_222C38854(v47);
  }
  MEMORY[0x24BDAC7A8](v50);
  *(&v76 - 2) = (uint64_t)&v86;
  v51 = *(_QWORD *)(sub_222C384B0((uint64_t)sub_222C38894, (uint64_t)(&v76 - 4), v49) + 16);
  swift_bridgeObjectRelease();
  if ((a7 & 1) == 0)
  {
    v52 = v76;
    if (v76 >= a6)
      goto LABEL_20;
LABEL_23:
    v55 = (int *)type metadata accessor for BinomialTestResult(0);
    v56 = v83;
    v57 = v80;
    sub_222C282D8(v80, (uint64_t)&v83[v55[12]]);
    v58 = v79;
    sub_222C282D8(v79, (uint64_t)&v56[v55[13]]);
    strcpy(v56, "BinomialTest");
    v56[13] = 0;
    *((_WORD *)v56 + 7) = -5120;
    v56[17] = 1;
    *(_QWORD *)&v56[v55[10]] = v52;
    *(_QWORD *)&v56[v55[11]] = v51;
    v59 = &v56[v55[7]];
    v60 = sub_222C38968();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v59, 1, 1, v60);
    swift_unknownObjectRelease();
    v56[16] = 0;
    v61 = &v56[v55[8]];
    *(_QWORD *)v61 = 0;
    v61[8] = 1;
    v62 = &v56[v55[9]];
LABEL_27:
    *v62 = 2;
    sub_222C38854(v58);
    v47 = v57;
    return sub_222C38854(v47);
  }
  v52 = v76;
  if (v76 < 1)
    goto LABEL_23;
LABEL_20:
  sub_222C25EAC(v52, v51, 0, a10);
  v63 = v53;
  sub_222C282D8(v80, (uint64_t)v23);
  v64 = sub_222C38968();
  v65 = *(_QWORD *)(v64 - 8);
  v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v65 + 48);
  result = v66(v23, 1, v64);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v67 = v77;
    sub_222C282D8(v79, v77);
    result = v66((char *)v67, 1, v64);
    if ((_DWORD)result != 1)
    {
      v68 = v83;
      *(_QWORD *)v83 = 0x6C61696D6F6E6942;
      v68[1] = 0xEC00000074736554;
      v69 = (int *)type metadata accessor for BinomialTestResult(0);
      v70 = (double *)((char *)v68 + v69[8]);
      *v70 = v63;
      *((_BYTE *)v70 + 8) = 0;
      *((_BYTE *)v68 + v69[9]) = v63 < a9;
      *(_QWORD *)((char *)v68 + v69[10]) = v76;
      *(_QWORD *)((char *)v68 + v69[11]) = v51;
      v71 = (char *)v68 + v69[12];
      v72 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
      v72(v71, v23, v64);
      v73 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v65 + 56);
      v73(v71, 0, 1, v64);
      v74 = (char *)v68 + v69[13];
      (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v74, v67, v64);
      v73(v74, 0, 1, v64);
      v75 = (char *)v68 + v69[7];
      v72(v75, (char *)v67, v64);
      v73(v75, 0, 1, v64);
      swift_unknownObjectRelease();
      *((_BYTE *)v68 + 16) = 1;
      v62 = (char *)v68 + 17;
      v58 = v79;
      v57 = v80;
      goto LABEL_27;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_222C36F20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, char a7@<W7>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t result;
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
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  int *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;

  v10 = v9;
  v123 = a4;
  v124 = a5;
  v121 = a2;
  v122 = a3;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8]((char *)&v104 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = (char *)&v104 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v104 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v104 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v104 - v32;
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&v104 - v35;
  v37 = MEMORY[0x24BDAC7A8](v34);
  v38 = MEMORY[0x24BDAC7A8](v37);
  if ((a7 & 1) == 0 && a6 <= 0)
  {
    sub_222C23F24();
    swift_allocError();
    v46 = "minimumSampleSize should be in range (0, Int.max)";
    v47 = 0xD000000000000031;
LABEL_10:
    *(_QWORD *)v45 = v47;
    *(_QWORD *)(v45 + 8) = (unint64_t)(v46 - 32) | 0x8000000000000000;
    *(_BYTE *)(v45 + 16) = 0;
    return swift_willThrow();
  }
  if (a9 < 0.0 || a9 > 1.0)
  {
    sub_222C23F24();
    swift_allocError();
    v46 = "significanceLevel was not within the range [0.0, 1.0]";
    v47 = 0xD000000000000035;
    goto LABEL_10;
  }
  v112 = v43;
  v113 = a6;
  v107 = v40;
  v108 = v39;
  v106 = v38;
  v109 = v20;
  v110 = a8;
  v111 = v44;
  v114 = v42;
  v115 = (uint64_t)&v104 - v41;
  v48 = *(_QWORD *)(a1 + 16);
  v49 = MEMORY[0x24BEE4AF8];
  v50 = MEMORY[0x24BEE4AF8] + 32;
  if (v48)
  {
    v51 = a1 + 32 + 32 * v48;
    v52 = *(_QWORD *)(a1 + 32 * v48);
    v53 = *(_QWORD *)(v51 - 24);
    v119 = *(_QWORD *)(v51 - 16);
    v120 = v53;
    v54 = *(_QWORD *)(v51 - 8);
    v117 = v52;
    v118 = v54;
    swift_unknownObjectRetain();
    if (v48 == 1)
    {
      v55 = 0;
      v49 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v50 = *(_QWORD *)(v51 - 56);
      v55 = *(_QWORD *)(v51 - 48);
      v48 = *(_QWORD *)(v51 - 40);
      v49 = *(_QWORD *)(v51 - 64);
      swift_unknownObjectRetain();
    }
    v58 = v118;
    v57 = v119;
    v59 = v120;
  }
  else
  {
    v57 = 0;
    v55 = 0;
    v58 = 1;
    v59 = MEMORY[0x24BEE4AF8] + 32;
    v117 = MEMORY[0x24BEE4AF8];
    v48 = 1;
  }
  v118 = v58;
  v119 = v57;
  v120 = v59;
  if ((a7 & 1) != 0)
  {
    v116 = v49;
  }
  else
  {
    v116 = sub_222C38458(v113, v49, v50, v55, v48);
    v50 = v60;
    v55 = v40;
    v48 = v61;
  }
  v62 = sub_222C38278((uint64_t)v36, (uint64_t)v33, v40, v50, v55, v48, v123, v124);
  if (v10)
  {
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  v105 = v62;
  sub_222C388AC((uint64_t)v36, v115, &qword_2557717E8);
  sub_222C388AC((uint64_t)v33, v114, &qword_2557717E8);
  v125 = 1;
  v63 = v122;
  swift_bridgeObjectRetain();
  v64 = v55;
  v65 = v121;
  v67 = sub_222C38624(v50, v64, v48, v121, v63);
  swift_bridgeObjectRelease();
  v68 = sub_222C2F834(v67);
  v69 = swift_bridgeObjectRelease();
  if (!v68)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v73 = 0xD000000000000026;
    *(_QWORD *)(v73 + 8) = 0x8000000222C3A620;
    *(_BYTE *)(v73 + 16) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v66 = v115;
    sub_222C38854(v114);
    return sub_222C38854(v66);
  }
  MEMORY[0x24BDAC7A8](v69);
  v103 = &v125;
  v104 = *(_QWORD *)(sub_222C384B0((uint64_t)sub_222C388F0, (uint64_t)(&v104 - 4), v68) + 16);
  swift_bridgeObjectRelease();
  v70 = v119;
  v71 = v118;
  v124 = sub_222C38278((uint64_t)v28, (uint64_t)v25, v72, v120, v119, v118, v123, v124);
  sub_222C388AC((uint64_t)v28, v112, &qword_2557717E8);
  sub_222C388AC((uint64_t)v25, v111, &qword_2557717E8);
  v125 = 1;
  swift_bridgeObjectRetain();
  v75 = sub_222C38624(v120, v70, v71, v65, v63);
  swift_bridgeObjectRelease();
  v76 = sub_222C2F834(v75);
  v77 = swift_bridgeObjectRelease();
  v78 = v115;
  if (!v76)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v82 = 0xD000000000000026;
    *(_QWORD *)(v82 + 8) = 0x8000000222C3A620;
    *(_BYTE *)(v82 + 16) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    sub_222C38854(v111);
    sub_222C38854(v112);
    v74 = v114;
LABEL_38:
    sub_222C38854(v74);
    return sub_222C38854(v78);
  }
  MEMORY[0x24BDAC7A8](v77);
  v103 = &v125;
  v79 = *(_QWORD *)(sub_222C384B0((uint64_t)sub_222C388F0, (uint64_t)(&v104 - 4), v76) + 16);
  swift_bridgeObjectRelease();
  if ((a7 & 1) != 0)
  {
    v80 = v124;
    v81 = v105;
    if (v124 < 1 || v105 < 1)
    {
LABEL_31:
      v85 = (int *)type metadata accessor for ZTestResult(0);
      v86 = v110;
      sub_222C282D8(v78, v110 + v85[12]);
      v87 = v114;
      sub_222C282D8(v114, v86 + v85[13]);
      v88 = v112;
      sub_222C282D8(v112, v86 + v85[16]);
      v89 = v111;
      sub_222C282D8(v111, v86 + v85[17]);
      *(_QWORD *)v86 = 0x747365545ALL;
      *(_QWORD *)(v86 + 8) = 0xE500000000000000;
      *(_BYTE *)(v86 + 17) = 1;
      *(_QWORD *)(v86 + v85[10]) = v105;
      *(_QWORD *)(v86 + v85[11]) = v104;
      *(_QWORD *)(v86 + v85[14]) = v80;
      *(_QWORD *)(v86 + v85[15]) = v79;
      v90 = v86 + v85[7];
      v91 = sub_222C38968();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 56))(v90, 1, 1, v91);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *(_BYTE *)(v86 + 16) = 0;
      v92 = v86 + v85[8];
      *(_QWORD *)v92 = 0;
      *(_BYTE *)(v92 + 8) = 1;
      v93 = v89;
      v94 = v88;
      *(_BYTE *)(v86 + v85[9]) = 2;
LABEL_37:
      sub_222C38854(v93);
      sub_222C38854(v94);
      v74 = v87;
      goto LABEL_38;
    }
  }
  else
  {
    v80 = v124;
    v81 = v105;
    if (v124 < v113 || v105 < v113)
      goto LABEL_31;
  }
  sub_222C32F98(v104, v81, v79, v80, 1, 0, 0, a9);
  v95 = v83;
  v96 = v84;
  v97 = v107;
  sub_222C282D8(v78, v107);
  v98 = sub_222C38968();
  v99 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v98 - 8) + 48);
  result = v99(v97, 1, v98);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_40;
  }
  v100 = v108;
  sub_222C282D8(v114, v108);
  result = v99(v100, 1, v98);
  if ((_DWORD)result == 1)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v101 = (uint64_t)v109;
  sub_222C282D8(v112, (uint64_t)v109);
  result = v99(v101, 1, v98);
  if ((_DWORD)result == 1)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v102 = v106;
  sub_222C282D8(v111, v106);
  result = v99(v102, 1, v98);
  if ((_DWORD)result != 1)
  {
    sub_222C28F6C(fabs(v96) < fabs(v95), v105, v104, v107, v108, v124, v79, (uint64_t)v109, v110, v95, v102);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v87 = v114;
    v93 = v111;
    v94 = v112;
    goto LABEL_37;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_222C379AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W6>, uint64_t a7@<X8>)
{
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
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
  uint64_t result;
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
  BOOL v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;

  v110 = a4;
  v107 = a2;
  v108 = a3;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = MEMORY[0x24BDAC7A8]((char *)&v87 - v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v87 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v87 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v29 = MEMORY[0x24BDAC7A8](v28);
  if ((a6 & 1) == 0 && v32 <= 0)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v39 = 0xD000000000000034;
    *(_QWORD *)(v39 + 8) = 0x8000000222C3A770;
    *(_BYTE *)(v39 + 16) = 0;
    return swift_willThrow();
  }
  v100 = v34;
  v101 = v33;
  v94 = v29;
  v95 = v32;
  v92 = v31;
  v93 = v30;
  v91 = v14;
  v96 = a7;
  v98 = v38;
  v99 = v37;
  v104 = v36;
  v105 = (uint64_t)&v87 - v35;
  v41 = *(_QWORD *)(a1 + 16);
  v42 = MEMORY[0x24BEE4AF8] + 32;
  v109 = MEMORY[0x24BEE4AF8];
  v97 = a6;
  v106 = MEMORY[0x24BEE4AF8] + 32;
  if (!v41)
  {
    v45 = 0;
    v102 = 0;
    v46 = 1;
    v44 = MEMORY[0x24BEE4AF8];
    goto LABEL_8;
  }
  v43 = a1 + 32 + 32 * v41;
  v44 = *(_QWORD *)(a1 + 32 * v41);
  v42 = *(_QWORD *)(v43 - 24);
  v45 = *(_QWORD *)(v43 - 16);
  v46 = *(_QWORD *)(v43 - 8);
  swift_unknownObjectRetain();
  if (v41 == 1)
  {
    v102 = 0;
LABEL_8:
    v103 = 1;
    goto LABEL_10;
  }
  v47 = *(_QWORD *)(v43 - 64);
  v106 = *(_QWORD *)(v43 - 56);
  v48 = *(_QWORD *)(v43 - 40);
  v102 = *(_QWORD *)(v43 - 48);
  v103 = v48;
  v109 = v47;
  swift_unknownObjectRetain();
LABEL_10:
  v49 = v110;
  v50 = v111;
  v51 = sub_222C38278((uint64_t)v27, (uint64_t)v24, v31, v42, v45, v46, v110, a5);
  if (v50)
  {
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  v88 = v42;
  v89 = v46;
  v90 = v45;
  v110 = v51;
  v111 = v44;
  sub_222C388AC((uint64_t)v27, v105, &qword_2557717E8);
  sub_222C388AC((uint64_t)v24, v104, &qword_2557717E8);
  v52 = v100;
  v53 = v101;
  v54 = v102;
  v56 = sub_222C38278(v100, v101, v55, v106, v102, v103, v49, a5);
  sub_222C388AC(v52, v99, &qword_2557717E8);
  sub_222C388AC(v53, v98, &qword_2557717E8);
  if ((v97 & 1) != 0)
  {
    v57 = v110;
    v58 = v110 < 1 || v56 < 1;
    v59 = v103;
    if (!v58)
      goto LABEL_17;
LABEL_23:
    v63 = (int *)type metadata accessor for KSTestTwoSampleResult(0);
    v64 = v96;
    v65 = v99;
    sub_222C282D8(v99, v96 + v63[10]);
    v66 = v98;
    sub_222C282D8(v98, v64 + v63[11]);
    v67 = v105;
    sub_222C282D8(v105, v64 + v63[13]);
    v68 = v104;
    sub_222C282D8(v104, v64 + v63[14]);
    *(_QWORD *)v64 = 0x775474736554534BLL;
    *(_QWORD *)(v64 + 8) = 0xEF656C706D61536FLL;
    *(_BYTE *)(v64 + 17) = 1;
    *(_QWORD *)(v64 + v63[9]) = v56;
    *(_QWORD *)(v64 + v63[12]) = v57;
    v69 = v64 + v63[7];
    v70 = sub_222C38968();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 56))(v69, 1, 1, v70);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v71 = v66;
    *(_BYTE *)(v64 + 16) = 0;
    v72 = v64 + v63[8];
    *(_QWORD *)v72 = 0;
    *(_BYTE *)(v72 + 8) = 1;
LABEL_24:
    sub_222C38854(v71);
    sub_222C38854(v65);
    sub_222C38854(v68);
    v73 = v67;
    return sub_222C38854(v73);
  }
  v57 = v110;
  v62 = v110 < v95 || v56 < v95;
  v59 = v103;
  if (v62)
    goto LABEL_23;
LABEL_17:
  v60 = v108;
  swift_bridgeObjectRetain();
  v61 = v107;
  v74 = sub_222C38624(v88, v90, v89, v107, v60);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v75 = sub_222C38624(v106, v54, v59, v61, v60);
  swift_bridgeObjectRelease();
  v76 = sub_222C2F978(v74);
  swift_bridgeObjectRelease();
  if (!v76 || (v77 = sub_222C2F978(v75), swift_bridgeObjectRelease(), !v77))
  {
    swift_bridgeObjectRelease();
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v79 = 0xD00000000000001DLL;
    *(_QWORD *)(v79 + 8) = 0x8000000222C3A750;
    *(_BYTE *)(v79 + 16) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    sub_222C38854(v98);
    sub_222C38854(v99);
    sub_222C38854(v104);
    v73 = v105;
    return sub_222C38854(v73);
  }
  sub_222C35CB4(v77, v76, 0);
  v80 = v78;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v81 = v92;
  sub_222C282D8(v99, v92);
  v82 = sub_222C38968();
  v83 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v82 - 8) + 48);
  result = v83(v81, 1, v82);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_36;
  }
  v84 = v93;
  sub_222C282D8(v98, v93);
  result = v83(v84, 1, v82);
  if ((_DWORD)result == 1)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v85 = v94;
  sub_222C282D8(v105, v94);
  result = v83(v85, 1, v82);
  if ((_DWORD)result == 1)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v86 = (uint64_t)v91;
  sub_222C282D8(v104, (uint64_t)v91);
  result = v83(v86, 1, v82);
  if ((_DWORD)result != 1)
  {
    sub_222C29168(v56, v92, v93, v110, v94, v86, v96, v80);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v68 = v104;
    v67 = v105;
    v71 = v98;
    v65 = v99;
    goto LABEL_24;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_222C38278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v28)(uint64_t, unint64_t, uint64_t);

  swift_bridgeObjectRetain();
  v16 = sub_222C38624(a4, a5, a6, a7, a8);
  swift_bridgeObjectRelease();
  if (v8)
    return a5;
  v17 = sub_222C2F5E4(v16);
  result = swift_bridgeObjectRelease();
  if (!v17)
  {
    sub_222C23F24();
    swift_allocError();
    *(_QWORD *)v26 = 0xD000000000000021;
    *(_QWORD *)(v26 + 8) = 0x8000000222C3A720;
    *(_BYTE *)(v26 + 16) = 1;
    swift_willThrow();
    return a5;
  }
  v19 = __OFSUB__(a6 >> 1, a5);
  a5 = (a6 >> 1) - a5;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    v20 = *(_QWORD *)(v17 + 16);
    v21 = sub_222C38968();
    v22 = *(_QWORD *)(v21 - 8);
    if (!v20)
    {
      v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
      v27(a1, 1, 1, v21);
      v27(a2, 1, 1, v21);
      goto LABEL_9;
    }
    v23 = v17 + ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80));
    v28 = *(void (**)(uint64_t, unint64_t, uint64_t))(v22 + 16);
    v28(a1, v23, v21);
    v24 = a1;
    v25 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v22 + 56);
    result = v25(v24, 0, 1, v21);
    if (v20 <= *(_QWORD *)(v17 + 16))
    {
      v28(a2, v23 + *(_QWORD *)(v22 + 72) * (v20 - 1), v21);
      v25(a2, 0, 1, v21);
LABEL_9:
      swift_bridgeObjectRelease();
      return a5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_222C38458(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int64_t v5;
  uint64_t v6;
  uint64_t v8;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  v5 = a5 >> 1;
  v6 = a4 - (a5 >> 1);
  if (__OFSUB__(a4, a5 >> 1))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v6 > -result && v6 < 1)
    v8 = a4;
  else
    v8 = v5 - result;
  if (v5 < v8)
    goto LABEL_14;
  if (v8 >= a4)
    return a2;
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_222C384B0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(uint64_t *);
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t *);
  uint64_t v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a3 + 16);
  if (v5)
  {
    v6 = (uint64_t (*)(uint64_t *))result;
    v7 = 0;
    v8 = MEMORY[0x24BEE4AF8];
    v12 = (uint64_t (*)(uint64_t *))result;
    while (v7 < *(_QWORD *)(a3 + 16))
    {
      v11 = *(_QWORD *)(a3 + 8 * v7 + 32);
      v13 = v11;
      result = v6(&v13);
      if (v3)
      {
        swift_release();
        goto LABEL_14;
      }
      if ((result & 1) != 0)
      {
        result = swift_isUniquelyReferenced_nonNull_native();
        v14 = v8;
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_222C32344(0, *(_QWORD *)(v8 + 16) + 1, 1);
          v8 = v14;
        }
        v10 = *(_QWORD *)(v8 + 16);
        v9 = *(_QWORD *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          result = (uint64_t)sub_222C32344((char *)(v9 > 1), v10 + 1, 1);
          v8 = v14;
        }
        *(_QWORD *)(v8 + 16) = v10 + 1;
        *(_QWORD *)(v8 + 8 * v10 + 32) = v11;
        v6 = v12;
      }
      if (v5 == ++v7)
        goto LABEL_14;
    }
    __break(1u);
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
LABEL_14:
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x22767B150);
  return result;
}

uint64_t sub_222C38624(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v22 = a3 >> 1;
  v5 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v6 = MEMORY[0x24BEE4AF8];
  if (!v5)
    return v6;
  v9 = result;
  v26 = MEMORY[0x24BEE4AF8];
  result = (uint64_t)sub_222C3230C(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v10 = 0;
    v6 = v26;
    v21 = v9 + 8 * a2;
    while (1)
    {
      v11 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
      if (a2 + v10 >= v22 || v10 >= v5)
        goto LABEL_23;
      v12 = *(_QWORD *)(v21 + 8 * v10);
      v13 = *(_QWORD *)(v12 + 16);
      swift_bridgeObjectRetain();
      if (!v13
        || (swift_bridgeObjectRetain(), sub_222C2584C(a4, a5), v15 = v14, swift_bridgeObjectRelease(), (v15 & 1) == 0))
      {
        sub_222C23F24();
        swift_allocError();
        *(_QWORD *)v20 = 0xD000000000000017;
        *(_QWORD *)(v20 + 8) = 0x8000000222C3A700;
        *(_BYTE *)(v20 + 16) = 1;
        swift_willThrow();
        swift_release();
        swift_bridgeObjectRelease();
        return v6;
      }
      if (*(_QWORD *)(v12 + 16))
      {
        swift_bridgeObjectRetain();
        v16 = sub_222C2584C(a4, a5);
        if ((v17 & 1) != 0)
        {
          sub_222C23EA8(*(_QWORD *)(v12 + 56) + 32 * v16, (uint64_t)&v24);
        }
        else
        {
          v24 = 0u;
          v25 = 0u;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        v24 = 0u;
        v25 = 0u;
      }
      swift_bridgeObjectRelease();
      v26 = v6;
      v19 = *(_QWORD *)(v6 + 16);
      v18 = *(_QWORD *)(v6 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_222C3230C((_QWORD *)(v18 > 1), v19 + 1, 1);
        v6 = v26;
      }
      *(_QWORD *)(v6 + 16) = v19 + 1;
      result = sub_222C388AC((uint64_t)&v24, v6 + 32 * v19 + 32, &qword_255771700);
      ++v10;
      if (v11 == v5)
        return v6;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_222C38854(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557717E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_222C38894(_QWORD *a1)
{
  uint64_t v1;

  return *a1 == **(_QWORD **)(v1 + 16);
}

uint64_t sub_222C388AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

BOOL sub_222C388F0(_QWORD *a1)
{
  return sub_222C38894(a1);
}

uint64_t sub_222C38908()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_222C38914()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_222C38920()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_222C3892C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_222C38938()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_222C38944()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_222C38950()
{
  return MEMORY[0x24BDCE868]();
}

uint64_t sub_222C3895C()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_222C38968()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_222C38974()
{
  return MEMORY[0x24BEE5BB0]();
}

uint64_t sub_222C38980()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_222C3898C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_222C38998()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_222C389A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_222C389B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_222C389BC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_222C389C8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_222C389D4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_222C389E0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_222C389EC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_222C389F8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_222C38A04()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_222C38A10()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_222C38A1C()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_222C38A28()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_222C38A34()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_222C38A40()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_222C38A4C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_222C38A58()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_222C38A64()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_222C38A70()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_222C38A7C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_222C38A88()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_222C38A94()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_222C38AA0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_222C38AAC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_222C38AB8()
{
  return MEMORY[0x24BEE2BA8]();
}

uint64_t sub_222C38AC4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_222C38AD0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_222C38ADC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_222C38AE8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_222C38AF4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_222C38B00()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_222C38B0C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_222C38B18()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_222C38B24()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_222C38B30()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_222C38B3C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_222C38B48()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_222C38B54()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_222C38B60()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_222C38B6C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_222C38B78()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_222C38B84()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_222C38B90()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_222C38B9C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_222C38BA8()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_222C38BB4()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_222C38BC0()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

